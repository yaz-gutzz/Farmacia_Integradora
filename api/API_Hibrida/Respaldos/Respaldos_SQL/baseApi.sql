CREATE DATABASE  IF NOT EXISTS `hospital_matricula` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital_matricula`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_matricula
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `tb_bitacora_inserts`
--

DROP TABLE IF EXISTS `tb_bitacora_inserts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_bitacora_inserts` (
  `id_bitacora` int NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(100) NOT NULL,
  `ip_cliente` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id_bitacora`),
  KEY `ix_tb_bitacora_inserts_id_bitacora` (`id_bitacora`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bitacora_inserts`
--

LOCK TABLES `tb_bitacora_inserts` WRITE;
/*!40000 ALTER TABLE `tb_bitacora_inserts` DISABLE KEYS */;
INSERT INTO `tb_bitacora_inserts` VALUES (1,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-27','12:58:54'),(2,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','13:00:06'),(3,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','13:00:38'),(4,'tbd_ph_lotes_medicamentos','172.16.1.34','2026-03-27','13:02:18'),(5,'tbd_ph_lotes_medicamentos','172.16.1.34','2026-03-27','13:02:24'),(6,'tbd_ph_lotes_medicamentos','192.168.137.50','2026-03-27','13:03:54'),(7,'tbd_ph_lotes_medicamentos','192.168.137.50','2026-03-27','13:03:59'),(8,'General / Consulta','127.0.0.1','2026-03-27','13:09:29'),(9,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:09:36'),(10,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:09:57'),(11,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:09:57'),(12,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:15:03'),(13,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:15:08'),(14,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:15:10'),(15,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:15:13'),(16,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:15:15'),(17,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:16:21'),(18,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:16:25'),(19,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:16:27'),(20,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:16:29'),(21,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:16:31'),(22,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:17:55'),(23,'tbc_ph_medicamentos','127.0.0.1','2026-03-27','13:17:55'),(24,'inventario_medicamento','127.0.0.1','2026-03-27','13:20:55'),(25,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','13:20:59'),(26,'inventario_medicamento','127.0.0.1','2026-03-27','13:21:57'),(27,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','13:32:18'),(28,'inventario_medicamento','127.0.0.1','2026-03-27','13:32:39'),(29,'inventario_medicamento','127.0.0.1','2026-03-27','13:32:39'),(30,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','13:37:49'),(31,'tbd_ph_lotes_medicamentos','192.168.137.50','2026-03-27','13:38:46'),(32,'inventario_medicamento','192.168.137.50','2026-03-27','13:39:51'),(33,'inventario_medicamento','192.168.137.50','2026-03-27','13:39:51'),(34,'tbd_ph_recetas_medicas','192.168.137.50','2026-03-27','13:40:40'),(35,'tbd_ph_recetas_medicas','192.168.137.50','2026-03-27','13:40:40'),(36,'tbd_ph_dispensacion','192.168.137.50','2026-03-27','13:41:24'),(37,'tbd_ph_dispensacion','192.168.137.50','2026-03-27','13:41:25'),(38,'tbd_ph_recetas_medicas','192.168.137.50','2026-03-27','13:42:19'),(39,'tbd_ph_dispensacion','192.168.137.50','2026-03-27','13:42:40'),(40,'subrogacion_medicamentos','192.168.137.50','2026-03-27','13:44:05'),(41,'subrogacion_medicamentos','192.168.137.50','2026-03-27','13:44:06'),(42,'subrogacion_medicamentos','192.168.137.50','2026-03-27','13:46:45'),(43,'subrogacion_medicamentos','192.168.137.50','2026-03-27','13:46:59'),(44,'tbd_ph_recetas_medicas','192.168.137.50','2026-03-27','13:51:56'),(45,'tbd_ph_dispensacion','192.168.137.50','2026-03-27','13:52:23'),(46,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','13:52:52'),(47,'tbd_ph_dispensacion','192.168.137.50','2026-03-27','13:53:25'),(48,'subrogacion_medicamentos','192.168.137.50','2026-03-27','13:53:56'),(49,'subrogacion_medicamentos','192.168.137.50','2026-03-27','13:55:37'),(50,'subrogacion_medicamentos','192.168.137.50','2026-03-27','13:55:45'),(51,'subrogacion_medicamentos','192.168.137.50','2026-03-27','14:01:07'),(52,'tbd_ph_recetas_medicas','192.168.137.232','2026-03-27','14:03:23'),(53,'tbd_ph_recetas_medicas','192.168.137.116','2026-03-27','14:03:48'),(54,'tbd_ph_dispensacion','192.168.137.232','2026-03-27','14:03:51'),(55,'subrogacion_medicamentos','192.168.137.232','2026-03-27','14:04:10'),(56,'inventario_medicamento','192.168.137.116','2026-03-27','14:04:43'),(57,'tbd_ph_dispensacion','192.168.137.116','2026-03-27','14:05:08'),(58,'tbd_ph_recetas_medicas','192.168.137.116','2026-03-27','14:05:33'),(59,'tbd_ph_dispensacion','192.168.137.116','2026-03-27','14:05:44'),(60,'subrogacion_medicamentos','192.168.137.232','2026-03-27','14:06:34'),(61,'tbd_ph_dispensacion','192.168.137.116','2026-03-27','14:06:50'),(62,'tbd_ph_recetas_medicas','192.168.137.116','2026-03-27','14:07:59'),(63,'tbd_ph_dispensacion','192.168.137.116','2026-03-27','14:08:19'),(64,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-27','14:18:53'),(65,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-27','14:18:54'),(66,'tbd_ph_dispensacion','127.0.0.1','2026-03-27','14:19:03'),(67,'tbd_ph_dispensacion','127.0.0.1','2026-03-27','14:19:03'),(68,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-27','14:19:20'),(69,'tbd_ph_dispensacion','127.0.0.1','2026-03-27','14:19:26'),(70,'subrogacion_medicamentos','127.0.0.1','2026-03-27','14:20:07'),(71,'subrogacion_medicamentos','127.0.0.1','2026-03-27','14:20:07'),(72,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','14:27:03'),(73,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','14:28:53'),(74,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-27','14:29:31'),(75,'tbd_ph_dispensacion','127.0.0.1','2026-03-27','14:29:45'),(76,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-27','14:30:02'),(77,'tbd_ph_dispensacion','127.0.0.1','2026-03-27','14:30:11'),(78,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-27','14:30:21'),(79,'tbd_ph_dispensacion','127.0.0.1','2026-03-27','14:30:28'),(80,'subrogacion_medicamentos','127.0.0.1','2026-03-27','14:30:55'),(81,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','22:26:07'),(82,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','22:26:10'),(83,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','22:26:37'),(84,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','22:27:04'),(85,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','22:28:20'),(86,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','22:30:41'),(87,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','22:30:52'),(88,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','22:31:09'),(89,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','22:31:57'),(90,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','22:32:11'),(91,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','22:32:33'),(92,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','22:33:05'),(93,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','23:19:02'),(94,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-27','23:21:33'),(95,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-27','23:24:34'),(96,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-27','23:24:34'),(97,'tbd_ph_dispensacion','127.0.0.1','2026-03-27','23:26:15'),(98,'tbd_ph_dispensacion','127.0.0.1','2026-03-27','23:26:15'),(99,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-27','23:44:46'),(100,'tbd_ph_dispensacion','127.0.0.1','2026-03-27','23:49:39'),(101,'subrogacion_medicamentos','127.0.0.1','2026-03-27','23:51:42'),(102,'subrogacion_medicamentos','127.0.0.1','2026-03-27','23:51:42'),(103,'subrogacion_medicamentos','127.0.0.1','2026-03-27','23:59:16'),(104,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-28','00:02:22'),(105,'tbd_ph_dispensacion','127.0.0.1','2026-03-28','00:02:35'),(106,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-28','00:03:07'),(107,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-28','00:07:54'),(108,'tbd_ph_lotes_medicamentos','127.0.0.1','2026-03-28','00:08:58'),(109,'tbd_ph_recetas_medicas','127.0.0.1','2026-03-28','00:13:17'),(110,'tbd_ph_dispensacion','127.0.0.1','2026-03-28','00:13:29');
/*!40000 ALTER TABLE `tb_bitacora_inserts` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_ge_organo_inventario`
--

LOCK TABLES `tbb_ge_organo_inventario` WRITE;
/*!40000 ALTER TABLE `tbb_ge_organo_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ge_organo_inventario` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_ge_quejas_sugerencias`
--

LOCK TABLES `tbb_ge_quejas_sugerencias` WRITE;
/*!40000 ALTER TABLE `tbb_ge_quejas_sugerencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ge_quejas_sugerencias` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_hr_medios_de_contacto`
--

LOCK TABLES `tbb_hr_medios_de_contacto` WRITE;
/*!40000 ALTER TABLE `tbb_hr_medios_de_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_hr_medios_de_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_hr_personal`
--

DROP TABLE IF EXISTS `tbb_hr_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personal` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Departamento_ID` int unsigned NOT NULL,
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
  UNIQUE KEY `numero_empleado_UNIQUE` (`Numero_Empleado`),
  KEY `fk_personal_departamentos_idx` (`Departamento_ID`),
  CONSTRAINT `Persona_Fisica_Id` FOREIGN KEY (`ID`) REFERENCES `tbb_hr_personas_fisicas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Personal\nJerarquía: Sub Entidad\n Percepción: Física';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_personal`
--

LOCK TABLES `tbb_hr_personal` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personal` DISABLE KEYS */;
INSERT INTO `tbb_hr_personal` VALUES (1,1,1001,'Auxiliar','BASE','2026-03-26',NULL,1000.00,'2026-03-26 23:39:45','2026-03-27 05:39:45',_binary '');
/*!40000 ALTER TABLE `tbb_hr_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_hr_personal_medico`
--

DROP TABLE IF EXISTS `tbb_hr_personal_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personal_medico` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Turno` enum('MATUTINO','VESPERTINO','NOCTURNO','MIXTO') DEFAULT NULL,
  `Area_ID` int unsigned NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Cedula_Profesional` varchar(30) NOT NULL,
  `Especialidad` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `celula_profecional_UNIQUE` (`Cedula_Profesional`),
  KEY `PM_Area_Id_idx` (`Area_ID`),
  CONSTRAINT `Personal_Medico_Id` FOREIGN KEY (`ID`) REFERENCES `tbb_hr_personal` (`ID`),
  CONSTRAINT `PM_Area_Id` FOREIGN KEY (`Area_ID`) REFERENCES `tbc_ge_areas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Personal Medico\nJerarquía: Sub Entidad\nPercepción: Física';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_personal_medico`
--

LOCK TABLES `tbb_hr_personal_medico` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personal_medico` DISABLE KEYS */;
INSERT INTO `tbb_hr_personal_medico` VALUES (1,'MATUTINO',3,'2026-03-26 23:42:06',NULL,_binary '','','');
/*!40000 ALTER TABLE `tbb_hr_personal_medico` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_hr_personas`
--

LOCK TABLES `tbb_hr_personas` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personas` DISABLE KEYS */;
INSERT INTO `tbb_hr_personas` VALUES (1,'Moral',NULL,'Colombia','2026-02-13 14:04:57','2026-02-13 14:29:20',_binary '');
/*!40000 ALTER TABLE `tbb_hr_personas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_AFTER_INSERT` AFTER INSERT ON `tbb_hr_personas` FOR EACH ROW BEGIN
         INSERT INTO tbi_bitacora VALUES (DEFAULT, 
         "tbb_personas", SESSION_USER(), "Insert",
         CONCAT_WS(" ", "Se ha insertado una nueva 
         persona con el ID:", new.id), default );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_hr_personas` FOR EACH ROW BEGIN
    -- Actualiza automáticamente la fecha de modificación
    SET NEW.fecha_actualizacion = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_AFTER_UPDATE` AFTER UPDATE ON `tbb_hr_personas` FOR EACH ROW BEGIN
   INSERT INTO tbi_bitacora VALUES (DEFAULT, 
         "tbb_personas", SESSION_USER(), "Update",
         CONCAT_WS(" ", "Se han actualizado los datos de la 
         persona con  ID:", new.id), default );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_AFTER_DELETE` AFTER DELETE ON `tbb_hr_personas` FOR EACH ROW BEGIN
   INSERT INTO tbi_bitacora VALUES (DEFAULT, 
         "tbb_personas", SESSION_USER(), "Delete",
         CONCAT_WS(" ", "Se borrado la persona con ID:", old.id), default );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Personas Físicas\nJerarquía: Sub Entidad\nPercepción: Física ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_personas_fisicas`
--

LOCK TABLES `tbb_hr_personas_fisicas` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personas_fisicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_hr_personas_fisicas` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_md_defunciones`
--

LOCK TABLES `tbb_md_defunciones` WRITE;
/*!40000 ALTER TABLE `tbb_md_defunciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_defunciones` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_md_diagnosticos`
--

LOCK TABLES `tbb_md_diagnosticos` WRITE;
/*!40000 ALTER TABLE `tbb_md_diagnosticos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_diagnosticos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_md_documentos_oficiales`
--

LOCK TABLES `tbb_md_documentos_oficiales` WRITE;
/*!40000 ALTER TABLE `tbb_md_documentos_oficiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_documentos_oficiales` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_md_domicilios`
--

LOCK TABLES `tbb_md_domicilios` WRITE;
/*!40000 ALTER TABLE `tbb_md_domicilios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_domicilios` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_md_expedientes_medicos`
--

LOCK TABLES `tbb_md_expedientes_medicos` WRITE;
/*!40000 ALTER TABLE `tbb_md_expedientes_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_expedientes_medicos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_md_nacimientos`
--

LOCK TABLES `tbb_md_nacimientos` WRITE;
/*!40000 ALTER TABLE `tbb_md_nacimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_nacimientos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_md_notas_medicas`
--

LOCK TABLES `tbb_md_notas_medicas` WRITE;
/*!40000 ALTER TABLE `tbb_md_notas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_notas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Paciente\nJerarquia: Super Entidad\nPercepcion: Fisica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_md_pacientes`
--

LOCK TABLES `tbb_md_pacientes` WRITE;
/*!40000 ALTER TABLE `tbb_md_pacientes` DISABLE KEYS */;
INSERT INTO `tbb_md_pacientes` VALUES (1,'2026-03-26 23:16:13',_binary '');
/*!40000 ALTER TABLE `tbb_md_pacientes` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_md_tratamientos`
--

LOCK TABLES `tbb_md_tratamientos` WRITE;
/*!40000 ALTER TABLE `tbb_md_tratamientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_md_tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_mr_personas_morales`
--

LOCK TABLES `tbb_mr_personas_morales` WRITE;
/*!40000 ALTER TABLE `tbb_mr_personas_morales` DISABLE KEYS */;
INSERT INTO `tbb_mr_personas_morales` VALUES (1,'Comercializadora Xicotepec','Privada','2026-02-20 13:54:07','2026-02-20','Activa',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbb_mr_personas_morales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_morales_after_insert` AFTER INSERT ON `tbb_mr_personas_morales` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_personas_morales', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado una nueva persona moral con el ID:', NEW.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_morales_after_update` AFTER UPDATE ON `tbb_mr_personas_morales` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_personas_morales', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado la persona moral con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_morales_after_delete` AFTER DELETE ON `tbb_mr_personas_morales` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_personas_morales', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado la persona moral con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_mr_proveedores`
--

DROP TABLE IF EXISTS `tbb_mr_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_mr_proveedores` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Id_persona` int unsigned NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `Nombre` varchar(100) NOT NULL,
  `Contacto` varchar(50) DEFAULT NULL,
  `Especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_persona_idx` (`Id_persona`),
  CONSTRAINT `fk_proveedores_personas` FOREIGN KEY (`Id_persona`) REFERENCES `tbb_hr_personas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Proveedor \nPercepción: Mixto \nJerarquía: Generica \n Aprobado: no';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_mr_proveedores`
--

LOCK TABLES `tbb_mr_proveedores` WRITE;
/*!40000 ALTER TABLE `tbb_mr_proveedores` DISABLE KEYS */;
INSERT INTO `tbb_mr_proveedores` VALUES (1,1,'2026-02-20 13:54:07',_binary '','Proveedor Médico de la Sierra','Juan Pérez','Insumos Quirúrgicos');
/*!40000 ALTER TABLE `tbb_mr_proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_proveedores_after_insert` AFTER INSERT ON `tbb_mr_proveedores` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_proveedores', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo proveedor con el ID:', NEW.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_proveedores_after_update` AFTER UPDATE ON `tbb_mr_proveedores` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_proveedores', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el proveedor con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_proveedores_after_delete` AFTER DELETE ON `tbb_mr_proveedores` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_proveedores', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado al proveedor con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Dumping data for table `tbb_mr_transacciones_financieras`
--

LOCK TABLES `tbb_mr_transacciones_financieras` WRITE;
/*!40000 ALTER TABLE `tbb_mr_transacciones_financieras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_mr_transacciones_financieras` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_transacciones_financieras_after_insert` AFTER INSERT ON `tbb_mr_transacciones_financieras` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_transacciones_financieras', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado una transacción con el ID:', NEW.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_transacciones_financieras_after_update` AFTER UPDATE ON `tbb_mr_transacciones_financieras` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_transacciones_financieras', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado la transacción con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_transacciones_financieras_after_delete` AFTER DELETE ON `tbb_mr_transacciones_financieras` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbb_transacciones_financieras', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado la transacción con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Dumping data for table `tbb_ms_citas_medicas`
--

LOCK TABLES `tbb_ms_citas_medicas` WRITE;
/*!40000 ALTER TABLE `tbb_ms_citas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ms_citas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_ms_dietas`
--

LOCK TABLES `tbb_ms_dietas` WRITE;
/*!40000 ALTER TABLE `tbb_ms_dietas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ms_dietas` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_ms_transfusiones_sanguineas`
--

LOCK TABLES `tbb_ms_transfusiones_sanguineas` WRITE;
/*!40000 ALTER TABLE `tbb_ms_transfusiones_sanguineas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ms_transfusiones_sanguineas` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_ms_traslados`
--

LOCK TABLES `tbb_ms_traslados` WRITE;
/*!40000 ALTER TABLE `tbb_ms_traslados` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ms_traslados` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbb_ms_valoraciones`
--

LOCK TABLES `tbb_ms_valoraciones` WRITE;
/*!40000 ALTER TABLE `tbb_ms_valoraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_ms_valoraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_ph_recetas_medicas`
--

DROP TABLE IF EXISTS `tbb_ph_recetas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_ph_recetas_medicas` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la receta',
  `Paciente_Id` int unsigned NOT NULL COMMENT 'ID del paciente asociado',
  `Personal_Medico_Id` int unsigned NOT NULL COMMENT 'ID del medico que emite la receta',
  `Fecha_Emision` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de emision de la receta',
  `Estado_Receta` enum('Pendiente','Surtida','Surtida Parcial','Expirada','Cancelada') DEFAULT 'Pendiente',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de registro en BD',
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de ultima actualizacion',
  `Estatus` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Estatus del registro: 1 activo, 0 inactivo',
  PRIMARY KEY (`Id`),
  KEY `fk_paciente_1_idx` (`Paciente_Id`),
  CONSTRAINT `fk_paciente_1` FOREIGN KEY (`Paciente_Id`) REFERENCES `tbb_md_pacientes` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Recetas Medicas\nJerarquía: Débil\nPercepción: Genérica\nAprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_ph_recetas_medicas`
--

LOCK TABLES `tbb_ph_recetas_medicas` WRITE;
/*!40000 ALTER TABLE `tbb_ph_recetas_medicas` DISABLE KEYS */;
INSERT INTO `tbb_ph_recetas_medicas` VALUES (2,1,1,'2026-03-26 23:42:06','Pendiente','2026-03-26 23:42:06','2026-03-26 23:42:06',_binary ''),(3,1,1,'2026-03-26 23:45:32','Pendiente','2026-03-26 23:45:32','2026-03-26 23:45:32',_binary ''),(4,1,1,'2026-03-26 23:46:10','Pendiente','2026-03-26 23:46:10','2026-03-26 23:46:10',_binary ''),(5,1,1,'2026-03-26 23:51:24','Pendiente','2026-03-26 23:51:24','2026-03-26 23:51:24',_binary ''),(6,1,1,'2026-03-27 00:08:47','Pendiente','2026-03-27 00:08:47','2026-03-27 00:08:47',_binary ''),(7,1,1,'2026-03-27 00:10:34','Pendiente','2026-03-27 00:10:34','2026-03-27 00:10:34',_binary ''),(8,1,1,'2026-03-27 00:24:06','Pendiente','2026-03-27 00:24:06','2026-03-27 00:24:06',_binary ''),(9,1,1,'2026-03-27 00:24:42','Pendiente','2026-03-27 00:24:42','2026-03-27 00:24:42',_binary ''),(10,1,1,'2026-03-27 00:25:54','Surtida','2026-03-27 00:25:54','2026-03-27 23:51:42',_binary ''),(11,1,1,'2026-03-27 00:26:58','Pendiente','2026-03-27 00:26:58','2026-03-27 00:26:58',_binary ''),(12,1,1,'2026-03-27 00:37:42','Pendiente','2026-03-27 00:37:42','2026-03-27 00:37:42',_binary ''),(13,1,1,'2026-03-27 00:39:40','Pendiente','2026-03-27 00:39:40','2026-03-27 00:39:40',_binary ''),(16,1,1,'2026-03-27 00:49:33','Pendiente','2026-03-27 00:49:33','2026-03-27 00:49:33',_binary ''),(18,1,1,'2026-03-27 07:00:57','Pendiente','2026-03-27 07:00:57','2026-03-27 01:00:57',_binary ''),(19,1,1,'2026-03-27 07:01:29','Pendiente','2026-03-27 07:01:29','2026-03-27 01:01:29',_binary ''),(20,1,1,'2026-03-27 01:03:50','Pendiente','2026-03-27 01:03:50','2026-03-27 01:03:50',_binary ''),(21,1,1,'2026-03-27 07:06:06','Pendiente','2026-03-27 07:06:06','2026-03-27 01:06:05',_binary ''),(22,1,1,'2026-03-27 01:14:21','Pendiente','2026-03-27 01:14:21','2026-03-27 01:14:21',_binary ''),(23,1,1,'2026-03-27 07:16:05','Surtida','2026-03-27 07:16:05','2026-03-27 01:28:12',_binary ''),(24,1,1,'2026-03-27 07:35:12','Surtida','2026-03-27 07:35:12','2026-03-27 01:46:12',_binary ''),(25,1,1,'2026-03-27 07:35:33','Surtida','2026-03-27 07:35:33','2026-03-27 01:36:11',_binary ''),(26,1,1,'2026-03-27 07:43:49','Pendiente','2026-03-27 07:43:49','2026-03-27 01:43:49',_binary ''),(27,1,1,'2026-03-27 07:47:10','Pendiente','2026-03-27 07:47:10','2026-03-27 01:47:10',_binary ''),(28,1,1,'2026-03-27 07:52:52','Surtida','2026-03-27 07:52:52','2026-03-27 01:53:02',_binary ''),(29,1,1,'2026-03-27 07:53:36','Surtida','2026-03-27 07:53:36','2026-03-27 01:53:35',_binary ''),(30,1,1,'2026-03-27 07:53:36','Pendiente','2026-03-27 07:53:36','2026-03-27 01:53:36',_binary ''),(31,1,1,'2026-03-27 07:54:25','Surtida','2026-03-27 07:54:25','2026-03-27 01:54:30',_binary ''),(32,1,1,'2026-03-27 07:54:31','Pendiente','2026-03-27 07:54:31','2026-03-27 01:54:30',_binary ''),(33,1,1,'2026-03-27 08:01:57','Surtida','2026-03-27 08:01:57','2026-03-27 02:03:01',_binary ''),(34,1,1,'2026-03-27 19:40:40','Surtida','2026-03-27 19:40:40','2026-03-27 13:41:29',_binary ''),(35,1,1,'2026-03-27 19:42:19','Surtida Parcial','2026-03-27 19:42:19','2026-03-27 13:42:44',_binary ''),(36,1,1,'2026-03-27 19:51:56','Surtida','2026-03-27 19:51:56','2026-03-27 14:01:10',_binary ''),(37,1,1,'2026-03-27 20:03:23','Surtida','2026-03-27 20:03:23','2026-03-27 14:06:34',_binary ''),(38,1,1,'2026-03-27 20:03:48','Pendiente','2026-03-27 20:03:48','2026-03-27 14:03:47',_binary ''),(39,1,1,'2026-03-27 20:05:33','Surtida','2026-03-27 20:05:33','2026-03-27 14:05:45',_binary ''),(40,1,1,'2026-03-27 20:07:59','Surtida','2026-03-27 20:07:59','2026-03-27 14:08:19',_binary ''),(41,1,1,'2026-03-27 20:18:54','Surtida','2026-03-27 20:18:54','2026-03-27 14:19:08',_binary ''),(42,1,1,'2026-03-27 20:19:20','Surtida','2026-03-27 20:19:20','2026-03-27 14:20:07',_binary ''),(43,1,1,'2026-03-27 20:29:31','Surtida','2026-03-27 20:29:31','2026-03-27 14:29:45',_binary ''),(44,1,1,'2026-03-27 20:30:02','Surtida','2026-03-27 20:30:02','2026-03-27 14:30:11',_binary ''),(45,1,1,'2026-03-27 20:30:21','Surtida','2026-03-27 20:30:21','2026-03-27 14:30:56',_binary ''),(49,1,1,'2026-03-28 05:24:34','Surtida','2026-03-28 05:24:34','2026-03-27 23:26:14',_binary ''),(50,1,1,'2026-03-28 05:44:46','Surtida','2026-03-28 05:44:46','2026-03-27 23:49:39',_binary ''),(51,1,1,'2026-03-28 06:02:22','Pendiente','2026-03-28 06:02:22','2026-03-28 00:02:22',_binary ''),(52,1,1,'2026-03-28 06:03:07','Pendiente','2026-03-28 06:03:07','2026-03-28 00:03:06',_binary ''),(53,1,1,'2026-03-28 06:13:17','Surtida Parcial','2026-03-28 06:13:17','2026-03-28 00:13:29',_binary '');
/*!40000 ALTER TABLE `tbb_ph_recetas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Área\nJerarquía: Genérica\nPercepción: Conceptual\nAprobado: Sí';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_ge_areas`
--

LOCK TABLES `tbc_ge_areas` WRITE;
/*!40000 ALTER TABLE `tbc_ge_areas` DISABLE KEYS */;
INSERT INTO `tbc_ge_areas` VALUES (3,'Area Dispensacion',NULL,1,1,0,'Activa',1,'2026-03-26 23:38:26',NULL,_binary '');
/*!40000 ALTER TABLE `tbc_ge_areas` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbc_ge_organos`
--

LOCK TABLES `tbc_ge_organos` WRITE;
/*!40000 ALTER TABLE `tbc_ge_organos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_ge_organos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbc_ge_patologias`
--

LOCK TABLES `tbc_ge_patologias` WRITE;
/*!40000 ALTER TABLE `tbc_ge_patologias` DISABLE KEYS */;
INSERT INTO `tbc_ge_patologias` VALUES (1,'Infarto Agudo al Miocardio','Myocardial infarction','Ataque al corazón','Necrosis del músculo cardíaco por falta de riego sanguíneo.','Dolor precordial, disnea, diaforesis, náuseas.','2026-03-20 14:10:16',NULL,_binary ''),(2,'Leucemia Linfoide Aguda','Acute lymphoblastic leukemia','Cáncer en la sangre','Neoplasia maligna de los precursores de los linfocitos.','Fatiga, fiebre, sangrados frecuentes, dolor óseo.','2026-03-20 14:10:16',NULL,_binary ''),(3,'Insuficiencia Renal Crónica','Chronic kidney disease','Falla renal','Pérdida progresiva e irreversible de la función renal.','Edema, oliguria, fatiga, prurito, anemia.','2026-03-20 14:10:16',NULL,_binary ''),(4,'Esclerosis Múltiple','Multiple sclerosis','EM','Enfermedad desmielinizante del sistema nervioso central.','Debilidad muscular, alteraciones visuales, falta de equilibrio.','2026-03-20 14:10:16',NULL,_binary ''),(5,'Cáncer de Páncreas','Pancreatic adenocarcinoma','Tumor de páncreas','Adenocarcinoma originado en los conductos pancreáticos.','Ictericia, dolor abdominal irradiado a espalda, pérdida de peso.','2026-03-20 14:10:16',NULL,_binary ''),(6,'Lupus Eritematoso Sistémico','Systemic lupus erythematosus','Lupus','Enfermedad autoinmune multisistémica crónica.','Eritema en alas de mariposa, artritis, fotosensibilidad.','2026-03-20 14:10:16',NULL,_binary ''),(7,'Enfermedad de Alzheimer','Alzheimer disease','Demencia senil','Trastorno neurodegenerativo con deterioro cognitivo progresivo.','Pérdida de memoria, desorientación, cambios de conducta.','2026-03-20 14:10:16',NULL,_binary ''),(8,'Septicemia Aguda','Septicemia','Sepsis','Respuesta inflamatoria sistémica ante una infección grave.','Fiebre alta, taquicardia, hipotensión, confusión.','2026-03-20 14:10:16',NULL,_binary ''),(9,'Cirrosis Hepática','Liver cirrhosis','Daño hepático','Cicatrización del tejido hepático con pérdida de función.','Ascitis, ictericia, encefalopatía hepática.','2026-03-20 14:10:16',NULL,_binary ''),(10,'Hipertensión Pulmonar Primaria','Idiopathic pulmonary arterial hypertension','Presión pulmonar alta','Aumento de la presión en las arterias de los pulmones.','Dificultad respiratoria, síncope, dolor torácico.','2026-03-20 14:10:16',NULL,_binary ''),(11,'Glioblastoma Multiforme','Glioblastoma multiforme','Tumor cerebral grado IV','Tumor cerebral astrocítico de rápido crecimiento.','Cefalea intensa, convulsiones, déficit neurológico.','2026-03-20 14:10:16',NULL,_binary ''),(12,'Fibrosis Quística','Cystic fibrosis','FQ','Trastorno genético que afecta glándulas exocrinas.','Infecciones pulmonares recurrentes, insuficiencia pancreática.','2026-03-20 14:10:16',NULL,_binary ''),(13,'Artritis Reumatoide','Rheumatoid arthritis','Artritis crónica','Inflamación sistémica crónica de las articulaciones.','Rigidez matutina, deformidad articular, dolor.','2026-03-20 14:10:16',NULL,_binary ''),(14,'Púrpura Trombocitopénica','Immune thrombocytopenic purpura','Púrpura','Bajo conteo de plaquetas por destrucción autoinmune.','Petequias, equimosis, sangrado gingival.','2026-03-20 14:10:16',NULL,_binary ''),(15,'Enfermedad de Crohn','Crohn disease','Ibd','Enfermedad inflamatoria intestinal transmural.','Diarrea crónica, dolor abdominal, fístulas.','2026-03-20 14:10:16',NULL,_binary ''),(16,'VIH/SIDA','Human immunodeficiency virus infection','Sida','Infección por virus que ataca linfocitos T CD4.','Infecciones oportunistas, linfadenopatía, fiebre prolongada.','2026-03-20 14:10:16',NULL,_binary ''),(17,'Mieloma Múltiple','Multiple myeloma','Cáncer de médula ósea','Proliferación maligna de células plasmáticas.','Dolor óseo, fracturas patológicas, hipercalcemia.','2026-03-20 14:10:16',NULL,_binary ''),(18,'Sarcoma de Ewing','Ewing sarcoma','Tumor óseo infantil','Tumor óseo altamente maligno en niños y jóvenes.','Inflamación local, dolor nocturno, fiebre.','2026-03-20 14:10:16',NULL,_binary ''),(19,'Anemia Falciforme','Sickle cell anemia','Drepanocitosis','Alteración genética de la hemoglobina.','Crisis de dolor, anemia grave, dactilitis.','2026-03-20 14:10:16',NULL,_binary ''),(20,'Miastenia Gravis','Myasthenia gravis','Debilidad muscular','Trastorno neuromuscular autoinmune de la unión sináptica.','Ptosis palpebral, diplopía, fatiga muscular.','2026-03-20 14:10:16',NULL,_binary ''),(21,'Enfermedad de Parkinson','Parkinson disease','Parkinson','Trastorno del movimiento por déficit de dopamina.','Temblor en reposo, bradicinesia, rigidez.','2026-03-20 14:10:16',NULL,_binary ''),(22,'Aneurisma de Aorta Abdominal','Abdominal aortic aneurysm','Aneurisma','Dilatación localizada de la arteria aorta.','Masa pulsátil abdominal, dolor lumbar súbito.','2026-03-20 14:10:16',NULL,_binary ''),(23,'Carcinoma Renal','Renal cell carcinoma','Cáncer de riñón','Malignidad del epitelio tubular renal.','Hematuria, dolor en flanco, pérdida de peso.','2026-03-20 14:10:16',NULL,_binary ''),(24,'Estenosis Aórtica','Aortic stenosis','Válvula cerrada','Estrechamiento de la apertura de la válvula aórtica.','Angina de pecho, síncope, disnea de esfuerzo.','2026-03-20 14:10:16',NULL,_binary ''),(25,'Accidente Cerebrovascular Isquémico','Ischemic stroke','Infarto cerebral','Interrupción del flujo sanguíneo al cerebro.','Hemiparesia, afasia, desviación de comisura labial.','2026-03-20 14:10:16',NULL,_binary ''),(26,'Enfermedad de Huntington','Huntington disease','Corea de Huntington','Trastorno genético neurodegenerativo hereditario.','Movimientos coreicos, deterioro cognitivo.','2026-03-20 14:10:16',NULL,_binary ''),(27,'Hemofilia A','Hemophilia A','Trastorno de coagulación','Deficiencia congénita del Factor VIII.','Hemartrosis, hematomas espontáneos.','2026-03-20 14:10:16',NULL,_binary ''),(28,'Esclerosis Lateral Amiotrófica','Amyotrophic lateral sclerosis','ELA','Degeneración de neuronas motoras.','Atrofia muscular progresiva, parálisis respiratoria.','2026-03-20 14:10:16',NULL,_binary ''),(29,'Linfoma de Hodgkin','Hodgkin lymphoma','Cáncer de ganglios','Neoplasia del tejido linfoide (Células Reed-Sternberg).','Adenopatías indoloras, pérdida de peso, sudor nocturno.','2026-03-20 14:10:16',NULL,_binary ''),(30,'Cetoacidosis Diabética','Diabetic ketoacidosis','Crisis de azúcar','Complicación aguda grave de la Diabetes Tipo 1.','Respiración de Kussmaul, aliento cetónico, deshidratación.','2026-03-20 14:10:16',NULL,_binary ''),(31,'Embolia Pulmonar','Pulmonary embolism','Trombosis pulmonar','Obstrucción de arterias pulmonares por un trombo.','Disnea súbita, dolor pleurítico, hemoptisis.','2026-03-20 14:10:16',NULL,_binary ''),(32,'Osteosarcoma','Osteosarcoma','Cáncer de hueso','Tumor óseo primario más frecuente en adolescentes.','Dolor óseo persistente, aumento de volumen local.','2026-03-20 14:10:16',NULL,_binary ''),(33,'Preeclampsia Grave','Severe preeclampsia','Presión alta en embarazo','Trastorno hipertensivo del embarazo con daño a órganos.','Cefalea, fosfenos, edema generalizado, proteinuria.','2026-03-20 14:10:16',NULL,_binary ''),(34,'Glomerulonefritis','Glomerulonephritis','Inflamación renal','Inflamación de los glomérulos renales.','Hematuria, hipertensión, proteinuria.','2026-03-20 14:10:16',NULL,_binary ''),(35,'Sarcoidosis','Sarcoidosis','Sarcoidosis','Enfermedad granulomatosa multisistémica ideopática.','Tos seca, disnea, lesiones cutáneas.','2026-03-20 14:10:16',NULL,_binary ''),(36,'Rabdomiólisis','Rhabdomyolysis','Descomposición muscular','Destrucción de fibras musculares con liberación de mioglobina.','Orina oscura, debilidad muscular, dolor.','2026-03-20 14:10:16',NULL,_binary ''),(37,'Cáncer de Mama Metastásico','Metastatic breast cancer','Cáncer de mama','Malignidad mamaria con diseminación a otros órganos.','Nódulos, alteraciones cutáneas, dolor óseo.','2026-03-20 14:10:16',NULL,_binary ''),(38,'Hepatitis C Crónica','Chronic Hepatitis C','Hepatitis C','Infección viral persistente del hígado.','Fatiga crónica, cirrosis tardía, ictericia leve.','2026-03-20 14:10:16',NULL,_binary ''),(39,'Meningitis Bacteriana','Bacterial meningitis','Meningitis','Inflamación de las meninges por patógenos bacterianos.','Rigidez de nuca, fiebre alta, fotofobia.','2026-03-20 14:10:16',NULL,_binary ''),(40,'Fibrilación Auricular','Atrial fibrillation','Arritmia','Ritmo cardíaco irregular y rápido.','Palpitaciones, mareo, fatiga.','2026-03-20 14:10:16',NULL,_binary ''),(41,'Cáncer de Colon','Colorectal adenocarcinoma','Cáncer de colon','Malignidad del epitelio del colon o recto.','Cambios en hábito intestinal, sangre en heces.','2026-03-20 14:10:16',NULL,_binary ''),(42,'Espondilitis Anquilosante','Ankylosing spondylitis','Rigidez de columna','Artritis crónica que afecta la columna vertebral.','Dolor lumbar crónico, limitación del movimiento.','2026-03-20 14:10:16',NULL,_binary ''),(43,'Sindrome de Guillain-Barré','Guillain-Barré syndrome','Parálisis ascendente','Polineuropatía desmielinizante inflamatoria aguda.','Debilidad ascendente, parestesias, arreflexia.','2026-03-20 14:10:16',NULL,_binary ''),(44,'Cáncer de Pulmón Microcítico','Small cell lung cancer','Cáncer pulmonar','Tumor bronquial de alta agresividad.','Tos persistente, pérdida de peso, estridor.','2026-03-20 14:10:16',NULL,_binary ''),(45,'Amiloidosis','Amyloidosis','Amiloidosis','Depósito de proteínas anómalas en los tejidos.','Cardiomiopatía restrictiva, macroglosia, síndrome nefrótico.','2026-03-20 14:10:16',NULL,_binary ''),(46,'Feocromocitoma','Pheochromocytoma','Tumor adrenal','Tumor de la médula suprarrenal productor de catecolaminas.','Triada: Cefalea, palpitaciones, diaforesis.','2026-03-20 14:10:16',NULL,_binary ''),(47,'Enfermedad Celíaca','Celiac disease','Intolerancia al gluten','Respuesta inmune al gluten que daña el intestino delgado.','Diarrea malabsortiva, pérdida de peso, anemia.','2026-03-20 14:10:16',NULL,_binary ''),(48,'Sindrome Nefrótico','Nephrotic syndrome','Hinchazón renal','Trastorno renal caracterizado por pérdida masiva de proteínas.','Edema severo, hipoalbuminemia, hiperlipidemia.','2026-03-20 14:10:16',NULL,_binary ''),(49,'Acromegalia','Acromegaly','Gigantismo adulto','Producción excesiva de hormona del crecimiento.','Crecimiento de manos y pies, rasgos faciales toscos.','2026-03-20 14:10:16',NULL,_binary ''),(50,'Distrofia Muscular de Duchenne','Duchenne muscular dystrophy','Distrofia de Duchenne','Trastorno genético con debilidad muscular progresiva.','Dificultad para caminar, signo de Gowers.','2026-03-20 14:10:16',NULL,_binary '');
/*!40000 ALTER TABLE `tbc_ge_patologias` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbc_ge_servicios`
--

LOCK TABLES `tbc_ge_servicios` WRITE;
/*!40000 ALTER TABLE `tbc_ge_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_ge_servicios` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbc_ge_tipos_patologias`
--

LOCK TABLES `tbc_ge_tipos_patologias` WRITE;
/*!40000 ALTER TABLE `tbc_ge_tipos_patologias` DISABLE KEYS */;
INSERT INTO `tbc_ge_tipos_patologias` VALUES (1,'Oncológica','Enfermedades neoplásicas malignas y tumores.','2026-03-20 14:14:37',NULL,_binary ''),(2,'Crónico-Degenerativa','Patologías de larga duración y progresión lenta.','2026-03-20 14:14:37',NULL,_binary ''),(3,'Autoinmune','Trastornos donde el sistema inmune ataca al organismo.','2026-03-20 14:14:37',NULL,_binary ''),(4,'Infectocontagiosa','Enfermedades causadas por agentes biológicos externos.','2026-03-20 14:14:37',NULL,_binary ''),(5,'Genética/Congénita','Alteraciones presentes desde el nacimiento o hereditarias.','2026-03-20 14:14:37',NULL,_binary ''),(6,'Cardiovascular','Patologías relacionadas con el corazón y vasos sanguíneos.','2026-03-20 14:14:37',NULL,_binary ''),(7,'Neurodegenerativa','Afecciones con degradación progresiva de neuronas.','2026-03-20 14:14:37',NULL,_binary ''),(8,'Endocrino-Metabólica','Trastornos del sistema hormonal y metabolismo.','2026-03-20 14:14:37',NULL,_binary ''),(9,'Humatológica','Enfermedades de la sangre y órganos hematopoyéticos.','2026-03-20 14:14:37',NULL,_binary ''),(10,'Traumatológica/Sistémica','Afecciones por causas externas o daño orgánico múltiple.','2026-03-20 14:14:37',NULL,_binary ''),(11,'Oncológica','Enfermedades neoplásicas malignas y tumores.','2026-03-20 14:14:37',NULL,_binary ''),(12,'Crónico-Degenerativa','Patologías de larga duración y progresión lenta.','2026-03-20 14:14:37',NULL,_binary ''),(13,'Autoinmune','Trastornos donde el sistema inmune ataca al organismo.','2026-03-20 14:14:37',NULL,_binary ''),(14,'Infectocontagiosa','Enfermedades causadas por agentes biológicos externos.','2026-03-20 14:14:37',NULL,_binary ''),(15,'Genética/Congénita','Alteraciones presentes desde el nacimiento o hereditarias.','2026-03-20 14:14:37',NULL,_binary ''),(16,'Cardiovascular','Patologías relacionadas con el corazón y vasos sanguíneos.','2026-03-20 14:14:37',NULL,_binary ''),(17,'Neurodegenerativa','Afecciones con degradación progresiva de neuronas.','2026-03-20 14:14:37',NULL,_binary ''),(18,'Endocrino-Metabólica','Trastornos del sistema hormonal y metabolismo.','2026-03-20 14:14:37',NULL,_binary ''),(19,'Humatológica','Enfermedades de la sangre y órganos hematopoyéticos.','2026-03-20 14:14:37',NULL,_binary ''),(20,'Traumatológica/Sistémica','Afecciones por causas externas o daño orgánico múltiple.','2026-03-20 14:14:37',NULL,_binary '');
/*!40000 ALTER TABLE `tbc_ge_tipos_patologias` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Departamentos\nJerarquía: Generica\nPercepción: Conceptual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_hr_departamentos`
--

LOCK TABLES `tbc_hr_departamentos` WRITE;
/*!40000 ALTER TABLE `tbc_hr_departamentos` DISABLE KEYS */;
INSERT INTO `tbc_hr_departamentos` VALUES (1,'Farmacia Dept',NULL,3,1,NULL);
/*!40000 ALTER TABLE `tbc_hr_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbc_md_signos_vitales`
--

LOCK TABLES `tbc_md_signos_vitales` WRITE;
/*!40000 ALTER TABLE `tbc_md_signos_vitales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_md_signos_vitales` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbc_mr_equipamientos`
--

LOCK TABLES `tbc_mr_equipamientos` WRITE;
/*!40000 ALTER TABLE `tbc_mr_equipamientos` DISABLE KEYS */;
INSERT INTO `tbc_mr_equipamientos` VALUES (1,'2026-02-20 13:54:08',_binary '','Monitor de Signos Vitales','Philips',1,NULL);
/*!40000 ALTER TABLE `tbc_mr_equipamientos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbc_equipamientos_after_insert` AFTER INSERT ON `tbc_mr_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_equipamientos', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo equipamiento con el ID:', NEW.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbc_equipamientos_after_update` AFTER UPDATE ON `tbc_mr_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_equipamientos', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el equipamiento con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbc_equipamientos_after_delete` AFTER DELETE ON `tbc_mr_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_equipamientos', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado el equipamiento con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Dumping data for table `tbc_mr_espacios`
--

LOCK TABLES `tbc_mr_espacios` WRITE;
/*!40000 ALTER TABLE `tbc_mr_espacios` DISABLE KEYS */;
INSERT INTO `tbc_mr_espacios` VALUES (1,'2026-02-20 13:54:08',_binary '','Sala de Urgencias',1,15,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbc_mr_espacios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbc_espacios_after_insert` AFTER INSERT ON `tbc_mr_espacios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_espacios', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo espacio con el ID:', NEW.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbc_espacios_after_update` AFTER UPDATE ON `tbc_mr_espacios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_espacios', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el espacio con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbc_espacios_after_delete` AFTER DELETE ON `tbc_mr_espacios` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbc_espacios', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado el espacio con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Dumping data for table `tbc_ms_cirugias`
--

LOCK TABLES `tbc_ms_cirugias` WRITE;
/*!40000 ALTER TABLE `tbc_ms_cirugias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_ms_cirugias` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbc_ms_servicios_medicos`
--

LOCK TABLES `tbc_ms_servicios_medicos` WRITE;
/*!40000 ALTER TABLE `tbc_ms_servicios_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_ms_servicios_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_ph_medicamentos`
--

DROP TABLE IF EXISTS `tbc_ph_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_ph_medicamentos` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Nombre_Cientifico` varchar(150) NOT NULL,
  `Nombre_Comun` varchar(150) NOT NULL,
  `Principio_Activo` varchar(150) NOT NULL,
  `Concentracion` varchar(100) NOT NULL,
  `Forma_Farmaceutica` varchar(100) NOT NULL,
  `Via_Administracion` varchar(100) NOT NULL,
  `Tipo_Medicamento` enum('normal','controlado','alto_costo') NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Medicamentos\nJerarquía: Fuerte\nPercepción: Catalogo\nAprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_ph_medicamentos`
--

LOCK TABLES `tbc_ph_medicamentos` WRITE;
/*!40000 ALTER TABLE `tbc_ph_medicamentos` DISABLE KEYS */;
INSERT INTO `tbc_ph_medicamentos` VALUES (1,'Paracetamol Test','Parac','Para','Parac','500mg','Tableta','Oral','normal','2026-03-26 22:58:02',_binary ''),(2,'Paracetamol 500mg','Acetaminophen','Paracetamol','Paracetamol','500 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(3,'Ibuprofeno 400mg','Ibuprofen','Ibuprofeno','Ibuprofeno','400 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(4,'Amoxicilina 500mg','Amoxicillin','Amoxicilina','Amoxicilina','500 mg','Cápsula','Oral','normal','2026-03-27 01:20:17',_binary ''),(5,'Ácido Acetilsalicílico','Aspirin','Aspirina','Ácido acetilsalicílico','100 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(6,'Omeprazol 20mg','Omeprazole','Omeprazol','Omeprazol','20 mg','Cápsula','Oral','normal','2026-03-27 01:20:17',_binary ''),(7,'Metformina 850mg','Metformin','Metformina','Metformina','850 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(8,'Losartán 50mg','Losartan','Losartán','Losartán','50 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(9,'Enalapril 10mg','Enalapril','Enalapril','Enalapril','10 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(10,'Captopril 25mg','Captopril','Captopril','Captopril','25 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(11,'Salbutamol Inhalador','Salbutamol','Salbutamol','Salbutamol','100 mcg','Inhalador','Inhalatoria','normal','2026-03-27 01:20:17',_binary ''),(12,'Diclofenaco 50mg','Diclofenac','Diclofenaco','Diclofenaco','50 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(13,'Ketorolaco 10mg','Ketorolac','Ketorolaco','Ketorolaco','10 mg','Tableta','Oral','controlado','2026-03-27 01:20:17',_binary ''),(14,'Tramadol 50mg','Tramadol','Tramadol','Tramadol','50 mg','Cápsula','Oral','controlado','2026-03-27 01:20:17',_binary ''),(15,'Morfina 10mg','Morphine','Morfina','Morfina','10 mg','Inyectable','Intravenosa','controlado','2026-03-27 01:20:17',_binary ''),(16,'Fentanilo','Fentanyl','Fentanilo','Fentanilo','50 mcg','Parche','Transdérmica','controlado','2026-03-27 01:20:17',_binary ''),(17,'Insulina Glargina','Insulin Glargine','Insulina','Insulina','100 UI','Inyectable','Subcutánea','alto_costo','2026-03-27 01:20:17',_binary ''),(18,'Insulina Lispro','Insulin Lispro','Insulina rápida','Insulina','100 UI','Inyectable','Subcutánea','alto_costo','2026-03-27 01:20:17',_binary ''),(19,'Heparina','Heparin','Heparina','Heparina','5000 UI','Inyectable','Intravenosa','alto_costo','2026-03-27 01:20:17',_binary ''),(20,'Warfarina','Warfarin','Warfarina','Warfarina','5 mg','Tableta','Oral','controlado','2026-03-27 01:20:17',_binary ''),(21,'Clopidogrel','Clopidogrel','Clopidogrel','Clopidogrel','75 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(22,'Azitromicina','Azithromycin','Azitromicina','Azitromicina','500 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(23,'Ceftriaxona','Ceftriaxone','Ceftriaxona','Ceftriaxona','1 g','Inyectable','Intramuscular','normal','2026-03-27 01:20:17',_binary ''),(24,'Ciprofloxacino','Ciprofloxacin','Ciprofloxacino','Ciprofloxacino','500 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(25,'Clindamicina','Clindamycin','Clindamicina','Clindamicina','300 mg','Cápsula','Oral','normal','2026-03-27 01:20:17',_binary ''),(26,'Metronidazol','Metronidazole','Metronidazol','Metronidazol','500 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(27,'Loratadina','Loratadine','Loratadina','Loratadina','10 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(28,'Cetirizina','Cetirizine','Cetirizina','Cetirizina','10 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(29,'Dexametasona','Dexamethasone','Dexametasona','Dexametasona','4 mg','Tableta','Oral','controlado','2026-03-27 01:20:17',_binary ''),(30,'Prednisona','Prednisone','Prednisona','Prednisona','5 mg','Tableta','Oral','controlado','2026-03-27 01:20:17',_binary ''),(31,'Hidrocortisona','Hydrocortisone','Hidrocortisona','Hidrocortisona','100 mg','Inyectable','Intravenosa','controlado','2026-03-27 01:20:17',_binary ''),(32,'Ranitidina','Ranitidine','Ranitidina','Ranitidina','150 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(33,'Pantoprazol','Pantoprazole','Pantoprazol','Pantoprazol','40 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(34,'Esomeprazol','Esomeprazole','Esomeprazol','Esomeprazol','40 mg','Cápsula','Oral','normal','2026-03-27 01:20:17',_binary ''),(35,'Loperamida','Loperamide','Loperamida','Loperamida','2 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(36,'Bismuto','Bismuth Subsalicylate','Pepto','Bismuto','262 mg','Suspensión','Oral','normal','2026-03-27 01:20:17',_binary ''),(37,'Vitamina C','Ascorbic Acid','Vitamina C','Ácido ascórbico','500 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(38,'Vitamina D','Cholecalciferol','Vitamina D','Vitamina D','1000 UI','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(39,'Ácido Fólico','Folic Acid','Ácido Fólico','Ácido fólico','5 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(40,'Calcio','Calcium Carbonate','Calcio','Calcio','600 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(41,'Hierro','Ferrous Sulfate','Hierro','Hierro','325 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(42,'Ondansetrón','Ondansetron','Ondansetrón','Ondansetrón','8 mg','Tableta','Oral','controlado','2026-03-27 01:20:17',_binary ''),(43,'Metoclopramida','Metoclopramide','Metoclopramida','Metoclopramida','10 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(44,'Haloperidol','Haloperidol','Haloperidol','Haloperidol','5 mg','Tableta','Oral','controlado','2026-03-27 01:20:17',_binary ''),(45,'Diazepam','Diazepam','Diazepam','Diazepam','10 mg','Tableta','Oral','controlado','2026-03-27 01:20:17',_binary ''),(46,'Clonazepam','Clonazepam','Clonazepam','Clonazepam','2 mg','Tableta','Oral','controlado','2026-03-27 01:20:17',_binary ''),(47,'Atorvastatina','Atorvastatin','Atorvastatina','Atorvastatina','20 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(48,'Simvastatina','Simvastatin','Simvastatina','Simvastatina','20 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(49,'Amlodipino','Amlodipine','Amlodipino','Amlodipino','5 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary ''),(50,'Nifedipino','Nifedipine','Nifedipino','Nifedipino','10 mg','Tableta','Oral','normal','2026-03-27 01:20:17',_binary '');
/*!40000 ALTER TABLE `tbc_ph_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbd_ge_aprobaciones`
--

LOCK TABLES `tbd_ge_aprobaciones` WRITE;
/*!40000 ALTER TABLE `tbd_ge_aprobaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ge_aprobaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_aprobaciones_after_insert` AFTER INSERT ON `tbd_ge_aprobaciones` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_aprobaciones', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado una nueva aprobación con el ID:', NEW.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_aprobaciones_after_update` AFTER UPDATE ON `tbd_ge_aprobaciones` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_aprobaciones', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado la aprobación con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_aprobaciones_after_delete` AFTER DELETE ON `tbd_ge_aprobaciones` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_aprobaciones', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado la aprobación con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Dumping data for table `tbd_ge_patologias_tipos`
--

LOCK TABLES `tbd_ge_patologias_tipos` WRITE;
/*!40000 ALTER TABLE `tbd_ge_patologias_tipos` DISABLE KEYS */;
INSERT INTO `tbd_ge_patologias_tipos` VALUES (1,1,6,'2026-03-20 14:15:26',NULL,_binary ''),(2,2,9,'2026-03-20 14:15:26',NULL,_binary ''),(3,2,1,'2026-03-20 14:15:26',NULL,_binary ''),(4,3,2,'2026-03-20 14:15:26',NULL,_binary ''),(5,4,3,'2026-03-20 14:15:26',NULL,_binary ''),(6,4,7,'2026-03-20 14:15:26',NULL,_binary ''),(7,5,1,'2026-03-20 14:15:26',NULL,_binary ''),(8,6,3,'2026-03-20 14:15:26',NULL,_binary ''),(9,12,5,'2026-03-20 14:15:26',NULL,_binary ''),(10,16,4,'2026-03-20 14:15:26',NULL,_binary ''),(11,21,7,'2026-03-20 14:15:26',NULL,_binary ''),(12,27,5,'2026-03-20 14:15:26',NULL,_binary ''),(13,27,9,'2026-03-20 14:15:26',NULL,_binary ''),(14,30,8,'2026-03-20 14:15:26',NULL,_binary '');
/*!40000 ALTER TABLE `tbd_ge_patologias_tipos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbd_ge_servicio_participantes`
--

LOCK TABLES `tbd_ge_servicio_participantes` WRITE;
/*!40000 ALTER TABLE `tbd_ge_servicio_participantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ge_servicio_participantes` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbd_ge_solicitudes_servicios`
--

LOCK TABLES `tbd_ge_solicitudes_servicios` WRITE;
/*!40000 ALTER TABLE `tbd_ge_solicitudes_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ge_solicitudes_servicios` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbd_hr_horarios`
--

LOCK TABLES `tbd_hr_horarios` WRITE;
/*!40000 ALTER TABLE `tbd_hr_horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_hr_horarios` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbd_md_padecimientos`
--

LOCK TABLES `tbd_md_padecimientos` WRITE;
/*!40000 ALTER TABLE `tbd_md_padecimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_md_padecimientos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbd_mr_accesos`
--

LOCK TABLES `tbd_mr_accesos` WRITE;
/*!40000 ALTER TABLE `tbd_mr_accesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_mr_accesos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_accesos_after_insert` AFTER INSERT ON `tbd_mr_accesos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_accesos', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo acceso con el ID:', NEW.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_accesos_after_update` AFTER UPDATE ON `tbd_mr_accesos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_accesos', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el acceso con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_accesos_after_delete` AFTER DELETE ON `tbd_mr_accesos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_accesos', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado el acceso con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Dumping data for table `tbd_mr_inventario_equipamientos`
--

LOCK TABLES `tbd_mr_inventario_equipamientos` WRITE;
/*!40000 ALTER TABLE `tbd_mr_inventario_equipamientos` DISABLE KEYS */;
INSERT INTO `tbd_mr_inventario_equipamientos` VALUES (1,1,'SN-987654321',NULL,NULL,'Operativo','2026-02-20 13:54:09',NULL,_binary '');
/*!40000 ALTER TABLE `tbd_mr_inventario_equipamientos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_inventario_equipamientos_after_insert` AFTER INSERT ON `tbd_mr_inventario_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_inventario_equipamientos', 
        SESSION_USER(), 
        'INSERT', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo registro en inventario con el ID:', NEW.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_inventario_equipamientos_after_update` AFTER UPDATE ON `tbd_mr_inventario_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_inventario_equipamientos', 
        SESSION_USER(), 
        'UPDATE', 
        CONCAT_WS(' ', 'Se ha actualizado el registro de inventario con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbd_inventario_equipamientos_after_delete` AFTER DELETE ON `tbd_mr_inventario_equipamientos` FOR EACH ROW BEGIN
    INSERT INTO tbi_bitacora (Nombre_Tabla, Usuario, Operacion, Descripcion)
    VALUES (
        'tbd_inventario_equipamientos', 
        SESSION_USER(), 
        'DELETE', 
        CONCAT_WS(' ', 'El usuario', SESSION_USER(), 'ha eliminado el registro de inventario con el ID:', OLD.id)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Dumping data for table `tbd_ms_campanias`
--

LOCK TABLES `tbd_ms_campanias` WRITE;
/*!40000 ALTER TABLE `tbd_ms_campanias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ms_campanias` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbd_ms_recursos_cirugia`
--

LOCK TABLES `tbd_ms_recursos_cirugia` WRITE;
/*!40000 ALTER TABLE `tbd_ms_recursos_cirugia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_ms_recursos_cirugia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_ph_detalle_receta`
--

DROP TABLE IF EXISTS `tbd_ph_detalle_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ph_detalle_receta` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Medicamento_Id` int unsigned NOT NULL,
  `Receta_Id` int unsigned NOT NULL,
  `Dosis` varchar(100) NOT NULL,
  `Frecuencia` varchar(100) NOT NULL,
  `Duracion` varchar(100) NOT NULL,
  `Cantidad` int unsigned NOT NULL,
  `Indicaciones` text,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Detalle Receta\nJerarquía: Débil\nPercepción: Genérica\nAprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_ph_detalle_receta`
--

LOCK TABLES `tbd_ph_detalle_receta` WRITE;
/*!40000 ALTER TABLE `tbd_ph_detalle_receta` DISABLE KEYS */;
INSERT INTO `tbd_ph_detalle_receta` VALUES (1,1,2,'1 tabs','12h','3 dias',2,'Test','2026-03-26 23:42:06','2026-03-26 23:42:06'),(2,1,3,'1 tabs','12h','3 dias',2,'Test','2026-03-26 23:45:32','2026-03-26 23:45:32'),(3,1,4,'1 tabs','12h','3 dias',2,'Test','2026-03-26 23:46:10','2026-03-26 23:46:10'),(4,1,5,'1 tabs','12h','3 dias',2,'Test','2026-03-26 23:51:24','2026-03-26 23:51:24'),(5,1,6,'1 tab','8h','5 dias',3,'Test Python','2026-03-27 00:08:47','2026-03-27 00:08:47'),(6,1,7,'1 tab','8h','5 dias',3,'Test Python','2026-03-27 00:10:34','2026-03-27 00:10:34'),(7,1,8,'1 tab','8h','5 dias',3,'Test Python','2026-03-27 00:24:06','2026-03-27 00:24:06'),(8,1,9,'1 tab','8h','5 dias',3,'Test Python','2026-03-27 00:24:42','2026-03-27 00:24:42'),(9,1,10,'1 tab','8h','5 dias',3,'Test Python','2026-03-27 00:25:54','2026-03-27 00:25:54'),(10,1,11,'1 tab','8h','3d',1,'debug','2026-03-27 00:26:58','2026-03-27 00:26:58'),(11,1,12,'1 tab','8h','5 dias',3,'Test Python','2026-03-27 00:37:42','2026-03-27 00:37:42'),(12,1,13,'1 tab','8h','5 dias',3,'Test Python','2026-03-27 00:39:40','2026-03-27 00:39:40'),(13,1,16,'1 tab','8h','5 dias',3,'Test Python','2026-03-27 00:49:33','2026-03-27 00:49:33'),(14,1,18,'1 tab','cada 8 horas','3 días',3,'Vía oral','2026-03-27 07:00:57','2026-03-27 07:00:57'),(15,1,19,'1 tab','cada 8 horas','3 días',300,'Vía oral','2026-03-27 07:01:29','2026-03-27 07:01:29'),(16,1,20,'1 tab','8h','5 dias',3,'Test Python','2026-03-27 01:03:50','2026-03-27 01:03:50'),(17,1,21,'1 tableta','cada 8 horas','3 días',5,'Tomar después de los alimentos','2026-03-27 07:06:06','2026-03-27 07:06:06'),(18,1,22,'1 tab','8h','5 dias',3,'Test Python','2026-03-27 01:14:21','2026-03-27 01:14:21'),(19,1,23,'1 tableta','cada 8 horas','3 días',5,'Tomar después de los alimentos','2026-03-27 07:16:05','2026-03-27 07:16:05'),(20,2,24,'1 tab','cada 8 horas','3 días',3,'Vía oral','2026-03-27 07:35:12','2026-03-27 07:35:12'),(21,2,25,'1 tab','cada 8 horas','3 días',5,'Vía oral','2026-03-27 07:35:33','2026-03-27 07:35:33'),(22,1,25,'1 tab','cada 8 horas','3 días',10,'Vía oral','2026-03-27 07:35:33','2026-03-27 07:35:33'),(23,3,26,'1 tableta','cada 8 horas','3 días',15,'Tomar después de los alimentos','2026-03-27 07:43:49','2026-03-27 07:43:49'),(24,3,27,'1 tableta','cada 8 horas','3 días',15,'Tomar después de los alimentos','2026-03-27 07:47:10','2026-03-27 07:47:10'),(25,4,28,'1 tableta','cada 8 horas','3 días',20,'Tomar después de los alimentos','2026-03-27 07:52:52','2026-03-27 07:52:52'),(26,4,29,'1 tableta','cada 8 horas','3 días',20,'Tomar después de los alimentos','2026-03-27 07:53:36','2026-03-27 07:53:36'),(27,5,30,'1 tableta','cada 8 horas','3 días',999,'Tomar después de los alimentos','2026-03-27 07:53:36','2026-03-27 07:53:36'),(28,4,31,'1 tableta','cada 8 horas','3 días',20,'Tomar después de los alimentos','2026-03-27 07:54:25','2026-03-27 07:54:25'),(29,5,32,'1 tableta','cada 8 horas','3 días',999,'Tomar después de los alimentos','2026-03-27 07:54:31','2026-03-27 07:54:31'),(30,4,33,'1 tab','cada 8 horas','3 días',5,'Vía oral','2026-03-27 08:01:57','2026-03-27 08:01:57'),(31,5,34,'1 tab','cada 8 horas','3 días',5,'Vía oral','2026-03-27 19:40:40','2026-03-27 19:40:40'),(32,5,35,'1 tab','cada 8 horas','3 días',15,'Vía oral','2026-03-27 19:42:19','2026-03-27 19:42:19'),(33,6,36,'1 tab','cada 8 horas','3 días',10,'Vía oral','2026-03-27 19:51:56','2026-03-27 19:51:56'),(34,26,37,'2 tabletas','cada 8 horas','7 días',8456,'Tomar en ayunas','2026-03-27 20:03:23','2026-03-27 20:03:23'),(35,14,38,'4 tab','cada 6 horas','8 días',25,'Tomar en ayunas','2026-03-27 20:03:48','2026-03-27 20:03:48'),(36,1,39,'4 tab','cada 6 horas','8 días',25,'Tomar en ayunas','2026-03-27 20:05:33','2026-03-27 20:05:33'),(37,1,40,'4 tab','cada 6 horas','8 días',8,'Tomar en ayunas','2026-03-27 20:07:59','2026-03-27 20:07:59'),(38,1,41,'1 tab','cada 8 horas','3 días',5,'Vía oral','2026-03-27 20:18:54','2026-03-27 20:18:54'),(39,1,42,'1 tab','cada 8 horas','3 días',5000,'Vía oral','2026-03-27 20:19:20','2026-03-27 20:19:20'),(40,10,43,'10 tab','cada 8 horas','3 días',10,'Vía oral','2026-03-27 20:29:31','2026-03-27 20:29:31'),(41,10,44,'10 tab','cada 8 horas','3 días',50,'Vía oral','2026-03-27 20:30:02','2026-03-27 20:30:02'),(42,10,45,'10 tab','cada 8 horas','3 días',50,'Vía oral','2026-03-27 20:30:21','2026-03-27 20:30:21'),(43,15,49,'1 tab','cada 8 horas','3 días',500,'Vía oral','2026-03-28 05:24:34','2026-03-28 05:24:34'),(44,15,50,'1 tab','cada 8 horas','3 días',500,'Vía oral','2026-03-28 05:44:46','2026-03-28 05:44:46'),(45,28,51,'1 tab','cada 8 horas','3 días',500,'Vía oral','2026-03-28 06:02:22','2026-03-28 06:02:22'),(46,28,52,'2 tab','cada 8 horas','7 días',200,'Vía oral','2026-03-28 06:03:07','2026-03-28 06:03:07'),(47,46,53,'2 tab','cada 8 horas','7 días',100,'Vía oral','2026-03-28 06:13:17','2026-03-28 06:13:17');
/*!40000 ALTER TABLE `tbd_ph_detalle_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_ph_inventario_medicamentos`
--

DROP TABLE IF EXISTS `tbd_ph_inventario_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ph_inventario_medicamentos` (
  `Medicamento_Id` int unsigned NOT NULL,
  `Marca` varchar(150) NOT NULL,
  `Empresa` varchar(150) NOT NULL,
  `Farmaceutica` varchar(150) NOT NULL,
  `Presentacion` varchar(150) NOT NULL,
  `Efectos_Secundarios` text,
  `Via_Administracion` varchar(150) NOT NULL,
  `Restricciones` text,
  `Aprobacion` tinyint(1) NOT NULL DEFAULT '0',
  `Cantidad` int unsigned NOT NULL,
  `Fecha_Movimiento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Motivo` varchar(255) DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Medicamento_Id`),
  CONSTRAINT `fk_inv_med` FOREIGN KEY (`Medicamento_Id`) REFERENCES `tbc_ph_medicamentos` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Inventario de Medicamentos\nJerarquía: Débil\nPercepción: Genérica\nAprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_ph_inventario_medicamentos`
--

LOCK TABLES `tbd_ph_inventario_medicamentos` WRITE;
/*!40000 ALTER TABLE `tbd_ph_inventario_medicamentos` DISABLE KEYS */;
INSERT INTO `tbd_ph_inventario_medicamentos` VALUES (1,'Laboratorio MX','Farmex SA','Genfar','Caja 10 tabletas','Nauseas leves','Oral','Ninguna',1,625,'2026-03-28 04:26:37','COMPRA','2026-03-27 06:28:26'),(2,'Tempra','Genomma Lab','Pfizer','Caja 20 Tabletas',NULL,'Oral',NULL,1,102,'2026-03-27 07:46:12','DISPENSACION','2026-03-27 07:34:25'),(3,'SaludPlus','Farmex SA','Genfar','Caja 20 tabletas','Dolor de cabeza','Oral','No consumir con alcohol',1,1810,'2026-03-28 04:30:41','COMPRA','2026-03-27 07:43:06'),(4,'Laboratorio MX','Farmex SA','Genfar','Caja 10 tabletas','Nauseas leves','Oral','Ninguna',1,105,'2026-03-27 08:03:01','DISPENSACION','2026-03-27 07:52:52'),(5,'Laboratorio MX','Farmex SA','Genfar','Caja 10 tabletas','Nauseas leves','Oral','Ninguna',1,0,'2026-03-27 19:42:45','DISPENSACION','2026-03-27 19:38:46'),(6,'Laboratorio MX','Salud Global SA','PharmaLife','Caja 10 tabletas','Nauseas leves','Oral','Ninguna',1,0,'2026-03-27 19:53:25','DISPENSACION','2026-03-27 19:52:52'),(7,'Dormex','MedCorp','Bayer','Frasco 100 ml','Somnolencia','Oral','Evitar conducir',1,800,'2026-03-28 04:30:52','COMPRA INICIAL','2026-03-28 04:30:52'),(10,'Genérico','Distribuidora Nacional','Sin especificar','Frasco 500ml','Ninguno','Oral','Ninguna',1,5850,'2026-03-28 05:19:02','COMPRA','2026-03-27 20:27:04'),(12,'VitaC','Salud Integral','Pfizer','Caja 30 tabletas','Ninguno','Oral','Ninguna',1,2000,'2026-03-28 04:31:09','COMPRA INICIAL','2026-03-28 04:31:09'),(13,'Genérico','Farmacéutica Alfa','Sin especificar','Sin especificar','Ninguno','Oral','Ninguna',1,45000,'2026-03-28 06:08:58','COMPRA INICIAL','2026-03-28 06:08:58'),(15,'Genérico','Fármacos Mundiales SA','Sin especificar','Contenedor 1500 unidades','Ninguno','Intravenosa','Ninguna',1,149000,'2026-03-28 05:49:39','DISPENSACION','2026-03-28 05:21:33'),(20,'GastroSafe','Farmex SA','Genfar','Caja 15 tabletas','Irritación estomacal','Oral','Tomar con alimentos',1,1200,'2026-03-28 04:31:57','COMPRA INICIAL','2026-03-28 04:31:57'),(28,'Genérico','Fármacos MO','Sin especificar','Contenedor 1500 unidades','Ninguno','Oral','Ninguna',1,15000,'2026-03-28 06:07:54','COMPRA INICIAL','2026-03-28 06:07:54'),(40,'FlexiDol','BioMed','Abbott','Caja 20 cápsulas','Dolor muscular','Oral','No mezclar con anticoagulantes',1,1000,'2026-03-28 04:33:05','COMPRA','2026-03-28 04:32:11'),(45,'ImmunoBoost','Salud Global','Merck','Caja 60 tabletas','Ninguno','Oral','Ninguna',1,2200,'2026-03-28 04:32:33','COMPRA INICIAL','2026-03-28 04:32:33'),(46,'Laboratorio MX','Salud Global SA','PharmaLife','Caja 10 tabletas','Nauseas leves','Oral','Ninguna',1,0,'2026-03-28 06:13:29','DISPENSACION','2026-03-27 19:32:18');
/*!40000 ALTER TABLE `tbd_ph_inventario_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_ph_lotes_medicamentos`
--

DROP TABLE IF EXISTS `tbd_ph_lotes_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_ph_lotes_medicamentos` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Medicamento_Id` int unsigned NOT NULL,
  `Numero_Lote` varchar(100) NOT NULL,
  `Fecha_Fabricacion` date NOT NULL,
  `Fecha_Caducidad` date NOT NULL,
  `Cantidad_Inicial` int unsigned NOT NULL,
  `Cantidad_Actual` int unsigned NOT NULL,
  `Estado_Lote` enum('disponible','bloqueado','vencido') NOT NULL DEFAULT 'disponible',
  `Ubicacion` varchar(150) DEFAULT NULL,
  `Observaciones` text,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  CONSTRAINT `chk_fechas_lote` CHECK ((`fecha_caducidad` > `fecha_fabricacion`))
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Lotes de Medicamentos\nJerarquía: Débil\nPercepción: Transaccional\nAprobado: No';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_ph_lotes_medicamentos`
--

LOCK TABLES `tbd_ph_lotes_medicamentos` WRITE;
/*!40000 ALTER TABLE `tbd_ph_lotes_medicamentos` DISABLE KEYS */;
INSERT INTO `tbd_ph_lotes_medicamentos` VALUES (1,1,'LOTE-1774587009326-762','2026-03-26','2028-03-26',50,0,'disponible',NULL,NULL,'2026-03-26 22:50:09'),(2,1,'LOT-COMPRA-PY','2026-03-27','2029-01-01',50,0,'disponible',NULL,NULL,'2026-03-27 06:09:00'),(3,1,'LOT-SWAGGER-001','2026-03-27','2029-01-01',50,0,'disponible',NULL,NULL,'2026-03-27 06:11:39'),(4,1,'LOT-SWAGGER-001','2026-03-27','2029-01-01',50,0,'disponible',NULL,NULL,'2026-03-27 06:15:09'),(5,1,'LOT-SWAGGER-001','2026-03-27','2029-01-01',20,0,'disponible',NULL,NULL,'2026-03-27 06:19:22'),(9,1,'LOT-2025-001','2026-03-27','2028-06-01',50,0,'disponible',NULL,NULL,'2026-03-27 06:28:26'),(10,1,'LOT-2025-001','2026-03-27','2028-06-01',10,0,'disponible',NULL,NULL,'2026-03-27 06:28:34'),(11,1,'LOT-COMPRA-PY','2026-03-27','2029-01-01',50,0,'disponible',NULL,NULL,'2026-03-27 06:37:57'),(12,1,'LOT-COMPRA-PY','2026-03-27','2029-01-01',50,0,'disponible',NULL,NULL,'2026-03-27 06:39:52'),(13,1,'ULTRA-LOTE-2026','2026-03-27','2030-12-31',100,0,'disponible',NULL,NULL,'2026-03-27 06:41:00'),(14,1,'LOT-COMPRA-PY','2026-03-27','2029-01-01',50,0,'disponible',NULL,NULL,'2026-03-27 06:49:48'),(15,1,'LOT-COMPRA-PY','2026-03-27','2029-01-01',50,0,'disponible',NULL,NULL,'2026-03-27 07:04:08'),(16,1,'LOTE-FINAL-01','2026-03-27','2028-01-01',100,0,'disponible',NULL,NULL,'2026-03-27 07:07:34'),(17,1,'LOTE-FINAL-01','2026-03-27','2028-01-01',3,0,'disponible',NULL,NULL,'2026-03-27 07:08:03'),(18,1,'LOT-COMPRA-PY','2026-03-27','2029-01-01',50,0,'disponible',NULL,NULL,'2026-03-27 07:14:36'),(19,1,'LOTE-FINAL-01','2026-03-27','2028-01-01',15,0,'disponible',NULL,NULL,'2026-03-27 07:17:13'),(20,2,'LOTE-P-02','2026-03-27','2028-01-01',100,92,'disponible',NULL,NULL,'2026-03-27 07:34:25'),(22,2,'LOTE-PARA-003','2026-03-27','2028-01-01',10,10,'disponible',NULL,NULL,'2026-03-27 07:41:16'),(25,3,'LOT-2025-001','2026-03-27','2028-06-01',10,0,'disponible',NULL,NULL,'2026-03-27 07:43:06'),(26,4,'TEST-AMOX-001','2026-03-27','2028-01-01',50,0,'disponible',NULL,NULL,'2026-03-27 07:52:52'),(27,4,'TEST-AMOX-001','2026-03-27','2028-01-01',50,35,'disponible',NULL,NULL,'2026-03-27 07:53:35'),(28,4,'TEST-AMOX-001','2026-03-27','2028-01-01',50,50,'disponible',NULL,NULL,'2026-03-27 07:54:24'),(29,4,'LOT-2025-001','2026-03-27','2028-06-01',10,10,'disponible',NULL,NULL,'2026-03-27 07:57:59'),(30,4,'LOT-2025-001','2026-03-27','2028-06-01',10,10,'disponible',NULL,NULL,'2026-03-27 07:59:31'),(31,1,'LOT-2025-001','2026-03-27','2028-06-01',100,0,'disponible',NULL,NULL,'2026-03-27 18:37:53'),(32,1,'LOT-2025-001','2026-03-27','2028-06-01',100,0,'disponible',NULL,NULL,'2026-03-27 18:53:26'),(33,1,'LOT-2025-001','2026-03-27','2028-06-01',20,0,'disponible',NULL,NULL,'2026-03-27 18:55:01'),(34,1,'LOT-2025-001','2026-03-27','2028-06-01',20,0,'disponible',NULL,NULL,'2026-03-27 19:00:06'),(35,1,'LOT-2025-001','2026-03-27','2028-06-01',20,0,'disponible',NULL,NULL,'2026-03-27 19:00:38'),(36,1,'LOT-2025-001','2026-03-27','2028-06-01',10,0,'disponible',NULL,NULL,'2026-03-27 19:02:24'),(37,1,'LOT-2025-001','2026-03-27','2028-06-01',5,0,'disponible',NULL,NULL,'2026-03-27 19:03:59'),(38,1,'LOTE-REF','2026-03-27','2028-01-01',10,0,'disponible',NULL,NULL,'2026-03-27 19:20:59'),(39,46,'LOT-2025-001','2026-03-27','2028-06-01',25,0,'disponible',NULL,NULL,'2026-03-27 19:32:18'),(40,46,'LOT-2025-001','2026-03-27','2028-06-01',5,0,'disponible',NULL,NULL,'2026-03-27 19:37:49'),(41,5,'LOT-2025-001','2026-03-27','2028-06-01',10,0,'disponible',NULL,NULL,'2026-03-27 19:38:46'),(42,6,'LOT-2025-001','2026-03-27','2028-06-01',5,0,'disponible',NULL,NULL,'2026-03-27 19:52:52'),(43,10,'LOT-2025-001','2026-03-27','2028-06-01',50,0,'disponible',NULL,NULL,'2026-03-27 20:27:04'),(44,10,'LOT-2025-001','2026-03-27','2028-06-01',50,0,'disponible',NULL,NULL,'2026-03-27 20:28:53'),(45,10,'LOT-2025-001','2026-03-27','2028-06-01',5000,5000,'disponible',NULL,NULL,'2026-03-28 04:26:11'),(46,1,'LOT-2025-001','2026-03-27','2028-06-01',500,500,'disponible',NULL,NULL,'2026-03-28 04:26:37'),(47,3,'LOT-2025-001','2026-03-27','2028-06-01',300,300,'disponible',NULL,NULL,'2026-03-28 04:27:04'),(48,3,'LOT-2025-002','2026-03-27','2027-03-15',1500,1500,'disponible',NULL,NULL,'2026-03-28 04:30:41'),(49,7,'LOT-2025-003','2026-03-27','2026-11-20',800,800,'disponible',NULL,NULL,'2026-03-28 04:30:52'),(50,12,'LOT-2025-004','2026-03-27','2028-01-10',2000,2000,'disponible',NULL,NULL,'2026-03-28 04:31:09'),(51,20,'LOT-2025-006','2026-03-27','2027-12-01',1200,1200,'disponible',NULL,NULL,'2026-03-28 04:31:57'),(52,40,'LOT-2025-010','2026-03-27','2027-08-12',500,500,'disponible',NULL,NULL,'2026-03-28 04:32:11'),(53,45,'LOT-2025-011','2026-03-27','2028-04-30',2200,2200,'disponible',NULL,NULL,'2026-03-28 04:32:33'),(54,40,'LOT-2025-010','2026-03-27','2027-08-12',500,500,'disponible',NULL,NULL,'2026-03-28 04:33:05'),(55,10,'RECOV-2026-X','2026-03-27','2028-01-01',850,850,'disponible',NULL,NULL,'2026-03-28 05:19:02'),(56,15,'LOTE-MAX-001','2026-03-27','2028-01-01',150000,149000,'disponible',NULL,NULL,'2026-03-28 05:21:33'),(57,28,'LOTE-MAX-001','2026-03-28','2028-01-01',15000,15000,'disponible',NULL,NULL,'2026-03-28 06:07:54'),(58,13,'LEVEL-UP-2026','2026-03-28','2028-01-01',45000,45000,'disponible',NULL,NULL,'2026-03-28 06:08:58');
/*!40000 ALTER TABLE `tbd_ph_lotes_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbi_bitacora`
--

LOCK TABLES `tbi_bitacora` WRITE;
/*!40000 ALTER TABLE `tbi_bitacora` DISABLE KEYS */;
INSERT INTO `tbi_bitacora` VALUES (1,'tbb_personas','root@localhost','Insert','Se ha insertado una nueva \n         persona con el ID: 1','2026-02-13 14:04:57'),(2,'tbb_personas','jesus.dominguez@DESKTOP-8HTV7C9','Insert','Se ha insertado una nueva \n         persona con el ID: 2','2026-02-13 14:10:04'),(3,'tbb_personas','derek.sesni@10.10.62.20','Insert','Se ha insertado una nueva \n         persona con el ID: 3','2026-02-13 14:10:36'),(4,'tbb_personas','jonathan.lopez@DESKTOP-VU1CL43','Insert','Se ha insertado una nueva \n         persona con el ID: 4','2026-02-13 14:12:46'),(5,'tbb_personas','michelle.castro@DESKTOP-EO8KM61','Insert','Se ha insertado una nueva \n         persona con el ID: 5','2026-02-13 14:13:15'),(6,'tbb_personas','francisco.garcia@DESKTOP-LCCOCUU','Insert','Se ha insertado una nueva \n         persona con el ID: 6','2026-02-13 14:13:20'),(7,'tbb_personas','citlalli.perez@DESKTOP-V03BSD8','Insert','Se ha insertado una nueva \n         persona con el ID: 7','2026-02-13 14:13:27'),(8,'tbb_personas','yazmin.gutierrez@DESKTOP-IKD1HEO','Insert','Se ha insertado una nueva \n         persona con el ID: 8','2026-02-13 14:13:29'),(9,'tbb_personas','obed.guzman@10.10.62.5','Insert','Se ha insertado una nueva \n         persona con el ID: 9','2026-02-13 14:13:48'),(10,'tbb_personas','arturo.garcia@10.10.62.7','Insert','Se ha insertado una nueva \n         persona con el ID: 10','2026-02-13 14:14:10'),(11,'tbb_personas','sayurid.bautista@10.10.62.2','Insert','Se ha insertado una nueva \n         persona con el ID: 11','2026-02-13 14:14:40'),(12,'tbb_personas','brisa.garcia@10.10.62.23','Insert','Se ha insertado una nueva \n         persona con el ID: 12','2026-02-13 14:15:54'),(13,'tbb_personas','adrian.perez@10.10.62.18','Insert','Se ha insertado una nueva \n         persona con el ID: 13','2026-02-13 14:16:30'),(14,'tbb_personas','root@localhost','Update','Se han actualizado los datos de la \n         persona con  ID: 1','2026-02-13 14:18:04'),(15,'tbb_personas','matias.granillo@10.10.62.22','Insert','Se ha insertado una nueva \n         persona con el ID: 14','2026-02-13 14:19:34'),(16,'tbb_personas','daniel.garcia@10.10.62.24','Insert','Se ha insertado una nueva \n         persona con el ID: 15','2026-02-13 14:21:18'),(17,'tbb_personas','luis.suarez@EQUIOPO05','Insert','Se ha insertado una nueva \n         persona con el ID: 16','2026-02-13 14:22:26'),(18,'tbb_personas','edwin.hernandez@10.10.62.25','Insert','Se ha insertado una nueva \n         persona con el ID: 17','2026-02-13 14:24:15'),(19,'tbb_personas','luis.suarez@EQUIOPO05','Insert','Se ha insertado una nueva \n         persona con el ID: 18','2026-02-13 14:24:54'),(20,'tbb_personas','yazmin.gutierrez@DESKTOP-IKD1HEO','Update','Se han actualizado los datos de la \n         persona con  ID: 8','2026-02-13 14:25:51'),(21,'tbb_personas','arturo.garcia@10.10.62.7','Update','Se han actualizado los datos de la \n         persona con  ID: 1','2026-02-13 14:25:52'),(22,'tbb_personas','jesus.dominguez@DESKTOP-8HTV7C9','Update','Se han actualizado los datos de la \n         persona con  ID: 3','2026-02-13 14:26:05'),(23,'tbb_personas','sayurid.bautista@10.10.62.2','Insert','Se ha insertado una nueva \n         persona con el ID: 19','2026-02-13 14:26:13'),(24,'tbb_personas','jesus.dominguez@DESKTOP-8HTV7C9','Update','Se han actualizado los datos de la \n         persona con  ID: 2','2026-02-13 14:26:21'),(25,'tbb_personas','francisco.garcia@DESKTOP-LCCOCUU','Update','Se han actualizado los datos de la \n         persona con  ID: 6','2026-02-13 14:26:40'),(26,'tbb_personas','obed.guzman@10.10.62.5','Update','Se han actualizado los datos de la \n         persona con  ID: 9','2026-02-13 14:26:47'),(27,'tbb_personas','michelle.castro@DESKTOP-EO8KM61','Update','Se han actualizado los datos de la \n         persona con  ID: 5','2026-02-13 14:27:00'),(28,'tbb_personas','brisa.garcia@10.10.62.23','Update','Se han actualizado los datos de la \n         persona con  ID: 1','2026-02-13 14:27:22'),(29,'tbb_personas','adrian.perez@10.10.62.18','Update','Se han actualizado los datos de la \n         persona con  ID: 13','2026-02-13 14:27:48'),(30,'tbb_personas','citlalli.perez@DESKTOP-V03BSD8','Update','Se han actualizado los datos de la \n         persona con  ID: 7','2026-02-13 14:27:56'),(31,'tbb_personas','sayurid.bautista@10.10.62.2','Insert','Se ha insertado una nueva \n         persona con el ID: 20','2026-02-13 14:29:13'),(32,'tbb_personas','luis.suarez@EQUIOPO05','Update','Se han actualizado los datos de la \n         persona con  ID: 18','2026-02-13 14:29:20'),(33,'tbb_personas','matias.granillo@10.10.62.22','Update','Se han actualizado los datos de la \n         persona con  ID: 1','2026-02-13 14:29:20'),(34,'tbb_personas','daniel.garcia@10.10.62.24','Insert','Se ha insertado una nueva \n         persona con el ID: 21','2026-02-13 14:30:24'),(35,'tbb_personas','angel.banos@DESKTOP-LCCOCUU','Insert','Se ha insertado una nueva \n         persona con el ID: 22','2026-02-13 14:31:17'),(36,'tbb_personas','sayurid.bautista@10.10.62.2','Insert','Se ha insertado una nueva \n         persona con el ID: 23','2026-02-13 14:31:20'),(37,'tbb_personas','angel.banos@DESKTOP-LCCOCUU','Update','Se han actualizado los datos de la \n         persona con  ID: 7','2026-02-13 14:31:22'),(38,'tbb_personas','al.farias@DESKTOP-LCCOCUU','Insert','Se ha insertado una nueva \n         persona con el ID: 24','2026-02-13 14:32:53'),(39,'tbb_personas','sayurid.bautista@10.10.62.2','Insert','Se ha insertado una nueva \n         persona con el ID: 25','2026-02-13 14:32:54'),(40,'tbb_personas','jennifer.bautista@10.10.62.28','Insert','Se ha insertado una nueva \n         persona con el ID: 26','2026-02-13 14:33:35'),(41,'tbb_personas','sayurid.bautista@10.10.62.2','Update','Se han actualizado los datos de la \n         persona con  ID: 20','2026-02-13 14:33:55'),(42,'tbb_personas_morales','arturo.garcia@10.10.62.24','Insert','Se ha insertado una nueva persona moral con el ID: 1','2026-02-20 13:54:07'),(43,'tbb_proveedores','arturo.garcia@10.10.62.24','Insert','Se ha insertado un nuevo proveedor con el ID: 1','2026-02-20 13:54:07'),(44,'tbb_transacciones_financieras','arturo.garcia@10.10.62.24','Insert','Se ha insertado una transacción con el ID: 1','2026-02-20 13:54:08'),(45,'tbc_equipamientos','arturo.garcia@10.10.62.24','Insert','Se ha insertado un nuevo equipamiento con el ID: 1','2026-02-20 13:54:08'),(46,'tbc_espacios','arturo.garcia@10.10.62.24','Insert','Se ha insertado un nuevo espacio con el ID: 1','2026-02-20 13:54:08'),(47,'tbd_inventario_equipamientos','arturo.garcia@10.10.62.24','Insert','Se ha insertado un nuevo registro en inventario con el ID: 1','2026-02-20 13:54:09'),(48,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 10','2026-03-05 15:35:31'),(49,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 16','2026-03-05 15:36:13'),(73,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 26','2026-03-05 15:38:36'),(74,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 25','2026-03-05 15:38:36'),(75,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 24','2026-03-05 15:38:36'),(76,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 23','2026-03-05 15:38:36'),(77,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 22','2026-03-05 15:38:36'),(78,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 21','2026-03-05 15:38:36'),(79,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 20','2026-03-05 15:38:36'),(80,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 19','2026-03-05 15:38:36'),(81,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 18','2026-03-05 15:38:36'),(82,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 17','2026-03-05 15:38:36'),(83,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 15','2026-03-05 15:38:36'),(84,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 14','2026-03-05 15:38:36'),(85,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 13','2026-03-05 15:38:37'),(86,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 12','2026-03-05 15:38:37'),(87,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 11','2026-03-05 15:38:37'),(88,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 9','2026-03-05 15:38:37'),(89,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 8','2026-03-05 15:38:37'),(90,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 7','2026-03-05 15:38:37'),(91,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 6','2026-03-05 15:38:37'),(92,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 5','2026-03-05 15:38:37'),(93,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 4','2026-03-05 15:38:37'),(94,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 3','2026-03-05 15:38:37'),(95,'tbb_personas','daniel.garcia@10.10.62.28','Delete','Se borrado la persona con ID: 2','2026-03-05 15:38:37'),(96,'tbb_proveedores','derek.sesni@10.10.62.22','Update','Se ha actualizado el proveedor con el ID: 1','2026-03-10 15:13:24'),(97,'tbb_transacciones_financieras','derek.sesni@10.10.62.20','Delete','El usuario derek.sesni@10.10.62.20 ha eliminado la transacción con el ID: 1','2026-03-17 15:24:58');
/*!40000 ALTER TABLE `tbi_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping events for database 'hospital_matricula'
--

--
-- Dumping routines for database 'hospital_matricula'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_bandera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_bandera`() RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE v_bandera BOOLEAN DEFAULT false;
    DECLARE v_pivote INT DEFAULT 0;
    
    SET v_pivote = fn_numero_aleatorio_rangos(1,100);
    IF v_pivote <=50 THEN
		SET v_bandera= true;
	ELSE 
		SET v_bandera=false;
	END IF;    
    
RETURN v_bandera;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_bandera_porcentaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_bandera_porcentaje`( v_porcentaje int) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	RETURN rand() < (v_porcentaje/100);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_fecha_nacimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_fecha_nacimiento`(fecha_inicio DATE, fecha_fin DATE) RETURNS date
    DETERMINISTIC
BEGIN
    DECLARE min_dias INT;
    DECLARE max_dias INT;
    DECLARE dias_aleatorios INT;
    DECLARE fecha_aleatoria DATE;

    SET min_dias = DATEDIFF(fecha_inicio, '1920-01-01');
    SET max_dias = DATEDIFF(fecha_fin, '1920-01-01');
    SET dias_aleatorios = fn_numero_aleatorio_rangos(min_dias, max_dias);
    SET fecha_aleatoria = DATE_ADD('1920-01-01', INTERVAL dias_aleatorios DAY);

    RETURN fecha_aleatoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_grupo_sanguineo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_grupo_sanguineo`() RETURNS varchar(3) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
 
    DECLARE v_tipo VARCHAR(2);
    DECLARE v_rh CHAR(1);
    -- RH
    SET v_rh = IF(fn_genera_bandera_porcentaje(85), '+', '-');
    -- ABO con probabilidades condicionadas
    IF fn_genera_bandera_porcentaje(45) THEN
        SET v_tipo = 'O';
    ELSEIF bandera_probabilidad(64) THEN -- ajuste proporcional
        SET v_tipo = 'A';
    ELSEIF fn_genera_bandera_porcentaje(43) THEN
        SET v_tipo = 'B';
    ELSE
        SET v_tipo = 'AB';
    END IF;

    RETURN CONCAT(v_tipo, v_rh);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_numero_aleatorio_rangos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(v_limite_inferior int, v_limite_superior INT) RETURNS int
    DETERMINISTIC
BEGIN
     DECLARE v_numero_generado INT 
     DEFAULT FLOOR(Rand()* (v_limite_superior-v_limite_inferior+1)+v_limite_inferior);
     SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_poblar_pacientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_pacientes`(vcantidad int, vgenero varchar(3), vedad_minima int , vedad_maxima int,
vestatus_vida varchar(10), vtipo_edad varchar(10))
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE n_cantidad INT;
    DECLARE v_genero_efectivo VARCHAR(3);

    /* ============================
       HANDLER GLOBAL DE ERRORES
       ============================ */
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error del sistema: Fallo no controlado en sp_poblar_pacientes. Revise parámetros o bitácora.';
    END;

    /* ============================
       REGLA DE NEGOCIO #1
       Validación de cantidad
       ============================ */

    IF vcantidad IS NULL OR TRIM(vcantidad) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RB001: La cantidad de pacientes no puede ser NULL o vacía';
    END IF;

    IF TRIM(vcantidad) NOT REGEXP '^[0-9]+$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RB001: La cantidad debe ser un entero positivo (sin decimales ni letras)';
    END IF;

    SET n_cantidad = CAST(TRIM(vcantidad) AS UNSIGNED);

    IF n_cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RB001: La cantidad debe ser mayor a 0';
    END IF;

    /* ============================
       REGLA DE NEGOCIO #2
       Validación de género
       ============================ */

    SET v_genero_efectivo = UPPER(TRIM(vgenero));

    IF vgenero IS NULL THEN
        SET v_genero_efectivo = 'RND';
    ELSEIF v_genero_efectivo NOT IN ('H', 'M', 'N/B') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error RB002: Género inválido. Use H, M, N/B o NULL para mezcla aleatoria';
    END IF;

    /* ============================
       Mensaje inicial
       ============================ */
    SELECT CONCAT(
        'Validación exitosa. Se generarán ',
        n_cantidad,
        ' pacientes simulados.'
    ) AS mensaje_sistema;

    /* ============================
       CICLO DEMOSTRATIVO
       ============================ */
    WHILE i < n_cantidad DO

        -- Generación aleatoria si aplica
        IF v_genero_efectivo = 'RND' THEN
            SET @rnd = FLOOR(1 + RAND() * 3);
            CASE @rnd
                WHEN 1 THEN SET v_genero_efectivo = 'H';
                WHEN 2 THEN SET v_genero_efectivo = 'M';
                WHEN 3 THEN SET v_genero_efectivo = 'N/B';
            END CASE;
        END IF;

        SELECT CONCAT_WS(
            ' ',
            '🧪 Generando datos del paciente #',
            i + 1,
            '| Género:',
            v_genero_efectivo
        ) AS mensaje_proceso;

        SET i = i + 1;

        -- Reinicio de modo aleatorio
        IF vgenero IS NULL THEN
            SET v_genero_efectivo = 'RND';
        END IF;

    END WHILE;

    /* ============================
       Mensaje final
       ============================ */
    SELECT CONCAT(
        'Proceso finalizado. Total de pacientes generados: ',
        n_cantidad
    ) AS mensaje_final;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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

-- Dump completed on 2026-03-28  0:21:35
