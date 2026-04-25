from fastapi import APIRouter, Depends, HTTPException
from motor.motor_asyncio import AsyncIOMotorDatabase
from datetime import datetime, timezone

from app.config.database import get_mongo
from app.config.security import verify_credentials


router = APIRouter(
    prefix="/api/mongo/dispensaciones",
    tags=["dispensaciones"]
)
@router.post("/generar-dispensacion", summary="Procedimiento: generar dispensación completa")
async def generar_dispensacion(
    id_receta: int,
    mongo: AsyncIOMotorDatabase = Depends(get_mongo),
    _: str = Depends(verify_credentials)
):
    receta = await mongo["recetas"].find_one({"id_receta": id_receta})

    if not receta:
        raise HTTPException(status_code=404, detail="Receta no encontrada")

    dispensados = []
    faltantes = []

    for med in receta.get("medicamentos", []):
        inventario = await mongo["inventario_medicamento"].find_one(
            {"id_medicamento": med["id_medicamento"]}
        )

        if not inventario or inventario["stock_actual"] < med["cantidad"]:
            faltantes.append({
                "id_medicamento": med["id_medicamento"],
                "nombre_medicamento": med["nombre"],
                "cantidad_pendiente": med["cantidad"],
                "motivo": "Stock insuficiente o no disponible"
            })
            continue

        # 🔥 Descontar stock
        await mongo["inventario_medicamento"].update_one(
            {"id_medicamento": med["id_medicamento"]},
            {
                "$inc": {"stock_actual": -med["cantidad"]},
                "$push": {
                    "movimientos": {
                        "cantidad": med["cantidad"],
                        "fecha": datetime.now(timezone.utc),
                        "motivo": "DISPENSACION",
                        "referencia": f"RECETA-{id_receta}",
                        "tipo": "SALIDA"
                    }
                }
            }
        )

        dispensados.append({
            "id_medicamento": med["id_medicamento"],
            "nombre_medicamento": med["nombre"],
            "cantidad_surtida": med["cantidad"]
        })

    # 🔥 determinar estado final
    if len(faltantes) == 0:
        status_final = "completa"
    elif len(dispensados) > 0:
        status_final = "parcial"
    else:
        status_final = "rechazada"

    doc = {
        "id_receta": id_receta,
        "fecha": datetime.now(timezone.utc),
        "dispensados": dispensados,
        "faltantes": faltantes,
        "status_final": status_final,
        "id_paciente": receta["paciente"]["id_paciente"]
    }

    result = await mongo["dispensaciones"].insert_one(doc)

    return {
        "_id": str(result.inserted_id),
        **doc
    }