from datetime import datetime, timezone
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, update
from pydantic import BaseModel
from motor.motor_asyncio import AsyncIOMotorDatabase

from app.config.database import get_db, get_mongo
from app.config.security import verify_credentials
from app.models.sql.receta import RecetaMedica, DetalleReceta
from app.models.sql.medicamento import Medicamento
from app.models.sql.inventario import InventarioMedicamento
from app.utils.fifo import aplicar_fifo

router = APIRouter(prefix="/api/dispensacion", tags=["Dispensación"])

class DispensacionRequest(BaseModel):
    id_receta: int

    model_config = {
        "json_schema_extra": {
            "examples": [{"id_receta": 1}]
        }
    }

@router.post(
    "/",
    summary="Dispensar una receta médica",
    description=(
        "Procesa una receta médica desde MySQL, aplica lógica FIFO en los lotes "
        "de medicamentos y guarda el ticket de dispensación como documento atómico en MongoDB."
    )
)
async def dispensar_receta(
    body: DispensacionRequest,
    db: AsyncSession = Depends(get_db),
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    id_receta = body.id_receta

    # 1. Verificar que la receta existe en MySQL
    result = await db.execute(select(RecetaMedica).where(RecetaMedica.Id == id_receta))
    receta = result.scalar_one_or_none()
    if not receta:
        raise HTTPException(status_code=404, detail="Receta no encontrada")

    # 2. Verificar duplicado en MongoDB
    existente = await mongo["dispensaciones"].find_one({"id_receta": id_receta})
    if existente:
        raise HTTPException(
            status_code=400, 
            detail=f"La receta #{id_receta} ya fue surtida el {existente.get('fecha')}. No se puede duplicar."
        )

    # 3. Obtener detalle de receta con nombre del medicamento
    result = await db.execute(
        select(DetalleReceta, Medicamento)
        .join(Medicamento, DetalleReceta.Medicamento_Id == Medicamento.Id)
        .where(DetalleReceta.Receta_Id == id_receta)
    )
    detalles = result.all()

    if not detalles:
        raise HTTPException(status_code=404, detail="La receta no tiene medicamentos")

    dispensados = []
    faltantes = []
    para_kardex = []

    # 4. Procesar cada medicamento con FIFO
    for detalle, med in detalles:
        fifo = await aplicar_fifo(db, detalle.Medicamento_Id, detalle.Cantidad)

        if not fifo["success"]:
            faltantes.append({
                "id_medicamento": detalle.Medicamento_Id,
                "nombre_medicamento": med.Nombre,
                "cantidad_pendiente": detalle.Cantidad,
                "motivo": "Sin existencias",
                "concentracion": med.Concentracion,
                "forma_farmaceutica": med.Forma_Farmaceutica
            })
            continue

        dispensados.append({
            "id_medicamento": detalle.Medicamento_Id,
            "nombre_medicamento": med.Nombre,
            "cantidad_surtida": fifo["descontado"],
            "lotes_usados": fifo["lotes_usados"],
            "concentracion": med.Concentracion,
            "forma_farmaceutica": med.Forma_Farmaceutica
        })

        if fifo["surtido_parcial"]:
            faltantes.append({
                "id_medicamento": detalle.Medicamento_Id,
                "nombre_medicamento": med.Nombre,
                "cantidad_pendiente": fifo["pendiente"],
                "motivo": "Stock insuficiente en lotes",
                "concentracion": med.Concentracion,
                "forma_farmaceutica": med.Forma_Farmaceutica
            })

        # Actualizar inventario general SOLO si existe el registro
        inv_res = await db.execute(
            select(InventarioMedicamento).where(InventarioMedicamento.Medicamento_Id == detalle.Medicamento_Id)
        )
        inv = inv_res.scalar_one_or_none()
        nueva_cantidad_sql = max(0, (inv.Cantidad or 0) - fifo["descontado"])
        if inv:
            await db.execute(
                update(InventarioMedicamento)
                .where(InventarioMedicamento.Medicamento_Id == detalle.Medicamento_Id)
                .values(
                    Cantidad=nueva_cantidad_sql,
                    Fecha_Movimiento=datetime.now(timezone.utc),
                    Motivo="DISPENSACION"
                )
            )

        para_kardex.append({
            "id_medicamento": detalle.Medicamento_Id,
            "nombre": med.Nombre,
            "cantidad": fifo["descontado"],
            "stock_restante": nueva_cantidad_sql, # Sync source
            "concentracion": med.Concentracion,
            "forma_farmaceutica": med.Forma_Farmaceutica
        })

    if not dispensados:
        raise HTTPException(
            status_code=400, 
            detail="Sin existencias de ningún medicamento en farmacia interna. Por favor, proceda a generar una SUBROGACIÓN para esta receta."
        )

    # 4.5 Actualizar estado de la receta en MySQL
    nuevo_estado = "Surtida Parcial" if faltantes else "Surtida"
    await db.execute(
        update(RecetaMedica)
        .where(RecetaMedica.Id == id_receta)
        .values(Estado_Receta=nuevo_estado, Estatus=1) # Estatus=1 (Activo/Procesado)
    )
    await db.commit()

    # 5. Guardar ticket en MongoDB
    ticket = {
        "id_receta": id_receta,
        "id_paciente": receta.Paciente_Id,
        "fecha": datetime.now(timezone.utc),
        "status_final": nuevo_estado,
        "dispensados": dispensados,
        "faltantes": faltantes
    }
    resultado = await mongo["dispensaciones"].insert_one(ticket)

    # 6. Registrar en inventario_medicamento (MongoDB - Kardex centralizado)
    for k in para_kardex:
        await mongo["inventario_medicamento"].update_one(
            {"id_medicamento": k["id_medicamento"]},
            {
                "$set": {
                    "nombre": k["nombre"],
                    "concentracion": k["concentracion"],
                    "forma_farmaceutica": k["forma_farmaceutica"],
                    "stock_actual": k["stock_restante"] # Forzar sincronía absoluta con SQL
                },
                "$push": {
                    "movimientos": {
                        "tipo": "SALIDA",
                        "fecha": datetime.now(timezone.utc),
                        "cantidad": k["cantidad"],
                        "referencia": f"RECETA-{id_receta}",
                        "motivo": "DISPENSACION"
                    }
                }
            },
            upsert=True
        )

    return {
        "status": "success",
        "id_dispensacion_mongo": str(resultado.inserted_id),
        "dispensados": dispensados,
        "faltantes": faltantes
    }
