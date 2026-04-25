from datetime import date, datetime, timezone
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from pydantic import BaseModel, Field
from typing import List, Optional

from app.config.database import get_db
from app.config.security import verify_credentials
from app.models.sql.lote import Lote
from app.models.sql.medicamento import Medicamento

router = APIRouter(prefix="/api/lotes", tags=["Lotes CRUD"])

# ─── Pydantic Schemas ────────────────────────────────────────────────────────

class LoteBase(BaseModel):
    medicamento_id: int
    proveedor_id: Optional[int] = None
    numero_lote: str
    fecha_fabricacion: date = Field(..., example="2025-01-01")
    fecha_caducidad: date = Field(..., example="2028-01-01")
    cantidad_inicial: int = Field(..., gt=0)
    estado_lote: str = "Disponible"

class LoteCreate(LoteBase):
    pass

class LoteUpdate(BaseModel):
    proveedor_id: Optional[int] = None
    numero_lote: Optional[str] = None
    fecha_fabricacion: Optional[str] = None
    fecha_caducidad: Optional[str] = None
    cantidad_inicial: Optional[int] = None
    cantidad_actual: Optional[int] = None
    estado_lote: Optional[str] = None
    observaciones: Optional[str] = None

class LoteResponse(BaseModel):
    id: int = Field(..., alias="Id")
    medicamento_id: int = Field(..., alias="Medicamento_Id")
    proveedor_id: Optional[int] = Field(None, alias="Proveedor_Id")
    numero_lote: str = Field(..., alias="Numero_Lote")
    fecha_fabricacion: date = Field(..., alias="Fecha_Fabricacion")
    fecha_caducidad: date = Field(..., alias="Fecha_Caducidad")
    cantidad_inicial: int = Field(..., alias="Cantidad_Inicial")
    cantidad_actual: int = Field(..., alias="Cantidad_Actual")
    estado_lote: str = Field(..., alias="Estado_Lote")
    observaciones: Optional[str] = Field(None, alias="Observaciones")
    fecha_registro: datetime = Field(..., alias="Fecha_Registro")
    fecha_actualizacion: Optional[datetime] = Field(None, alias="Fecha_Actualizacion")
    estatus: int = Field(default=1, alias="Estatus")

    model_config = {
        "from_attributes": True,
        "populate_by_name": True,
    }

# ─── Endpoints CRUD ─────────────────────────────────────────────────────────

@router.get("/", response_model=List[LoteResponse], summary="Listar todos los lotes")
async def listar_lotes(
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Obtiene todos los lotes disponibles (activos)."""
    result = await db.execute(select(Lote).where(Lote.Estado_Lote != "Vencido"))
    lotes = result.scalars().all()
    return [LoteResponse.model_validate(lote) for lote in lotes]

@router.get("/{lote_id}", response_model=LoteResponse, summary="Obtener lote por ID")
async def obtener_lote(
    lote_id: int,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Obtiene un lote específico por su ID."""
    result = await db.execute(select(Lote).where(Lote.Id == lote_id))
    lote = result.scalar_one_or_none()
    if not lote:
        raise HTTPException(status_code=404, detail="Lote no encontrado")
    return LoteResponse.model_validate(lote)

@router.post("/", response_model=LoteResponse, status_code=status.HTTP_201_CREATED, summary="Crear nuevo lote")
async def crear_lote(
    body: LoteCreate,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Crea un nuevo lote de medicamento."""
    
    # Validar medicamento
    result = await db.execute(select(Medicamento).where(Medicamento.Id == body.medicamento_id))
    if not result.scalar_one_or_none():
        raise HTTPException(status_code=404, detail="Medicamento no encontrado")
    
    # Validar fechas
    def _parse_date(value):
        if isinstance(value, date):
            return value
        return datetime.strptime(value, "%Y-%m-%d").date()

    try:
        fecha_fab = _parse_date(body.fecha_fabricacion)
        fecha_cad = _parse_date(body.fecha_caducidad)
        
        if fecha_cad <= fecha_fab:
            raise HTTPException(
                status_code=400,
                detail="Fecha de caducidad debe ser posterior a fecha de fabricación"
            )
    except (ValueError, TypeError):
        raise HTTPException(status_code=400, detail="Formato de fecha inválido (use YYYY-MM-DD)")
    
    nuevo_lote = Lote(
        Medicamento_Id=body.medicamento_id,
        Proveedor_Id=body.proveedor_id,
        Numero_Lote=body.numero_lote,
        Fecha_Fabricacion=fecha_fab,
        Fecha_Caducidad=fecha_cad,
        Cantidad_Inicial=body.cantidad_inicial,
        Cantidad_Actual=body.cantidad_inicial,
        Estado_Lote=body.estado_lote,
        Fecha_Registro=datetime.now(timezone.utc),
        Estatus=1
    )
    db.add(nuevo_lote)
    await db.commit()
    await db.refresh(nuevo_lote)
    return LoteResponse.model_validate(nuevo_lote)

@router.put("/{lote_id}", response_model=LoteResponse, summary="Actualizar lote")
async def actualizar_lote(
    lote_id: int,
    body: LoteUpdate,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Actualiza un lote existente."""
    result = await db.execute(select(Lote).where(Lote.Id == lote_id))
    lote = result.scalar_one_or_none()
    if not lote:
        raise HTTPException(status_code=404, detail="Lote no encontrado")
    
    # Actualizar campos
    if body.proveedor_id is not None:
        lote.Proveedor_Id = body.proveedor_id
    
    if body.numero_lote is not None:
        lote.Numero_Lote = body.numero_lote
    
    def _parse_date(value):
        if isinstance(value, date):
            return value
        return datetime.strptime(value, "%Y-%m-%d").date()

    if body.fecha_fabricacion is not None:
        try:
            lote.Fecha_Fabricacion = _parse_date(body.fecha_fabricacion)
        except (ValueError, TypeError):
            raise HTTPException(status_code=400, detail="Formato de fecha inválido")
    
    if body.fecha_caducidad is not None:
        try:
            lote.Fecha_Caducidad = _parse_date(body.fecha_caducidad)
        except (ValueError, TypeError):
            raise HTTPException(status_code=400, detail="Formato de fecha inválido")
    
    if body.cantidad_inicial is not None and body.cantidad_inicial > 0:
        lote.Cantidad_Inicial = body.cantidad_inicial
    
    if body.cantidad_actual is not None and body.cantidad_actual >= 0:
        lote.Cantidad_Actual = body.cantidad_actual
    
    if body.observaciones is not None:
        lote.Observaciones = body.observaciones
    
    if body.estado_lote is not None:
        if body.estado_lote not in ["Disponible", "Vencido"]:
            raise HTTPException(status_code=400, detail="Estado inválido. Use: 'Disponible' o 'Vencido'")
        lote.Estado_Lote = body.estado_lote
    
    lote.Fecha_Actualizacion = datetime.now(timezone.utc)
    await db.commit()
    await db.refresh(lote)
    return LoteResponse.model_validate(lote)

@router.delete("/{lote_id}", status_code=status.HTTP_204_NO_CONTENT, summary="Eliminar lote (lógico)")
async def eliminar_lote(
    lote_id: int,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Marca el lote como vencido (borrado lógico)."""
    result = await db.execute(select(Lote).where(Lote.Id == lote_id))
    lote = result.scalar_one_or_none()
    if not lote:
        raise HTTPException(status_code=404, detail="Lote no encontrado")
    
    lote.Estado_Lote = "Vencido"
    lote.Fecha_Actualizacion = datetime.now(timezone.utc)
    await db.commit()
    return None
