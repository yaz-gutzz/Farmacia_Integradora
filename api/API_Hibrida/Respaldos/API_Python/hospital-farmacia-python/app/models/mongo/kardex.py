from pydantic import BaseModel
from datetime import datetime
from typing import List, Optional

class DetallesLote(BaseModel):
    id_lote: int
    cantidad_descontada: int

class KardexMovimiento(BaseModel):
    tipo: str  # ENTRADA / SALIDA
    fecha: datetime = datetime.utcnow()
    cantidad: int
    referencia: Optional[str] = None
    motivo: Optional[str] = None
