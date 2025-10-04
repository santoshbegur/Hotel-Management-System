-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_db
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hotel_id` bigint DEFAULT NULL,
  `room_number` varchar(255) DEFAULT NULL,
  `room_type_id` bigint DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_room_per_hotel` (`room_number`,`hotel_id`),
  UNIQUE KEY `UK4ebdthvd3ohrurfgtgul0ao7w` (`room_number`,`hotel_id`),
  KEY `fk_room_hotel` (`hotel_id`),
  KEY `fk_room_type` (`room_type_id`),
  CONSTRAINT `fk_room_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  CONSTRAINT `fk_room_type` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,1,'101',3,1,'Maintenance'),(2,1,'102',2,1,'Available'),(3,1,'201',3,2,'Available'),(4,1,'202',4,2,'Reserved'),(5,1,'301',5,3,'Occupied'),(6,2,'101',7,1,'Maintenance'),(7,2,'102',2,1,'Occupied'),(8,2,'201',3,2,'Available'),(9,2,'202',4,2,'Reserved'),(10,2,'301',5,3,'Available'),(11,3,'101',1,1,'Available'),(12,3,'102',2,1,'Maintenance'),(13,3,'201',3,2,'Available'),(14,3,'202',4,2,'Occupied'),(15,3,'301',5,3,'Available'),(16,4,'101',1,1,'Reserved'),(17,4,'102',2,1,'Available'),(18,4,'201',3,2,'Available'),(19,4,'202',4,2,'Occupied'),(20,4,'301',5,3,'Maintenance'),(21,5,'101',1,1,'Available'),(22,5,'102',2,1,'Available'),(23,5,'201',3,2,'Occupied'),(24,5,'202',4,2,'Available'),(25,5,'301',5,3,'Reserved'),(26,6,'101',1,1,'Available'),(27,6,'102',2,1,'Reserved'),(28,6,'201',3,2,'Available'),(29,6,'202',4,2,'Occupied'),(30,6,'301',5,3,'Available'),(31,7,'101',1,1,'Maintenance'),(32,7,'102',2,1,'Available'),(33,7,'201',3,2,'Reserved'),(34,7,'202',4,2,'Available'),(35,7,'301',5,3,'Available'),(36,8,'101',1,1,'Available'),(37,8,'102',2,1,'Available'),(38,8,'201',3,2,'Occupied'),(39,8,'202',4,2,'Available'),(40,8,'301',5,3,'Reserved'),(41,9,'101',1,1,'Available'),(42,9,'102',2,1,'Occupied'),(43,9,'201',3,2,'Available'),(44,9,'202',4,2,'Reserved'),(45,9,'301',5,3,'Available'),(46,10,'101',1,1,'Available'),(47,10,'102',2,1,'Reserved'),(48,10,'201',3,2,'Available'),(49,10,'202',4,2,'Occupied'),(50,10,'301',5,3,'Available'),(51,11,'101',1,1,'Available'),(52,11,'102',2,1,'Available'),(53,11,'201',3,2,'Maintenance'),(54,11,'202',4,2,'Available'),(55,11,'301',5,3,'Reserved'),(56,12,'101',1,1,'Available'),(57,12,'102',2,1,'Reserved'),(58,12,'201',3,2,'Available'),(59,12,'202',4,2,'Occupied'),(60,12,'301',5,3,'Available'),(61,13,'101',1,1,'Maintenance'),(62,13,'102',2,1,'Available'),(63,13,'201',3,2,'Reserved'),(64,13,'202',4,2,'Available'),(65,13,'301',5,3,'Available'),(66,14,'101',1,1,'Available'),(67,14,'102',2,1,'Occupied'),(68,14,'201',3,2,'Available'),(69,14,'202',4,2,'Reserved'),(70,14,'301',5,3,'Available'),(71,15,'101',1,1,'Available'),(72,15,'102',2,1,'Reserved'),(73,15,'201',3,2,'Available'),(74,15,'202',4,2,'Occupied'),(75,15,'301',5,3,'Available'),(76,16,'101',1,1,'Available'),(77,16,'102',2,1,'Available'),(78,16,'201',3,2,'Reserved'),(79,16,'202',4,2,'Available'),(80,16,'301',5,3,'Occupied'),(81,17,'101',1,1,'Maintenance'),(82,17,'102',2,1,'Available'),(83,17,'201',3,2,'Available'),(84,17,'202',4,2,'Reserved'),(85,17,'301',5,3,'Available'),(86,18,'101',1,1,'Available'),(87,18,'102',2,1,'Available'),(88,18,'201',3,2,'Occupied'),(89,18,'202',4,2,'Reserved'),(90,18,'301',5,3,'Available'),(91,19,'101',1,1,'Available'),(92,19,'102',2,1,'Reserved'),(93,19,'201',3,2,'Available'),(94,19,'202',4,2,'Available'),(95,19,'301',5,3,'Occupied'),(96,20,'101',1,1,'Available'),(97,20,'102',2,1,'Available'),(98,20,'201',3,2,'Reserved'),(99,20,'202',4,2,'Available'),(100,20,'301',5,3,'Available'),(101,1,'302',4,3,'Available');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-04 21:47:06
