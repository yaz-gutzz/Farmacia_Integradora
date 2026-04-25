-- Stored Procedure Maestro con SELECT final
-- Versión que devuelve mensaje de resultado

DELIMITER $$

CREATE PROCEDURE sp_poblar_datos_completo_con_resultado(
    IN p_medicamentos INT,
    IN p_lotes_por_medicamento INT,
    IN p_inventario_por_lote INT
)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 1;
    DECLARE k INT DEFAULT 1;
    DECLARE medicamento_id INT;
    DECLARE lote_id INT;
    DECLARE fecha_fabricacion DATE;
    DECLARE fecha_caducidad DATE;
    DECLARE cantidad_inicial INT;
    DECLARE cantidad_actual INT;
    DECLARE total_medicamentos INT DEFAULT 0;
    DECLARE total_lotes INT DEFAULT 0;
    DECLARE total_inventario INT DEFAULT 0;

    -- Iniciar transacción
    START TRANSACTION;

    -- Bucle para medicamentos
    WHILE i <= p_medicamentos DO
        -- Insertar medicamento
        INSERT INTO tbd_ph_medicamentos (
            Nombre,
            Nombre_Cientifico,
            Nombre_Comun,
            Principio_Activo,
            Concentracion,
            Forma_Farmaceutica,
            Via_Administracion,
            Tipo_Medicamento,
            Fecha_Registro,
            Estatus
        ) VALUES (
            CONCAT('Medicamento_', i),
            CONCAT('NombreCientifico_', i),
            CONCAT('NombreComun_', i),
            CONCAT('PrincipioActivo_', i),
            CONCAT(FLOOR(1 + RAND() * 100), ' mg'),
            CASE FLOOR(RAND() * 5)
                WHEN 0 THEN 'Tableta'
                WHEN 1 THEN 'Cápsula'
                WHEN 2 THEN 'Jarabe'
                WHEN 3 THEN 'Inyección'
                ELSE 'Crema'
            END,
            CASE FLOOR(RAND() * 4)
                WHEN 0 THEN 'Oral'
                WHEN 1 THEN 'Intravenosa'
                WHEN 2 THEN 'Tópica'
                ELSE 'Intramuscular'
            END,
            CASE FLOOR(RAND() * 3)
                WHEN 0 THEN 'Analgésico'
                WHEN 1 THEN 'Antibiótico'
                ELSE 'Antiinflamatorio'
            END,
            CURDATE(),
            1
        );

        -- Obtener ID del medicamento insertado
        SET medicamento_id = LAST_INSERT_ID();
        SET total_medicamentos = total_medicamentos + 1;

        -- Bucle para lotes por medicamento
        SET j = 1;
        WHILE j <= p_lotes_por_medicamento DO
            -- Generar fechas coherentes
            SET fecha_fabricacion = DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 365) DAY);
            SET fecha_caducidad = DATE_ADD(fecha_fabricacion, INTERVAL FLOOR(365 + RAND() * 730) DAY);

            -- Generar cantidades
            SET cantidad_inicial = FLOOR(100 + RAND() * 900);
            SET cantidad_actual = FLOOR(cantidad_inicial * (0.5 + RAND() * 0.5));

            -- Insertar lote
            INSERT INTO tbd_ph_lotes_medicamentos (
                Medicamento_Id,
                Numero_Lote,
                Fecha_Fabricacion,
                Fecha_Caducidad,
                Cantidad_Inicial,
                Cantidad_Actual,
                Estado_Lote,
                Fecha_Registro,
                Estatus
            ) VALUES (
                medicamento_id,
                CONCAT('LOT', LPAD(i, 3, '0'), '-', LPAD(j, 2, '0')),
                fecha_fabricacion,
                fecha_caducidad,
                cantidad_inicial,
                cantidad_actual,
                CASE FLOOR(RAND() * 3)
                    WHEN 0 THEN 'Activo'
                    WHEN 1 THEN 'En Uso'
                    ELSE 'Caducado'
                END,
                CURDATE(),
                1
            );

            -- Obtener ID del lote insertado
            SET lote_id = LAST_INSERT_ID();
            SET total_lotes = total_lotes + 1;

            -- Bucle para inventario por lote
            SET k = 1;
            WHILE k <= p_inventario_por_lote DO
                -- Insertar inventario
                INSERT INTO tbd_ph_inventario_medicamentos (
                    Lote_Medicamento_Id,
                    Marca,
                    Empresa,
                    Farmaceutica,
                    Presentacion,
                    Via_Administracion,
                    Cantidad,
                    Fecha_Registro,
                    Estatus
                ) VALUES (
                    lote_id,
                    CONCAT('Marca_', FLOOR(1 + RAND() * 10)),
                    CONCAT('Empresa_', FLOOR(1 + RAND() * 5)),
                    CONCAT('Farmaceutica_', FLOOR(1 + RAND() * 8)),
                    CONCAT(FLOOR(1 + RAND() * 100), ' unidades'),
                    CASE FLOOR(RAND() * 4)
                        WHEN 0 THEN 'Oral'
                        WHEN 1 THEN 'Intravenosa'
                        WHEN 2 THEN 'Tópica'
                        ELSE 'Intramuscular'
                    END,
                    FLOOR(1 + RAND() * 1000),
                    CURDATE(),
                    1
                );

                SET total_inventario = total_inventario + 1;
                SET k = k + 1;
            END WHILE;

            SET j = j + 1;
        END WHILE;

        SET i = i + 1;
    END WHILE;

    -- Confirmar transacción
    COMMIT;

    -- SELECT final con mensaje y estadísticas
    SELECT CONCAT(
        '✅ Datos poblados exitosamente: ',
        total_medicamentos, ' medicamentos, ',
        total_lotes, ' lotes, ',
        total_inventario, ' registros de inventario'
    ) AS mensaje,
    total_medicamentos AS medicamentos,
    total_lotes AS lotes,
    total_inventario AS inventario;

END$$

DELIMITER ;