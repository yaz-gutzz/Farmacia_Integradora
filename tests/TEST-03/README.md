# TEST-03: Integridad de Datos

## Información del Test

**Clave:** TEST-03  
**Nombre:** Integridad de Datos  
**Descripción:** Validar la consistencia de datos entre MySQL y MongoDB  
**Objetivo:** Asegurar que no hay inconsistencias en la sincronización híbrida  

## Criterios de Aprobación

- Datos coinciden entre ambas bases de datos
- No hay registros duplicados
- Integridad referencial mantenida
- Transacciones completadas correctamente

## Visualización

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./img/parametros.png) | ![Estatus](./img/estatus.png) |

## Estatus

Pendiente

## Evidencias

### Archivos de Evidencia

- `comparativa_datos.log` - Comparativa MySQL vs MongoDB
- `duplicados_verificacion.json` - Verificación de duplicados
- `integridad_referencial.csv` - Validación de relaciones
- `sincronizacion_estado.txt` - Estado de sincronización
- `discrepancias_encontradas.xlsx` - Reporte de discrepancias

### Resultado

Pendiente de ejecución

---

**Fecha de Creación:** Abril 2026
