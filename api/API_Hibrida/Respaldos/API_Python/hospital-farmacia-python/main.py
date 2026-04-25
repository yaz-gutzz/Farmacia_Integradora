from fastapi import FastAPI
from fastapi.security import HTTPBasic
from fastapi.middleware.cors import CORSMiddleware

from app.routers import (
    dispensacion, kardex, compras, subrogaciones, recetas, medicamentos,
    lotes_crud, inventario_crud, detalle_receta_crud, bitacora_router,
    mongo_detalle_compra, mongo_inventario, mongo_subrogaciones,
    mongo_dispensaciones, mongo_bitacora, admin_seed_router, surtir_receta
)
from app.utils.audit_middleware import AuditMiddleware

app = FastAPI(
    title="Hospital Pharmacy API 🏥",
    description=(
        "API de gestión de farmacia hospitalaria con arquitectura híbrida **MySQL + MongoDB**.\n\n"
        "## Seguridad\n"
        "Todos los endpoints requieren autenticación **HTTP Basic Auth**.\n"
        "- **Usuario**: `admin`\n"
        "- **Contraseña**: `12345\n\n"
        "## Flujo Principal\n"
        "1. **Compras** → Registrar lotes en MySQL\n"
        "2. **Dispensación** → Aplicar FIFO y guardar ticket en MongoDB\n"
        "3. **Kardex** → Consultar historial de movimientos en MongoDB\n"
        "4. **Subrogaciones** → Gestionar medicamentos con stock insuficiente"
    ),
    version="2.0.0",
    docs_url="/docs",
    redoc_url="/redoc",
)

# Configurar CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], # Permite todos los orígenes
    allow_credentials=True,
    allow_methods=["*"], # Permite todos los métodos (GET, POST, etc.)
    allow_headers=["*"], # Permite todas las cabeceras
)

# Registrar Middleware de Auditoría
app.add_middleware(AuditMiddleware)

# Registrar routers - Endpoints existentes
app.include_router(dispensacion.router)
app.include_router(kardex.router)
app.include_router(compras.router)
app.include_router(subrogaciones.router)
app.include_router(recetas.router)
app.include_router(medicamentos.router)

# Registrar routers - CRUD completos (NUEVOS)
app.include_router(lotes_crud.router)
app.include_router(inventario_crud.router)
app.include_router(detalle_receta_crud.router)

# Registrar routers - MongoDB CRUD (NUEVO)
app.include_router(mongo_detalle_compra.router)
app.include_router(mongo_inventario.router)
app.include_router(mongo_subrogaciones.router)
app.include_router(mongo_dispensaciones.router)
app.include_router(mongo_bitacora.router)

# Registrar router - Auditoría (NUEVO - SOLO LECTURA)
app.include_router(bitacora_router.router)

# Registrar router - Admin (NUEVO - Poblado de datos)
app.include_router(admin_seed_router.router)

# Registrar router - Surtir Receta (NUEVO - Dispensación de medicamentos)
app.include_router(surtir_receta.router)

@app.get("/", tags=["Root"], summary="Health check")
async def root():
    return {
        "status": "ok",
        "message": "Hospital Pharmacy API funcionando 🔥",
        "docs": "/docs"
    }
