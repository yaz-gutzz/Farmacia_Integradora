from pydantic import BaseModel, Field
from datetime import datetime
from typing import List, Optional

class LoteUsado(BaseModel):
    id_lote: int
    cantidad_descontada: int

class DetalleDispensado(BaseModel):
    id_medicamento: int
    nombre_medicamento: Optional[str] = None
    cantidad_surtida: int
    lotes_usados: List[LoteUsado]

class Faltante(BaseModel):
    id_medicamento: int
    nombre_medicamento: Optional[str] = None
    cantidad_pendiente: int
    motivo: str

class DispensacionDoc(BaseModel):
    id_receta: int
    id_paciente: int
    fecha: datetime = Field(default_factory=datetime.utcnow)
    dispensados: List[DetalleDispensado]
    faltantes: List[Faltante] = []
