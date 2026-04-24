# Base de Datos - Farmacia Hospitalaria

![MySQL](https://img.shields.io/badge/MySQL-8.0.37-4479A1?style=flat-square&logo=mysql&logoColor=white)
![Server](https://img.shields.io/badge/Servidor-Hospital-orange?style=flat-square)
![Estado](https://img.shields.io/badge/Estado-En%20Desarrollo-yellow?style=flat-square)

Documentacion del schema de la base de datos `hospital_matricula` correspondiente al modulo de Farmacia Hospitalaria. Generado con Navicat — Autor: Farmacia.

---

## Tablas

| Tabla | Entidad | Aprobado |
|---|---|---|
| `tbd_ph_lotes_medicamentos` | Lotes de Medicamentos | Si |
| `tbd_ph_inventario_medicamentos` | Inventario de Medicamentos | Si |
| `tbd_ph_detalle_receta` | Detalle Receta | No |

> `tbd_ph_detalle_receta` no esta aprobada formalmente — tratar como borrador.

---

## tbd_ph_lotes_medicamentos

Jerarquia: Debil — Percepcion: Transaccional

| Pos | Campo | Tipo | Not Null | Otros |
|---|---|---|---|---|
| 1 | `Id` | `int` | Si | PK, Auto Increment |
| 2 | `Medicamento_Id` | `int` | Si | Index: `unique_lote` |
| 3 | `Proveedor_Id` | `int` | No | Index: `fk_lote_proveedor` |
| 4 | `Numero_Lote` | `varchar(100)` | Si | Index: `unique_lote` |
| 5 | `Fecha_Fabricacion` | `date` | Si | |
| 6 | `Fecha_Caducidad` | `date` | Si | |
| 7 | `Cantidad_Inicial` | `int` | Si | |
| 8 | `Cantidad_Actual` | `int` | Si | |
| 9 | `Estado_Lote` | `enum` | No | Default: `Disponible` |
| 10 | `Observaciones` | `text` | No | |
| 11 | `Fecha_Registro` | `datetime` | Si | Default: `CURRENT_TIMESTAMP` |
| 12 | `Fecha_Actualizacion` | `datetime` | No | Default: `CURRENT_TIMESTAMP` |
| 13 | `Estatus` | `bit(1)` | No | Default: `b'1'` |

**Indices**

| Nombre | Tipo | Metodo | Campos |
|---|---|---|---|
| `unique_lote` | UNIQUE | BTREE | `Medicamento_Id`, `Numero_Lote` |
| `fk_lote_proveedor` | NORMAL | BTREE | `Proveedor_Id` |

**Llaves foraneas**

| Nombre | Campo local | Tabla referenciada | Campo | On Delete | On Update |
|---|---|---|---|---|---|
| `fk_lote_medicamento` | `Medicamento_Id` | `tbc_ph_medicamentos` | `Id` | RESTRICT | RESTRICT |
| `fk_lote_proveedor` | `Proveedor_Id` | `tbb_mr_proveedores` | `ID` | RESTRICT | RESTRICT |

**Triggers**

| Nombre | Momento | Evento |
|---|---|---|
| `tbd_ph_lotes_BEFORE_UPDATE` | BEFORE | UPDATE |
| `tbd_ph_lotes_AFTER_INSERT` | AFTER | INSERT |
| `tbd_ph_lotes_AFTER_UPDATE` | AFTER | UPDATE |
| `tbd_ph_lotes_AFTER_DELETE` | AFTER | DELETE |

---

## tbd_ph_inventario_medicamentos

Jerarquia: Debil — Percepcion: Generica

| Pos | Campo | Tipo | Not Null | Otros |
|---|---|---|---|---|
| 1 | `Id` | `int` | Si | PK, Auto Increment |
| 2 | `Lote_Medicamento_Id` | `int` | Si | Index: `fk_inventario_lote` |
| 3 | `Marca` | `varchar(150)` | Si | |
| 4 | `Empresa` | `varchar(150)` | Si | |
| 5 | `Farmaceutica` | `varchar(150)` | Si | |
| 6 | `Presentacion` | `varchar(150)` | Si | |
| 7 | `Via_Administracion` | `varchar(150)` | Si | |
| 8 | `Efectos_Secundarios` | `text` | No | |
| 9 | `Restricciones` | `text` | No | |
| 10 | `Cantidad` | `int` | Si | |
| 11 | `Fecha_Registro` | `datetime` | Si | Default: `CURRENT_TIMESTAMP` |
| 12 | `Fecha_Actualizacion` | `datetime` | No | Default: `CURRENT_TIMESTAMP` |
| 13 | `Estatus` | `bit(1)` | No | Default: `b'1'` |

**Indices**

| Nombre | Tipo | Metodo | Campos |
|---|---|---|---|
| `fk_inventario_lote` | NORMAL | BTREE | `Lote_Medicamento_Id` |

**Llaves foraneas**

| Nombre | Campo local | Tabla referenciada | Campo | On Delete | On Update |
|---|---|---|---|---|---|
| `fk_inventario_lote` | `Lote_Medicamento_Id` | `tbd_ph_lotes_medicamentos` | `Id` | RESTRICT | RESTRICT |

**Triggers**

| Nombre | Momento | Evento |
|---|---|---|
| `tbd_ph_inventario_BEFORE_UPDATE` | BEFORE | UPDATE |
| `tbd_ph_inventario_AFTER_INSERT` | AFTER | INSERT |
| `tbd_ph_inventario_AFTER_UPDATE` | AFTER | UPDATE |
| `tbd_ph_inventario_AFTER_DELETE` | AFTER | DELETE |

---

## tbd_ph_detalle_receta

Jerarquia: Debil — Percepcion: Generica

| Pos | Campo | Tipo | Not Null | Otros |
|---|---|---|---|---|
| 1 | `Id` | `int` | Si | PK, Auto Increment |
| 2 | `Receta_Id` | `int` | Si | Index: `fk_detalle_receta` |
| 3 | `Medicamento_Id` | `int` | Si | Index: `fk_detalle_medicamento` |
| 4 | `Dosis` | `varchar(100)` | Si | |
| 5 | `Frecuencia` | `varchar(100)` | Si | |
| 6 | `Duracion` | `varchar(100)` | Si | |
| 7 | `Cantidad` | `int` | Si | |
| 8 | `Indicaciones` | `text` | No | |
| 9 | `Fecha_Registro` | `datetime` | Si | Default: `CURRENT_TIMESTAMP` |
| 10 | `Fecha_Actualizacion` | `datetime` | No | Default: `CURRENT_TIMESTAMP` |
| 11 | `Estatus` | `bit(1)` | No | Default: `b'1'` |

**Indices**

| Nombre | Tipo | Metodo | Campos |
|---|---|---|---|
| `fk_detalle_receta` | NORMAL | BTREE | `Receta_Id` |
| `fk_detalle_medicamento` | NORMAL | BTREE | `Medicamento_Id` |

**Llaves foraneas**

| Nombre | Campo local | Tabla referenciada | Campo | On Delete | On Update |
|---|---|---|---|---|---|
| `fk_detalle_medicamento` | `Medicamento_Id` | `tbc_ph_medicamentos` | `Id` | RESTRICT | RESTRICT |
| `fk_detalle_receta` | `Receta_Id` | `tbb_ph_recetas_medicas` | `Id` | RESTRICT | RESTRICT |

**Triggers**

| Nombre | Momento | Evento |
|---|---|---|
| `tbd_ph_detalle_BEFORE_UPDATE` | BEFORE | UPDATE |
| `tbd_ph_detalle_AFTER_INSERT` | AFTER | INSERT |
| `tbd_ph_detalle_AFTER_UPDATE` | AFTER | UPDATE |
| `tbd_ph_detalle_AFTER_DELETE` | AFTER | DELETE |

---

## Relaciones

```
tbc_ph_medicamentos       tbb_mr_proveedores
         |                        |
         +---> tbd_ph_lotes_medicamentos <---+
                        |
                        +---> tbd_ph_inventario_medicamentos

tbb_ph_recetas_medicas    tbc_ph_medicamentos
         |                        |
         +---> tbd_ph_detalle_receta <-------+
```

---

**Base de datos:** `hospital_matricula` — **Servidor:** Hospital (MySQL 8.0.37) — **Version:** 1.0 — **Abril 2026**