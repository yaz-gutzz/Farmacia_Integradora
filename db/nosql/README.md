<<<<<<< HEAD
# Respaldos y Configuracion NoSQL

![MongoDB](https://img.shields.io/badge/Database-MongoDB-green?style=flat-square&logo=mongodb&logoColor=white)
![Format](https://img.shields.io/badge/Format-JSON%20Backups-blue?style=flat-square)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen?style=flat-square)

Respaldos y configuracion de la base de datos MongoDB que soporta el Departamento de Farmacia. Almacena datos operacionales de compras, inventarios, subrogaciones y dispensaciones.

---

## Contenido

- **respaldo_completo.json** - Respaldo manual completo de todas las colecciones
- **respaldo_parcial.json** - Respaldo manual parcial de colecciones seleccionadas
- **script_respaldo_automatizado.js** - Script automatizado para respaldos periodicos
- **schema_hospital_medicamentos.json** - Schema de la BD + colecciones
- **data_dictionary.md** - Diccionario de datos NoSQL
- **bitacora_seguridad.log** - Log de cambios y auditoria
=======
# Respaldos y Configuración NoSQL

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Database-MongoDB%206.0%2B-green?style=flat-square" alt="MongoDB"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Format-JSON%20Backups-blue?style=flat-square" alt="JSON"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Status-Complete-brightgreen?style=flat-square" alt="Complete"/></td>
</tr>
</table>

Respaldos y configuración de la base de datos MongoDB que soporta el Departamento de Farmacia de un hospital de tercer nivel. Almacena datos operacionales de compras, inventarios, subrogaciones y dispensaciones con flexibilidad y escalabilidad.

## Contenido

### Respaldos Base de Datos MongoDB

- **respaldo_completo.json** - Respaldo manual completo de todas las colecciones
- **respaldo_parcial.json** - Respaldo manual parcial de colecciones seleccionadas
- **script_respaldo_automatizado.js** - Script automatizado para respaldos periódicos

### Estructura de Datos

- **schema_hospital_medicamentos.json** - Schema de la BD + colecciones
- **data_dictionary.md** - Diccionario de datos NoSQL

### Seguridad y Monitoreo

- **bitacora_seguridad.log** - Log de cambios y auditoría
>>>>>>> Integradora-Obed
- **mecanismo_monitoreo.js** - Cambios stream y monitoreo

---

<<<<<<< HEAD
## Colecciones

| Coleccion | Descripcion |
|---|---|
| `subrogacion_medicamentos` | Solicitudes de subrogacion de medicamentos |
| `inventario_medicamentos` | Inventario actual de medicamentos y movimientos |
| `dispensacion` | Dispensacion de medicamentos a pacientes |
| `detalle_compra` | Compras de medicamentos a proveedores |

Para el detalle de campos y estructuras de cada coleccion consultar el diccionario de datos en PDF.

**[Diccionario de Datos NoSQL](./Diccionario_datos_NoSQL(MongoDB).pdf)**

---

**Base de datos:** `hospital_medicamentos` — **Servidor:** localhost:27017 — **Abril 2026**
=======
### Colecciones

1. **detalle_compra** - Registro de compras de medicamentos
2. **inventario_medicamento** - Estado actual de inventarios
3. **subrogacion_medicamentos** - Cambios y sustituciones de medicamentos
4. **dispensaciones** - Histórico de dispensaciones a pacientes

---


>>>>>>> Integradora-Obed
