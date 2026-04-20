# Suite de Pruebas - 10 Casos de Negocio

Suite de pruebas que valida los 10 casos de negocio críticos del Departamento de Farmacia en un hospital de tercer nivel. Incluye pruebas de funcionalidad, rendimiento, integración y manejo de errores para todas las operaciones farmacéuticas.

---

## TEST 01: Conexión a Base de Datos

**Clave:** TEST-01  
**Nombre:** Conexión a Base de Datos  
**Descripción:** Validar la conexión exitosa a MySQL y MongoDB  
**Objetivo:** Asegurar que la API puede conectar correctamente con ambas bases de datos  
**Criterios de Aprobación:**
- Conexión a MySQL exitosa
- Conexión a MongoDB exitosa
- Respuesta de prueba de conexión en menos de 1 segundo

**Estatus:** Pendiente  
**Evidencias:** [EVIDENCIAS/TEST-01-conexion.md](./EVIDENCIAS/TEST-01-conexion.md)

---

## TEST 02: Performance Masivo

**Clave:** TEST-02  
**Nombre:** Performance Masivo  
**Descripción:** Procesar grandes volúmenes de registros (500+ unidades)  
**Objetivo:** Validar rendimiento de la API con grandes volúmenes de datos  
**Criterios de Aprobación:**
- Procesa 500+ registros sin errores
- Tiempo de respuesta < 2 segundos
- Inventario actualizado correctamente
- Sin pérdida de datos

**Estatus:** Pendiente  
**Evidencias:** [EVIDENCIAS/TEST-02-performance.md](./EVIDENCIAS/TEST-02-performance.md)

---

## TEST 03: Integridad de Datos

**Clave:** TEST-03  
**Nombre:** Integridad de Datos  
**Descripción:** Validar la consistencia de datos entre MySQL y MongoDB  
**Objetivo:** Asegurar que no hay inconsistencias en la sincronización híbrida  
**Criterios de Aprobación:**
- Datos coinciden entre ambas bases de datos
- No hay registros duplicados
- Integridad referencial mantenida
- Transacciones completadas correctamente

**Estatus:** Pendiente  
**Evidencias:** [EVIDENCIAS/TEST-03-integridad.md](./EVIDENCIAS/TEST-03-integridad.md)

---

## TEST 04: Validaciones de Negocio

**Clave:** TEST-04  
**Nombre:** Validaciones de Negocio  
**Descripción:** Validar reglas de negocio en operaciones de medicamentos y pacientes  
**Objetivo:** Asegurar que se cumplen todas las reglas de negocio del departamento de farmacia  
**Criterios de Aprobación:**
- Rechaza medicamentos expirados
- Valida cantidad mínima de stock
- Verifica datos obligatorios de pacientes
- Responde con códigos de error apropiados

**Estatus:** Pendiente  
**Evidencias:** [EVIDENCIAS/TEST-04-validaciones.md](./EVIDENCIAS/TEST-04-validaciones.md)

---

## TEST 05: Auditoría y Cambios

**Clave:** TEST-05  
**Nombre:** Auditoría y Cambios  
**Descripción:** Validar el registro de auditoría de todos los cambios realizados  
**Objetivo:** Asegurar que se registran todos los cambios con usuario, fecha y detalles  
**Criterios de Aprobación:**
- Se registra cada cambio en bitácora
- Datos antes/después capturados
- Usuario y timestamp registrados
- No se pueden modificar registros de auditoría

**Estatus:** Pendiente  
**Evidencias:** [EVIDENCIAS/TEST-05-auditoria.md](./EVIDENCIAS/TEST-05-auditoria.md)

---

## TEST 06: Respaldos Automatizados

**Clave:** TEST-06  
**Nombre:** Respaldos Automatizados  
**Descripción:** Validar que los respaldos automáticos se ejecutan y recuperan correctamente  
**Objetivo:** Asegurar disponibilidad de datos ante pérdida o corrupción  
**Criterios de Aprobación:**
- Respaldo completo ejecutado exitosamente
- Respaldo incremental registrado
- Recuperación de datos posible
- Integridad de datos restaurados verificada

**Estatus:** Pendiente  
**Evidencias:** [EVIDENCIAS/TEST-06-respaldos.md](./EVIDENCIAS/TEST-06-respaldos.md)

---

## TEST 07: Control de Acceso

**Clave:** TEST-07  
**Nombre:** Control de Acceso  
**Descripción:** Validar que los permisos por rol se aplican correctamente  
**Objetivo:** Asegurar que solo usuarios autorizados pueden acceder a datos sensibles  
**Criterios de Aprobación:**
- Administrador accede a todo
- Farmacéutico accede a medicamentos
- Médico solo ve medicamentos asignados
- Auditor sin permisos de modificación

**Estatus:** Pendiente  
**Evidencias:** [EVIDENCIAS/TEST-07-control_acceso.md](./EVIDENCIAS/TEST-07-control_acceso.md)

---

## TEST 08: Recuperación ante Desastres

**Clave:** TEST-08  
**Nombre:** Recuperación ante Desastres  
**Descripción:** Validar que el sistema se recupera ante fallos de base de datos  
**Objetivo:** Asegurar continuidad del servicio ante fallos críticos  
**Criterios de Aprobación:**
- Recuperación automática de conexión
- Reintentos exponenciales funcionales
- Datos no se pierden
- Alertas generadas correctamente

**Estatus:** Pendiente  
**Evidencias:** [EVIDENCIAS/TEST-08-recuperacion.md](./EVIDENCIAS/TEST-08-recuperacion.md)

---

## TEST 09: Sincronización de Datos

**Clave:** TEST-09  
**Nombre:** Sincronización de Datos  
**Descripción:** Validar sincronización bidireccional entre MySQL y MongoDB  
**Objetivo:** Asegurar consistencia de datos en arquitectura híbrida  
**Criterios de Aprobación:**
- Cambios en MySQL reflejados en MongoDB
- Cambios en MongoDB reflejados en MySQL
- Sin retrasos significativos
- Conflictos resueltos correctamente

**Estatus:** Pendiente  
**Evidencias:** [EVIDENCIAS/TEST-09-sincronizacion.md](./EVIDENCIAS/TEST-09-sincronizacion.md)

---

## TEST 10: Optimización de Índices

**Clave:** TEST-10  
**Nombre:** Optimización de Índices  
**Descripción:** Validar que los índices mejoran el rendimiento de consultas  
**Objetivo:** Asegurar que las consultas se ejecutan con máximo rendimiento  
**Criterios de Aprobación:**
- Consultas frecuentes < 100ms
- Índices activos en tablas críticas
- Ejecución de plan óptima
- Sin consultas N+1

**Estatus:** Pendiente  
**Evidencias:** [EVIDENCIAS/TEST-10-optimizacion.md](./EVIDENCIAS/TEST-10-optimizacion.md)

---

**Última actualización:** Abril 2026
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
