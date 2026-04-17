# 🏥 Sistema de Gestión Farmacéutica Hospitalaria  
### EQUIPO DE FARMACIA - TAREA INTEGRADORA

<p align="justify">El Sistema de Gestión Farmacéutica Hospitalaria es una solución integral que busca revolucionar la administración de medicamentos, inventarios y operaciones farmacéuticas en entornos hospitalarios. Con enfoque en sostenibilidad, eficiencia y la participación activa del equipo médico, esta plataforma promueve la excelencia en la gestión de recursos farmacéuticos.</p>

---

## 🎨 IDENTIDAD VISUAL DEL PROYECTO

### LOGOTIPOS

<table>
  <tr>
    <td align="center"><strong>Logo Principal</strong></td>
    <td align="center"><strong>Logo Secundario</strong></td>
  </tr>
  <tr>
    <td align="center">
      <strong>🏥</strong><br/>
      Sistema Farmacéutico
    </td>
    <td align="center">
      <strong>💊</strong><br/>
      Gestión de Medicamentos
    </td>
  </tr>
</table>

---

## 📝 DESCRIPCIÓN

<p align="justify">Se busca implementar una plataforma web integral que permita la gestión centralizada de medicamentos, inventarios, compras y dispensaciones en hospitales. Esta herramienta facilitará el monitoreo en tiempo real, la trazabilidad de medicamentos, y optimizará procesos de compra mediante análisis de costos y mecanismos de subrogación automática. La solución integra bases de datos SQL y NoSQL para garantizar flexibilidad, escalabilidad y confiabilidad en la administración farmacéutica.</p>

---

## 🔍 PLANTEAMIENTO DEL PROBLEMA

<p align="justify">Los hospitales enfrentan desafíos significativos en la gestión eficiente de medicamentos y control de inventarios: falta de rastreabilidad de medicamentos, procesos manuales y propensos a errores, gestión ineficiente de compras con inconsistencias económicas, ausencia de sistemas de alerta para medicamentos con bajo stock, y dificultad en la toma de decisiones basada en datos. Estos problemas generan desperdicio de recursos, errores en dispensación, y comprometen la calidad de atención médica. Una solución tecnológica integral es esencial para optimizar estas operaciones y mejorar los resultados en salud.</p>

---

## 💡 PROPUESTA DE SOLUCIÓN

<p align="justify">Implementamos una plataforma híbrida SQL+NoSQL que centraliza toda la gestión farmacéutica hospitalaria. La solución ofrece: gestión integral de pacientes y medicamentos con trazabilidad completa, sistema automático de compras y análisis económico de subrogaciones, alertas inteligentes de inventario crítico, análisis de costos y reportes en tiempo real, y participación colaborativa del equipo farmacéutico. Todo integrado en APIs REST seguras con autenticación JWT, documentación automática en Swagger, y un dashboard de Business Intelligence para visualización de métricas clave.</p>

---

## 🎯 OBJETIVO GENERAL

<p align="justify">Implementar una plataforma web integral que permita la gestión centralizada, automatizada y eficiente de medicamentos, inventarios, compras y análisis económico en hospitales, facilitando la toma de decisiones basada en datos y mejorando la calidad de atención al paciente mediante optimización de recursos farmacéuticos.</p>

---

## 📊 OBJETIVOS ESPECÍFICOS

<p align="justify"><strong>✅ Gestión Integral de Medicamentos:</strong> Implementar un sistema centralizado para registro, actualización y monitoreo en tiempo real de medicamentos, proveedores y precios, facilitando la trazabilidad completa del ciclo de vida del medicamento.</p>

<p align="justify"><strong>✅ Control Automático de Inventario:</strong> Desarrollar mecanismos inteligentes de alerta para medicamentos con bajo stock, detección automática de productos críticos, y generación de reportes de disponibilidad en tiempo real.</p>

<p align="justify"><strong>✅ Optimización de Compras:</strong> Implementar un sistema de gestión de compras con análisis automático de costos, detección de diferencias económicas, y sugerencias de subrogación para maximizar ahorro hospitalario.</p>

<p align="justify"><strong>✅ Sistema de Subrogación Automática:</strong> Desarrollar mecanismo que auto-detecte medicamentos sin stock y sugiera sustitutos, reduciendo tiempos de respuesta y garantizando disponibilidad terapéutica.</p>

<p align="justify"><strong>✅ Análisis y Reportes Avanzados:</strong> Crear dashboard interactivo con métricas de consumo, rotación de inventario, análisis económico de subrogaciones, y disponibilidad de medicamentos para apoyo en toma de decisiones estratégicas.</p>

<p align="justify"><strong>✅ Seguridad y Auditoría:</strong> Implementar autenticación JWT, validación rigurosa de datos, bitácora de auditoría, y mecanismos de monitoreo para garantizar integridad de datos y cumplimiento normativo.</p>

---

## 📅 CRONOGRAMA DEL PROYECTO

| Fase | Actividad | Duración | Estado |
|------|-----------|----------|--------|
| **Fase 1** | Diseño BD + Documentación | 2 semanas | ✅ Completado |
| **Fase 2** | Desarrollo API REST Base | 3 semanas | ⏳ En Progreso |
| **Fase 3** | Integración SQL + NoSQL | 2 semanas | ⏳ Pendiente |
| **Fase 4** | Desarrollo Suite de Tests (10 casos) | 2 semanas | ⏳ Pendiente |
| **Fase 5** | Dashboard Navicat BI | 1 semana | ⏳ Pendiente |
| **Fase 6** | Validación y Optimización | 1 semana | ⏳ Pendiente |

---

## 👥 TABLA DE COLABORADORES

| Nombre | Usuario GitHub | Rol | Responsabilidades |
|--------|-----------------|-----|------------------|
| Yazmin Gutierrez Hernández | [yaz-gutzz](https://github.com/yaz-gutzz) | Coordinadora Equipo | Arquitectura, Coordinación, Documentación |
| - | - | Desarrollador Backend | APIs REST, Lógica de Negocio |
| - | - | Desarrollador Frontend | Interfaz, UX/UI |
| - | - | Especialista Database | Diseño BD, Optimización, Seguridad |

---

## 🏢 ORGANIGRAMA DEL EQUIPO

```
┌─────────────────────────────────────────┐
│  EQUIPO DE FARMACIA - TAREA INTEGRADORA │
└────────────────┬────────────────────────┘
                 │
        ┌────────┼────────┐
        │                 │
    ┌───▼──┐          ┌──▼────┐
    │Backend│          │Database│
    │ API   │          │Manager │
    └───┬──┘          └──┬─────┘
        │                 │
    ┌───▼─────────────────▼────┐
    │ Tests & Documentación     │
    │ (10 Casos de Negocio)     │
    └───────┬───────────────────┘
            │
        ┌───▼──────┐
        │ Dashboard │
        │ Analytics │
        └──────────┘
```

---

## 🛠️ TECNOLOGÍAS UTILIZADAS

<p align="justify">

**Backend & API:**
- ![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white)
- ![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
- ![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-CC2927?style=for-the-badge&logo=sqlalchemy&logoColor=white)

**Bases de Datos:**
- ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
- ![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge&logo=mongodb&logoColor=white)
- ![PyMongo](https://img.shields.io/badge/PyMongo-003B57?style=for-the-badge&logo=mongodb&logoColor=white)

**Seguridad & Autenticación:**
- ![JWT](https://img.shields.io/badge/JWT-000000?style=for-the-badge&logo=jsonwebtokens&logoColor=white)
- ![Passlib](https://img.shields.io/badge/Passlib-FF6B6B?style=for-the-badge)

**Testing & Análisis:**
- ![Pytest](https://img.shields.io/badge/Pytest-0A9EDC?style=for-the-badge&logo=pytest&logoColor=white)
- ![Swagger](https://img.shields.io/badge/Swagger-85EA2D?style=for-the-badge&logo=swagger&logoColor=black)

**Dashboard & Visualización:**
- ![Navicat](https://img.shields.io/badge/Navicat_BI-242E3E?style=for-the-badge)

**Documentación:**
- ![Markdown](https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white)
- ![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

</p>

---

---

## 📂 ESTRUCTURA DEL PROYECTO

```
Farmacia_Integradora/
├── 📄 README.md                         # Portada - Documentación Principal
│
├── 📁 DOCS/                             # Documentación (5%)
│   ├── CONTEXTO.md                      # Documentos de contexto
│   ├── FRs.md                           # Requisitos Funcionales
│   ├── NFRs.md                          # Requisitos No Funcionales
│   ├── BRs.md                           # Requisitos de Negocio
│   └── PROMPTING.md                     # Bitácora de prompting
│
├── 📁 DB/                               # Base de Datos
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
├── 📁 API/                              # Código Fuente API (15%)
│   ├── README.md
│   ├── main.py
│   ├── config.py
│   ├── requirements.txt
│   ├── 📁 models/
│   ├── 📁 routes/
│   ├── 📁 schemas/
│   └── 📁 utils/
│
├── 📁 TESTS/                            # Suite de Pruebas (10%)
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
├── 📁 DASHBOARD/                        # Dashboard Navicat BI (10%)
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
| 📋 Documentación | 5% | /DOCS/ |
| 🗄️ Respaldos SQL | 15% | /DB/sql/ |
| 🗄️ Respaldos NoSQL | 15% | /DB/nosql/ |
| 🔐 Seguridad | 15% | /DB/security/ |
| 💻 API REST | 15% | /API/ |
| 🧪 Tests (10 casos) | 10% | /TESTS/ |
| 📊 Dashboard | 10% | /DASHBOARD/ |

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
