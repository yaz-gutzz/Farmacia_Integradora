"""
Esquemas Pydantic para simulación de datos en MySQL y MongoDB
"""

from pydantic import BaseModel, Field, field_validator
from typing import Optional, List
from datetime import datetime


# ─── Schemas para SQL (Stored Procedures) ────────────────────────────────────

class SimulacionRecetasRequest(BaseModel):
    """Request para generar recetas simuladas"""
    cantidad: int = Field(..., ge=1, le=10000, description="Cantidad de recetas a generar (1-10000)")
    
    class Config:
        json_schema_extra = {
            "example": {
                "cantidad": 50
            }
        }


class SimulacionLotesRequest(BaseModel):
    """Request para generar lotes simulados"""
    cantidad: int = Field(..., ge=1, le=50000, description="Cantidad de lotes a generar (1-50000)")
    
    class Config:
        json_schema_extra = {
            "example": {
                "cantidad": 100
            }
        }


class SimulacionDispensacionRequest(BaseModel):
    """Request para simular dispensación"""
    cantidad: int = Field(..., ge=1, le=10000, description="Cantidad de dispensaciones (1-10000)")
    
    class Config:
        json_schema_extra = {
            "example": {
                "cantidad": 75
            }
        }


class SimulacionSubrogacionesRequest(BaseModel):
    """Request para generar subrogaciones simuladas"""
    cantidad: int = Field(..., ge=1, le=10000, description="Cantidad de subrogaciones (1-10000)")
    
    class Config:
        json_schema_extra = {
            "example": {
                "cantidad": 30
            }
        }


class SimulacionSQLResponse(BaseModel):
    """Response genérico para procedimientos SQL"""
    success: bool
    message: str
    data: dict = Field(default_factory=dict)
    timestamp: datetime = Field(default_factory=datetime.now)
    
    class Config:
        json_schema_extra = {
            "example": {
                "success": True,
                "message": "Recetas generadas exitosamente",
                "data": {
                    "registros_creados": 50,
                    "total": 150
                },
                "timestamp": "2024-01-15T10:30:45"
            }
        }


# ─── Schemas para MongoDB (Simulación) ────────────────────────────────────────

class MovimientoInventarioRequest(BaseModel):
    """Request para simular movimientos de inventario (Kardex)"""
    cantidad: int = Field(..., ge=1, le=50000, description="Cantidad de movimientos (1-50000)")
    
    class Config:
        json_schema_extra = {
            "example": {
                "cantidad": 200
            }
        }


class SubrogacionMongoRequest(BaseModel):
    """Request para simular subrogaciones en MongoDB"""
    cantidad: int = Field(..., ge=1, le=10000, description="Cantidad de subrogaciones (1-10000)")
    
    class Config:
        json_schema_extra = {
            "example": {
                "cantidad": 50
            }
        }


class CompraMongoRequest(BaseModel):
    """Request para simular compras en MongoDB"""
    cantidad: int = Field(..., ge=1, le=50000, description="Cantidad de compras (1-50000)")
    
    class Config:
        json_schema_extra = {
            "example": {
                "cantidad": 100
            }
        }


class DispensacionMongoRequest(BaseModel):
    """Request para simular dispensaciones en MongoDB"""
    cantidad: int = Field(..., ge=1, le=10000, description="Cantidad de dispensaciones (1-10000)")
    
    class Config:
        json_schema_extra = {
            "example": {
                "cantidad": 75
            }
        }


class SimulacionMongoResponse(BaseModel):
    """Response genérico para operaciones MongoDB"""
    success: bool
    message: str
    data: dict = Field(default_factory=dict)
    timestamp: datetime = Field(default_factory=datetime.now)
    
    class Config:
        json_schema_extra = {
            "example": {
                "success": True,
                "message": "Movimientos de inventario insertados exitosamente",
                "data": {
                    "documentos_insertados": 200,
                    "tipos_movimiento": {
                        "ENTRADA": 60,
                        "SALIDA": 80,
                        "AJUSTE": 40,
                        "DEVOLUCION": 20
                    }
                },
                "timestamp": "2024-01-15T10:30:45"
            }
        }


class ErrorResponse(BaseModel):
    """Response para errores"""
    success: bool = False
    message: str
    error: str
    timestamp: datetime = Field(default_factory=datetime.now)
    
    class Config:
        json_schema_extra = {
            "example": {
                "success": False,
                "message": "Error procesando solicitud",
                "error": "Cantidad debe estar entre 1 y 10000",
                "timestamp": "2024-01-15T10:30:45"
            }
        }
