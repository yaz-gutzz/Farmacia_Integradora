-- Stored Procedure para Surtir Receta
-- Valida existencia de lote, stock y descuenta inventario

DELIMITER $$

CREATE PROCEDURE sp_surtir_receta(
    IN p_receta_id INT,
    IN p_medicamento_id INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE lote_id INT;
    DECLARE stock_disponible INT;
    DECLARE exit_handler INT DEFAULT 0;

    -- Manejo de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET exit_handler = 1;
    END;

    -- Iniciar transacción
    START TRANSACTION;

    -- 1. Validar que la receta existe
    IF NOT EXISTS (SELECT 1 FROM tbd_ph_recetas_medicas WHERE id_receta = p_receta_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Receta no encontrada';
    END IF;

    -- 2. Validar que el medicamento existe
    IF NOT EXISTS (SELECT 1 FROM tbc_ph_medicamentos WHERE Id_Medicamento = p_medicamento_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Medicamento no encontrado';
    END IF;

    -- 3. Buscar lote disponible con stock suficiente
    SELECT 
        lm.Id_Lote_Medicamento,
        lm.Cantidad_Actual
    INTO lote_id, stock_disponible
    FROM tbd_ph_lotes_medicamentos lm
    WHERE lm.Medicamento_Id = p_medicamento_id
        AND lm.Estado_Lote = 'Activo'
        AND lm.Cantidad_Actual >= p_cantidad
        AND lm.Fecha_Caducidad > CURDATE()
    ORDER BY lm.Fecha_Caducidad ASC
    LIMIT 1;

    -- 4. Validar que se encontró lote
    IF lote_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay lote disponible';
    END IF;

    -- 5. Validar stock
    IF stock_disponible < p_cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente';
    END IF;

    -- 6. Descontar del inventario de lotes
    UPDATE tbd_ph_lotes_medicamentos
    SET Cantidad_Actual = Cantidad_Actual - p_cantidad,
        Fecha_Registro = CURDATE()
    WHERE Id_Lote_Medicamento = lote_id;

    -- 7. Insertar en detalle_receta
    INSERT INTO tbd_ph_detalle_receta (
        Receta_Id,
        Medicamento_Id,
        Lote_Medicamento_Id,
        Cantidad,
        Fecha_Surtido,
        Estatus
    ) VALUES (
        p_receta_id,
        p_medicamento_id,
        lote_id,
        p_cantidad,
        CURDATE(),
        1
    );

    -- Confirmar transacción
    COMMIT;

END$$

DELIMITER ;
