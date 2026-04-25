from sqlalchemy import select, update
from sqlalchemy.ext.asyncio import AsyncSession
from app.models.sql.lote import Lote

async def aplicar_fifo(db: AsyncSession, id_medicamento: int, cantidad_requerida: int):
    """
    Aplica lógica FIFO para descontar stock de los lotes más próximos a caducar.
    Retorna un dict con éxito, lotes usados y cantidad pendiente.
    """
    # 1. Obtener lotes disponibles ordenados por fecha de caducidad (FIFO)
    result = await db.execute(
        select(Lote)
        .where(
            Lote.Medicamento_Id == id_medicamento,
            Lote.Cantidad_Actual > 0,
            Lote.Estado_Lote == "disponible"
        )
        .order_by(Lote.Fecha_Caducidad)
    )
    lotes = result.scalars().all()

    cantidad_pendiente = cantidad_requerida
    lotes_usados = []

    # 2. Descontar de los lotes hasta donde alcance
    for lote in lotes:
        if cantidad_pendiente <= 0:
            break

        a_descontar = min(lote.Cantidad_Actual, cantidad_pendiente)
        cantidad_pendiente -= a_descontar

        lotes_usados.append({
            "id_lote": lote.Id,
            "cantidad_descontada": a_descontar
        })

        # 3. Actualizar el lote en MySQL
        await db.execute(
            update(Lote)
            .where(Lote.Id == lote.Id)
            .values(Cantidad_Actual=Lote.Cantidad_Actual - a_descontar)
        )

    await db.commit()

    descontado = cantidad_requerida - cantidad_pendiente
    return {
        "success": descontado > 0,
        "surtido_parcial": cantidad_pendiente > 0,
        "descontado": descontado,
        "pendiente": cantidad_pendiente,
        "lotes_usados": lotes_usados
    }
