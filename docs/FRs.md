# REQUISITOS FUNCIONALES (FRs)

## Sistema de Gestión Farmacéutica Hospitalaria

Los Requisitos Funcionales definen QUÉ debe hacer el sistema para el Departamento de Farmacia de un hospital de tercer nivel. Estos 10 FRs especifican las capacidades técnicas necesarias para gestionar pacientes, medicamentos, inventarios, compras, dispensaciones y reportes en una institución con alta complejidad clínica y volumen de operaciones farmacéuticas.

---

## FR-001: Gestión de Pacientes

### Descripción
El sistema debe permitir el registro, actualización, consulta y supervisión completa de pacientes hospitalizados.

### Funcionalidades
- Crear nuevo paciente con datos personales (nombre, apellido, cédula, fecha nacimiento)
- Actualizar información de paciente
- Consultar historial médico completo
- Asignar número de expediente único
- Registrar tipo de sangre y alergias
- Documentar enfermedades crónicas
- Cambiar estado del paciente (Activo, Inactivo, Suspendido)

### Actores Involucrados
- Personal de enfermería
- Médicos
- Farmacéuticos

### Criterios de Aceptación
- [ ] Se pueden registrar mínimo 10,000 pacientes
- [ ] Los datos se guardan en BD SQL
- [ ] Se validan todos los campos obligatorios
- [ ] Se previene duplicación de cédulas

---

## FR-002: Gestión de Medicamentos

### Descripción
El sistema debe mantener un catálogo completo de medicamentos con información de precios, presentaciones y disponibilidad.

### Funcionalidades
- Crear medicamento con nombre, principio activo, dosis
- Actualizar información de medicamento
- Consultar medicamentos por criterios (nombre, principio activo, presentación)
- Gestionar precios unitarios
- Definir cantidades mínimas y máximas
- Cambiar estado (Activo, Inactivo, Descontinuado)
- Registrar proveedores de medicamentos

### Actores Involucrados
- Farmacéuticos
- Gerente de Compras
- Administrador de Farmacia

### Criterios de Aceptación
- [ ] Se pueden registrar mínimo 5,000 medicamentos
- [ ] Los precios se actualizan en tiempo real
- [ ] Se validan dosis y presentaciones
- [ ] Se registra historial de cambios de precios

---

## FR-003: Control de Inventario

### Descripción
El sistema debe monitorear constantemente el inventario de medicamentos y generar alertas automáticas.

### Funcionalidades
- Mostrar cantidad actual en stock para cada medicamento
- Comparar cantidad actual vs. mínima
- Comparar cantidad actual vs. máxima
- Generar alertas para medicamentos críticos (stock < mínimo)
- Generar alertas para exceso de stock
- Reportar medicamentos sin stock
- Historial de movimientos de inventario

### Actores Involucrados
- Farmacéuticos
- Almacenista
- Alertas automáticas del sistema

### Criterios de Aceptación
- [ ] Las alertas se generan en menos de 1 segundo
- [ ] Se registra quién, qué, cuándo en cada movimiento
- [ ] Se pueden exportar reportes de inventario
- [ ] El sistema actualiza en tiempo real

---

## FR-004: Gestión de Compras

### Descripción
El sistema debe automatizar el proceso de compra de medicamentos y documentar todas las transacciones.

### Funcionalidades
- Crear orden de compra
- Seleccionar medicamento y cantidad
- Asignar proveedor
- Registrar precio unitario y total
- Generar número único de compra
- Consultar historial de compras
- Actualizar automáticamente inventario al completar compra

### Actores Involucrados
- Gerente de Compras
- Farmacéutico Responsable
- Sistemas (actualización automática)

### Criterios de Aceptación
- [ ] Cada compra genera ID único
- [ ] Los precios se registran al momento de compra
- [ ] El inventario se actualiza automáticamente
- [ ] Se valida disponibilidad de medicamento
- [ ] Se registra fecha y usuario de compra

---

## FR-005: Sistema de Subrogación

### Descripción
El sistema debe detectar automáticamente medicamentos sin stock y sugerir sustitutos, incluyendo análisis económico.

### Funcionalidades
- Monitorear medicamentos con stock = 0
- Sugerir medicamentos sustitutos con mismo principio activo
- Calcular diferencia de costo entre medicamentos
- Documentar motivo de cambio
- Aplicar subrogación automática (con aprobación)
- Registrar en historial de subrogaciones
- Calcular ahorro económico de subrogaciones

### Actores Involucrados
- Sistema de Monitoreo (automático)
- Farmacéutico Responsable
- Médico Prescriptor

### Criterios de Aceptación
- [ ] Detecta stock=0 en tiempo real
- [ ] Sugiere sustitutos en menos de 2 segundos
- [ ] Calcula diferencia económica correctamente
- [ ] Mantiene trazabilidad completa
- [ ] Genera reportes de ahorro

---

## FR-006: Dispensación de Medicamentos

### Descripción
El sistema debe registrar cada medicamento dispensado a pacientes con trazabilidad completa.

### Funcionalidades
- Registrar medicamento dispensado por farmacéutico
- Validar receta médica
- Asociar medicamento a paciente
- Reducir automáticamente inventario
- Generar comprobante de dispensación
- Registrar farmacéutico responsable
- Historial de dispensaciones por paciente

### Actores Involucrados
- Farmacéutico
- Paciente
- Sistema (reducción de inventario)

### Criterios de Aceptación
- [ ] Se valida receta antes de dispensar
- [ ] El inventario se reduce correctamente
- [ ] Se genera comprobante con detalles
- [ ] Se registra fecha, hora y farmacéutico
- [ ] Se previene dispensación sin receta

---

## FR-007: Autenticación y Seguridad

### Descripción
El sistema debe controlar acceso mediante autenticación JWT y registrar todas las operaciones.

### Funcionalidades
- Autenticación con usuario y contraseña
- Generación de token JWT
- Renovación de token
- Cierre de sesión
- Validación de permisos por rol
- Bitácora de auditoría de acciones
- Encriptación de contraseñas

### Actores Involucrados
- Usuarios del Sistema
- Administrador de Seguridad
- Sistema de Auditoría

### Criterios de Aceptación
- [ ] Las contraseñas se encriptan con SHA-256
- [ ] Los tokens expiran en 1 hora
- [ ] Se registra cada acción en auditoría
- [ ] Se previene acceso no autorizado
- [ ] Se audita intentos fallidos de acceso

---

## FR-008: Reportes y Análisis

### Descripción
El sistema debe generar reportes detallados sobre operaciones farmacéuticas y proveer datos para análisis.

### Funcionalidades
- Reporte de inventario actual
- Reporte de medicamentos críticos
- Reporte de costos de medicamentos
- Reporte de rotación de inventario
- Reporte de subrogaciones aplicadas
- Análisis de ahorro económico
- Exportar reportes (PDF, Excel, CSV)

### Actores Involucrados
- Farmacéutico
- Gerente de Compras
- Administrador General
- Sistema de Reportes

### Criterios de Aceptación
- [ ] Se pueden generar reportes en < 5 segundos
- [ ] Los datos son precisos y actualizados
- [ ] Se pueden filtrar por fechas y criterios
- [ ] Se exportan en múltiples formatos
- [ ] Las gráficas son legibles y precisas

---

## FR-009: Gestión de Proveedores

### Descripción
El sistema debe mantener información de proveedores y facilitar la gestión de relaciones comerciales.

### Funcionalidades
- Registrar datos de proveedor
- Actualizar información de contacto
- Consultar medicamentos por proveedor
- Registrar historial de compras por proveedor
- Evaluar desempeño de proveedor
- Cambiar estado (Activo, Inactivo)

### Actores Involucrados
- Gerente de Compras
- Farmacéutico
- Proveedores

### Criterios de Aceptación
- [ ] Se registran datos completos de proveedor
- [ ] Se mantiene historial de transacciones
- [ ] Se validan contactos de correo/teléfono
- [ ] Se pueden desactivar proveedores sin perder datos

---

## FR-010: Búsqueda y Filtrado

### Descripción
El sistema debe permitir búsquedas rápidas y eficientes de medicamentos, pacientes y transacciones.

### Funcionalidades
- Buscar medicamento por nombre
- Buscar por principio activo
- Buscar paciente por cédula o nombre
- Filtrar por rango de fechas
- Filtrar por proveedor
- Búsqueda avanzada con múltiples criterios
- Autocompletado en búsquedas

### Actores Involucrados
- Todos los usuarios del sistema

### Criterios de Aceptación
- [ ] Las búsquedas responden en < 500ms
- [ ] Se pueden combinar múltiples filtros
- [ ] Los resultados son precisos
- [ ] Se soportan búsquedas parciales
- [ ] Se registran búsquedas en auditoría

---

## Resumen de FRs

| ID | Requisito | Estado | Prioridad |
|----|-----------|---------|----|
| FR-001 | Gestión de Pacientes | Pendiente | Alta |
| FR-002 | Gestión de Medicamentos | Pendiente | Alta |
| FR-003 | Control de Inventario | Pendiente | Alta |
| FR-004 | Gestión de Compras | Pendiente | Alta |
| FR-005 | Sistema de Subrogación | Pendiente | Media |
| FR-006 | Dispensación | Pendiente | Alta |
| FR-007 | Autenticación | Pendiente | Alta |
| FR-008 | Reportes | Pendiente | Media |
| FR-009 | Gestión Proveedores | Pendiente | Media |
| FR-010 | Búsqueda y Filtrado | Pendiente | Media |

---

**Documento:** Requisitos Funcionales - Sistema Farmacéutico Hospitalario  
**Última Actualización:** Abril 2026  
**Equipo:** Departamento de Farmacia
