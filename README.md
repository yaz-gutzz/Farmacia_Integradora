# 🏥 ABD - Prácticas de Administración de Bases de Datos  
## **EQUIPO DE FARMACIA - Tarea Integradora**

## 📋 Descripción General

Repositorio de **Prácticas de Administración de Bases de Datos** que implementa un **Sistema Hospitalario Integral** enfocado en la gestión de pacientes, medicamentos e inventarios. Progresa desde arquitecturas SQL tradicionales hasta sistemas híbridos SQL+NoSQL, con integración de APIs REST y análisis avanzado de datos.

**Equipo:** Departamento de Farmacia  
**Organización:** Tres prácticas progresivas que construyen un ecosistema completo de gestión hospitalaria farmacéutica.

---

## 📂 Estructura General

```
ABD_Practica05_PH/
├── 📁 Practica-05/          # Base de datos SQL + Rutinas + Dashboard + Tests
├── 📁 Practica-07/          # API REST segura con 10 escenarios de prueba
├── 📁 Practica-09/          # API Híbrida SQL+NoSQL con 5 casos de negocio
└── 📄 README.md             # Este archivo
```

---

## 🎯 Prácticas Disponibles

### 📌 [**Práctica 05**](./Practica-05/README.md) - Diseño de Base de Datos Hospitalaria SQL

**Objetivo:** Modelar y gestionar una base de datos compleja para un hospital con pacientes, historiales médicos, medicamentos y recetas.

**Contenido:**
- ✅ Diseño SQL de esquema `hospital_230142`
- ✅ 10+ funciones y procedimientos almacenados
- ✅ 15 escenarios de prueba con diferentes volúmenes (1 a 1,000,000 registros)
- ✅ Dashboard interactivo (Notebook Interface)
- ✅ Scripts de usuarios, roles y privilegios
- ✅ Backups estructurales y funcionales

**Tecnologías:** MySQL/MariaDB, SQL, Notebook Interface

**Ubicación:** [`Practica-05/`](./Practica-05/)

**Quick Links:**
- [README Principal](./Practica-05/README.md)
- [Funciones SQL](./Practica-05/db/routines/funciones/)
- [Procedimientos](./Practica-05/db/routines/procedimiento/)
- [Tests](./Practica-05/db/test/)
- [Dashboard](./Practica-05/dashboard/)

---

### 🔐 [**Práctica 07**](./Practica-07/README.md) - API REST Segura con Generación Automática de Datos

**Objetivo:** Desarrollar una API REST segura con autenticación JWT, que genere automáticamente datos de pacientes y proporcione endpoints para consultar/manipular información hospitalaria.

**Contenido:**
- ✅ API FastAPI con autenticación JWT
- ✅ 10 escenarios de prueba completos
- ✅ Documentación Swagger/OpenAPI automática
- ✅ Generación procedural de datos de pacientes
- ✅ Tests documentados con evidencia visual (capturas)
- ✅ Distribución de responsabilidades por equipo

**Tecnologías:** FastAPI, Python, SQLAlchemy, JWT, Swagger

**Ubicación:** [`Practica-07/`](./Practica-07/)

**Quick Links:**
- [README Principal](./Practica-07/README.md)
- [Código API](./Practica-07/API/Api_Base_Datos/)
- [Tests](./Practica-07/tests/)
- [Swagger/OpenAPI](http://localhost:8000/docs) *(después de ejecutar API)*

---

### 🚀 [**Práctica 09**](./Practica-09/README.md) - API Híbrida SQL+NoSQL (Integración Avanzada)

**Objetivo:** Diseñar e implementar una arquitectura híbrida que integre MySQL (datos estructurados) con MongoDB (datos flexible) para gestión de medicamentos, inventarios y compras farmacéuticas.

**Contenido:**
- ✅ API REST con FastAPI
- ✅ Integración seamless SQL + NoSQL
- ✅ 4 colecciones MongoDB documentadas
- ✅ 5 casos de negocio con pruebas específicas
  - TEST 01: Compra simple
  - TEST 02: Impacto masivo (500+)
  - TEST 03: Subrogación con análisis económico
  - TEST 04: Subrogación automática
  - TEST 05: Control de errores
- ✅ Sincronización de datos entre motores
- ✅ Backups JSON de colecciones

**Tecnologías:** FastAPI, MySQL/MariaDB, MongoDB, PyMongo, SQLAlchemy

**Ubicación:** [`Practica-09/`](./Practica-09/)

**Quick Links:**
- [README Principal](./Practica-09/README.md)
- [Colecciones MongoDB](./Practica-09/API_Hibrida/Tablas_MongoDB/Colleciones/)
- [Tests (5 Casos de Negocio)](./Practica-09/API_Hibrida/Tablas_MongoDB/tests/)
- [Backups MongoDB](./Practica-09/API_Hibrida/Respaldo_MongoDB/)

---

## 🏗️ Arquitectura General

### Stack Tecnológico Común
```
Frontend/Testing
    ↓
FastAPI REST APIs (Prácticas 07 y 09)
    ↓
┌─────────────────────────────┐
│   Capa de Datos             │
├─────────────────────────────┤
│ SQL (MySQL/MariaDB)         │
│ └─ hospital_230142          │
│    └─ pacientes, personas   │
│       historiales, recetas  │
├─────────────────────────────┤
│ NoSQL (MongoDB)             │ ← Solo Práctica 09
│ └─ hospital_medicamentos    │
│    └─ detalle_compra        │
│       inventario_medicamento│
│       subrogacion_medic.    │
│       dispensaciones        │
└─────────────────────────────┘
```

### Evolución de Prácticas

```
Práctica 05                 Práctica 07                Práctica 09
(SQL Puro)     ----→      (API SQL)       ----→     (API Híbrida)
                                                      
Diseño BD        ✅         REST APIs       ✅         Multi-DB      ✅
Funciones        ✅         Autenticación   ✅         Sincronización ✅
Procedures       ✅         Swagger         ✅         Flexibilidad   ✅
Tests Volumen    ✅         JWT             ✅         NoSQL          ✅
Dashboard        ✅         Auto-generation ✅         Casos Negocio  ✅
```

---

## 📦 Bases de Datos

### MySQL/MariaDB
```
Servidor: localhost:3307
Base de datos: hospital_230142
Conexión: root / (sin contraseña)

Tablas principales:
├── personas
├── pacientes
├── medicamentos
├── proveedores
├── historiales_recetas
└── (más tablas de auditoría y logs)
```

### MongoDB
```
Servidor: localhost:27017
Base de datos: hospital_medicamentos

Colecciones:
├── detalle_compra                  ← Práctica 09
├── inventario_medicamento          ← Práctica 09
├── subrogacion_medicamentos        ← Práctica 09
└── dispensaciones                  ← Práctica 09
```

---

## 🧪 Resumen de Pruebas

### Práctica 05: 15 Tests de Volumen y Casos Específicos
| Test | Descripción | Registros |
|------|-------------|-----------|
| test_01-06 | Volumen progresivo | 1 → 1,000,000 |
| test_07 | 150 mujeres | 150 |
| test_08 | 340 varones 20-30 años | 340 |
| test_09-15 | Casos específicos (edad, estado, especialidades) | Variable |

### Práctica 07: 10 Tests de API REST
| Test | Descripción |
|------|-------------|
| test_01 | 100k pacientes |
| test_02 | 5k mujeres 20-50 años |
| test_03 | 300 varones inválidos |
| test_04 | 1.5k neonatos |
| test_05 | 325 recién nacidos finados |
| test_06 | 832 diabéticos 5-22 años |
| test_07-10 | Casos específicos adicionales |

### Práctica 09: 5 Casos de Negocio
| Test | Descripción | Objetivo |
|------|-------------|----------|
| TEST 01 | Compra de Medicamento | Inserción simple con validación |
| TEST 02 | Impacto Masivo | 500+ operaciones batch |
| TEST 03 | Subrogación Económica | Análisis de diferencias de costo |
| TEST 04 | Subrogación Automática | Sistema-driven por stock=0 |
| TEST 05 | Control de Errores | Validaciones y manejo de excepciones |

---

## 🚀 Quick Start

### Práctica 05 - Preparar Base de Datos
```bash
cd Practica-05/db/
# Restaurar estructura
mysql -u root < backups/respaldo_estructural.sql
# Poblar datos
mysql -u root hospital_230142 < routines/procedimiento/sp_poblar_pacientes.sql
```

### Práctica 07 - Ejecutar API
```bash
cd Practica-07/API/Api_Base_Datos/
pip install -r requirements.txt
uvicorn main:app --reload
# Acceder a Swagger: http://localhost:8000/docs
```

### Práctica 09 - API Híbrida
```bash
cd Practica-09/API_Hibrida/Api_Base_Datos\ Hibrida/
pip install -r requirements.txt
# Restaurar MongoDB
mongoimport --db hospital_medicamentos --collection detalle_compra --file ../Respaldo_MongoDB/hospital_farmacia.detalle_compra.json --jsonArray
# etc. para otras colecciones
uvicorn main:app --reload
```

---

## 📊 Documentación por Práctica

### Práctica 05
- [README Principal](./Practica-05/README.md)
- [Funciones SQL](./Practica-05/db/routines/funciones/readme.md)
- [Procedimientos](./Practica-05/db/routines/procedimiento/readme.md)
- [Tests](./Practica-05/db/test/readme.md)
- [Dashboard](./Practica-05/dashboard/README.md)

### Práctica 07
- [README Principal](./Practica-07/README.md)
- [Código API](./Practica-07/API/README.md)
- [Suite de Tests](./Practica-07/tests/readme.md)

### Práctica 09
- [README Principal](./Practica-09/README.md)
- [API Híbrida](./Practica-09/API_Hibrida/README.md)
- [Colecciones MongoDB](./Practica-09/API_Hibrida/Tablas_MongoDB/Colleciones/)
  - [detalle_compra](./Practica-09/API_Hibrida/Tablas_MongoDB/Colleciones/detalle_compra/README.md)
  - [inventario_medicamento](./Practica-09/API_Hibrida/Tablas_MongoDB/Colleciones/inventario_medicamento/README.md)
  - [subrogacion_medicamentos](./Practica-09/API_Hibrida/Tablas_MongoDB/Colleciones/subrogacion_medicamentos/README.md)
  - [dispensaciones](./Practica-09/API_Hibrida/Tablas_MongoDB/Colleciones/dispensaciones/readme.md)
- [5 Tests de Negocio](./Practica-09/API_Hibrida/Tablas_MongoDB/tests/)
- [Backups MongoDB](./Practica-09/API_Hibrida/Respaldo_MongoDB/README.md)

---

**Última actualización:** Marzo 2026  
**Rama activa:** main  
**Status:** ✅ Completo
