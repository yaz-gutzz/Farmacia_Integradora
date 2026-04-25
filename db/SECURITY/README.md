<<<<<<< HEAD
# Seguridad - Control de Acceso y Privilegios

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Access%20Control-RBAC-red?style=flat-square" alt="RBAC"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Authentication-JWT-orange?style=flat-square" alt="JWT"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Encryption-Bcrypt-yellow?style=flat-square" alt="Bcrypt"/></td>
</tr>
</table>

## Control de Acceso por Roles y Privilegios

El control de acceso es un componente fundamental de la seguridad del sistema que establece quiénes pueden acceder a qué información y qué acciones pueden realizar. Se implementa mediante la definición clara de usuarios por área de negocio, asignación de roles específicos y privilegios granulares que controlan las operaciones permitidas en la base de datos y el sistema.

El propósito principal es garantizar que cada usuario tenga acceso únicamente a la información necesaria para cumplir sus funciones, protegiendo datos sensibles, manteniendo la integridad de la información y asegurando el cumplimiento de políticas de seguridad y regulaciones normativas.

## Estructura de Usuarios por Área

El sistema define usuarios organizados por área funcional del hospital y farmacia, cada uno con roles y permisos específicos según su responsabilidad:

- **Administrador:** Acceso total al sistema
- **Farmacéutico:** Gestión de medicamentos, inventario y dispensaciones
- **Médico:** Consulta de medicamentos y creación de dispensaciones
- **Almacenista:** Control de inventario y compras
- **Auditor:** Revisión de bitácoras sin modificar datos

## Documentación Completa

La documentación completa con configuración técnica de usuarios, roles, privilegios y políticas de seguridad está disponible en formato PDF.

**[Ver Control de Acceso en PDF](./control_acceso.pdf)**

---

**Última actualización:** Abril 2026
=======

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
```
>>>>>>> Integradora-Obed
