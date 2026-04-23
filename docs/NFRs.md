# REQUISITOS NO FUNCIONALES (NFRs)

<table style="border: none; border-collapse: collapse; width: 100%;">
<tr style="border: none;">
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Type-Non%20Functional%20Requirements-blue?style=flat-square" alt="NFRs"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Count-12%20Defined-green?style=flat-square" alt="Count"/></td>
<td align="center" style="border: none; padding: 10px;"><img src="https://img.shields.io/badge/Status-Complete-brightgreen?style=flat-square" alt="Complete"/></td>
</tr>
</table>

## Sistema de Gestión Farmacéutica Hospitalaria

Los Requisitos No Funcionales definen CÓMO debe funcionar el sistema en el Departamento de Farmacia de un hospital de tercer nivel. Estos 12 NFRs especifican atributos críticos como rendimiento, seguridad, disponibilidad, escalabilidad y cumplimiento normativo necesarios para una operación farmacéutica confiable, segura y eficiente.

---

## NFR-001: Rendimiento y Velocidad

### Descripción
El sistema debe responder rápidamente a todas las solicitudes para garantizar una experiencia fluida.

### Especificaciones
- Las páginas deben cargar en tiempo razonable
- Las búsquedas deben devolver resultados rápidamente
- Las operaciones críticas (inventario) deben procesarse sin demoras evidentes

### Validación
- [ ] Monitoreo básico de tiempos de respuesta
- [ ] Verificación de que no hay cuellos de botella evidentes

---

## NFR-002: Escalabilidad

### Descripción
El sistema debe soportar crecimiento en usuarios y datos sin problemas graves.

### Especificaciones
- Debe funcionar correctamente con múltiples usuarios simultáneos
- Debe almacenar crecimiento de datos en el tiempo
- Arquitectura preparada para agregar más servidores si es necesario

### Validación
- [ ] Pruebas con usuarios concurrentes
- [ ] Verificación de que la base de datos puede crecer

---

## NFR-003: Disponibilidad y Confiabilidad

### Descripción
El sistema debe estar disponible durante el horario de operación con mínimas interrupciones.

### Especificaciones
- Disponibilidad alta durante horarios de operación
- Backups regulares de datos
- Recuperación ante fallos sin pérdida de datos críticos

### Mecanismos de Confiabilidad
- Redundancia de servidores
- Backups automáticos diarios
- Plan de recuperación documentado

### Validación
- [ ] Monitoreo de disponibilidad
- [ ] Alertas inmediatas ante caídas del sistema
- [ ] Pruebas regulares de restauración de backups

---

## NFR-004: Seguridad

### Descripción
El sistema debe proteger datos sensibles de pacientes y medicamentos contra accesos no autorizados.

### Especificaciones Técnicas
- Autenticación de usuarios (usuario y contraseña)
- Encriptación de datos sensibles
- Conexiones seguras (HTTPS)
- Validación de entrada de datos

### Control de Acceso
- Roles de usuario diferenciados:
  - Administrador
  - Farmacéutico
  - Médico
  - Almacenista
- Cada rol tiene permisos específicos

### Compliance
- Cumplimiento de leyes de protección de datos
- Privacidad de información de pacientes

### Validación
- [ ] Verificación de autenticación funciona
- [ ] Datos encriptados correctamente
- [ ] Roles y permisos se aplican correctamente

---

## NFR-005: Mantenibilidad y Código

### Descripción
El código debe ser limpio, documentado y fácil de mantener por otros desarrolladores.

### Especificaciones
- Código bien estructurado y organizado
- Funciones con documentación clara
- Nombres de variables descriptivos
- Tests para verificar funcionalidad

### Estándares
- Commits con mensajes claros
- Revisión de código antes de integrar cambios
- Documentación básica de módulos

### Validación
- [ ] Código revisado por otros desarrolladores
- [ ] Funciones documentadas
- [ ] Código sin errores detectados automáticamente

---

## NFR-006: Usabilidad

### Descripción
La interfaz debe ser intuitiva y fácil de usar para usuarios sin experiencia técnica.

### Especificaciones
- Interfaz clara y simple
- Mensajes de error comprensibles
- Compatible con dispositivos móviles
- Accesible para todos los usuarios

### Diseño
- Colores y diseño consistente
- Iconos claros
- Navegación fácil

### Validación
- [ ] Pruebas con usuarios reales
- [ ] Verificación en múltiples dispositivos
- [ ] Feedback positivo de usuarios

---

## NFR-007: Integrabilidad

### Descripción
El sistema debe poder integrarse con otros sistemas hospitalarios existentes.

### Especificaciones
- APIs disponibles para integraciones
- Formatos estándar (JSON, XML)
- Documentación de API clara
- Compatible con bases de datos comunes

### Validación
- [ ] API documentada
- [ ] Ejemplos de integración disponibles
- [ ] Soporte para integraciones básicas

---

## NFR-008: Compatibilidad

### Descripción
El sistema debe funcionar en múltiples plataformas y navegadores.

### Navegadores Soportados
- Chrome
- Firefox
- Safari
- Edge
- Navegadores móviles (iOS y Android)

### Sistemas Operativos
- Windows
- macOS
- Linux
- Dispositivos móviles

### Validación
- [ ] Testing en navegadores principales
- [ ] Funciona en dispositivos móviles

---

## NFR-009: Auditabilidad y Cumplimiento

### Descripción
Todas las operaciones deben ser auditables y cumplir con regulaciones.

### Bitácora de Auditoría
- Registro de: Usuario, Operación, Timestamp
- Registro específico de operaciones **INSERT, UPDATE, DELETE** sobre:
  - Medicamentos (precios, estatus, clasificación)
  - Recetas (cambios de estado, cancelaciones)
  - Inventario (movimientos por lote)
  - Pacientes (modificaciones de datos sensibles)
- Retención de registros de auditoría
- Los registros de auditoría no pueden ser eliminados

### Cumplimiento Normativo
- Protección de datos de pacientes
- Confidencialidad de información médica

### Reportes de Auditoría
- Accesos al sistema
- Cambios importantes en datos
- Accesos a información sensible

### Validación
- [ ] Auditoría registra las operaciones principales
- [ ] Los registros no pueden ser eliminados
- [ ] Reportes de auditoría disponibles

---

## NFR-010: Portabilidad de Datos

### Descripción
Los datos deben poder exportarse para migrar entre sistemas o hacer respaldos.

### Especificaciones
- Exportación en formatos comunes (CSV, JSON, Excel)
- Herramientas para importar datos
- Soporte para grandes volúmenes de datos

### Datos Portables
- Información de pacientes
- Inventario de medicamentos
- Historial de compras

### Validación
- [ ] Exportación/importación funciona correctamente
- [ ] Datos se transfieren íntegramente
- [ ] Documentación del proceso disponible

---

## NFR-011: Recuperabilidad

### Descripción
El sistema debe recuperarse de fallos sin perder datos críticos.

### Estrategia de Backup
- Backups automáticos regulares
- Almacenamiento en múltiples ubicaciones
- Pruebas regulares de restauración

### Plan de Recuperación
- Documentación del proceso
- Scripts de restauración
- Equipo entrenado

### Validación
- [ ] Backups se ejecutan correctamente
- [ ] Se puede restaurar desde un backup
- [ ] Documentación del plan disponible

---

## NFR-012: Monitoreo y Observabilidad

### Descripción
El sistema debe monitorearse constantemente para detectar problemas.

### Métricas Monitoreadas
- Disponibilidad del sistema
- Errores que ocurren
- Uso de recursos (CPU, RAM, Disco)
- Rendimiento de la base de datos

### Herramientas
- Sistema de logs centralizado
- Monitoreo de disponibilidad
- Alertas de problemas

### Dashboards
- Vista general de salud del sistema
- Alertas activas

### Validación
- [ ] Logs se registran correctamente
- [ ] Alertas se disparan para problemas
- [ ] Capacidad de revisar problemas pasados

---

## Resumen de NFRs

| ID | Requisito | Estado |
|----|-----------|--------|
| NFR-001 | Rendimiento | ✅ |
| NFR-002 | Escalabilidad | ✅ |
| NFR-003 | Disponibilidad | ✅ |
| NFR-004 | Seguridad | ✅ |
| NFR-005 | Mantenibilidad | ✅ |
| NFR-006 | Usabilidad | ✅ |
| NFR-007 | Integrabilidad | ✅ |
| NFR-008 | Compatibilidad | ✅ |
| NFR-009 | Auditoría | ✅ |
| NFR-010 | Portabilidad | ✅ |
| NFR-011 | Recuperabilidad | ✅ |
| NFR-012 | Monitoreo | ✅ |

---

**Documento:** Requisitos No Funcionales - Sistema Farmacéutico Hospitalario  
**Última Actualización:** Abril 2026  
**Equipo:** Departamento de Farmacia