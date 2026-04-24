# Inventario de Medicamentos - MongoDB Farmacia

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Database-MongoDB%206.0%2B-green?style=flat-square" alt="MongoDB"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Collection-Inventario_Medicamento-blue?style=flat-square" alt="Inventario Medicamento"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Validation-Schema-orange?style=flat-square" alt="Validation"/></td>
</tr>
</table>

## ¿Qué es la colección de Inventario_medicamento?

La colección `Inventario_medicamento` almacena el estado actual de las existencias (stock) de cada fármaco en la farmacia de manera individual. Pero su principal objetivo no es solo mantener un número de unidades, sino conservar un historial detallado a través de un **Kardex de Movimientos** para saber exactamente cuándo ingresaron, cuándo salieron, bajo qué referencias (folios de compra o recetas) y en qué cantidad, asegurando la trazabilidad de los medicamentos.

## Estructura de la Colección (Schema)

La colección sigue un esquema estricto validado por MongoDB (`Inventario_medicamento_schema.json`).

### Campos del Nivel Principal (Documentos Raíz)

A nivel raíz, cada documento representa un medicamento único en el inventario. Los campos requeridos u opcionales son:

| Campo | Tipo (BSON) | Obligatorio | Descripción |
| :--- | :--- | :--- | :--- |
| `_id` | `objectId` | Sí | Identificador único del registro en MongoDB. |
| `id_medicamento` | `int` | Sí | Llave primaria o referencia directa del medicamento. |
| `nombre` | `string` | Sí | Nombre comercial o genérico del fármaco. |
| `stock_actual` | `int` | Sí | Cantidad neta de unidades disponibles en la farmacia. |
| `movimientos` | `array` | Sí | Inventario contable y rastro histórico detallado de entradas y salidas. |
| `concentracion` | `string` | No | Medida clínica del medicamento (Ej. 500mg). |
| `forma_farmaceutica` | `string` | No | Presentación farmacológica (Ej. Tabletas). |

### Arreglo de `movimientos` (Kardex)

El campo `movimientos` es fundamental para la auditoría, funciona como el kardex de la farmacia. Todo elemento dentro de su arreglo lleva este formato:

| Campo | Tipo (BSON) | Obligatorio | Descripción |
| :--- | :--- | :--- | :--- |
| `tipo` | `string` | Sí | Define si la operación modificatoria fue de "ENTRADA" o "SALIDA". |
| `cantidad` | `int` | Sí | Volumen de existencias agregadas o descontadas. |
| `fecha` | `date` | Sí | Marca temporal de cuándo ocurrió el ajuste en el stock. |
| `referencia` | `string` | Sí | Identificador de respaldo (folio de la compra o ID de la receta surtida). |
| `motivo` | `string` | No | Motivo extraordinario (usado usualmente para ajustes manuales o subrogaciones). |

---

**Última actualización:** Abril 2026
