# 📝 Bitácora de Prompting - IA y Copilot

## Descripción

Registro detallado de prompts utilizados con GitHub Copilot y herramientas de IA para el desarrollo del proyecto.

---

## Sesión 01 - Estructura del Proyecto

**Fecha:** 16 Abril 2026  
**Objetivo:** Crear estructura base del proyecto

### Prompt 1: Actualizar README
```
modifica el readme ya que es la tarea integradora con la siguiente estructura...
```

**Resultado:** README.md actualizado con descripción general

### Prompt 2: Crear Estructura Directorio
```
ahora es la documentacion final, generame la estrcutura del proyecto{}
```

**Resultado:** Estructura completa con:
- /docs/ - Documentos de contexto
- /db/sql/ - Respaldos SQL
- /db/nosql/ - Respaldos MongoDB
- /db/security/ - Políticas de seguridad
- /api/ - Código fuente API
- /tests/ - Suite de pruebas
- /dashboard/ - Dashboard BI

---

## Sesión 02 - Documentación Detallada

**Fecha:** 16 Abril 2026  
**Objetivo:** Completar documentación según tabla de entregables

### Prompt 3: Generar Archivos Base
```
quiero la estrcutura y que tenga todo lo que pedi asi como en las imagenes
```

**Resultado:**
- ✅ Creadas todas las carpetas
- ✅ Archivos README.md en cada sección
- ✅ 10 tests documentados con criterios de aprobación
- ✅ Dashboard con 8 gráficos
- ✅ Documentación de seguridad

---

## Patrones de Prompting Utilizados

| Patrón | Descripción | Uso |
|--------|-------------|-----|
| Direct Request | Solicitud directa de funcionalidad | Crear archivos, estructuras |
| Context Sharing | Compartir requisitos y tabla | Generar documentación completa |
| Refinement | Ajustes basados en feedback | Mejorar formatos |
| Image Input | Incluir imágenes de referencia | Entender requisitos visuales |

---

## Prompts Clave Utilizados

### 1. Crear README Documentación Final
```markdown
# Objetivo: Documentación profesional sin prácticas
# Incluir: Módulos, arquitectura, APIs, casos de negocio
# Excluir: Referencias a prácticas 05/07/09
```

### 2. Generar Canvas de Tests
```markdown
# Crear 10 tests documentados
# Campos: Clave, Nombre, Descripción, Objetivo, Criterios, Estatus
# Incluir evidencias y resultados esperados
```

### 3. Estructura Completa del Proyecto
```markdown
# Crear carpetas según tabla de entregables
# Porcentajes: Portada 10%, SQL 15%, NoSQL 15%, Seguridad 15%
# API 15%, Tests 10%, Dashboard 10%, Prompting 5%
```

---

## Mejoras Identificadas

✅ Estructura clara y escalable  
✅ Documentación completa y profesional  
✅ Tests con criterios medibles  
✅ Dashboard con métricas visuales  
✅ Seguridad documentada  

---

## Próximas Sesiones Planeadas

- [ ] Implementar código de API
- [ ] Crear scripts de respaldo SQL
- [ ] Crear scripts de respaldo NoSQL
- [ ] Ejecutar pruebas
- [ ] Generar reportes en dashboard

---

**Bitácora Actualizada:** 16 Abril 2026  
**Total Prompts:** 3  
**Sesiones:** 2  
**Archivos Generados:** 15+
