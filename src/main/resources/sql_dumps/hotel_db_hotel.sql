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
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_hotel` (`name`,`address`(191),`phone`,`timezone`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'The Oberoi Bangalore','37-38 Mahatma Gandhi Road, Bengaluru, India','+91-80-22044987','Asia/Kolkata','2024-01-14 17:35:25'),(2,'Taj Palace Delhi','2 Sardar Patel Marg, Diplomatic Enclave, New Delhi, India','+91-11-26110202','Asia/Kolkata','2024-02-09 21:42:55'),(3,'ITC Grand Chola','63 Mount Road, Guindy, Chennai, India','+91-44-22200322','Asia/Kolkata','2024-02-04 22:42:47'),(4,'The Leela Mumbai','Sahar, Andheri East, Mumbai, India','+91-22-66911234','Asia/Kolkata','2024-04-11 19:15:33'),(5,'Hyatt Regency Kolkata','JA-1, Salt Lake City, Kolkata, India','+91-33-23351234','Asia/Kolkata','2024-05-05 00:25:48'),(6,'Radisson Blu Jaipur','Plot No. 5 & 6, Airport Plaza, Jaipur, India','+91-141-4055555','Asia/Kolkata','2024-05-21 19:51:17'),(7,'Marriott Hyderabad','Tank Bund Road, Hyderabad, India','+91-40-66522999','Asia/Kolkata','2024-06-10 02:10:20'),(8,'Novotel Goa Resort','Candolim, North Goa, India','+91-832-6698888','Asia/Kolkata','2024-06-27 16:49:05'),(9,'Vivanta Coimbatore','105 Race Course Road, Coimbatore, India','+91-422-6673333','Asia/Kolkata','2024-07-15 03:41:59'),(10,'Crown Plaza Ahmedabad','Sarkhej-Gandhinagar Hwy, Ahmedabad, India','+91-7946618544','Asia/Kolkata','2024-03-17 19:03:12'),(11,'Mandarin Oriental Singapore','5 Raffles Avenue, Marina Square, Singapore','+65-63388000','Asia/Singapore','2024-08-19 18:15:10'),(12,'The Ritz London','150 Piccadilly, St. James, London, UK','+44-20-74938181','Europe/London','2024-09-01 17:25:47'),(13,'Burj Al Arab','Jumeirah Street, Dubai, UAE','+971-4-3018888','Asia/Dubai','2024-04-29 17:15:38'),(14,'Marina Bay Sands','10 Bayfront Avenue, Singapore','+65-66888868','Asia/Singapore','2024-09-30 21:03:29'),(15,'The Plaza New York','768 5th Avenue, Manhattan, New York, USA','+1-212-7593000','Australia/Sydney','2024-05-19 23:55:54'),(16,'Shangri-La Tokyo','1-8-3 Marunouchi, Chiyoda-ku, Tokyo, Japan','+81-3-67391111','Asia/Tokyo','2024-11-04 15:52:36'),(17,'Four Seasons Sydney','199 George Street, Sydney, Australia','+61-2-92506677','Australia/Sydney','2024-06-13 21:10:29'),(18,'Hotel de Paris Monaco','Place du Casino, Monte Carlo, Monaco','+377-98-068868','Europe/Monaco','2024-12-02 17:35:44'),(19,'Raffles Singapore','1 Beach Road, Singapore','+65-63371886','Asia/Singapore','2024-12-14 19:25:33'),(20,'The Peninsula Hong Kong','Salisbury Road, Tsim Sha Tsui, Hong Kong','+852-29202888','Asia/Hong_Kong','2025-01-02 02:55:07');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 15:38:58
