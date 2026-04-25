from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, update, delete
from pydantic import BaseModel
from typing import List, Optional
from datetime import datetime

from app.config.database import get_db
from app.config.security import verify_credentials
from app.models.sql.medicamento import Medicamento

router = APIRouter(prefix="/api/medicamentos", tags=["Medicamentos (CRUD)"])

# ─── Pydantic Schemas ────────────────────────────────────────────────────────

class MedicamentoBase(BaseModel):
    Nombre: str
    Nombre_Cientifico: str = ""
    Nombre_Comun: str = ""
    Principio_Activo: str = ""
    Concentracion: str = ""
    Forma_Farmaceutica: str = ""
    Via_Administracion: str = ""
    Tipo_Medicamento: str # "normal", "controlado", "alto_costo"
    Estatus: int = 1

class MedicamentoCreate(MedicamentoBase):
    pass

class MedicamentoUpdate(BaseModel):
    Nombre: Optional[str] = None
    Nombre_Cientifico: Optional[str] = None
    Nombre_Comun: Optional[str] = None
    Principio_Activo: Optional[str] = None
    Concentracion: Optional[str] = None
    Forma_Farmaceutica: Optional[str] = None
    Via_Administracion: Optional[str] = None
    Tipo_Medicamento: Optional[str] = None
    Estatus: Optional[int] = None

class MedicamentoResponse(BaseModel):
    Id: int
    Nombre: str
    Nombre_Cientifico: str
    Nombre_Comun: str
    Principio_Activo: str
    Concentracion: str
    Forma_Farmaceutica: str
    Via_Administracion: str
    Tipo_Medicamento: str
    Fecha_Registro: datetime
    Estatus: int

    class Config:
        from_attributes = True

# ─── Endpoints CRUD ─────────────────────────────────────────────────────────

@router.get("/", response_model=List[MedicamentoResponse], summary="Listar todos los medicamentos")
async def listar_medicamentos(
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    result = await db.execute(select(Medicamento))
    medicamentos = result.scalars().all()
    
    # Convertir bit(1) a int para Pydantic
    res = []
    for m in medicamentos:
        estatus_val = m.Estatus
        if isinstance(estatus_val, bytes):
            estatus_val = int.from_bytes(estatus_val, "big")
        
        res.append(MedicamentoResponse(
            Id=m.Id,
            Nombre=m.Nombre,
            Nombre_Cientifico=m.Nombre_Cientifico,
            Nombre_Comun=m.Nombre_Comun,
            Principio_Activo=m.Principio_Activo,
            Concentracion=m.Concentracion,
            Forma_Farmaceutica=m.Forma_Farmaceutica,
            Via_Administracion=m.Via_Administracion,
            Tipo_Medicamento=m.Tipo_Medicamento,
            Fecha_Registro=m.Fecha_Registro,
            Estatus=estatus_val
        ))
    return res

@router.get("/{id}", response_model=MedicamentoResponse, summary="Obtener un medicamento por ID")
async def obtener_medicamento(
    id: int,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    result = await db.execute(select(Medicamento).where(Medicamento.Id == id))
    medicamento = result.scalar_one_or_none()
    if not medicamento:
        raise HTTPException(status_code=404, detail="Medicamento no encontrado")
    
    estatus_val = medicamento.Estatus
    if isinstance(estatus_val, bytes):
        estatus_val = int.from_bytes(estatus_val, "big")
        
    return MedicamentoResponse(
        Id=medicamento.Id,
        Nombre=medicamento.Nombre,
        Nombre_Cientifico=medicamento.Nombre_Cientifico,
        Nombre_Comun=medicamento.Nombre_Comun,
        Principio_Activo=medicamento.Principio_Activo,
        Concentracion=medicamento.Concentracion,
        Forma_Farmaceutica=medicamento.Forma_Farmaceutica,
        Via_Administracion=medicamento.Via_Administracion,
        Tipo_Medicamento=medicamento.Tipo_Medicamento,
        Fecha_Registro=medicamento.Fecha_Registro,
        Estatus=estatus_val
    )

@router.post("/", response_model=MedicamentoResponse, status_code=status.HTTP_201_CREATED, summary="Crear un nuevo medicamento")
async def crear_medicamento(
    body: MedicamentoCreate,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    nuevo_med = Medicamento(
        **body.model_dump()
    )
    db.add(nuevo_med)
    await db.commit()
    await db.refresh(nuevo_med)
    
    if isinstance(nuevo_med.Estatus, bytes):
        nuevo_med.Estatus = int.from_bytes(nuevo_med.Estatus, "big")
        
    return nuevo_med

@router.put("/{id}", response_model=MedicamentoResponse, summary="Actualizar un medicamento existente")
async def actualizar_medicamento(
    id: int,
    body: MedicamentoUpdate,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    result = await db.execute(select(Medicamento).where(Medicamento.Id == id))
    medicamento = result.scalar_one_or_none()
    if not medicamento:
        raise HTTPException(status_code=404, detail="Medicamento no encontrado")
    
    update_data = body.model_dump(exclude_unset=True)
    for key, value in update_data.items():
        setattr(medicamento, key, value)
    
    await db.commit()
    await db.refresh(medicamento)

    if isinstance(medicamento.Estatus, bytes):
        medicamento.Estatus = int.from_bytes(medicamento.Estatus, "big")

    return medicamento

@router.delete("/{id}", summary="Eliminar un medicamento")
async def eliminar_medicamento(
    id: int,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    result = await db.execute(select(Medicamento).where(Medicamento.Id == id))
    medicamento = result.scalar_one_or_none()
    if not medicamento:
        raise HTTPException(status_code=404, detail="Medicamento no encontrado")
    
    await db.delete(medicamento)
    await db.commit()
    return {"status": "success", "message": f"Medicamento {id} eliminado correctamente"}
