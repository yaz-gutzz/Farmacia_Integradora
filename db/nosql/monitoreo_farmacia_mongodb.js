// =========================================================
// MONITOREO DE BASE DE DATOS - FARMACIA (MongoDB)
// =========================================================

/*
=========================================================
JUSTIFICACIÓN DEL MECANISMO DE MONITOREO EN NOSQL
=========================================================

En sistemas de bases de datos relacionales como MySQL, es posible
implementar mecanismos de monitoreo avanzados mediante vistas (VIEW)
basadas en INFORMATION_SCHEMA, lo que permite consultar metadatos
estructurados como tablas, columnas, relaciones, tamaños y privilegios.

Sin embargo, en MongoDB (NoSQL), este enfoque no es viable debido a:

1. Ausencia de un esquema centralizado como INFORMATION_SCHEMA
2. Modelo de datos basado en documentos (JSON/BSON), no en tablas
3. Falta de soporte para relaciones estructuradas (foreign keys)
4. Los privilegios no se asignan a nivel de colección de forma consultable
   como en SQL, sino mediante roles con acciones (find, insert, update, remove)
5. No existen vistas complejas que integren múltiples metadatos del sistema

Por estas razones, no es posible construir un mecanismo de monitoreo
idéntico al de SQL.

En su lugar, MongoDB requiere un enfoque alternativo basado en:
- Estadísticas de base de datos (db.stats())
- Estadísticas por colección (collection.stats())
- Consulta de usuarios y roles (db.getUsers(), db.getRoles())

Este script implementa un mecanismo de monitoreo adaptado al modelo NoSQL,
proporcionando información relevante sobre:
- Colecciones existentes
- Cantidad de documentos
- Tamaño de almacenamiento
- Índices
- Usuarios del sistema (RBAC)

Esto permite simular un monitoreo estructurado, aunque con limitaciones
propias del modelo NoSQL.
=========================================================
*/


use farmacia;


// =========================================================
// 1. OBTENER TODAS LAS COLECCIONES
// =========================================================

const colecciones = db.getCollectionNames();


// =========================================================
// 2. OBTENER USUARIOS (RBAC)
// =========================================================

const usuarios = db.getUsers();


// =========================================================
// 3. FUNCIÓN PARA OBTENER USUARIOS CON ACCESO
// =========================================================

function obtenerUsuariosConAcceso(coleccion) {
    let usuariosConAcceso = [];

    usuarios.forEach(user => {
        user.roles.forEach(role => {
            usuariosConAcceso.push(user.user);
        });
    });

    return [...new Set(usuariosConAcceso)];
}


// =========================================================
// 4. MONITOREO POR COLECCIÓN
// =========================================================

let resultado = [];

colecciones.forEach(col => {

    const stats = db.getCollection(col).stats();

    resultado.push({
        coleccion: col,
        total_documentos: stats.count,
        tamaño_mb: (stats.size / 1024 / 1024).toFixed(2),
        almacenamiento_mb: (stats.storageSize / 1024 / 1024).toFixed(2),
        indices: stats.nindexes,
        usuarios_con_acceso: obtenerUsuariosConAcceso(col)
    });

});


// =========================================================
// 5. RESULTADO FINAL
// =========================================================

printjson(resultado);