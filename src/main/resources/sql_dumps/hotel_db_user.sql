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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin_grandpalacehotel','admin_grandpalacehotel','admin@grandpalace.com'),(2,'manager_grandpalace','manager_grandpalace','manager@grandpalace.com'),(3,'reception_gp','hashed_password3','reception@grandpalace.com'),(4,'manager_ov','hashed_password4','manager@oceanview.com'),(5,'reception_ov','hashed_password5','reception@oceanview.com'),(6,'housekeeping_ov','hashed_password6','housekeeping@oceanview.com'),(7,'user_john','hashed_password7','john.doe@example.com'),(8,'user_maria','hashed_password8','maria.garcia@example.com'),(9,'user_li','hashed_password9','li.wei@example.com'),(10,'user_ahmed','hashed_password10','ahmed.khan@example.com'),(11,'user_sophia','hashed_password11','sophia.martin@example.com'),(12,'user_oliver','hashed_password12','oliver.brown@example.com'),(13,'user_emily','hashed_password13','emily.jones@example.com'),(14,'user_noah','hashed_password14','noah.davis@example.com'),(15,'user_chloe','hashed_password15','chloe.miller@example.com'),(16,'user_liam','hashed_password16','liam.wilson@example.com'),(17,'user_amanda','hashed_password17','amanda.moore@example.com'),(18,'user_ryan','hashed_password18','ryan.taylor@example.com'),(19,'user_elena','hashed_password19','elena.anderson@example.com'),(20,'user_daniel','hashed_password20','daniel.thomas@example.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
