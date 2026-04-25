
# 🔐 Bitácora de Seguridad - Módulo Farmacéutico

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;">
<img src="https://img.shields.io/badge/Module-Farmacia%20Hospitalaria-red?style=flat-square" />
</td>
<td align="center" style="border: none; padding: 10px;">
<img src="https://img.shields.io/badge/Security-Audit%20Log-blue?style=flat-square" />
</td>
<td align="center" style="border: none; padding: 10px;">
<img src="https://img.shields.io/badge/Database-MySQL-brightblue?style=flat-square" />
</td>
<td align="center" style="border: none; padding: 10px;">
<img src="https://img.shields.io/badge/Automation-Automatic%20Logging-orange?style=flat-square" />
</td>
</tr>
</table>

---

## 🧠 ¿Qué es la Bitácora de Seguridad?

La bitácora de seguridad es un componente del sistema farmacéutico hospitalario que registra automáticamente todas las operaciones críticas realizadas sobre las tablas principales del módulo.

Su propósito es garantizar la trazabilidad de los cambios, mantener un historial confiable y mejorar el control de la información dentro del sistema.

---

## 🎯 Objetivo

El objetivo principal de la bitácora es asegurar la integridad y seguridad de los datos, permitiendo:

- Registrar todas las operaciones relevantes del sistema
- Identificar el usuario responsable de cada cambio
- Mantener un historial de modificaciones en tiempo real
- Facilitar auditorías del sistema farmacéutico
- Mejorar el control de inventarios, lotes y recetas médicas

---

## 📊 Tablas que generan registros en la bitácora

La bitácora almacena información proveniente de las siguientes tablas:

- 🧪 `tbd_ph_lotes_medicamentos` → Control de lotes y caducidad
- 💊 `tbd_ph_inventario_medicamentos` → Gestión de inventario
- 🧾 `tbd_ph_detalle_receta` → Medicamentos en recetas
- 💉 `tbc_ph_medicamentos` → Catálogo de medicamentos
- 🧑‍⚕️ `tbb_ph_recetas_medicas` → Control de recetas médicas

---

## 🧠 Descripción de los campos

### 🔹 ID
Identificador único del registro en la bitácora.

### 🔹 Nombre_Tabla
Indica la tabla donde ocurrió la operación.

### 🔹 Registro_ID
Identifica el registro afectado dentro de la tabla original.

### 🔹 Usuario
Usuario que realizó la operación en el sistema.

### 🔹 Operacion
Tipo de acción realizada:

- INSERT → creación de registro  
- UPDATE → modificación de registro  
- DELETE → eliminación de registro  

### 🔹 Descripcion
Detalle del cambio realizado, permitiendo entender qué ocurrió en la operación.

### 🔹 Fecha_Hora
Fecha y hora exacta del registro de la operación.

---

## ⚙️ Funcionamiento

La bitácora funciona de manera automática, registrando todas las operaciones realizadas en las tablas del sistema farmacéutico.

Esto permite capturar los cambios sin intervención manual, asegurando un historial completo e inalterable de las acciones del sistema.

---

## 🧱 Estructura de la Bitácora

```sql
CREATE TABLE tbi_bitacora_ph (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nombre_Tabla VARCHAR(80) NOT NULL,
    Registro_ID INT UNSIGNED NOT NULL,
    Usuario VARCHAR(80) NOT NULL,
    Operacion ENUM('INSERT','UPDATE','DELETE') NOT NULL,
    Descripcion TEXT,
    Fecha_Hora DATETIME DEFAULT CURRENT_TIMESTAMP
);

