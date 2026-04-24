# Suite de Pruebas - 10 Casos de Negocio

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Framework-Python%20Pytest-blue?style=flat-square" alt="Python"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/API%20Testing-Swagger-green?style=flat-square" alt="Swagger"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Tests-10%20Defined-orange?style=flat-square" alt="Tests"/></td>
</tr>
</table>

Suite de pruebas que valida los 10 casos de negocio críticos del Departamento de Farmacia en un hospital de tercer nivel. Incluye pruebas de funcionalidad, rendimiento, integración y manejo de errores para todas las operaciones farmacéuticas.

---

## TEST 01: Conexión a Base de Datos

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./TEST-01/img/parametros.png) | ![Estatus](./TEST-01/img/estatus.png) |

Validar la conexión exitosa a MySQL y MongoDB. Asegura que la API puede conectar correctamente con ambas bases de datos.

**Para más información:** [Ver TEST-01 Completo](./TEST-01/README.md)

---

## TEST 02: Performance Masivo

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./TEST-02/img/parametros.png) | ![Estatus](./TEST-02/img/estatus.png) |

Procesar grandes volúmenes de registros (500+ unidades) para validar rendimiento de la API con grandes volúmenes de datos.

**Para más información:** [Ver TEST-02 Completo](./TEST-02/README.md)

---

## TEST 03: Integridad de Datos

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./TEST-03/img/parametros.png) | ![Estatus](./TEST-03/img/estatus.png) |

Validar la consistencia de datos entre MySQL y MongoDB. Asegura que no hay inconsistencias en la sincronización híbrida.

**Para más información:** [Ver TEST-03 Completo](./TEST-03/README.md)

---

## TEST 04: Validaciones de Negocio

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./TEST-04/img/parametros.png) | ![Estatus](./TEST-04/img/estatus.png) |

Validar reglas de negocio en operaciones de medicamentos y pacientes. Asegura que se cumplen todas las reglas de negocio del departamento de farmacia.

**Para más información:** [Ver TEST-04 Completo](./TEST-04/README.md)

---

## TEST 05: Auditoría y Cambios

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./TEST-05/img/parametros.png) | ![Estatus](./TEST-05/img/estatus.png) |

Validar el registro de auditoría de todos los cambios realizados. Asegura que se registran todos los cambios con usuario, fecha y detalles.

**Para más información:** [Ver TEST-05 Completo](./TEST-05/README.md)

---

## TEST 06: Respaldos Automatizados

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./TEST-06/img/parametros.png) | ![Estatus](./TEST-06/img/estatus.png) |

Validar que los respaldos automáticos se ejecutan y recuperan correctamente. Asegura disponibilidad de datos ante pérdida o corrupción.

**Para más información:** [Ver TEST-06 Completo](./TEST-06/README.md)

---

## TEST 07: Control de Acceso

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./TEST-07/img/parametros.png) | ![Estatus](./TEST-07/img/estatus.png) |

Validar que los permisos por rol se aplican correctamente. Asegura que solo usuarios autorizados pueden acceder a datos sensibles.

**Para más información:** [Ver TEST-07 Completo](./TEST-07/README.md)

---

## TEST 08: Recuperación ante Desastres

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./TEST-08/img/parametros.png) | ![Estatus](./TEST-08/img/estatus.png) |

Validar que el sistema se recupera ante fallos de base de datos. Asegura continuidad del servicio ante fallos críticos.

**Para más información:** [Ver TEST-08 Completo](./TEST-08/README.md)

---

## TEST 09: Sincronización de Datos

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./TEST-09/img/parametros.png) | ![Estatus](./TEST-09/img/estatus.png) |

Validar sincronización bidireccional entre MySQL y MongoDB. Asegura consistencia de datos en arquitectura híbrida.

**Para más información:** [Ver TEST-09 Completo](./TEST-09/README.md)

---

## TEST 10: Optimización de Índices

| Parámetros | Estatus |
|---|---|
| ![Parámetros](./TEST-10/img/parametros.png) | ![Estatus](./TEST-10/img/estatus.png) |

Validar que los índices mejoran el rendimiento de consultas. Asegura que las consultas se ejecutan con máximo rendimiento.

**Para más información:** [Ver TEST-10 Completo](./TEST-10/README.md)

---

**Última actualización:** Abril 2026

