from datetime import datetime, timezone
from fastapi import APIRouter, Depends, HTTPException, status
from motor.motor_asyncio import AsyncIOMotorDatabase
from pydantic import BaseModel, Field
from typing import List, Optional, Literal

from app.config.database import get_mongo
from app.config.security import verify_credentials

router = APIRouter(prefix="/api/mongo/stock", tags=["Stock Medicamento"])


# ─────────────────────────────────────────────
# SCHEMA MEJORADO
# ─────────────────────────────────────────────
class StockMedicamentoCreate(BaseModel):
    id_medicamento: int
    nombre: str
    concentracion: Optional[str] = None
    forma_farmaceutica: Optional[str] = None

    stock_actual: int = Field(..., ge=0)
    stock_minimo: int = Field(10, ge=0)
    stock_maximo: int = Field(1000, ge=1)


class MovimientoStockRequest(BaseModel):
    id_medicamento: int
    cantidad: int = Field(..., gt=0)
    tipo: Literal["ENTRADA", "SALIDA"]
    motivo: str


# ─────────────────────────────────────────────
# 1. CREAR STOCK DE MEDICAMENTO
# ─────────────────────────────────────────────
@router.post("", status_code=status.HTTP_201_CREATED)
async def crear_stock(
    body: StockMedicamentoCreate,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    doc = {
        **body.dict(),
        "movimientos": [],
        "fecha_creacion": datetime.now(timezone.utc),
        "ultima_actualizacion": datetime.now(timezone.utc)
    }

    result = await mongo["inventario_medicamento"].insert_one(doc)

    return {
        "status": "ok",
        "_id": str(result.inserted_id),
        **body.dict()
    }


# ─────────────────────────────────────────────
# 2. AJUSTAR STOCK (ENTRADA / SALIDA)
# ─────────────────────────────────────────────
@router.post("/ajustar")
async def ajustar_stock(
    body: MovimientoStockRequest,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    inventario = await mongo["inventario_medicamento"].find_one(
        {"id_medicamento": body.id_medicamento}
    )

    if not inventario:
        raise HTTPException(status_code=404, detail="Medicamento no encontrado")

    # 🔥 validación stock
    if body.tipo == "SALIDA" and inventario["stock_actual"] < body.cantidad:
        raise HTTPException(status_code=400, detail="Stock insuficiente")

    cambio = body.cantidad if body.tipo == "ENTRADA" else -body.cantidad

    nuevo_stock = inventario["stock_actual"] + cambio

    # 🔥 actualización
    await mongo["inventario_medicamento"].update_one(
        {"id_medicamento": body.id_medicamento},
        {
            "$inc": {"stock_actual": cambio},
            "$push": {
                "movimientos": {
                    "cantidad": body.cantidad,
                    "tipo": body.tipo,
                    "motivo": body.motivo,
                    "fecha": datetime.now(timezone.utc)
                }
            },
            "$set": {
                "ultima_actualizacion": datetime.now(timezone.utc)
            }
        }
    )

    return {
        "status": "ok",
        "id_medicamento": body.id_medicamento,
        "stock_anterior": inventario["stock_actual"],
        "cambio": cambio,
        "stock_nuevo": nuevo_stock
    }


# ─────────────────────────────────────────────
# 3. OBTENER STOCK
# ─────────────────────────────────────────────
@router.get("/{id_medicamento}")
async def obtener_stock(
    id_medicamento: int,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    doc = await mongo["inventario_medicamento"].find_one(
        {"id_medicamento": id_medicamento}
    )

    if not doc:
        raise HTTPException(status_code=404, detail="No encontrado")

    doc["_id"] = str(doc["_id"])
    return doc


# ─────────────────────────────────────────────
# 4. ALERTA STOCK BAJO
# ─────────────────────────────────────────────
@router.get("/alertas/bajo-stock")
async def stock_bajo(
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    docs = await mongo["inventario_medicamento"].find({
        "$expr": {
            "$lte": ["$stock_actual", "$stock_minimo"]
        }
    }).to_list(None)

    for d in docs:
        d["_id"] = str(d["_id"])

    return {
        "total": len(docs),
        "medicamentos": docs
    }