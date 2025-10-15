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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_customer_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Rahul','Sharma','rahul.sharma@example.com','+91-9876543240',NULL),(2,'Priya','Iyer','priya.iyer@example.com','+91-9988776655',NULL),(3,'Arjun','Patel','arjun.patel@example.com','+91-9123456780',NULL),(4,'Neha','Reddy','neha.reddy@example.com','+91-9345678902',NULL),(5,'Vikram','Singh','vikram.singh@example.com','+91-9765432109',NULL),(6,'Ananya','Nair','ananya.nair@example.com','+91-8899776655',NULL),(7,'Rohit','Verma','rohit.verma@example.com','+91-9988123456',NULL),(8,'Sneha','Kulkarni','sneha.kulkarni@example.com','+91-9876001122',NULL),(9,'Karan','Gupta','karan.gupta@example.com','+91-9123987456',NULL),(10,'Divya','Menon','divya.menon@example.com','+91-9345012345',NULL),(11,'Sandeep','Chopra','sandeep.chopra@example.com','+91-9811223344',NULL),(12,'Meera','Joshi','meera.joshi@example.com','+91-9822334455',NULL),(13,'Amit','Bansal','amit.bansal@example.com','+91-9833445566',NULL),(14,'Pooja','Khatri','pooja.khatri@example.com','+91-9844556677',NULL),(15,'Gaurav','Malhotra','gaurav.malhotra@example.com','+91-9855667788',NULL),(16,'Ritika','Desai','ritika.desai@example.com','+91-9866778899',NULL),(17,'Nikhil','Raj','nikhil.raj@example.com','+91-9877889900',NULL),(18,'Shweta','Agarwal','shweta.agarwal@example.com','+91-9888990011',NULL),(19,'Manish','Thakur','manish.thakur@example.com','+91-9899001122',NULL),(20,'Kavya','Mishra','kavya.mishra@example.com','+91-9900112233',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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
