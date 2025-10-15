CREATE DATABASE  IF NOT EXISTS `hotel_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel_db`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_db
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `reservation_line`
--

DROP TABLE IF EXISTS `reservation_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reservation_id` bigint DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  `price_per_night` decimal(38,2) DEFAULT NULL,
  `nights` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_res_line_reservation` (`reservation_id`),
  KEY `fk_res_line_room` (`room_id`),
  CONSTRAINT `fk_res_line_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`),
  CONSTRAINT `fk_res_line_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_line`
--

LOCK TABLES `reservation_line` WRITE;
/*!40000 ALTER TABLE `reservation_line` DISABLE KEYS */;
INSERT INTO `reservation_line` VALUES (2,2,12,4200.00,2),(6,6,7,3000.00,6),(8,8,10,2200.00,1),(9,9,25,5500.00,4),(10,10,14,4000.00,2),(11,11,30,4800.00,3),(12,12,21,2600.00,5),(13,13,33,7000.00,7),(14,14,28,3200.00,2),(15,15,40,3700.00,3),(16,16,35,2900.00,2),(17,17,44,5200.00,6),(18,18,38,4100.00,4),(20,20,50,6500.00,5),(23,3,21,3333.33,3),(27,4,34,8000.00,5),(31,22,6,4200.00,4),(39,7,18,2000.00,3),(40,5,21,999.33,30),(41,29,1,2000.00,1),(42,19,48,2300.00,1),(44,30,12,20000.00,2),(45,1,12,8000.00,1);
/*!40000 ALTER TABLE `reservation_line` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 15:38:56
