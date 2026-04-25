from datetime import datetime, timezone
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, insert
from pydantic import BaseModel
from typing import List, Optional

from app.config.database import get_db
from app.config.security import verify_credentials
from app.models.sql.receta import RecetaMedica, DetalleReceta

router = APIRouter(prefix="/api/recetas", tags=["Recetas (Pruebas)"])

class MedicamentoDetalle(BaseModel):
    id_medicamento: int
    cantidad: int
    dosis: Optional[str] = "1 tableta"
    frecuencia: Optional[str] = "cada 8 horas"
    duracion: Optional[str] = "3 días"
    indicaciones: Optional[str] = "Tomar después de los alimentos"

class RecetaCreate(BaseModel):
    id_paciente: int
    id_personal_medico: int
    medicamentos: List[MedicamentoDetalle]

    model_config = {
        "json_schema_extra": {
            "examples": [{
                "id_paciente": 1,
                "id_personal_medico": 1,
                "medicamentos": [
                    {
                        "id_medicamento": 1, 
                        "cantidad": 3, 
                        "dosis": "1 tab",
                        "frecuencia": "cada 8 horas",
                        "duracion": "3 días",
                        "indicaciones": "Vía oral"
                    }
                ]
            }]
        }
    }

@router.post(
    "/",
    summary="Generar una nueva receta médica (Testing)",
    description="Crea una receta y sus detalles en MySQL para poder probar el flujo de dispensación."
)
async def crear_receta_test(
    body: RecetaCreate,
    db: AsyncSession = Depends(get_db),
    _: str = Depends(verify_credentials)
):
    try:
        # 1. Crear la cabecera de la receta
        nueva_receta = RecetaMedica(
            Paciente_Id=body.id_paciente,
            Personal_Medico_Id=body.id_personal_medico,
            Estado_Receta="Pendiente",
            Fecha_Emision=datetime.now(timezone.utc),
            Fecha_Registro=datetime.now(timezone.utc),
            Estatus=1
        )
        db.add(nueva_receta)
        await db.flush() # Obtener el ID de la receta

        # 2. Crear los detalles de los medicamentos
        for med in body.medicamentos:
            detalle = DetalleReceta(
                Receta_Id=nueva_receta.Id,
                Medicamento_Id=med.id_medicamento,
                Cantidad=med.cantidad,
                Dosis=med.dosis or "1 tableta",
                Frecuencia=med.frecuencia or "cada 8 horas",
                Duracion=med.duracion or "3 días",
                Indicaciones=med.indicaciones or "Sin indicaciones",
                Fecha_Registro=datetime.now(timezone.utc),
                Fecha_Actualizacion=datetime.now(timezone.utc) # <-- Añadido por seguridad
            )
            db.add(detalle)
        
        await db.commit()
        await db.refresh(nueva_receta)

        return {
            "status": "success",
            "message": "Receta creada para pruebas",
            "id_receta": nueva_receta.Id,
            "total_medicamentos": len(body.medicamentos)
        }
    except Exception as e:
        await db.rollback()
        raise HTTPException(status_code=500, detail=f"Error al crear receta: {str(e)}")
