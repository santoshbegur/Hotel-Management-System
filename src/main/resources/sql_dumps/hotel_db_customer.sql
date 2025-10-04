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
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Rahul','Sharma','rahul.sharma@example.com','+91-9876543240'),(2,'Priya','Iyer','priya.iyer@example.com','+91-9988776655'),(3,'Arjun','Patel','arjun.patel@example.com','+91-9123456780'),(4,'Neha','Reddy','neha.reddy@example.com','+91-9345678902'),(5,'Vikram','Singh','vikram.singh@example.com','+91-9765432109'),(6,'Ananya','Nair','ananya.nair@example.com','+91-8899776655'),(7,'Rohit','Verma','rohit.verma@example.com','+91-9988123456'),(8,'Sneha','Kulkarni','sneha.kulkarni@example.com','+91-9876001122'),(9,'Karan','Gupta','karan.gupta@example.com','+91-9123987456'),(10,'Divya','Menon','divya.menon@example.com','+91-9345012345'),(11,'Sandeep','Chopra','sandeep.chopra@example.com','+91-9811223344'),(12,'Meera','Joshi','meera.joshi@example.com','+91-9822334455'),(13,'Amit','Bansal','amit.bansal@example.com','+91-9833445566'),(14,'Pooja','Khatri','pooja.khatri@example.com','+91-9844556677'),(15,'Gaurav','Malhotra','gaurav.malhotra@example.com','+91-9855667788'),(16,'Ritika','Desai','ritika.desai@example.com','+91-9866778899'),(17,'Nikhil','Raj','nikhil.raj@example.com','+91-9877889900'),(18,'Shweta','Agarwal','shweta.agarwal@example.com','+91-9888990011'),(19,'Manish','Thakur','manish.thakur@example.com','+91-9899001122'),(20,'Kavya','Mishra','kavya.mishra@example.com','+91-9900112233'),(21,'Santosh','Begur','santosh@gmail.com','+91-9916853015');
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

-- Dump completed on 2025-10-04 21:47:07
