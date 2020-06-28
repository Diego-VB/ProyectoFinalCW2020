-- MySQL dump 10.13  Distrib 5.7.26, for osx10.10 (x86_64)
--
-- Host: localhost    Database: AnswerP6
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_categoria` int(2) NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(30) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `Categoria` (`Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Actividades académicas'),(2,'Ciencia'),(3,'Cultura'),(4,'Deportes');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formulario` (
  `id_formulario` varchar(15) NOT NULL,
  `Titulo` varchar(30) NOT NULL,
  `Descripcion` varchar(250) NOT NULL,
  `id_Categoria` int(2) DEFAULT NULL,
  `FechaInicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaFinal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_pregunta1` varchar(20) NOT NULL,
  `id_pregunta2` varchar(20) DEFAULT NULL,
  `id_pregunta3` varchar(20) DEFAULT NULL,
  `id_pregunta4` varchar(20) DEFAULT NULL,
  `id_pregunta5` varchar(20) DEFAULT NULL,
  `usuarioMin` int(1) NOT NULL,
  `FiltroGrupo` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_encuesta`),
  UNIQUE KEY `Titulo` (`Titulo`),
  UNIQUE KEY `id_Pregunta1` (`id_pregunta1`),
  UNIQUE KEY `id_Pregunta5` (`id_pregunta5`),
  UNIQUE KEY `id_Pregunta4` (`id_pregunta4`),
  UNIQUE KEY `id_Pregunta3` (`id_pregunta3`),
  UNIQUE KEY `id_Pregunta2` (`id_pregunta2`),
  UNIQUE KEY `id_Pregunta2_2` (`id_pregunta2`),
  KEY `id_Categoria` (`id_Categoria`),
  KEY `usuarioMin` (`usuarioMin`),
  KEY `FiltroGrupo` (`FiltroGrupo`),
  CONSTRAINT `encuesta_ibfk_10` FOREIGN KEY (`id_pregunta3`) REFERENCES `pregunta` (`id_pregunta`),
  CONSTRAINT `encuesta_ibfk_11` FOREIGN KEY (`id_pregunta4`) REFERENCES `pregunta` (`id_pregunta`),
  CONSTRAINT `encuesta_ibfk_12` FOREIGN KEY (`id_pregunta5`) REFERENCES `pregunta` (`id_pregunta`),
  CONSTRAINT `encuesta_ibfk_13` FOREIGN KEY (`usuarioMin`) REFERENCES `tipousuario` (`id_tipo`),
  CONSTRAINT `encuesta_ibfk_14` FOREIGN KEY (`FiltroGrupo`) REFERENCES `grupo` (`id_grupo`),
  CONSTRAINT `encuesta_ibfk_7` FOREIGN KEY (`id_Categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `encuesta_ibfk_8` FOREIGN KEY (`id_pregunta1`) REFERENCES `pregunta` (`id_pregunta`),
  CONSTRAINT `encuesta_ibfk_9` FOREIGN KEY (`id_pregunta2`) REFERENCES `pregunta` (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuestas_respondidas`
--

DROP TABLE IF EXISTS `encuestas_respondidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuestas_respondidas` (
  `id_Usuario` int(6) NOT NULL,
  `id_Encuesta` varchar(15) DEFAULT NULL,
  KEY `id_Usuario` (`id_Usuario`),
  KEY `id_Encuesta` (`id_Encuesta`),
  CONSTRAINT `encuestas_respondidas_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `encuestas_respondidas_ibfk_2` FOREIGN KEY (`id_Encuesta`) REFERENCES `formulario` (`id_formulario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuestas_respondidas`
--

LOCK TABLES `encuestas_respondidas` WRITE;
/*!40000 ALTER TABLE `encuestas_respondidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuestas_respondidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id_grupo` int(2) NOT NULL AUTO_INCREMENT,
  `Grupo` int(3) NOT NULL,
  PRIMARY KEY (`id_grupo`),
  UNIQUE KEY `Grupo` (`Grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,401),(2,402),(3,403),(4,404),(5,405),(6,406),(7,407),(8,408),(9,409),(10,410),(11,411),(12,412),(13,413),(14,414),(15,415),(16,416),(17,417),(18,451),(19,452),(20,453),(21,454),(22,455),(23,456),(24,457),(25,458),(26,459),(27,460),(28,461),(29,462),(30,463),(31,464),(32,465),(33,466),(34,501),(35,502),(36,503),(37,504),(38,505),(39,506),(40,507),(41,508),(42,509),(43,510),(44,511),(45,512),(46,513),(47,514),(48,515),(49,516),(50,517),(51,518),(52,551),(53,552),(54,553),(55,554),(56,555),(57,556),(58,557),(59,558),(60,559),(61,560),(62,561),(63,562),(64,563),(65,564),(66,601),(67,602),(68,603),(69,604),(70,605),(71,606),(72,607),(73,608),(74,609),(75,610),(76,611),(77,612),(78,613),(79,614),(80,615),(81,616),(82,617),(83,618),(84,619),(85,651),(86,652),(87,653),(88,654),(89,655),(90,656),(91,657),(92,658),(93,659),(94,660),(95,661),(96,662),(97,663),(98,664);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `id_pregunta` varchar(20) NOT NULL,
  `Pregunta` varchar(50) NOT NULL,
  `id_Respuesta1` varchar(20) NOT NULL,
  `id_Respuesta2` varchar(20) NOT NULL,
  `id_Respuesta3` varchar(20) DEFAULT NULL,
  `id_Respuesta4` varchar(20) DEFAULT NULL,
  `id_Respuesta5` varchar(20) DEFAULT NULL,
  `id_Respuesta6` varchar(20) DEFAULT NULL,
  `id_Respuesta7` varchar(20) DEFAULT NULL,
  `id_Respuesta8` varchar(20) DEFAULT NULL,
  `id_Respuesta9` varchar(20) DEFAULT NULL,
  `id_Respuesta10` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`),
  UNIQUE KEY `id_Respuesta1` (`id_Respuesta1`),
  UNIQUE KEY `id_Respuesta2` (`id_Respuesta2`),
  UNIQUE KEY `id_Respuesta3` (`id_Respuesta3`),
  UNIQUE KEY `id_Respuesta4` (`id_Respuesta4`),
  UNIQUE KEY `id_Respuesta5` (`id_Respuesta5`),
  UNIQUE KEY `id_Respuesta6` (`id_Respuesta6`),
  UNIQUE KEY `id_Respuesta7` (`id_Respuesta7`),
  UNIQUE KEY `id_Respuesta8` (`id_Respuesta8`),
  UNIQUE KEY `id_Respuesta9` (`id_Respuesta9`),
  UNIQUE KEY `id_Respuesta10` (`id_Respuesta10`),
  CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`id_Respuesta1`) REFERENCES `respuesta` (`id_Respuesta`),
  CONSTRAINT `pregunta_ibfk_10` FOREIGN KEY (`id_Respuesta10`) REFERENCES `respuesta` (`id_Respuesta`),
  CONSTRAINT `pregunta_ibfk_2` FOREIGN KEY (`id_Respuesta2`) REFERENCES `respuesta` (`id_Respuesta`),
  CONSTRAINT `pregunta_ibfk_3` FOREIGN KEY (`id_Respuesta3`) REFERENCES `respuesta` (`id_Respuesta`),
  CONSTRAINT `pregunta_ibfk_4` FOREIGN KEY (`id_Respuesta4`) REFERENCES `respuesta` (`id_Respuesta`),
  CONSTRAINT `pregunta_ibfk_5` FOREIGN KEY (`id_Respuesta5`) REFERENCES `respuesta` (`id_Respuesta`),
  CONSTRAINT `pregunta_ibfk_6` FOREIGN KEY (`id_Respuesta6`) REFERENCES `respuesta` (`id_Respuesta`),
  CONSTRAINT `pregunta_ibfk_7` FOREIGN KEY (`id_Respuesta7`) REFERENCES `respuesta` (`id_Respuesta`),
  CONSTRAINT `pregunta_ibfk_8` FOREIGN KEY (`id_Respuesta8`) REFERENCES `respuesta` (`id_Respuesta`),
  CONSTRAINT `pregunta_ibfk_9` FOREIGN KEY (`id_Respuesta9`) REFERENCES `respuesta` (`id_Respuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte` (
  `id_Reporte` int(6) NOT NULL AUTO_INCREMENT,
  `Razon` tinyblob NOT NULL,
  `id_Encuesta` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_Reporte`),
  KEY `id_Encuesta` (`id_Encuesta`),
  CONSTRAINT `reporte_ibfk_1` FOREIGN KEY (`id_Encuesta`) REFERENCES `encuesta` (`id_encuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta` (
  `id_Respuesta` varchar(20) NOT NULL,
  `Respuesta` varchar(50) NOT NULL,
  `votos` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_Respuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `id_tipo` int(1) NOT NULL AUTO_INCREMENT,
  `TipoUsuario` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo`),
  UNIQUE KEY `TipoUsuario` (`TipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (4,'Abierto'),(1,'Administrador'),(3,'Alumno'),(2,'Profesor');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(6) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) NOT NULL,
  `Identificador` varchar(70) DEFAULT NULL,
  `Nombre` varchar(50) NOT NULL,
  `ApellidoPat` varchar(50) NOT NULL,
  `ApellidoMat` varchar(50) NOT NULL,
  `FNacimiento` varchar(50) NOT NULL,
  `CorreoElectronico` varchar(70) NOT NULL,
  `Contraseña` varchar(60) NOT NULL,
  `id_Grupo` int(2) DEFAULT NULL,
  `EncuCreadas` int(3) NOT NULL DEFAULT '0',
  `EncuRespondidas` int(4) NOT NULL DEFAULT '0',
  `TipoUsuario` int(1) NOT NULL,
  `Bloqueo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `CorreoElectronico` (`CorreoElectronico`),
  UNIQUE KEY `Usuario` (`Usuario`),
  UNIQUE KEY `iDENTIFICADOR` (`Identificador`),
  UNIQUE KEY `Identificador_2` (`Identificador`),
  KEY `id_Grupo` (`id_Grupo`),
  KEY `TipoUsuario` (`TipoUsuario`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_Grupo`) REFERENCES `grupo` (`id_grupo`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`TipoUsuario`) REFERENCES `tipousuario` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'KuMI/9cnMXRCojeekfP6OtJoNQ9Z2K7CAm1oTq9+wUU=','hm9bporKzxAt0GYVT+iUD/ZZpFetM9c3m3uKCnfnWZQ=','+cXn4L81MPXXkD7VGUp191Pp4doL5rR0rb47aTy17YI=','RO95gXKa2yGsf31YXjPUMnLQqrbN/c/BWBgDT/zug+g=','3P9cQQ15OICrmhgC8SkqHYGUndwZ2srokhzh6+HFQqw=','CqM6XjFt9tmWCwigAyJ44k6Uom9FrLAYBnzW+ZCBaU8=','2BYrmxFBCaXa9gEDOLinZAuuBWE+MuAGImYlmBfO31/uGDVS6qIuha5fIn6M2FzE','$2y$10$RJVO8yN.wCDipdCA1x9hcuZ147yvtsivxh2QiWt3nvh5wdUNKi6eW',NULL,0,0,1,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-27 16:40:13
