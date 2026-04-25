from pydantic import BaseModel, Field
from datetime import datetime
from typing import Optional
from bson import ObjectId

class BitacoraDoc(BaseModel):
    tabla_afectada: str
    ip_cliente: str
    fecha: datetime
    hora: str  # HH:MM:SS format
    operacion: str
    detalles: Optional[str] = None

    class Config:
        json_encoders = {ObjectId: str}

class BitacoraCreate(BaseModel):
    tabla_afectada: str
    ip_cliente: str
    fecha: datetime
    hora: str
    operacion: str
    detalles: Optional[str] = None

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