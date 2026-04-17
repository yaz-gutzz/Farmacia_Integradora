# 🔐 Seguridad de Base de Datos

## Configuración de Seguridad

### SQL (MySQL/MariaDB)

**Estrategia de Seguridad:**
- Autenticación con usuario: `root`
- Contraseña: (sin contraseña - desarrollo local)
- Roles y permisos definidos por rol
- Auditoría de cambios con triggers

**Usuarios y Permisos:**
```sql
-- Usuario API
CREATE USER 'api_user'@'localhost' IDENTIFIED BY 'api_password';
GRANT SELECT, INSERT, UPDATE ON hospital_230142.* TO 'api_user'@'localhost';

-- Usuario Auditoría
CREATE USER 'audit_user'@'localhost' IDENTIFIED BY 'audit_password';
GRANT SELECT ON hospital_230142.* TO 'audit_user'@'localhost';
```

**Encriptación:**
- Datos sensibles: SHA-256
- Conexión SSL (producción)

---

### NoSQL (MongoDB)

**Estrategia de Seguridad:**
- Autenticación deshabilitada (desarrollo local)
- En producción: credenciales y autenticación
- Validación de esquema en aplicación
- Logs de acceso

**Usuarios (Producción):**
```javascript
db.createUser({
  user: "api_app",
  pwd: "secure_password",
  roles: [
    { role: "readWrite", db: "hospital_medicamentos" }
  ]
})
```

---

## Auditoría y Monitoreo

- **Bitácora de Seguridad:** logs/bitacora.log
- **Triggers de Auditoría:** Registran cambios en tablas críticas
- **Mecanismo de Monitoreo:** Alertas de actividad sospechosa
- **Retención de Logs:** 6 meses mínimo

---

**Política de Seguridad:** Actualizada Abril 2026
