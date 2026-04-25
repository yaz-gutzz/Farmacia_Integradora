from datetime import datetime, timezone
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from pydantic import BaseModel, Field
from typing import List, Optional

from app.config.database import get_db
from app.config.security import verify_credentials
from app.models.sql.receta import DetalleReceta, RecetaMedica
from app.models.sql.medicamento import Medicamento

router = APIRouter(prefix="/api/detalle-receta", tags=["Detalle Receta CRUD"])

# ─── Pydantic Schemas ────────────────────────────────────────────────────────

class DetalleRecetaBase(BaseModel):
    receta_id: int
    medicamento_id: int
    dosis: str = "1 tableta"
    frecuencia: str = "cada 8 horas"
    duracion: str = "3 días"
    cantidad: int = Field(..., gt=0)
    indicaciones: Optional[str] = None

class DetalleRecetaCreate(DetalleRecetaBase):
    pass

class DetalleRecetaUpdate(BaseModel):
    dosis: Optional[str] = None
    frecuencia: Optional[str] = None
    duracion: Optional[str] = None
    cantidad: Optional[int] = Field(None, gt=0)
    indicaciones: Optional[str] = None

class DetalleRecetaResponse(BaseModel):
    id: int = Field(..., alias="Id")
    receta_id: int = Field(..., alias="Receta_Id")
    medicamento_id: int = Field(..., alias="Medicamento_Id")
    dosis: str = Field(..., alias="Dosis")
    frecuencia: str = Field(..., alias="Frecuencia")
    duracion: str = Field(..., alias="Duracion")
    cantidad: int = Field(..., alias="Cantidad")
    indicaciones: str = Field(..., alias="Indicaciones")
    fecha_registro: datetime = Field(..., alias="Fecha_Registro")
    fecha_actualizacion: datetime = Field(..., alias="Fecha_Actualizacion")

    class Config:
        from_attributes = True
        populate_by_name = True

# ─── Endpoints CRUD ─────────────────────────────────────────────────────────

@router.get("/", response_model=List[DetalleRecetaResponse], summary="Listar todos los detalles de receta")
async def listar_detalles(
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Obtiene todos los detalles de recetas."""
    result = await db.execute(select(DetalleReceta))
    detalles = result.scalars().all()
    return detalles

@router.get("/{detalle_id}", response_model=DetalleRecetaResponse, summary="Obtener detalle por ID")
async def obtener_detalle(
    detalle_id: int,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Obtiene un detalle específico de receta."""
    result = await db.execute(select(DetalleReceta).where(DetalleReceta.Id == detalle_id))
    detalle = result.scalar_one_or_none()
    if not detalle:
        raise HTTPException(status_code=404, detail="Detalle de receta no encontrado")
    return detalle

@router.get("/receta/{receta_id}", response_model=List[DetalleRecetaResponse], summary="Obtener detalles por receta")
async def obtener_detalles_por_receta(
    receta_id: int,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Obtiene todos los detalles de una receta específica."""
    result = await db.execute(select(DetalleReceta).where(DetalleReceta.Receta_Id == receta_id))
    detalles = result.scalars().all()
    if not detalles:
        raise HTTPException(status_code=404, detail="No hay detalles para esta receta")
    return detalles

@router.post("/", response_model=DetalleRecetaResponse, status_code=status.HTTP_201_CREATED, summary="Crear detalle receta")
async def crear_detalle(
    body: DetalleRecetaCreate,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Crea un nuevo detalle de medicamento en una receta."""
    
    # Validar receta
    result = await db.execute(select(RecetaMedica).where(RecetaMedica.Id == body.receta_id))
    if not result.scalar_one_or_none():
        raise HTTPException(status_code=404, detail="Receta no encontrada")
    
    # Validar medicamento
    result = await db.execute(select(Medicamento).where(Medicamento.Id == body.medicamento_id))
    if not result.scalar_one_or_none():
        raise HTTPException(status_code=404, detail="Medicamento no encontrado")
    
    nuevo_detalle = DetalleReceta(
        Receta_Id=body.receta_id,
        Medicamento_Id=body.medicamento_id,
        Dosis=body.dosis,
        Frecuencia=body.frecuencia,
        Duracion=body.duracion,
        Cantidad=body.cantidad,
        Indicaciones=body.indicaciones or "Sin indicaciones",
        Fecha_Registro=datetime.now(timezone.utc),
        Fecha_Actualizacion=datetime.now(timezone.utc)
    )
    db.add(nuevo_detalle)
    await db.commit()
    await db.refresh(nuevo_detalle)
    return nuevo_detalle

@router.put("/{detalle_id}", response_model=DetalleRecetaResponse, summary="Actualizar detalle receta")
async def actualizar_detalle(
    detalle_id: int,
    body: DetalleRecetaUpdate,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Actualiza un detalle de receta existente."""
    result = await db.execute(select(DetalleReceta).where(DetalleReceta.Id == detalle_id))
    detalle = result.scalar_one_or_none()
    if not detalle:
        raise HTTPException(status_code=404, detail="Detalle no encontrado")
    
    if body.dosis is not None:
        detalle.Dosis = body.dosis
    if body.frecuencia is not None:
        detalle.Frecuencia = body.frecuencia
    if body.duracion is not None:
        detalle.Duracion = body.duracion
    if body.cantidad is not None:
        detalle.Cantidad = body.cantidad
    if body.indicaciones is not None:
        detalle.Indicaciones = body.indicaciones
    
    detalle.Fecha_Actualizacion = datetime.now(timezone.utc)
    await db.commit()
    await db.refresh(detalle)
    return detalle

@router.delete("/{detalle_id}", status_code=status.HTTP_204_NO_CONTENT, summary="Eliminar detalle receta")
async def eliminar_detalle(
    detalle_id: int,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Elimina un detalle de receta."""
    result = await db.execute(select(DetalleReceta).where(DetalleReceta.Id == detalle_id))
    detalle = result.scalar_one_or_none()
    if not detalle:
        raise HTTPException(status_code=404, detail="Detalle no encontrado")
    
    await db.delete(detalle)
    await db.commit()
    return None
