# 🔧 REQUISITOS NO FUNCIONALES (NFRs)

## Sistema de Gestión Farmacéutica Hospitalaria

---

## NFR-001: Rendimiento y Velocidad

### Descripción
El sistema debe responder rápidamente a todas las solicitudes de usuarios para garantizar una experiencia fluida.

### Especificaciones
- **Tiempo de Respuesta API:** < 500ms para 95% de solicitudes (p95)
- **Carga de Página:** < 2 segundos
- **Búsquedas:** Resultados en < 500ms incluso con 100k registros
- **Reportes Simples:** Generación en < 5 segundos
- **Reportes Complejos:** Generación en < 30 segundos
- **Procesamiento Compras:** Actualización inventario en < 1 segundo

### Métricas
- SLA (Service Level Agreement): 99.5% uptime

### Validación
- [ ] Pruebas de carga con 1000 usuarios simultáneos
- [ ] Monitoreo APM (Application Performance Monitoring)
- [ ] Alertas si p95 > 800ms

---

## NFR-002: Escalabilidad

### Descripción
El sistema debe soportar crecimiento en usuarios, datos y transacciones sin degradación de rendimiento.

### Especificaciones
- **Usuarios Simultáneos:** Mínimo 500 usuarios concurrentes
- **Capacidad de BD SQL:** Mínimo 10 millones de registros
- **Capacidad de BD NoSQL:** Mínimo 50 millones de documentos
- **Transacciones por Segundo:** Mínimo 1000 TPS
- **Almacenamiento:** Escalabilidad horizontal automática

### Infraestructura
- Arquitectura de microservicios
- Load balancing automático
- Replicación de bases de datos
- Caché distribuido (Redis)

### Validación
- [ ] Pruebas de escalabilidad con datos reales
- [ ] Plan de crecimiento documentado
- [ ] Benchmarks de rendimiento

---

## NFR-003: Disponibilidad y Confiabilidad

### Descripción
El sistema debe estar disponible y funcional durante horarios de operación con mínimas interrupciones.

### Especificaciones
- **Disponibilidad:** 99.9% uptime (máximo 4.38 horas/año de downtime)
- **Recovery Time Objective (RTO):** < 1 hora
- **Recovery Point Objective (RPO):** < 15 minutos
- **Backups:** Diarios (automáticos)
- **Replicación:** En tiempo real entre servidores

### Mecanismos de Confiabilidad
- Redundancia de servidores
- Failover automático
- Replicación de datos en tiempo real
- Health checks cada 30 segundos

### Validación
- [ ] Monitoreo 24/7 de disponibilidad
- [ ] Alertas inmediatas ante caídas
- [ ] Plan de disaster recovery documentado

---

## NFR-004: Seguridad

### Descripción
El sistema debe proteger datos sensibles de pacientes y medicamentos contra accesos no autorizados.

### Especificaciones Técnicas
- **Autenticación:** JWT con expiración de 1 hora
- **Encriptación en Tránsito:** TLS 1.3 (HTTPS)
- **Encriptación en Reposo:** AES-256 para datos sensibles
- **Hash de Contraseñas:** bcrypt con salt
- **Validación de Entrada:** OWASP Top 10 protection

### Control de Acceso
- **RBAC (Role-Based Access Control):** 4 roles mínimo
  - Administrador
  - Farmacéutico
  - Médico
  - Almacenista
- Permissions granulares por endpoint
- Auditoría de todas las operaciones sensibles

### Compliance
- ✅ Cumplimiento HIPAA (Health Insurance Portability and Accountability Act)
- ✅ GDPR para datos personales
- ✅ Regulaciones locales de protección de datos

### Validación
- [ ] Pruebas de penetración (mensual)
- [ ] Análisis de vulnerabilidades automatizado
- [ ] Certificados SSL válidos
- [ ] Auditorías de seguridad trimestrales

---

## NFR-005: Mantenibilidad y Código

### Descripción
El código debe ser limpio, documentado y fácil de mantener por otros desarrolladores.

### Especificaciones
- **Cobertura de Tests:** > 80%
- **Documentación:** Docstrings en 100% de funciones
- **Complejidad Ciclomática:** < 10 por función
- **Duplication:** < 5%
- **Linting:** Cumple 100% with PEP-8

### Estándares
- Commits descriptivos (Conventional Commits)
- Code Review en pull requests
- Documentación en Swagger/OpenAPI
- README en cada módulo

### Validación
- [ ] SonarQube analysis en cada push
- [ ] Pre-commit hooks para validación
- [ ] Documentación actualizada
- [ ] Technical debt < 30 días

---

## NFR-006: Usabilidad

### Descripción
La interfaz debe ser intuitiva y fácil de usar para usuarios sin experiencia técnica.

### Especificaciones
- **Interfaz Clara:** Máximo 3 clics para operación común
- **Tiempo de Aprendizaje:** < 30 minutos para usuario nuevo
- **Validación de Formularios:** Mensajes de error claros
- **Responsivo:** Compatible con móviles y tablets
- **Accesibilidad:** WCAG 2.1 Level AA

### Diseño
- Paleta de colores consistente
- Tipografía legible
- Iconografía clara y consistente
- Feedback visual de operaciones

### Validación
- [ ] Testing con usuarios reales
- [ ] Evaluación de accesibilidad automatizada
- [ ] Pruebas de responsivo en múltiples dispositivos
- [ ] Satisfacción de usuario > 4/5

---

## NFR-007: Integrabilidad

### Descripción
El sistema debe poder integrarse con otros sistemas hospitalarios existentes.

### Especificaciones
- **APIs REST:** Estándar OpenAPI 3.0
- **Formatos:** JSON, XML
- **Webhooks:** Para notificaciones de eventos
- **Integración BD:** Compatible con MySQL, PostgreSQL
- **Escalabilidad de datos:** Soporte para 100+ integraciones

### Protocolos
- HTTP/2 y HTTP/3
- OAuth 2.0 para autenticaciones externas
- GraphQL opcional para consultas complejas

### Validación
- [ ] Documentación de API completa
- [ ] Ejemplos de integración
- [ ] Sandbox para testing
- [ ] Versionado de API (v1, v2, etc.)

---

## NFR-008: Compatibilidad

### Descripción
El sistema debe funcionar en múltiples plataformas y navegadores.

### Navegadores Soportados
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+
- Mobile browsers (iOS Safari, Chrome Mobile)

### Sistemas Operativos
- Windows 10+
- macOS 10.15+
- Linux (Ubuntu 20.04+)
- Android 10+
- iOS 13+

### Servidores
- Linux (producción principal)
- Windows Server (soporte)
- Cloud platforms (AWS, Azure, GCP)

### Validación
- [ ] Testing en matriz de navegadores/SO
- [ ] CI/CD con múltiples plataformas
- [ ] Compatibilidad backward > 2 versiones

---

## NFR-009: Auditabilidad y Cumplimiento

### Descripción
Todas las operaciones deben ser auditables y cumplir con regulaciones.

### Bitácora de Auditoría
- **Campos Registrados:** Usuario, Operación, Datos Modificados, Timestamp
- **Retención:** Mínimo 6 años (HIPAA)
- **Inmutabilidad:** No se pueden eliminar registros de auditoría
- **Exportación:** Auditoría exportable a Excel/PDF

### Cumplimiento Normativo
- ✅ Leyes de protección de datos
- ✅ Regulaciones de medicamentos
- ✅ Estándares hospitalarios internacionales
- ✅ Privacidad de pacientes (confidencialidad)

### Reportes de Auditoría
- Accesos no autorizados
- Cambios en medicamentos controlados
- Accesos a datos de pacientes VIP
- Eliminaciones de registros

### Validación
- [ ] Auditoría externa anual
- [ ] Compliance check automático
- [ ] Alertas de violaciones potenciales

---

## NFR-010: Portabilidad de Datos

### Descripción
Los datos deben poder exportarse y migrarse entre sistemas.

### Especificaciones
- **Formatos de Exportación:** JSON, CSV, Excel, XML
- **Migración:** Herramientas de import/export documentadas
- **Encodings:** UTF-8 soportado
- **Volumen:** Soporte para exportación de millones de registros

### Datos Portables
- Información de pacientes
- Inventario de medicamentos
- Historial de compras
- Reportes de auditoría

### Validación
- [ ] Testing de importación/exportación
- [ ] Validación de integridad de datos
- [ ] Documentación de proceso de migración

---

## NFR-011: Recuperabilidad

### Descripción
El sistema debe poder recuperarse de fallos sin pérdida de datos críticos.

### RPO y RTO
- **RPO:** < 15 minutos (máxima pérdida de datos)
- **RTO:** < 1 hora (tiempo máximo de recuperación)

### Estrategia de Backup
- Backups diarios (automáticos)
- Backups incrementales cada 6 horas
- Almacenamiento en 2 ubicaciones diferentes
- Testing mensual de restauración

### Plan de Recuperación
- Documentación detallada
- Scripts de restauración probados
- Runbook de disaster recovery
- Equipo entrenado para recuperación

### Validación
- [ ] Simulacros de recuperación mensuales
- [ ] Backup verificados automáticamente
- [ ] Logs de restauración

---

## NFR-012: Monitoreo y Observabilidad

### Descripción
El sistema debe ser observable y monitoreado constantemente.

### Métricas Monitoreadas
- Uptime y disponibilidad
- Latencia de respuestas
- Errores por tipo
- Uso de recursos (CPU, RAM, Disco)
- Conexiones a BD

### Herramientas
- **Logging:** ELK Stack (Elasticsearch, Logstash, Kibana)
- **Monitoring:** Prometheus + Grafana
- **APM:** New Relic o Datadog
- **Alerting:** PagerDuty/Alertmanager

### Dashboards
- Dashboard de salud del sistema
- Dashboard de operaciones
- Dashboard de seguridad
- Dashboard de business metrics

### Validación
- [ ] Alertas configuradas para anomalías
- [ ] Logs centralizados y retenidos
- [ ] Alertas probadas mensualmente
- [ ] Capacidad de troubleshooting

---

## Resumen de NFRs

| ID | Requisito | Métrica | Target | Estado |
|----|-----------|---------|--------|--------|
| NFR-001 | Rendimiento | p95 Latencia | < 500ms | ⏳ |
| NFR-002 | Escalabilidad | Usuarios Concurrentes | 500+ | ⏳ |
| NFR-003 | Disponibilidad | Uptime | 99.9% | ⏳ |
| NFR-004 | Seguridad | Compliance | HIPAA+GDPR | ⏳ |
| NFR-005 | Mantenibilidad | Test Coverage | > 80% | ⏳ |
| NFR-006 | Usabilidad | Satisfacción | 4+/5 | ⏳ |
| NFR-007 | Integrabilidad | APIs | OpenAPI 3.0 | ⏳ |
| NFR-008 | Compatibilidad | Navegadores | 5+ | ⏳ |
| NFR-009 | Auditoría | Retención | 6 años | ⏳ |
| NFR-010 | Portabilidad | Formatos | 5+ | ⏳ |
| NFR-011 | Recuperabilidad | RPO/RTO | 15min/1h | ⏳ |
| NFR-012 | Monitoreo | Métricas | 15+ | ⏳ |

---

**Documento:** Requisitos No Funcionales - Sistema Farmacéutico Hospitalario  
**Última Actualización:** Abril 2026  
**Equipo:** Departamento de Farmacia
