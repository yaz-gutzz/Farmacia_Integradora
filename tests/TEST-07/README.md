# TEST-07: Control de Acceso

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Test-07-orange?style=flat-square" alt="Test-07"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Type-Security-blue?style=flat-square" alt="Security"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Status-Documented-green?style=flat-square" alt="Status"/></td>
</tr>
</table>

## Información del Test

**Clave:** TEST-07  
**Nombre:** Control de Acceso  
**Descripción:** Validar que los permisos por rol se aplican correctamente  
**Objetivo:** Asegurar que solo usuarios autorizados pueden acceder a datos sensibles  

## Criterios de Aprobación

- Administrador accede a todo
- Farmacéutico accede a medicamentos
- Médico solo ve medicamentos asignados
- Auditor sin permisos de modificación

## Visualización

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./img/parametros.png) | ![Estatus](./img/estatus.png) |

## Estatus

Pendiente

## Evidencias

### Archivos de Evidencia

- `prueba_roles.log` - Log de prueba de roles
- `acceso_por_rol.json` - Acceso para cada rol
- `intentos_no_autorizados.csv` - Intentos bloqueados
- `validacion_permisos.txt` - Validación de permisos
- `resultado_control_acceso.xlsx` - Resultado de prueba

### Resultado

Pendiente de ejecución

---

**Fecha de Creación:** Abril 2026
