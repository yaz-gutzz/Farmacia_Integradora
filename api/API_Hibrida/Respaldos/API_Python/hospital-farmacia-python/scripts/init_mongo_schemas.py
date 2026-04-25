import asyncio
import os
from dotenv import load_dotenv
from motor.motor_asyncio import AsyncIOMotorClient

load_dotenv()

async def init_mongo():
    client = AsyncIOMotorClient(os.getenv("MONGO_URI"))
    db = client["hospital_farmacia"]

    # 1. Schema: detalle_compra
    schema_detalle_compra = {
        "$jsonSchema": {
            "bsonType": "object",
            "required": ["folio_compra", "fecha", "proveedor", "medicamentos"],
            "properties": {
                "folio_compra": {"bsonType": "string"},
                "fecha": {"bsonType": "date"},
                "proveedor": {
                    "bsonType": "object",
                    "required": ["nombre"],
                    "properties": {"nombre": {"bsonType": "string"}}
                },
                "medicamentos": {
                    "bsonType": "array",
                    "items": {
                        "bsonType": "object",
                        "required": ["id_medicamento", "nombre", "cantidad", "concentracion", "forma_farmaceutica"],
                        "properties": {
                            "id_medicamento": {"bsonType": "int"},
                            "nombre": {"bsonType": "string"},
                            "cantidad": {"bsonType": "int", "minimum": 0},
                            "concentracion": {"bsonType": "string"},
                            "forma_farmaceutica": {"bsonType": "string"}
                        }
                    }
                }
            }
        }
    }

    # 2. Schema: inventario_medicamento
    schema_inventario = {
        "$jsonSchema": {
            "bsonType": "object",
            "required": ["id_medicamento", "nombre", "stock_actual", "concentracion", "forma_farmaceutica"],
            "properties": {
                "id_medicamento": {"bsonType": "int"},
                "nombre": {"bsonType": "string"},
                "stock_actual": {"bsonType": "int", "minimum": 0},
                "concentracion": {"bsonType": "string"},
                "forma_farmaceutica": {"bsonType": "string"},
                "movimientos": {
                    "bsonType": "array",
                    "items": {
                        "bsonType": "object",
                        "required": ["tipo", "fecha", "cantidad"],
                        "properties": {
                            "tipo": {"bsonType": "string"},
                            "fecha": {"bsonType": "date"},
                            "cantidad": {"bsonType": "int", "minimum": 0},
                            "referencia": {"bsonType": "string"},
                            "motivo": {"bsonType": "string"}
                        }
                    }
                }
            }
        }
    }

    # 3. Schema: subrogacion_medicamentos
    schema_subrogacion = {
        "$jsonSchema": {
            "bsonType": "object",
            "required": [
                "folio_subrogacion", "fecha_solicitud", "estatus", 
                "motivo_subrogacion", "receta", "paciente", "medico", "medicamentos"
            ],
            "properties": {
                "folio_subrogacion": {"bsonType": "string"},
                "fecha_solicitud": {"bsonType": "date"},
                "estatus": {"enum": ["Pendiente", "Aprobado", "Rechazado"]},
                "motivo_subrogacion": {"bsonType": "string"},
                "receta": {
                    "bsonType": "object",
                    "required": ["id_receta", "folio"],
                    "properties": {
                        "id_receta": {"bsonType": "int"},
                        "folio": {"bsonType": "string"}
                    }
                },
                "paciente": {
                    "bsonType": "object",
                    "required": ["id_paciente", "nombre", "diagnostico"],
                    "properties": {
                        "id_paciente": {"bsonType": "int"},
                        "nombre": {"bsonType": "string"},
                        "diagnostico": {"bsonType": "string"}
                    }
                },
                "medico": {
                    "bsonType": "object",
                    "required": ["nombre", "especialidad"],
                    "properties": {
                        "nombre": {"bsonType": "string"},
                        "especialidad": {"bsonType": "string"}
                    }
                },
                "medicamentos": {
                    "bsonType": "array",
                    "items": {
                        "bsonType": "object",
                        "required": [
                            "id_medicamento", "nombre", "cantidad", 
                            "dosis", "costo", "concentracion", "forma_farmaceutica"
                        ],
                        "properties": {
                            "id_medicamento": {"bsonType": "int"},
                            "nombre": {"bsonType": "string"},
                            "cantidad": {"bsonType": "int", "minimum": 0},
                            "dosis": {"bsonType": "string"},
                            "costo": {"bsonType": "double", "minimum": 0},
                            "concentracion": {"bsonType": "string"},
                            "forma_farmaceutica": {"bsonType": "string"}
                        }
                    }
                }
            }
        }
    }

    # 4. Schema: dispensaciones
    schema_dispensaciones = {
        "$jsonSchema": {
            "bsonType": "object",
            "required": ["id_receta", "id_paciente", "fecha", "status_final", "dispensados"],
            "properties": {
                "id_receta": {"bsonType": "int"},
                "id_paciente": {"bsonType": "int"},
                "fecha": {"bsonType": "date"},
                "status_final": {"bsonType": "string"},
                "dispensados": {
                    "bsonType": "array",
                    "items": {
                        "bsonType": "object",
                        "required": ["id_medicamento", "nombre_medicamento", "cantidad_surtida", "concentracion", "forma_farmaceutica"],
                        "properties": {
                            "id_medicamento": {"bsonType": "int"},
                            "nombre_medicamento": {"bsonType": "string"},
                            "cantidad_surtida": {"bsonType": "int", "minimum": 0},
                            "concentracion": {"bsonType": "string"},
                            "forma_farmaceutica": {"bsonType": "string"}
                        }
                    }
                },
                "faltantes": {
                    "bsonType": "array",
                    "items": {
                        "bsonType": "object",
                        "required": ["id_medicamento", "nombre_medicamento", "cantidad_pendiente", "concentracion", "forma_farmaceutica"],
                        "properties": {
                            "id_medicamento": {"bsonType": "int"},
                            "nombre_medicamento": {"bsonType": "string"},
                            "cantidad_pendiente": {"bsonType": "int", "minimum": 0},
                            "concentracion": {"bsonType": "string"},
                            "forma_farmaceutica": {"bsonType": "string"}
                        }
                    }
                }
            }
        }
    }

    collections = {
        "detalle_compra": schema_detalle_compra,
        "inventario_medicamento": schema_inventario,
        "subrogacion_medicamentos": schema_subrogacion,
        "dispensaciones": schema_dispensaciones
    }

    for name, schema in collections.items():
        try:
            await db.create_collection(name, validator=schema)
            print(f"✅ Colección '{name}' creada con validación JSON Schema.")
        except Exception as e:
            try:
                await db.command("collMod", name, validator=schema)
                print(f"✅ Colección '{name}' actualizada con validación JSON Schema.")
            except Exception as e2:
                print(f"❌ Error al configurar '{name}': {e2}")

    client.close()

if __name__ == "__main__":
    asyncio.run(init_mongo())
