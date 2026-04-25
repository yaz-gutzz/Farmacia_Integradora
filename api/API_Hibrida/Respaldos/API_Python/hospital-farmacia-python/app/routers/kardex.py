from datetime import datetime
from fastapi import APIRouter, Depends
from motor.motor_asyncio import AsyncIOMotorDatabase
from pydantic import BaseModel

from app.config.database import get_mongo
from app.config.security import verify_credentials

router = APIRouter(prefix="/api/kardex", tags=["Kardex"])

@router.get(
    "/{id_medicamento}",
    summary="Obtener Kardex de un medicamento",
    description="Retorna todos los movimientos de entrada y salida registrados en MongoDB para un medicamento específico."
)
async def get_kardex(
    id_medicamento: int,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    doc = await mongo["inventario_medicamento"].find_one({"id_medicamento": id_medicamento}, {"_id": 0})
    if not doc:
        return {"id_medicamento": id_medicamento, "stock_actual": 0, "movimientos": []}
    return {
        "id_medicamento": id_medicamento,
        "nombre": doc.get("nombre"),
        "stock_actual": doc.get("stock_actual", 0),
        "movimientos": doc.get("movimientos", [])
    }
