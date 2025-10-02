-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_db
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer`
(
    `id`         bigint NOT NULL AUTO_INCREMENT,
    `first_name` varchar(255) DEFAULT NULL,
    `last_name`  varchar(255) DEFAULT NULL,
    `email`      varchar(255) DEFAULT NULL,
    `phone`      varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `email` (`email`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer`
    DISABLE KEYS */;
INSERT INTO `customer`
VALUES (1, 'John', 'Doe', 'john@example.com', '9998887776'),
       (2, 'Alice', 'Smith', 'alice@example.com', '8887776665'),
       (3, 'Ravi', 'Kumar', 'ravi.kumar@example.com', '7776665554');
/*!40000 ALTER TABLE `customer`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel`
(
    `id`         bigint       NOT NULL AUTO_INCREMENT,
    `name`       varchar(191)      DEFAULT NULL,
    `address`    varchar(500) NOT NULL,
    `phone`      varchar(50)       DEFAULT NULL,
    `timezone`   varchar(100) NOT NULL,
    `created_at` timestamp    NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_hotel` (`name`, `address`(191), `phone`, `timezone`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel`
    DISABLE KEYS */;
INSERT INTO `hotel`
VALUES (1, 'Central Grand Hotel', '1235 Main Street, Bengaluru', '+91-9876543212', 'Asia/Kolkata', NULL),
       (2, 'Sea View Resort', 'Beach Road, Goa', '+91-9123456780', 'Asia/Kolkata', NULL),
       (3, 'Grand Palace', '123 Main St, Bangalore', '+91-9876543210', 'Asia/Kolkata', '2025-09-19 15:11:02'),
       (4, 'Ocean View', 'Beach Road, Goa', '+91-9123456780', 'Asia/Kolkata', '2025-09-19 15:11:02'),
       (7, 'Four Points by Sheraton', 'Whitefield, Bangalore', '+91-8040301215', 'Asia/Kolkata', NULL),
       (11, 'Central Grand Hotel', '123 Main Street, Goa', '+91-9876543212', 'Asia/Kolkata', NULL),
       (12, 'Four Points by Sheraton', 'Beach Road, Hyderabad', '+91-8040301215', 'Asia/Kolkata', NULL),
       (13, 'Leela Palace', 'Old Airport Road, Bangalore', '+919543458633', 'Asia/Kolkata', NULL);
/*!40000 ALTER TABLE `hotel`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housekeeping_event`
--

DROP TABLE IF EXISTS `housekeeping_event`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housekeeping_event`
(
    `id`          bigint    NOT NULL AUTO_INCREMENT,
    `room_id`     bigint    NOT NULL,
    `status`      varchar(255)   DEFAULT NULL,
    `reported_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `handled_by`  bigint         DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_housekeeping_room` (`room_id`),
    KEY `fk_housekeeping_staff` (`handled_by`),
    CONSTRAINT `fk_housekeeping_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
    CONSTRAINT `fk_housekeeping_staff` FOREIGN KEY (`handled_by`) REFERENCES `staff` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housekeeping_event`
--

LOCK TABLES `housekeeping_event` WRITE;
/*!40000 ALTER TABLE `housekeeping_event`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `housekeeping_event`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment`
(
    `id`             bigint NOT NULL AUTO_INCREMENT,
    `reservation_id` bigint         DEFAULT NULL,
    `amount`         decimal(38, 2) DEFAULT NULL,
    `currency`       varchar(255)   DEFAULT NULL,
    `method`         varchar(255)   DEFAULT NULL,
    `status`         varchar(255)   DEFAULT NULL,
    `transaction_id` varchar(255)   DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_payment_reservation` (`reservation_id`),
    CONSTRAINT `fk_payment_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment`
    DISABLE KEYS */;
INSERT INTO `payment`
VALUES (1, 1, 7000.00, 'INR', 'CREDIT_CARD', 'PAID', 'TXN123456'),
       (2, 2, 5000.00, 'INR', 'UPI', 'PENDING', 'TXN654321');
/*!40000 ALTER TABLE `payment`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation`
(
    `id`             bigint    NOT NULL AUTO_INCREMENT,
    `hotel_id`       bigint         DEFAULT NULL,
    `customer_id`    bigint         DEFAULT NULL,
    `status`         varchar(255)   DEFAULT NULL,
    `check_in_date`  date           DEFAULT NULL,
    `check_out_date` date           DEFAULT NULL,
    `total_amount`   decimal(38, 2) DEFAULT NULL,
    `created_at`     timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `fk_reservation_hotel` (`hotel_id`),
    KEY `fk_reservation_customer` (`customer_id`),
    CONSTRAINT `fk_reservation_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
    CONSTRAINT `fk_reservation_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation`
    DISABLE KEYS */;
INSERT INTO `reservation`
VALUES (1, 1, 1, 'CHECKED_OUT', '2025-09-20', '2025-09-22', 7000.00, NULL),
       (2, 2, 2, 'CHECKED_IN', '2025-09-04', '2025-09-12', 5000.00, NULL),
       (3, 1, 1, 'BOOKED', '2025-09-12', '2025-09-22', 6000.00, NULL),
       (4, 1, 1, 'BOOKED', '2025-09-11', '2025-09-24', 9000.00, NULL);
/*!40000 ALTER TABLE `reservation`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_line`
--

DROP TABLE IF EXISTS `reservation_line`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_line`
(
    `id`              bigint NOT NULL AUTO_INCREMENT,
    `reservation_id`  bigint         DEFAULT NULL,
    `room_id`         bigint         DEFAULT NULL,
    `price_per_night` decimal(38, 2) DEFAULT NULL,
    `nights`          int            DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_res_line_reservation` (`reservation_id`),
    KEY `fk_res_line_room` (`room_id`),
    CONSTRAINT `fk_res_line_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`),
    CONSTRAINT `fk_res_line_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_line`
--

LOCK TABLES `reservation_line` WRITE;
/*!40000 ALTER TABLE `reservation_line`
    DISABLE KEYS */;
INSERT INTO `reservation_line`
VALUES (1, 1, 1, 3500.00, 2),
       (2, 2, 4, 2500.00, 2);
/*!40000 ALTER TABLE `reservation_line`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role`
(
    `id`   bigint NOT NULL AUTO_INCREMENT,
    `name` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role`
    DISABLE KEYS */;
INSERT INTO `role`
VALUES (1, 'ADMIN'),
       (3, 'CUSTOMER'),
       (5, 'HOUSEKEEPING'),
       (2, 'MANAGER'),
       (4, 'RECEPTIONIST');
/*!40000 ALTER TABLE `role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room`
(
    `id`           bigint NOT NULL AUTO_INCREMENT,
    `hotel_id`     bigint       DEFAULT NULL,
    `room_number`  varchar(255) DEFAULT NULL,
    `room_type_id` bigint       DEFAULT NULL,
    `floor`        int          DEFAULT NULL,
    `status`       varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_room_per_hotel` (`room_number`, `hotel_id`),
    UNIQUE KEY `UK4ebdthvd3ohrurfgtgul0ao7w` (`room_number`, `hotel_id`),
    KEY `fk_room_hotel` (`hotel_id`),
    KEY `fk_room_type` (`room_type_id`),
    CONSTRAINT `fk_room_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
    CONSTRAINT `fk_room_type` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room`
    DISABLE KEYS */;
INSERT INTO `room`
VALUES (1, 1, '101', 1, 1, 'BOOKED'),
       (2, 1, '102', 2, 1, 'AVAILABLE'),
       (3, 1, '201', 1, 2, 'OCCUPIED'),
       (4, 2, '301', 3, 3, 'AVAILABLE'),
       (5, 2, '302', 4, 3, 'BOOKED'),
       (7, 2, '101', 3, 1, 'OCCUPIED'),
       (10, 7, '401', 2, 4, 'BOOKED');
/*!40000 ALTER TABLE `room`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type`
(
    `id`         bigint NOT NULL AUTO_INCREMENT,
    `hotel_id`   bigint         DEFAULT NULL,
    `code`       varchar(255)   DEFAULT NULL,
    `name`       varchar(255)   DEFAULT NULL,
    `occupancy`  int            DEFAULT NULL,
    `base_price` decimal(38, 2) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_room_type_hotel` (`hotel_id`),
    CONSTRAINT `fk_room_type_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type`
    DISABLE KEYS */;
INSERT INTO `room_type`
VALUES (1, 1, 'DLX', 'Deluxe Room', 2, 3500.00),
       (2, 1, 'STE', 'Suite', 4, 6000.00),
       (3, 2, 'STD', 'Standard Room', 2, 2500.00),
       (4, 2, 'FAM', 'Family Suite', 5, 7000.00);
/*!40000 ALTER TABLE `room_type`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff`
(
    `id`          bigint NOT NULL AUTO_INCREMENT,
    `user_id`     bigint NOT NULL,
    `hotel_id`    bigint NOT NULL,
    `role_id`     bigint NOT NULL,
    `joined_date` date   NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_staff_user` (`user_id`),
    KEY `fk_staff_hotel` (`hotel_id`),
    KEY `fk_staff_role` (`role_id`),
    CONSTRAINT `fk_staff_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
    CONSTRAINT `fk_staff_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
    CONSTRAINT `fk_staff_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff`
    DISABLE KEYS */;
INSERT INTO `staff`
VALUES (1, 1, 1, 1, '2023-05-01'),
       (2, 2, 1, 2, '2023-06-15'),
       (3, 3, 1, 3, '2023-07-20'),
       (4, 4, 2, 2, '2023-08-05'),
       (5, 5, 2, 3, '2023-08-10'),
       (6, 6, 2, 4, '2023-09-01'),
       (16, 3, 1, 4, '2000-05-10'),
       (17, 1, 1, 1, '2025-09-01'),
       (18, 2, 1, 2, '2025-01-01');
/*!40000 ALTER TABLE `staff`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT,
    `username`      varchar(255) NOT NULL,
    `password_hash` varchar(255) NOT NULL,
    `email`         varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`),
    UNIQUE KEY `email` (`email`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
    DISABLE KEYS */;
INSERT INTO `user`
VALUES (1, 'admin_gp', 'hashed_password1', 'admin@grandpalace.com'),
       (2, 'manager_gp', 'hashed_password2', 'manager@grandpalace.com'),
       (3, 'reception_gp', 'hashed_password3', 'reception@grandpalace.com'),
       (4, 'manager_ov', 'hashed_password4', 'manager@oceanview.com'),
       (5, 'reception_ov', 'hashed_password5', 'reception@oceanview.com'),
       (6, 'housekeeping_ov', 'hashed_password6', 'housekeeping@oceanview.com');
/*!40000 ALTER TABLE `user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role`
(
    `user_id` bigint NOT NULL,
    `role_id` bigint NOT NULL,
    PRIMARY KEY (`user_id`, `role_id`),
    KEY `fk_user_role_role` (`role_id`),
    CONSTRAINT `fk_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
    CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role`
    DISABLE KEYS */;
INSERT INTO `user_role`
VALUES (1, 1),
       (2, 2);
/*!40000 ALTER TABLE `user_role`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2025-09-23  9:21:04
