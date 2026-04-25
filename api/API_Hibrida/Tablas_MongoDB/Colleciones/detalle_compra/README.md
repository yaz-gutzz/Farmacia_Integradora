# Colección: detalle_compra

## Descripción

Colección MongoDB que almacena detalles de dispensación de medicamentos a pacientes. Es el **"log de transacciones"** del sistema farmacéutico, complementando la estructura SQL de pacientes con la flexibilidad de MongoDB para variabilidad de lotes y faltantes.

## Propósito

- Registrar medicamentos dispensados a pacientes en cada transacción
- Rastrear lotes específicos de medicamentos utilizados
- Identificar medicamentos que no pudieron surtirse completamente
- Mantener historial completo y auditable de dispensaciones
- Facilitar consultas complejas sin afectar SQL

## Integración SQL-NoSQL

```
SQL (Pacientes)          MongoDB (Dispensaciones)
    ↓                             ↓
id_paciente  ←────referencia────► id_paciente
id_receta    ←────referencia────► id_receta
```

**Régimen de integridad:**
- `id_paciente` DEBE existir en tabla SQL `pacientes`
- `id_receta` DEBE existir en tabla SQL `recetas`
- Validación realizada en **servicios**, no en BD

## Estructura del Documento

```json
{
  "_id": ObjectId,
  "id_receta": 12345,
  "id_paciente": 5678,
  "fecha": "2026-03-27T10:30:00Z",
  "dispensados": [
    {
      "id_medicamento": 101,
      "nombre_medicamento": "Paracetamol 500mg",
      "cantidad_surtida": 20,
      "lotes_usados": [
        {
          "id_lote": 501,
          "cantidad_descontada": 10
        },
        {
          "id_lote": 502,
          "cantidad_descontada": 10
        }
      ]
    }
  ],
  "faltantes": [
    {
      "id_medicamento": 202,
      "nombre_medicamento": "Amoxicilina 250mg",
      "cantidad_pendiente": 15,
      "motivo": "Agotado en inventario"
    }
  ]
}
```

## Pruebas Relacionadas

### ✅ TEST 01: Compra de Medicamento
- Inserción simple en esta colección
- Registro de dispensa básica
- Validación de lotes

### ✅ TEST 02: Impacto Masivo
- Inserción de 500+ registros de compra
- Múltiples medicamentos por receta
- Actualización masiva de inventario

### ✅ TEST 05: Control de Errores
- Validación cuando cantidad > stock
- Registro de faltantes
- Manejo de negativos

## Campos Principales

| Campo | Tipo | Requerido | Descripción |
|-------|------|-----------|-------------|
| `_id` | ObjectId | ✓ | Identificador único |
| `id_receta` | Integer | ✓ | Referencia a receta SQL |
| `id_paciente` | Integer | ✓ | Referencia a paciente SQL |
| `fecha` | DateTime | ✓ | Timestamp de dispensación |
| `dispensados` | Array | ✓ | Medicamentos surtidos |
| `faltantes` | Array | ✓ | Medicamentos no disponibles |

