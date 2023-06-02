-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: victoryapi
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `boxeador`
--

DROP TABLE IF EXISTS `boxeador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boxeador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `age` int DEFAULT NULL,
  `record` varchar(50) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `trainer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_boxeador_categoria` (`category`),
  CONSTRAINT `fk_boxeador_categoria` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boxeador`
--

LOCK TABLES `boxeador` WRITE;
/*!40000 ALTER TABLE `boxeador` DISABLE KEYS */;
INSERT INTO `boxeador` VALUES (12,'Muhammad','Ali',200.5,1.91,35,'56-5',1,'United States','Louisville','Angelo Dundee'),(13,'Mike','Tyson',220.3,1.78,55,'50-6',2,'United States','Brooklyn','Cus D\'Amato'),(14,'Floyd','Mayweather Jr.',150.7,1.73,44,'50-0',3,'United States','Grand Rapids','Floyd Mayweather Sr.'),(15,'Manny','Pacquiao',145.9,1.66,42,'62-7-2',3,'Philippines','General Santos','Freddie Roach'),(16,'Sugar','Ray Robinson',157.8,1.8,67,'173-19-6',4,'United States','Detroit','George Gainford'),(17,'Roberto','Durán',155.2,1.7,70,'103-16',4,'Panama','Panama City','Ray Arcel'),(18,'Rocky','Marciano',192.8,1.78,45,'49-0',5,'United States','Brockton','Charlie Goldman'),(19,'Lennox','Lewis',245.2,1.96,56,'41-2-1',6,'United Kingdom','London','Emanuel Steward'),(20,'Roy','Jones Jr.',199.1,1.8,52,'66-9',7,'United States','Pensacola','Alton Merkerson'),(21,'Joe','Louis',209.8,1.85,66,'66-3',8,'United States','Lafayette','Jack Blackburn'),(22,'George','Foreman',253.6,1.93,72,'76-5',8,'United States','Marshall','Dick Sadler'),(23,'Oscar','De La Hoya',154.2,1.79,49,'39-6',9,'United States','Los Angeles','Freddie Roach'),(24,'Evander','Holyfield',220.5,1.84,59,'44-10-2',10,'United States','Atmore','Don Turner'),(25,'Larry','Holmes',221,1.91,71,'69-6',10,'United States','Cuthbert','Eddie Futch'),(26,'Joe','Frazier',214.3,1.8,67,'32-4-1',11,'United States','Beaufort','Eddie Futch'),(27,'Mike','Spinks',201.8,1.88,65,'31-1',11,'United States','St. Louis','Jesse Reid'),(28,'Marvin','Hagler',160.5,1.73,66,'62-3-2',12,'United States','Newark','Goody Petronelli'),(29,'Sonny','Liston',215.6,1.88,38,'50-4',12,'United States','Sand Slough','Willie Reddish'),(30,'Bernard','Hopkins',172.6,1.85,57,'55-8-2',13,'United States','Philadelphia','Bouie Fisher'),(31,'Riddick','Bowe',244.7,1.96,54,'43-1',13,'United States','Brooklyn','Eddie Futch'),(32,'Carlos','Monzón',159.8,1.83,52,'87-3-9',14,'Argentina','San Javier','Amílcar Brusa'),(33,'Ezzard','Charles',182.4,1.85,53,'93-25-1',14,'United States','Lawrenceville','Ray Arcel'),(34,'Jack','Dempsey',195.1,1.88,87,'66-6-11',15,'United States','Manassa','Jack Kearns'),(35,'Gene','Tunney',194.2,1.86,81,'64-1-1',15,'United States','New York City','Jimmy DeForest'),(36,'Tommy','Hearns',154.9,1.85,63,'61-5-1',16,'United States','Memphis','Emanuel Steward'),(37,'Marco Antonio','Barrera',126.8,1.7,48,'67-7',17,'Mexico','Mexico City','Eduardo Garcia'),(38,'Julio César','Chávez',147.6,1.73,59,'107-6-2',17,'Mexico','Culiacán','Nacho Beristáin'),(39,'Felix','Trinidad',154.3,1.79,48,'42-3',18,'Puerto Rico','Cupey','Don King'),(40,'Miguel','Cotto',154.6,1.7,41,'41-6',18,'Puerto Rico','Caguas','Freddie Roach'),(41,'Wilfred','Benítez',146.7,1.68,63,'53-8-1',19,'Puerto Rico','San Juan','Ray Arcel'),(42,'Pernell','Whitaker',146.9,1.65,55,'40-4-1',19,'United States','Norfolk','George Benton'),(43,'Naseem','Hamed',125.9,1.62,48,'36-1',20,'United Kingdom','Sheffield','Brendan Ingle'),(44,'Ricky','Hatton',140.4,1.7,44,'45-3',20,'United Kingdom','Manchester','Billy Graham'),(45,'Prince','Naseem Hamed',125.9,1.62,48,'36-1',20,'United Kingdom','Sheffield','Brendan Ingle'),(46,'Ricky','Hatton',140.4,1.7,44,'45-3',20,'United Kingdom','Manchester','Billy Graham'),(47,'Vasyl','Lomachenko',135.7,1.75,33,'15-2',21,'Ukraine','Bilhorod-Dnistrovskyi','Anatoly Lomachenko'),(48,'Manny','Pacquiao',145.9,1.66,42,'62-7-2',21,'Philippines','General Santos','Freddie Roach'),(49,'Juan Manuel','Marquez',142,1.68,48,'56-7-1',22,'Mexico','Mexico City','Ignacio Beristáin'),(50,'Timothy','Bradley',147.2,1.7,38,'33-2-1',22,'United States','Cathedral City','Joel Diaz'),(51,'Floyd','Mayweather Jr.',150.7,1.73,44,'50-0',23,'United States','Grand Rapids','Floyd Mayweather Sr.'),(52,'Miguel\", \"Mickey\"','García',135.4,1.75,34,'41-1',23,'United States','Oxnard','Robert Garcia'),(53,'Terence','Crawford',147.2,1.73,34,'37-0',24,'United States','Omaha','Brian McIntyre'),(54,'Errol','Spence Jr.',147.9,1.8,31,'27-0',24,'United States','DeSoto','Derrick James'),(55,'Gennady','Golovkin',160.2,1.78,39,'41-1-1',25,'Kazakhstan','Karaganda','Abel Sanchez'),(56,'Canelo','Álvarez',168,1.75,31,'56-2-2',25,'Mexico','Guadalajara','Eddy Reynoso'),(57,'Anthony','Joshua',240.3,1.98,32,'24-1',26,'United Kingdom','Watford','Rob McCracken'),(58,'Tyson','Fury',270.4,2.06,33,'30-0-1',26,'United Kingdom','Manchester','SugarHill Steward');
/*!40000 ALTER TABLE `boxeador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `minimum_weight` float NOT NULL,
  `maximum_weight` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Peso mosca',108,112),(2,'Peso gallo',115,118),(3,'Peso pluma',126,130),(4,'Peso ligero',135,140),(5,'Peso welter',147,154),(6,'Peso medio',160,168),(7,'Peso semipesado',168,175),(8,'Peso pesado',200,300);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpointlogs`
--

DROP TABLE IF EXISTS `endpointlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endpointlogs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `endpoint` varchar(255) NOT NULL,
  `startTime` datetime NOT NULL,
  `register_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpointlogs`
--

LOCK TABLES `endpointlogs` WRITE;
/*!40000 ALTER TABLE `endpointlogs` DISABLE KEYS */;
INSERT INTO `endpointlogs` VALUES (1,1,'get_boxeadores','2023-05-09 20:18:20','2023-05-09 19:52:31'),(2,1,'get_boxeadores','2023-05-09 20:32:12','2023-05-09 19:52:31'),(3,1,'get_boxeadores','2023-05-09 20:32:14','2023-05-09 19:52:31'),(4,1,'get_boxeadores','2023-05-09 20:32:14','2023-05-09 19:52:31'),(5,1,'get_boxeadores','2023-05-09 20:32:15','2023-05-09 19:52:31'),(6,1,'get_boxeadores','2023-05-09 20:32:15','2023-05-09 19:52:31'),(7,1,'get_boxeadores','2023-05-09 20:32:16','2023-05-09 19:52:31'),(8,1,'get_boxeadores','2023-05-09 20:44:13','2023-05-09 19:52:31'),(9,1,'get_boxeadores','2023-05-09 20:44:15','2023-05-09 19:52:31'),(10,1,'get_boxeadores','2023-05-09 20:44:16','2023-05-09 19:52:31'),(11,1,'get_boxeadores','2023-05-09 20:44:17','2023-05-09 19:52:31'),(12,1,'get_boxeadores','2023-05-09 20:44:17','2023-05-09 19:52:31'),(13,1,'get_boxeadores','2023-05-09 20:46:54','2023-05-09 19:52:31'),(14,1,'get_categorias','2023-05-09 20:46:58','2023-05-09 19:52:31'),(15,2,'get_boxeadores','2023-06-02 11:02:15','2023-06-02 11:01:03');
/*!40000 ALTER TABLE `endpointlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenadores`
--

DROP TABLE IF EXISTS `entrenadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `age` int DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `trained_boxer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_boxeador_entrenado` (`trained_boxer_id`),
  CONSTRAINT `entrenadores_ibfk_1` FOREIGN KEY (`trained_boxer_id`) REFERENCES `boxeador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenadores`
--

LOCK TABLES `entrenadores` WRITE;
/*!40000 ALTER TABLE `entrenadores` DISABLE KEYS */;
INSERT INTO `entrenadores` VALUES (1,'Cus D\'Amato',77,'Estados Unidos','Entrenador de Mike Tyson',1),(2,'Angelo Dundee',91,'Estados Unidos','Entrenador de Muhammad Ali',2),(3,'Freddie Roach',61,'Estados Unidos','Entrenador de Manny Pacquiao',3),(4,'Floyd Mayweather Sr.',70,'Estados Unidos','Entrenador de Floyd Mayweather Jr.',4),(5,'Eddy Reynoso',46,'México','Entrenador de Canelo Álvarez',5),(6,'Eddy Reynoso',46,'México','Entrenador de Ryan García',6),(7,'Calvin Ford',65,'Estados Unidos','Entrenador de Gervonta Davis',7);
/*!40000 ALTER TABLE `entrenadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadios`
--

DROP TABLE IF EXISTS `estadios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `capacity` int DEFAULT NULL,
  `inaugurated` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadios`
--

LOCK TABLES `estadios` WRITE;
/*!40000 ALTER TABLE `estadios` DISABLE KEYS */;
INSERT INTO `estadios` VALUES (1,'Madison Square Garden','Nueva York',20000,'1968-02-11'),(2,'T-Mobile Arena','Las Vegas',20000,'2016-04-06'),(3,'MGM Grand Garden Arena','Las Vegas',17157,'1993-12-18'),(4,'Estadio Azteca','Ciudad de México',87000,'1966-05-29');
/*!40000 ALTER TABLE `estadios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadios_boxeo`
--

DROP TABLE IF EXISTS `estadios_boxeo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadios_boxeo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `capacidad` int DEFAULT NULL,
  `inaugurado` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadios_boxeo`
--

LOCK TABLES `estadios_boxeo` WRITE;
/*!40000 ALTER TABLE `estadios_boxeo` DISABLE KEYS */;
INSERT INTO `estadios_boxeo` VALUES (1,'Madison Square Garden','Nueva York',20000,'1968-02-11'),(2,'T-Mobile Arena','Las Vegas',20000,'2016-04-06'),(3,'MGM Grand Garden Arena','Las Vegas',17157,'1993-12-18'),(4,'Estadio Azteca','Ciudad de México',87000,'1966-05-29');
/*!40000 ALTER TABLE `estadios_boxeo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `token` text,
  `browser` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `expiresAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (4,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY4MzY4Nzg0OCwianRpIjoiMGY3MTJhMmEtY2I5Ni00NmQxLWJlZjItZTc5OGY4ZmQxMmRkIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MSwibmJmIjoxNjgzNjg3ODQ4LCJleHAiOjE2ODM2ODg3NDh9.LwPBGvZ9msD2P6mcHRn4t6HFxHzclC8xaKOYU7NVKL0','Edge','Windows','2023-05-09 20:04:08','2023-05-09 20:14:08'),(5,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY4MzY4OTUyMiwianRpIjoiNDAyZTZjOTgtNjc0Mi00MzdlLWE4ZjMtNWIxZWMwODliYzFiIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MSwibmJmIjoxNjgzNjg5NTIyLCJleHAiOjE2ODM2OTA0MjJ9.Ag7N2yQGq5uQKInGyYeGwByRRewQNSai_JpUXvzAsJI','Edge','Windows','2023-05-09 20:32:03','2023-05-09 20:42:03'),(6,2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY4NTcyODg2MywianRpIjoiNTUzZWU0M2UtNGQxMS00ZmMyLTkxMTItYTdjOTJjYmIyMmFkIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MiwibmJmIjoxNjg1NzI4ODYzLCJleHAiOjE2ODU3Mjk3NjN9.im-v0fgC8RWEIbE65qZqRuy1QF422hjwG_IiAoYiYLQ','Edge','Windows','2023-06-02 11:01:03','2023-06-02 11:11:03');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'alanmuro','1bb1273bf172e13456238f8554b97c073a8df2e386de511d27ad3bb8d6b8b1c2','2023-05-09 19:52:31'),(2,'alanmuro21','8db271303186cdf7bf6339cdb8534a2ed5742c9ed61d83050968268087db6765','2023-06-02 11:01:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-02 11:13:31
