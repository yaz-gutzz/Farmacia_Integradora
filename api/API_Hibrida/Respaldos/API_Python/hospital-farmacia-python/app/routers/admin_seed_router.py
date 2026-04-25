from datetime import datetime, timezone
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import text
from pydantic import BaseModel, Field
from typing import Optional

from app.config.database import get_db
from app.config.security import verify_credentials


# ─────────────────────────────────────────────
# ROUTER
# ─────────────────────────────────────────────
router = APIRouter(prefix="/api/admin", tags=["Admin - Generación de Datos"])


# ─────────────────────────────────────────────
# SCHEMAS
# ─────────────────────────────────────────────

class PoblarDatosRequest(BaseModel):
    medicamentos: int = Field(..., gt=0, le=1000)
    lotes: int = Field(..., gt=0, le=5000)
    inventario: int = Field(..., gt=0, le=10000)


class InventarioControladoRequest(BaseModel):
    cantidad_medicamentos: int = Field(..., gt=0, le=5000)
    empresa: Optional[str] = None
    marca: Optional[str] = None
    cantidad_min: int = Field(1, gt=0)
    cantidad_max: int = Field(10, gt=0)
    fecha_inicio: str = "2024-01-01"
    fecha_fin: str = "2026-12-31"


class GenerarLotesMasivosRequest(BaseModel):
    cantidad_lotes: int = Field(..., gt=0, le=10000)
    estado_lote: Optional[str] = "disponible"
    cantidad_min: int = Field(10, gt=0)
    cantidad_max: int = Field(100, gt=0)
    fecha_inicio: str = "2024-01-01"
    fecha_fin: str = "2026-12-31"


class GenerarRecetasRequest(BaseModel):
    cantidad_recetas: int = Field(..., gt=0, le=5000)
    estado_receta: str = Field(default="Surtida")
    consumo_min: int = Field(1, gt=0)
    consumo_max: int = Field(5, gt=0)

class SimularRecetasConsumoRequest(BaseModel):
    cantidad_recetas: int = Field(..., gt=0, le=5000)
    estado_receta: str = "Surtida"
    consumo_min: int = Field(1, gt=0)
    consumo_max: int = Field(5, gt=0)


# ─────────────────────────────────────────────
# 1. POBLAR DATOS
# ─────────────────────────────────────────────
@router.post("/poblar-datos", status_code=status.HTTP_201_CREATED)
async def poblar_datos(
    body: PoblarDatosRequest,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    try:
        await db.execute(
            text("CALL sp_poblar_datos_completo(:med, :lot, :inv)"),
            {
                "med": body.medicamentos,
                "lot": body.lotes,
                "inv": body.inventario
            }
        )
        await db.commit()

        return {
            "status": "ok",
            "message": "Datos generados correctamente",
            "medicamentos": body.medicamentos,
            "lotes": body.medicamentos * body.lotes,
            "inventario": body.medicamentos * body.lotes * body.inventario,
            "fecha": datetime.now(timezone.utc)
        }

    except Exception as e:
        await db.rollback()
        raise HTTPException(status_code=500, detail=str(e))


# ─────────────────────────────────────────────
# 2. INVENTARIO CONTROLADO (CORREGIDO 6 PARAMS)
# ─────────────────────────────────────────────
@router.post("/inventario-controlado", status_code=status.HTTP_201_CREATED)
async def inventario_controlado(
    body: InventarioControladoRequest,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    try:
        await db.execute(
            text("""
                CALL sp_generar_inventario_controlado(
                    :cantidad,
                    :empresa,
                    :marca,
                    :min,
                    :max,
                    :fecha_inicio,
                    :fecha_fin
                )
            """),
            {
                "cantidad": body.cantidad_medicamentos,
                "empresa": body.empresa,
                "marca": body.marca,
                "min": body.cantidad_min,
                "max": body.cantidad_max,
                "fecha_inicio": body.fecha_inicio,
                "fecha_fin": body.fecha_fin
            }
        )

        await db.commit()

        return {
            "status": "ok",
            "message": "Inventario generado correctamente"
        }

    except Exception as e:
        await db.rollback()
        raise HTTPException(status_code=500, detail=str(e))

# ─────────────────────────────────────────────
# 3. LOTES MASIVOS (CORREGIDO 6 PARAMS)
# ─────────────────────────────────────────────
@router.post("/generar-lotes-masivos", status_code=status.HTTP_201_CREATED)
async def generar_lotes_masivos(
    body: GenerarLotesMasivosRequest,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    try:
        await db.execute(
            text("""
                CALL sp_generar_lotes_masivos(
                    :cant,
                    :estado,
                    :min,
                    :max,
                    :inicio,
                    :fin
                )
            """),
            {
                "cant": body.cantidad_lotes,
                "estado": body.estado_lote,
                "min": body.cantidad_min,
                "max": body.cantidad_max,
                "inicio": body.fecha_inicio,
                "fin": body.fecha_fin
            }
        )
        await db.commit()

        return {
            "status": "ok",
            "message": "Lotes generados correctamente"
        }

    except Exception as e:
        await db.rollback()
        raise HTTPException(status_code=500, detail=str(e))


# ─────────────────────────────────────────────
# 4. RECETAS
# ─────────────────────────────────────────────
@router.post("/generar-recetas", status_code=status.HTTP_201_CREATED)
async def generar_recetas(
    body: GenerarRecetasRequest,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    try:
        await db.execute(
    text("CALL sp_simular_recetas_y_consumo(:c, :e, :min, :max)"),
    {
        "c": body.cantidad_recetas,
        "e": body.estado_receta,
        "min": body.consumo_min,
        "max": body.consumo_max
    }
)
        await db.commit()

        return {"status": "ok", "message": "Recetas generadas"}

    except Exception as e:
        await db.rollback()
        raise HTTPException(status_code=500, detail=str(e))


# ─────────────────────────────────────────────
# 5. SIMULACIÓN CONSUMO (CORREGIDO)
# ─────────────────────────────────────────────
@router.post("/simular-recetas-consumo", status_code=status.HTTP_201_CREATED)
async def simular_recetas_consumo(
    body: SimularRecetasConsumoRequest,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    try:
        await db.execute(
            text("""
                CALL sp_simular_recetas_y_consumo(
                    :cant,
                    :estado,
                    :min,
                    :max
                )
            """),
            {
                "cant": body.cantidad_recetas,
                "estado": body.estado_receta,
                "min": body.consumo_min,
                "max": body.consumo_max
            }
        )
        await db.commit()

        return {"status": "ok", "message": "Simulación completada"}

    except Exception as e:
        await db.rollback()
        raise HTTPException(status_code=500, detail=str(e))


# ─────────────────────────────────────────────
# 6. ESTADÍSTICAS
# ─────────────────────────────────────────────
@router.get("/estadisticas")
async def estadisticas(
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    try:
        meds = (await db.execute(text("SELECT COUNT(*) FROM tbc_ph_medicamentos"))).scalar()
        lotes = (await db.execute(text("SELECT COUNT(*) FROM tbd_ph_lotes_medicamentos"))).scalar()
        inv = (await db.execute(text("SELECT SUM(Cantidad) FROM tbd_ph_inventario_medicamentos"))).scalar() or 0

        return {
            "medicamentos": meds,
            "lotes": lotes,
            "inventario": inv
        }

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


# ─────────────────────────────────────────────
# 7. LIMPIAR
# ─────────────────────────────────────────────
@router.post("/limpiar", status_code=status.HTTP_204_NO_CONTENT)
async def limpiar(
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    try:
        await db.execute(text("SET FOREIGN_KEY_CHECKS=0"))

        await db.execute(text("TRUNCATE TABLE tbd_ph_detalle_receta"))
        await db.execute(text("TRUNCATE TABLE tbb_ph_recetas_medicas"))
        await db.execute(text("TRUNCATE TABLE tbd_ph_lotes_medicamentos"))
        await db.execute(text("TRUNCATE TABLE tbd_ph_inventario_medicamentos"))
        await db.execute(text("TRUNCATE TABLE tbc_ph_medicamentos"))

        await db.execute(text("SET FOREIGN_KEY_CHECKS=1"))
        await db.commit()

    except Exception as e:
        await db.rollback()
        raise HTTPException(status_code=500, detail=str(e))