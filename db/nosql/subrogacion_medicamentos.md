# Subrogación de Medicamentos - MongoDB Farmacia

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Database-MongoDB%206.0%2B-green?style=flat-square" alt="MongoDB"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Collection-Subrogacion_Medicamentos-blue?style=flat-square" alt="Subrogación Medicamentos"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Validation-Schema-orange?style=flat-square" alt="Validation"/></td>
</tr>
</table>

## ¿Qué es la colección de Subrogación de medicamentos?

La colección `Subrogacion_medicamentos` se utiliza cuando un medicamento que forma parte del cuadro básico (o que fue recetado) no se encuentra en existencia dentro de la farmacia del hospital y tiene que adquirirse por un medio externo o autorizarse para el paciente fuera del almacén actual. Esta colección guarda toda la información referente al paciente afectado, la prescripción original y los medicamentos exactos que entrarán bajo esquema de subrogación.

## Estructura de la Colección (Schema)

La colección sigue un modelo estandarizado para sus documentos según lo dictaminado por `Subrogacion_medicamentos_schema.json`.

### Campos del Nivel Principal (Documentos Raíz)

A nivel raíz, un registro de subrogación cuenta con los siguientes campos y obligaciones:

| Campo | Tipo (BSON) | Obligatorio | Descripción |
| :--- | :--- | :--- | :--- |
| `_id` | `objectId` | Sí | Identificador único referencial en MongoDB. |
| `folio_subrogacion` | `string` | Sí | Código de autorización o folio que ampara este procedimiento. |
| `fecha_solicitud` | `date` | Sí | Fecha en que se origina la autorización de subrogación. |
| `paciente` | `object` | Sí | Objeto con los datos del paciente derechohabiente. |
| `receta` | `object` | Sí | Objeto con los datos de referencia a la receta original. |
| `medicamentos` | `array` | Sí | Arreglo de los fármacos subrogados. |
| `estatus` | `string` | No | Estado actual del trámite (Ej. "PENDIENTE", "AUTORIZADO", "ENTREGADO"). |
| `motivo_subrogacion` | `string` | No | Especificación de la razón por la que se hace (Ej. "Desabasto"). |
| `medico` | `object` | No | Datos sobre el médico que firma la prescripción. |

### Objeto `paciente`

Contiene la información de la persona que requiere el medicamento:

| Campo | Tipo (BSON) | Obligatorio | Descripción |
| :--- | :--- | :--- | :--- |
| `id_paciente` | `int` | Sí | Identificador foráneo o código de expediente médico. |
| `nombre` | `string` | Sí | Nombre completo del paciente. |
| `diagnostico` | `string` | No | Padencia diagnosticada justificante. |

### Objeto `receta`

Relaciona el registro de la subrogación con la indicación clínica original:

| Campo | Tipo (BSON) | Obligatorio | Descripción |
| :--- | :--- | :--- | :--- |
| `id_receta` | `int` | Sí | ID primario o llave foránea de la receta en sistema. |
| `folio` | `string` | Sí | Cadena alfanumérica única de comprobación de la receta original. |
| `vigente` | `bool` | No | Indica (`true`/`false`) si el documento aún se encuentra válido. |

### Arreglo de `medicamentos`

Lista de todos los artículos médicos incluidos en dicho folio de subrogación:

| Campo | Tipo (BSON) | Obligatorio | Descripción |
| :--- | :--- | :--- | :--- |
| `id_medicamento` | `int` | Sí | Identificador único del medicamento necesitado. |
| `nombre` | `string` | Sí | Nombre del producto. |
| `cantidad` | `int` | Sí | Números de unidades mandadas a subrogar. |
| `concentracion` | `string` | No | Proporciones o formulación solicitada. |
| `forma_farmaceutica` | `string` | No | Forma en la que se presenta (Ej. Inyección, Pomada). |
| `costo` | `double` | No | Si aplica, precio al que se subrogará. |
| `dosis` | `string` | No | Posología pactada originalmente. |

### Objeto `medico` (Opcional)

Si se provee la métrica del médico, tiene que seguir estos lineamientos internos:

| Campo | Tipo (BSON) | Obligatorio | Descripción |
| :--- | :--- | :--- | :--- |
| `nombre` | `string` | Sí | Nombre completo del profesional de la salud. |
| `especialidad` | `string` | Sí | Área de cargo (Ej. Cardiólogo, Médico General). |

---

**Última actualización:** Abril 2026
