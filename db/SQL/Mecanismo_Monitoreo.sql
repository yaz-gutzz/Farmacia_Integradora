CREATE ALGORITHM=UNDEFINED
DEFINER=`root`@`localhost`
SQL SECURITY DEFINER
VIEW `vw_monitoreo_bd_ph_rbac` AS

WITH tablas AS (
    SELECT 
        t.TABLE_SCHEMA,
        t.TABLE_NAME,
        t.TABLE_ROWS,
        t.DATA_LENGTH,
        t.INDEX_LENGTH,
        CAST(t.TABLE_COMMENT AS CHAR CHARACTER SET utf8mb4) AS comentario
    FROM information_schema.TABLES t
    WHERE 
        t.TABLE_SCHEMA = DATABASE()
        AND t.TABLE_TYPE = 'BASE TABLE'
        AND (
            t.TABLE_NAME LIKE 'tbb_%' OR
            t.TABLE_NAME LIKE 'tbc_%' OR
            t.TABLE_NAME LIKE 'tbd_%' OR
            t.TABLE_NAME LIKE 'tbi_%'
        )
),

comentarios AS (
    SELECT 
        TABLE_NAME,

        CASE 
            WHEN comentario IS NULL OR comentario = '' THEN 'N/A'
            WHEN REGEXP_LIKE(comentario, 'Entidad:')
                THEN TRIM(REPLACE(REGEXP_SUBSTR(comentario, 'Entidad:[^\n]*'), 'Entidad:', ''))
            ELSE 'INVALIDO'
        END AS entidad,

        CASE 
            WHEN comentario IS NULL OR comentario = '' THEN 'N/A'
            WHEN REGEXP_LIKE(comentario, 'Jerarquía:')
                THEN TRIM(REPLACE(REGEXP_SUBSTR(comentario, 'Jerarquía:[^\n]*'), 'Jerarquía:', ''))
            ELSE 'INVALIDO'
        END AS jerarquia,

        CASE 
            WHEN comentario IS NULL OR comentario = '' THEN 'N/A'
            WHEN REGEXP_LIKE(comentario, 'Percepción:')
                THEN TRIM(REPLACE(REGEXP_SUBSTR(comentario, 'Percepción:[^\n]*'), 'Percepción:', ''))
            ELSE 'INVALIDO'
        END AS percepcion,

        CASE 
            WHEN comentario IS NULL OR comentario = '' THEN 'Por definir'
            WHEN REGEXP_LIKE(comentario, 'Aprobado:')
                THEN TRIM(REPLACE(REGEXP_SUBSTR(comentario, 'Aprobado:[^\n]*'), 'Aprobado:', ''))
            ELSE 'Por definir'
        END AS aprobado
    FROM tablas
),

fk_tablas AS (
    SELECT DISTINCT TABLE_NAME
    FROM information_schema.KEY_COLUMN_USAGE
    WHERE 
        TABLE_SCHEMA = DATABASE()
        AND REFERENCED_TABLE_NAME IS NOT NULL
),

/* =========================================================
   RBAC REAL FARMACIA HOSPITALARIA
   ========================================================= */
roles_sistema AS (
    SELECT 'jefe_farmacia' AS usuario UNION
    SELECT 'aux_farmacia' UNION
    SELECT 'inventario_farmacia' UNION
    SELECT 'compras_farmacia' UNION
    SELECT 'subrogacion_farmacia'
)

SELECT 
    c.entidad,
    t.TABLE_NAME AS tabla,
    c.jerarquia AS tipo_jerarquia,
    c.percepcion AS tipo_concepcion,

    CASE 
        WHEN fk.TABLE_NAME IS NOT NULL THEN 'Debil'
        ELSE 'Fuerte'
    END AS tipo_dependencia,

    CASE 
        WHEN t.TABLE_NAME LIKE 'tbb_%' THEN 'Base'
        WHEN t.TABLE_NAME LIKE 'tbc_%' THEN 'Catalogo'
        WHEN t.TABLE_NAME LIKE 'tbd_%' THEN 'Derivada'
        WHEN t.TABLE_NAME LIKE 'tbi_%' THEN 'Isla'
        ELSE 'Base'
    END AS tipo_nomenclatura,

    c.aprobado AS tabla_aprobada,

    t.TABLE_ROWS AS total_registros,

    (SELECT COUNT(*)
     FROM information_schema.COLUMNS col
     WHERE col.TABLE_SCHEMA = DATABASE()
       AND col.TABLE_NAME = t.TABLE_NAME
    ) AS numero_columnas,

    ROUND(((t.DATA_LENGTH + t.INDEX_LENGTH) / 1024 / 1024), 2) AS tamano_mb,

    CONCAT(ROUND(((t.DATA_LENGTH + t.INDEX_LENGTH) / 1024 / 1024), 2), ' MB') AS tamano_aproximado,

    /* =========================
       RBAC REAL
       ========================= */

    (SELECT GROUP_CONCAT(r.usuario)
     FROM roles_sistema r
     WHERE EXISTS (
        SELECT 1
        FROM information_schema.table_privileges p
        WHERE p.GRANTEE LIKE CONCAT("'", r.usuario, "'@%")
          AND p.TABLE_NAME = t.TABLE_NAME
     )
    ) AS usuarios_con_acceso

FROM tablas t
LEFT JOIN comentarios c ON t.TABLE_NAME = c.TABLE_NAME
LEFT JOIN fk_tablas fk ON t.TABLE_NAME = fk.TABLE_NAME

ORDER BY c.entidad, t.TABLE_NAME;