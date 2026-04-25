from datetime import datetime, date, timezone
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, update, insert
from sqlalchemy.dialects.mysql import insert as mysql_insert
from pydantic import BaseModel
from motor.motor_asyncio import AsyncIOMotorDatabase
from typing import Optional, List

from app.config.database import get_db, get_mongo
from app.config.security import verify_credentials
from app.models.sql.lote import Lote
from app.models.sql.medicamento import Medicamento
from app.models.sql.inventario import InventarioMedicamento

router = APIRouter(prefix="/api/compras", tags=["Compras"])

class CompraRequest(BaseModel):
    id_medicamento: int
    cantidad: int
    numero_lote: str
    fecha_caducidad: Optional[str] = "2028-01-01"
    # Datos del inventario (Opcionales en Request, pero el sistema pondrá defaults)
    marca: Optional[str] = "Genérico"
    empresa: Optional[str] = "Sin especificar"
    farmaceutica: Optional[str] = "Sin especificar"
    presentacion: Optional[str] = "Sin especificar"
    efectos_secundarios: Optional[str] = "Ninguno"
    restricciones: Optional[str] = "Ninguna"

    model_config = {
        "json_schema_extra": {
            "examples": [{
                "id_medicamento": 1,
                "cantidad": 50,
                "numero_lote": "LOT-2025-001",
                "fecha_caducidad": "2028-06-01",
                "marca": "Laboratorio MX",
                "empresa": "Farmex SA",
                "farmaceutica": "Genfar",
                "presentacion": "Caja 10 tabletas",
                "efectos_secundarios": "Nauseas leves",
                "restricciones": "Ninguna"
            }]
        }
    }

@router.post(
    "/",
    summary="Registrar compra de medicamentos",
    description=(
        "Registra un nuevo lote en `tbd_ph_lotes_medicamentos`, "
        "actualiza el stock en `tbd_ph_inventario_medicamentos`, "
        "registra la entrada en el Kardex y crea un registro maestro de Compra en MongoDB."
    )
)
async def crear_compra(
    body: CompraRequest,
    db: AsyncSession = Depends(get_db),
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    # 1. Verificar que el medicamento existe
    result = await db.execute(select(Medicamento).where(Medicamento.Id == body.id_medicamento))
    med = result.scalar_one_or_none()
    if not med:
        raise HTTPException(status_code=404, detail="Medicamento no encontrado")

    # 2. Crear nuevo lote en tbd_ph_lotes_medicamentos
    nuevo_lote = Lote(
        Medicamento_Id=body.id_medicamento,
        Numero_Lote=body.numero_lote,
        Fecha_Fabricacion=date.today(),
        Fecha_Caducidad=datetime.strptime(body.fecha_caducidad, "%Y-%m-%d").date(),
        Cantidad_Inicial=body.cantidad,
        Cantidad_Actual=body.cantidad,
        Estado_Lote="disponible",
        Fecha_Registro=datetime.now(timezone.utc)
    )
    db.add(nuevo_lote)
    await db.flush()  # Para obtener el id del lote sin cerrar la transacción

    # 3. Actualizar o crear registro en tbd_ph_inventario_medicamentos
    inv_result = await db.execute(
        select(InventarioMedicamento).where(InventarioMedicamento.Medicamento_Id == body.id_medicamento)
    )
    inv = inv_result.scalar_one_or_none()

    if inv:
        await db.execute(
            update(InventarioMedicamento)
            .where(InventarioMedicamento.Medicamento_Id == body.id_medicamento)
            .values(
                Cantidad=InventarioMedicamento.Cantidad + body.cantidad,
                Fecha_Movimiento=datetime.now(timezone.utc),
                Motivo="COMPRA",
                Marca=body.marca or inv.Marca,
                Empresa=body.empresa or inv.Empresa,
                Farmaceutica=body.farmaceutica or inv.Farmaceutica,
                Presentacion=body.presentacion or inv.Presentacion,
                Efectos_Secundarios=body.efectos_secundarios or inv.Efectos_Secundarios,
                Restricciones=body.restricciones or inv.Restricciones,
            )
        )
    else:
        nuevo_inv = InventarioMedicamento(
            Medicamento_Id=body.id_medicamento,
            Marca=body.marca or "Genérico",
            Empresa=body.empresa or "Sin especificar",
            Farmaceutica=body.farmaceutica or "Sin especificar",
            Presentacion=body.presentacion or "Sin especificar",
            Efectos_Secundarios=body.efectos_secundarios or "Ninguno",
            Via_Administracion=med.Via_Administracion or "Desconocida",
            Restricciones=body.restricciones or "Ninguna",
            Aprobacion=1,
            Cantidad=body.cantidad,
            Fecha_Movimiento=datetime.now(timezone.utc),
            Motivo="COMPRA INICIAL",
            Fecha_Registro=datetime.now(timezone.utc)
        )
        db.add(nuevo_inv)

    await db.commit()
    await db.refresh(nuevo_lote)

    # 4. Registrar en MongoDB - Colección "detalle_compra"
    folio_compra = f"FOLIO-{datetime.now().strftime('%Y%m%d%H%M%S')}"
    doc_compra = {
        "folio_compra": folio_compra,
        "fecha": datetime.now(timezone.utc),
        "proveedor": {
            "nombre": body.empresa or "Proveedor Sin Nombre"
        },
        "medicamentos": [
            {
                "id_medicamento": body.id_medicamento,
                "nombre": med.Nombre,
                "cantidad": body.cantidad,
                "concentracion": med.Concentracion,
                "forma_farmaceutica": med.Forma_Farmaceutica
            }
        ]
    }
    compra_res = await mongo["detalle_compra"].insert_one(doc_compra)

    # 5. Actualizar Inventario y Movimientos en MongoDB - Colección "inventario_medicamento"
    await mongo["inventario_medicamento"].update_one(
        {"id_medicamento": body.id_medicamento},
        {
            "$set": {
                "nombre": med.Nombre,
                "concentracion": med.Concentracion,
                "forma_farmaceutica": med.Forma_Farmaceutica
            },
            "$inc": {"stock_actual": body.cantidad},
            "$push": {
                "movimientos": {
                    "tipo": "ENTRADA",
                    "fecha": datetime.now(timezone.utc),
                    "cantidad": body.cantidad,
                    "referencia": folio_compra
                }
            }
        },
        upsert=True
    )

    return {
        "status": "success",
        "message": "Compra registrada en MySQL y MongoDB",
        "id_compra_mongo": str(compra_res.inserted_id),
        "folio": folio_compra,
        "id_lote_creado": nuevo_lote.Id
    }
