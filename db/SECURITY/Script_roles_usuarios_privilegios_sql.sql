-- =========================================================
-- SISTEMA: FARMACIA HOSPITALARIA
-- CONTROL DE ACCESO BASADO EN ROLES (RBAC)
-- MOTOR: MySQL
-- =========================================================

-- =========================================================
-- 1. CREACIÓN DE USUARIOS DEL SISTEMA
-- (Usuarios base por área de trabajo)
-- =========================================================

CREATE USER 'jefe_farmacia'@'localhost' IDENTIFIED BY 'Jefe@123';
CREATE USER 'aux_farmacia'@'localhost' IDENTIFIED BY 'Aux@123';
CREATE USER 'inventario_farmacia'@'localhost' IDENTIFIED BY 'Inv@123';
CREATE USER 'compras_farmacia'@'localhost' IDENTIFIED BY 'Comp@123';
CREATE USER 'subrogacion_farmacia'@'localhost' IDENTIFIED BY 'Sub@123';

-- =========================================================
-- 2. CREACIÓN DE ROLES (RBAC)
-- Cada rol representa una función real del área de farmacia
-- =========================================================

CREATE ROLE 'rol_jefe_farmacia';
CREATE ROLE 'rol_aux_farmacia';
CREATE ROLE 'rol_inventario_farmacia';
CREATE ROLE 'rol_compras_farmacia';
CREATE ROLE 'rol_subrogacion_farmacia';

-- =========================================================
-- 3. ASIGNACIÓN DE PRIVILEGIOS POR ROL
-- Basado en procesos reales del sistema hospitalario
-- =========================================================

-- ---------------------------------------------------------
-- ROL: JEFE DE FARMACIA
-- Función: Supervisión total del sistema
-- ---------------------------------------------------------
GRANT SELECT ON hospital_matricula.* TO 'rol_jefe_farmacia';
GRANT INSERT, UPDATE, DELETE ON hospital_matricula.* TO 'rol_jefe_farmacia';

-- Justificación:
-- Tiene acceso total porque supervisa inventario, compras,
-- dispensación y subrogaciones para control administrativo.

-- ---------------------------------------------------------
-- ROL: AUXILIAR DE FARMACIA
-- Función: Operación diaria de dispensación
-- ---------------------------------------------------------
GRANT SELECT ON hospital_matricula.tbc_ph_medicamentos TO 'rol_aux_farmacia';
GRANT SELECT ON hospital_matricula.tbc_ph_recetas TO 'rol_aux_farmacia';
GRANT INSERT ON hospital_matricula.tbc_ph_dispensacion TO 'rol_aux_farmacia';
GRANT UPDATE ON hospital_matricula.tbc_ph_inventario TO 'rol_aux_farmacia';

-- Justificación:
-- Solo opera procesos de surtido y registro de medicamentos,
-- sin permisos de administración.

-- ---------------------------------------------------------
-- ROL: RESPONSABLE DE INVENTARIO
-- Función: Control de stock y movimientos
-- ---------------------------------------------------------
GRANT SELECT ON hospital_matricula.tbc_ph_inventario TO 'rol_inventario_farmacia';
GRANT INSERT, UPDATE ON hospital_matricula.tbc_ph_movimientos TO 'rol_inventario_farmacia';

-- Justificación:
-- Garantiza control de existencias y actualización de entradas/salidas.

-- ---------------------------------------------------------
-- ROL: ENCARGADO DE COMPRAS
-- Función: Abastecimiento de medicamentos
-- ---------------------------------------------------------
GRANT SELECT ON hospital_matricula.tbc_ph_proveedores TO 'rol_compras_farmacia';
GRANT SELECT ON hospital_matricula.tbc_ph_medicamentos TO 'rol_compras_farmacia';
GRANT INSERT ON hospital_matricula.tbc_ph_compras TO 'rol_compras_farmacia';

-- Justificación:
-- Responsable de reabastecimiento y relación con proveedores.

-- ---------------------------------------------------------
-- ROL: ENCARGADO DE SUBROGACIÓN
-- Función: Gestión de faltantes críticos
-- ---------------------------------------------------------
GRANT SELECT ON hospital_matricula.tbc_ph_subrogaciones TO 'rol_subrogacion_farmacia';
GRANT INSERT ON hospital_matricula.tbc_ph_subrogaciones TO 'rol_subrogacion_farmacia';
GRANT SELECT ON hospital_matricula.tbc_ph_recetas TO 'rol_subrogacion_farmacia';

-- Justificación:
-- Maneja medicamentos no disponibles y su reemplazo mediante subrogación.

-- =========================================================
-- 4. ASIGNACIÓN DE ROLES A USUARIOS
-- =========================================================

GRANT 'rol_jefe_farmacia' TO 'jefe_farmacia'@'localhost';
GRANT 'rol_aux_farmacia' TO 'aux_farmacia'@'localhost';
GRANT 'rol_inventario_farmacia' TO 'inventario_farmacia'@'localhost';
GRANT 'rol_compras_farmacia' TO 'compras_farmacia'@'localhost';
GRANT 'rol_subrogacion_farmacia' TO 'subrogacion_farmacia'@'localhost';

-- =========================================================
-- 5. ACTIVACIÓN DE ROLES POR DEFECTO
-- =========================================================

SET DEFAULT ROLE ALL TO
'jefe_farmacia'@'localhost',
'aux_farmacia'@'localhost',
'inventario_farmacia'@'localhost',
'compras_farmacia'@'localhost',
'subrogacion_farmacia'@'localhost';

