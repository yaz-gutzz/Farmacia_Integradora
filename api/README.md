
# API REST Híbrida - Farmacia Hospitalaria

<div align="center">

| ![Python](https://img.shields.io/badge/Language-Python%203.9%2B-blue?style=for-the-badge&logo=python&logoColor=white) | ![FastAPI](https://img.shields.io/badge/Framework-FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white) | ![Documentation](https://img.shields.io/badge/Documentation-Swagger-green?style=for-the-badge&logo=swagger&logoColor=white) | ![CORS](https://img.shields.io/badge/CORS-Enabled-brightgreen?style=for-the-badge) |
| :---: | :---: | :---: | :---: |

</div>

---

## Arquitectura de la API Híbrida

Una **API híbrida** es una arquitectura de servicio web avanzada que integra múltiples sistemas de bases de datos heterogéneos bajo una interfaz unificada. 

Este backend, desarrollado con **Python** y **FastAPI**, actúa como una capa de abstracción que conecta dos motores de persistencia distintos, permitiendo aprovechar las fortalezas de cada paradigma en una única solución:

* **MySQL (Relacional):** Gestiona datos estructurados, integridad referencial y transacciones complejas (ej. Roles, Usuarios y Catálogos Maestros).
* **MongoDB (NoSQL):** Almacena datos semi-estructurados, documentos flexibles y logs de alta velocidad (ej. Inventarios, Recetas y Bitácoras de Seguridad).

---

## Propósito y Capacidades

El objetivo central de esta implementación es proporcionar un ecosistema de servicios cohesivo que oculte la complejidad de la infraestructura subyacente, facilitando:

1.  **Operaciones CRUD Unificadas:** Interacción simplificada con colecciones de MongoDB y tablas de MySQL.
2.  **Validación de Datos:** Uso intensivo de **Pydantic** para garantizar que los esquemas de datos cumplan con los requerimientos del sector salud.
3.  **Seguridad Centralizada:** Gestión de autenticación, autorización y políticas de CORS desde un solo punto de entrada.
4.  **Documentación Automática:** Exposición de endpoints mediante **Swagger UI** y **ReDoc** para facilitar el consumo por parte del frontend.

---

## Stack Tecnológico

* **Core:** FastAPI (Asynchronous Server Gateway Interface - ASGI).
* **Base de Datos SQL:** MySQL con conectores optimizados para Python.
* **Base de Datos NoSQL:** MongoDB utilizando el driver oficial Motor/PyMongo.
* **Esquemas/Serialización:** Pydantic para modelos de datos rigurosos.
* **Servidor Web:** Uvicorn para despliegues de alto rendimiento.

---

## Gestión de Errores y Middleware

La API incorpora controladores de excepciones personalizados para manejar errores de conexión de base de datos o fallos de validación, retornando códigos de estado HTTP estandarizados y mensajes claros para el desarrollador:

* `200 OK` / `201 Created` para operaciones exitosas.
* `400 Bad Request` para errores de validación de esquema.
* `401 Unauthorized` para fallos en el control de acceso (RBAC).
* `500 Internal Server Error` para fallos críticos en la persistencia híbrida.

---

> **Nota:** Esta arquitectura permite que el sistema farmacéutico sea altamente escalable, manteniendo la robustez de los datos relacionales y la flexibilidad del modelo de documentos.

---

##  Integrantes del Equipo

**Equipo de Farmacia - Tarea Integradora**



| Nombre | Usuario GitHub | Rol |
|--------|-----------------|-----|
| **Yazmin Gutierrez Hernández** | [yaz-gutzz](https://github.com/yaz-gutzz) |Documentacion |
| **Obed Guzman Flores** | [@ObedGuzmanGuz](https://github.com/ObedGuzmanGuz) | Desarrollador Backend |
| **Citlalli Perez Dionicio** |   [@KouDionicio](https://github.com/KouDioniciob) | Base de Datos |
| **Michelle Castro Otero** |[@Ktmich2095](https://github.com/Ktmich2095)  | Base datos-Backend |
