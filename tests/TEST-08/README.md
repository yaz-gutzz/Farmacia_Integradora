# TEST-08: Recuperación ante Desastres

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Test-08-orange?style=flat-square" alt="Test-08"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Type-Disaster%20Recovery-blue?style=flat-square" alt="DR"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Status-Documented-green?style=flat-square" alt="Status"/></td>
</tr>
</table>

## Información del Test

**Clave:** TEST-08  
**Nombre:** Recuperación ante Desastres  
**Descripción:** Validar que el sistema se recupera ante fallos de base de datos  
**Objetivo:** Asegurar continuidad del servicio ante fallos críticos  

## Criterios de Aprobación

- Recuperación automática de conexión
- Reintentos exponenciales funcionales
- Datos no se pierden
- Alertas generadas correctamente

## Visualización

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./img/parametros.png) | ![Estatus](./img/estatus.png) |

## Estatus

Pendiente

## Evidencias

### Archivos de Evidencia

- `fallo_simulado.log` - Log de fallo simulado
- `recuperacion_automatica.json` - Detalles de recuperación
- `reintentos.csv` - Tabla de reintentos
- `alertas_generadas.txt` - Alertas producidas
- `validacion_continuidad.xlsx` - Validación de continuidad

### Resultado

Pendiente de ejecución

---

**Fecha de Creación:** Abril 2026
