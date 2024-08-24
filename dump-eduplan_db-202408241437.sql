-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: eduplan_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `informacion_academica` varchar(255) DEFAULT NULL,
  `tipo_documento` varchar(255) DEFAULT NULL,
  `documento_identidad` varchar(20) NOT NULL,
  `cursos_inscritos` varchar(255) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `empresa_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_alumnos_email` (`email`),
  KEY `FK_alumnos_empresa_id` (`empresa_id`),
  CONSTRAINT `FK_alumnos_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (2,'Steve','Grant','Rogers',NULL,'Steve Grant Rogers','Brooklyn, NY','555-1234','steve@avengers.com','Historia','Pasaporte','US98765432','Curso de liderazgo','2023-02-01','1918-07-04',1),(3,'Tony',NULL,'Stark',NULL,'Tony Stark','10880 Malibu Point, Malibu, CA','555-5678','tony@starkindustries.com','Ingeniería','Pasaporte','US87654321','Curso de tecnología avanzada','2023-02-02','1970-05-29',1),(4,'Peter','Benjamin','Parker',NULL,'Peter Benjamin Parker','Queens, New York, NY','555-8765','peter@dailybugle.com','Ciencias','Pasaporte','US76543210','Curso de ciencia y tecnología','2023-02-03','2001-08-10',4),(5,'Natasha','Alianovna','Romanoff',NULL,'Natasha Alianovna Romanoff','Avengers Compound, Upstate NY','555-4321','natasha@shield.com','Espionaje','Pasaporte','US65432109','Curso de combate táctico','2023-02-04','1984-11-22',2),(6,'Clint','Francis','Barton',NULL,'Clint Francis Barton','Waverly, Iowa','555-3456','clint@shield.com','Arquería','Pasaporte','US54321098','Curso de precisión y enfoque','2023-02-05','1971-01-07',2);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos_cursos`
--

DROP TABLE IF EXISTS `alumnos_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos_cursos` (
  `alumno_id` int NOT NULL,
  `curso_id` int NOT NULL,
  PRIMARY KEY (`alumno_id`,`curso_id`),
  KEY `FK_alumnos_cursos_alumno_id` (`alumno_id`),
  KEY `FK_alumnos_cursos_curso_id` (`curso_id`),
  CONSTRAINT `FK_alumnos_cursos_alumno_id` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  CONSTRAINT `FK_alumnos_cursos_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos_cursos`
--

LOCK TABLES `alumnos_cursos` WRITE;
/*!40000 ALTER TABLE `alumnos_cursos` DISABLE KEYS */;
INSERT INTO `alumnos_cursos` VALUES (2,1),(2,5),(3,2),(4,3),(5,3);
/*!40000 ALTER TABLE `alumnos_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `duracion` varchar(255) DEFAULT NULL,
  `objetivos` varchar(255) NOT NULL,
  `responsables` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `empresa_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cursos_empresa_id` (`empresa_id`),
  CONSTRAINT `FK_cursos_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Curso de liderazgo','Desarrollar habilidades de liderazgo en situaciones críticas.','3 meses','Liderazgo en equipos','Steve Rogers','2023-03-01','2023-06-01',1),(2,'Curso de tecnología avanzada','Introducción a tecnologías de punta.','6 meses','Implementación de tecnología','Tony Stark','2023-04-01','2023-10-01',1),(3,'Curso de ciencia y tecnología','Explorar el mundo de la ciencia aplicada.','4 meses','Innovación en ciencia','Peter Parker','2023-05-01','2023-09-01',4),(4,'Curso de combate táctico','Técnicas avanzadas de combate y espionaje.','5 meses','Combate en el campo','Natasha Romanoff','2023-06-01','2023-11-01',2),(5,'Curso de precisión y enfoque','Mejorar la precisión en tiro y decisiones tácticas.','2 meses','Habilidades de enfoque','Clint Barton','2023-07-01','2023-09-01',2);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docentes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `certificaciones` varchar(255) DEFAULT NULL,
  `experiencia` varchar(255) DEFAULT NULL,
  `documentos_adicionales` varchar(255) DEFAULT NULL,
  `fecha_contratacion` date NOT NULL,
  `documento_identidad` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_docentes_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (1,'Dr. Stephen Strange','177A Bleecker Street, New York, NY','555-1122','strange@avengers.com','Cirugía','Hechicería','No aplica','2023-01-10','AA1234567'),(2,'Natasha Romanoff','Avengers Compound, Upstate NY','555-3344','natasha@shield.com','Espionaje','Combate cuerpo a cuerpo','No aplica','2023-01-11','BB7654321'),(3,'Bruce Banner','Avengers Compound, Upstate NY','555-5566','banner@avengers.com','Física','Investigación científica','No aplica','2023-01-12','CC2345678'),(4,'Peter Parker','Queens, New York, NY','555-7788','peter@dailybugle.com','Fotografía','Ingeniería','No aplica','2023-01-13','DD8765432'),(5,'Wanda Maximoff','Avengers Compound, Upstate NY','555-9900','wanda@avengers.com','Hechicería','Psicología','No aplica','2023-01-14','EE3456789');
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `contacto` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fecha_registro` date NOT NULL,
  `persona_contacto` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_empresas_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Stark Industries','10880 Malibu Point, Malibu, CA','Tony Stark','555-1234','stark@avengers.com','2023-01-01','Pepper Potts'),(2,'S.H.I.E.L.D.','S.H.I.E.L.D. Helicarrier','Nick Fury','555-5678','fury@shield.com','2023-01-02','Maria Hill'),(3,'Oscorp','New York, NY','Norman Osborn','555-8765','osborn@oscorp.com','2023-01-03','Harry Osborn'),(4,'Daily Bugle','New York, NY','J. Jonah Jameson','555-4321','jjj@dailybugle.com','2023-01-04','Betty Brant'),(5,'Pym Technologies','San Francisco, CA','Hank Pym','555-3456','pym@pymtech.com','2023-01-05','Hope van Dyne');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluaciones`
--

DROP TABLE IF EXISTS `evaluaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alumno_id` int NOT NULL,
  `calificacion` varchar(255) DEFAULT NULL,
  `retroalimentacion` varchar(255) DEFAULT NULL,
  `criterios_evaluacion` varchar(255) NOT NULL,
  `responsables` varchar(100) NOT NULL,
  `fecha_evaluacion` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_evaluaciones_alumno_id` (`alumno_id`),
  CONSTRAINT `FK_evaluaciones_alumno_id` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluaciones`
--

LOCK TABLES `evaluaciones` WRITE;
/*!40000 ALTER TABLE `evaluaciones` DISABLE KEYS */;
INSERT INTO `evaluaciones` VALUES (6,2,'A','Excelente comprensión histórica.','Conocimiento histórico','Steve Rogers','2023-07-01'),(7,6,'B','Buen conocimiento de tecnología.','Conocimiento técnico','Tony Stark','2023-07-02'),(8,3,'A+','Gran dominio de personajes.','Conocimiento de personajes','Bruce Banner','2023-07-03'),(9,4,'B+','Buen conocimiento geográfico.','Conocimiento geográfico','Natasha Romanoff','2023-07-04'),(10,5,'A','Dominio perfecto de materiales.','Conocimiento de materiales','Clint Barton','2023-07-05');
/*!40000 ALTER TABLE `evaluaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planificaciones`
--

DROP TABLE IF EXISTS `planificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planificaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `curso_id` int NOT NULL,
  `horario` varchar(255) DEFAULT NULL,
  `docente_id` int NOT NULL,
  `detalles_planificacion` varchar(255) NOT NULL,
  `responsables` varchar(100) NOT NULL,
  `fecha_planificacion` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_planificaciones_curso_id` (`curso_id`),
  KEY `FK_planificaciones_docente_id` (`docente_id`),
  CONSTRAINT `FK_planificaciones_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  CONSTRAINT `FK_planificaciones_docente_id` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planificaciones`
--

LOCK TABLES `planificaciones` WRITE;
/*!40000 ALTER TABLE `planificaciones` DISABLE KEYS */;
INSERT INTO `planificaciones` VALUES (1,1,'Lunes a Viernes 10:00 - 12:00',1,'Liderazgo en situaciones de crisis','Steve Rogers','2023-02-25'),(2,2,'Lunes a Viernes 14:00 - 16:00',2,'Tecnologías avanzadas y su implementación','Tony Stark','2023-03-25'),(3,3,'Lunes a Viernes 16:00 - 18:00',4,'Innovaciones en el campo de la ciencia','Peter Parker','2023-04-25'),(4,4,'Martes y Jueves 10:00 - 12:00',3,'Tácticas de combate en situaciones reales','Natasha Romanoff','2023-05-25'),(5,5,'Miércoles y Viernes 08:00 - 10:00',5,'Mejora de la precisión en el tiro','Clint Barton','2023-06-25');
/*!40000 ALTER TABLE `planificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenido` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `respuesta_correcta` varchar(255) NOT NULL,
  `fecha_creacion` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,'¿Quién fue el primer Avenger?','Opción múltiple','Historia','Steve Rogers','2023-01-01'),(2,'¿Qué elemento alimenta el reactor ARC de Tony Stark?','Opción múltiple','Ciencia','Palladium','2023-01-02'),(3,'¿Cuál es el nombre del alter ego de Bruce Banner?','Opción múltiple','Personajes','Hulk','2023-01-03'),(4,'¿En qué ciudad vive Peter Parker?','Opción múltiple','Geografía','New York','2023-01-04'),(5,'¿Qué material es el escudo del Capitán América?','Opción múltiple','Materiales','Vibranium','2023-01-05');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `datos` varchar(255) DEFAULT NULL,
  `plantillas_reporte` varchar(255) NOT NULL,
  `fecha_generacion` date NOT NULL,
  `evaluacion_id` int NOT NULL,
  `curso_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_reportes_evaluacion_id` (`evaluacion_id`),
  KEY `FK_reportes_curso_id` (`curso_id`),
  CONSTRAINT `FK_reportes_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  CONSTRAINT `FK_reportes_evaluacion_id` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluaciones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuestas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alumno_id` int NOT NULL,
  `pregunta_id` int NOT NULL,
  `respuesta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_respuestas_alumno_id` (`alumno_id`),
  KEY `FK_respuestas_pregunta_id` (`pregunta_id`),
  CONSTRAINT `FK_respuestas_alumno_id` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  CONSTRAINT `FK_respuestas_pregunta_id` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (16,2,1,'Steve Rogers'),(17,3,2,'Palladium'),(18,4,3,'Hulk'),(19,5,4,'New York'),(20,6,5,'Vibranium');
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eduplan_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `GeneraEvaluacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GeneraEvaluacion`(
    IN curso_id_param INT,
    IN num_preguntas INT
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE alumno_id INT;
    DECLARE pregunta_id INT;
    DECLARE evaluacion_id INT;
    DECLARE preguntas_cursor CURSOR FOR
        SELECT id FROM preguntas ORDER BY RAND() LIMIT num_preguntas;
    DECLARE alumnos_cursor CURSOR FOR
        SELECT a.id FROM alumnos a
        JOIN alumnos_cursos ac ON a.id = ac.alumno_id
        WHERE ac.curso_id = curso_id_param;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Abrir cursor para alumnos
    OPEN alumnos_cursor;
    alumnos_loop: LOOP
        FETCH alumnos_cursor INTO alumno_id;
        IF done THEN
            LEAVE alumnos_loop;
        END IF;

        -- Crear una evaluación para cada alumno
        INSERT INTO evaluaciones (alumno_id, criterios_evaluacion, responsables, fecha_evaluacion)
        VALUES (alumno_id, 'Criterios Generales', 'Sistema', CURDATE());
        SET evaluacion_id = LAST_INSERT_ID();

        -- Abrir cursor para preguntas
        OPEN preguntas_cursor;
        preguntas_loop: LOOP
            FETCH preguntas_cursor INTO pregunta_id;
            IF done THEN
                LEAVE preguntas_loop;
            END IF;

            -- Asignar preguntas a la evaluación
            INSERT INTO respuestas (alumno_id, pregunta_id)
            VALUES (alumno_id, pregunta_id);
        END LOOP;
        CLOSE preguntas_cursor;
    END LOOP;
    CLOSE alumnos_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-24 14:37:25
