# Suite de Pruebas - 10 Casos de Negocio

Suite de pruebas que valida los 10 casos de negocio críticos del Departamento de Farmacia en un hospital de tercer nivel. Incluye pruebas de funcionalidad, rendimiento, integración y manejo de errores para todas las operaciones farmacéuticas.

## Estructura de Tests

```
tests/
├── test_01_compra_simple.py
├── test_02_impacto_masivo.py
├── test_03_subrogacion_economica.py
├── test_04_subrogacion_automatica.py
├── test_05_control_errores.py
├── test_06_validacion_pacientes.py
├── test_07_validacion_medicamentos.py
├── test_08_consultas_inventario.py
├── test_09_dispensacion.py
├── test_10_reportes.py
└── README.md
```

---

## TEST 01: Compra Simple de Medicamento

**Clave:** TEST-001  
**Nombre:** Compra Simple de Medicamento  
**Descripción:** Registrar una compra estándar de medicamento desde un proveedor  
**Objetivo:** Validar que se puede registrar una compra correctamente  
**Criterios de Aprobación:**
- Se registra en detalle_compra
- Se actualiza inventario automáticamente
- Se genera ID de compra único
- Respuesta 201 Created

**Estatus:** Pendiente Ejecución  
**Evidencias:** /tests/evidencias/test_01/

---

## TEST 02: Impacto Masivo en Inventario

**Clave:** TEST-002  
**Nombre:** Impacto Masivo  
**Descripción:** Procesar grandes volúmenes de compra (500+ unidades)  
**Objetivo:** Validar rendimiento con grandes volúmenes  
**Criterios de Aprobación:**
- Procesa 500+ registros sin error
- Tiempo respuesta < 2 segundos
- Inventario actualizado correctamente
- Generación de alertas si excede máximo

**Estatus:** Pendiente Ejecución  
**Evidencias:** /tests/evidencias/test_02/

---

## TEST 03: Subrogación Económica

**Clave:** TEST-003  
**Nombre:** Subrogación Económica  
**Descripción:** Analizar cambio de medicamento por diferencia de costo  
**Objetivo:** Validar cálculo de diferencias económicas  
**Criterios de Aprobación:**
- Calcula diferencia de costo correctamente
- Documenta motivo de cambio
- Mantiene trazabilidad completa
- Genera ahorro económico

**Estatus:** Pendiente Ejecución  
**Evidencias:** /tests/evidencias/test_03/

---

## TEST 04: Subrogación Automática

**Clave:** TEST-004  
**Nombre:** Subrogación Automática  
**Descripción:** Sistema auto-detecta stock=0 y sugiere sustitutos  
**Objetivo:** Validar automatización de subrogación  
**Criterios de Aprobación:**
- Detecta stock=0 automáticamente
- Sugiere medicamentos sustitutos
- Aplica subrogación sin intervención manual
- Registra todas las operaciones

**Estatus:** Pendiente Ejecución  
**Evidencias:** /tests/evidencias/test_04/

---

## TEST 05: Control y Validación de Errores

**Clave:** TEST-005  
**Nombre:** Control y Validación de Errores  
**Descripción:** Validación integral de datos y manejo de excepciones  
**Objetivo:** Validar manejo de errores  
**Criterios de Aprobación:**
- Rechaza datos faltantes
- Valida cantidades positivas
- Valida precios válidos
- Retorna error 400 Bad Request

**Estatus:** Pendiente Ejecución  
**Evidencias:** /tests/evidencias/test_05/

---

## TEST 06: Validación de Pacientes

**Clave:** TEST-006  
**Nombre:** Validación de Pacientes  
**Descripción:** Pruebas de creación y consulta de pacientes  
**Objetivo:** Validar gestión de pacientes  
**Criterios de Aprobación:**
- Crea pacientes con datos válidos
- Consulta pacientes registrados
- Actualiza información de pacientes
- Genera ID único por paciente

**Estatus:** Pendiente Ejecución  
**Evidencias:** /tests/evidencias/test_06/

---

## TEST 07: Validación de Medicamentos

**Clave:** TEST-007  
**Nombre:** Validación de Medicamentos  
**Descripción:** Pruebas de creación y consulta de medicamentos  
**Objetivo:** Validar gestión de medicamentos  
**Criterios de Aprobación:**
- Crea medicamentos con datos válidos
- Consulta medicamentos registrados
- Actualiza información de medicamentos
- Genera ID único por medicamento

**Estatus:** Pendiente Ejecución  
**Evidencias:** /tests/evidencias/test_07/

---

## TEST 08: Consultas de Inventario

**Clave:** TEST-008  
**Nombre:** Consultas de Inventario  
**Descripción:** Pruebas de consultas de estado de inventario  
**Objetivo:** Validar reportes de inventario  
**Criterios de Aprobación:**
- Retorna estado actual de inventario
- Identifica medicamentos críticos
- Genera alertas de bajo stock
- Filtra por criterios

**Estatus:** Pendiente Ejecución  
**Evidencias:** /tests/evidencias/test_08/

---

## TEST 09: Dispensación de Medicamentos

**Clave:** TEST-009  
**Nombre:** Dispensación de Medicamentos  
**Descripción:** Pruebas de dispensación a pacientes  
**Objetivo:** Validar proceso de dispensación  
**Criterios de Aprobación:**
- Registra dispensación correctamente
- Actualiza inventario
- Valida receta
- Genera comprobante

**Estatus:** Pendiente Ejecución  
**Evidencias:** /tests/evidencias/test_09/

---

## TEST 10: Reportes del Sistema

**Clave:** TEST-010  
**Nombre:** Reportes del Sistema  
**Descripción:** Pruebas de generación de reportes  
**Objetivo:** Validar reportes disponibles  
**Criterios de Aprobación:**
- Genera reporte de inventario crítico
- Genera reporte de costos
- Genera reporte de rotación
- Datos consistentes con BD

**Estatus:** Pendiente Ejecución  
**Evidencias:** /tests/evidencias/test_10/

---

## Ejecución de Tests

```bash
# Todos los tests
pytest tests/ -v

# Test específico
pytest tests/test_01_compra_simple.py -v

# Con cobertura
pytest tests/ --cov=api --cov-report=html
```

---

**Suite de Pruebas:** Abril 2026  
**Total Tests:** 10  
**Cobertura Esperada:** >80%
