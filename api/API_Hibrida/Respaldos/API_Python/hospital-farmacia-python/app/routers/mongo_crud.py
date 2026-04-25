from datetime import datetime, timezone
from fastapi import APIRouter, Depends, HTTPException, status, Query
from motor.motor_asyncio import AsyncIOMotorDatabase
from pydantic import BaseModel, Field
from typing import List, Optional, Dict, Any
from bson import ObjectId

from app.config.database import get_mongo
from app.config.security import verify_credentials
from app.models.mongo.bitacora import BitacoraDoc, BitacoraCreate, BitacoraResponse

router = APIRouter(prefix="/api/mongo", tags=["MongoDB CRUD"])

# ─── Schemas Generales ──────────────────────────────────────────────────────

class DetalleCompraDoc(BaseModel):
    folio_compra: str
    fecha: datetime
    proveedor: Dict[str, Any]
    medicamentos: List[Dict[str, Any]]
    
    class Config:
        json_encoders = {ObjectId: str}

class DetalleCompraCreate(BaseModel):
    folio_compra: str
    proveedor: Dict[str, Any]
    medicamentos: List[Dict[str, Any]]

class DetalleCompraResponse(BaseModel):
    id: str = Field(..., alias="_id")
    folio_compra: str
    fecha: datetime
    proveedor: Dict[str, Any]
    medicamentos: List[Dict[str, Any]]

    class Config:
        from_attributes = True
        populate_by_name = True

class InventarioMovimiento(BaseModel):
    id_medicamento: int
    nombre: str
    cantidad: int
    fecha_movimiento: datetime
    tipo_movimiento: str
    motivo: str

class InventarioMovimientoCreate(BaseModel):
    id_medicamento: int
    nombre: str
    cantidad: int
    tipo_movimiento: str
    motivo: str

class SubrogacionDoc(BaseModel):
    id_medicamento: int
    nombre_medicamento: str
    cantidad_requerida: int
    cantidad_faltante: int
    fecha_solicitud: datetime
    medicamento_alterno: Optional[Dict[str, Any]] = None
    estado: str

class SubrogacionCreate(BaseModel):
    id_medicamento: int
    nombre_medicamento: str
    cantidad_requerida: int
    cantidad_faltante: int
    medicamento_alterno: Optional[Dict[str, Any]] = None
    estado: str = "pendiente"

# ─── Colección: detalle_compra ─────────────────────────────────────────────────

@router.get("/detalle-compra", response_model=List[Dict[str, Any]], summary="Listar todas las compras")
async def listar_compras(
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene todos los registros de compra desde MongoDB."""
    docs = await mongo["detalle_compra"].find().to_list(None)
    
    # Convertir ObjectId a string
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs

@router.get("/detalle-compra/{compra_id}", summary="Obtener compra por ID")
async def obtener_compra(
    compra_id: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene una compra específica por su ObjectId."""
    try:
        object_id = ObjectId(compra_id)
    except:
        raise HTTPException(status_code=400, detail="ID de MongoDB inválido")
    
    doc = await mongo["detalle_compra"].find_one({"_id": object_id})
    if not doc:
        raise HTTPException(status_code=404, detail="Compra no encontrada")
    
    doc["_id"] = str(doc["_id"])
    return doc

@router.post("/detalle-compra", status_code=status.HTTP_201_CREATED, summary="Crear registro de compra")
async def crear_compra_mongo(
    body: DetalleCompraCreate,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Crea un nuevo registro de compra en MongoDB."""
    doc = {
        **body.dict(),
        "fecha": datetime.now(timezone.utc)
    }
    result = await mongo["detalle_compra"].insert_one(doc)
    return {"_id": str(result.inserted_id), **body.dict(), "fecha": doc["fecha"]}

@router.delete("/detalle-compra/{compra_id}", status_code=status.HTTP_204_NO_CONTENT, summary="Eliminar compra (lógico)")
async def eliminar_compra(
    compra_id: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Marca una compra como eliminada (soft delete)."""
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

# ─── Colección: inventario_medicamento ─────────────────────────────────────

@router.get("/inventario", response_model=List[Dict[str, Any]], summary="Listar movimientos de inventario")
async def listar_inventario_movimientos(
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene todos los movimientos de inventario."""
    docs = await mongo["inventario_medicamento"].find().to_list(None)
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs

@router.get("/inventario/{id_medicamento}", summary="Obtener movimientos de un medicamento")
async def obtener_inventario_medicamento(
    id_medicamento: int,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene todos los movimientos de inventario de un medicamento específico."""
    docs = await mongo["inventario_medicamento"].find({"id_medicamento": id_medicamento}).to_list(None)
    
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs

@router.post("/inventario", status_code=status.HTTP_201_CREATED, summary="Registrar movimiento de inventario")
async def registrar_movimiento_inventario(
    body: InventarioMovimientoCreate,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Registra un nuevo movimiento de inventario."""
    doc = {
        **body.dict(),
        "fecha_movimiento": datetime.now(timezone.utc)
    }
    result = await mongo["inventario_medicamento"].insert_one(doc)
    return {"_id": str(result.inserted_id), **body.dict(), "fecha_movimiento": doc["fecha_movimiento"]}

# ─── Colección: subrogacion_medicamentos ──────────────────────────────────

@router.get("/subrogaciones", response_model=List[Dict[str, Any]], summary="Listar subrogaciones")
async def listar_subrogaciones(
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene todas las subrogaciones pendientes."""
    docs = await mongo["subrogacion_medicamentos"].find({"estado": "pendiente"}).to_list(None)
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs

@router.get("/subrogaciones/{subrogacion_id}", summary="Obtener subrogación por ID")
async def obtener_subrogacion(
    subrogacion_id: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene una subrogación específica."""
    try:
        object_id = ObjectId(subrogacion_id)
    except:
        raise HTTPException(status_code=400, detail="ID de MongoDB inválido")
    
    doc = await mongo["subrogacion_medicamentos"].find_one({"_id": object_id})
    if not doc:
        raise HTTPException(status_code=404, detail="Subrogación no encontrada")
    
    doc["_id"] = str(doc["_id"])
    return doc

@router.post("/subrogaciones", status_code=status.HTTP_201_CREATED, summary="Crear subrogación")
async def crear_subrogacion(
    body: SubrogacionCreate,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Crea una nueva solicitud de subrogación."""
    doc = {
        **body.dict(),
        "fecha_solicitud": datetime.now(timezone.utc)
    }
    result = await mongo["subrogacion_medicamentos"].insert_one(doc)
    return {"_id": str(result.inserted_id), **body.dict(), "fecha_solicitud": doc["fecha_solicitud"]}

@router.put("/subrogaciones/{subrogacion_id}", summary="Actualizar estado de subrogación")
async def actualizar_subrogacion(
    subrogacion_id: str,
    estado: str = Query(..., description="Estado: pendiente, aprobada, rechazada"),
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Actualiza el estado de una subrogación."""
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

@router.delete("/subrogaciones/{subrogacion_id}", status_code=status.HTTP_204_NO_CONTENT, summary="Eliminar subrogación (lógico)")
async def eliminar_subrogacion(
    subrogacion_id: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Marca una subrogación como eliminada."""
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

# ─── Colección: dispensaciones ─────────────────────────────────────────────

@router.get("/dispensaciones", response_model=List[Dict[str, Any]], summary="Listar dispensaciones")
async def listar_dispensaciones(
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene todas las dispensaciones registradas."""
    docs = await mongo["dispensaciones"].find().to_list(None)
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs

@router.get("/dispensaciones/{dispensacion_id}", summary="Obtener dispensación por ID")
async def obtener_dispensacion(
    dispensacion_id: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene una dispensación específica."""
    try:
        object_id = ObjectId(dispensacion_id)
    except:
        raise HTTPException(status_code=400, detail="ID de MongoDB inválido")
    
    doc = await mongo["dispensaciones"].find_one({"_id": object_id})
    if not doc:
        raise HTTPException(status_code=404, detail="Dispensación no encontrada")
    
    doc["_id"] = str(doc["_id"])
    return doc

@router.get("/dispensaciones/receta/{id_receta}", summary="Obtener dispensación por receta")
async def obtener_dispensacion_por_receta(
    id_receta: int,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene la dispensación asociada a una receta."""
    doc = await mongo["dispensaciones"].find_one({"id_receta": id_receta})
    if not doc:
        raise HTTPException(status_code=404, detail="Dispensación no encontrada para esta receta")
    
    doc["_id"] = str(doc["_id"])
    return doc

@router.delete("/dispensaciones/{dispensacion_id}", status_code=status.HTTP_204_NO_CONTENT, summary="Eliminar dispensación (lógico)")
async def eliminar_dispensacion(
    dispensacion_id: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Marca una dispensación como eliminada."""
    try:
        object_id = ObjectId(dispensacion_id)
    except:
        raise HTTPException(status_code=400, detail="ID de MongoDB inválido")
    
    result = await mongo["dispensaciones"].update_one(
        {"_id": object_id},
        {"$set": {"eliminado": True, "fecha_eliminacion": datetime.now(timezone.utc)}}
    )
    
    if result.matched_count == 0:
        raise HTTPException(status_code=404, detail="Dispensación no encontrada")
    return None

# ─── Colección: bitacora ───────────────────────────────────────────────────

@router.get("/bitacora", response_model=List[BitacoraResponse], summary="Listar bitácora MongoDB")
async def listar_bitacora_mongo(
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene todos los registros de auditoría de MongoDB."""
    docs = await mongo["bitacora"].find().sort("fecha", -1).to_list(None)
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs

@router.get("/bitacora/tabla/{tabla_afectada}", response_model=List[BitacoraResponse], summary="Filtrar bitácora por tabla")
async def filtrar_bitacora_por_tabla(
    tabla_afectada: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene registros de auditoría de una tabla específica."""
    docs = await mongo["bitacora"].find({"tabla_afectada": tabla_afectada}).sort("fecha", -1).to_list(None)
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs

@router.get("/bitacora/ip/{ip_cliente}", response_model=List[BitacoraResponse], summary="Filtrar bitácora por IP")
async def filtrar_bitacora_por_ip(
    ip_cliente: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene registros de auditoría de una IP específica."""
    docs = await mongo["bitacora"].find({"ip_cliente": ip_cliente}).sort("fecha", -1).to_list(None)
    for doc in docs:
        doc["_id"] = str(doc["_id"])
    return docs

@router.get("/bitacora/fecha/{fecha_str}", response_model=List[BitacoraResponse], summary="Filtrar bitácora por fecha")
async def filtrar_bitacora_por_fecha(
    fecha_str: str,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """
    Obtiene registros de auditoría de una fecha específica.
    
    Formato: YYYY-MM-DD
    """
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

@router.get("/bitacora/filtro", response_model=List[BitacoraResponse], summary="Filtro avanzado bitácora")
async def filtro_avanzado_bitacora(
    tabla: Optional[str] = Query(None, description="Nombre de tabla"),
    ip: Optional[str] = Query(None, description="Dirección IP"),
    fecha: Optional[str] = Query(None, description="Fecha (YYYY-MM-DD)"),
    operacion: Optional[str] = Query(None, description="Tipo de operación"),
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """
    Filtro avanzado para bitácora MongoDB.
    
    Parámetros opcionales:
    - tabla: Nombre de la tabla afectada
    - ip: Dirección IP del cliente
    - fecha: Fecha específica (YYYY-MM-DD)
    - operacion: Tipo de operación (INSERT, UPDATE, DELETE, etc.)
    """
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

@router.get("/bitacora/estadisticas", summary="Estadísticas bitácora MongoDB")
async def estadisticas_bitacora_mongo(
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    """Obtiene estadísticas de la bitácora MongoDB."""
    
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
