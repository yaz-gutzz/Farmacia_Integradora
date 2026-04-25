from datetime import datetime, timezone
from fastapi import APIRouter, Depends, HTTPException, Query, status
from motor.motor_asyncio import AsyncIOMotorDatabase
from pydantic import BaseModel
from typing import List, Dict, Any, Optional
from bson import ObjectId

from app.config.database import get_mongo
from app.config.security import verify_credentials

router = APIRouter(prefix="/api/mongo/subrogaciones", tags=["subrogacion_medicamentos"])

class SubrogacionCreate(BaseModel):
    id_medicamento: int
    nombre_medicamento: str
    cantidad_requerida: int
    cantidad_faltante: int
    medicamento_alterno: Optional[Dict[str, Any]] = None
    estado: str = "pendiente"


@router.get("", response_model=List[Dict[str, Any]], summary="Listar subrogaciones")
async def listar_subrogaciones(
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    docs = await mongo["subrogacion_medicamentos"].find({"estado": "pendiente"}).to_list(None)
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs


@router.get("/{subrogacion_id}", summary="Obtener subrogación por ID")
async def obtener_subrogacion(
    subrogacion_id: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    try:
        object_id = ObjectId(subrogacion_id)
    except:
        raise HTTPException(status_code=400, detail="ID de MongoDB inválido")

    doc = await mongo["subrogacion_medicamentos"].find_one({"_id": object_id})
    if not doc:
        raise HTTPException(status_code=404, detail="Subrogación no encontrada")

    doc["_id"] = str(doc["_id"])
    return doc


@router.post("", status_code=status.HTTP_201_CREATED, summary="Crear subrogación")
async def crear_subrogacion(
    body: SubrogacionCreate,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    doc = {
        **body.dict(),
        "fecha_solicitud": datetime.now(timezone.utc)
    }
    result = await mongo["subrogacion_medicamentos"].insert_one(doc)
    return {"_id": str(result.inserted_id), **body.dict(), "fecha_solicitud": doc["fecha_solicitud"]}


@router.put("/{subrogacion_id}", summary="Actualizar estado de subrogación")
async def actualizar_subrogacion(
    subrogacion_id: str,
    estado: str = Query(..., description="Estado: pendiente, aprobada, rechazada"),
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    if estado not in ["pendiente", "aprobada", "rechazada"]:
        raise HTTPException(status_code=400, detail="Estado inválido")

    try:
        object_id = ObjectId(subrogacion_id)
    except:
        raise HTTPException(status_code=400, detail="ID de MongoDB inválido")

    result = await mongo["subrogacion_medicamentos"].update_one(
        {"_id": object_id},
        {"$set": {"estado": estado, "fecha_actualizacion": datetime.now(timezone.utc)}}
    )

    if result.matched_count == 0:
        raise HTTPException(status_code=404, detail="Subrogación no encontrada")

    return {"mensaje": "Subrogación actualizada"}


@router.delete("/{subrogacion_id}", status_code=status.HTTP_204_NO_CONTENT, summary="Eliminar subrogación (lógico)")
async def eliminar_subrogacion(
    subrogacion_id: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    try:
        object_id = ObjectId(subrogacion_id)
    except:
        raise HTTPException(status_code=400, detail="ID de MongoDB inválido")

    result = await mongo["subrogacion_medicamentos"].update_one(
        {"_id": object_id},
        {"$set": {"eliminado": True, "fecha_eliminacion": datetime.now(timezone.utc)}}
    )

    if result.matched_count == 0:
        raise HTTPException(status_code=404, detail="Subrogación no encontrada")
    return None
