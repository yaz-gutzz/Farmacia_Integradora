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
- **mecanismo_monitoreo.js** - Cambios stream y monitoreo

---

## Colecciones

| Coleccion | Descripcion |
|---|---|
| `subrogacion_medicamentos` | Solicitudes de subrogacion de medicamentos |
| `inventario_medicamentos` | Inventario actual de medicamentos y movimientos |
| `dispensacion` | Dispensacion de medicamentos a pacientes |
| `detalle_compra` | Compras de medicamentos a proveedores |

Para el detalle de campos y estructuras de cada coleccion consultar el diccionario de datos en PDF.

---

**Base de datos:** `hospital_medicamentos` — **Servidor:** localhost:27017 — **Abril 2026**
