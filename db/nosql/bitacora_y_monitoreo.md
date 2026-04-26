# Bitácora y Monitoreo - MongoDB Farmacia

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Database-MongoDB%206.0%2B-green?style=flat-square" alt="MongoDB"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Function-Auditing-orange?style=flat-square" alt="Auditing"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Feature-Monitoring-blue?style=flat-square" alt="Monitoring"/></td>
</tr>
</table>

## Qué es la Bitácora y Monitoreo

La bitácora y monitoreo es un conjunto de mecanismos y herramientas de auditoría diseñadas para registrar, controlar y supervisar todos los cambios realizados en la base de datos MongoDB. Proporciona un registro completo de quién, qué, cuándo y cómo se modificaron los documentos, así como el estado y desempeño del sistema.

El propósito principal es garantizar la integridad, seguridad y trazabilidad de los datos, permitir la detección de cambios no autorizados, facilitar la recuperación ante incidentes y cumplir con requisitos de auditoría y regulación normativa.

## Estructura de la Bitácora (Schema)

La colección de bitácora en MongoDB sigue una estructura estricta definida por esquema (`bitacora_schema.json`). Todos los siguientes campos son obligatorios:

| Campo | Tipo (BSON) | Descripción |
| :--- | :--- | :--- |
| `_id` | `objectId` | Identificador único del registro de bitácora. |
| `detalles` | `string` | Documentación o detalles de la modificación realizada. |
| `fecha` | `date` | Fecha en la que ocurrió el evento u operación. |
| `hora` | `string` | Hora exacta de la modificación. |
| `ip_cliente` | `string` | Dirección IP que originó la petición (muy importante para auditoría). |
| `operacion` | `string` | Tipo de operación que desencadenó el registro (ej. INSERT, UPDATE, DELETE). |
| `tabla_afectada` | `string` | Nombre de la colección o tabla que fue alterada. |

## Visualización

### Gráfico de Bitácora
![Gráfico de Bitácora](./imagenes/bitacora_grafico.png)

### Gráfico de Monitoreo
![Gráfico de Monitoreo](./imagenes/monitoreo_grafico.png)

## Documentación Completa

La documentación completa con detalles técnicos y configuración está disponible en formato PDF.

**[Ver Bitácora y Monitoreo en PDF](./bitacora_y_monitoreo.pdf)**

---

**Última actualización:** Abril 2026
