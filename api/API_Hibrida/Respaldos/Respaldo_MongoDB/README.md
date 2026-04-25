# Respaldo_MongoDB - Colecciones de Farmacia Hospital

## Descripción

Esta carpeta contiene los **backups en formato JSON** de las 3 colecciones MongoDB utilizadas en la Práctica 09 (API Híbrida).

## Colecciones Disponibles

### 1. `hospital_farmacia.detalle_compra.json`
**Colección:** `detalle_compra`

Registro de dispensación de medicamentos a pacientes.

**Estructura:**
```json
{
  "id_receta": 5001,
  "id_paciente": 1,
  "fecha": "2026-03-27T14:30:00Z",
  "dispensados": [
    {
      "id_medicamento": 101,
      "nombre_medicamento": "Paracetamol 500mg",
      "cantidad_surtida": 20,
      "lotes_usados": [
        {"id_lote": 501, "cantidad_descontada": 10},
        {"id_lote": 502, "cantidad_descontada": 10}
      ]
    }
  ],
  "faltantes": [
    {
      "id_medicamento": 103,
      "nombre_medicamento": "Ibuprofeno 400mg",
      "cantidad_pendiente": 10,
      "motivo": "Agotado en inventario"
    }
  ]
}
```

**Casos de Prueba Relacionados:**
- TEST 01: Compra de Medicamento
- TEST 02: Impacto Masivo 
- TEST 05: Control de Errores

---

### 2. `hospital_farmacia.inventario_medicamento.json`
**Colección:** `inventario_medicamento`

Gestión de stock y disponibilidad de medicamentos.

**Estructura:**
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
  "lotes": [
    {
      "id_lote": 501,
      "numero_lote": "LOT20260101",
      "cantidad": 250,
      "fecha_vencimiento": "2027-01-31T23:59:59Z",
      "fecha_recepcion": "2026-01-15T10:00:00Z",
      "ubicacion_bodega": "A-01-05"
    }
  ],
  "proveedor": {
    "id_proveedor": 1,
    "nombre": "Farmacéutica ABC"
  },
  "activo": true,
  "ultima_actualizacion": "2026-03-27T15:30:00Z"
}
```

**Casos de Prueba Relacionados:**
- TEST 02: Impacto Masivo (actualización masiva)
- TEST 04: Subrogación Automática (desabasto - stock 0)
- TEST 05: Control de Errores (negativos)

---

### 3. `hospital_farmacia.subrogacion_medicamentos.json`
**Colección:** `subrogacion_medicamentos`

Historial de cambios y sustituciones de medicamentos.

**Estructura:**
```json
{
  "_id": ObjectId,
  "id_receta": 5001,
  "id_paciente": 1,
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
    "nombre": "Dra. María López",
    "tipo_profesional": "Farmacéutico"
  },
  "observaciones": "Se utilizó equivalente terapéutico",
  "equidato": true,
  "automatica": false,
  "estado": "completada"
}
```

**Casos de Prueba Relacionados:**
- TEST 03: Subrogación con Impacto Económico
- TEST 04: Subrogación Automática (desabasto)

---

## Cómo Restaurar los Backups

### En MongoDB CLI:
```javascript
// Importar colección detalle_compra
mongoimport --db hospital_medicamentos --collection detalle_compra --file hospital_farmacia.detalle_compra.json --jsonArray

// Importar colección inventario_medicamento
mongoimport --db hospital_medicamentos --collection inventario_medicamento --file hospital_farmacia.inventario_medicamento.json --jsonArray

// Importar colección subrogacion_medicamentos  
mongoimport --db hospital_medicamentos --collection subrogacion_medicamentos --file hospital_farmacia.subrogacion_medicamentos.json --jsonArray
```

### En MongoDB Compass:
1. Click derecho en la base de datos `hospital_medicamentos`
2. Seleccionar "Import Data"
3. Cargar archivo JSON
4. Seleccionar colección destino

---

## Índices Recomendados

```javascript
// En detalle_compra
db.detalle_compra.createIndex({ "id_paciente": 1 })
db.detalle_compra.createIndex({ "id_receta": 1 })
db.detalle_compra.createIndex({ "fecha": -1 })

// En inventario_medicamento
db.inventario_medicamento.createIndex({ "id_medicamento": 1 })
db.inventario_medicamento.createIndex({ "cantidad_total": 1 })
db.inventario_medicamento.createIndex({ "lotes.fecha_vencimiento": 1 })

// En subrogacion_medicamentos
db.subrogacion_medicamentos.createIndex({ "id_paciente": 1 })
db.subrogacion_medicamentos.createIndex({ "categoria_motivo": 1 })
```

---

## Estadísticas de Datos

| Colección | Documentos | Tamaño |
|-----------|-----------|--------|
| detalle_compra | ___ | ___ |
| inventario_medicamento | ___ | ___ |
| subrogacion_medicamentos | ___ | ___ |

*(Completar después de ejecutar los tests)*

---

## Notas Importantes

- ✓ Los backups están en formato JSON compatible con MongoDB
- ✓ Contienen datos de ejemplo para todas las colecciones
- ✓ Los `_id` pueden necesitar ser regenerados al importar
- ✓ Las referencias a SQL (id_paciente, id_receta) deben validarse

**Última actualización:** 27/03/2026
