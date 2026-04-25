from datetime import datetime, timezone
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from pydantic import BaseModel, Field
from typing import List, Optional

from app.config.database import get_db
from app.config.security import verify_credentials
from app.models.sql.inventario import InventarioMedicamento
from app.models.sql.medicamento import Medicamento

router = APIRouter(prefix="/api/inventario", tags=["Inventario CRUD"])

# ─── Pydantic Schemas ────────────────────────────────────────────────────────

class InventarioBase(BaseModel):
    lote_medicamento_id: int
    marca: Optional[str] = None
    empresa: Optional[str] = None
    farmaceutica: Optional[str] = None
    presentacion: Optional[str] = None
    efectos_secundarios: Optional[str] = None
    via_administracion: Optional[str] = None
    restricciones: Optional[str] = None
    cantidad: int = Field(..., ge=0)

class InventarioCreate(InventarioBase):
    pass

class InventarioUpdate(BaseModel):
    lote_medicamento_id: Optional[int] = None
    marca: Optional[str] = None
    empresa: Optional[str] = None
    farmaceutica: Optional[str] = None
    presentacion: Optional[str] = None
    efectos_secundarios: Optional[str] = None
    via_administracion: Optional[str] = None
    restricciones: Optional[str] = None
    cantidad: Optional[int] = Field(None, ge=0)

class InventarioResponse(BaseModel):
    id: int = Field(..., alias="Id")
    lote_medicamento_id: int = Field(..., alias="Lote_Medicamento_Id")
    marca: Optional[str] = Field(None, alias="Marca")
    empresa: Optional[str] = Field(None, alias="Empresa")
    farmaceutica: Optional[str] = Field(None, alias="Farmaceutica")
    presentacion: Optional[str] = Field(None, alias="Presentacion")
    via_administracion: Optional[str] = Field(None, alias="Via_Administracion")
    efectos_secundarios: Optional[str] = Field(None, alias="Efectos_Secundarios")
    restricciones: Optional[str] = Field(None, alias="Restricciones")
    cantidad: int = Field(..., alias="Cantidad")
    fecha_registro: datetime = Field(..., alias="Fecha_Registro")
    fecha_actualizacion: Optional[datetime] = Field(None, alias="Fecha_Actualizacion")
    estatus: int = Field(default=1, alias="Estatus")

    model_config = {
        "from_attributes": True,
        "populate_by_name": True,
    }

# ─── Endpoints CRUD ─────────────────────────────────────────────────────────

@router.get("/", response_model=List[InventarioResponse], summary="Listar todos los inventarios")
async def listar_inventarios(
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Obtiene todos los registros de inventario."""
    result = await db.execute(select(InventarioMedicamento))
    inventarios = result.scalars().all()
    return [InventarioResponse.model_validate(inv) for inv in inventarios]

@router.get("/{inventario_id}", response_model=InventarioResponse, summary="Obtener inventario por ID")
async def obtener_inventario(
    inventario_id: int,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Obtiene el inventario de un registro específico."""
    result = await db.execute(
        select(InventarioMedicamento).where(InventarioMedicamento.Id == inventario_id)
    )
    inventario = result.scalar_one_or_none()
    if not inventario:
        raise HTTPException(status_code=404, detail="Inventario no encontrado")
    return InventarioResponse.model_validate(inventario)

@router.post("/", response_model=InventarioResponse, status_code=status.HTTP_201_CREATED, summary="Crear inventario")
async def crear_inventario(
    body: InventarioCreate,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Crea un nuevo registro de inventario para un lote."""
    
    # Validar que el lote existe
    from app.models.sql.lote import Lote
    result = await db.execute(select(Lote).where(Lote.Id == body.lote_medicamento_id))
    lote = result.scalar_one_or_none()
    if not lote:
        raise HTTPException(status_code=404, detail="Lote no encontrado")
    
    # Validar que no exista ya inventario para este lote
    result = await db.execute(
        select(InventarioMedicamento).where(InventarioMedicamento.Lote_Medicamento_Id == body.lote_medicamento_id)
    )
    if result.scalar_one_or_none():
        raise HTTPException(status_code=400, detail="Inventario ya existe para este lote")
    
    nuevo_inv = InventarioMedicamento(
        Lote_Medicamento_Id=body.lote_medicamento_id,
        Marca=body.marca,
        Empresa=body.empresa,
        Farmaceutica=body.farmaceutica,
        Presentacion=body.presentacion,
        Efectos_Secundarios=body.efectos_secundarios,
        Via_Administracion=body.via_administracion,
        Restricciones=body.restricciones,
        Cantidad=body.cantidad,
        Fecha_Registro=datetime.now(timezone.utc),
        Estatus=1
    )
    db.add(nuevo_inv)
    await db.commit()
    await db.refresh(nuevo_inv)
    return InventarioResponse.model_validate(nuevo_inv)

@router.put("/{inventario_id}", response_model=InventarioResponse, summary="Actualizar inventario")
async def actualizar_inventario(
    inventario_id: int,
    body: InventarioUpdate,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Actualiza un inventario existente."""
    result = await db.execute(
        select(InventarioMedicamento).where(InventarioMedicamento.Id == inventario_id)
    )
    inventario = result.scalar_one_or_none()
    if not inventario:
        raise HTTPException(status_code=404, detail="Inventario no encontrado")
    
    if body.lote_medicamento_id is not None:
        inventario.Lote_Medicamento_Id = body.lote_medicamento_id
    if body.marca is not None:
        inventario.Marca = body.marca
    if body.empresa is not None:
        inventario.Empresa = body.empresa
    if body.farmaceutica is not None:
        inventario.Farmaceutica = body.farmaceutica
    if body.presentacion is not None:
        inventario.Presentacion = body.presentacion
    if body.efectos_secundarios is not None:
        inventario.Efectos_Secundarios = body.efectos_secundarios
    if body.via_administracion is not None:
        inventario.Via_Administracion = body.via_administracion
    if body.restricciones is not None:
        inventario.Restricciones = body.restricciones
    if body.cantidad is not None:
        inventario.Cantidad = body.cantidad
    
    inventario.Fecha_Actualizacion = datetime.now(timezone.utc)
    await db.commit()
    await db.refresh(inventario)
    return InventarioResponse.model_validate(inventario)

@router.delete("/{inventario_id}", status_code=status.HTTP_204_NO_CONTENT, summary="Eliminar inventario (lógico)")
async def eliminar_inventario(
    inventario_id: int,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Marca el inventario como inactivo (estatus = 0)."""
    result = await db.execute(
        select(InventarioMedicamento).where(InventarioMedicamento.Id == inventario_id)
    )
    inventario = result.scalar_one_or_none()
    if not inventario:
        raise HTTPException(status_code=404, detail="Inventario no encontrado")
    
    inventario.Estatus = 0
    inventario.Fecha_Actualizacion = datetime.now(timezone.utc)
    await db.commit()
    return None
