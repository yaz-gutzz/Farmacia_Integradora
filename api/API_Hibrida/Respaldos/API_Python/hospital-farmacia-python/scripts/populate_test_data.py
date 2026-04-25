import asyncio
import os
import sys

# Agregar el directorio actual al path para importar app
sys.path.append(os.getcwd())

from datetime import datetime, timedelta
from sqlalchemy import select, update
from app.config.database import AsyncSessionLocal
from app.models.sql.medicamento import Medicamento
from app.models.sql.receta import RecetaMedica, DetalleReceta
from app.models.sql.inventario import InventarioMedicamento
from app.models.sql.lote import Lote

async def setup_test_data():
    async with AsyncSessionLocal() as session:
        # 1. Crear Medicamentos
        meds = [
            {"Nombre": "Paracetamol 500mg", "Concentracion": "500mg", "Forma_Farmaceutica": "Tableta", "Via_Administracion": "Oral", "Tipo_Medicamento": "normal"},
            {"Nombre": "Amoxicilina 250mg", "Concentracion": "250mg", "Forma_Farmaceutica": "Cápsula", "Via_Administracion": "Oral", "Tipo_Medicamento": "normal"},
            {"Nombre": "Insulina Glargina", "Concentracion": "100 UI/ml", "Forma_Farmaceutica": "Solución Inyectable", "Via_Administracion": "Subcutánea", "Tipo_Medicamento": "alto_costo"},
            {"Nombre": "Omeprazol 20mg", "Concentracion": "20mg", "Forma_Farmaceutica": "Cápsula", "Via_Administracion": "Oral", "Tipo_Medicamento": "normal"},
            {"Nombre": "Morfina Solución", "Concentracion": "10mg/ml", "Forma_Farmaceutica": "Solución", "Via_Administracion": "Intravenosa", "Tipo_Medicamento": "controlado"}
        ]
        
        created_meds = []
        for m_data in meds:
            # Check if exists
            q = await session.execute(select(Medicamento).where(Medicamento.Nombre == m_data["Nombre"]))
            existing = q.scalar_one_or_none()
            if not existing:
                new_med = Medicamento(**m_data, Estatus=1)
                session.add(new_med)
                await session.flush()
                created_meds.append(new_med)
            else:
                created_meds.append(existing)
        
        # 2. Crear Recetas para cada uno (Buscamos que sean nuevas para cada prueba)
        print("\n--- RESUMEN DE IDS PARA LAS PRUEBAS ---")
        for i, med in enumerate(created_meds):
            receta = RecetaMedica(
                Paciente_Id=1, # Usar paciente 1 que asumimos existe
                Personal_Medico_Id=1,
                Estado_Receta="Pendiente",
                Fecha_Emision=datetime.now(),
                Fecha_Registro=datetime.now(),
                Estatus=1
            )
            session.add(receta)
            await session.flush()
            
            detalle = DetalleReceta(
                Receta_Id=receta.Id,
                Medicamento_Id=med.Id,
                Cantidad=20 if i != 2 else 5, # Insulina pide 5
                Dosis="1 cada 8 horas",
                Fecha_Registro=datetime.now()
            )
            session.add(detalle)
            
            # 3. Preparar Inventario Base (MySQL)
            # Limpiar inventario previo para el medicamento
            await session.execute(update(InventarioMedicamento).where(InventarioMedicamento.Medicamento_Id == med.Id).values(Cantidad=0))
            await session.execute(update(Lote).where(Lote.Medicamento_Id == med.Id).values(Cantidad_Actual=0))

            if i == 0: # Paracetamol: Mucho stock
                session.add(InventarioMedicamento(Medicamento_Id=med.Id, Cantidad=100, Fecha_Registro=datetime.now()))
                session.add(Lote(Medicamento_Id=med.Id, Numero_Lote="LOT-PARA-001", Cantidad_Inicial=100, Cantidad_Actual=100, Fecha_Caducidad=datetime.now()+timedelta(days=365), Estado_Lote="disponible", Fecha_Registro=datetime.now()))
                print(f"OPCION {i+1} (Surtido Total): Receta ID {receta.Id} -> {med.Nombre}")

            elif i == 1: # Amoxicilina: Poco stock (solo 5 de 20 pedidas)
                session.add(InventarioMedicamento(Medicamento_Id=med.Id, Cantidad=5, Fecha_Registro=datetime.now()))
                session.add(Lote(Medicamento_Id=med.Id, Numero_Lote="LOT-AMOX-001", Cantidad_Inicial=5, Cantidad_Actual=5, Fecha_Caducidad=datetime.now()+timedelta(days=365), Estado_Lote="disponible", Fecha_Registro=datetime.now()))
                print(f"OPCION {i+1} (Surtido Parcial): Receta ID {receta.Id} -> {med.Nombre}")

            elif i == 2: # Insulina: 0 stock
                session.add(InventarioMedicamento(Medicamento_Id=med.Id, Cantidad=0, Fecha_Registro=datetime.now()))
                print(f"OPCION {i+1} (Sin Stock/Subrogación): Receta ID {receta.Id} -> {med.Nombre}")

            elif i == 3: # Omeprazol (2 lotes para FIFO)
                session.add(InventarioMedicamento(Medicamento_Id=med.Id, Cantidad=40, Fecha_Registro=datetime.now()))
                session.add(Lote(Medicamento_Id=med.Id, Numero_Lote="VENCE-PRONTO", Cantidad_Inicial=20, Cantidad_Actual=20, Fecha_Caducidad=datetime.now()+timedelta(days=30), Estado_Lote="disponible", Fecha_Registro=datetime.now()))
                session.add(Lote(Medicamento_Id=med.Id, Numero_Lote="VENCE-TARDE", Cantidad_Inicial=20, Cantidad_Actual=20, Fecha_Caducidad=datetime.now()+timedelta(days=700), Estado_Lote="disponible", Fecha_Registro=datetime.now()))
                print(f"OPCION {i+1} (FIFO 2 Lotes): Receta ID {receta.Id} -> {med.Nombre}")

            elif i == 4: # Morfina
                session.add(InventarioMedicamento(Medicamento_Id=med.Id, Cantidad=50, Fecha_Registro=datetime.now()))
                session.add(Lote(Medicamento_Id=med.Id, Numero_Lote="CONTROL-001", Cantidad_Inicial=50, Cantidad_Actual=50, Fecha_Caducidad=datetime.now()+timedelta(days=500), Estado_Lote="disponible", Fecha_Registro=datetime.now()))
                print(f"OPCION {i+1} (Controlado): Receta ID {receta.Id} -> {med.Nombre}")

        await session.commit()
        print("\n✅ Datos de prueba cargados correctamente en MySQL.")

if __name__ == "__main__":
    asyncio.run(setup_test_data())
