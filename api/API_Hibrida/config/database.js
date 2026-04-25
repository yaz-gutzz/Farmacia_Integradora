const mysql = require('mysql2/promise');
const { MongoClient } = require('mongodb');

// ─── Configuración MySQL ─────────────────────────────────────────────────────
const mysqlPool = mysql.createPool({
    host: process.env.MYSQL_HOST || 'localhost',
    user: process.env.MYSQL_USER || 'root',
    password: process.env.MYSQL_PASSWORD || '',
    database: process.env.MYSQL_DATABASE || 'hospital_farmacia',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
    enableKeepAlive: true,
    keepAliveInitialDelayMs: 0
});

// ─── Configuración MongoDB ──────────────────────────────────────────────────
let mongoClient = null;
let mongoDb = null;

const connectMongo = async () => {
    try {
        if (!mongoClient) {
            const mongoUrl = process.env.MONGODB_URI || 'mongodb://localhost:27017';
            const mongoDbName = process.env.MONGODB_DATABASE || 'hospital_farmacia';
            
            mongoClient = new MongoClient(mongoUrl);
            await mongoClient.connect();
            mongoDb = mongoClient.db(mongoDbName);
            
            console.log('✓ Conectado a MongoDB');
        }
        return mongoDb;
    } catch (error) {
        console.error('✗ Error conectando a MongoDB:', error);
        throw error;
    }
};

const getMongo = () => {
    if (!mongoDb) {
        throw new Error('MongoDB no está conectado');
    }
    return mongoDb;
};

// ─── Funciones de conexión MySQL ────────────────────────────────────────────
const getConnection = async () => {
    try {
        return await mysqlPool.getConnection();
    } catch (error) {
        console.error('Error obteniendo conexión MySQL:', error);
        throw error;
    }
};

const executeQuery = async (query, params = []) => {
    const connection = await getConnection();
    try {
        const [result] = await connection.execute(query, params);
        return result;
    } finally {
        await connection.release();
    }
};

const executeProcedure = async (procedureName, params = []) => {
    const connection = await getConnection();
    try {
        const placeholders = params.map(() => '?').join(',');
        const query = `CALL ${procedureName}(${placeholders})`;
        const [result] = await connection.execute(query, params);
        return result;
    } finally {
        await connection.release();
    }
};

module.exports = {
    mysqlPool,
    getConnection,
    executeQuery,
    executeProcedure,
    connectMongo,
    getMongo
};
