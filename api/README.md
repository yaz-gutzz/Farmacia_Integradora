# API REST - Código Fuente y Documentación

API REST que implementa todos los servicios del Departamento de Farmacia. Construida con FastAPI y conecta las operaciones de medicamentos, inventarios, compras, dispensaciones y reportes de un hospital de tercer nivel.

## Estructura de la API

```
api/
├── main.py                      # Punto de entrada FastAPI
├── models/                      # Modelos de datos Pydantic
│   ├── paciente.py
│   ├── medicamento.py
│   ├── compra.py
│   └── inventario.py
├── routes/                      # Endpoints de la API
│   ├── auth.py                 # Autenticación JWT
│   ├── pacientes.py            # Gestión de pacientes
│   ├── medicamentos.py         # Gestión de medicamentos
│   ├── compras.py              # Gestión de compras
│   └── inventario.py           # Control de inventario
├── schemas/                     # Esquemas de validación
├── utils/                       # Funciones auxiliares
├── requirements.txt             # Dependencias Python
└── config.py                    # Configuración de la API
```

## Tecnologías

- **Framework:** FastAPI
- **Servidor:** Uvicorn
- **ORM:** SQLAlchemy (MySQL)
- **Driver NoSQL:** PyMongo (MongoDB)
- **Autenticación:** JWT
- **Documentación:** Swagger/OpenAPI

## Instalación Local

```bash
# 1. Entorno virtual
python -m venv venv
source venv/bin/activate

# 2. Instalar dependencias
pip install -r requirements.txt

# 3. Ejecutar API
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

## Acceso a Documentación

- **Swagger UI:** http://localhost:8000/docs
- **ReDoc:** http://localhost:8000/redoc
- **OpenAPI JSON:** http://localhost:8000/openapi.json

---

**Despliegue Local:** Abril 2026
