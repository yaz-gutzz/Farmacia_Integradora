# Detalle de Compra - MongoDB Farmacia

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Database-MongoDB%206.0%2B-green?style=flat-square" alt="MongoDB"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Collection-Detalle_Compra-blue?style=flat-square" alt="Detalle Compra"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Validation-Schema-orange?style=flat-square" alt="Validation"/></td>
</tr>
</table>

## ¿Qué es la colección de Detalle_compra?

La colección de detalle de compras sirve para almacenar la información completa e histórica de los ingresos de medicamentos (compras) efectuados a los proveedores. Su propósito es llevar un control sobre el folio de la factura o comprobante, la fecha de ingreso, el proveedor seleccionado, y la lista exacta de los medicamentos recibidos. 

Esta estructura contribuye en gran medida al manejo del nivel de inventario del hospital.

## Estructura de la Colección (Schema)

La colección sigue una validación estricta definida por esquema según el archivo (`Detalle_compra_schema.json`).

### Campos del Nivel Principal (Documentos Raíz)

A nivel raíz, un registro de compra debe incluir de manera **obligatoria** los siguientes campos:

| Campo | Tipo (BSON) | Descripción |
| :--- | :--- | :--- |
| `_id` | `objectId` | Identificador único generado por MongoDB. |
| `fecha` | `date` | Fecha en la que fue registrada la compra. |
| `folio_compra` | `string` | Folio de compra, factura u orden de referencia. |
| `medicamentos` | `array` | Arreglo de objetos integrando los productos adquiridos. |
| `proveedor` | `object` | Información perteneciente al proveedor al que se solicitó la compra. |

### Arreglo de `medicamentos`

El campo `medicamentos` es un **arreglo de objetos**. Cada objeto dentro de la lista representa un elemento comprado y cuenta con las siguientes propiedades:

| Campo | Tipo (BSON) | Obligatorio | Descripción |
| :--- | :--- | :--- | :--- |
| `cantidad` | `int` | Sí | Número de unidades obtenidas de ese medicamento en específico. |
| `id_medicamento` | `int` | Sí | Identificador clave del producto. |
| `nombre` | `string` | Sí | Nombre del fármaco ingresado al inventario. |
| `concentracion` | `string` | No | Medida o concentración activa (p. ej. 500mg, 10ml). |
| `forma_farmaceutica` | `string` | No | Presentación (p. ej. Tabletas, Jarabe, Solución Inyectable). |

### Objeto `proveedor`

El objeto `proveedor` engloba la información de la entidad surtidora, incluyendo:

| Campo | Tipo (BSON) | Obligatorio | Descripción |
| :--- | :--- | :--- | :--- |
| `nombre` | `string` | Sí | Nombre de la entidad, razón social o distribuidora. |

---

**Última actualización:** Abril 2026
