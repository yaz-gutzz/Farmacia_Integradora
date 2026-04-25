const express = require('express');
const { SimulacionController, SimulacionMongoController } = require('../controllers/simulacionController');

const router = express.Router();

// ─── Rutas de Simulación SQL ─────────────────────────────────────────────────

/**
 * POST /api/simulacion/recetas
 * Genera recetas médicas simuladas
 * Body: { cantidad: number }
 */
router.post('/recetas', SimulacionController.generarRecetas);

/**
 * POST /api/simulacion/lotes
 * Genera lotes de medicamentos simulados
 * Body: { cantidad: number }
 */
router.post('/lotes', SimulacionController.generarLotes);

/**
 * POST /api/simulacion/dispensacion
 * Simula dispensación de medicamentos
 * Body: { cantidad: number }
 */
router.post('/dispensacion', SimulacionController.simularDispensacion);

/**
 * POST /api/simulacion/subrogaciones
 * Genera solicitudes de subrogación simuladas
 * Body: { cantidad: number }
 */
router.post('/subrogaciones', SimulacionController.generarSubrogaciones);

// ─── Rutas de Simulación MongoDB ─────────────────────────────────────────────

/**
 * POST /api/mongo/simulacion/inventario
 * Simula movimientos de inventario (Kardex) en MongoDB
 * Body: { cantidad: number }
 */
router.post('/mongo/simulacion/inventario', SimulacionMongoController.simularMovimientosInventario);

/**
 * POST /api/mongo/simulacion/subrogaciones
 * Simula subrogaciones en MongoDB
 * Body: { cantidad: number }
 */
router.post('/mongo/simulacion/subrogaciones', SimulacionMongoController.simularSubrogaciones);

/**
 * POST /api/mongo/simulacion/compras
 * Simula compras en MongoDB
 * Body: { cantidad: number }
 */
router.post('/mongo/simulacion/compras', SimulacionMongoController.simularCompras);

/**
 * POST /api/mongo/simulacion/dispensaciones
 * Simula dispensaciones en MongoDB
 * Body: { cantidad: number }
 */
router.post('/mongo/simulacion/dispensaciones', SimulacionMongoController.simularDispensaciones);

module.exports = router;
