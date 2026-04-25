#  DOCUMENTACIÓN DE CONTEXTO DEL PROYECTO

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Repository-GitHub-black?style=flat-square" alt="GitHub"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Documentation-100%25-blue?style=flat-square" alt="Documentation"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Requirements-32%20Defined-orange?style=flat-square" alt="Requirements"/></td>
</tr>
</table>

## Sistema de Gestión Farmacéutica Hospitalaria

Este documento proporciona el contexto general del proyecto para el Departamento de Farmacia de un hospital de tercer nivel. Incluye visión general, stakeholders clave, objetivos estratégicos y referencias a la documentación específica de requisitos (BRs, FRs, NFRs).

---

##  Propósito de este Documento

Este archivo documenta el contexto general del proyecto de Sistema de Gestión Farmacéutica Hospitalaria. Proporciona la visión general, stakeholders, objetivos y referencias a documentos más específicos.

---

##  Documentos de Contexto Disponibles

### 1. **Requisitos Funcionales**
Especifica QUÉ debe ser capaz de hacer el sistema.

**Contenido:**
- 10 requisitos funcionales (FR-001 a FR-010)
- Descripción de cada funcionalidad
- Actores involucrados
- Criterios de aceptación
- Prioridades de implementación

**Beneficiario Principal:** Equipo de Desarrollo

[ Ver Requisitos Funcionales](./Requerimientos%20Funcionales%20y%20No%20Funcionales.pdf)

---

### 2. **Requisitos No Funcionales**
Especifica CÓMO debe funcionar el sistema (atributos del sistema).

**Contenido:**
- 12 requisitos no funcionales (NFR-001 a NFR-012)
- Rendimiento, escalabilidad, seguridad
- Disponibilidad, mantenibilidad, usabilidad
- Cumplimiento legal y auditoría
- Métricas y estándares

**Beneficiario Principal:** Equipo de Arquitectura y Operaciones

[ Ver Requisitos No Funcionales](./Requerimientos%20Funcionales%20y%20No%20Funcionales.pdf)

---

### 3. **Requisitos de Negocio**
Define POR QUÉ se construye el sistema y qué valor genera.

**Contenido:**
- 10 requisitos de negocio (BR-001 a BR-010)
- Objetivos empresariales
- Métricas de éxito
- ROI y timeline
- Alineación estratégica

**Beneficiario Principal:** Directivos y Gerencia

[ Ver Requisitos de Negocio](./Requerimientos%20Funcionales%20y%20No%20Funcionales.pdf)

---
## Información General del Proyecto

### Nombre Oficial
**Sistema de Gestión Farmacéutica Hospitalaria - FARMACIA_INTEGRADORA**

### Tipo de Proyecto
- Plataforma Web
- Gestión Integral
- Tiempo Real
- Análisis de Datos

### Descripción Ejecutiva
Plataforma integral que revoluciona la administración de medicamentos en hospitales mediante:
- Gestión centralizada de inventarios
- Automatización de procesos de compra
- Análisis automático de costos
- Sistema inteligente de alertas
- Reportes y análisis en tiempo real

### Alcance Inicial
- Gestión de pacientes
- Gestión de medicamentos
- Control de inventario
- Gestión de compras
- Sistema de subrogación
- Dispensación controlada
- Reportes y análisis

---

##  Principales Stakeholders

| Grupo | Interés Principal | Necesidades |
|-------|------------------|------------|
| **Equipo Farmacéutico** | Facilitar su trabajo | Automatización, alertas, búsquedas rápidas |
| **Gerencia Farmacéutica** | Reducir costos, mejorar eficiencia | Reportes, análisis, trazabilidad |
| **Junta Directiva** | ROI, competitividad | Métricas de éxito, ahorro económico |
| **Médicos** | Disponibilidad de medicamentos | Acceso rápido a medicamentos |
| **Pacientes** | Medicamentos seguros | Calidad en atención farmacéutica |
| **Equipo Técnico** | Arquitectura escalable | Estándares, APIs, integrabilidad |
| **Auditoría/Cumplimiento** | Regulaciones | Trazabilidad, auditoría, logs |

---

## Objetivos Clave del Proyecto

### Corto Plazo (3-6 meses)
1.  Implementar gestión de medicamentos
2.  Automatizar control de inventario
3.  Crear APIs seguras
4.  Desarrollar 10 casos de prueba

### Mediano Plazo (6-12 meses)
1.  Sistema de reportes avanzados
2.  Machine learning para predicción
3.  Integración con EHR existente
4.  Mobile app para farmacéuticos

### Largo Plazo (1-3 años)
1.  Expansión a otros departamentos hospitalarios
2.  Análisis predictivo de demanda
3.  Portal de pacientes
4.  Integraciones complejas

---

##  Relación entre Requisitos

### Ejemplo: BR-003 (Optimizar Costos)

```
BR-003: Optimizar Costos
   ↓
   ├─ FR-004: Gestión de Compras
   ├─ FR-005: Sistema de Subrogación
   ├─ FR-008: Reportes y Análisis
   ├─ FR-010: Búsqueda y Filtrado
   │
   ↓
   ├─ NFR-001: Rendimiento (análisis rápido de costos)
   ├─ NFR-002: Escalabilidad (millones de transacciones)
   ├─ NFR-005: Mantenibilidad (reportes complejos)
   └─ NFR-012: Monitoreo (alertas de anomalías)
```

---

## Referencias

- **Estándares Aplicables:**
  - HIPAA (Health Insurance Portability Act)
  - GDPR (General Data Protection Regulation)
  - ISO 9001:2015 (Gestión de Calidad)
  - ISO 27001:2013 (Seguridad de Información)

- **Documentos Relacionados:**
  - [FRs.md - Requisitos Funcionales](./FRs.md)
  - [NFRs.md - Requisitos No Funcionales](./NFRs.md)
  - [BRs.md - Requisitos de Negocio](./BRs.md)
  - [../README.md - Portada del Proyecto](../README.md)

---

## Equipo de Farmacia - Tarea Integradora

| Nombre | Usuario GitHub | Rol | Responsabilidades |
|--------|-----------------|-----|------------------|
| **Yazmin Gutierrez Hernández** | [yaz-gutzz](https://github.com/yaz-gutzz) | Arquitecto/Coordinador | Arquitectura Híbrida, API REST, Coordinación General, Documentación |
| **Obed Guzman Garcia** | [@ObedGuzmanGuz](https://github.com/ObedGuzmanGuz) | Desarrollador Backend | Desarrollo API (FastAPI), Lógica de Negocio, Integración SQL-NoSQL, Tests de API |
| **Citlalli Perez Dionicio** | [@KouDionicio](https://github.com/KouDioniciob) | Especialista NoSQL | Desarrollo MongoDB, Esquemas JSON, Colecciones, Tests NoSQL |
| **Michelle Castro Otero** | [@Ktmich2095](https://github.com/Ktmich2095) | Especialista SQL | Desarrollo MySQL, Diseño Relacional, Seguridad, Optimización, Tests SQL |

---

**Documento:** Contexto del Proyecto - Sistema Farmacéutico Hospitalario  
**Versión:** 1.0  
**Última Actualización:** Abril 2026  
**Equipo:** Departamento de Farmacia  
**Estado:** Completado
