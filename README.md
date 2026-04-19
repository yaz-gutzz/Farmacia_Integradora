#  Sistema de Gestión Farmacéutica Hospitalaria  
### EQUIPO DE FARMACIA - TAREA INTEGRADORA

<p align="justify">El Sistema de Gestión Farmacéutica Hospitalaria es una solución integral diseñada para el Departamento de Farmacia de un hospital de tercer nivel. Busca revolucionar la administración de medicamentos, inventarios y operaciones farmacéuticas en una institución con alta complejidad clínica y volumen operativo. Con enfoque en sostenibilidad, eficiencia y la participación activa del equipo médico, esta plataforma promueve la excelencia en la gestión de recursos farmacéuticos.</p>

---

## IDENTIDAD VISUAL DEL PROYECTO

### LOGOTIPOS

<table>
  <tr>
    <td align="center"><strong>Logo Principal</strong></td>
    <td align="center"><strong>Logo Secundario</strong></td>
  </tr>
  <tr>
    <td align="center">
      Sistema Farmacéutico
    </td>
    <td align="center">
      Gestión de Medicamentos
    </td>
  </tr>
</table>

---

##  DESCRIPCIÓN

<p align="justify">Se busca implementar una plataforma web integral que permita la gestión centralizada de medicamentos, inventarios, compras y dispensaciones en hospitales. Esta herramienta facilitará el monitoreo en tiempo real, la trazabilidad de medicamentos, y optimizará procesos de compra mediante análisis de costos y mecanismos de subrogación automática. La solución integra bases de datos SQL y NoSQL para garantizar flexibilidad, escalabilidad y confiabilidad en la administración farmacéutica.</p>

---

##  PLANTEAMIENTO DEL PROBLEMA

<p align="justify">Los hospitales enfrentan desafíos significativos en la gestión eficiente de medicamentos y control de inventarios: falta de rastreabilidad de medicamentos, procesos manuales y propensos a errores, gestión ineficiente de compras con inconsistencias económicas, ausencia de sistemas de alerta para medicamentos con bajo stock, y dificultad en la toma de decisiones basada en datos. Estos problemas generan desperdicio de recursos, errores en dispensación, y comprometen la calidad de atención médica. Una solución tecnológica integral es esencial para optimizar estas operaciones y mejorar los resultados en salud.</p>

---

##  PROPUESTA DE SOLUCIÓN

<p align="justify">Implementamos una plataforma híbrida SQL+NoSQL que centraliza toda la gestión farmacéutica hospitalaria. La solución ofrece: gestión integral de pacientes y medicamentos con trazabilidad completa, sistema automático de compras y análisis económico de subrogaciones, alertas inteligentes de inventario crítico, análisis de costos y reportes en tiempo real, y participación colaborativa del equipo farmacéutico. Todo integrado en APIs REST seguras con autenticación JWT, documentación automática en Swagger, </p>

---

##  OBJETIVO GENERAL

<p align="justify">Implementar una plataforma web integral que permita la gestión centralizada, automatizada y eficiente de medicamentos, inventarios, compras y análisis económico en hospitales, facilitando la toma de decisiones basada en datos y mejorando la calidad de atención al paciente mediante optimización de recursos farmacéuticos.</p>

---

##  OBJETIVOS ESPECÍFICOS

- **Gestión Integral de Medicamentos:** Registro centralizado, actualización y monitoreo en tiempo real de medicamentos con trazabilidad completa.
- **Control Automático de Inventario:** Alertas inteligentes para bajo stock y reportes de disponibilidad en tiempo real.
- **Optimización de Compras:** Sistema de gestión con análisis de costos y sugerencias de subrogación.
- **Subrogación Automática:** Auto-detección de medicamentos sin stock con sustitutos alternativos.
- **Análisis y Reportes:** Dashboard interactivo con métricas de consumo, rotación y disponibilidad.
- **Seguridad y Auditoría:** Autenticación JWT, validación de datos y bitácora de auditoría.

---


##  TECNOLOGÍAS UTILIZADAS

| Categoría | Tecnologías |
|-----------|-----------|
| **Backend** | ![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white) ![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white) ![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-CC2927?style=for-the-badge&logo=sqlalchemy&logoColor=white) ![JWT](https://img.shields.io/badge/JWT-000000?style=for-the-badge&logo=jsonwebtokens&logoColor=white) ![Passlib](https://img.shields.io/badge/Passlib-FF6B6B?style=for-the-badge) |
| **Bases de Datos** | ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white) ![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge&logo=mongodb&logoColor=white) ![PyMongo](https://img.shields.io/badge/PyMongo-003B57?style=for-the-badge&logo=mongodb&logoColor=white) |
| **Testing** | ![Pytest](https://img.shields.io/badge/Pytest-0A9EDC?style=for-the-badge&logo=pytest&logoColor=white) |
| **Documentación & API** | ![Swagger](https://img.shields.io/badge/Swagger-85EA2D?style=for-the-badge&logo=swagger&logoColor=black) ![Markdown](https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white) |
| **Visualización** | ![Navicat](https://img.shields.io/badge/Navicat_BI-242E3E?style=for-the-badge) |
| **Control de Versiones** | ![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white) ![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white) |

---



##  ESTRUCTURA DEL PROYECTO

```
Farmacia_Integradora/
├── README.md                         # Portada - Documentación Principal
│
├── DOCS/                             # Documentación (5%)
│   ├── CONTEXTO.md                      # Documentos de contexto
│   ├── FRs.md                           # Requisitos Funcionales
│   ├── NFRs.md                          # Requisitos No Funcionales
│   ├── BRs.md                           # Requisitos de Negocio
│   └── PROMPTING.md                     # Bitácora de prompting
│
├── DB/                               # Base de Datos
│   ├── SQL/                          # (15%)
│   │   ├── README.md
│   │   ├── respaldo_completo.sql        # Respaldo manual completo
│   │   ├── respaldo_parcial.sql         # Respaldo manual parcial
│   │   ├── script_respaldo_automatizado.sql
│   │   ├── data_dictionary.md
│   │   ├── bitacora_seguridad.log
│   │   └── mecanismo_monitoreo.sql
│   │
│   ├── NOSQL/                        # (15%)
│   │   ├── README.md
│   │   ├── respaldo_completo.json       # Respaldo manual completo
│   │   ├── respaldo_parcial.json        # Respaldo manual parcial
│   │   ├── script_respaldo_automatizado.js
│   │   ├── schema_hospital_medicamentos.json
│   │   ├── data_dictionary.md
│   │   ├── bitacora_seguridad.log
│   │   └── mecanismo_monitoreo.js
│   │
│   └── SECURITY/                     # (15%)
│       ├── SEGURIDAD.md
│       ├── usuarios_sql.sql
│       └── usuarios_nosql.js
│
├── API/                              # Código Fuente API (15%)
│   ├── README.md
│   ├── main.py
│   ├── config.py
│   ├── requirements.txt
│   ├── MODELS/
│   ├── ROUTES/
│   ├── SCHEMAS/
│   └── UTILS/
│
├── TESTS/                            # Suite de Pruebas (10%)
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
│   └── evidencias/                   # Resultados de tests
│
├── DASHBOARD/                        # Dashboard Navicat BI (10%)
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
└── .gitignore
```

##  Distribución de Entregables

| Componente | Peso | Carpeta |
|------------|------|---------|
|  Portada (README) | 10% | / |
|  Documentación | 5% | /DOCS/ |
|  Respaldos SQL | 15% | /DB/SQL/ |
|  Respaldos NoSQL | 15% | /DB/NOSQL/ |
|  Seguridad | 15% | /DB/SECURITY/ |
|  API REST | 15% | /API/ |
|  Tests (10 casos) | 10% | /TESTS/ |
|  Dashboard | 10% | /DASHBOARD/ |

---


##  Integrantes del Equipo

**Equipo de Farmacia - Tarea Integradora**

Responsabilidades:
- Especificación de requisitos farmacéuticos
- Validación de casos de negocio
- Control de calidad
- Documentación operativa

| Nombre | Usuario GitHub | Rol | Responsabilidades |
|--------|-----------------|-----|------------------|
| **Yazmin Gutierrez Hernández** | [yaz-gutzz](https://github.com/yaz-gutzz) | Coordinadora Equipo | Arquitectura, Coordinación, Documentación |
| **Obed Guzman Garcia** | [@ObedGuzmanGuz](https://github.com/ObedGuzmanGuz) | Desarrollador Backend | APIs REST, Lógica de Negocio |
| **Citlalli Perez Dionicio** |   [@KouDionicio](https://github.com/KouDioniciob) | Interfaz, UX/UI |
| **Michelle Castro Otero** |[@Ktmich2095](https://github.com/Ktmich2095)  | Especialista Database | Diseño BD, Optimización, Seguridad |

---

##  CRONOGRAMA DEL PROYECTO

| Fase | Actividad | Duración | Estado |
|------|-----------|----------|--------|
| **Fase 1** | Diseño BD + Documentación | 2 semanas | Completado |
| **Fase 2** | Desarrollo API REST Base | 3 semanas | En Progreso |
| **Fase 3** | Integración SQL + NoSQL | 2 semanas | Pendiente |
| **Fase 4** | Desarrollo Suite de Tests (10 casos) | 2 semanas | Pendiente |
| **Fase 5** | Dashboard Navicat BI | 1 semana | Pendiente |
| **Fase 6** | Validación y Optimización | 1 semana | Pendiente |


---
##  Versionado

| Versión | Fecha | Cambios |
|---------|-------|---------|
| v1.0.0 | Abril 2026 | Versión inicial completa |

**Rama Activa:** main  
**Status:**  Completo

---

**Última actualización:** Abril 2026  
**Equipo:** Departamento de Farmacia  
**Proyecto:** Sistema Integral de Gestión Farmacéutica Hospitalaria
