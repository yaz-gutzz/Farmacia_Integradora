
# Respaldos y Configuración NoSQL

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Database-MongoDB%206.0%2B-green?style=flat-square" alt="MongoDB"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Format-JSON%20Backups-blue?style=flat-square" alt="JSON"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Status-Complete-brightgreen?style=flat-square" alt="Complete"/></td>
</tr>
</table>

Respaldos y configuración de la base de datos MongoDB que soporta el Departamento de Farmacia de un hospital de tercer nivel. Almacena datos operacionales de compras, inventarios, subrogaciones y dispensaciones con flexibilidad y escalabilidad.

## Contenido

### Respaldos Base de Datos MongoDB

- **respaldo_completo.json** - Respaldo manual completo de todas las colecciones
- **respaldo_parcial.json** - Respaldo manual parcial de colecciones seleccionadas
- **script_respaldo_automatizado.js** - Script automatizado para respaldos periódicos

### Estructura de Datos

- **schema_hospital_medicamentos.json** - Schema de la BD + colecciones
- **data_dictionary.md** - Diccionario de datos NoSQL

### Seguridad y Monitoreo

- **bitacora_seguridad.log** - Log de cambios y auditoría

- **mecanismo_monitoreo.js** - Cambios stream y monitoreo

---


### Colecciones

1. **detalle_compra** - Registro de compras de medicamentos
2. **inventario_medicamento** - Estado actual de inventarios
3. **subrogacion_medicamentos** - Cambios y sustituciones de medicamentos
4. **dispensaciones** - Histórico de dispensaciones a pacientes

---

## Equipo de Farmacia - Tarea Integradora

| Nombre | Usuario GitHub | Rol | Responsabilidades |
|--------|-----------------|-----|------------------|
| **Yazmin Gutierrez Hernández** | [yaz-gutzz](https://github.com/yaz-gutzz) | Arquitecto/Coordinador | Arquitectura Híbrida, API REST, Coordinación General, Documentación |
| **Obed Guzman Garcia** | [@ObedGuzmanGuz](https://github.com/ObedGuzmanGuz) | Desarrollador Backend | Desarrollo API (FastAPI), Lógica de Negocio, Integración SQL-NoSQL, Tests de API |
| **Citlalli Perez Dionicio** | [@KouDionicio](https://github.com/KouDioniciob) | Especialista NoSQL | Desarrollo MongoDB, Esquemas JSON, Colecciones, Tests NoSQL |
| **Michelle Castro Otero** | [@Ktmich2095](https://github.com/Ktmich2095) | Especialista SQL | Desarrollo MySQL, Diseño Relacional, Seguridad, Optimización, Tests SQL |


