-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: eduplan_app
-- ------------------------------------------------------
-- Server version    8.0.31

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
/*!40101 SET @saved_cs_client = @@character_set_client */;
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
  `fecha_inscripcion` date NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `empresa_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_alumnos_email` (`email`),
  KEY `FK_alumnos_empresa_id` (`empresa_id`),
  CONSTRAINT `FK_alumnos_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES 
(1,'Carlos','Andrés','Pérez','Gómez','Carlos Pérez','789 Elm St.','555-1234','carlos.perez@example.com','Ingeniero en Sistemas','DNI','12345678','2024-01-10','1995-06-15',1),
(2,'Ana','María','Ramos','Lopez','Ana Ramos','123 Maple Ave.','555-5678','ana.ramos@example.com','Licenciada en Informática','DNI','23456789','2024-02-15','1994-08-22',2),
(3,'Luis','Fernando','González','Martínez','Luis González','456 Oak St.','555-9012','luis.gonzalez@example.com','Maestro en Ciencias de Datos','DNI','34567890','2024-03-20','1993-12-05',3),
(4,'María','José','Rodríguez','Torres','María Rodríguez','789 Pine St.','555-3456','maria.rodriguez@example.com','Ingeniera en Computación','DNI','45678901','2024-04-25','1992-11-10',4),
(5,'Jorge','Luis','Fernández','Castro','Jorge Fernández','123 Cedar St.','555-7890','jorge.fernandez@example.com','Licenciado en Matemáticas','DNI','56789012','2024-05-30','1990-02-14',5),
(6,'Lucía','Elena','Sánchez','Ramírez','Lucía Sánchez','456 Birch St.','555-0123','lucia.sanchez@example.com','Ingeniera en Telecomunicaciones','DNI','67890123','2024-06-05','1996-07-20',6),
(7,'Juan','Carlos','Gutiérrez','Núñez','Juan Gutiérrez','789 Spruce St.','555-4567','juan.gutierrez@example.com','Técnico en Redes','DNI','78901234','2024-07-10','1995-10-18',7);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos_cursos`
--

DROP TABLE IF EXISTS `alumnos_cursos`;
CREATE TABLE `alumnos_cursos` (
  `alumno_id` int NOT NULL,
  `curso_id` int NOT NULL,
  PRIMARY KEY (`alumno_id`, `curso_id`),
  KEY `FK_alumnos_cursos_curso_id` (`curso_id`),
  CONSTRAINT `FK_alumnos_cursos_alumno_id` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_alumnos_cursos_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos_cursos`
--

LOCK TABLES `alumnos_cursos` WRITE;
/*!40000 ALTER TABLE `alumnos_cursos` DISABLE KEYS */;
INSERT INTO `alumnos_cursos` VALUES 
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7), (3, 8),
(4, 1), (4, 3),
(5, 2), (5, 4), (5, 6),
(6, 7), (6, 8),
(7, 1), (7, 5);
/*!40000 ALTER TABLE `alumnos_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `duracion` varchar(255) DEFAULT NULL,
  `objetivos` varchar(255) NOT NULL,
  `responsables` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `status` int DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES 
(1,'Introducción a Python','Curso básico de Python para principiantes.','4 semanas','Aprender los fundamentos de Python.','Alice Johnson','2024-01-20','2024-02-20',1),
(2,'Desarrollo Web con JavaScript','Curso de desarrollo web utilizando JavaScript.','6 semanas','Crear aplicaciones web interactivas.','Bob White','2024-02-01','2024-03-15',1),
(3,'Fundamentos de Inteligencia Artificial','Curso sobre los conceptos básicos de IA.','8 semanas','Comprender los principios de la IA y machine learning.','Carol Green','2024-03-01','2024-04-30',1),
(4,'Programación en Java','Curso avanzado de programación en Java.','10 semanas','Desarrollar aplicaciones robustas en Java.','Danielle Adams','2024-04-10','2024-06-20',1),
(5,'Análisis de Datos con SQL','Curso de análisis de datos utilizando SQL.','5 semanas','Analizar y manipular datos con SQL.','Evan Miller','2024-05-15','2024-06-20',1),
(6,'Seguridad en la Nube','Curso sobre prácticas de seguridad en la nube.','7 semanas','Garantizar la seguridad en entornos en la nube.','Fiona Davis','2024-06-01','2024-07-18',1),
(7,'Desarrollo de Aplicaciones Móviles','Curso de desarrollo de aplicaciones para móviles.','8 semanas','Crear aplicaciones móviles para iOS y Android.','George Wilson','2024-07-05','2024-08-30',1),
(8,'Machine Learning Avanzado','Curso avanzado de machine learning.','9 semanas','Implementar modelos avanzados de machine learning.','Hannah Lee','2024-08-15','2024-10-15',1);

/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `fecha_fundacion` date NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_empresa_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES 
(1,'Tech Solutions','Empresa dedicada a soluciones tecnológicas.','Tecnología','2005-03-15','456 Tech Rd.','555-4321','contact@techsolutions.com'),
(2,'EduPlan Inc.','Empresa enfocada en educación y capacitación.','Educación','2010-08-22','123 Edu St.','555-8765','info@eduplan.com'),
(3,'Data Analytics Co.','Compañía especializada en análisis de datos.','Consultoría','2015-11-30','789 Data Ave.','555-2345','support@dataanalytics.com'),
(4,'Web Innovations','Desarrolladores de aplicaciones web y móviles.','Tecnología','2012-02-01','456 Web St.','555-6789','contact@webinnovations.com'),
(5,'Cyber Security Corp.','Líder en soluciones de ciberseguridad.','Seguridad','2008-05-20','123 Cyber St.','555-3456','security@cybercorp.com'),
(6,'Cloud Services LLC','Servicios en la nube y consultoría.','Servicios en la Nube','2018-06-18','321 Cloud St.','555-9876','info@cloudservices.com'),
(7,'Mobile Apps Inc.','Desarrollo de aplicaciones móviles.','Tecnología','2020-01-10','654 Mobile St.','555-6543','info@mobileapps.com');

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
  `curso_id` int NOT NULL,
  `calificacion` varchar(255) DEFAULT NULL,
  `retroalimentacion` varchar(255) DEFAULT NULL,
  `criterios_evaluacion` varchar(255) NOT NULL,
  `responsables` varchar(100) NOT NULL,
  `fecha_evaluacion` date NOT NULL,
  `planificacion_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_evaluaciones_alumno_id` (`alumno_id`),
  KEY `FK_evaluaciones_curso_id` (`curso_id`),
  KEY `FK_evaluaciones_planificacion_id` (`planificacion_id`),
  CONSTRAINT `FK_evaluaciones_alumno_id` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  CONSTRAINT `FK_evaluaciones_planificacion_id` FOREIGN KEY (`planificacion_id`) REFERENCES `planificaciones` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluaciones`
--

LOCK TABLES `evaluaciones` WRITE;
/*!40000 ALTER TABLE `evaluaciones` DISABLE KEYS */;
INSERT INTO `evaluaciones` VALUES (1,1,1,'Excelente','Muy bien hecho','Criterios básicos','Juan Pérez','2024-08-27',NULL),(2,2,1,'Bueno','Buen trabajo, pero puede mejorar','Criterios básicos','Ana Gómez','2024-08-28',NULL),(3,3,2,'Satisfactorio','Cumple con los requisitos mínimos','Criterios intermedios','Luis Martínez','2024-08-29',NULL),(4,4,2,'Excelente','Superó todas las expectativas','Criterios avanzados','Laura López','2024-08-30',NULL),(5,5,3,'Deficiente','Requiere mejoras significativas','Criterios básicos','Carlos Rodríguez','2024-08-31',NULL),(6,6,3,'Bueno','Agradable, pero con áreas de mejora','Criterios básicos','María Fernández','2024-09-01',NULL),(7,7,4,'Excelente','Trabajo excepcional','Criterios avanzados','Pedro Ramírez','2024-09-02',NULL),(8,8,4,'Satisfactorio','Aprobado con algunas observaciones','Criterios intermedios','Isabel García','2024-09-03',NULL),(9,9,5,'Muy Bueno','Gran esfuerzo y dedicación','Criterios avanzados','José Hernández','2024-09-04',NULL),(10,10,5,'Regular','Suficiente para pasar','Criterios básicos','Elena Morales','2024-09-05',NULL);
/*!40000 ALTER TABLE `evaluaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluaciones_respuestas`
--

DROP TABLE IF EXISTS `evaluaciones_respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluaciones_respuestas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `evaluacion_id` int NOT NULL,
  `respuesta_id` int NOT NULL,
  `calificacion_obtenida` int DEFAULT '0',
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_evaluacion_id` (`evaluacion_id`),
  KEY `idx_respuesta_id` (`respuesta_id`),
  CONSTRAINT `FK_evaluaciones_respuestas_evaluacion_id` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluaciones` (`id`),
  CONSTRAINT `FK_evaluaciones_respuestas_respuesta_id` FOREIGN KEY (`respuesta_id`) REFERENCES `respuestas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluaciones_respuestas`
--

LOCK TABLES `evaluaciones_respuestas` WRITE;
/*!40000 ALTER TABLE `evaluaciones_respuestas` DISABLE KEYS */;
INSERT INTO `evaluaciones_respuestas` VALUES (1,1,1,10,'2024-08-28 15:00:00'),(2,2,2,8,'2024-08-29 16:00:00'),(3,3,3,10,'2024-08-30 17:00:00'),(4,4,4,9,'2024-08-31 18:00:00'),(5,5,5,10,'2024-09-01 19:00:00'),(6,6,6,8,'2024-09-02 20:00:00'),(7,7,7,10,'2024-09-03 21:00:00'),(8,8,8,9,'2024-09-04 22:00:00'),(9,9,9,10,'2024-09-05 23:00:00'),(10,10,10,10,'2024-09-07 00:00:00');
/*!40000 ALTER TABLE `evaluaciones_respuestas` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planificaciones`
--

LOCK TABLES `planificaciones` WRITE;
/*!40000 ALTER TABLE `planificaciones` DISABLE KEYS */;
INSERT INTO `planificaciones` VALUES (16,1,'Lunes 09:00-11:00',1,'Planificación del primer módulo','Juan Pérez','2024-08-01'),(17,2,'Martes 10:00-12:00',2,'Planificación de prácticas de química','Ana López','2024-08-02'),(18,3,'Miércoles 14:00-16:00',3,'Planificación de estructuras metálicas','Carlos Gómez','2024-08-03'),(19,4,'Jueves 09:00-11:00',4,'Planificación de derecho penal','Laura García','2024-08-04'),(20,5,'Viernes 11:00-13:00',5,'Planificación de psicología clínica','Luis Martínez','2024-08-05'),(21,6,'Lunes 13:00-15:00',6,'Planificación de historia del arte','Marta Rodríguez','2024-08-06'),(22,7,'Martes 15:00-17:00',7,'Planificación de comunicación efectiva','Ricardo Hernández','2024-08-07'),(23,8,'Miércoles 16:00-18:00',8,'Planificación de historia universal','Verónica Gómez','2024-08-08'),(24,9,'Jueves 14:00-16:00',9,'Planificación de política internacional','Felipe Ruiz','2024-08-09'),(25,10,'Viernes 09:00-11:00',10,'Planificación de matemáticas avanzadas','Santiago Martínez','2024-08-10');
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
  `curso_id` int NOT NULL,
  `pregunta` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `respuesta_correcta` varchar(255) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_curso_id` (`curso_id`),
  CONSTRAINT `FK_preguntas_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,1,'¿Qué es un algoritmo?','Multiple Choice','Un conjunto de instrucciones para realizar una tarea','2024-08-01','Fundamentos',1),(2,2,'¿Qué es un isómero?','Multiple Choice','Compuestos con la misma fórmula pero diferente estructura','2024-08-02','Química',1),(3,3,'¿Cuál es la fórmula de la resistencia de un material?','Multiple Choice','R = V/I','2024-08-03','Ingeniería',1),(4,4,'¿Qué es la teoría del delito?','Multiple Choice','Conjunto de principios que determinan la existencia de un delito','2024-08-04','Derecho',1),(5,5,'¿Qué es el psicoanálisis?','Multiple Choice','Método de tratamiento psicológico basado en el inconsciente','2024-08-05','Psicología',1),(6,6,'¿Qué es una obra de arte?','Multiple Choice','Creación artística que tiene valor estético','2024-08-06','Arte',1),(7,7,'¿Qué es un mensaje asertivo?','Multiple Choice','Un mensaje claro y directo que respeta a los demás','2024-08-07','Comunicación',1),(8,8,'¿Cuál es la importancia de la Revolución Francesa?','Multiple Choice','Transformó la estructura social y política de Francia','2024-08-08','Historia',1),(9,9,'¿Qué son las relaciones diplomáticas?','Multiple Choice','Interacciones entre países para mantener la paz','2024-08-09','Política',1),(10,10,'¿Qué es el cálculo diferencial?','Multiple Choice','Área de las matemáticas que estudia el cambio','2024-08-10','Matemáticas',1);
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuestas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pregunta_id` int NOT NULL,
  `respuesta` varchar(255) NOT NULL,
  `valoracion` tinyint(1) DEFAULT '0',
  `calificacion` int DEFAULT '0',
  `fecha_respuesta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_pregunta_id` (`pregunta_id`),
  CONSTRAINT `FK_respuestas_pregunta_id` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (1,1,'Un conjunto de instrucciones para realizar una tarea',5,10,'2024-08-01 15:00:00'),(2,2,'Compuestos con la misma fórmula pero diferente estructura',4,8,'2024-08-02 16:00:00'),(3,3,'R = V/I',5,10,'2024-08-03 17:00:00'),(4,4,'Conjunto de principios que determinan la existencia de un delito',4,9,'2024-08-04 18:00:00'),(5,5,'Método de tratamiento psicológico basado en el inconsciente',5,10,'2024-08-05 19:00:00'),(6,6,'Creación artística que tiene valor estético',4,8,'2024-08-06 20:00:00'),(7,7,'Un mensaje claro y directo que respeta a los demás',5,10,'2024-08-07 21:00:00'),(8,8,'Transformó la estructura social y política de Francia',4,9,'2024-08-08 22:00:00'),(9,9,'Interacciones entre países para mantener la paz',5,10,'2024-08-09 23:00:00'),(10,10,'Área de las matemáticas que estudia el cambio',5,10,'2024-08-11 00:00:00');
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `permissions` json NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','{\"read\": true, \"create\": true, \"delete\": true, \"update\": true}','2024-08-28 15:00:00','2024-08-28 15:00:00'),(2,'Editor','{\"read\": true, \"create\": true, \"delete\": false, \"update\": true}','2024-08-29 16:00:00','2024-08-29 16:00:00'),(3,'Viewer','{\"read\": true, \"create\": false, \"delete\": false, \"update\": false}','2024-08-30 17:00:00','2024-08-30 17:00:00');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `full_name` varchar(250) DEFAULT NULL,
  `document` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `created_user_id` int NOT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`id_rol`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Juan Pérez','1234567890','juan.perez','hashedpassword1','juan.perez@example.com','2024-08-28 15:00:00.000000',1,'2024-08-28 15:00:00.000000',1),(2,2,'María González','0987654321','maria.gonzalez','hashedpassword2','maria.gonzalez@example.com','2024-08-29 16:00:00.000000',1,'2024-08-29 16:00:00.000000',1),(3,3,'Carlos Ruiz','1122334455','carlos.ruiz','hashedpassword3','carlos.ruiz@example.com','2024-08-30 17:00:00.000000',1,'2024-08-30 17:00:00.000000',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eduplan_app'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-28  1:14:54
