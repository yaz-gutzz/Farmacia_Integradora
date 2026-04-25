from datetime import datetime, timezone
from fastapi import APIRouter, Depends, HTTPException, status
from motor.motor_asyncio import AsyncIOMotorDatabase
from pydantic import BaseModel, Field
from typing import List, Dict, Any
from bson import ObjectId

from app.config.database import get_mongo
from app.config.security import verify_credentials

router = APIRouter(prefix="/api/mongo/detalle-compra", tags=["detalle_compra"])

class DetalleCompraCreate(BaseModel):
    folio_compra: str
    proveedor: Dict[str, Any]
    medicamentos: List[Dict[str, Any]]


@router.get("", response_model=List[Dict[str, Any]], summary="Listar todas las compras")
async def listar_compras(
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    docs = await mongo["detalle_compra"].find().to_list(None)
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs


@router.get("/{compra_id}", summary="Obtener compra por ID")
async def obtener_compra(
    compra_id: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    try:
        object_id = ObjectId(compra_id)
    except:
        raise HTTPException(status_code=400, detail="ID de MongoDB inválido")

    doc = await mongo["detalle_compra"].find_one({"_id": object_id})
    if not doc:
        raise HTTPException(status_code=404, detail="Compra no encontrada")

    doc["_id"] = str(doc["_id"])
    return doc


@router.post("", status_code=status.HTTP_201_CREATED, summary="Crear registro de compra")
async def crear_compra_mongo(
    body: DetalleCompraCreate,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    doc = {
        **body.dict(),
        "fecha": datetime.now(timezone.utc)
    }
    result = await mongo["detalle_compra"].insert_one(doc)
    return {"_id": str(result.inserted_id), **body.dict(), "fecha": doc["fecha"]}


@router.delete("/{compra_id}", status_code=status.HTTP_204_NO_CONTENT, summary="Eliminar compra (lógico)")
async def eliminar_compra(
    compra_id: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    try:
        object_id = ObjectId(compra_id)
    except:
        raise HTTPException(status_code=400, detail="ID de MongoDB inválido")

    result = await mongo["detalle_compra"].update_one(
        {"_id": object_id},
        {"$set": {"eliminado": True, "fecha_eliminacion": datetime.now(timezone.utc)}}
    )

    if result.matched_count == 0:
        raise HTTPException(status_code=404, detail="Compra no encontrada")
    return None
