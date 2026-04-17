-- Respaldo Completo Base de Datos hospital_230142
-- Estructura + Datos
-- Fecha: Abril 2026

-- Crear Base de Datos
CREATE DATABASE IF NOT EXISTS hospital_230142;
USE hospital_230142;

-- Tabla: personas
CREATE TABLE IF NOT EXISTS personas (
  id_persona INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  cedula VARCHAR(20) UNIQUE,
  fecha_nacimiento DATE,
  genero ENUM('M', 'F', 'Otro'),
  direccion VARCHAR(255),
  telefono VARCHAR(20),
  email VARCHAR(100),
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: pacientes
CREATE TABLE IF NOT EXISTS pacientes (
  id_paciente INT AUTO_INCREMENT PRIMARY KEY,
  id_persona INT NOT NULL,
  numero_expediente VARCHAR(50) UNIQUE,
  tipo_sangre VARCHAR(5),
  alergias TEXT,
  enfermedades_cronicas TEXT,
  estado ENUM('Activo', 'Inactivo', 'Suspendido'),
  fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
);

-- Tabla: medicamentos
CREATE TABLE IF NOT EXISTS medicamentos (
  id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  descripcion TEXT,
  principio_activo VARCHAR(150),
  dosis VARCHAR(100),
  presentacion VARCHAR(100),
  precio_unitario DECIMAL(10, 2),
  cantidad_minima INT DEFAULT 10,
  cantidad_maxima INT DEFAULT 500,
  estado ENUM('Activo', 'Inactivo', 'Descontinuado'),
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: proveedores
CREATE TABLE IF NOT EXISTS proveedores (
  id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  contacto VARCHAR(100),
  telefono VARCHAR(20),
  email VARCHAR(100),
  empresa VARCHAR(150),
  direccion VARCHAR(255),
  estado ENUM('Activo', 'Inactivo'),
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: historiales_recetas
CREATE TABLE IF NOT EXISTS historiales_recetas (
  id_historial INT AUTO_INCREMENT PRIMARY KEY,
  id_paciente INT NOT NULL,
  id_medicamento INT NOT NULL,
  cantidad INT,
  dosis VARCHAR(100),
  duracion INT,
  fecha_receta DATE,
  medico_prescriptor VARCHAR(150),
  estado ENUM('Pendiente', 'Dispensado', 'Cancelado'),
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
  FOREIGN KEY (id_medicamento) REFERENCES medicamentos(id_medicamento)
);

-- Crear índices
CREATE INDEX idx_cedula ON personas(cedula);
CREATE INDEX idx_paciente_estado ON pacientes(estado);
CREATE INDEX idx_medicamento_estado ON medicamentos(estado);
CREATE INDEX idx_receta_paciente ON historiales_recetas(id_paciente);

-- FIN DEL RESPALDO
