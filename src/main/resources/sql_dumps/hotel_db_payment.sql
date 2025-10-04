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
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reservation_id` bigint DEFAULT NULL,
  `amount` decimal(38,2) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_reservation` (`reservation_id`),
  CONSTRAINT `fk_payment_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,600.00,'INR','UPI','Completed','TXN10001US'),(2,2,180.00,'USD','PayPal','Completed','TXN10002PP'),(3,3,7200.00,'INR','UPI','Completed','TXN10003UP'),(4,4,5600.00,'INR','Credit Card','Failed','TXN10004CC'),(5,5,450.00,'EUR','Debit Card','Completed','TXN10005DC'),(6,6,12000.00,'INR','Cash','Completed','TXN10006CS'),(7,7,300.00,'USD','Credit Card','Completed','TXN10007US'),(8,8,220.00,'EUR','Debit Card','Failed','TXN10008DC'),(9,9,8900.00,'INR','UPI','Completed','TXN10009UP'),(10,10,150.00,'USD','PayPal','Completed','TXN10010PP'),(11,11,4000.00,'INR','Credit Card','Refunded','TXN10011RF'),(12,12,560.00,'EUR','Debit Card','Completed','TXN10012DC'),(13,13,7500.00,'INR','UPI','Completed','TXN10013UP'),(14,14,275.00,'USD','Credit Card','Completed','TXN10014US'),(15,15,13500.00,'INR','Cash','Completed','TXN10015CS'),(16,16,620.00,'EUR','Debit Card','Pending','TXN10016DC'),(17,17,9800.00,'INR','UPI','Completed','TXN10017UP'),(18,18,330.00,'USD','Credit Card','Failed','TXN10018CC'),(19,19,240.00,'EUR','PayPal','Completed','TXN10019PP'),(20,20,11200.00,'INR','UPI','Completed','TXN10020UP'),(21,21,9000.00,'INR','Credit Card','Completed','TXN10021CC'),(22,5,45767.00,'INR','Credit Card','Pending','TXNINR005000CC28092025011523'),(23,2,50000.00,'INR','Credit Card','Completed','TXNINR002000CC28092025012055'),(24,7,7000.00,'EUR','UPI','Completed','TXNEUR007000UP28092025133206'),(25,23,7000.00,'INR','Credit Card','Completed','TXNINR023000CC01102025132616'),(26,9,60000.00,'USD','Credit Card','Pending','TXNINR009000CC02102025121728');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-04 21:47:05
