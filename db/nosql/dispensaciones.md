# Dispensaciones - MongoDB Farmacia

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Database-MongoDB%206.0%2B-green?style=flat-square" alt="MongoDB"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Collection-Dispensaciones-blue?style=flat-square" alt="Dispensaciones"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Validation-Schema-orange?style=flat-square" alt="Validation"/></td>
</tr>
</table>

## ¿Qué es la colección de Dispensaciones?

La colección de `Dispensaciones` sirve para registrar el proceso donde se surten las recetas médicas a los pacientes en la farmacia. Aquí se lleva un control preciso no solo de los medicamentos entregados al paciente (y los lotes de donde se descontaron), sino también un registro vital de los medicamentos faltantes que no se pudieron surtir en su totalidad, detallando el motivo por el cual quedaron pendientes.

## Estructura de la Colección (Schema)

La colección sigue un modelo estricto de validación definido en su respectivo JSON Schema (`Dispensaciones_schema.json`).

### Campos del Nivel Principal (Documentos Raíz)

Todo documento raíz insertado en la colección debe incluir **obligatoriamente** los siguientes datos:

| Campo | Tipo (BSON) | Descripción |
| :--- | :--- | :--- |
| `_id` | `objectId` | Identificador único de cada dispensación en MongoDB. |
| `fecha` | `date` | Fecha de la operación de dispensación. |
| `id_paciente` | `int` | Llave foránea para identificar al paciente en la base de datos relacional. |
| `id_receta` | `int` | Llave foránea hacia el registro completo de la receta surtida. |
| `status_final` | `string` | Estado global de la dispensación (Ej. "COMPLETA" o "PARCIAL"). |
| `dispensados` | `array` | Arreglo de los medicamentos que **sí** fueron surtidos. |
| `faltantes` | `array` | Arreglo de los medicamentos que **no** pudieron ser surtidos. |

### Arreglo de `dispensados`

Esta lista detalla los medicamentos entregados. Cada elemento de la lista lleva la siguiente validación:

| Campo | Tipo (BSON) | Obligatorio | Descripción |
| :--- | :--- | :--- | :--- |
| `cantidad_surtida` | `int` | Sí | Cantidad final entregada al paciente. |
| `id_medicamento` | `int` | Sí | Código único o identificador del fármaco. |
| `nombre_medicamento` | `string` | Sí | Nombre del producto. |
| `lotes_usados` | `array` | Sí | Lista de lotes específicos de los que se tomó inventario. |
| `concentracion` | `string` | No | Medida clínica del medicamento suministrado. |
| `forma_farmaceutica` | `string` | No | Presentación surtida. |

#### Sub-arreglo `lotes_usados` (Dentro de `dispensados`)

Un medicamento surtido puede conformarse de la unión de distintas cajas o diferentes lotes si el inventario así lo requiere. Esta sub-lista requiere forzosamente:

| Campo | Tipo (BSON) | Obligatorio | Descripción |
| :--- | :--- | :--- | :--- |
| `id_lote` | `int` | Sí | Identificador explícito del lote utilizado para surtir. |
| `cantidad_descontada` | `int` | Sí | El subtotal restado en exclusiva de este `id_lote`. |

### Arreglo de `faltantes`

Si una receta no pudo entregarse debido a falta de stock u otras razones, la parte de medicación no surtida se registra aquí:

| Campo | Tipo (BSON) | Obligatorio | Descripción |
| :--- | :--- | :--- | :--- |
| `cantidad_pendiente` | `int` | Sí | Cantidad que aún se le adeuda al paciente en un futuro. |
| `id_medicamento` | `int` | Sí | Identificador referencial del medicamento faltante. |
| `nombre_medicamento` | `string` | Sí | Nombre del fármaco. |
| `motivo` | `string` | Sí | Razón o justificación por la que no se entregó (Ej. "Sin inventario"). |
| `concentracion` | `string` | No | Concentración solicitada en la receta original. |
| `forma_farmaceutica` | `string` | No | Presentación médica descrita. |

---

**Última actualización:** Abril 2026
