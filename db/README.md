# Scripts SQL - Base de Datos Farmacia Hospitalaria

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Database-MySQL%205.7%2B-blue?style=flat-square" alt="MySQL"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Database-MongoDB%206.0%2B-green?style=flat-square" alt="MongoDB"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Security-RBAC-red?style=flat-square" alt="Security"/></td>
</tr>
</table>

Documentación completa y scripts SQL para la base de datos que soporta el Departamento de Farmacia de un hospital de tercer nivel. Incluye estructura de tablas, respaldos, auditoría y monitoreo.

---

##  PDF - Documentación Visual del Schema

###  [Schema_BD_Farmacia_Hospital.pdf](Schema_BD_Farmacia_Hospital.pdf)

**Documento visual completo que incluye:**
- Diagrama ER (Entity-Relationship) de todas las tablas
- Estructura de cada tabla con campos y tipos
- Relaciones entre entidades (1:1, 1:N, N:M)
- Cardinalidades y constraints
- Flujo de datos entre módulos
- Índices y optimizaciones
- Políticas de seguridad por tabla

**Ideal para:**
-  Entender la arquitectura general de la BD
-  Explicar a nuevos desarrolladores
-  Presentaciones y documentación
-  Impresión en formato A4/A3

---

##  Guías Principales

###  Respaldos y Recuperación

1. **[Respaldos Manuales](respaldos_manuales.md)** 
   - Respaldo Manual Completo (estructura + datos)
   - Respaldo Manual Parcial (solo estructura)
   - Cómo hacer respaldos manualmente
   - Proceso de restauración

2. **[Script Respaldo Automatizado](respaldo_automatizado.md)**
   - Justificación de horarios (00:00, 06:00, 12:00, 18:00)
   - Configuración con Node.js
   - Monitoreo y alertas de respaldos

###  Documentación de Datos

3. **[Diccionario de Datos](data_dictionary.md)**
   - Tabla: personas
   - Tabla: pacientes
   - Tabla: medicamentos
   - Tabla: inventario
   - Tabla: compras
   - Tabla: dispensaciones
   - Tabla: usuarios
   - Estadísticas y ejemplos SQL

4. **[Schema de Base de Datos](schema.md)**
   - Estructura SQL completa de todas las tablas
   - Foreign Keys y constraints
   - Índices de optimización
   - Permisos por rol
   - Views de seguridad

###  Seguridad y Auditoría

5. **[Bitácora y Monitoreo](bitacora_y_monitoreo.md)**
   - Tabla: cambios_auditados (auditoría completa)
   - Tabla: bitacora_respaldos (monitoreo)
   - Triggers automáticos
   - Queries de análisis
   - Alertas y notificaciones
   - Compliance HIPAA/GDPR

---

##  Inicio Rápido

### 1. Crear Base de Datos

```bash
# Usar respaldo completo (con datos)
mysql -u root -p < respaldo_completo.sql

# O usar respaldo parcial (solo estructura)
mysql -u root -p < respaldo_parcial.sql
```

### 2. Verificar Estructura

```bash
mysql -u root -p hospital_farmacia -e "SHOW TABLES;"
mysql -u root -p hospital_farmacia -e "SELECT COUNT(*) FROM pacientes;"
```

### 3. Configurar Respaldos Automáticos

Ver: **[Script Respaldo Automatizado](respaldo_automatizado.md)** → Sección "Cómo Configurar Respaldos Automatizados"

---

##  Respaldos en Repositorio Separado

⚠️ **IMPORTANTE:** Los archivos de respaldo (*.sql.gz) **NO se versionan en este repositorio**.

Los respaldos se almacenan en:
```
Repositorio: Farmacia_Integradora_Backups
 respaldos_sql/
├── completos/
│   └── hospital_230142_YYYYMMDD_HHMMSS.sql.gz
├── incrementales/
│   └── hospital_230142_YYYYMMDD_HHMMSS.sql.gz
└── README.md
```

**Ubicaciones:**

Ver: **[DB/README.md](../README.md)** para más detalles



---

**Base de Datos:** hospital_230142  
**Última actualización:** Abril 2026  
**Versión:** 1.0

