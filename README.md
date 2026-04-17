# 🏥 Sistema de Gestión Farmacéutica Hospitalaria

**EQUIPO DE FARMACIA - Tarea Integradora**

---

## 📋 Descripción General

Sistema integral de gestión farmacéutica hospitalaria que integra gestión de pacientes, medicamentos, inventarios, compras y análisis económico. Arquitectura moderna con SQL + NoSQL, APIs REST seguras y documentación automática.

**Equipo:** Departamento de Farmacia  
**Objetivo Final:** Plataforma completa para el control operacional y administrativo de farmacia hospitalaria

---

## 📂 Estructura del Proyecto

```
Farmacia_Integradora/
├── 📄 README.md                         # Portada - Documentación Principal
│
├── 📁 docs/                             # Documentación (5%)
│   ├── CONTEXTO.md                      # Documentos de contexto
│   └── PROMPTING.md                     # Bitácora de prompting
│
├── 📁 db/                               # Base de Datos
│   ├── 📁 sql/                          # (15%)
│   │   ├── README.md
│   │   ├── respaldo_completo.sql        # Respaldo manual completo
│   │   ├── respaldo_parcial.sql         # Respaldo manual parcial
│   │   ├── script_respaldo_automatizado.sql
│   │   ├── data_dictionary.md
│   │   ├── bitacora_seguridad.log
│   │   └── mecanismo_monitoreo.sql
│   │
│   ├── 📁 nosql/                        # (15%)
│   │   ├── README.md
│   │   ├── respaldo_completo.json       # Respaldo manual completo
│   │   ├── respaldo_parcial.json        # Respaldo manual parcial
│   │   ├── script_respaldo_automatizado.js
│   │   ├── schema_hospital_medicamentos.json
│   │   ├── data_dictionary.md
│   │   ├── bitacora_seguridad.log
│   │   └── mecanismo_monitoreo.js
│   │
│   └── 📁 security/                     # (15%)
│       ├── SEGURIDAD.md
│       ├── usuarios_sql.sql
│       └── usuarios_nosql.js
│
├── 📁 api/                              # Código Fuente API (15%)
│   ├── README.md
│   ├── main.py
│   ├── config.py
│   ├── requirements.txt
│   ├── 📁 models/
│   ├── 📁 routes/
│   ├── 📁 schemas/
│   └── 📁 utils/
│
├── 📁 tests/                            # Suite de Pruebas (10%)
│   ├── README.md                        # 10 Tests Documentados
│   ├── test_01_compra_simple.py
│   ├── test_02_impacto_masivo.py
│   ├── test_03_subrogacion_economica.py
│   ├── test_04_subrogacion_automatica.py
│   ├── test_05_control_errores.py
│   ├── test_06_validacion_pacientes.py
│   ├── test_07_validacion_medicamentos.py
│   ├── test_08_consultas_inventario.py
│   ├── test_09_dispensacion.py
│   ├── test_10_reportes.py
│   └── 📁 evidencias/                   # Resultados de tests
│
├── 📁 dashboard/                        # Dashboard Navicat BI (10%)
│   ├── README.md
│   ├── estatus_tests.navicat
│   ├── cobertura_inventario.navicat
│   ├── impacto_masivo.navicat
│   ├── analisis_costos.navicat
│   ├── disponibilidad_medicamentos.navicat
│   ├── dispensaciones_pacientes.navicat
│   ├── medicamentos_criticos.navicat
│   └── validaciones_fallidas.navicat
│
└── 📋 .gitignore
```

## 📊 Distribución de Entregables

| Componente | Peso | Carpeta |
|------------|------|---------|
| 📄 Portada (README) | 10% | / |
| 🗄️ Respaldos SQL | 15% | /db/sql/ |
| 🗄️ Respaldos NoSQL | 15% | /db/nosql/ |
| 🔐 Seguridad | 15% | /db/security/ |
| 💻 API REST | 15% | /api/ |
| 🧪 Tests (10 casos) | 10% | /tests/ |
| 📊 Dashboard | 10% | /dashboard/ |
| 📝 Bitácora Prompting | 5% | /docs/PROMPTING.md |

---

## 🎯 Módulos Principales

### 🏨 Gestión de Pacientes y Clínica
- Registro y administración de pacientes
- Historiales médicos y clínicos
- Recetas y medicamentos asociados
- Control de datos personales y contacto

### 💊 Gestión de Medicamentos
- Catálogo de medicamentos
- Control de proveedores
- Gestión de inventarios
- Precios y análisis de costos

### 📦 Control de Compras y Subrogación
- Órdenes de compra
- Registros de compra
- Análisis de diferencias económicas
- Sistema automático de subrogación

### 📊 Reportes y Analytics
- Reportes de inventario
- Análisis de costos
- Trazabilidad de medicamentos
- Estadísticas de consumo

---

## 🏗️ Arquitectura Técnica

### Stack Tecnológico

```
┌─────────────────────────────────┐
│   CAPA DE PRESENTACIÓN          │
│   (Frontend/Cliente)            │
└─────────────┬───────────────────┘
              │
┌─────────────▼───────────────────┐
│   APIs REST (FastAPI)           │
│   - Endpoints de pacientes      │
│   - Endpoints de medicamentos   │
│   - Endpoints de compras        │
│   - Autenticación JWT           │
│   - Documentación Swagger       │
└─────────────┬───────────────────┘
              │
     ┌────────┴────────┐
     │                 │
┌────▼──────┐    ┌────▼──────────┐
│ MySQL/BD  │    │   MongoDB     │
│ (SQL)     │    │   (NoSQL)     │
├───────────┤    ├───────────────┤
│ hospital_ │    │ hospital_     │
│ 230142    │    │ medicamentos  │
│           │    │               │
│ Tablas:   │    │ Colecciones:  │
│ -personas │    │ -detalle_     │
│ -pacientes│    │  compra       │
│ -medicin. │    │ -inventario   │
│ -hist.    │    │ -subrogacion  │
│ -recetas  │    │ -dispens.     │
└───────────┘    └───────────────┘
```

### Características de Seguridad
- ✅ Autenticación JWT
- ✅ Validación de permisos
- ✅ Encriptación de datos sensibles
- ✅ Auditoría de operaciones
- ✅ Backups automáticos

---

## 📦 Estructura Base de Datos

### MySQL/MariaDB (hospital_230142)

**Tablas de Control de Pacientes:**
```
personas
├─ id_persona (PK)
├─ nombre, apellido
├─ cedula, fecha_nacimiento
└─ contacto, dirección

pacientes
├─ id_paciente (PK)
├─ id_persona (FK)
├─ historial_medico
└─ estado
```

**Tablas de Medicamentos:**
```
medicamentos
├─ id_medicamento (PK)
├─ nombre, descripción
├─ principio_activo
└─ precio

proveedores
├─ id_proveedor (PK)
├─ nombre, contacto
└─ empresa
```

**Tablas de Documentos:**
```
historiales_recetas
├─ id_historial (PK)
├─ id_paciente (FK)
├─ medicamentos_recetados
└─ fecha, médico
```

### MongoDB (hospital_medicamentos)

**detalle_compra**
```json
{
  "_id": ObjectId,
  "id_compra": String,
  "id_medicamento": ObjectId,
  "cantidad": Number,
  "precio_unitario": Decimal,
  "total": Decimal,
  "fecha": Date,
  "proveedor": String
}
```

**inventario_medicamento**
```json
{
  "_id": ObjectId,
  "id_medicamento": ObjectId,
  "cantidad_actual": Number,
  "cantidad_minima": Number,
  "cantidad_maxima": Number,
  "ultima_actualizacion": Date,
  "ubicacion": String
}
```

**subrogacion_medicamentos**
```json
{
  "_id": ObjectId,
  "id_compra_original": ObjectId,
  "medicamento_sustituto": ObjectId,
  "diferencia_costo": Decimal,
  "motivo": String,
  "fecha": Date,
  "aprobado_por": String
}
```

**dispensaciones**
```json
{
  "_id": ObjectId,
  "id_paciente": ObjectId,
  "id_medicamento": ObjectId,
  "cantidad_dispensada": Number,
  "fecha": Date,
  "farmacéutico": String,
  "receta_numero": String
}
```

---

## 🔌 APIs REST - Endpoints Principales

### Autenticación
```bash
POST   /auth/login          # Obtener token JWT
POST   /auth/refresh        # Renovar token
POST   /auth/logout         # Cerrar sesión
```

### Pacientes
```bash
GET    /pacientes           # Listar todos
POST   /pacientes           # Crear paciente
GET    /pacientes/{id}      # Obtener uno
PUT    /pacientes/{id}      # Actualizar
DELETE /pacientes/{id}      # Eliminar
```

### Medicamentos
```bash
GET    /medicamentos        # Listar todos
POST   /medicamentos        # Crear medicamento
GET    /medicamentos/{id}   # Obtener uno
PUT    /medicamentos/{id}   # Actualizar
```

### Compras
```bash
GET    /compras             # Listar todas
POST   /compras             # Crear compra
GET    /compras/{id}        # Obtener detalles
PUT    /compras/{id}        # Actualizar
POST   /compras/{id}/subrogacion  # Aplicar subrogación
```

### Inventario
```bash
GET    /inventario          # Estado actual
GET    /inventario/{id}     # Por medicamento
POST   /inventario/alerta   # Medicamentos bajos
```

### Dispensación
```bash
GET    /dispensacion        # Historial
POST   /dispensacion        # Registrar dispensación
GET    /dispensacion/{paciente_id}  # Del paciente
```

---

## 🗄️ Configuración de Bases de Datos

### MySQL/MariaDB
```
Servidor:  localhost:3307
BD:        hospital_230142
Usuario:   root
Contraseña: (sin contraseña)

Conexión: mysql -u root -h localhost -P 3307
```

### MongoDB
```
Servidor:  localhost:27017
BD:        hospital_medicamentos
Colecciones: 4 (detalle_compra, inventario, subrogacion, dispensaciones)

Conexión: mongodb://localhost:27017/hospital_medicamentos
```

---

## 🚀 Instalación y Ejecución

### Requisitos Previos
- Python 3.8+
- MySQL/MariaDB
- MongoDB
- pip (gestor de paquetes Python)

### Instalación

```bash
# 1. Clonar repositorio
git clone https://github.com/yaz-gutzz/Farmacia_Integradora.git
cd Farmacia_Integradora

# 2. Crear entorno virtual
python -m venv venv
source venv/bin/activate  # En Windows: venv\Scripts\activate

# 3. Instalar dependencias
pip install fastapi uvicorn sqlalchemy pymongo python-jose passlib

# 4. Restaurar base de datos MySQL
mysql -u root < db/backups/respaldo_estructura.sql

# 5. Importar datos MongoDB
mongoimport --db hospital_medicamentos --collection detalle_compra \
  --file db/backups/detalle_compra.json --jsonArray
# (Repetir para otras colecciones)

# 6. Ejecutar API
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### Acceso a la Aplicación
- **API Base:** http://localhost:8000
- **Documentación Swagger:** http://localhost:8000/docs
- **Documentación ReDoc:** http://localhost:8000/redoc

---

## 📊 Casos de Negocio

### CU-001: Compra Simple de Medicamento
**Descripción:** Registrar una compra estándar de medicamento desde un proveedor  
**Actores:** Gerente de Compras, Proveedor  
**Flujo Principal:**
1. Crear orden de compra
2. Validar disponibilidad de medicamento
3. Registrar en detalle_compra
4. Actualizar inventario automáticamente

### CU-002: Impacto Masivo en Inventario
**Descripción:** Procesar grandes volúmenes de compra (500+ unidades)  
**Validaciones:**
- Verificar capacidad de almacenamiento
- Validar límites de cantidad máxima
- Generar alerta si excede umbral

### CU-003: Subrogación Económica
**Descripción:** Analizar cambio de medicamento por diferencia de costo  
**Análisis:**
- Calcular diferencia económica
- Documentar motivo de cambio
- Mantener trazabilidad completa

### CU-004: Subrogación Automática
**Descripción:** Sistema auto-detecta stock=0 y sugiere sustitutos  
**Proceso:**
- Monitorear inventario
- Identificar medicamentos sin stock
- Proponer medicamentos sustitutos automáticamente

### CU-005: Control y Validación de Errores
**Descripción:** Validación integral de datos y manejo de excepciones  
**Validaciones:**
- Datos faltantes o incompletos
- Cantidades negativas o cero
- Precios inválidos
- Relaciones inconsistentes

---

## 📈 Métricas y Reportes

### Reportes Disponibles
- **Inventario Crítico:** Medicamentos por debajo del mínimo
- **Análisis de Costos:** Medicamentos más costosos
- **Rotación:** Medicamentos más dispensados
- **Subrogación:** Análisis económico de cambios
- **Consumo Pacientes:** Por paciente o período

### KPIs Monitorados
- Tasa de rotación de inventario
- Costo promedio por dispensación
- Ahorro por subrogación
- Disponibilidad de medicamentos (%)
- Tiempo de abastecimiento

---

## 🧪 Testing

### Suite de Pruebas
- **Unitarias:** Validación de funciones base
- **Integración:** Sincronización SQL + NoSQL
- **Casos de Negocio:** 5 escenarios principales
- **Volumen:** Pruebas con 500+ registros
- **Errores:** Manejo de excepciones

### Ejecución de Tests
```bash
# Tests unitarios
pytest tests/unit/

# Tests de integración
pytest tests/integration/

# Tests de casos de negocio
pytest tests/business_cases/

# Cobertura
pytest --cov=.
```

---

## 📚 Documentación

Toda la documentación de API está disponible automáticamente en:
- **Swagger UI:** `/docs`
- **ReDoc:** `/redoc`
- **OpenAPI JSON:** `/openapi.json`

---

## 🤝 Integrantes del Equipo

**Equipo de Farmacia - Tarea Integradora**

Responsabilidades:
- Especificación de requisitos farmacéuticos
- Validación de casos de negocio
- Control de calidad
- Documentación operativa

---

## 📝 Versionado

| Versión | Fecha | Cambios |
|---------|-------|---------|
| v1.0.0 | Abril 2026 | Versión inicial completa |

**Rama Activa:** main  
**Status:** ✅ Completo

---

## 📞 Soporte

Para dudas o reportar problemas:
- 📧 Email: farmacia@hospital.local
- 💬 Teams: #farmacia-integradora
- 📋 Issues: GitHub Issues

---

**Última actualización:** Abril 2026  
**Equipo:** Departamento de Farmacia  
**Proyecto:** Sistema Integral de Gestión Farmacéutica Hospitalaria
