-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_matricula
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbb_ge_organo_inventario`
--

DROP TABLE IF EXISTS `tbb_ge_organo_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ge_organo_inventario` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Organo_ID` int unsigned NOT NULL,
  `Codigo_Rastreo` varchar(20) NOT NULL,
  `Fecha_Procuracion` datetime NOT NULL,
  `Fecha_Expiracion` datetime NOT NULL,
  `Estado` enum('Disponible','Reservado','En Trasplante','Usado','Descartado') NOT NULL DEFAULT 'Disponible',
  `Etnia` varchar(100) NOT NULL,
  `Grupo_Sanguineo` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `Metodo_Preservacion` varchar(150) NOT NULL,
  `Observaciones` text,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Codigo_Rastreo` (`Codigo_Rastreo`),
  KEY `fk_inv_organo` (`Organo_ID`),
  CONSTRAINT `fk_inv_organo` FOREIGN KEY (`Organo_ID`) REFERENCES `tbc_ge_organos` (`ID`),
  CONSTRAINT `chk_etnia_formato` CHECK (((`Etnia` is null) or (`Etnia` <> _utf8mb4''))),
  CONSTRAINT `chk_viabilidad_temporal` CHECK ((`Fecha_Expiracion` > `Fecha_Procuracion`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Organo Inventario\r\nJerarquía: Genérica\r\nPercepción: Física\r\nAprobado: Sí';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_ge_quejas_sugerencias`
--

DROP TABLE IF EXISTS `tbb_ge_quejas_sugerencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ge_quejas_sugerencias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Tipo` enum('queja','sugerencia') NOT NULL,
  `Descripcion` text NOT NULL,
  `Estado` varchar(30) NOT NULL,
  `Persona_Fisica_ID` int unsigned NOT NULL,
  `Departamento_ID` int unsigned DEFAULT NULL,
  `Fecha_Accion` datetime DEFAULT NULL,
  `Personal_Revisor_ID` int unsigned DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `fk_qs_persona` (`Persona_Fisica_ID`),
  KEY `fk_qs_departamento` (`Departamento_ID`),
  KEY `fk_qs_revisor` (`Personal_Revisor_ID`),
  CONSTRAINT `fk_qs_persona` FOREIGN KEY (`Persona_Fisica_ID`) REFERENCES `tbb_hr_personas_fisicas` (`ID`),
  CONSTRAINT `fk_qs_revisor` FOREIGN KEY (`Personal_Revisor_ID`) REFERENCES `tbb_hr_personal` (`ID`),
  CONSTRAINT `chk_accion_revisor` CHECK (((`Fecha_Accion` is null) or (`Personal_Revisor_ID` is not null))),
  CONSTRAINT `chk_estado_queja` CHECK (((`Tipo` <> _utf8mb4'queja') or (`Estado` in (_utf8mb4'registrada',_utf8mb4'en_revision',_utf8mb4'en_proceso',_utf8mb4'resuelta',_utf8mb4'cerrada_sin_accion',_utf8mb4'rechazada')))),
  CONSTRAINT `chk_estado_sugerencia` CHECK (((`Tipo` <> _utf8mb4'sugerencia') or (`Estado` in (_utf8mb4'recibida',_utf8mb4'en_revision',_utf8mb4'evaluada',_utf8mb4'implementada',_utf8mb4'descartada'))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Queja y Sugerencia\nJerarquía: Genérica\nPercepción: ConceptualnAprobado: Sí';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_hr_medios_de_contacto`
--

DROP TABLE IF EXISTS `tbb_hr_medios_de_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_medios_de_contacto` (
  `ID` int unsigned NOT NULL,
  `Correo` varchar(150) DEFAULT NULL,
  `Telefono_Casa` varchar(20) DEFAULT NULL,
  `Movil` varchar(20) DEFAULT NULL,
  `Fecha_Registro` date NOT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `Persona_Id` FOREIGN KEY (`ID`) REFERENCES `tbb_hr_personas_fisicas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Medios de contacto\nJerarquía: Sub Entidad\nPercepción: Conceptual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_hr_personal`
--

DROP TABLE IF EXISTS `tbb_hr_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personal` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Numero_Empleado` int DEFAULT NULL,
  `Puesto` varchar(80) NOT NULL,
  `Tipo_Contrato` enum('BASE','EVENTUAL','HONORARIOS') NOT NULL,
  `Fecha_Ingreso` date NOT NULL,
  `Fecha_Baja` date DEFAULT NULL,
  `Salario` decimal(10,2) DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `numero_empleado_UNIQUE` (`Numero_Empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Personal\nJerarquía: Sub Entidad\n Percepción: Física';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_hr_personal_medico`
--

DROP TABLE IF EXISTS `tbb_hr_personal_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personal_medico` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Turno` enum('MATUTINO','VESPERTINO','NOCTURNO','MIXTO') DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Cedula_Profesional` varchar(30) NOT NULL,
  `Especialidad` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `celula_profecional_UNIQUE` (`Cedula_Profesional`),
  CONSTRAINT `Personal_Medico_Id` FOREIGN KEY (`ID`) REFERENCES `tbb_hr_personal` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Personal Medico\nJerarquía: Sub Entidad\nPercepción: Física';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_hr_personas`
--

DROP TABLE IF EXISTS `tbb_hr_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Tipo` enum('Fisica','Moral') NOT NULL DEFAULT 'Fisica',
  `Rfc` varchar(14) DEFAULT NULL,
  `Pais_Origen` varchar(50) DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `rfc_UNIQUE` (`Rfc`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Persona\nJerarquía: Super Entidad\nPercepción: Física';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_hr_personas_fisicas`
--

DROP TABLE IF EXISTS `tbb_hr_personas_fisicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personas_fisicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Titulo_Cortesia` varchar(40) DEFAULT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Primer_Apellido` varchar(45) NOT NULL,
  `Segundo_Apellido` varchar(60) DEFAULT NULL,
  `Genero` enum('M','N','N/B') NOT NULL DEFAULT 'N/B',
  `Fecha_Nacimiento` date NOT NULL,
  `Curp` varchar(18) DEFAULT NULL,
  `Grupo_Sanguineo` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Edad` int DEFAULT NULL,
  `Tipo_Edad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `Personas_Fisicas_Id` FOREIGN KEY (`ID`) REFERENCES `tbb_hr_personas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Personas Físicas\nJerarquía: Sub Entidad\nPercepción: Física ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_md_defunciones`
--

DROP TABLE IF EXISTS `tbb_md_defunciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_defunciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Defuncion\\nJerarquía: Entidad\\nPercepción: Fisica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_md_diagnosticos`
--

DROP TABLE IF EXISTS `tbb_md_diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_diagnosticos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Diagnostico\nJerarquia: Entidad\nPercepcion: Conceptual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_md_documentos_oficiales`
--

DROP TABLE IF EXISTS `tbb_md_documentos_oficiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_documentos_oficiales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Documento Oficial\nJerarquia: Entidad\nPercepcion: Fisica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_md_domicilios`
--

DROP TABLE IF EXISTS `tbb_md_domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_domicilios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Calle` varchar(150) NOT NULL,
  `Numero_Exterior` varchar(20) NOT NULL,
  `Numero_Interior` varchar(20) DEFAULT NULL,
  `Colonia` varchar(100) NOT NULL,
  `Codigo_Postal` varchar(10) NOT NULL,
  `Municipio` varchar(100) NOT NULL,
  `Estado` varchar(100) NOT NULL,
  `Referencias` text,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Domicilio\nJerarquia: Entidad\nPercepcion: Fisica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_md_expedientes_medicos`
--

DROP TABLE IF EXISTS `tbb_md_expedientes_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_expedientes_medicos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Expediente Medico\nJerarquia: Entidad\nPercepcion: Conceptual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_md_nacimientos`
--

DROP TABLE IF EXISTS `tbb_md_nacimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_nacimientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Nacimiento\nJerarquia: Entidad\nPercepcion: Fisica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_md_notas_medicas`
--

DROP TABLE IF EXISTS `tbb_md_notas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_notas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `FechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `TipoNota` varchar(50) NOT NULL,
  `AntecedentesRelevantes` text,
  `SintomasActuales` text NOT NULL,
  `InterrogatorioAnamnesis` text NOT NULL,
  `Paciente_ID` int unsigned NOT NULL,
  `Medico_ID` int unsigned NOT NULL,
  `Expediente_ID` int unsigned NOT NULL,
  `Valoracion_ID` int unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_nota_pac_md` (`Paciente_ID`),
  KEY `fk_nota_med_md` (`Medico_ID`),
  KEY `fk_nota_exp_md` (`Expediente_ID`),
  KEY `fk_nota_val_md` (`Valoracion_ID`),
  CONSTRAINT `fk_nota_exp_md` FOREIGN KEY (`Expediente_ID`) REFERENCES `tbb_md_expedientes_medicos` (`ID`),
  CONSTRAINT `fk_nota_med_md` FOREIGN KEY (`Medico_ID`) REFERENCES `tbb_hr_personal_medico` (`ID`),
  CONSTRAINT `fk_nota_pac_md` FOREIGN KEY (`Paciente_ID`) REFERENCES `tbb_md_pacientes` (`ID`),
  CONSTRAINT `fk_nota_val_md` FOREIGN KEY (`Valoracion_ID`) REFERENCES `tbb_ms_valoraciones` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Nota Medica\nJerarquia: Entidad\nPercepcion: Conceptual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_md_pacientes`
--

DROP TABLE IF EXISTS `tbb_md_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_pacientes` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Paciente\nJerarquia: Super Entidad\nPercepcion: Fisica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_md_tratamientos`
--

DROP TABLE IF EXISTS `tbb_md_tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_md_tratamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Tratamiento\nJerarquia: Entidad\nPercepcion: Conceptual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_mr_personas_morales`
--

DROP TABLE IF EXISTS `tbb_mr_personas_morales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_mr_personas_morales` (
  `id` int unsigned NOT NULL,
  `Razon_Social` varchar(200) NOT NULL,
  `Tipo` varchar(100) NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_creacion` date NOT NULL DEFAULT (curdate()),
  `estatus` enum('Activa','Inactiva') NOT NULL DEFAULT 'Activa',
  `responsabilidad` varchar(100) DEFAULT NULL,
  `capacidad_juridica` varchar(100) DEFAULT NULL,
  `patrimonio` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `fk_persona_moral_persona` FOREIGN KEY (`id`) REFERENCES `tbb_hr_personas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Persona Moral \nPercepción: Conceptual \nJerarquía: Generica \n Aprobado: no';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_mr_proveedores`
--

DROP TABLE IF EXISTS `tbb_mr_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_mr_proveedores` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `Nombre` varchar(100) NOT NULL,
  `Contacto` varchar(50) DEFAULT NULL,
  `Especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Proveedor \nPercepción: Mixto \nJerarquía: Generica \n Aprobado: no';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_mr_transacciones_financieras`
--

DROP TABLE IF EXISTS `tbb_mr_transacciones_financieras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_mr_transacciones_financieras` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `Proveedor_ID` int unsigned NOT NULL,
  `Tipo_Transacciones` enum('Pago','Abono','Nota de Credito') DEFAULT NULL,
  `Fecha_Transaccion` datetime DEFAULT NULL,
  `Referencia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_transacciones_proveedor_idx` (`Proveedor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Transaccion Financiera \nPercepción: Conceptual \nJerarquía: Generica  \n Aprobado: no';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_ms_citas_medicas`
--

DROP TABLE IF EXISTS `tbb_ms_citas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ms_citas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` int unsigned NOT NULL,
  `id_personal_medico` int unsigned NOT NULL,
  `id_area` int unsigned DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `tipo_cita` enum('Consulta general','Urgencias','Control','Seguimiento','Primera vez') NOT NULL,
  `estado_cita` enum('Pendiente','En curso','Completada','Cancelada','No asistió') DEFAULT 'Pendiente',
  `observaciones` text,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `id_servicio_medico` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_citas_servicios_medicos` (`id_servicio_medico`),
  CONSTRAINT `fk_citas_servicios_medicos` FOREIGN KEY (`id_servicio_medico`) REFERENCES `tbc_ms_servicios_medicos` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Citas Médicas Jerarquía: Entidad Débil Percepción: Conceptual Aprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_ms_dietas`
--

DROP TABLE IF EXISTS `tbb_ms_dietas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ms_dietas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `id_cita_medica` int unsigned DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `tipo_dieta` enum('Liquida clara','Liquida completa','Blanda','Facil masticacion','Hiposodica','Hipocalorica','Diabeticos') NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Dietas Jerarquía: Entidad Débil Percepción: Fisica Aprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_ms_transfusiones_sanguineas`
--

DROP TABLE IF EXISTS `tbb_ms_transfusiones_sanguineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ms_transfusiones_sanguineas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Cirugia_ID` int unsigned DEFAULT NULL,
  `Valoracion_ID` int unsigned DEFAULT NULL,
  `Medico_ID` int unsigned NOT NULL,
  `Tipo_Sangre` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `Cantidad_ml` int unsigned NOT NULL,
  `Fecha_Transfusion` datetime NOT NULL,
  `Reaccion_Adversa` text,
  `Observaciones` text,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `id_servicio_medico` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_transfusiones_servicios_medicos` (`id_servicio_medico`),
  CONSTRAINT `fk_transfusiones_servicios_medicos` FOREIGN KEY (`id_servicio_medico`) REFERENCES `tbc_ms_servicios_medicos` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Transfusiones Sanguíneas Jerarquía: Entidad Débil Percepción: Fisica Aprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_ms_traslados`
--

DROP TABLE IF EXISTS `tbb_ms_traslados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ms_traslados` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Cirugia_ID` int unsigned DEFAULT NULL,
  `Valoracion_ID` int unsigned DEFAULT NULL,
  `Tipo_Traslado` enum('Interno','Externo','Urgente','Programado') NOT NULL,
  `Area_Origen` varchar(120) NOT NULL,
  `Area_Destino` varchar(120) NOT NULL,
  `Responsable_ID` int unsigned NOT NULL,
  `Motivo` text,
  `Fecha_Traslado` datetime NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `id_servicio_medico` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_traslados_servicios_medicos` (`id_servicio_medico`),
  CONSTRAINT `fk_traslados_servicios_medicos` FOREIGN KEY (`id_servicio_medico`) REFERENCES `tbc_ms_servicios_medicos` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Traslados Jerarquía: Entidad Débil Percepción: Fisica Aprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_ms_valoraciones`
--

DROP TABLE IF EXISTS `tbb_ms_valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ms_valoraciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Medico_ID` int unsigned NOT NULL,
  `Tratamiento` text,
  `Observaciones` text,
  `Fecha_Valoracion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `id_servicio_medico` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_valoraciones_servicios_medicos` (`id_servicio_medico`),
  CONSTRAINT `fk_valoraciones_servicios_medicos` FOREIGN KEY (`id_servicio_medico`) REFERENCES `tbc_ms_servicios_medicos` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Valoraciones Jerarquía: Entidad Débil Percepción: Conceptual Aprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_ph_recetas_medicas`
--

DROP TABLE IF EXISTS `tbb_ph_recetas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ph_recetas_medicas` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la receta.',
  `Paciente_Id` int unsigned NOT NULL COMMENT 'Referencia al paciente.',
  `Personal_Medico_Id` int unsigned NOT NULL COMMENT 'Referencia al médico.',
  `Fecha_Emision` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de emisión de la receta.',
  `Estado_Receta` enum('Pendiente','Surtida','Cancelada') NOT NULL DEFAULT 'Pendiente' COMMENT 'Estado de la receta.',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de registro.',
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de actualización.',
  `Estatus` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Estado del registro',
  PRIMARY KEY (`Id`),
  KEY `fk_paciente_1_idx` (`Paciente_Id`),
  KEY `fk_receta_medico` (`Personal_Medico_Id`),
  CONSTRAINT `fk_paciente_1` FOREIGN KEY (`Paciente_Id`) REFERENCES `tbb_md_pacientes` (`ID`),
  CONSTRAINT `fk_receta_medico` FOREIGN KEY (`Personal_Medico_Id`) REFERENCES `tbb_hr_personal_medico` (`ID`),
  CONSTRAINT `fk_receta_paciente` FOREIGN KEY (`Paciente_Id`) REFERENCES `tbb_md_pacientes` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2519 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Recetas Medicas\nJerarquía: Débil\nPercepción: Genérica\nAprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_ge_areas`
--

DROP TABLE IF EXISTS `tbc_ge_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ge_areas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Descripcion` text,
  `Espacio_ID` int unsigned NOT NULL,
  `Personal_Responsable_ID` int unsigned NOT NULL,
  `Area_Superior_ID` int unsigned DEFAULT NULL,
  `Estatus_Operacion` enum('Activa','Inactiva','Suspendida','Cancelada') NOT NULL DEFAULT 'Activa',
  `Total_Empleados` int unsigned NOT NULL DEFAULT '0',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Nombre` (`Nombre`),
  KEY `fk_ge_espacio_idx` (`Espacio_ID`),
  KEY `fk_ge_personal_responsable_idx` (`Personal_Responsable_ID`),
  KEY `fk_ge_area_superior_idx` (`Area_Superior_ID`),
  CONSTRAINT `fk_ge_area_superior` FOREIGN KEY (`Area_Superior_ID`) REFERENCES `tbc_ge_areas` (`ID`),
  CONSTRAINT `fk_ge_espacio` FOREIGN KEY (`Espacio_ID`) REFERENCES `tbc_mr_espacios` (`ID`),
  CONSTRAINT `fk_ge_personal_responsable` FOREIGN KEY (`Personal_Responsable_ID`) REFERENCES `tbb_hr_personal` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Área\nJerarquía: Genérica\nPercepción: Conceptual\nAprobado: Sí';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_ge_organos`
--

DROP TABLE IF EXISTS `tbc_ge_organos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ge_organos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Nombre_Cientifico` varchar(100) NOT NULL,
  `Sistema` varchar(100) DEFAULT NULL,
  `Aparato` varchar(100) DEFAULT NULL,
  `Descripcion` text,
  `Funcion` text,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  CONSTRAINT `chk_sistema_o_aparato` CHECK ((((`Sistema` is not null) and (`Sistema` <> _utf8mb4'')) or ((`Aparato` is not null) and (`Aparato` <> _utf8mb4''))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Órgano\r\nJerarquía: Genérica\r\nPercepción: Conceptual\r\nAprobado: Sí';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_ge_patologias`
--

DROP TABLE IF EXISTS `tbc_ge_patologias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ge_patologias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Nombre_Cientifico` varchar(150) NOT NULL,
  `Nombre_Comun` varchar(150) DEFAULT NULL,
  `Descripcion` text,
  `Sintomas` text,
  `Fecha_Registro` datetime NOT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Patología\r\nJerarquía: Genérica\r\nPercepción: Mixta\r\nAprobado: Sí';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_ge_servicios`
--

DROP TABLE IF EXISTS `tbc_ge_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ge_servicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Area_ID` int unsigned NOT NULL,
  `Nombre` varchar(80) NOT NULL,
  `Descripcion` text,
  `Tipo_Servicio` enum('Médico','Administrativo','Sociales','Apoyo') DEFAULT NULL,
  `Nivel` enum('Basico','Especializado','Alta Especialidad') NOT NULL DEFAULT 'Basico',
  `Costo` tinyint NOT NULL DEFAULT '0',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `fk_servicio_area_idx` (`Area_ID`),
  CONSTRAINT `fk_servicio_area` FOREIGN KEY (`Area_ID`) REFERENCES `tbc_ge_areas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Servicio\r\nJerarquía: Genérica\r\nPercepción: Conceptual\r\nAprobado: Sí';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_ge_tipos_patologias`
--

DROP TABLE IF EXISTS `tbc_ge_tipos_patologias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ge_tipos_patologias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Descripcion` text,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Tipos Patologías\nPercepción: Conceptual\nJerarquía: Genérica\nAprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_hr_departamentos`
--

DROP TABLE IF EXISTS `tbc_hr_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_hr_departamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Descripcion` text,
  `Area_Id` int unsigned NOT NULL,
  `Responsable_Personal_ID` int unsigned NOT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Responsable_Personal_Id_idx` (`Responsable_Personal_ID`),
  KEY `Dapartamento_Area_Id_idx` (`Area_Id`),
  CONSTRAINT `Departamento_Area_Id` FOREIGN KEY (`Area_Id`) REFERENCES `tbc_ge_areas` (`ID`),
  CONSTRAINT `Responsable_Personal_Id` FOREIGN KEY (`Responsable_Personal_ID`) REFERENCES `tbb_hr_personal` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Departamentos\nJerarquía: Generica\nPercepción: Conceptual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_md_signos_vitales`
--

DROP TABLE IF EXISTS `tbc_md_signos_vitales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_md_signos_vitales` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Abreviatura` varchar(20) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Tipo` enum('Corporal','Cardiovascular','Respiratorio','Termico','Metabolico','Otro') NOT NULL,
  `UnidadMedida` varchar(20) NOT NULL,
  `RangoMinimo` decimal(6,2) DEFAULT NULL,
  `RangoMaximo` decimal(6,2) DEFAULT NULL,
  `FechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Signo Vital\nJerarquia: Catalogo\nPercepcion: Conceptual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_mr_equipamientos`
--

DROP TABLE IF EXISTS `tbc_mr_equipamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_mr_equipamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `Nombre` varchar(100) NOT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Proveedor_ID` int unsigned NOT NULL,
  `Espacio_ID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_equipamiento_espacio` (`Espacio_ID`),
  CONSTRAINT `fk_equipamiento_espacio` FOREIGN KEY (`Espacio_ID`) REFERENCES `tbc_mr_espacios` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Equipamiento \nPercepción: Fisico \nJerarquía: Super Entidad  \n Aprobado: no';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_mr_espacios`
--

DROP TABLE IF EXISTS `tbc_mr_espacios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_mr_espacios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `Nombre_Sala` varchar(100) NOT NULL,
  `Piso` int DEFAULT NULL,
  `Capacidad` int DEFAULT NULL,
  `Edificio` varchar(100) DEFAULT NULL,
  `Nombre_Area` varchar(100) DEFAULT NULL,
  `Tipo_Unidad_Fisica` varchar(100) DEFAULT NULL,
  `Clave` varchar(50) DEFAULT NULL,
  `Encargado_Espacio` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Espacio \nPercepción: Fisico \nJerarquía: Generica \n Aprobado: no';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_ms_cirugias`
--

DROP TABLE IF EXISTS `tbc_ms_cirugias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ms_cirugias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_oficial` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text,
  `especialidad` varchar(100) NOT NULL,
  `nivel_complejidad` enum('Baja','Media','Alta') NOT NULL,
  `tipo_procedimiento` enum('Electiva','Urgente','Emergente') NOT NULL,
  `clasificacion_asa` enum('I','II','III','IV','V') DEFAULT NULL,
  `tipo_anestesia` enum('Local','Regional','General','Sedacion') NOT NULL,
  `duracion_estimada_min` int unsigned DEFAULT NULL,
  `requiere_hospitalizacion` tinyint(1) NOT NULL DEFAULT '0',
  `requiere_uci` tinyint(1) NOT NULL DEFAULT '0',
  `costo_referencia` decimal(10,2) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `id_servicio_medico` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_cirugias_servicios_medicos` (`id_servicio_medico`),
  CONSTRAINT `fk_cirugias_servicios_medicos` FOREIGN KEY (`id_servicio_medico`) REFERENCES `tbc_ms_servicios_medicos` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Cirugías Jerarquía: Entidad Fuerte Percepción: Conceptual Aprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_ms_servicios_medicos`
--

DROP TABLE IF EXISTS `tbc_ms_servicios_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ms_servicios_medicos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Servicio` varchar(150) NOT NULL,
  `Descripcion` text,
  `Estatus` enum('Activo','Inactivo','Pendiente','Cancelado') DEFAULT 'Activo',
  `Tipo_Servicio` enum('Basico','Especialidad','Urgencias','Preventivo') NOT NULL,
  `Prioridad` enum('Baja','Media','Alta','Critica') DEFAULT 'Media',
  `Observaciones` text,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Servicios Médicos Jerarquía: Entidad Fuerte Percepción: Conceptual Aprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_ph_medicamentos`
--

DROP TABLE IF EXISTS `tbc_ph_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ph_medicamentos` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del medicamento.',
  `Nombre` varchar(150) NOT NULL COMMENT 'Nombre comercial del medicamento.',
  `Nombre_Cientifico` varchar(150) NOT NULL COMMENT 'Nombre científico del medicamento.',
  `Nombre_Comun` varchar(150) NOT NULL COMMENT 'Nombre genérico o común del medicamento.',
  `Principio_Activo` varchar(150) NOT NULL COMMENT 'Sustancia responsable del efecto terapéutico.',
  `Concentracion` varchar(100) NOT NULL COMMENT 'Cantidad del principio activo.',
  `Forma_Farmaceutica` varchar(100) NOT NULL COMMENT 'Presentación física del medicamento.',
  `Via_Administracion` varchar(100) NOT NULL COMMENT 'Forma en que se administra el medicamento.',
  `Tipo_Medicamento` enum('normal','controlado','alto_costo') NOT NULL COMMENT 'Clasificación del medicamento.',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de registro.',
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de última actualización.',
  `Estatus` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Estado del registro (activo/inactivo)',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3427 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Medicamentos\nJerarquía: Fuerte\nPercepción: Catalogo\nAprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_ge_aprobaciones`
--

DROP TABLE IF EXISTS `tbd_ge_aprobaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ge_aprobaciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Personal_Aprobador_ID` int unsigned NOT NULL,
  `Solicitud_ID` int unsigned NOT NULL,
  `Observacion` text,
  `Estatus_Aprobacion` enum('Pendiente','Aprobado','Rechazado','En Revisión') DEFAULT 'Pendiente',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ID` DESC) USING BTREE,
  KEY `fk_ge_personal_aprobador_idx` (`Personal_Aprobador_ID`),
  KEY `fk_ge_personal_servicio_idx` (`Solicitud_ID`),
  CONSTRAINT `fk_ge_personal_aprobador` FOREIGN KEY (`Personal_Aprobador_ID`) REFERENCES `tbb_hr_personal` (`ID`),
  CONSTRAINT `fk_ge_personal_servicio` FOREIGN KEY (`Solicitud_ID`) REFERENCES `tbd_ge_solicitudes_servicios` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Aprobaciones\r\nJerarquía: Genérica\r\nPercepción: Conceptual\r\nAprobado: NoSQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_ge_patologias_tipos`
--

DROP TABLE IF EXISTS `tbd_ge_patologias_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ge_patologias_tipos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Patologia_ID` int unsigned NOT NULL,
  `Tipo_Patologia_ID` int unsigned NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `fk_patologia_maestra` (`Patologia_ID`),
  KEY `fk_tipo_clasificacion` (`Tipo_Patologia_ID`),
  CONSTRAINT `fk_patologia_maestra` FOREIGN KEY (`Patologia_ID`) REFERENCES `tbc_ge_patologias` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `fk_tipo_clasificacion` FOREIGN KEY (`Tipo_Patologia_ID`) REFERENCES `tbc_ge_tipos_patologias` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Patologías Tipos\r\nJerarquía: Genérica\r\nPercepción: Conceptual\r\nAprobado: Sí';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_ge_servicio_participantes`
--

DROP TABLE IF EXISTS `tbd_ge_servicio_participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ge_servicio_participantes` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Solicitud_Servicio_ID` int unsigned NOT NULL,
  `Persona_ID` int unsigned NOT NULL,
  `Rol_Participacion` varchar(50) DEFAULT 'Beneficiario',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Uk_Servicio_Persona` (`Solicitud_Servicio_ID`,`Persona_ID`),
  KEY `Fk_Sp_Persona` (`Persona_ID`),
  CONSTRAINT `Fk_Sp_Persona` FOREIGN KEY (`Persona_ID`) REFERENCES `tbb_hr_personas` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `Fk_Sp_Servicio` FOREIGN KEY (`Solicitud_Servicio_ID`) REFERENCES `tbd_ge_solicitudes_servicios` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Servicio Participantes\nJerarquía: Genérica\nPercepción: Conceptual\nAprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_ge_solicitudes_servicios`
--

DROP TABLE IF EXISTS `tbd_ge_solicitudes_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ge_solicitudes_servicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Servicio_ID` int unsigned NOT NULL,
  `Persona_ID` int unsigned NOT NULL,
  `Estatus_Solicitud` enum('Pendiente','En Revision','Autorizada','En Proceso','Atendida','Cancelada','Rechazada') DEFAULT 'Pendiente',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `fk_solicitud_servicio` (`Servicio_ID`),
  KEY `fk_solicitud_persona` (`Persona_ID`),
  CONSTRAINT `fk_solicitud_persona` FOREIGN KEY (`Persona_ID`) REFERENCES `tbb_hr_personas` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_servicio` FOREIGN KEY (`Servicio_ID`) REFERENCES `tbc_ge_servicios` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Solicitudes de Servicios\nJerarquía: Genérica\nPercepción: Conceptual\nAprobado: Sí';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_hr_horarios`
--

DROP TABLE IF EXISTS `tbd_hr_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_hr_horarios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Personal_ID` int unsigned NOT NULL,
  `Area_ID` int unsigned NOT NULL,
  `Dia_Semana` enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO','DOMINGO') NOT NULL,
  `Hora_Inicio` time NOT NULL,
  `Hora_Fin` time NOT NULL,
  `Tipo_Turno` enum('MATUTINO','VESPERTINO','NOCTURNO','GUARDIA') DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `Personal_Id_idx` (`Personal_ID`),
  KEY `Horario_Area_Id_idx` (`Area_ID`),
  CONSTRAINT `Horario_Area_Id` FOREIGN KEY (`Area_ID`) REFERENCES `tbc_ge_areas` (`ID`),
  CONSTRAINT `Personal_Id` FOREIGN KEY (`Personal_ID`) REFERENCES `tbb_hr_personal` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Horarios\nJerarquía: Generica\n Percepción: Conceptual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_md_padecimientos`
--

DROP TABLE IF EXISTS `tbd_md_padecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_md_padecimientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_mr_accesos`
--

DROP TABLE IF EXISTS `tbd_mr_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_mr_accesos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Persona_ID` int unsigned NOT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Espacio_ID` int unsigned NOT NULL,
  `Tipo` enum('Entrada','Salida') NOT NULL DEFAULT 'Entrada',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Personal_ID_autoriza` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_acceso_persona` (`Persona_ID`),
  KEY `fk_acceso_espacio` (`Espacio_ID`),
  CONSTRAINT `fk_acceso_espacio` FOREIGN KEY (`Espacio_ID`) REFERENCES `tbc_mr_espacios` (`ID`),
  CONSTRAINT `fk_acceso_persona` FOREIGN KEY (`Persona_ID`) REFERENCES `tbb_hr_personas_fisicas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Acceso \nJerarquía: Generica \nPercepción: Mixto \n Aprobado: no';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_mr_inventario_equipamientos`
--

DROP TABLE IF EXISTS `tbd_mr_inventario_equipamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_mr_inventario_equipamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Equipamiento_ID` int DEFAULT NULL,
  `Numero_serie` varchar(50) DEFAULT NULL,
  `Codigo_Patrimonial` varchar(50) DEFAULT NULL,
  `Espacio_ID` int DEFAULT NULL,
  `EstatusEquipamiento` enum('Operativo','En uso','Mantenimiento','Almacenado','Baja') DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Adquisicion` date DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Inventario Equipamiento \nPercepción: Fisico \nJerarquía: Super Entidad  \n Aprobado: no';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_ms_campanias`
--

DROP TABLE IF EXISTS `tbd_ms_campanias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ms_campanias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Descripcion` text NOT NULL,
  `Departamento_ID` int unsigned NOT NULL,
  `Personal_ID_responsable` int unsigned NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Fin` datetime DEFAULT NULL,
  `Estatus_Realizacion` enum('Programada','Realizada','Finalizada','Cancelada','Aprobada','Activa','Inactiva') DEFAULT 'Programada',
  `Estatus` bit(1) DEFAULT b'1',
  `Tipo` enum('Preventiva','Diagnóstica','Terapéutica','Especializada','General') NOT NULL DEFAULT 'General',
  `Observaciones` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Campanias Jerarquía: Sub Entidad Percepción: Física';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_ms_recursos_cirugia`
--

DROP TABLE IF EXISTS `tbd_ms_recursos_cirugia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ms_recursos_cirugia` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Cirugia_ID` int unsigned NOT NULL,
  `Tipo_Recurso` enum('Personal','Equipamiento','Medicamento','Espacio') NOT NULL,
  `Personal_ID` int unsigned DEFAULT NULL,
  `Equipamiento_ID` int unsigned DEFAULT NULL,
  `Medicamento_ID` int unsigned DEFAULT NULL,
  `Espacio_ID` int unsigned DEFAULT NULL,
  `Cantidad` decimal(10,2) DEFAULT '1.00',
  `Observaciones` text,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad:Recursos Cirugias Jerarquía:Entidad Débil Percepción:Fisica Aprobado:No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_ph_detalle_receta`
--

DROP TABLE IF EXISTS `tbd_ph_detalle_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ph_detalle_receta` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del detalle de receta.',
  `Receta_Id` int unsigned NOT NULL COMMENT 'Referencia a la receta.',
  `Medicamento_Id` int unsigned NOT NULL COMMENT 'Referencia al medicamento.',
  `Dosis` varchar(100) NOT NULL COMMENT 'Dosis indicada del medicamento.',
  `Frecuencia` varchar(100) NOT NULL COMMENT 'Frecuencia de administración.',
  `Duracion` varchar(100) NOT NULL COMMENT 'Duración del tratamiento.',
  `Cantidad` int unsigned NOT NULL COMMENT 'Cantidad total prescrita.',
  `Indicaciones` text COMMENT 'Indicaciones adicionales del médico.',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de registro.',
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de actualización.',
  `Estatus` bit(1) DEFAULT b'1' COMMENT 'Estado del registro',
  PRIMARY KEY (`Id`),
  KEY `fk_detalle_receta` (`Receta_Id`),
  KEY `fk_detalle_medicamento` (`Medicamento_Id`),
  CONSTRAINT `fk_detalle_medicamento` FOREIGN KEY (`Medicamento_Id`) REFERENCES `tbc_ph_medicamentos` (`Id`),
  CONSTRAINT `fk_detalle_receta` FOREIGN KEY (`Receta_Id`) REFERENCES `tbb_ph_recetas_medicas` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Detalle Receta\nJerarquía: Débil\nPercepción: Genérica\nAprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_ph_inventario_medicamentos`
--

DROP TABLE IF EXISTS `tbd_ph_inventario_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ph_inventario_medicamentos` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del inventario.',
  `Lote_Medicamento_Id` int unsigned NOT NULL COMMENT 'Referencia al lote.',
  `Marca` varchar(150) NOT NULL COMMENT 'Marca del medicamento.',
  `Empresa` varchar(150) NOT NULL COMMENT 'Empresa distribuidora.',
  `Farmaceutica` varchar(150) NOT NULL COMMENT 'Laboratorio fabricante.',
  `Presentacion` varchar(150) NOT NULL COMMENT 'Presentación del medicamento.',
  `Via_Administracion` varchar(150) NOT NULL COMMENT 'Vía de administración.',
  `Efectos_Secundarios` text COMMENT 'Posibles efectos secundarios.',
  `Restricciones` text COMMENT 'Restricciones de uso.',
  `Cantidad` int unsigned NOT NULL COMMENT 'Cantidad disponible.',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de registro.',
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de actualización.',
  `Estatus` bit(1) DEFAULT b'1' COMMENT 'Estado del registro',
  PRIMARY KEY (`Id`),
  KEY `fk_inventario_lote` (`Lote_Medicamento_Id`),
  CONSTRAINT `fk_inventario_lote` FOREIGN KEY (`Lote_Medicamento_Id`) REFERENCES `tbd_ph_lotes_medicamentos` (`Id`),
  CONSTRAINT `chk_cantidad_mov` CHECK ((`Cantidad` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=2475 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Inventario de Medicamentos\\nJerarquía: Débil\\nPercepción: Genérica\\nAprobado: Si';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_ph_lotes_medicamentos`
--

DROP TABLE IF EXISTS `tbd_ph_lotes_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ph_lotes_medicamentos` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del lote.',
  `Medicamento_Id` int unsigned NOT NULL COMMENT 'Referencia al medicamento.',
  `Proveedor_Id` int unsigned DEFAULT NULL COMMENT 'Referencia al proveedor.',
  `Numero_Lote` varchar(100) NOT NULL COMMENT 'Número de lote.',
  `Fecha_Fabricacion` date NOT NULL COMMENT 'Fecha de fabricación.',
  `Fecha_Caducidad` date NOT NULL COMMENT 'Fecha de caducidad.',
  `Cantidad_Inicial` int unsigned NOT NULL COMMENT 'Cantidad inicial.',
  `Cantidad_Actual` int unsigned NOT NULL COMMENT 'Cantidad actual disponible.',
  `Estado_Lote` enum('Disponible','Vencido') DEFAULT 'Disponible' COMMENT 'Estado del lote.',
  `Observaciones` text COMMENT 'Observaciones del lote.',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de registro.',
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de actualización.',
  `Estatus` bit(1) DEFAULT b'1' COMMENT 'Estado del registro',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unique_lote` (`Medicamento_Id`,`Numero_Lote`),
  KEY `fk_lote_proveedor` (`Proveedor_Id`),
  CONSTRAINT `fk_lote_medicamento` FOREIGN KEY (`Medicamento_Id`) REFERENCES `tbc_ph_medicamentos` (`Id`),
  CONSTRAINT `fk_lote_proveedor` FOREIGN KEY (`Proveedor_Id`) REFERENCES `tbb_mr_proveedores` (`ID`),
  CONSTRAINT `chk_fechas_lote` CHECK ((`Fecha_Caducidad` > `Fecha_Fabricacion`))
) ENGINE=InnoDB AUTO_INCREMENT=4800 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Lotes de Medicamentos\\nJerarquía: Débil\\nPercepción: Transaccional\\nAprobado: Si';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbi_bitacora`
--

DROP TABLE IF EXISTS `tbi_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbi_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Tabla` varchar(80) NOT NULL,
  `Usuario` varchar(80) NOT NULL,
  `Operacion` enum('Insert','Update','Delete') NOT NULL,
  `Descripcion` text NOT NULL,
  `Fecha_Hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18136097 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbi_bitacora_ph`
--

DROP TABLE IF EXISTS `tbi_bitacora_ph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbi_bitacora_ph` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Tabla` varchar(80) NOT NULL,
  `Registro_ID` int unsigned NOT NULL,
  `Usuario` varchar(80) NOT NULL,
  `Operacion` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `Descripcion` text,
  `Fecha_Hora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_monitoreo_bd_ge`
--

DROP TABLE IF EXISTS `vw_monitoreo_bd_ge`;
/*!50001 DROP VIEW IF EXISTS `vw_monitoreo_bd_ge`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_monitoreo_bd_ge` AS SELECT 
 1 AS `entidad`,
 1 AS `tabla`,
 1 AS `tipo_jerarquia`,
 1 AS `percepcion`,
 1 AS `tipo_dependencia`,
 1 AS `tipo_nomenclatura`,
 1 AS `total_columnas`,
 1 AS `aprobado`,
 1 AS `dueño`,
 1 AS `editor`,
 1 AS `lector`,
 1 AS `sin_acceso`,
 1 AS `total_registros`,
 1 AS `tamanio_aproximado_MB`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_monitoreo_bd_mr`
--

DROP TABLE IF EXISTS `vw_monitoreo_bd_mr`;
/*!50001 DROP VIEW IF EXISTS `vw_monitoreo_bd_mr`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_monitoreo_bd_mr` AS SELECT 
 1 AS `entidad`,
 1 AS `tabla`,
 1 AS `tipo_jerarquia`,
 1 AS `tipo_percepcion`,
 1 AS `aprobada`,
 1 AS `tipo_dependencia`,
 1 AS `tipo_nomeclatura`,
 1 AS `duenio`,
 1 AS `editor`,
 1 AS `lector`,
 1 AS `sinacceso`,
 1 AS `Total_Registros`,
 1 AS `numero_columnas`,
 1 AS `tamano_mb`,
 1 AS `tamanio_aproximado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_monitoreo_bd_ms`
--

DROP TABLE IF EXISTS `vw_monitoreo_bd_ms`;
/*!50001 DROP VIEW IF EXISTS `vw_monitoreo_bd_ms`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_monitoreo_bd_ms` AS SELECT 
 1 AS `entidad`,
 1 AS `tipo_jerarquia`,
 1 AS `tipo_percepcion`,
 1 AS `aprobado`,
 1 AS `tabla`,
 1 AS `tipo_nomenclatura`,
 1 AS `tipo_dependencia`,
 1 AS `duenio`,
 1 AS `editor`,
 1 AS `lector`,
 1 AS `sinacceso`,
 1 AS `Total_Registros`,
 1 AS `numero_columnas`,
 1 AS `tamano_mb`,
 1 AS `tamanio_aproximado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_monitoreo_bd_ph`
--

DROP TABLE IF EXISTS `vw_monitoreo_bd_ph`;
/*!50001 DROP VIEW IF EXISTS `vw_monitoreo_bd_ph`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_monitoreo_bd_ph` AS SELECT 
 1 AS `entidad`,
 1 AS `tabla`,
 1 AS `tipo_jerarquia`,
 1 AS `tipo_concepcion`,
 1 AS `tipo_dependencia`,
 1 AS `tipo_nomenclatura`,
 1 AS `tabla_aprobada`,
 1 AS `dueno`,
 1 AS `editor`,
 1 AS `lector`,
 1 AS `sin_acceso`,
 1 AS `total_registros`,
 1 AS `numero_columnas`,
 1 AS `tamano_mb`,
 1 AS `tamano_aproximado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_monitorieo_bd_md`
--

DROP TABLE IF EXISTS `vw_monitorieo_bd_md`;
/*!50001 DROP VIEW IF EXISTS `vw_monitorieo_bd_md`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_monitorieo_bd_md` AS SELECT 
 1 AS `entidad`,
 1 AS `tabla`,
 1 AS `tipo_jerarquia`,
 1 AS `tipo_percepcion`,
 1 AS `tipo_dependencia`,
 1 AS `tipo_nomeclatura`,
 1 AS `aprobado`,
 1 AS `duenio`,
 1 AS `editor`,
 1 AS `lector`,
 1 AS `sinacceso`,
 1 AS `Total_Registros`,
 1 AS `numero_columnas`,
 1 AS `tamano_mb`,
 1 AS `tamanio_aproximado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_muestra_triggers`
--

DROP TABLE IF EXISTS `vw_muestra_triggers`;
/*!50001 DROP VIEW IF EXISTS `vw_muestra_triggers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_muestra_triggers` AS SELECT 
 1 AS `TRIGGER_NAME`,
 1 AS `EVENT_MANIPULATION`,
 1 AS `EVENT_OBJECT_TABLE`,
 1 AS `ACTION_TIMING`,
 1 AS `ACTION_STATEMENT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_reporte_privilegios`
--

DROP TABLE IF EXISTS `vw_reporte_privilegios`;
/*!50001 DROP VIEW IF EXISTS `vw_reporte_privilegios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_reporte_privilegios` AS SELECT 
 1 AS `mensaje`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_roles_usuarios`
--

DROP TABLE IF EXISTS `vw_roles_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_roles_usuarios` AS SELECT 
 1 AS `usuario`,
 1 AS `host`,
 1 AS `roles_asignados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_vista_tablas`
--

DROP TABLE IF EXISTS `vw_vista_tablas`;
/*!50001 DROP VIEW IF EXISTS `vw_vista_tablas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_vista_tablas` AS SELECT 
 1 AS `entidad`,
 1 AS `tabla`,
 1 AS `tipo_jerarquia`,
 1 AS `percepcion`,
 1 AS `tipo_dependencia`,
 1 AS `tipo_nomenclatura`,
 1 AS `total_columnas`,
 1 AS `aprobado`,
 1 AS `dueño`,
 1 AS `editor`,
 1 AS `lector`,
 1 AS `sin_acceso`,
 1 AS `total_registros`,
 1 AS `tamanio_aproximado_MB`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_monitoreo_bd_ge`
--

/*!50001 DROP VIEW IF EXISTS `vw_monitoreo_bd_ge`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monitoreo_bd_ge` AS select coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Entidad:',-(1)),'\n',1)),'') using utf8mb4),'N/A') AS `entidad`,`information_schema`.`t`.`TABLE_NAME` AS `tabla`,coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Jerarquía:',-(1)),'\n',1)),'') using utf8mb4),'N/A') AS `tipo_jerarquia`,coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Percepción:',-(1)),'\n',1)),'') using utf8mb4),'N/A') AS `percepcion`,(case when exists(select 1 from (`information_schema`.`KEY_COLUMN_USAGE` `k` join `information_schema`.`COLUMNS` `c` on(((`information_schema`.`c`.`TABLE_SCHEMA` = `information_schema`.`k`.`TABLE_SCHEMA`) and (`information_schema`.`c`.`TABLE_NAME` = `information_schema`.`k`.`TABLE_NAME`) and (`information_schema`.`c`.`COLUMN_NAME` = `information_schema`.`k`.`COLUMN_NAME`)))) where ((`information_schema`.`k`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`k`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`) and (`information_schema`.`c`.`COLUMN_KEY` = 'PRI') and (`information_schema`.`k`.`REFERENCED_TABLE_NAME` is not null))) then 'Debil' else 'Fuerte' end) AS `tipo_dependencia`,(case when (`information_schema`.`t`.`TABLE_NAME` like 'tbc_%') then 'Catalogo' when (`information_schema`.`t`.`TABLE_NAME` like 'tbd_%') then 'Derivada' when (`information_schema`.`t`.`TABLE_NAME` like 'tbb_%') then 'Base' when (`information_schema`.`t`.`TABLE_NAME` like 'tbi_%') then 'Isla' else 'Base' end) AS `tipo_nomenclatura`,(select count(0) from `information_schema`.`COLUMNS` `c` where ((`information_schema`.`c`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`c`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) AS `total_columnas`,coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Aprobado:',-(1)),'\n',1)),'') using utf8mb4),'N/A') AS `aprobado`,coalesce((select group_concat(distinct replace(substring_index(`p`.`GRANTEE`,'@',1),'\'','') separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where ((not((`p`.`GRANTEE` like '\'developer\'%'))) and (`p`.`PRIVILEGE_TYPE` in ('ALTER','DROP','DELETE')))),'N/A') AS `dueño`,coalesce((select group_concat(distinct replace(substring_index(`p`.`GRANTEE`,'@',1),'\'','') separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where ((not((`p`.`GRANTEE` like '\'developer\'%'))) and (`p`.`PRIVILEGE_TYPE` in ('INSERT','UPDATE')))),'N/A') AS `editor`,coalesce((select group_concat(distinct replace(substring_index(`p`.`GRANTEE`,'@',1),'\'','') separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where ((not((`p`.`GRANTEE` like '\'developer\'%'))) and (`p`.`PRIVILEGE_TYPE` = 'SELECT'))),'N/A') AS `lector`,coalesce((select group_concat(`r`.`role_name` separator ',') from (select '\'ge_user\'@\'%\'' AS `role_grantee`,'ge_user' AS `role_name` union select '\'hr_user\'@\'%\'' AS `'hr_user'@'%'`,'hr_user' AS `hr_user` union select '\'md_user\'@\'%\'' AS `'md_user'@'%'`,'md_user' AS `md_user` union select '\'mr_user\'@\'%\'' AS `'mr_user'@'%'`,'mr_user' AS `mr_user` union select '\'ms_user\'@\'%\'' AS `'ms_user'@'%'`,'ms_user' AS `ms_user` union select '\'ph_user\'@\'%\'' AS `'ph_user'@'%'`,'ph_user' AS `ph_user` union select '\'medic\'@\'%\'' AS `'medic'@'%'`,'medic' AS `medic` union select '\'nurse\'@\'%\'' AS `'nurse'@'%'`,'nurse' AS `nurse` union select '\'patient\'@\'%\'' AS `'patient'@'%'`,'patient' AS `patient`) `r` where exists(select 1 from (select `sp`.`GRANTEE` AS `GRANTEE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where (`p`.`GRANTEE` = `r`.`role_grantee`)) is false),'N/A') AS `sin_acceso`,`information_schema`.`t`.`TABLE_ROWS` AS `total_registros`,round((((`information_schema`.`t`.`DATA_LENGTH` + `information_schema`.`t`.`INDEX_LENGTH`) / 1024) / 1024),2) AS `tamanio_aproximado_MB` from `information_schema`.`TABLES` `t` where ((`information_schema`.`t`.`TABLE_SCHEMA` = 'hospital_matricula') and (`information_schema`.`t`.`TABLE_NAME` like 'tb%_%_%')) order by coalesce((select group_concat(distinct replace(substring_index(`p`.`GRANTEE`,'@',1),'\'','') separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where ((not((`p`.`GRANTEE` like '\'developer\'%'))) and (`p`.`PRIVILEGE_TYPE` in ('ALTER','DROP','DELETE')))),'N/A'),coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Entidad:',-(1)),'\n',1)),'') using utf8mb4),'N/A') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_monitoreo_bd_mr`
--

/*!50001 DROP VIEW IF EXISTS `vw_monitoreo_bd_mr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monitoreo_bd_mr` AS with `col_count` as (select `information_schema`.`columns`.`TABLE_NAME` AS `TABLE_NAME`,count(0) AS `num_cols` from `information_schema`.`COLUMNS` where (`information_schema`.`columns`.`TABLE_SCHEMA` = database()) group by `information_schema`.`columns`.`TABLE_NAME`), `fk_tables` as (select distinct `information_schema`.`key_column_usage`.`TABLE_NAME` AS `TABLE_NAME` from `information_schema`.`KEY_COLUMN_USAGE` where ((`information_schema`.`key_column_usage`.`TABLE_SCHEMA` = database()) and (`information_schema`.`key_column_usage`.`REFERENCED_TABLE_NAME` is not null))), `privs_summary` as (select `p`.`TABLE_NAME` AS `TABLE_NAME`,group_concat(distinct if((`p`.`PRIVILEGE_TYPE` in ('ALTER','DELETE','DROP')),`p`.`rol`,NULL) order by `p`.`rol` ASC separator ',') AS `duenio`,group_concat(distinct if((`p`.`PRIVILEGE_TYPE` in ('INSERT','UPDATE')),`p`.`rol`,NULL) order by `p`.`rol` ASC separator ',') AS `editor`,group_concat(distinct if((`p`.`PRIVILEGE_TYPE` = 'SELECT'),`p`.`rol`,NULL) order by `p`.`rol` ASC separator ',') AS `lector`,group_concat(distinct `p`.`rol` separator ',') AS `todos_con_acceso` from (select `information_schema`.`table_privileges`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`table_privileges`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE`,replace(substring_index(`information_schema`.`table_privileges`.`GRANTEE`,'@',1),'\'','') AS `rol` from `information_schema`.`TABLE_PRIVILEGES` where ((`information_schema`.`table_privileges`.`TABLE_SCHEMA` = database()) and (replace(substring_index(`information_schema`.`table_privileges`.`GRANTEE`,'@',1),'\'','') in ('ge_user','mr_user','hr_user','ms_user','md_user','ph_user')))) `p` group by `p`.`TABLE_NAME`), `cleaned_comments` as (select `information_schema`.`t`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`t`.`TABLE_ROWS` AS `TABLE_ROWS`,`information_schema`.`t`.`DATA_LENGTH` AS `DATA_LENGTH`,`information_schema`.`t`.`INDEX_LENGTH` AS `INDEX_LENGTH`,replace(replace(replace(`information_schema`.`t`.`TABLE_COMMENT`,'\n',' | '),'\r',''),'jerarquía:','jerarquia:') AS `raw_c` from `information_schema`.`TABLES` `t` where ((`information_schema`.`t`.`TABLE_SCHEMA` = database()) and (`information_schema`.`t`.`TABLE_TYPE` = 'BASE TABLE'))) select trim(substring_index(substring_index(`cc`.`raw_c`,'Entidad:',-(1)),'|',1)) AS `entidad`,`cc`.`TABLE_NAME` AS `tabla`,if((`cc`.`raw_c` like '%Jerarquia:%'),convert(trim(substring_index(substring_index(`cc`.`raw_c`,'Jerarquia:',-(1)),'|',1)) using utf8mb4),'Generica') AS `tipo_jerarquia`,if((`cc`.`raw_c` like '%Percepcion:%'),convert(trim(substring_index(substring_index(`cc`.`raw_c`,'Percepcion:',-(1)),'|',1)) using utf8mb4),'Conceptual') AS `tipo_percepcion`,if((`cc`.`raw_c` like '%Aprobada:%'),convert(trim(substring_index(substring_index(`cc`.`raw_c`,'Aprobado:',-(1)),'|',1)) using utf8mb4),'no') AS `aprobada`,if((`fkt`.`TABLE_NAME` is not null),'Debil','Fuerte') AS `tipo_dependencia`,(case when (`cc`.`TABLE_NAME` like 'tbc\\_%') then 'Catalogo' when (`cc`.`TABLE_NAME` like 'tbd\\_%') then 'Derivada' else 'Base' end) AS `tipo_nomeclatura`,coalesce(`ps`.`duenio`,'N/A') AS `duenio`,coalesce(`ps`.`editor`,'N/A') AS `editor`,coalesce(`ps`.`lector`,'N/A') AS `lector`,trim(both ',' from concat_ws(',',if((find_in_set('ge_user',coalesce(`ps`.`todos_con_acceso`,'')) = 0),'ge_user',NULL),if((find_in_set('mr_user',coalesce(`ps`.`todos_con_acceso`,'')) = 0),'mr_user',NULL),if((find_in_set('hr_user',coalesce(`ps`.`todos_con_acceso`,'')) = 0),'hr_user',NULL),if((find_in_set('ms_user',coalesce(`ps`.`todos_con_acceso`,'')) = 0),'ms_user',NULL),if((find_in_set('md_user',coalesce(`ps`.`todos_con_acceso`,'')) = 0),'md_user',NULL),if((find_in_set('ph_user',coalesce(`ps`.`todos_con_acceso`,'')) = 0),'ph_user',NULL))) AS `sinacceso`,coalesce(`cc`.`TABLE_ROWS`,0) AS `Total_Registros`,coalesce(`c`.`num_cols`,0) AS `numero_columnas`,round((((`cc`.`DATA_LENGTH` + `cc`.`INDEX_LENGTH`) / 1024) / 1024),2) AS `tamano_mb`,concat(round((((`cc`.`DATA_LENGTH` + `cc`.`INDEX_LENGTH`) / 1024) / 1024),2),' MB') AS `tamanio_aproximado` from (((`cleaned_comments` `cc` left join `col_count` `c` on((`cc`.`TABLE_NAME` = `c`.`TABLE_NAME`))) left join `fk_tables` `fkt` on((`cc`.`TABLE_NAME` = `fkt`.`TABLE_NAME`))) left join `privs_summary` `ps` on((`cc`.`TABLE_NAME` = `ps`.`TABLE_NAME`))) order by coalesce(`ps`.`duenio`,'N/A'),trim(substring_index(substring_index(`cc`.`raw_c`,'Entidad:',-(1)),'|',1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_monitoreo_bd_ms`
--

/*!50001 DROP VIEW IF EXISTS `vw_monitoreo_bd_ms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monitoreo_bd_ms` AS select max(trim(replace(replace(coalesce(regexp_replace(regexp_substr(`information_schema`.`t`.`TABLE_COMMENT`,'Entidad:[^;]*'),'Entidad:| Jerar.*| Percep.*| Aprobado.*|;',''),'Sin definir'),'\n                    ',' '),'\n',' '))) AS `entidad`,max(trim(replace(replace(coalesce(regexp_replace(regexp_substr(`information_schema`.`t`.`TABLE_COMMENT`,'Jerar[^;]*'),'Jerar[^:]*:| Percep.*| Aprobado.*|;',''),'Sin definir'),'\n                    ',' '),'\n',' '))) AS `tipo_jerarquia`,max(trim(replace(replace(coalesce(regexp_replace(regexp_substr(`information_schema`.`t`.`TABLE_COMMENT`,'Percep[^;]*'),'Percep[^:]*:| Aprobado.*|;',''),'Sin definir'),'\n                    ',' '),'\n',' '))) AS `tipo_percepcion`,max(trim(replace(replace(coalesce(regexp_replace(regexp_substr(`information_schema`.`t`.`TABLE_COMMENT`,'Aprobado:[^;]*'),'Aprobado:|;',''),'No'),'\n                    ',' '),'\n',' '))) AS `aprobado`,`information_schema`.`t`.`TABLE_NAME` AS `tabla`,max((case when (`information_schema`.`t`.`TABLE_NAME` like 'tbc_%') then 'Catalogo' when (`information_schema`.`t`.`TABLE_NAME` like 'tbd_%') then 'Derivada' else 'Base' end)) AS `tipo_nomenclatura`,max((case when (`fk`.`TABLE_NAME` is not null) then 'Debil' else 'Fuerte' end)) AS `tipo_dependencia`,max(coalesce(`privs`.`duenio`,'N/A')) AS `duenio`,max(coalesce(`privs`.`editor`,'N/A')) AS `editor`,max(coalesce(`privs`.`lector`,'Sin acceso')) AS `lector`,max(coalesce(`privs`.`sinacceso`,'Ninguno')) AS `sinacceso`,max(`information_schema`.`t`.`TABLE_ROWS`) AS `Total_Registros`,(select count(0) from `information_schema`.`COLUMNS` `c` where ((`information_schema`.`c`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`c`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) AS `numero_columnas`,max(round((((`information_schema`.`t`.`DATA_LENGTH` + `information_schema`.`t`.`INDEX_LENGTH`) / 1024) / 1024),2)) AS `tamano_mb`,concat(max(round((((`information_schema`.`t`.`DATA_LENGTH` + `information_schema`.`t`.`INDEX_LENGTH`) / 1024) / 1024),2)),' MB') AS `tamanio_aproximado` from ((`information_schema`.`TABLES` `t` left join (select distinct `information_schema`.`key_column_usage`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`key_column_usage`.`TABLE_NAME` AS `TABLE_NAME` from `information_schema`.`KEY_COLUMN_USAGE` where ((`information_schema`.`key_column_usage`.`TABLE_SCHEMA` = 'hospital_matricula') and (`information_schema`.`key_column_usage`.`REFERENCED_TABLE_NAME` is not null))) `fk` on(((`fk`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`fk`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join (select `base`.`TABLE_NAME` AS `TABLE_NAME`,group_concat((case when (`base`.`is_duenio` = 1) then `base`.`usuario` end) separator ',') AS `duenio`,group_concat((case when (`base`.`is_editor` = 1) then `base`.`usuario` end) separator ',') AS `editor`,group_concat((case when (`base`.`is_lector` = 1) then `base`.`usuario` end) separator ',') AS `lector`,group_concat((case when ((`base`.`is_duenio` is null) and (`base`.`is_editor` is null) and (`base`.`is_lector` is null)) then `base`.`usuario` end) separator ',') AS `sinacceso` from (select `information_schema`.`t_inner`.`TABLE_NAME` AS `TABLE_NAME`,`usr`.`usuario` AS `usuario`,max((case when (`privs`.`PRIVILEGE_TYPE` in ('ALTER','DELETE','DROP')) then 1 else NULL end)) AS `is_duenio`,max((case when (`privs`.`PRIVILEGE_TYPE` in ('INSERT','UPDATE')) then 1 else NULL end)) AS `is_editor`,max((case when (`privs`.`PRIVILEGE_TYPE` = 'SELECT') then 1 else NULL end)) AS `is_lector` from ((`information_schema`.`TABLES` `t_inner` join (select distinct replace(substring_index(`information_schema`.`schema_privileges`.`GRANTEE`,'@',1),'\'','') AS `usuario` from `information_schema`.`SCHEMA_PRIVILEGES` where (`information_schema`.`schema_privileges`.`TABLE_SCHEMA` = 'hospital_matricula') union select distinct replace(substring_index(`information_schema`.`table_privileges`.`GRANTEE`,'@',1),'\'','') AS `usuario` from `information_schema`.`TABLE_PRIVILEGES` where (`information_schema`.`table_privileges`.`TABLE_SCHEMA` = 'hospital_matricula')) `usr`) left join (select `information_schema`.`table_privileges`.`TABLE_NAME` AS `TABLE_NAME`,replace(substring_index(`information_schema`.`table_privileges`.`GRANTEE`,'@',1),'\'','') AS `usuario`,`information_schema`.`table_privileges`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` where (`information_schema`.`table_privileges`.`TABLE_SCHEMA` = 'hospital_matricula') union all select NULL AS `TABLE_NAME`,replace(substring_index(`information_schema`.`schema_privileges`.`GRANTEE`,'@',1),'\'','') AS `usuario`,`information_schema`.`schema_privileges`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` where (`information_schema`.`schema_privileges`.`TABLE_SCHEMA` = 'hospital_matricula')) `privs` on(((`privs`.`usuario` = `usr`.`usuario`) and ((`privs`.`TABLE_NAME` = `information_schema`.`t_inner`.`TABLE_NAME`) or (`privs`.`TABLE_NAME` is null))))) where ((`information_schema`.`t_inner`.`TABLE_SCHEMA` = 'hospital_matricula') and (`information_schema`.`t_inner`.`TABLE_TYPE` = 'BASE TABLE')) group by `information_schema`.`t_inner`.`TABLE_NAME`,`usr`.`usuario`) `base` group by `base`.`TABLE_NAME`) `privs` on((`privs`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) where ((`information_schema`.`t`.`TABLE_SCHEMA` = 'hospital_matricula') and (`information_schema`.`t`.`TABLE_TYPE` = 'BASE TABLE')) group by `information_schema`.`t`.`TABLE_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_monitoreo_bd_ph`
--

/*!50001 DROP VIEW IF EXISTS `vw_monitoreo_bd_ph`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monitoreo_bd_ph` AS with `tablas` as (select `information_schema`.`tables`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`tables`.`TABLE_ROWS` AS `TABLE_ROWS`,`information_schema`.`tables`.`DATA_LENGTH` AS `DATA_LENGTH`,`information_schema`.`tables`.`INDEX_LENGTH` AS `INDEX_LENGTH`,cast(`information_schema`.`tables`.`TABLE_COMMENT` as char charset utf8mb4) AS `comentario` from `information_schema`.`TABLES` where ((`information_schema`.`tables`.`TABLE_SCHEMA` = database()) and (`information_schema`.`tables`.`TABLE_TYPE` = 'BASE TABLE'))), `comentarios` as (select `tablas`.`TABLE_NAME` AS `TABLE_NAME`,(case when ((`tablas`.`comentario` is null) or (`tablas`.`comentario` = '')) then 'N/A' when regexp_like(`tablas`.`comentario`,'Entidad:') then trim(replace(regexp_substr(`tablas`.`comentario`,'Entidad:[^\n]*'),'Entidad:','')) else 'INVALIDO' end) AS `entidad`,(case when ((`tablas`.`comentario` is null) or (`tablas`.`comentario` = '')) then 'N/A' when regexp_like(`tablas`.`comentario`,'Jerarquía:') then trim(replace(regexp_substr(`tablas`.`comentario`,'Jerarquía:[^\n]*'),'Jerarquía:','')) else 'INVALIDO' end) AS `jerarquia`,(case when ((`tablas`.`comentario` is null) or (`tablas`.`comentario` = '')) then 'N/A' when regexp_like(`tablas`.`comentario`,'Percepción:') then trim(replace(regexp_substr(`tablas`.`comentario`,'Percepción:[^\n]*'),'Percepción:','')) else 'INVALIDO' end) AS `percepcion`,(case when ((`tablas`.`comentario` is null) or (`tablas`.`comentario` = '')) then 'Por definir' when regexp_like(`tablas`.`comentario`,'Aprobado:') then trim(replace(regexp_substr(`tablas`.`comentario`,'Aprobado:[^\n]*'),'Aprobado:','')) else 'Por definir' end) AS `aprobado` from `tablas`), `roles_sistema` as (select 'ge_user' AS `usuario` union select 'hr_user' AS `hr_user` union select 'mr_user' AS `mr_user` union select 'md_user' AS `md_user` union select 'ms_user' AS `ms_user` union select 'ph_user' AS `ph_user` union select 'developer' AS `developer`), `privilegios` as (select `p`.`TABLE_NAME` AS `TABLE_NAME`,`p`.`usuario` AS `usuario`,`p`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from ((select `information_schema`.`table_privileges`.`TABLE_NAME` AS `TABLE_NAME`,replace(substring_index(`information_schema`.`table_privileges`.`GRANTEE`,'@',1),'\'','') AS `usuario`,`information_schema`.`table_privileges`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` where (`information_schema`.`table_privileges`.`TABLE_SCHEMA` = database()) union select `t`.`TABLE_NAME` AS `TABLE_NAME`,replace(substring_index(`s`.`GRANTEE`,'@',1),'\'','') AS `usuario`,`s`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from (`information_schema`.`SCHEMA_PRIVILEGES` `s` join `tablas` `t` on((`s`.`TABLE_SCHEMA` = `t`.`TABLE_SCHEMA`))) where (`s`.`TABLE_SCHEMA` = database())) `p` join `roles_sistema` `r` on((`p`.`usuario` = `r`.`usuario`)))), `fk_tablas` as (select distinct `information_schema`.`key_column_usage`.`TABLE_NAME` AS `TABLE_NAME` from `information_schema`.`KEY_COLUMN_USAGE` where ((`information_schema`.`key_column_usage`.`TABLE_SCHEMA` = database()) and (`information_schema`.`key_column_usage`.`REFERENCED_TABLE_NAME` is not null))) select `c`.`entidad` AS `entidad`,`t`.`TABLE_NAME` AS `tabla`,`c`.`jerarquia` AS `tipo_jerarquia`,`c`.`percepcion` AS `tipo_concepcion`,(case when (`fk`.`TABLE_NAME` is not null) then 'Debil' else 'Fuerte' end) AS `tipo_dependencia`,(case when (`t`.`TABLE_NAME` like 'tbb\\_%') then 'Base' when (`t`.`TABLE_NAME` like 'tbc\\_%') then 'Catalogo' when (`t`.`TABLE_NAME` like 'tbd\\_%') then 'Derivada' when (`t`.`TABLE_NAME` like 'tbi\\_%') then 'Isla' else 'Base' end) AS `tipo_nomenclatura`,`c`.`aprobado` AS `tabla_aprobada`,(select group_concat(`u`.`usuario` separator ',') from `roles_sistema` `u` where exists(select `req`.`priv` from (select 'ALTER' AS `priv` union select 'DELETE' AS `DELETE`) `req` where `req`.`priv` in (select `p2`.`PRIVILEGE_TYPE` from `privilegios` `p2` where ((`p2`.`TABLE_NAME` = `t`.`TABLE_NAME`) and (`p2`.`usuario` = `u`.`usuario`))) is false) is false) AS `dueno`,(select group_concat(`u`.`usuario` separator ',') from `roles_sistema` `u` where (exists(select 1 from `privilegios` `p2` where ((`p2`.`TABLE_NAME` = `t`.`TABLE_NAME`) and (`p2`.`usuario` = `u`.`usuario`) and (`p2`.`PRIVILEGE_TYPE` = 'INSERT'))) and exists(select 1 from `privilegios` `p2` where ((`p2`.`TABLE_NAME` = `t`.`TABLE_NAME`) and (`p2`.`usuario` = `u`.`usuario`) and (`p2`.`PRIVILEGE_TYPE` = 'UPDATE'))))) AS `editor`,(select group_concat(`u`.`usuario` separator ',') from `roles_sistema` `u` where exists(select 1 from `privilegios` `p2` where ((`p2`.`TABLE_NAME` = `t`.`TABLE_NAME`) and (`p2`.`usuario` = `u`.`usuario`) and (`p2`.`PRIVILEGE_TYPE` = 'SELECT')))) AS `lector`,(select group_concat(`r`.`usuario` separator ',') from `roles_sistema` `r` where `r`.`usuario` in (select distinct `px`.`usuario` from `privilegios` `px` where (`px`.`TABLE_NAME` = `t`.`TABLE_NAME`)) is false) AS `sin_acceso`,`t`.`TABLE_ROWS` AS `total_registros`,(select count(0) from `information_schema`.`COLUMNS` `col` where ((`information_schema`.`col`.`TABLE_SCHEMA` = database()) and (`information_schema`.`col`.`TABLE_NAME` = `t`.`TABLE_NAME`))) AS `numero_columnas`,round((((`t`.`DATA_LENGTH` + `t`.`INDEX_LENGTH`) / 1024) / 1024),2) AS `tamano_mb`,concat(round((((`t`.`DATA_LENGTH` + `t`.`INDEX_LENGTH`) / 1024) / 1024),2),' MB') AS `tamano_aproximado` from ((`tablas` `t` left join `comentarios` `c` on((`t`.`TABLE_NAME` = `c`.`TABLE_NAME`))) left join `fk_tablas` `fk` on((`t`.`TABLE_NAME` = `fk`.`TABLE_NAME`))) order by (select group_concat(`u`.`usuario` separator ',') from `roles_sistema` `u` where exists(select `req`.`priv` from (select 'ALTER' AS `priv` union select 'DELETE' AS `DELETE`) `req` where `req`.`priv` in (select `p2`.`PRIVILEGE_TYPE` from `privilegios` `p2` where ((`p2`.`TABLE_NAME` = `t`.`TABLE_NAME`) and (`p2`.`usuario` = `u`.`usuario`))) is false) is false),`c`.`entidad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_monitorieo_bd_md`
--

/*!50001 DROP VIEW IF EXISTS `vw_monitorieo_bd_md`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monitorieo_bd_md` AS with `col_count` as (select `information_schema`.`columns`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`columns`.`TABLE_NAME` AS `TABLE_NAME`,count(0) AS `numero_columnas` from `information_schema`.`COLUMNS` where (`information_schema`.`columns`.`TABLE_SCHEMA` = database()) group by `information_schema`.`columns`.`TABLE_SCHEMA`,`information_schema`.`columns`.`TABLE_NAME`), `comentarios` as (select `information_schema`.`tables`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_NAME` AS `TABLE_NAME`,replace(replace(replace(`information_schema`.`tables`.`TABLE_COMMENT`,'\\r\\n','\n'),'\\n','\n'),'\\r','\n') AS `comentario_limpio` from `information_schema`.`TABLES` where (`information_schema`.`tables`.`TABLE_SCHEMA` = database())), `comentarios_parseados` as (select `comentarios`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`comentarios`.`TABLE_NAME` AS `TABLE_NAME`,trim(substring_index(substring_index(`comentarios`.`comentario_limpio`,'Entidad:',-(1)),'\n',1)) AS `entidad_comment`,trim(substring_index(substring_index(`comentarios`.`comentario_limpio`,'Jerarqu',-(1)),'\n',1)) AS `jerarquia_comment`,trim(substring_index(substring_index(`comentarios`.`comentario_limpio`,'Percep',-(1)),'\n',1)) AS `percepcion_comment`,(case when (locate('Aprobado:',`comentarios`.`comentario_limpio`) > 0) then trim(substring_index(substring_index(`comentarios`.`comentario_limpio`,'Aprobado:',-(1)),'\n',1)) else NULL end) AS `aprobado_comment` from `comentarios`), `fk_tables` as (select distinct `information_schema`.`key_column_usage`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`key_column_usage`.`TABLE_NAME` AS `TABLE_NAME` from `information_schema`.`KEY_COLUMN_USAGE` where ((`information_schema`.`key_column_usage`.`TABLE_SCHEMA` = database()) and (`information_schema`.`key_column_usage`.`REFERENCED_TABLE_NAME` is not null))), `privs` as (select `information_schema`.`table_privileges`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`table_privileges`.`TABLE_NAME` AS `TABLE_NAME`,replace(substring_index(`information_schema`.`table_privileges`.`GRANTEE`,'@',1),'\'','') AS `rol`,`information_schema`.`table_privileges`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` where ((`information_schema`.`table_privileges`.`TABLE_SCHEMA` = database()) and (replace(substring_index(`information_schema`.`table_privileges`.`GRANTEE`,'@',1),'\'','') in ('ge_user','mr_user','hr_user','ms_user','md_user','ph_user')))), `owners` as (select `privs`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`privs`.`TABLE_NAME` AS `TABLE_NAME`,group_concat(distinct `privs`.`rol` order by `privs`.`rol` ASC separator ',') AS `duenio` from `privs` where (`privs`.`PRIVILEGE_TYPE` in ('ALTER','DELETE','DROP')) group by `privs`.`TABLE_SCHEMA`,`privs`.`TABLE_NAME`), `editors` as (select `privs`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`privs`.`TABLE_NAME` AS `TABLE_NAME`,group_concat(distinct `privs`.`rol` order by `privs`.`rol` ASC separator ',') AS `editor` from `privs` where (`privs`.`PRIVILEGE_TYPE` in ('INSERT','UPDATE')) group by `privs`.`TABLE_SCHEMA`,`privs`.`TABLE_NAME`), `readers` as (select `privs`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`privs`.`TABLE_NAME` AS `TABLE_NAME`,group_concat(distinct `privs`.`rol` order by `privs`.`rol` ASC separator ',') AS `lector` from `privs` where (`privs`.`PRIVILEGE_TYPE` in ('SELECT','REFERENCES')) group by `privs`.`TABLE_SCHEMA`,`privs`.`TABLE_NAME`), `base_rows` as (select coalesce(convert(nullif(trim(`cp`.`entidad_comment`),'') using utf8mb4),'Sin definir') AS `entidad`,`information_schema`.`t`.`TABLE_NAME` AS `tabla`,(case when ((trim(`cp`.`jerarquia_comment`) = '') or (`cp`.`jerarquia_comment` is null)) then 'Sin definir' when (lower(`cp`.`jerarquia_comment`) like '%super%') then 'Super Entidad' when (lower(`cp`.`jerarquia_comment`) like '%sub%') then 'Sub Entidad' when (lower(`cp`.`jerarquia_comment`) like '%gener%') then 'Genérica' else 'Sin definir' end) AS `tipo_jerarquia`,(case when ((trim(`cp`.`percepcion_comment`) = '') or (`cp`.`percepcion_comment` is null)) then 'Sin definir' when (lower(`cp`.`percepcion_comment`) like '%fisic%') then 'Física' when (lower(`cp`.`percepcion_comment`) like '%concept%') then 'Conceptual' when (lower(`cp`.`percepcion_comment`) like '%mixt%') then 'Mixta' else 'Sin definir' end) AS `tipo_percepcion`,(case when (`fkt`.`TABLE_NAME` is not null) then 'Débil' else 'Fuerte' end) AS `tipo_dependencia`,(case when (`information_schema`.`t`.`TABLE_NAME` like 'tbc\\_%') then 'Catálogo' when (`information_schema`.`t`.`TABLE_NAME` like 'tbd\\_%') then 'Derivada' else 'Base' end) AS `tipo_nomeclatura`,(case when (`cp`.`aprobado_comment` is null) then 'Sin definir' when (lower(`cp`.`aprobado_comment`) like '%si%') then 'Si' when (lower(`cp`.`aprobado_comment`) like '%no%') then 'No' else 'Sin definir' end) AS `aprobado`,coalesce(`o`.`duenio`,'Sin definir') AS `duenio`,coalesce(`e`.`editor`,'Sin definir') AS `editor`,coalesce(`r`.`lector`,'Sin definir') AS `lector`,concat_ws(',',if((locate('ge_user',concat(',',coalesce(`o`.`duenio`,''),',',coalesce(`e`.`editor`,''),',',coalesce(`r`.`lector`,''),',')) = 0),'ge_user',NULL),if((locate('mr_user',concat(',',coalesce(`o`.`duenio`,''),',',coalesce(`e`.`editor`,''),',',coalesce(`r`.`lector`,''),',')) = 0),'mr_user',NULL),if((locate('hr_user',concat(',',coalesce(`o`.`duenio`,''),',',coalesce(`e`.`editor`,''),',',coalesce(`r`.`lector`,''),',')) = 0),'hr_user',NULL),if((locate('ms_user',concat(',',coalesce(`o`.`duenio`,''),',',coalesce(`e`.`editor`,''),',',coalesce(`r`.`lector`,''),',')) = 0),'ms_user',NULL),if((locate('md_user',concat(',',coalesce(`o`.`duenio`,''),',',coalesce(`e`.`editor`,''),',',coalesce(`r`.`lector`,''),',')) = 0),'md_user',NULL),if((locate('ph_user',concat(',',coalesce(`o`.`duenio`,''),',',coalesce(`e`.`editor`,''),',',coalesce(`r`.`lector`,''),',')) = 0),'ph_user',NULL)) AS `sinacceso`,coalesce(`information_schema`.`t`.`TABLE_ROWS`,0) AS `Total_Registros`,coalesce(`c`.`numero_columnas`,0) AS `numero_columnas`,round((((coalesce(`information_schema`.`t`.`DATA_LENGTH`,0) + coalesce(`information_schema`.`t`.`INDEX_LENGTH`,0)) / 1024) / 1024),2) AS `tamano_mb`,concat(round((((coalesce(`information_schema`.`t`.`DATA_LENGTH`,0) + coalesce(`information_schema`.`t`.`INDEX_LENGTH`,0)) / 1024) / 1024),2),' MB') AS `tamanio_aproximado` from ((((((`information_schema`.`TABLES` `t` left join `col_count` `c` on(((`c`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`c`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `comentarios_parseados` `cp` on(((`cp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`cp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `fk_tables` `fkt` on(((`fkt`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`fkt`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `owners` `o` on(((`o`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`o`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `editors` `e` on(((`e`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`e`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `readers` `r` on(((`r`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`r`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) where ((`information_schema`.`t`.`TABLE_SCHEMA` = database()) and (`information_schema`.`t`.`TABLE_TYPE` = 'BASE TABLE'))) select `base_rows`.`entidad` AS `entidad`,`base_rows`.`tabla` AS `tabla`,`base_rows`.`tipo_jerarquia` AS `tipo_jerarquia`,`base_rows`.`tipo_percepcion` AS `tipo_percepcion`,`base_rows`.`tipo_dependencia` AS `tipo_dependencia`,`base_rows`.`tipo_nomeclatura` AS `tipo_nomeclatura`,`base_rows`.`aprobado` AS `aprobado`,`base_rows`.`duenio` AS `duenio`,`base_rows`.`editor` AS `editor`,`base_rows`.`lector` AS `lector`,`base_rows`.`sinacceso` AS `sinacceso`,`base_rows`.`Total_Registros` AS `Total_Registros`,`base_rows`.`numero_columnas` AS `numero_columnas`,`base_rows`.`tamano_mb` AS `tamano_mb`,`base_rows`.`tamanio_aproximado` AS `tamanio_aproximado` from `base_rows` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_muestra_triggers`
--

/*!50001 DROP VIEW IF EXISTS `vw_muestra_triggers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_muestra_triggers` AS select `information_schema`.`triggers`.`TRIGGER_NAME` AS `TRIGGER_NAME`,`information_schema`.`triggers`.`EVENT_MANIPULATION` AS `EVENT_MANIPULATION`,`information_schema`.`triggers`.`EVENT_OBJECT_TABLE` AS `EVENT_OBJECT_TABLE`,`information_schema`.`triggers`.`ACTION_TIMING` AS `ACTION_TIMING`,`information_schema`.`triggers`.`ACTION_STATEMENT` AS `ACTION_STATEMENT` from `information_schema`.`TRIGGERS` where (`information_schema`.`triggers`.`TRIGGER_SCHEMA` = 'hospital_matricula') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_reporte_privilegios`
--

/*!50001 DROP VIEW IF EXISTS `vw_reporte_privilegios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_reporte_privilegios` AS select `reporte`.`mensaje` AS `mensaje` from (select '-- GERENCIA --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`tp`.`GRANTEE` like '\'ge_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- RECURSOS HUMANOS --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`tp`.`GRANTEE` like '\'hr_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- RECURSOS MATERIALES --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`tp`.`GRANTEE` like '\'mr_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- REGISTROS MEDICOS --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`tp`.`GRANTEE` like '\'md_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- SERVICIOS MEDICOS --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`tp`.`GRANTEE` like '\'ms_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- FARMACIA --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`tp`.`GRANTEE` like '\'ph_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- DEVELOPER --' AS `mensaje` union all select concat('GRANT ',group_concat(`sp`.`PRIVILEGE_TYPE` order by `sp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`sp`.`TABLE_SCHEMA`,'.* TO ',`sp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where ((`sp`.`TABLE_SCHEMA` = 'hospital_matricula') and (`sp`.`GRANTEE` like '\'developer\'@%')) group by `sp`.`GRANTEE`,`sp`.`TABLE_SCHEMA`) `reporte` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_roles_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_roles_usuarios` AS select `u`.`User` AS `usuario`,`u`.`Host` AS `host`,ifnull(group_concat(concat(`r`.`TO_USER`,'@',convert(`r`.`TO_HOST` using utf8mb3)) order by `r`.`TO_USER` ASC separator ', '),'SIN ROLES') AS `roles_asignados` from (`mysql`.`user` `u` left join `mysql`.`role_edges` `r` on(((`u`.`User` = `r`.`FROM_USER`) and (`u`.`Host` = `r`.`FROM_HOST`)))) where ((`u`.`User` like '%user%') or (`u`.`User` = 'developer')) group by `u`.`User`,`u`.`Host` order by `u`.`User`,`u`.`Host` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vista_tablas`
--

/*!50001 DROP VIEW IF EXISTS `vw_vista_tablas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vista_tablas` AS select coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Entidad:',-(1)),'\n',1)),'') using utf8mb4),'N/A') AS `entidad`,`information_schema`.`t`.`TABLE_NAME` AS `tabla`,coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Jerarquía:',-(1)),'\n',1)),'') using utf8mb4),'N/A') AS `tipo_jerarquia`,coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Percepción:',-(1)),'\n',1)),'') using utf8mb4),'N/A') AS `percepcion`,(case when exists(select 1 from (`information_schema`.`KEY_COLUMN_USAGE` `k` join `information_schema`.`COLUMNS` `c` on(((`information_schema`.`c`.`TABLE_SCHEMA` = `information_schema`.`k`.`TABLE_SCHEMA`) and (`information_schema`.`c`.`TABLE_NAME` = `information_schema`.`k`.`TABLE_NAME`) and (`information_schema`.`c`.`COLUMN_NAME` = `information_schema`.`k`.`COLUMN_NAME`)))) where ((`information_schema`.`k`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`k`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`) and (`information_schema`.`c`.`COLUMN_KEY` = 'PRI') and (`information_schema`.`k`.`REFERENCED_TABLE_NAME` is not null))) then 'Debil' else 'Fuerte' end) AS `tipo_dependencia`,(case when (`information_schema`.`t`.`TABLE_NAME` like 'tbc_%') then 'Catalogo' when (`information_schema`.`t`.`TABLE_NAME` like 'tbd_%') then 'Derivada' when (`information_schema`.`t`.`TABLE_NAME` like 'tbb_%') then 'Base' when (`information_schema`.`t`.`TABLE_NAME` like 'tbi_%') then 'Isla' else 'Base' end) AS `tipo_nomenclatura`,(select count(0) from `information_schema`.`COLUMNS` `c` where ((`information_schema`.`c`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`c`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) AS `total_columnas`,coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Aprobado:',-(1)),'\n',1)),'') using utf8mb4),'N/A') AS `aprobado`,coalesce((select group_concat(distinct replace(substring_index(`p`.`GRANTEE`,'@',1),'\'','') separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where ((not((`p`.`GRANTEE` like '\'developer\'%'))) and (`p`.`PRIVILEGE_TYPE` in ('ALTER','DROP','DELETE')))),'N/A') AS `dueño`,coalesce((select group_concat(distinct replace(substring_index(`p`.`GRANTEE`,'@',1),'\'','') separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where ((not((`p`.`GRANTEE` like '\'developer\'%'))) and (`p`.`PRIVILEGE_TYPE` in ('INSERT','UPDATE')))),'N/A') AS `editor`,coalesce((select group_concat(distinct replace(substring_index(`p`.`GRANTEE`,'@',1),'\'','') separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where ((not((`p`.`GRANTEE` like '\'developer\'%'))) and (`p`.`PRIVILEGE_TYPE` = 'SELECT'))),'N/A') AS `lector`,coalesce((select group_concat(`r`.`role_name` separator ',') from (select '\'ge_user\'@\'%\'' AS `role_grantee`,'ge_user' AS `role_name` union select '\'hr_user\'@\'%\'' AS `'hr_user'@'%'`,'hr_user' AS `hr_user` union select '\'md_user\'@\'%\'' AS `'md_user'@'%'`,'md_user' AS `md_user` union select '\'mr_user\'@\'%\'' AS `'mr_user'@'%'`,'mr_user' AS `mr_user` union select '\'ms_user\'@\'%\'' AS `'ms_user'@'%'`,'ms_user' AS `ms_user` union select '\'ph_user\'@\'%\'' AS `'ph_user'@'%'`,'ph_user' AS `ph_user` union select '\'medic\'@\'%\'' AS `'medic'@'%'`,'medic' AS `medic` union select '\'nurse\'@\'%\'' AS `'nurse'@'%'`,'nurse' AS `nurse` union select '\'patient\'@\'%\'' AS `'patient'@'%'`,'patient' AS `patient`) `r` where exists(select 1 from (select `sp`.`GRANTEE` AS `GRANTEE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where (`p`.`GRANTEE` = `r`.`role_grantee`)) is false),'N/A') AS `sin_acceso`,`information_schema`.`t`.`TABLE_ROWS` AS `total_registros`,round((((`information_schema`.`t`.`DATA_LENGTH` + `information_schema`.`t`.`INDEX_LENGTH`) / 1024) / 1024),2) AS `tamanio_aproximado_MB` from `information_schema`.`TABLES` `t` where ((`information_schema`.`t`.`TABLE_SCHEMA` = 'hospital_matricula') and (`information_schema`.`t`.`TABLE_NAME` like 'tb%_%_%')) order by coalesce((select group_concat(distinct replace(substring_index(`p`.`GRANTEE`,'@',1),'\'','') separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where ((not((`p`.`GRANTEE` like '\'developer\'%'))) and (`p`.`PRIVILEGE_TYPE` in ('ALTER','DROP','DELETE')))),'N/A'),coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Entidad:',-(1)),'\n',1)),'') using utf8mb4),'N/A') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-24 22:52:02
