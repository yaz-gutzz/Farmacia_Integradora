from fastapi import Request
from starlette.middleware.base import BaseHTTPMiddleware
from datetime import datetime
from app.config.database import get_mongo
from app.models.mongo.bitacora import BitacoraDoc

class AuditMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next):
        # 1. Capturar información de la petición
        path = request.url.path
        method = request.method
        client_ip = request.client.host if request.client else "unknown"
        
        # Ignorar rutas de documentación y raíz
        if path in ["/docs", "/redoc", "/openapi.json", "/favicon.ico", "/"]:
            return await call_next(request)

        # 2. Determinar la tabla afectada según el endpoint
        tabla_afectada = "general"
        
        # Mapeo específico para endpoints MongoDB
        if path.startswith("/api/mongo/"):
            # Extraer la colección del path
            path_parts = path.split("/")
            if len(path_parts) >= 4:  # /api/mongo/{collection}
                collection = path_parts[3]  # El cuarto elemento es la colección
                
                # Mapeos específicos para nombres de colección
                collection_mapping = {
                    "detalle-compra": "detalle_compra",
                    "inventario": "inventario_medicamento", 
                    "subrogaciones": "subrogacion_medicamentos",
                    "dispensaciones": "dispensaciones",
                    "bitacora": "bitacora"
                }
                
                tabla_afectada = collection_mapping.get(collection, collection)
        
        # Endpoints SQL/MySQL
        elif "/api/compras" in path:
            tabla_afectada = "tbd_ph_lotes_medicamentos"
        elif "/api/medicamentos" in path:
            tabla_afectada = "tbc_ph_medicamentos"
        elif "/api/recetas" in path:
            tabla_afectada = "tbd_ph_recetas_medicas"
        elif "/api/dispensacion" in path:
            tabla_afectada = "tbd_ph_dispensacion"
        elif "/api/subrogaciones" in path:
            tabla_afectada = "subrogacion_medicamentos"
        elif "/api/kardex" in path:
            tabla_afectada = "inventario_medicamento"
        elif "/api/bitacora" in path:
            tabla_afectada = "tbi_bitacora"  # Bitácora SQL
            
        # 3. Determinar el tipo de operación según el método HTTP
        operacion = method  # GET, POST, PUT, DELETE, etc.
        
        # 4. Registrar en la bitácora MongoDB
        now = datetime.now()
        try:
            mongo = get_mongo()
            nueva_bitacora = BitacoraDoc(
                tabla_afectada=tabla_afectada,
                ip_cliente=client_ip,
                fecha=now,
                hora=now.strftime("%H:%M:%S"),
                operacion=operacion,
                detalles=f"{method} {path}"
            )
            await mongo["bitacora"].insert_one(nueva_bitacora.dict())
        except Exception as e:
            # Log del error pero NO interrumpir la petición
            print(f"⚠️  Error registrando bitácora MongoDB (continuando): {e}")
            # La API continúa funcionando normalmente
            
        # 5. Continuar con la ejecución de la petición
        response = await call_next(request)
        return response
