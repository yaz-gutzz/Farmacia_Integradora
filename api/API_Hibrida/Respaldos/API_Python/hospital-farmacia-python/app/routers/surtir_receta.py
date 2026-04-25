from datetime import datetime, timezone
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import text
from pydantic import BaseModel, Field
from typing import Dict, Any

from app.config.database import get_db
from app.config.security import verify_credentials

router = APIRouter(prefix="/api/recetas", tags=["Recetas - Surtido"])

# ─── Schemas ────────────────────────────────────────────────────────────────

class SurtirRecetaRequest(BaseModel):
    receta_id: int = Field(..., gt=0)
    medicamento_id: int = Field(..., gt=0)
    cantidad: int = Field(..., gt=0)
    
    dosis: str = Field(..., description="Dosis del medicamento")
    frecuencia: str = Field(..., description="Frecuencia")
    duracion: str = Field(..., description="Duración del tratamiento")
    indicaciones: str = Field(..., description="Indicaciones médicas")
    
    model_config = {
    "json_schema_extra": {
        "examples": [{
            "receta_id": 1,
            "medicamento_id": 5,
            "cantidad": 10,
            "dosis": "1 tableta",
            "frecuencia": "cada 8 horas",
            "duracion": "5 dias",
            "indicaciones": "Tomar despues de alimentos"
        }]
    }
}

class SurtirRecetaResponse(BaseModel):
    status: str
    message: str
    timestamp: datetime

# ─── Endpoint para Surtir Receta ────────────────────────────────────────────

@router.post(
    "/surtir",
    response_model=SurtirRecetaResponse,
    status_code=status.HTTP_200_OK,
    summary="Surtir receta con medicamento"
)
async def surtir_receta(
    body: SurtirRecetaRequest,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """
    Ejecuta el stored procedure sp_surtir_receta para surtir una receta.
    
    El procedimiento:
    1. Valida existencia de la receta
    2. Valida existencia del medicamento
    3. Busca lote disponible con stock suficiente
    4. Descuenta el inventario del lote
    5. Inserta en tabla detalle_receta
    6. Usa transacciones (los SIGNAL del SP los capturamos como excepciones)
    
    Errores posibles (capturados como HTTPException):
    - No hay lote disponible
    - Stock insuficiente
    - Receta no encontrada
    - Medicamento no encontrado
    """
    
    try:
        # Ejecutar stored procedure
        # El SP NO devuelve filas (solo hace INSERT y UPDATE)
        # por eso NO usamos fetchone() ni fetchall()
        await db.execute(
    text("""
        CALL sp_surtir_receta(
            :receta_id,
            :medicamento_id,
            :cantidad,
            :dosis,
            :frecuencia,
            :duracion,
            :indicaciones
        )
    """),
    {
        "receta_id": body.receta_id,
        "medicamento_id": body.medicamento_id,
        "cantidad": body.cantidad,
        "dosis": body.dosis,
        "frecuencia": body.frecuencia,
        "duracion": body.duracion,
        "indicaciones": body.indicaciones
    }
)
        
        # Confirmar transacción si todo salió bien
        await db.commit()
        
        return SurtirRecetaResponse(
            status="ok",
            message="Receta surtida correctamente",
            timestamp=datetime.now(timezone.utc)
        )
    
    except Exception as e:
        # Revertir cambios en caso de error
        await db.rollback()
        
        # Parsear mensaje de error del MySQL (SIGNAL)
        error_message = str(e)
        
        # Los SIGNAL del SP contienen estos mensajes:
        # - "No hay lote disponible" 
        # - "Stock insuficiente"
        # - "Receta no encontrada"
        # - "Medicamento no encontrado"
        
        # Capturar errores específicos del SP
        if "No hay lote disponible" in error_message:
            raise HTTPException(
                status_code=400,
                detail={
                    "status": "error",
                    "message": "No hay lote disponible para este medicamento"
                }
            )
        elif "Stock insuficiente" in error_message:
            raise HTTPException(
                status_code=400,
                detail={
                    "status": "error",
                    "message": "Stock insuficiente en los lotes disponibles"
                }
            )
        elif "Receta no encontrada" in error_message:
            raise HTTPException(
                status_code=404,
                detail={
                    "status": "error",
                    "message": "La receta especificada no existe"
                }
            )
        elif "Medicamento no encontrado" in error_message:
            raise HTTPException(
                status_code=404,
                detail={
                    "status": "error",
                    "message": "El medicamento especificado no existe"
                }
            )
        else:
            # Error genérico
            raise HTTPException(
                status_code=500,
                detail={
                    "status": "error",
                    "message": f"Error al surtir receta: {error_message}"
                }
            )

# ─── Endpoint para Surtir Múltiples Medicamentos ────────────────────────────

class SurtirRecetaMultipleRequest(BaseModel):
    receta_id: int = Field(..., gt=0, description="ID de la receta")
    medicamentos: list[Dict[str, int]] = Field(
        ...,
        description="Lista de medicamentos con cantidad"
    )
    
    model_config = {
        "json_schema_extra": {
            "examples": [{
                "receta_id": 1,
                "medicamentos": [
                    {"medicamento_id": 5, "cantidad": 10},
                    {"medicamento_id": 7, "cantidad": 20},
                    {"medicamento_id": 10, "cantidad": 15}
                ]
            }]
        }
    }

class SurtirRecetaMultipleResponse(BaseModel):
    status: str
    message: str
    medicamentos_surtidos: int
    medicamentos_fallidos: int
    errores: list[Dict[str, Any]] = []
    timestamp: datetime

@router.post(
    "/surtir-multiples",
    response_model=SurtirRecetaMultipleResponse,
    status_code=status.HTTP_200_OK,
    summary="Surtir múltiples medicamentos en una receta"
)
async def surtir_receta_multiples(
    body: SurtirRecetaMultipleRequest,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    """
    Surtir múltiples medicamentos para una receta de forma transaccional.
    
    Si un medicamento falla, se revierte la transacción completa.
    """
    
    medicamentos_surtidos = 0
    medicamentos_fallidos = 0
    errores = []
    
    try:
        # Ejecutar cada medicamento
        for med in body.medicamentos:
            medicamento_id = med.get("medicamento_id")
            cantidad = med.get("cantidad")
            
            if not medicamento_id or not cantidad:
                medicamentos_fallidos += 1
                errores.append({
                    "medicamento_id": medicamento_id,
                    "error": "medicamento_id y cantidad requeridos"
                })
                continue
            
            try:
                # Ejecutar SP para cada medicamento
                await db.execute(
                    text("CALL sp_surtir_receta(:receta_id, :medicamento_id, :cantidad)"),
                    {
                        "receta_id": body.receta_id,
                        "medicamento_id": medicamento_id,
                        "cantidad": cantidad
                    }
                )
                medicamentos_surtidos += 1
                
            except Exception as e:
                # Si falla uno, revertimos TODO
                await db.rollback()
                error_message = str(e)
                medicamentos_fallidos += 1
                errores.append({
                    "medicamento_id": medicamento_id,
                    "error": error_message
                })
        
        # Si hubo errores, no confirmar
        if errores:
            await db.rollback()
            raise HTTPException(
                status_code=400,
                detail={
                    "status": "error",
                    "message": "Error al surtir uno o más medicamentos",
                    "medicamentos_surtidos": medicamentos_surtidos,
                    "medicamentos_fallidos": medicamentos_fallidos,
                    "errores": errores
                }
            )
        
        # Confirmar transacción
        await db.commit()
        
        return SurtirRecetaMultipleResponse(
            status="ok",
            message="Todos los medicamentos fueron surtidos correctamente",
            medicamentos_surtidos=medicamentos_surtidos,
            medicamentos_fallidos=0,
            errores=[],
            timestamp=datetime.now(timezone.utc)
        )
        
    except HTTPException:
        raise
    except Exception as e:
        await db.rollback()
        raise HTTPException(
            status_code=500,
            detail={
                "status": "error",
                "message": f"Error al surtir receta: {str(e)}"
            }
        )
