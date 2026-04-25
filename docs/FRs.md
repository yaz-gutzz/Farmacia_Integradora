# REQUISITOS FUNCIONALES (FRs)

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Type-Functional%20Requirements-blue?style=flat-square" alt="FRs"/></td>
<<<<<<< HEAD
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Count-15%20Defined-green?style=flat-square" alt="Count"/></td>
=======
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Count-10%20Defined-green?style=flat-square" alt="Count"/></td>
>>>>>>> Integradora-Obed
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Status-Complete-brightgreen?style=flat-square" alt="Complete"/></td>
</tr>
</table>

## Sistema de Gestión Farmacéutica Hospitalaria

<<<<<<< HEAD
Los Requisitos Funcionales definen QUÉ debe hacer el sistema para el Departamento de Farmacia de un hospital de tercer nivel. Estos 15 FRs especifican las capacidades técnicas necesarias para gestionar pacientes, medicamentos, recetas médicas, inventario por lotes, compras, dispensaciones, subrogaciones y bitácoras de auditoría en una institución con alta complejidad clínica y volumen de operaciones farmacéuticas.
=======
Los Requisitos Funcionales definen QUÉ debe hacer el sistema para el Departamento de Farmacia de un hospital de tercer nivel. Estos 10 FRs especifican las capacidades técnicas necesarias para gestionar pacientes, medicamentos, inventarios, compras, dispensaciones y reportes en una institución con alta complejidad clínica y volumen de operaciones farmacéuticas.
>>>>>>> Integradora-Obed

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
<<<<<<< HEAD
El sistema debe mantener un catálogo completo de medicamentos con clasificación por tipo, atributos farmacológicos y administrativos, precios, presentaciones y disponibilidad.

### Funcionalidades
- Crear medicamento con nombre, principio activo, dosis, presentación
- Clasificar medicamentos por tipo: **Normal, Controlado, Alto Costo**
- Activar o desactivar medicamentos mediante estatus (Activo/Inactivo/Descontinuado)
- Validar que el medicamento esté **ACTIVO** antes de cualquier operación
- Actualizar información de medicamento
- Consultar medicamentos por criterios
- Gestionar precios unitarios
- Definir cantidades mínimas y máximas
- Registrar proveedores de medicamentos
- Registrar historial de cambios de precios
=======
El sistema debe mantener un catálogo completo de medicamentos con información de precios, presentaciones y disponibilidad.

### Funcionalidades
- Crear medicamento con nombre, principio activo, dosis
- Actualizar información de medicamento
- Consultar medicamentos por criterios (nombre, principio activo, presentación)
- Gestionar precios unitarios
- Definir cantidades mínimas y máximas
- Cambiar estado (Activo, Inactivo, Descontinuado)
- Registrar proveedores de medicamentos
>>>>>>> Integradora-Obed

### Actores Involucrados
- Farmacéuticos
- Gerente de Compras
- Administrador de Farmacia

### Criterios de Aceptación
- [ ] Se pueden registrar mínimo 5,000 medicamentos
- [ ] Los precios se actualizan en tiempo real
- [ ] Se validan dosis y presentaciones
- [ ] Se registra historial de cambios de precios
<<<<<<< HEAD
- [ ] No se puede recetar un medicamento inactivo
- [ ] No se puede agregar a inventario un medicamento inactivo
- [ ] La clasificación por tipo es obligatoria
=======
>>>>>>> Integradora-Obed

---

## FR-003: Control de Inventario

### Descripción
<<<<<<< HEAD
El sistema debe monitorear constantemente el inventario basado en lotes de medicamentos y generar alertas automáticas.

### Funcionalidades
- Mostrar cantidad actual en stock por medicamento y lote
- Gestionar inventario por **número de lote**
- Registrar **fecha de fabricación y caducidad** por lote
- Actualizar automáticamente el stock al surtir recetas
- Impedir surtir medicamentos sin existencia suficiente
- Generar alertas de **stock bajo**
- Generar alertas de exceso de stock
- Aplicar política **FEFO** (First Expired, First Out)
- Alertar sobre lotes próximos a caducar
- Historial de movimientos de inventario por lote
=======
El sistema debe monitorear constantemente el inventario de medicamentos y generar alertas automáticas.

### Funcionalidades
- Mostrar cantidad actual en stock para cada medicamento
- Comparar cantidad actual vs. mínima
- Comparar cantidad actual vs. máxima
- Generar alertas para medicamentos críticos (stock < mínimo)
- Generar alertas para exceso de stock
- Reportar medicamentos sin stock
- Historial de movimientos de inventario
>>>>>>> Integradora-Obed

### Actores Involucrados
- Farmacéuticos
- Almacenista
- Alertas automáticas del sistema

### Criterios de Aceptación
- [ ] Las alertas se generan en menos de 1 segundo
<<<<<<< HEAD
- [ ] Se registra quién, qué, cuándo y qué lote en cada movimiento
- [ ] Se pueden exportar reportes de inventario
- [ ] El sistema valida stock suficiente antes de dispensar
- [ ] Los lotes vencidos no aparecen en stock disponible
- [ ] Al surtir, se usa el lote más próximo a caducar (FEFO)
=======
- [ ] Se registra quién, qué, cuándo en cada movimiento
- [ ] Se pueden exportar reportes de inventario
- [ ] El sistema actualiza en tiempo real
>>>>>>> Integradora-Obed

---

## FR-004: Gestión de Compras

### Descripción
El sistema debe automatizar el proceso de compra de medicamentos y documentar todas las transacciones.

### Funcionalidades
- Crear orden de compra
<<<<<<< HEAD
- Seleccionar medicamento, lote y cantidad
=======
- Seleccionar medicamento y cantidad
>>>>>>> Integradora-Obed
- Asignar proveedor
- Registrar precio unitario y total
- Generar número único de compra
- Consultar historial de compras
- Actualizar automáticamente inventario al completar compra
<<<<<<< HEAD
- Registrar fechas de fabricación y caducidad del lote recibido
=======
>>>>>>> Integradora-Obed

### Actores Involucrados
- Gerente de Compras
- Farmacéutico Responsable
- Sistemas (actualización automática)

### Criterios de Aceptación
- [ ] Cada compra genera ID único
- [ ] Los precios se registran al momento de compra
- [ ] El inventario se actualiza automáticamente
<<<<<<< HEAD
- [ ] Se registra fecha y usuario de compra
- [ ] No se puede recibir un lote ya caducado
=======
- [ ] Se valida disponibilidad de medicamento
- [ ] Se registra fecha y usuario de compra
>>>>>>> Integradora-Obed

---

## FR-005: Sistema de Subrogación

### Descripción
<<<<<<< HEAD
El sistema debe detectar automáticamente medicamentos sin stock y sugerir sustitutos, registrando toda la información del paciente, receta y medicamento subrogado.
=======
El sistema debe detectar automáticamente medicamentos sin stock y sugerir sustitutos, incluyendo análisis económico.
>>>>>>> Integradora-Obed

### Funcionalidades
- Monitorear medicamentos con stock = 0
- Sugerir medicamentos sustitutos con mismo principio activo
<<<<<<< HEAD
- Calcular diferencia de costo
- Documentar motivo de cambio
- Registrar en historial: **paciente, receta original, medicamento original, sustituto**
- Aplicar subrogación con aprobación
- Calcular ahorro económico
- Generar reportes de ahorro
=======
- Calcular diferencia de costo entre medicamentos
- Documentar motivo de cambio
- Aplicar subrogación automática (con aprobación)
- Registrar en historial de subrogaciones
- Calcular ahorro económico de subrogaciones
>>>>>>> Integradora-Obed

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
<<<<<<< HEAD
El sistema debe registrar cada medicamento dispensado a pacientes con trazabilidad completa y validación de receta.

### Funcionalidades
- Registrar medicamento dispensado
- Validar receta médica (estado, vigencia)
- Asociar medicamento a paciente
- Reducir automáticamente inventario del lote correspondiente
- Generar comprobante de dispensación
- Registrar farmacéutico responsable
- Validar que el medicamento esté **activo** antes de dispensar
=======
El sistema debe registrar cada medicamento dispensado a pacientes con trazabilidad completa.

### Funcionalidades
- Registrar medicamento dispensado por farmacéutico
- Validar receta médica
- Asociar medicamento a paciente
- Reducir automáticamente inventario
- Generar comprobante de dispensación
- Registrar farmacéutico responsable
- Historial de dispensaciones por paciente
>>>>>>> Integradora-Obed

### Actores Involucrados
- Farmacéutico
- Paciente
- Sistema (reducción de inventario)

### Criterios de Aceptación
- [ ] Se valida receta antes de dispensar
<<<<<<< HEAD
- [ ] El inventario se reduce correctamente (FEFO)
=======
- [ ] El inventario se reduce correctamente
>>>>>>> Integradora-Obed
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
<<<<<<< HEAD
El sistema debe generar reportes detallados sobre operaciones farmacéuticas.
=======
El sistema debe generar reportes detallados sobre operaciones farmacéuticas y proveer datos para análisis.
>>>>>>> Integradora-Obed

### Funcionalidades
- Reporte de inventario actual
- Reporte de medicamentos críticos
- Reporte de costos de medicamentos
- Reporte de rotación de inventario
- Reporte de subrogaciones aplicadas
<<<<<<< HEAD
- Reporte de lotes próximos a caducar
=======
>>>>>>> Integradora-Obed
- Análisis de ahorro económico
- Exportar reportes (PDF, Excel, CSV)

### Actores Involucrados
- Farmacéutico
- Gerente de Compras
- Administrador General
<<<<<<< HEAD

### Criterios de Aceptación
- [ ] Reportes generados en < 5 segundos
- [ ] Datos precisos y actualizados
- [ ] Filtros por fechas y criterios
- [ ] Exportación en múltiples formatos
=======
- Sistema de Reportes

### Criterios de Aceptación
- [ ] Se pueden generar reportes en < 5 segundos
- [ ] Los datos son precisos y actualizados
- [ ] Se pueden filtrar por fechas y criterios
- [ ] Se exportan en múltiples formatos
- [ ] Las gráficas son legibles y precisas
>>>>>>> Integradora-Obed

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
<<<<<<< HEAD
- [ ] Datos completos de proveedor
- [ ] Historial de transacciones
- [ ] Validación de contactos
- [ ] Desactivación sin pérdida de datos
=======
- [ ] Se registran datos completos de proveedor
- [ ] Se mantiene historial de transacciones
- [ ] Se validan contactos de correo/teléfono
- [ ] Se pueden desactivar proveedores sin perder datos
>>>>>>> Integradora-Obed

---

## FR-010: Búsqueda y Filtrado

### Descripción
<<<<<<< HEAD
El sistema debe permitir búsquedas rápidas y eficientes.
=======
El sistema debe permitir búsquedas rápidas y eficientes de medicamentos, pacientes y transacciones.
>>>>>>> Integradora-Obed

### Funcionalidades
- Buscar medicamento por nombre
- Buscar por principio activo
- Buscar paciente por cédula o nombre
- Filtrar por rango de fechas
- Filtrar por proveedor
<<<<<<< HEAD
- Filtrar por lote
- Búsqueda avanzada con múltiples criterios
- Autocompletado
=======
- Búsqueda avanzada con múltiples criterios
- Autocompletado en búsquedas
>>>>>>> Integradora-Obed

### Actores Involucrados
- Todos los usuarios del sistema

### Criterios de Aceptación
<<<<<<< HEAD
- [ ] Búsquedas responden en < 500ms
- [ ] Múltiples filtros combinables
- [ ] Resultados precisos
- [ ] Búsquedas parciales soportadas

---

## FR-011: Gestión de Recetas Médicas

### Descripción
El sistema debe registrar y gestionar recetas médicas asociadas a pacientes y personal médico, con control de estados y tiempos de expiración.

### Funcionalidades
- Registrar receta con paciente, médico y medicamentos
- Manejar estados: **Pendiente, Surtida, Cancelada**
- Cancelar automáticamente recetas que superen tiempo definido
- Validar que el medicamento esté **activo** antes de prescribir
- Historial de recetas por paciente
- Número único de receta

### Actores Involucrados
- Médicos (prescriben)
- Farmacéuticos (surtén)
- Pacientes (reciben)

### Criterios de Aceptación
- [ ] Receta cancelada no puede surtirse
- [ ] Cancelación automática por tiempo
- [ ] No se prescribe medicamento inactivo
- [ ] Trazabilidad completa de cada receta

---

## FR-012: Gestión de Lotes y Caducidades

### Descripción
El sistema debe gestionar el inventario por lotes con control riguroso de fechas.

### Funcionalidades
- Registrar cada lote con número, fabricación, caducidad, cantidad, proveedor
- Validar que no se dispensen lotes vencidos
- Aplicar política **FEFO**
- Alertar lotes próximos a caducar
- Impedir registro de lotes caducados
- Reporte de lotes por vencer

### Actores Involucrados
- Almacenista
- Farmacéutico
- Sistema (aplica FEFO)

### Criterios de Aceptación
- [ ] Bloqueo automático de lotes vencidos
- [ ] Selección automática del lote más próximo a caducar
- [ ] Reporte de lotes por vencer disponible
- [ ] No se reciben lotes caducados

---

## FR-013: Bitácora de Auditoría

### Descripción
El sistema debe registrar en una bitácora inmutable todas las operaciones INSERT, UPDATE, DELETE.

### Funcionalidades
- Registrar: usuario, timestamp, tipo operación, tabla, valores anteriores, valores nuevos, IP
- Bitácora **no modificable ni eliminable**
- Consulta por fechas, usuario, tabla, operación
- Exportación para auditoría externa

### Actores Involucrados
- Sistema (registra)
- Auditores (consultan)
- Administradores (no pueden modificar)

### Criterios de Aceptación
- [ ] Cada operación genera registro
- [ ] Bitácora inmutable
- [ ] Exportación disponible
- [ ] Retención mínima de 5 años

---

## FR-014: Estados de Receta y Cancelación Automática

### Descripción
El sistema debe manejar los estados de recetas y aplicar cancelación automática basada en tiempo.

### Funcionalidades
- Estados: **Pendiente, Surtida, Cancelada**
- Configurar tiempo máximo de vigencia
- Cancelación automática al superar tiempo
- Notificación de recetas canceladas
- Historial de cambios de estado

### Actores Involucrados
- Médicos
- Farmacéuticos
- Sistema (automático)

### Criterios de Aceptación
- [ ] Cancelación automática funciona correctamente
- [ ] Tiempo de vigencia configurable
- [ ] Notificaciones enviadas
- [ ] Historial de cambios registrado

---

## FR-015: Validación de Medicamento Activo

### Descripción
El sistema debe validar que un medicamento esté activo antes de cualquier operación que lo involucre.

### Funcionalidades
- Validar antes de agregar a inventario
- Validar antes de recetar
- Validar antes de dispensar
- Validar antes de comprar
- Mensaje de error claro cuando está inactivo
- Opción para reactivar medicamentos

### Actores Involucrados
- Sistema (valida automáticamente)
- Todos los usuarios

### Criterios de Aceptación
- [ ] Bloqueo de operaciones con medicamentos inactivos
- [ ] Mensajes claros de error
- [ ] Reactivación solo por usuarios autorizados
=======
- [ ] Las búsquedas responden en < 500ms
- [ ] Se pueden combinar múltiples filtros
- [ ] Los resultados son precisos
- [ ] Se soportan búsquedas parciales
- [ ] Se registran búsquedas en auditoría
>>>>>>> Integradora-Obed

---

## Resumen de FRs

<<<<<<< HEAD
| ID | Requisito | Prioridad |
|----|-----------|-----------|
| FR-001 | Gestión de Pacientes | Alta |
| FR-002 | Gestión de Medicamentos | Alta |
| FR-003 | Control de Inventario | Alta |
| FR-004 | Gestión de Compras | Alta |
| FR-005 | Sistema de Subrogación | Media |
| FR-006 | Dispensación | Alta |
| FR-007 | Autenticación | Alta |
| FR-008 | Reportes | Media |
| FR-009 | Gestión Proveedores | Media |
| FR-010 | Búsqueda y Filtrado | Media |
| FR-011 | Gestión de Recetas | Alta |
| FR-012 | Gestión de Lotes | Alta |
| FR-013 | Bitácora de Auditoría | Alta |
| FR-014 | Estados de Receta | Media |
| FR-015 | Validación Activo | Alta |

---
##  Documentación del Proyecto

El PDF con los requerimientos originales está disponible aquí:

[![PDF Badge](https://img.shields.io/badge/PDF-Requerimientos-red?style=flat-square&logo=adobe-acrobat-reader)](./Requerimientos%20Funcionales%20y%20No%20Funcionales.pdf)

>  **Para el profesor:** Haz clic en el enlace superior para visualizar el PDF original en el navegador.
> 
**Documento:** Requisitos Funcionales - Sistema Farmacéutico Hospitalario  
**Última Actualización:** Abril 2026  
**Equipo:** Departamento de Farmacia
=======
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
>>>>>>> Integradora-Obed
