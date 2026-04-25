
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
