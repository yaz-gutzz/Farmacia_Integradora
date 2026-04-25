#!/usr/bin/env python3
"""
Script para ejecutar el stored procedure maestro sp_poblar_datos_completo
en la base de datos MySQL.
"""

import asyncio
import os
from dotenv import load_dotenv
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy import text

# Cargar variables de entorno
load_dotenv()

# Configuración de la base de datos
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = int(os.getenv("DB_PORT", "3307"))
DB_USER = os.getenv("DB_USER", "root")
DB_PASSWORD = os.getenv("DB_PASSWORD", "")
DB_NAME = os.getenv("DB_NAME", "hospital_farmacia")

# URL de conexión async
DATABASE_URL = f"mysql+aiomysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

async def ejecutar_sp_maestro(medicamentos: int, lotes_por_medicamento: int, inventario_por_lote: int):
    """
    Ejecuta el stored procedure maestro para poblar datos.
    """
    engine = create_async_engine(DATABASE_URL, echo=True)

    try:
        async with AsyncSession(engine) as session:
            print("🔄 Ejecutando stored procedure maestro..."            print(f"📊 Parámetros: {medicamentos} medicamentos, {lotes_por_medicamento} lotes/med, {inventario_por_lote} inv/lote")

            # Ejecutar el stored procedure
            result = await session.execute(
                text("CALL sp_poblar_datos_completo(:medicamentos, :lotes, :inventario)"),
                {
                    "medicamentos": medicamentos,
                    "lotes": lotes_por_medicamento,
                    "inventario": inventario_por_lote
                }
            )

            # Obtener mensaje del procedure
            mensaje_result = result.fetchone()
            mensaje = mensaje_result[0] if mensaje_result else "Procedure ejecutado"

            await session.commit()

            print("✅ Stored procedure ejecutado exitosamente!"            print(f"📝 Mensaje: {mensaje}")

            # Calcular totales esperados
            total_medicamentos = medicamentos
            total_lotes = medicamentos * lotes_por_medicamento
            total_inventario = medicamentos * lotes_por_medicamento * inventario_por_lote

            print("
📊 Resumen esperado:"            print(f"   • Medicamentos: {total_medicamentos}")
            print(f"   • Lotes: {total_lotes}")
            print(f"   • Registros de inventario: {total_inventario}")

    except Exception as e:
        print(f"❌ Error al ejecutar stored procedure: {e}")
        raise
    finally:
        await engine.dispose()

async def verificar_datos():
    """
    Verifica que los datos se hayan insertado correctamente.
    """
    engine = create_async_engine(DATABASE_URL, echo=False)

    try:
        async with AsyncSession(engine) as session:
            print("\n🔍 Verificando datos insertados...")

            # Contar medicamentos
            result = await session.execute(text("SELECT COUNT(*) FROM tbd_ph_medicamentos"))
            total_med = result.scalar()
            print(f"   • Medicamentos: {total_med}")

            # Contar lotes
            result = await session.execute(text("SELECT COUNT(*) FROM tbd_ph_lotes_medicamentos"))
            total_lotes = result.scalar()
            print(f"   • Lotes: {total_lotes}")

            # Contar inventario
            result = await session.execute(text("SELECT COUNT(*) FROM tbd_ph_inventario_medicamentos"))
            total_inv = result.scalar()
            print(f"   • Inventario: {total_inv}")

            # Stock total
            result = await session.execute(text("SELECT SUM(Cantidad) FROM tbd_ph_inventario_medicamentos"))
            stock_total = result.scalar() or 0
            print(f"   • Stock total: {stock_total}")

    except Exception as e:
        print(f"❌ Error al verificar datos: {e}")
    finally:
        await engine.dispose()

async def main():
    """
    Función principal del script.
    """
    print("🏥 HOSPITAL FARMACIA - Stored Procedure Maestro")
    print("=" * 50)

    # Parámetros de ejemplo
    medicamentos = 5      # 5 medicamentos
    lotes = 2            # 2 lotes por medicamento
    inventario = 3       # 3 registros de inventario por lote

    print(f"Parámetros de prueba: {medicamentos} medicamentos, {lotes} lotes/med, {inventario} inv/lote")

    try:
        # Ejecutar stored procedure
        await ejecutar_sp_maestro(medicamentos, lotes, inventario)

        # Verificar resultados
        await verificar_datos()

        print("\n✅ Script ejecutado exitosamente!")

    except Exception as e:
        print(f"\n❌ Error en el script: {e}")
        return 1

    return 0

if __name__ == "__main__":
    exit_code = asyncio.run(main())