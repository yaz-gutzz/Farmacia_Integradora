const { executeProcedure, executeQuery, getMongo } = require('../config/database');
const { ObjectId } = require('mongodb');

// ─── Servicio de Simulación SQL ──────────────────────────────────────────────

class SimulacionService {
    
    /**
     * Genera recetas médicas simuladas
     * @param {number} cantidad - Cantidad de recetas a generar
     * @returns {Promise<Object>} Resultado de ejecución
     */
    static async generarRecetasSimuladas(cantidad) {
        try {
            console.log(`[SIM] Ejecutando sp_generar_recetas_simuladas(${cantidad})`);
            
            // Ejecutar procedimiento almacenado
            const result = await executeProcedure('sp_generar_recetas_simuladas', [cantidad]);
            
            // Obtener conteo real de recetas creadas
            const [countResult] = await executeQuery(
                'SELECT COUNT(*) as total FROM tbb_ph_recetas_medicas WHERE Estatus = 1'
            );
            
            return {
                success: true,
                message: `${cantidad} recetas médicas generadas correctamente`,
                data: {
                    cantidad_solicitada: cantidad,
                    total_recetas_en_bd: countResult.total,
                    timestamp: new Date().toISOString()
                }
            };
        } catch (error) {
            console.error('[ERROR] generarRecetasSimuladas:', error);
            throw {
                success: false,
                message: `Error al generar recetas: ${error.message}`,
                error: error.message
            };
        }
    }

    /**
     * Genera lotes de medicamentos simulados
     * @param {number} cantidad - Cantidad de lotes a generar
     * @returns {Promise<Object>} Resultado de ejecución
     */
    static async generarLotesSimulados(cantidad) {
        try {
            console.log(`[SIM] Ejecutando sp_generar_lotes_medicamentos(${cantidad})`);
            
            // Ejecutar procedimiento almacenado
            const result = await executeProcedure('sp_generar_lotes_medicamentos', [cantidad]);
            
            // Obtener conteo real de lotes creados
            const [countResult] = await executeQuery(
                'SELECT COUNT(*) as total FROM tbd_ph_lotes_medicamentos WHERE Estatus = 1'
            );
            
            // Obtener stock total
            const [stockResult] = await executeQuery(
                'SELECT SUM(Cantidad_Actual) as stock_total FROM tbd_ph_lotes_medicamentos WHERE Estatus = 1'
            );
            
            return {
                success: true,
                message: `${cantidad} lotes de medicamentos generados correctamente`,
                data: {
                    cantidad_solicitada: cantidad,
                    total_lotes_en_bd: countResult.total,
                    stock_total: stockResult.stock_total || 0,
                    timestamp: new Date().toISOString()
                }
            };
        } catch (error) {
            console.error('[ERROR] generarLotesSimulados:', error);
            throw {
                success: false,
                message: `Error al generar lotes: ${error.message}`,
                error: error.message
            };
        }
    }

    /**
     * Simula dispensación de medicamentos
     * @param {number} cantidad - Cantidad de dispensaciones a simular
     * @returns {Promise<Object>} Resultado de ejecución
     */
    static async simularDispensacion(cantidad) {
        try {
            console.log(`[SIM] Ejecutando sp_simular_dispensacion(${cantidad})`);
            
            // Ejecutar procedimiento almacenado
            const result = await executeProcedure('sp_simular_dispensacion', [cantidad]);
            
            // Obtener conteo de dispensaciones en bitácora
            const [countResult] = await executeQuery(
                'SELECT COUNT(*) as total FROM bitacora WHERE tabla_afectada = "tbd_ph_detalle_receta" AND operacion = "INSERT"'
            );
            
            return {
                success: true,
                message: `${cantidad} dispensaciones simuladas correctamente`,
                data: {
                    cantidad_solicitada: cantidad,
                    dispensaciones_registradas: countResult.total || 0,
                    timestamp: new Date().toISOString()
                }
            };
        } catch (error) {
            console.error('[ERROR] simularDispensacion:', error);
            throw {
                success: false,
                message: `Error al simular dispensación: ${error.message}`,
                error: error.message
            };
        }
    }

    /**
     * Genera solicitudes de subrogación simuladas
     * @param {number} cantidad - Cantidad de subrogaciones a generar
     * @returns {Promise<Object>} Resultado de ejecución
     */
    static async generarSubrogacionesSimuladas(cantidad) {
        try {
            console.log(`[SIM] Ejecutando sp_generar_subrogaciones(${cantidad})`);
            
            // Ejecutar procedimiento almacenado
            const result = await executeProcedure('sp_generar_subrogaciones', [cantidad]);
            
            // Obtener conteo de subrogaciones creadas
            const [countResult] = await executeQuery(
                'SELECT COUNT(*) as total FROM subrogacion_medicamentos'
            );
            
            return {
                success: true,
                message: `${cantidad} subrogaciones generadas correctamente`,
                data: {
                    cantidad_solicitada: cantidad,
                    total_subrogaciones_en_bd: countResult.total,
                    timestamp: new Date().toISOString()
                }
            };
        } catch (error) {
            console.error('[ERROR] generarSubrogacionesSimuladas:', error);
            throw {
                success: false,
                message: `Error al generar subrogaciones: ${error.message}`,
                error: error.message
            };
        }
    }
}

// ─── Servicio de Simulación MongoDB ──────────────────────────────────────────

class SimulacionMongoService {

    /**
     * Simula movimientos de inventario (Kardex)
     * @param {number} cantidad - Cantidad de movimientos a generar
     * @returns {Promise<Object>} Resultado de ejecución
     */
    static async simularMovimientosInventario(cantidad) {
        try {
            console.log(`[MONGO-SIM] Generando ${cantidad} movimientos de inventario`);
            
            const db = getMongo();
            const collection = db.collection('inventario_medicamento');
            
            // Obtener medicamentos disponibles
            const [medicamentos] = await executeQuery(
                'SELECT Id FROM tbc_ph_medicamentos WHERE Estatus = 1 LIMIT 20'
            );
            
            if (medicamentos.length === 0) {
                throw new Error('No hay medicamentos disponibles para simular');
            }
            
            const movimientos = [];
            const tiposMovimiento = ['ENTRADA', 'SALIDA', 'AJUSTE', 'DEVOLUCION'];
            const motivos = ['COMPRA', 'DISPENSACION', 'CONTROL DE CALIDAD', 'CADUCIDAD', 'AJUSTE DE INVENTARIO'];
            
            for (let i = 0; i < cantidad; i++) {
                const medicamento = medicamentos[Math.floor(Math.random() * medicamentos.length)];
                const cantidad_mov = Math.floor(Math.random() * 50) + 1;
                const tipoMov = tiposMovimiento[Math.floor(Math.random() * tiposMovimiento.length)];
                const motivo = motivos[Math.floor(Math.random() * motivos.length)];
                
                movimientos.push({
                    id_medicamento: medicamento.Id,
                    tipo_movimiento: tipoMov,
                    cantidad: cantidad_mov,
                    motivo: motivo,
                    fecha_movimiento: new Date(),
                    usuario: 'admin',
                    ip_origen: '127.0.0.1',
                    referencia_comprobante: `MOV-${Date.now()}-${i}`
                });
            }
            
            // Insertar movimientos
            const result = await collection.insertMany(movimientos);
            
            return {
                success: true,
                message: `${cantidad} movimientos de inventario simulados en MongoDB`,
                data: {
                    cantidad_insertados: result.insertedCount,
                    ids_insertados: Object.keys(result.insertedIds),
                    timestamp: new Date().toISOString()
                }
            };
        } catch (error) {
            console.error('[ERROR] simularMovimientosInventario:', error);
            throw {
                success: false,
                message: `Error al simular movimientos de inventario: ${error.message}`,
                error: error.message
            };
        }
    }

    /**
     * Simula subrogaciones en MongoDB
     * @param {number} cantidad - Cantidad de subrogaciones a generar
     * @returns {Promise<Object>} Resultado de ejecución
     */
    static async simularSubrogacionesMongoDb(cantidad) {
        try {
            console.log(`[MONGO-SIM] Generando ${cantidad} subrogaciones en MongoDB`);
            
            const db = getMongo();
            const collection = db.collection('subrogacion_medicamentos');
            
            // Obtener medicamentos
            const [medicamentos] = await executeQuery(
                'SELECT Id, Nombre FROM tbc_ph_medicamentos WHERE Estatus = 1 LIMIT 50'
            );
            
            if (medicamentos.length === 0) {
                throw new Error('No hay medicamentos disponibles para simular subrogaciones');
            }
            
            const subrogaciones = [];
            const estados = ['pendiente', 'aprobada', 'rechazada'];
            
            for (let i = 0; i < cantidad; i++) {
                const medicamento = medicamentos[Math.floor(Math.random() * medicamentos.length)];
                const medicamentoAlterno = medicamentos[Math.floor(Math.random() * medicamentos.length)];
                
                const cantidad_requerida = Math.floor(Math.random() * 100) + 10;
                const cantidad_faltante = Math.floor(cantidad_requerida * (Math.random() * 0.8 + 0.2)); // 20-100% faltante
                
                subrogaciones.push({
                    id_medicamento: medicamento.Id,
                    nombre_medicamento: medicamento.Nombre,
                    cantidad_requerida: cantidad_requerida,
                    cantidad_faltante: cantidad_faltante,
                    fecha_solicitud: new Date(),
                    medicamento_alterno: {
                        id_alterno: medicamentoAlterno.Id,
                        nombre: medicamentoAlterno.Nombre
                    },
                    estado: estados[Math.floor(Math.random() * estados.length)],
                    justificacion: `Falta de stock del medicamento principal - Generado en simulación ${Date.now()}`,
                    usuario_solicita: 'farmacista_' + Math.floor(Math.random() * 5),
                    ip_origen: '127.0.0.1'
                });
            }
            
            // Insertar subrogaciones
            const result = await collection.insertMany(subrogaciones);
            
            return {
                success: true,
                message: `${cantidad} subrogaciones simuladas en MongoDB`,
                data: {
                    cantidad_insertados: result.insertedCount,
                    ids_insertados: Object.keys(result.insertedIds),
                    timestamp: new Date().toISOString()
                }
            };
        } catch (error) {
            console.error('[ERROR] simularSubrogacionesMongoDb:', error);
            throw {
                success: false,
                message: `Error al simular subrogaciones: ${error.message}`,
                error: error.message
            };
        }
    }

    /**
     * Simula detalles de compra en MongoDB
     * @param {number} cantidad - Cantidad de compras a genular
     * @returns {Promise<Object>} Resultado de ejecución
     */
    static async simularComprasMongoDb(cantidad) {
        try {
            console.log(`[MONGO-SIM] Generando ${cantidad} compras en MongoDB`);
            
            const db = getMongo();
            const collection = db.collection('detalle_compra');
            
            // Obtener lotes y medicamentos
            const [lotes] = await executeQuery(
                `SELECT l.Id, l.Numero_Lote, l.Medicamento_Id, m.Nombre 
                 FROM tbd_ph_lotes_medicamentos l 
                 JOIN tbc_ph_medicamentos m ON l.Medicamento_Id = m.Id 
                 WHERE l.Estatus = 1 LIMIT 50`
            );
            
            if (lotes.length === 0) {
                throw new Error('No hay lotes disponibles para simular compras');
            }
            
            const compras = [];
            const proveedores = ['Farmex SA', 'Genfar', 'Laboratorios MX', 'Proveedor Local', 'Distribuidora Nacional'];
            
            for (let i = 0; i < cantidad; i++) {
                const lote = lotes[Math.floor(Math.random() * lotes.length)];
                
                compras.push({
                    folio_compra: `FOLIO-${Date.now()}-${i}`,
                    fecha: new Date(),
                    proveedor: {
                        nombre: proveedores[Math.floor(Math.random() * proveedores.length)],
                        rfc: `RFC${Math.random().toString(36).substring(2, 8).toUpperCase()}`
                    },
                    medicamentos: [
                        {
                            id_medicamento: lote.Medicamento_Id,
                            nombre: lote.Nombre,
                            numero_lote: lote.Numero_Lote,
                            cantidad: Math.floor(Math.random() * 100) + 10,
                            precio_unitario: Math.floor(Math.random() * 500) + 10,
                            total_linea: 0 // Se calcula
                        }
                    ],
                    usuario_registro: 'admin',
                    estado: 'confirmada',
                    ip_origen: '127.0.0.1'
                });
                
                // Calcular total de línea
                compras[i].medicamentos[0].total_linea = 
                    compras[i].medicamentos[0].cantidad * compras[i].medicamentos[0].precio_unitario;
            }
            
            // Insertar compras
            const result = await collection.insertMany(compras);
            
            return {
                success: true,
                message: `${cantidad} compras simuladas en MongoDB`,
                data: {
                    cantidad_insertados: result.insertedCount,
                    ids_insertados: Object.keys(result.insertedIds),
                    timestamp: new Date().toISOString()
                }
            };
        } catch (error) {
            console.error('[ERROR] simularComprasMongoDb:', error);
            throw {
                success: false,
                message: `Error al simular compras: ${error.message}`,
                error: error.message
            };
        }
    }

    /**
     * Simula dispensaciones en MongoDB
     * @param {number} cantidad - Cantidad de dispensaciones a generar
     * @returns {Promise<Object>} Resultado de ejecución
     */
    static async simularDispensacionesMongoDb(cantidad) {
        try {
            console.log(`[MONGO-SIM] Generando ${cantidad} dispensaciones en MongoDB`);
            
            const db = getMongo();
            const collection = db.collection('dispensacion');
            
            // Obtener recetas y detalles
            const [recetas] = await executeQuery(
                `SELECT r.Id, r.Paciente_Id, d.Medicamento_Id, d.Cantidad 
                 FROM tbb_ph_recetas_medicas r 
                 LEFT JOIN tbd_ph_detalle_receta d ON r.Id = d.Receta_Id 
                 WHERE r.Estatus = 1 LIMIT 50`
            );
            
            if (recetas.length === 0) {
                throw new Error('No hay recetas disponibles para simular dispensaciones');
            }
            
            const dispensaciones = [];
            const usuarios = ['farmacista_1', 'farmacista_2', 'farmacista_3', 'admin'];
            
            for (let i = 0; i < cantidad; i++) {
                const receta = recetas[Math.floor(Math.random() * recetas.length)];
                
                dispensaciones.push({
                    id_receta: receta.Id,
                    id_paciente: receta.Paciente_Id,
                    medicamentos_dispensados: [
                        {
                            id_medicamento: receta.Medicamento_Id || 1,
                            cantidad: receta.Cantidad || 1,
                            lote_utilizado: `LOT-${Math.random().toString(36).substring(2, 8).toUpperCase()}`
                        }
                    ],
                    fecha_dispensacion: new Date(),
                    usuario_dispensador: usuarios[Math.floor(Math.random() * usuarios.length)],
                    firma_paciente: true,
                    observaciones: 'Dispensación completada',
                    ip_origen: '127.0.0.1'
                });
            }
            
            // Insertar dispensaciones
            const result = await collection.insertMany(dispensaciones);
            
            return {
                success: true,
                message: `${cantidad} dispensaciones simuladas en MongoDB`,
                data: {
                    cantidad_insertados: result.insertedCount,
                    ids_insertados: Object.keys(result.insertedIds),
                    timestamp: new Date().toISOString()
                }
            };
        } catch (error) {
            console.error('[ERROR] simularDispensacionesMongoDb:', error);
            throw {
                success: false,
                message: `Error al simular dispensaciones: ${error.message}`,
                error: error.message
            };
        }
    }
}

module.exports = {
    SimulacionService,
    SimulacionMongoService
};
