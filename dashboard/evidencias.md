# Galería de Evidencias - Resultados de Pruebas

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Format-Visual%20Gallery-blue?style=flat-square" alt="Gallery"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Tool-Navicat%20BI-green?style=flat-square" alt="Navicat"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Tests-10%20Cases-orange?style=flat-square" alt="Tests"/></td>
</tr>
</table>

## Descripción

Galería de evidencias que muestra los resultados visuales de cada una de las 10 pruebas realizadas al sistema de farmacia. Estas imágenes capturan los parámetros configurados, resultados y validaciones en Navicat, proporcionando una vista rápida del desempeño y funcionalidad del Departamento de Farmacia.

Para acceder a la documentación completa de cada test, incluyendo criterios de aprobación, resultados detallados y explicaciones, utiliza el enlace "Ver Documentación Completa" al final.

---

## PT-01: Ajuste Stock de Inventario

Intervención directa sobre el stock de un medicamento identificado por ID.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](../tests/test_1/Parametros_1.png) | ![Resultado](../tests/test_1/Resultado_1.png) | ![Navicat](../tests/test_1/Prueba_1_Navicat.png) |

**Estado:** APROBADO

---

## PT-02: Generación de Lotes Masivos (Volumen Bajo)

Simulación de entrada de lotes mediante definición de esquema JSON. Generación controlada de 8 lotes disponibles.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](../tests/test_2/Parametros_2.png) | ![Resultado](../tests/test_2/Resultado_2.png) | ![Navicat](../tests/test_2/Prueba2_Navicat.png) |

**Estado:** APROBADO

---

## PT-03: Registro de Movimiento NoSQL

Inserción de documento de movimiento en MongoDB para simulación de salida por dispensación (Paracetamol).

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](../tests/test_3/Parametros_3.png) | ![Resultado](../tests/test_3/Resultados_3.png) | ![Navicat](../tests/test_3/Prueba3_Navicat.png) |

**Estado:** APROBADO

---

## PT-04: Generación de Lotes (Volumen Alto)

Simulación masiva de 100 lotes simultáneos para evaluar rendimiento del sistema.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](../tests/test_4/Parametros_4.png) | ![Resultado](../tests/test_4/Resutado_4.png) | ![Navicat](../tests/test_4/Prueba4_Navicat.png) |

**Estado:** APROBADO

---

## PT-05: Inventario Controlado Empresa Pfizer / Marca Advil

Poblamiento de stock de marca específica con generación de 1300 registros Empresa Pfizer.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](../tests/test_5/Parametros_5.png) | ![Resultado](../tests/test_5/Resultados_5.png) | ![Navicat](../tests/test_5/Prueba5_Navicat.png) |

**Estado:** APROBADO

---

## PT-06: Subrogación de Medicamentos

Registro de déficit de inventario con creación de subrogación por falta de inventario.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](../tests/test_6/Parametros_6.png) | ![Resultado](../tests/test_6/Resultados_7.png) | ![Navicat](../tests/test_6/Prueba6_Navicat.png) |

**Estado:** APROBADO

---

## PT-07: Lotes con Ciclo de Vida Largo

Simulación de lotes con rango extendido (2021–2029). Generación de 1300 registros para validar manejo de datos históricos y futuros.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](../tests/test_7/Parametros_7.png) | ![Resultado](../tests/test_7/Resultados_7.png) | ![Navicat](../tests/test_7/Prueba7_Navicat.png) |

**Estado:** APROBADO

---

## PT-08: Recetas Canceladas

Generación de recetas con estado "Cancelada" para pruebas de auditoría y análisis de fallos.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](../tests/test_8/Parametro8.png) | ![Resultado](../tests/test_8/Resultados_8.png) | ![Navicat](../tests/test_8/Prueba8_Navicat.png) |

**Estado:** APROBADO

---

## PT-09: Stock Inicial Diclofenaco

Registro base de stock con definición de stock mínimo, máximo y actual.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](../tests/test_9/Parametros_9.png) | ![Resultado](../tests/test_9/Resultados_9.png) | ![Navicat](../tests/test_9/Prueba9_Navicat.png) |

**Estado:** APROBADO

---

## PT-10: Último Test - Validación Final

Validación final del sistema con todas las operaciones integradas.

| Parámetros | Resultado | Navicat |
|---|---|---|
| ![Parámetros](../tests/test_10/Parametros_10.png) | ![Resultado](../tests/test_10/Resultados_10.png) | ![Navicat](../tests/test_10/Prueba10_Navicat.png) |

**Estado:** APROBADO

---

## Documentación Completa

Para acceder a la documentación técnica completa de todas las pruebas, incluyendo descripción detallada, criterios de aceptación, objetivos y resultados:

**[Ver Documentación de Tests Completa](../tests/README.md)**

---

**Última actualización:** Abril 25, 2026
