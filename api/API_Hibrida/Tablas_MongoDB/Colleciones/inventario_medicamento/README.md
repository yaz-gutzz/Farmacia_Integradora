# Colección: inventario_medicamento

## Descripción

Colección MongoDB que gestiona el inventario dinámico de medicamentos en el hospital. Utiliza MongoDB debido a la **naturaleza variable de lotes, caducidad y cambios frecuentes de stock** que SQL no maneja eficientemente. SQL gestiona el catálogo maestro; MongoDB el stock operacional.

## Propósito

- Consultar disponibilidad en tiempo real de medicamentos
- Rastrear niveles de stock de forma flexible
- Gestionar múltiples lotes simultáneamente
- Monitorear fechas de caducidad
- Generar alertas dinámicas de bajo inventario
- Evitar transacciones de SQL en cambios frecuentes de stock

## Integración SQL-NoSQL

```
SQL (Catálogo)           MongoDB (Operacional)
    ↓                             ↓
medicamentos  ←────referencia────► id_medicamento
proveedores   ←────referencia────► id_proveedor
```

**Régimen:**
- `id_medicamento` DEBE existir en tabla SQL `medicamentos`
- `id_proveedor` puede referenciar tabla SQL `proveedores`
- MongoDB es **fuente de verdad para stock operacional**
- SQL es **fuente de verdad para datos maestros**

## Estructura del Documento

```json
{
  "_id": ObjectId,
  "id_medicamento": 101,
  "nombre": "Paracetamol 500mg",
  "descripcion": "Analgésico y antipirético",
  "principio_activo": "Paracetamol",
  "presentacion": "Tableta 500mg",
  "cantidad_total": 500,
  "cantidad_minima_alerta": 50,
  "unidad_medida": "tabletas",
  "proveedor": {
    "id_proveedor": 1,
    "nombre": "Farmacéutica ABC"
  },
  "lotes": [
    {
      "id_lote": 501,
      "numero_lote": "LOT20260101",
      "cantidad": 250,
      "fecha_vencimiento": "2027-01-31T23:59:59Z",
      "fecha_recepcion": "2026-01-15T10:00:00Z",
      "ubicacion_bodega": "A-01-05"
    },
    {
      "id_lote": 502,
      "numero_lote": "LOT20260215",
      "cantidad": 250,
      "fecha_vencimiento": "2027-02-28T23:59:59Z",
      "fecha_recepcion": "2026-02-20T10:00:00Z",
      "ubicacion_bodega": "A-01-06"
    }
  ],
  "activo": true,
  "ultima_actualizacion": "2026-03-27T15:30:00Z"
}
```

## Campos

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `_id` | ObjectId | Identificador único |
| `id_medicamento` | Integer | ID global del medicamento |
| `nombre` | String | Nombre comercial |
| `descripcion` | String | Descripción del medicamento |
| `principio_activo` | String | Nombre del principio activo |
| `presentacion` | String | Forma y dosis (ej: Tableta 500mg) |
| `cantidad_total` | Integer | Stock total actual |
| `cantidad_minima_alerta` | Integer | Valor umbral para alertas |
| `unidad_medida` | String | Unidad de medida (tabletas, ml, etc.) |
| `proveedor` | Object | Información del proveedor |
| `lotes` | Array | Los lotes en stock |
| `activo` | Boolean | Indica si el medicamento está disponible |
| `ultima_actualizacion` | DateTime | Últimas modificación del registro |

## Pruebas Relacionadas

### TEST 01: Compra de Medicamento
- Consulta de disponibilidad
- Validación de stock suficiente

### TEST 02: Impacto Masivo  
- Actualización masiva de inventarios
- Decremento de cantidad_total por 500+ dispensaciones
- Actualización de múltiples lotes

### TEST 04: Subrogación Automática (Desabasto)
- Validación de stock = 0
- Búsqueda de equivalente disponible
- Activación de lógica automática

### TEST 05: Control de Errores
- Validación de cantidad > stock
- Bloqueo de negativos
- Validación de lotes vencidos

