from datetime import datetime
from fastapi import APIRouter, Depends, HTTPException, Query
from motor.motor_asyncio import AsyncIOMotorDatabase
from pydantic import BaseModel, Field
from typing import List, Optional

from app.config.database import get_mongo
from app.config.security import verify_credentials

router = APIRouter(prefix="/api/mongo/bitacora", tags=["bitacora"])

class BitacoraResponse(BaseModel):
    id: str = Field(..., alias="_id")
    tabla_afectada: str
    ip_cliente: str
    fecha: datetime
    hora: str
    operacion: str
    detalles: Optional[str] = None

    class Config:
        from_attributes = True
        populate_by_name = True


@router.get("", response_model=List[BitacoraResponse], summary="Listar bitácora MongoDB")
async def listar_bitacora_mongo(
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    docs = await mongo["bitacora"].find().sort("fecha", -1).to_list(None)
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs


@router.get("/tabla/{tabla_afectada}", response_model=List[BitacoraResponse], summary="Filtrar bitácora por tabla")
async def filtrar_bitacora_por_tabla(
    tabla_afectada: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    docs = await mongo["bitacora"].find({"tabla_afectada": tabla_afectada}).sort("fecha", -1).to_list(None)
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs


@router.get("/ip/{ip_cliente}", response_model=List[BitacoraResponse], summary="Filtrar bitácora por IP")
async def filtrar_bitacora_por_ip(
    ip_cliente: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    docs = await mongo["bitacora"].find({"ip_cliente": ip_cliente}).sort("fecha", -1).to_list(None)
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs


@router.get("/fecha/{fecha_str}", response_model=List[BitacoraResponse], summary="Filtrar bitácora por fecha")
async def filtrar_bitacora_por_fecha(
    fecha_str: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    try:
        fecha_inicio = datetime.strptime(fecha_str, "%Y-%m-%d")
        fecha_fin = fecha_inicio.replace(hour=23, minute=59, second=59)
    except ValueError:
        raise HTTPException(status_code=400, detail="Formato de fecha inválido. Use YYYY-MM-DD")

    docs = await mongo["bitacora"].find({
        "fecha": {"$gte": fecha_inicio, "$lte": fecha_fin}
    }).sort("hora", -1).to_list(None)

    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs


@router.get("/filtro", response_model=List[BitacoraResponse], summary="Filtro avanzado bitácora")
async def filtro_avanzado_bitacora(
    tabla: Optional[str] = Query(None, description="Nombre de tabla"),
    ip: Optional[str] = Query(None, description="Dirección IP"),
    fecha: Optional[str] = Query(None, description="Fecha (YYYY-MM-DD)"),
    operacion: Optional[str] = Query(None, description="Tipo de operación"),
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    query = {}

    if tabla:
        query["tabla_afectada"] = tabla
    if ip:
        query["ip_cliente"] = ip
    if operacion:
        query["operacion"] = operacion
    if fecha:
        try:
            fecha_inicio = datetime.strptime(fecha, "%Y-%m-%d")
            fecha_fin = fecha_inicio.replace(hour=23, minute=59, second=59)
            query["fecha"] = {"$gte": fecha_inicio, "$lte": fecha_fin}
        except ValueError:
            raise HTTPException(status_code=400, detail="Formato de fecha inválido. Use YYYY-MM-DD")

    docs = await mongo["bitacora"].find(query).sort("fecha", -1).to_list(None)
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs


@router.get("/estadisticas", summary="Estadísticas bitácora MongoDB")
async def estadisticas_bitacora_mongo(
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    pipeline = [
        {
            "$group": {
                "_id": None,
                "total_registros": {"$sum": 1},
                "ips_unicas": {"$addToSet": "$ip_cliente"},
                "tablas_afectadas": {"$addToSet": "$tabla_afectada"},
                "operaciones": {"$addToSet": "$operacion"}
            }
        }
    ]

    result = await mongo["bitacora"].aggregate(pipeline).to_list(None)

    if result:
        stats = result[0]
        return {
            "total_registros": stats["total_registros"],
            "ips_unicas": len(stats["ips_unicas"]),
            "tablas_afectadas": list(set(stats["tablas_afectadas"])),
            "operaciones_registradas": list(set(stats["operaciones"]))
        }
    else:
        return {
            "total_registros": 0,
            "ips_unicas": 0,
            "tablas_afectadas": [],
            "operaciones_registradas": []
        }
