from datetime import datetime
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, and_, func
from pydantic import BaseModel
from typing import List, Optional

from app.config.database import get_db
from app.config.security import verify_credentials
from app.models.sql.bitacora import BitacoraInsert

router = APIRouter(prefix="/api/bitacora", tags=["Bitácora (Auditoría)"])

# ─── Pydantic Schemas ────────────────────────────────────────────────────────

class BitacoraResponse(BaseModel):
    ID: int
    Nombre_Tabla: str
    Usuario: str
    Operacion: str
    Descripcion: Optional[str]
    Fecha_Hora: datetime

    class Config:
        from_attributes = True

# ─── Bitácora (tabla: tbi_bitacora) - Endpoints de auditoría ───────────────────────────────────────

@router.get("/", response_model=List[BitacoraResponse], summary="Listar toda la bitácora")
async def listar_bitacora(
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Obtiene todos los registros de auditoría sin filtros, ordenados por fecha descendente."""
    result = await db.execute(select(BitacoraInsert).order_by(BitacoraInsert.Fecha_Hora.desc()))
    registros = result.scalars().all()
    return registros

@router.get("/tabla/{nombre_tabla}", response_model=List[BitacoraResponse], summary="Filtrar por tabla")
async def filtrar_por_tabla(
    nombre_tabla: str,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Obtiene registros de una tabla específica."""
    result = await db.execute(
        select(BitacoraInsert)
        .where(BitacoraInsert.Nombre_Tabla == nombre_tabla)
        .order_by(BitacoraInsert.Fecha_Hora.desc())
    )
    registros = result.scalars().all()
    return registros

@router.get("/usuario/{usuario}", response_model=List[BitacoraResponse], summary="Filtrar por usuario")
async def filtrar_por_usuario(
    usuario: str,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Obtiene registros de un usuario específico."""
    result = await db.execute(
        select(BitacoraInsert)
        .where(BitacoraInsert.Usuario == usuario)
        .order_by(BitacoraInsert.Fecha_Hora.desc())
    )
    registros = result.scalars().all()
    return registros

@router.get("/operacion/{operacion}", response_model=List[BitacoraResponse], summary="Filtrar por operación")
async def filtrar_por_operacion(
    operacion: str,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Obtiene registros de una operación específica (INSERT, UPDATE, DELETE, SELECT)."""
    result = await db.execute(
        select(BitacoraInsert)
        .where(BitacoraInsert.Operacion == operacion)
        .order_by(BitacoraInsert.Fecha_Hora.desc())
    )
    registros = result.scalars().all()
    return registros

@router.get("/fecha/{fecha_especifica}", response_model=List[BitacoraResponse], summary="Filtrar por fecha")
async def filtrar_por_fecha(
    fecha_especifica: str,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """
    Obtiene registros de una fecha específica.
    
    Formato: YYYY-MM-DD
    """
    try:
        fecha_obj = datetime.strptime(fecha_especifica, "%Y-%m-%d")
        fecha_fin = fecha_obj.replace(hour=23, minute=59, second=59)
    except ValueError:
        raise HTTPException(status_code=400, detail="Formato de fecha inválido. Use YYYY-MM-DD")
    
    result = await db.execute(
        select(BitacoraInsert)
        .where(
            (BitacoraInsert.Fecha_Hora >= fecha_obj) &
            (BitacoraInsert.Fecha_Hora <= fecha_fin)
        )
        .order_by(BitacoraInsert.Fecha_Hora.desc())
    )
    registros = result.scalars().all()
    return registros

@router.get("/filtro/avanzado", response_model=List[BitacoraResponse], summary="Filtro avanzado")
async def filtro_avanzado(
    tabla: Optional[str] = Query(None, description="Nombre de tabla"),
    usuario: Optional[str] = Query(None, description="Usuario que realizó la operación"),
    operacion: Optional[str] = Query(None, description="Tipo de operación"),
    fecha: Optional[str] = Query(None, description="Fecha (YYYY-MM-DD)"),
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """
    Filtro avanzado combinando múltiples criterios.
    
    Parámetros opcionales:
    - tabla: Nombre de la tabla afectada
    - usuario: Usuario que realizó la operación
    - operacion: Tipo de operación (INSERT, UPDATE, DELETE, SELECT)
    - fecha: Fecha específica (YYYY-MM-DD)
    """
    filters = []
    
    if tabla:
        filters.append(BitacoraInsert.Nombre_Tabla == tabla)
    if usuario:
        filters.append(BitacoraInsert.Usuario == usuario)
    if operacion:
        filters.append(BitacoraInsert.Operacion == operacion)
    if fecha:
        try:
            fecha_obj = datetime.strptime(fecha, "%Y-%m-%d")
            fecha_fin = fecha_obj.replace(hour=23, minute=59, second=59)
            filters.append(
                (BitacoraInsert.Fecha_Hora >= fecha_obj) &
                (BitacoraInsert.Fecha_Hora <= fecha_fin)
            )
        except ValueError:
            raise HTTPException(status_code=400, detail="Formato de fecha inválido. Use YYYY-MM-DD")
    
    query = select(BitacoraInsert)
    if filters:
        query = query.where(and_(*filters))
    
    query = query.order_by(BitacoraInsert.Fecha_Hora.desc())
    result = await db.execute(query)
    registros = result.scalars().all()
    return registros

@router.get("/estadisticas", summary="Estadísticas de auditoría")
async def estadisticas_bitacora(
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """Obtiene estadísticas generales de la bitácora."""
    
    # Total de registros
    result = await db.execute(select(func.count(BitacoraInsert.ID)))
    total_registros = result.scalar() or 0
    
    # Usuarios únicos
    result = await db.execute(select(BitacoraInsert.Usuario).distinct())
    usuarios_unicos = len(result.scalars().all())
    
    # Tablas accedidas
    result = await db.execute(select(BitacoraInsert.Nombre_Tabla).distinct())
    tablas_accedidas = result.scalars().all()
    
    # Operaciones registradas
    result = await db.execute(select(BitacoraInsert.Operacion).distinct())
    operaciones_registradas = result.scalars().all()
    
    return {
        "total_registros": total_registros,
        "usuarios_unicos": usuarios_unicos,
        "tablas_accedidas": list(set(tablas_accedidas)),
        "operaciones_registradas": list(set(operaciones_registradas))
    }

# ─── Nota: No hay endpoints POST, PUT, DELETE
# La bitácora es de SOLO LECTURA para garantizar integridad de auditoría
