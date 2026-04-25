import asyncio
import os
from dotenv import load_dotenv
from motor.motor_asyncio import AsyncIOMotorClient

load_dotenv()

async def check_negatives():
    client = AsyncIOMotorClient(os.getenv("MONGO_URI"))
    db = client["hospital_farmacia"]
    
    collections = ["inventario_medicamento", "detalle_compra", "subrogacion_medicamentos", "dispensaciones"]
    
    for coll_name in collections:
        coll = db[coll_name]
        print(f"\n--- Checking collection: {coll_name} ---")
        
        if coll_name == "inventario_medicamento":
            cursor = coll.find({"stock_actual": {"$lt": 0}})
            async for doc in cursor:
                print(f"Negative stock found: ID {doc.get('id_medicamento')}, Stock: {doc.get('stock_actual')}")
            
            cursor = coll.find({"movimientos.cantidad": {"$lt": 0}})
            async for doc in cursor:
                print(f"Negative movement quantity found: ID {doc.get('id_medicamento')}")

        elif coll_name == "detalle_compra":
            cursor = coll.find({"medicamentos.cantidad": {"$lt": 0}})
            async for doc in cursor:
                print(f"Negative purchase quantity found: Folio {doc.get('folio_compra')}")

        elif coll_name == "subrogacion_medicamentos":
            cursor = coll.find({"medicamentos.cantidad": {"$lt": 0}})
            async for doc in cursor:
                print(f"Negative subrogación quantity found: Folio {doc.get('folio_subrogacion')}")

        elif coll_name == "dispensaciones":
            cursor = coll.find({"dispensados.cantidad_surtida": {"$lt": 0}})
            async for doc in cursor:
                print(f"Negative dispensación quantity found: Receta {doc.get('id_receta')}")

    client.close()

if __name__ == "__main__":
    asyncio.run(check_negatives())
