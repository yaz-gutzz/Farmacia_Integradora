# Seguridad: Control de Acceso y Privilegios (Área Farmacia)

<div align="center">

| ![MySQL](https://img.shields.io/badge/Database-MySQL%205.7%2B-blue?style=for-the-badge) | ![MongoDB](https://img.shields.io/badge/Database-MongoDB%20(NoSQL)-green?style=for-the-badge) | ![Model](https://img.shields.io/badge/Model-Relational%20%2B%20Document-orange?style=for-the-badge) | ![Security](https://img.shields.io/badge/Security-RBAC%20%2B%20Audit-red?style=for-the-badge) |
| :---: | :---: | :---: | :---: |

</div>

---

## Modelo de Control de Acceso (RBAC)

El sistema de farmacia hospitalaria implementa un modelo de seguridad basado en **RBAC (Role-Based Access Control)** aplicado en un entorno híbrido:

* **MySQL** (Modelo Relacional)
* **MongoDB** (Modelo NoSQL Documental)

Ambos sistemas comparten la misma lógica de seguridad basada en roles, garantizando que la jerarquía de permisos sea consistente independientemente de la tecnología de persistencia.

---

## Diferencia Clave: SQL vs NoSQL

### MySQL (Relacional)
Los permisos se gestionan de forma estructurada a nivel de entidad física:
* **Asignación:** Directamente sobre tablas.
* **Comandos:** Uso de sentencias `GRANT` (SELECT, INSERT, UPDATE, DELETE).
* **Ejemplo:**
  ```sql
  GRANT SELECT ON hospital_matricula.tbc_ph_medicamentos TO rol_aux_farmacia;
  ```

### MongoDB (NoSQL)
El control es dinámico y basado en documentos:
* **Asignación:** Se definen acciones (`actions`) sobre colecciones y recursos.
* **Comandos:** No existe el `GRANT` tradicional; se definen documentos de rol.
* **Ejemplo:**
  ```javascript
  { resource: { db: "farmacia", collection: "inventario" }, 
    actions: ["find", "insert", "update", "remove"] }
  ```

> **¿Por qué la diferencia?** > MongoDB no trabaja con tablas fijas, sino con colecciones de documentos JSON flexibles. Por ello, el control se orienta a **acciones y recursos** en lugar de permisos sobre celdas o filas.

---

## 👥 Usuarios y Roles del Sistema

| Usuario | Rol Operativo | Alcance Técnico |
| :--- | :--- | :--- |
| `jefe_farmacia` | **Supervisión total** | Control global administrativo en SQL y NoSQL. |
| `aux_farmacia` | **Operación diaria** | Dispensación de medicamentos y consulta. |
| `inventario_farmacia` | **Control de stock** | Registro de movimientos de inventario. |
| `compras_farmacia` | **Abastecimiento** | Gestión de proveedores y catálogos. |
| `subrogacion_farmacia` | **Gestión externa** | Manejo de recetas y medicamentos faltantes. |

---

## 🎭 Definición de Roles (Concepto General RBAC)

* 🏥 **Jefe de Farmacia:** Acceso total en ambas tecnologías para auditoría y control de errores críticos.
* **Auxiliar de Farmacia:** Lectura y registro de recetas en SQL; acciones `find` e `insert` en colecciones NoSQL.
* 📦 **Inventario:** Permisos de actualización de existencias y trazabilidad de movimientos.
* 🚚 **Compras:** Gestión exclusiva de órdenes de compra y base de datos de proveedores.
* 📑 **Subrogación:** Seguimiento de vales y recetas externas para medicamentos fuera de stock.

---

## Mapeo de Privilegios

| Acción | MySQL (SQL) | MongoDB (NoSQL) |
| :--- | :--- | :--- |
| **Lectura** | `SELECT` | `find` |
| **Inserción** | `INSERT` | `insert` |
| **Modificación** | `UPDATE` | `update` |
| **Eliminación** | `DELETE` | `remove` |

---

## Restricciones y Políticas de Seguridad

1. **Eliminación Restringida:** Bloqueo de borrado en módulos críticos (Recetas/Lotes).
2. **Trazabilidad:** Registro de auditoría (logs) para cada operación por usuario.
3. **Protección de Datos:** Seguridad reforzada en información sensible de pacientes.
4. **Integridad Híbrida:** Control de consistencia entre tablas SQL y colecciones NoSQL.

---

## Beneficios del Sistema Híbrido

* **Seguridad Centralizada:** Un solo modelo lógico para dos bases de datos.
* **Escalabilidad:** Adaptado a la flexibilidad de documentos y el orden relacional.
* **Separación de Responsabilidades:** Cada área tiene su perímetro de acceso definido.
* **Rendimiento:** Optimización de consultas según la tecnología más apta para el dato.

---

> **Conclusión:** El sistema garantiza que **"cada usuario solo accede a lo que necesita para su función"**, manteniendo la integridad transaccional en MySQL y la flexibilidad documental en MongoDB.

---

## Equipo de Farmacia - Tarea Integradora

| Nombre | Usuario GitHub | Rol | Responsabilidades |
|--------|-----------------|-----|------------------|
| **Yazmin Gutierrez Hernández** | [yaz-gutzz](https://github.com/yaz-gutzz) | Arquitecto/Coordinador | Arquitectura Híbrida, API REST, Coordinación General, Documentación |
| **Obed Guzman Garcia** | [@ObedGuzmanGuz](https://github.com/ObedGuzmanGuz) | Desarrollador Backend | Desarrollo API (FastAPI), Lógica de Negocio, Integración SQL-NoSQL, Tests de API |
| **Citlalli Perez Dionicio** | [@KouDionicio](https://github.com/KouDioniciob) | Especialista NoSQL | Desarrollo MongoDB, Esquemas JSON, Colecciones, Tests NoSQL |
| **Michelle Castro Otero** | [@Ktmich2095](https://github.com/Ktmich2095) | Especialista SQL | Desarrollo MySQL, Diseño Relacional, Seguridad, Optimización, Tests SQL |

---

**Última actualización:** Abril 2026
