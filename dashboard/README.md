# Dashboard - Navicat BI

Dashboard de Business Intelligence para el Departamento de Farmacia de un hospital de tercer nivel. Visualiza métricas, resultados de tests, disponibilidad de medicamentos, costos operativos y análisis de desempeño del sistema.

## Descripción

Dashboard de Business Intelligence para visualizar métricas operacionales, resultados de tests y análisis de desempeño del Departamento de Farmacia.

## Gráficos Disponibles

### 1. Estatus de Tests
**Tipo:** Pie Chart  
**Datos:** Cantidad de tests pasados, fallidos y pendientes  
**Fuente:** Resultados de pruebas  
**Actualización:** Automática tras ejecutar tests

---

### 2. Cobertura de Inventario
**Tipo:** Bar Chart  
**Datos:** Porcentaje de cobertura por medicamento  
**Fuente:** BD hospital_medicamentos  
**Actualización:** Diaria

---

### 3. Impacto Masivo - Performance
**Tipo:** Line Chart  
**Datos:** Tiempo de respuesta vs Volumen de registros  
**Fuente:** TEST-02 Logs  
**Actualización:** Por ejecución

---

### 4. Análisis de Costos
**Tipo:** Bar Chart  
**Datos:** Ahorro generado por subrogación  
**Fuente:** Tabla subrogacion_medicamentos  
**Actualización:** Semanal

---

### 5. Disponibilidad de Medicamentos
**Tipo:** Gauge  
**Datos:** % de medicamentos disponibles (stock > 0)  
**Fuente:** Inventario actual  
**Actualización:** Hourly

---

### 6. Dispensaciones por Paciente
**Tipo:** Table  
**Datos:** Medicamentos dispensados por paciente  
**Fuente:** Colección dispensaciones  
**Actualización:** Diaria

---

### 7. Medicamentos Críticos
**Tipo:** Alert List  
**Datos:** Medicamentos por debajo de cantidad mínima  
**Fuente:** inventario_medicamento  
**Actualización:** Cada 4 horas

---

### 8. Validaciones Fallidas
**Tipo:** Pie Chart  
**Datos:** Distribución de errores de validación  
**Fuente:** TEST-05 Logs  
**Actualización:** Por ejecución

---

## Acceso al Dashboard

**URL:** http://localhost/navicat-bi  
**Usuario:** admin  
**Contraseña:** farmacia_2026

---

## Métricas Clave (KPIs)

| Métrica | Meta | Actual | Estado |
|---------|------|--------|--------|
| Tests Pasados | 100% | - | Pendiente |
| Tiempo TEST-02 | < 2s | - | Pendiente |
| Disponibilidad | > 95% | - | Pendiente |
| Ahorro Subrogación | > $1000/mes | - | Pendiente |
| Cobertura Testing | > 80% | - | Pendiente |

---

**Dashboard:** Actualizado Abril 2026
