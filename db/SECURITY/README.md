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
