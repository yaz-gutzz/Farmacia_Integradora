# Colección: dispensaciones

## Descripción

Colección MongoDB que almacena el historial completo de dispensaciones de medicamentos a pacientes. Complementa `detalle_compra` proporcionando un **registro exhaustivo** con estado final de cada transacción, detalles específicos de lotes y medicamentos faltantes.

## Propósito

- Registrar todas las dispensaciones con estado final (Surtida, Surtida Parcial, No Surtida)
- Rastrear medicamentos específicos dispensados con sus lotes
- Identificar medicamentos faltantes por desabasto
- Mantener auditoría completa de transacciones farmacéuticas
- Facilitar reportes de dispensación y faltantes
- Análisis de disponibilidad y cobertura de medicamentos

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
  "id_receta": 34,
  "id_paciente": 1,
  "fecha": "2026-03-27T19:41:29.398Z",
  "status_final": "Surtida",
  "dispensados": [
    {
      "id_medicamento": 5,
      "nombre_medicamento": "Ácido Acetilsalicílico",
      "cantidad_surtida": 5,
      "lotes_usados": [
        {
          "id_lote": 41,
          "cantidad_descontada": 5
        }
      ]
    }
  ],
  "faltantes": [
    {
      "id_medicamento": 202,
      "nombre_medicamento": "Amoxicilina 250mg",
      "cantidad_pendiente": 15,
      "motivo": "Stock insuficiente en lotes"
    }
  ]
}
```

## Campos Principales

| Campo | Tipo | Requerido | Descripción |
|-------|------|-----------|-------------|
| `_id` | ObjectId | ✓ | Identificador único |
| `id_receta` | Integer | ✓ | Referencia a receta SQL |
| `id_paciente` | Integer | ✓ | Referencia a paciente SQL |
| `fecha` | DateTime | ✓ | Timestamp de dispensación |
| `status_final` | String | ✓ | Estado final (Surtida, Surtida Parcial, No Surtida) |
| `dispensados` | Array | ✓ | Medicamentos efectivamente surtidos |
| `faltantes` | Array | ✓ | Medicamentos no disponibles |
