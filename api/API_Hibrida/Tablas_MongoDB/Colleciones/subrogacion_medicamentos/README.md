# Colección: subrogacion_medicamentos

## Descripción

Colección MongoDB que registra cambios y sustituciones de medicamentos prescritos. Es un **registro de auditoría flexible** que interactúa con SQL (pacientes, medicamentos) para validaciones y con MongoDB (inventario) para disponibilidad.

## Propósito

- Registrar cambios de medicamentos prescritos
- Mantener historial de medicamentos alternativos utilizados
- Documentar motivos de sustituciones con contexto completo
- Rastrear medicamentos sustitutos y sus proveedores
- Análisis de equidatos y equivalencias terapéuticas
- Auditoría completa y trazabilidad

## Integración SQL-NoSQL-NoSQL

```
SQL (Validación)      MongoDB (Registro)    MongoDB (Disponibilidad)
    ↓                         ↓                        ↓
medicamentos   ←────referencia────► id_medicamento
pacientes      ←────referencia────► id_paciente
recetas        ←────referencia────► id_receta
                              
                inventario_medicamento (disponibilidad del sustituto)
```

**Régimen:**
- Validación: medicamentos original y sustituto existen en SQL
- Registro: subrogación guardada en MongoDB
- Consulta: disponibilidad verificada en inventario_medicamento (MongoDB)

## Estructura del Documento

```json
{
  "_id": ObjectId,
  "id_receta": 12345,
  "id_paciente": 5678,
  "fecha_subrogacion": "2026-03-27T14:30:00Z",
  "medicamento_original": {
    "id_medicamento": 101,
    "nombre": "Paracetamol 500mg",
    "cantidad_prescrita": 20,
    "principio_activo": "Paracetamol",
    "dosis": "500mg"
  },
  "medicamento_subrogado": {
    "id_medicamento": 102,
    "nombre": "Acetaminofén 500mg",
    "cantidad_dispensada": 20,
    "principio_activo": "Paracetamol",
    "dosis": "500mg",
    "id_lote": 503,
    "numero_lote": "LOT20260301"
  },
  "motivo_subrogacion": "Medicamento original agotado",
  "categoria_motivo": "Stock",
  "autorizado_por": {
    "id_usuario": 42,
    "nombre": "Dr. Juan Pérez",
    "tipo_profesional": "Farmacéutico"
  },
  "observaciones": "Se utilizó equivalente terapéutico",
  "equidato": true,
  "estado": "completada"
}
```

## Pruebas Relacionadas

### ✅ TEST 03: Subrogación con Impacto Económico
- Registro de medicamento original y sustituto
- Cálculo de diferencia de costo
- Autorización documentada
- Análisis de equivalencia terapéutica
- Motivo: "Precio" o "Equivalente_Terapeutico"

### ✅ TEST 04: Subrogación Automática (Desabasto)
- Campo adicional `automatica: true`
- Sin intervención humana inicial
- Búsqueda automática de equivalente por principio_activo
- Motivo: "Stock" (desabasto)
- Estado: "completada" (automáticamente)

## Campos

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `_id` | ObjectId | Identificador único |
| `id_receta` | Integer | Referencia a la receta original |
| `id_paciente` | Integer | Referencia al paciente (relación SQL) |
| `fecha_subrogacion` | DateTime | Fecha y hora de la sustitución |
| `medicamento_original` | Object | Datos del medicamento prescrito |
| `medicamento_subrogado` | Object | Datos del medicamento sustituto |
| `motivo_subrogacion` | String | Razón de la sustitución |
| `categoria_motivo` | String | Categoría del motivo |
| `autorizado_por` | Object | Quién autorizó el cambio |
| `observaciones` | String | Notas adicionales |
| `equidato` | Boolean | Si es equivalente terapéutico |
| `automatica` | Boolean | Si la sustitución fue automática (Sistema-driven) |
| `estado` | String | Estado actual (completada, pendiente, etc.) |
