<<<<<<< HEAD
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

=======
# Pruebas de Simulación de Datos - Documentación Técnica de QA

## 📊 Dashboard de Inicio del Sistema

Este dashboard representa el estado inicial del sistema antes de la ejecución de las pruebas de simulación de datos, mostrando el comportamiento base del módulo de inventarios y operaciones.

| Dashboard Inicio |
|---|
| ![Dashboard Inicio](./Dashboard_Inicio.png) |

---

## Descripción general
Este documento detalla la ejecución de 10 casos de prueba orientados a la generación y manipulación de datos en un ecosistema de microservicios para la gestión hospitalaria. Se validan endpoints de administración para la creación masiva de registros y procedimientos específicos en bases de datos NoSQL (MongoDB) y SQL.

---

## Test Casos Documentados

---

### Prueba PT-01 - Ajustar Stock de Inventario

- **Nombre:** Ajuste Stock
- **Descripción:** Intervención directa sobre el stock de un medicamento identificado por ID. La prueba utiliza parámetros de consulta para definir el flujo de inventario.
- **Objetivo:** Validar que el procedimiento almacenado o script de ajuste procese correctamente entradas positivas de mercancía.
- **Criterios de aprobación:** Respuesta exitosa del servidor al recibir `id_medicamento: 1` y `cantidad: 500` con motivo de "Compra".
- **Estatus:** Aprobado
- **Evidencias de aplicación:** Uso del método `POST` en `/api/mongo/inventario/ajustar-stock` con la interfaz Swagger UI.
- **Resultados:** El sistema prepara la actualización del nodo de inventario para el medicamento especificado.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](./test_1/Parametros_1.png) | ![Resultado](./test_1/Resultado_1.png) | ![Navicat](./test_1/Prueba_1_Navicat.png) |

---

### Prueba PT-02 - Generación de Lotes Masivos (Volumen Bajo)

- **Nombre:** Generación Controlada de Lotes Disponibles
- **Descripción:** Simulación de entrada de lotes mediante la definición de un esquema JSON.
- **Objetivo:** Verificar la integridad de los datos al generar 8 lotes.
- **Criterios de aprobación:** Lotes creados correctamente en estado "disponible".
- **Estatus:** Aprobado
- **Evidencias de aplicación:** JSON en endpoint administrativo de lotes.
- **Resultados:** Estructura validada correctamente.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](./test_2/Parametros_2.png) | ![Resultado](./test_2/Resultado_2.png) | ![Navicat](./test_2/Prueba2_Navicat.png) |

---

### Prueba PT-03 - Registro de Movimiento NoSQL

- **Nombre:** Simulación de Salida por Dispensación (Paracetamol)
- **Descripción:** Inserción de documento de movimiento en MongoDB.
- **Objetivo:** Registrar salida de 500 unidades.
- **Criterios de aprobación:** Estructura correcta del documento.
- **Estatus:** Aprobado
- **Resultados:** Persistencia exitosa.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](./test_3/Parametros_3.png) | ![Resultado](./test_3/Resultados_3.png) | ![Navicat](./test_3/Prueba3_Navicat.png) |

---

### Prueba PT-04 -  Generación de Lotes

- **Nombre:** Simulación Masiva de 100 Lotes
- **Descripción:** Generación de 100 registros simultáneos.
- **Objetivo:** Evaluar rendimiento del sistema.
- **Criterios de aprobación:** Sin errores.
- **Estatus:** Aprobado

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](./test_4/Parametros_4.png) | ![Resultado](./test_4/Resutado_4.png) | ![Navicat](./test_4/Prueba4_Navicat.png) |

---

### Prueba PT-05 - Inventario Controlado Empresa Pfizer / Marca Advil

- **Nombre:** Poblamiento de Stock de Marca Específica
- **Descripción:** Generación de 1300 registros Empresa Pfizer.
- **Objetivo:** Validar segregación por marca.
- **Estatus:** Aprobado

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](./test_5/Parametros_5.png) | ![Resultado](./test_5/Resultados_5.png) | ![Navicat](./test_5/Prueba5_Navicat.png) |

---
### Prueba PT-06 - Subrogación de Medicamentos

- **Nombre:** Registro de Déficit de Inventario  
- **Descripción:** Creación de subrogación por falta de inventario.  
- **Objetivo:** Validar flujo de reposición externa.  
- **Criterios de aprobación:** Estado "pendiente" y datos correctos.  
- **Estatus:** Aprobado  
- **Resultados:** Subrogación registrada correctamente.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](./test_6/Parametros_6.png) | ![Resultado](./test_6/Resultados_7.png) | ![Navicat](./test_6/Prueba6_Navicat.png) |

---

### Prueba PT-07 - Lotes con Ciclo de Vida Largo

- **Nombre:** Simulación de Lotes con Rango Extendido  
- **Descripción:** Generación de 1300 registros con fechas 2021–2029.  
- **Objetivo:** Validar manejo de datos históricos y futuros.  
- **Criterios de aprobación:** Fechas válidas en rango extendido.  
- **Estatus:** Aprobado  
- **Resultados:** Sistema soporta rangos largos.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](./test_7/Parametros_7.png) | ![Resultado](./test_7/Resultados_7.png) | ![Navicat](./test_7/Prueba7_Navicat.png) |

---

### Prueba PT-08 - Recetas Canceladas

- **Nombre:** Historial de Recetas Canceladas  
- **Descripción:** Generación de recetas con estado "Cancelada".  
- **Objetivo:** Pruebas de auditoría y análisis de fallos.  
- **Criterios de aprobación:** Estado consistente en todos los registros.  
- **Estatus:** Aprobado  
- **Resultados:** Datos generado correctamente.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](./test_8/Parametro8.png) | ![Resultado](./test_8/Resultados_8.png) | ![Navicat](./test_8/Prueba8_Navicat.png) |

---

### Prueba PT-09 - Stock Inicial Diclofenaco

- **Nombre:** Registro Base de Stock  
- **Descripción:** Definición de stock mínimo, máximo y actual.  
- **Objetivo:** Establecer inventario base del medicamento.  
- **Criterios de aprobación:** Valores correctamente almacenados.  
- **Estatus:** Aprobado  
- **Resultados:** Inventario configurado correctamente.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](./test_9/Parametros_9.png) | ![Resultado](./test_9/Resultado_9.png) | ![Navicat](./test_9/Prueba9_Navicat.png) |

---

### Prueba PT-10 - Inventario Genérico Novartis

- **Nombre:** Inventario de Medicamentos Genéricos  
- **Descripción:** Carga de 500 registros de medicamentos genéricos.  
- **Objetivo:** Validar diversidad de proveedores.  
- **Criterios de aprobación:** Aceptación de marca genérica.  
- **Estatus:** Aprobado  
- **Resultados:** Diversificación de inventario completada.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](./test_10/Paramereos_10.png) | ![Resultado](./test_10/Resultados_10.png) | ![Navicat](./test_10/Prueba10_Navixat.png) |

---

## 📊 Dashboard Final del Sistema

Este dashboard representa el estado final del sistema después de la ejecución de todas las pruebas, mostrando la consolidación de datos e inventarios generados.

| Dashboard Final |
|---|
| ![Dashboard Final](./Dashboard_final.png) |

---



**Equipo de Farmacia - Tarea Integradora**



| Nombre | Usuario GitHub | Rol |
|--------|-----------------|-----|
| **Yazmin Gutierrez Hernández** | [yaz-gutzz](https://github.com/yaz-gutzz) |Documentacion |
| **Obed Guzman Flores** | [@ObedGuzmanGuz](https://github.com/ObedGuzmanGuz) | Desarrollador Backend |
| **Citlalli Perez Dionicio** |   [@KouDionicio](https://github.com/KouDioniciob) | Base de Datos |
| **Michelle Castro Otero** |[@Ktmich2095](https://github.com/Ktmich2095)  | Base datos-Backend |
>>>>>>> Integradora-Obed
