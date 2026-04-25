from datetime import datetime, timezone
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from pydantic import BaseModel
from motor.motor_asyncio import AsyncIOMotorDatabase
from typing import Optional

from app.config.database import get_db, get_mongo
from app.config.security import verify_credentials
from app.models.sql.receta import RecetaMedica, DetalleReceta
from app.models.sql.inventario import InventarioMedicamento
from app.models.sql.medicamento import Medicamento

router = APIRouter(prefix="/api/subrogaciones", tags=["Subrogaciones"])

class SubrogacionRequest(BaseModel):
    id_receta: int
    paciente_nombre: str
    diagnostico: str
    medico_nombre: str
    especialidad: str
    motivo_subrogacion: str # Por ejemplo: "Falta de stock", "Urgencia médica", etc.
    costo_estimado: float = 0.0

    model_config = {
        "json_schema_extra": {
            "examples": [{
                "id_receta": 1,
                "paciente_nombre": "Juan Perez",
                "diagnostico": "Hipertensión Arterial",
                "medico_nombre": "Dr. House",
                "especialidad": "Medicina Interna",
                "motivo_subrogacion": "Falta de stock",
                "costo_estimado": 450.50
            }]
        }
    }

@router.post(
    "/",
    summary="Crear subrogación por falta de stock",
    description="Autoriza la obtención externa de medicamentos que no tienen suficiente stock en la farmacia interna."
)
async def crear_subrogacion(
    body: SubrogacionRequest,
    db: AsyncSession = Depends(get_db),
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    id_receta = body.id_receta

    # 1. Verificar receta
    result = await db.execute(select(RecetaMedica).where(RecetaMedica.Id == id_receta))
    receta = result.scalar_one_or_none()
    if not receta:
        raise HTTPException(status_code=404, detail="Receta no encontrada")

    # 2. Obtener detalles
    result = await db.execute(
        select(DetalleReceta, Medicamento)
        .join(Medicamento, DetalleReceta.Medicamento_Id == Medicamento.Id)
        .where(DetalleReceta.Receta_Id == id_receta)
    )
    detalles = result.all()

    # 3. Verificar si hubo surtido parcial previo en MongoDB
    dispensacion_previa = await mongo["dispensaciones"].find_one({"id_receta": id_receta})
    surtidos_dict = {}
    if dispensacion_previa:
        for surtido in dispensacion_previa.get("dispensados", []):
            surtidos_dict[surtido["id_medicamento"]] = surtido["cantidad_surtida"]

    subrogados = []
    for detalle, med in detalles:
        # Calcular cantidad pendiente
        cantidad_surtida = surtidos_dict.get(detalle.Medicamento_Id, 0)
        cantidad_pendiente = detalle.Cantidad - cantidad_surtida

        if cantidad_pendiente <= 0:
            continue

        inv_result = await db.execute(
            select(InventarioMedicamento)
            .where(InventarioMedicamento.Medicamento_Id == detalle.Medicamento_Id)
        )
        inv = inv_result.scalar_one_or_none()

        # Solo saltar si el motivo es "Falta de stock" y hay suficiente stock.
        # Para otros motivos (Urgencia, Especialidad, etc.), permitimos subrogar aunque haya stock.
        if body.motivo_subrogacion == "Falta de stock":
            if inv and inv.Cantidad >= cantidad_pendiente:
                continue

        subrogados.append({
            "id_medicamento": detalle.Medicamento_Id,
            "nombre": med.Nombre,
            "cantidad": cantidad_pendiente,
            "dosis": detalle.Dosis or "No especificada",
            "costo": body.costo_estimado,
            "concentracion": med.Concentracion,
            "forma_farmaceutica": med.Forma_Farmaceutica
        })

        # Registro de Movimiento en inventario_medicamento (Kardex centralizado)
        await mongo["inventario_medicamento"].update_one(
            {"id_medicamento": detalle.Medicamento_Id},
            {
                "$set": {
                    "nombre": med.Nombre,
                    "concentracion": med.Concentracion,
                    "forma_farmaceutica": med.Forma_Farmaceutica
                },
                "$setOnInsert": {"stock_actual": 0},
                "$push": {
                    "movimientos": {
                        "tipo": "SALIDA",
                        "fecha": datetime.now(timezone.utc),
                        "cantidad": cantidad_pendiente,
                        "referencia": f"SUB-{id_receta}",
                        "motivo": "SUBROGACION"
                    }
                }
            },
            upsert=True
        )

    if not subrogados:
        return {"status": "ok", "message": "Todos los medicamentos están disponibles en farmacia interna. No es necesaria la subrogación."}

    # 3. Guardar documento de subrogación - Colección "subrogacion_medicamentos"
    subrogacion_doc = {
        "folio_subrogacion": f"SUB-{int(datetime.now(timezone.utc).timestamp())}",
        "fecha_solicitud": datetime.now(timezone.utc),
        "estatus": "Pendiente",
        "motivo_subrogacion": body.motivo_subrogacion,
        "receta": {
            "id_receta": id_receta,
            "folio": f"REC-{id_receta}"
        },
        "paciente": {
            "id_paciente": receta.Paciente_Id,
            "nombre": body.paciente_nombre,
            "diagnostico": body.diagnostico
        },
        "medico": {
            "nombre": body.medico_nombre,
            "especialidad": body.especialidad
        },
        "medicamentos": subrogados
    }
    resultado = await mongo["subrogacion_medicamentos"].insert_one(subrogacion_doc)

    # 4. Actualizar estado de la receta en MySQL para que no quede como "Parcial"
    from sqlalchemy import update
    await db.execute(
        update(RecetaMedica)
        .where(RecetaMedica.Id == id_receta)
        .values(Estado_Receta="Surtida")
    )
    await db.commit()

    return {
        "status": "success",
        "message": "Subrogación generada exitosamente. El paciente puede acudir a una farmacia externa.",
        "id_subrogacion_mongo": str(resultado.inserted_id),
        "medicamentos_subrogados": subrogados
    }
