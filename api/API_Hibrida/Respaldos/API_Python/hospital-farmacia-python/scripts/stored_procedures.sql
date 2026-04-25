-- ═══════════════════════════════════════════════════════════════════════════
-- STORED PROCEDURES PARA POBLACIÓN DE DATOS
-- Hospital Pharmacy API - Sistema Híbrido MySQL + MongoDB
-- ═══════════════════════════════════════════════════════════════════════════

USE hospital_matricula;

-- ─────────────────────────────────────────────────────────────────────────
-- 1. STORED PROCEDURE: sp_poblar_medicamentos
-- ─────────────────────────────────────────────────────────────────────────
-- Inserta medicamentos genéricos de prueba en cantidad dinámicamente

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_poblar_medicamentos $$

CREATE PROCEDURE sp_poblar_medicamentos(IN p_cantidad INT)
DETERMINISTIC
MODIFIES SQL DATA
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_tipo_med VARCHAR(50);
    DECLARE v_nombres VARCHAR(150);
    DECLARE v_cientifico VARCHAR(150);
    DECLARE v_comun VARCHAR(150);
    DECLARE v_activo VARCHAR(150);
    DECLARE v_concentracion VARCHAR(100);
    DECLARE v_forma VARCHAR(100);
    DECLARE v_via VARCHAR(100);
    
    DECLARE tipos CURSOR FOR 
        SELECT 'normal', 'controlado', 'alto_costo'
        UNION SELECT 'normal'
        UNION SELECT 'controlado';
    
    -- Validar cantidad
    IF p_cantidad < 1 OR p_cantidad > 1000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cantidad debe estar entre 1 y 1000';
    END IF;
    
    START TRANSACTION;
    
    WHILE i < p_cantidad DO
        SET i = i + 1;
        
        -- Generar datos simulados
        SET v_tipo_med = CASE (i % 3)
            WHEN 0 THEN 'normal'
            WHEN 1 THEN 'controlado'
            ELSE 'alto_costo'
        END;
        
        SET v_nombres = CONCAT('Medicamento_', i);
        SET v_cientifico = CONCAT('Nombre_Cientifico_', i);
        SET v_comun = CONCAT('Nombre_Comun_', i);
        SET v_activo = CONCAT('Principio_Activo_', i);
        SET v_concentracion = CONCAT('100mg');
        SET v_forma = CASE (i % 4)
            WHEN 0 THEN 'Tableta'
            WHEN 1 THEN 'Cápsula'
            WHEN 2 THEN 'Jarabe'
            ELSE 'Inyección'
        END;
        SET v_via = CASE (i % 3)
            WHEN 0 THEN 'Oral'
            WHEN 1 THEN 'Intramuscular'
            ELSE 'Endovenosa'
        END;
        
        -- Insertar medicamento
        INSERT INTO tbc_ph_medicamentos 
        (Nombre, Nombre_Cientifico, Nombre_Comun, Principio_Activo, 
         Concentracion, Forma_Farmaceutica, Via_Administracion, 
         Tipo_Medicamento, Fecha_Registro, Estatus)
        VALUES 
        (v_nombres, v_cientifico, v_comun, v_activo,
         v_concentracion, v_forma, v_via,
         v_tipo_med, NOW(), 1);
    END WHILE;
    
    COMMIT;
    
    SELECT CONCAT('✓ ', p_cantidad, ' medicamentos insertados correctamente') AS resultado;
END $$

DELIMITER ;

-- ─────────────────────────────────────────────────────────────────────────
-- 2. STORED PROCEDURE: sp_poblar_lotes
-- ─────────────────────────────────────────────────────────────────────────
-- Inserta lotes con medicamentos aleatorios y fechas válidas

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_poblar_lotes $$

CREATE PROCEDURE sp_poblar_lotes(IN p_cantidad INT)
DETERMINISTIC
MODIFIES SQL DATA
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_med_id INT;
    DECLARE v_max_med_id INT;
    DECLARE v_cantidad_lote INT;
    DECLARE v_fecha_fab DATE;
    DECLARE v_fecha_cad DATE;
    DECLARE v_estado VARCHAR(50);
    
    -- Validar cantidad
    IF p_cantidad < 1 OR p_cantidad > 5000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cantidad debe estar entre 1 y 5000';
    END IF;
    
    -- Obtener el máximo ID de medicamentos
    SELECT MAX(Id) INTO v_max_med_id FROM tbc_ph_medicamentos;
    
    IF v_max_med_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay medicamentos en la base de datos';
    END IF;
    
    START TRANSACTION;
    
    WHILE i < p_cantidad DO
        SET i = i + 1;
        
        -- Seleccionar medicamento aleatorio
        SET v_med_id = FLOOR(1 + RAND() * v_max_med_id);
        
        -- Verificar que el medicamento existe
        IF EXISTS(SELECT 1 FROM tbc_ph_medicamentos WHERE Id = v_med_id) THEN
            SET v_cantidad_lote = FLOOR(10 + RAND() * 490);
            SET v_fecha_fab = DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 365) DAY);
            SET v_fecha_cad = DATE_ADD(v_fecha_fab, INTERVAL FLOOR(2 + RAND() * 4) YEAR);
            SET v_estado = CASE
                WHEN v_fecha_cad < CURDATE() THEN 'vencido'
                WHEN v_cantidad_lote = 0 THEN 'agotado'
                ELSE 'disponible'
            END;
            
            -- Insertar lote
            INSERT INTO tbd_ph_lotes_medicamentos
            (Medicamento_Id, Numero_Lote, Fecha_Fabricacion, Fecha_Caducidad,
             Cantidad_Inicial, Cantidad_Actual, Estado_Lote, Fecha_Registro)
            VALUES
            (v_med_id, CONCAT('LOT-', DATE_FORMAT(NOW(), '%Y%m%d'), '-', i),
             v_fecha_fab, v_fecha_cad,
             v_cantidad_lote, v_cantidad_lote, v_estado, NOW());
        END IF;
    END WHILE;
    
    COMMIT;
    
    SELECT CONCAT('✓ ', p_cantidad, ' lotes insertados correctamente') AS resultado;
END $$

DELIMITER ;

-- ─────────────────────────────────────────────────────────────────────────
-- 3. STORED PROCEDURE: sp_poblar_inventario
-- ─────────────────────────────────────────────────────────────────────────
-- Inserta registros de inventario con lotes existentes

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_poblar_inventario $$

CREATE PROCEDURE sp_poblar_inventario(IN p_cantidad INT)
DETERMINISTIC
MODIFIES SQL DATA
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_med_id INT;
    DECLARE v_lote_id INT;
    DECLARE v_cantidad INT;
    DECLARE v_max_lote_id INT;
    
    -- Validar cantidad
    IF p_cantidad < 1 OR p_cantidad > 10000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cantidad debe estar entre 1 y 10000';
    END IF;
    
    -- Obtener el máximo ID de lotes
    SELECT MAX(Id) INTO v_max_lote_id FROM tbd_ph_lotes_medicamentos;
    
    IF v_max_lote_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay lotes en la base de datos';
    END IF;
    
    START TRANSACTION;
    
    WHILE i < p_cantidad DO
        SET i = i + 1;
        
        -- Seleccionar lote aleatorio
        SET v_lote_id = FLOOR(1 + RAND() * v_max_lote_id);
        
        -- Obtener medicamento del lote
        SELECT Medicamento_Id INTO v_med_id 
        FROM tbd_ph_lotes_medicamentos 
        WHERE Id = v_lote_id LIMIT 1;
        
        -- Si el medicamento no tiene inventario aún, crearlo
        IF NOT EXISTS(SELECT 1 FROM tbd_ph_inventario_medicamentos WHERE Medicamento_Id = v_med_id) THEN
            SET v_cantidad = FLOOR(10 + RAND() * 490);
            
            INSERT INTO tbd_ph_inventario_medicamentos
            (Medicamento_Id, Marca, Empresa, Farmaceutica, Presentacion,
             Efectos_Secundarios, Via_Administracion, Restricciones,
             Aprobacion, Cantidad, Fecha_Movimiento, Motivo, Fecha_Registro)
            VALUES
            (v_med_id, 'Laboratorio Genérico', CONCAT('Empresa_', FLOOR(RAND() * 10)),
             CONCAT('Farm_', FLOOR(RAND() * 10)), CONCAT('Presentación_', FLOOR(RAND() * 5)),
             'Ninguno', 'Oral', 'Ninguna',
             1, v_cantidad, NOW(), 'INVENTARIO INICIAL', NOW());
        END IF;
    END WHILE;
    
    COMMIT;
    
    SELECT CONCAT('✓ ', p_cantidad, ' registros de inventario insertados correctamente') AS resultado;
END $$

DELIMITER ;

-- ─────────────────────────────────────────────────────────────────────────
-- EJEMPLOS DE USO
-- ─────────────────────────────────────────────────────────────────────────

-- Poblar 100 medicamentos
-- CALL sp_poblar_medicamentos(100);

-- Poblar 500 lotes
-- CALL sp_poblar_lotes(500);

-- Poblar 1000 registros de inventario
-- CALL sp_poblar_inventario(1000);

-- O ejecutar todo en secuencia:
-- BEGIN
--   CALL sp_poblar_medicamentos(100);
--   CALL sp_poblar_lotes(500);
--   CALL sp_poblar_inventario(1000);
-- END;
