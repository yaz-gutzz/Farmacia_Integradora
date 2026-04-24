# Scripts SQL - Base de Datos Farmacia Hospitalaria

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Database-MySQL%208.0.37-blue?style=flat-square" alt="MySQL"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Server-Hospital-orange?style=flat-square" alt="Server"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Estado-En%20Desarrollo-yellow?style=flat-square" alt="Estado"/></td>
</tr>
</table>

Documentacion completa y scripts SQL para la base de datos `hospital_matricula` que soporta el modulo de Farmacia Hospitalaria. Incluye estructura de tablas, indices, llaves foraneas, triggers y diccionarios de datos.

---

## PDF - Documentacion Visual del Schema

### Diccionarios de datos incluidos

| Documento | Tabla documentada | Aprobado |
|---|---|---|
| `Diccionarios_datos_Lotes_Medicamentos.pdf` | `tbd_ph_lotes_medicamentos` | Si |
| `Diccionario_datos_Inventario_Medicamentos.pdf` | `tbd_ph_inventario_medicamentos` | Si |
| `Diccionario_datos_detalle_receta.pdf` | `tbd_ph_detalle_receta` | No |

> La tabla `tbd_ph_detalle_receta` aun no ha sido aprobada formalmente. Tratar como borrador sujeto a cambios.

---

## Tablas documentadas

### `tbd_ph_lotes_medicamentos`

**Entidad:** Lotes de Medicamentos  
**Jerarquia:** Debil  
**Percepcion:** Transaccional  
**Aprobado:** Si

Registra los lotes de medicamentos recibidos, con trazabilidad de proveedor, fechas de fabricacion y caducidad, y cantidades disponibles.

| Pos | Campo | Tipo | Not Null | Descripcion |
|---|---|---|---|---|
| 1 | `Id` | `int` AI PK | Si | Identificador del lote |
| 2 | `Medicamento_Id` | `int` | Si | Referencia al medicamento (FK) |
| 3 | `Proveedor_Id` | `int` | No | Referencia al proveedor (FK) |
| 4 | `Numero_Lote` | `varchar(100)` | Si | Numero de lote |
| 5 | `Fecha_Fabricacion` | `date` | Si | Fecha de fabricacion |
| 6 | `Fecha_Caducidad` | `date` | Si | Fecha de caducidad |
| 7 | `Cantidad_Inicial` | `int` | Si | Cantidad inicial del lote |
| 8 | `Cantidad_Actual` | `int` | Si | Cantidad actual disponible |
| 9 | `Estado_Lote` | `enum` | No | Estado del lote (default: `Disponible`) |
| 10 | `Observaciones` | `text` | No | Observaciones del lote |
| 11 | `Fecha_Registro` | `datetime` | Si | default: `CURRENT_TIMESTAMP` |
| 12 | `Fecha_Actualizacion` | `datetime` | No | default: `CURRENT_TIMESTAMP` |
| 13 | `Estatus` | `bit(1)` | No | Estado del registro (default: `b'1'`) |

**Indices:**

| Nombre | Tipo | Metodo | Campos |
|---|---|---|---|
| `unique_lote` | UNIQUE | BTREE | `Medicamento_Id`, `Numero_Lote` |
| `fk_lote_proveedor` | NORMAL | BTREE | `Proveedor_Id` |

**Llaves foraneas:**

| Nombre | Campo | Tabla referenciada | Campo referenciado | On Delete | On Update |
|---|---|---|---|---|---|
| `fk_lote_medicamento` | `Medicamento_Id` | `tbc_ph_medicamentos` | `Id` | RESTRICT | RESTRICT |
| `fk_lote_proveedor` | `Proveedor_Id` | `tbb_mr_proveedores` | `ID` | RESTRICT | RESTRICT |

**Triggers:**

| Nombre | Momento | INSERT | UPDATE | DELETE |
|---|---|---|---|---|
| `tbd_ph_lotes_BEFORE_UPDATE` | BEFORE | | Si | |
| `tbd_ph_lotes_AFTER_INSERT` | AFTER | Si | | |
| `tbd_ph_lotes_AFTER_UPDATE` | AFTER | | Si | |
| `tbd_ph_lotes_AFTER_DELETE` | AFTER | | | Si |

---

### `tbd_ph_inventario_medicamentos`

**Entidad:** Inventario de Medicamentos  
**Jerarquia:** Debil  
**Percepcion:** Generica  
**Aprobado:** Si

Almacena la informacion complementaria de cada lote en inventario: marca, presentacion, via de administracion, efectos secundarios y cantidad disponible.

| Pos | Campo | Tipo | Not Null | Descripcion |
|---|---|---|---|---|
| 1 | `Id` | `int` AI PK | Si | Identificador del inventario |
| 2 | `Lote_Medicamento_Id` | `int` | Si | Referencia al lote (FK) |
| 3 | `Marca` | `varchar(150)` | Si | Marca del medicamento |
| 4 | `Empresa` | `varchar(150)` | Si | Empresa distribuidora |
| 5 | `Farmaceutica` | `varchar(150)` | Si | Laboratorio fabricante |
| 6 | `Presentacion` | `varchar(150)` | Si | Presentacion del medicamento |
| 7 | `Via_Administracion` | `varchar(150)` | Si | Via de administracion |
| 8 | `Efectos_Secundarios` | `text` | No | Posibles efectos secundarios |
| 9 | `Restricciones` | `text` | No | Restricciones de uso |
| 10 | `Cantidad` | `int` | Si | Cantidad disponible |
| 11 | `Fecha_Registro` | `datetime` | Si | default: `CURRENT_TIMESTAMP` |
| 12 | `Fecha_Actualizacion` | `datetime` | No | default: `CURRENT_TIMESTAMP` |
| 13 | `Estatus` | `bit(1)` | No | Estado del registro (default: `b'1'`) |

**Indices:**

| Nombre | Tipo | Metodo | Campos |
|---|---|---|---|
| `fk_inventario_lote` | NORMAL | BTREE | `Lote_Medicamento_Id` |

**Llaves foraneas:**

| Nombre | Campo | Tabla referenciada | Campo referenciado | On Delete | On Update |
|---|---|---|---|---|---|
| `fk_inventario_lote` | `Lote_Medicamento_Id` | `tbd_ph_lotes_medicamentos` | `Id` | RESTRICT | RESTRICT |

**Triggers:**

| Nombre | Momento | INSERT | UPDATE | DELETE |
|---|---|---|---|---|
| `tbd_ph_inventario_BEFORE_UPDATE` | BEFORE | | Si | |
| `tbd_ph_inventario_AFTER_INSERT` | AFTER | Si | | |
| `tbd_ph_inventario_AFTER_UPDATE` | AFTER | | Si | |
| `tbd_ph_inventario_AFTER_DELETE` | AFTER | | | Si |

---

### `tbd_ph_detalle_receta`

**Entidad:** Detalle Receta  
**Jerarquia:** Debil  
**Percepcion:** Generica  
**Aprobado:** No (borrador)

Registra el detalle de cada medicamento prescrito dentro de una receta medica: dosis, frecuencia, duracion y cantidad total indicada.

| Pos | Campo | Tipo | Not Null | Descripcion |
|---|---|---|---|---|
| 1 | `Id` | `int` AI PK | Si | Identificador del detalle de receta |
| 2 | `Receta_Id` | `int` | Si | Referencia a la receta (FK) |
| 3 | `Medicamento_Id` | `int` | Si | Referencia al medicamento (FK) |
| 4 | `Dosis` | `varchar(100)` | Si | Dosis indicada del medicamento |
| 5 | `Frecuencia` | `varchar(100)` | Si | Frecuencia de administracion |
| 6 | `Duracion` | `varchar(100)` | Si | Duracion del tratamiento |
| 7 | `Cantidad` | `int` | Si | Cantidad total prescrita |
| 8 | `Indicaciones` | `text` | No | Indicaciones adicionales del medico |
| 9 | `Fecha_Registro` | `datetime` | Si | default: `CURRENT_TIMESTAMP` |
| 10 | `Fecha_Actualizacion` | `datetime` | No | default: `CURRENT_TIMESTAMP` |
| 11 | `Estatus` | `bit(1)` | No | Estado del registro (default: `b'1'`) |

**Indices:**

| Nombre | Tipo | Metodo | Campos |
|---|---|---|---|
| `fk_detalle_receta` | NORMAL | BTREE | `Receta_Id` |
| `fk_detalle_medicamento` | NORMAL | BTREE | `Medicamento_Id` |

**Llaves foraneas:**

| Nombre | Campo | Tabla referenciada | Campo referenciado | On Delete | On Update |
|---|---|---|---|---|---|
| `fk_detalle_medicamento` | `Medicamento_Id` | `tbc_ph_medicamentos` | `Id` | RESTRICT | RESTRICT |
| `fk_detalle_receta` | `Receta_Id` | `tbb_ph_recetas_medicas` | `Id` | RESTRICT | RESTRICT |

**Triggers:**

| Nombre | Momento | INSERT | UPDATE | DELETE |
|---|---|---|---|---|
| `tbd_ph_detalle_BEFORE_UPDATE` | BEFORE | | Si | |
| `tbd_ph_detalle_AFTER_INSERT` | AFTER | Si | | |
| `tbd_ph_detalle_AFTER_UPDATE` | AFTER | | Si | |
| `tbd_ph_detalle_AFTER_DELETE` | AFTER | | | Si |

---

## Relaciones entre tablas

```
tbc_ph_medicamentos         tbb_mr_proveedores
        |                           |
        | 1:N                       | 1:N
        v                           v
  tbd_ph_lotes_medicamentos --------+
        |
        | 1:1
        v
  tbd_ph_inventario_medicamentos

  tbb_ph_recetas_medicas    tbc_ph_medicamentos
        |                           |
        | 1:N                       | 1:N
        +---------> tbd_ph_detalle_receta <---------+
```

> Las tablas `tbc_ph_medicamentos`, `tbb_mr_proveedores` y `tbb_ph_recetas_medicas` pertenecen a otros modulos de la base de datos y son referenciadas via llaves foraneas.

---

## Informacion general

| Propiedad | Valor |
|---|---|
| **Base de datos** | `hospital_matricula` |
| **Servidor** | Hospital |
| **Motor** | MySQL 8.0.37 |
| **Autores** | Farmacia / Administrator |
| **Version** | 1.0 |
| **Ultima actualizacion** | Abril 2026 |