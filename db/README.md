# 🗄️ Implementación de Base de Datos Relacional - Farmacia Hospitalaria

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;">
<img src="https://img.shields.io/badge/Database-MySQL%205.7%2B-blue?style=flat-square" />
</td>
<td align="center" style="border: none; padding: 10px;">
<img src="https://img.shields.io/badge/Model-Relational%20Model-orange?style=flat-square" />
</td>
<td align="center" style="border: none; padding: 10px;">
<img src="https://img.shields.io/badge/Security-RBAC%20%2B%20Audit-red?style=flat-square" />
</td>
<td align="center" style="border: none; padding: 10px;">
<img src="https://img.shields.io/badge/Backup-Automation-green?style=flat-square" />
</td>
</tr>
</table>

---

## 🧠 Descripción General

Este proyecto implementa una **Base de Datos Relacional en MySQL** para un sistema de farmacia hospitalaria de tercer nivel, integrando modelos de datos normalizados, llaves primarias y foráneas, restricciones de integridad, bitácora de seguridad, mecanismos de respaldo y monitoreo del sistema.

El objetivo es garantizar la **integridad, seguridad, disponibilidad y trazabilidad de los datos clínicos y farmacéuticos**.

---

## 🧱 Modelo Relacional (MR)

El Modelo Relacional define la estructura lógica de la base de datos, estableciendo:

- Entidades principales: medicamentos, pacientes, recetas, inventario, usuarios
- Relaciones entre tablas (1:1, 1:N, N:M)
- Llaves primarias (PK) y foráneas (FK)
- Normalización de datos (hasta 3FN)
- Eliminación de redundancia e inconsistencias

✔ Garantiza consistencia en la información  
✔ Permite escalabilidad del sistema  
✔ Evita duplicidad de datos  

---

## 📊 Diccionario de Datos (DD)

El diccionario de datos documenta la estructura lógica de las tablas:

- Nombre de tablas
- Descripción de campos
- Tipos de datos
- Restricciones (NOT NULL, UNIQUE, etc.)
- Relaciones entre entidades

Ejemplo de entidades principales:

- tbc_ph_medicamentos  
- tbb_ph_recetas_medicas  
- tbd_ph_lotes_medicamentos  
- tbd_ph_inventario_medicamentos  
- tbd_ph_detalle_receta  

✔ Facilita mantenimiento del sistema  
✔ Mejora comprensión del modelo  
✔ Documenta la estructura completa de la BD  

---

## 🔗 Integridad Referencial

La base de datos implementa integridad referencial mediante:

- FOREIGN KEY entre tablas relacionadas
- Restricciones ON DELETE / ON UPDATE
- Validación de consistencia entre módulos

✔ Evita registros huérfanos  
✔ Mantiene relaciones consistentes  
✔ Protege la integridad de los datos clínicos  

---

## 🔐 Bitácora de Seguridad

Se implementa una bitácora de auditoría (`tbi_bitacora_ph`) que registra automáticamente las operaciones críticas del sistema:

- INSERT
- UPDATE
- DELETE

### Funciones principales:

- Registro de usuario que realiza cambios
- Tabla afectada
- Registro modificado
- Descripción del cambio
- Fecha y hora de operación

✔ Trazabilidad completa del sistema  
✔ Auditoría de acciones críticas  
✔ Control de modificaciones en datos farmacéuticos  

---

## 💾 Respaldos de Base de Datos

Se implementa un sistema de respaldos dividido en tres tipos:

### 📌 Respaldo Manual Completo
- Copia total de la base de datos
- Incluye estructura + datos
- Usado para migraciones o recuperación total

### 📌 Respaldo Manual Parcial
- Solo estructura (sin datos)
- Usado para replicación del modelo
- Ideal para ambientes de desarrollo

### 📌 Respaldo Automatizado
- Generado mediante script SQL / programación
- Ejecución programada (00:00, 06:00, 12:00, 18:00)
- Compresión y almacenamiento automático

✔ Prevención de pérdida de datos  
✔ Recuperación ante fallos  
✔ Continuidad operativa del sistema  

---

## 📈 Mecanismo de Monitoreo

El sistema incluye monitoreo de base de datos mediante:

- Seguimiento de operaciones CRUD
- Registro de actividad en tablas críticas
- Indicadores de rendimiento (consultas y tiempos)
- Detección de cambios en inventario y recetas

✔ Control de rendimiento del sistema  
✔ Detección de anomalías  
✔ Supervisión de operaciones críticas  

---

## 📌 Respaldo y Seguridad (Arquitectura General)

El sistema se complementa con:

- Bitácora de seguridad automatizada
- Respaldos manuales y automáticos
- Monitoreo de actividad
- Modelo relacional optimizado

---

## 🚀 Conclusión

La implementación de esta base de datos garantiza un sistema robusto, seguro y escalable para la gestión farmacéutica hospitalaria, integrando:

✔ Modelo relacional normalizado  
✔ Integridad referencial  
✔ Auditoría mediante bitácora  
✔ Estrategias de respaldo  
✔ Mecanismos de monitoreo  

---

