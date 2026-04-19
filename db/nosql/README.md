# Respaldos y Configuración NoSQL

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

**Base de Datos:** hospital_medicamentos  
**Servidor:** localhost:27017

---

**Última actualización:** Abril 2026
