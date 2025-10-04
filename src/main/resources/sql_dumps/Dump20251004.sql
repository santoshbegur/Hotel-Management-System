CREATE DATABASE IF NOT EXISTS `hotel_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION = 'N' */;
USE `hotel_db`;
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
  AUTO_INCREMENT = 22
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
VALUES (1, 'Rahul', 'Sharma', 'rahul.sharma@example.com', '+91-9876543240'),
       (2, 'Priya', 'Iyer', 'priya.iyer@example.com', '+91-9988776655'),
       (3, 'Arjun', 'Patel', 'arjun.patel@example.com', '+91-9123456780'),
       (4, 'Neha', 'Reddy', 'neha.reddy@example.com', '+91-9345678902'),
       (5, 'Vikram', 'Singh', 'vikram.singh@example.com', '+91-9765432109'),
       (6, 'Ananya', 'Nair', 'ananya.nair@example.com', '+91-8899776655'),
       (7, 'Rohit', 'Verma', 'rohit.verma@example.com', '+91-9988123456'),
       (8, 'Sneha', 'Kulkarni', 'sneha.kulkarni@example.com', '+91-9876001122'),
       (9, 'Karan', 'Gupta', 'karan.gupta@example.com', '+91-9123987456'),
       (10, 'Divya', 'Menon', 'divya.menon@example.com', '+91-9345012345'),
       (11, 'Sandeep', 'Chopra', 'sandeep.chopra@example.com', '+91-9811223344'),
       (12, 'Meera', 'Joshi', 'meera.joshi@example.com', '+91-9822334455'),
       (13, 'Amit', 'Bansal', 'amit.bansal@example.com', '+91-9833445566'),
       (14, 'Pooja', 'Khatri', 'pooja.khatri@example.com', '+91-9844556677'),
       (15, 'Gaurav', 'Malhotra', 'gaurav.malhotra@example.com', '+91-9855667788'),
       (16, 'Ritika', 'Desai', 'ritika.desai@example.com', '+91-9866778899'),
       (17, 'Nikhil', 'Raj', 'nikhil.raj@example.com', '+91-9877889900'),
       (18, 'Shweta', 'Agarwal', 'shweta.agarwal@example.com', '+91-9888990011'),
       (19, 'Manish', 'Thakur', 'manish.thakur@example.com', '+91-9899001122'),
       (20, 'Kavya', 'Mishra', 'kavya.mishra@example.com', '+91-9900112233'),
       (21, 'Santosh', 'Begur', 'santosh@gmail.com', '+91-9916853015');
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
    `timezone`   varchar(100)      DEFAULT NULL,
    `created_at` timestamp    NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_hotel` (`name`, `address`(191), `phone`, `timezone`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
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
VALUES (1, 'The Oberoi Bangalore', '37-38 Mahatma Gandhi Road, Bengaluru, India', '+91-80-22044987', 'Asia/Kolkata',
        '2024-01-15 04:35:25'),
       (2, 'Taj Palace Delhi', '2 Sardar Patel Marg, Diplomatic Enclave, New Delhi, India', '+91-11-26110202',
        'Asia/Kolkata', '2024-02-10 08:42:55'),
       (3, 'ITC Grand Chola', '63 Mount Road, Guindy, Chennai, India', '+91-44-22200322', 'Asia/Kolkata',
        '2024-02-05 09:42:47'),
       (4, 'The Leela Mumbai', 'Sahar, Andheri East, Mumbai, India', '+91-22-66911234', 'Asia/Kolkata',
        '2024-04-12 06:15:33'),
       (5, 'Hyatt Regency Kolkata', 'JA-1, Salt Lake City, Kolkata, India', '+91-33-23351234', 'Asia/Kolkata',
        '2024-05-05 11:25:48'),
       (6, 'Radisson Blu Jaipur', 'Plot No. 5 & 6, Airport Plaza, Jaipur, India', '+91-141-4055555', 'Asia/Kolkata',
        '2024-05-22 06:51:17'),
       (7, 'Marriott Hyderabad', 'Tank Bund Road, Hyderabad, India', '+91-40-66522999', 'Asia/Kolkata',
        '2024-06-10 13:10:20'),
       (8, 'Novotel Goa Resort', 'Candolim, North Goa, India', '+91-832-6698888', 'Asia/Kolkata',
        '2024-06-28 03:49:05'),
       (9, 'Vivanta Coimbatore', '105 Race Course Road, Coimbatore, India', '+91-422-6673333', 'Asia/Kolkata',
        '2024-07-15 14:41:59'),
       (10, 'Crown Plaza Ahmedabad', 'Sarkhej-Gandhinagar Hwy, Ahmedabad, India', '+91-7946618544', 'Asia/Kolkata',
        '2024-03-18 06:03:12'),
       (11, 'Mandarin Oriental Singapore', '5 Raffles Avenue, Marina Square, Singapore', '+65-63388000',
        'Asia/Singapore', '2024-08-20 05:15:10'),
       (12, 'The Ritz London', '150 Piccadilly, St. James, London, UK', '+44-20-74938181', 'Europe/London',
        '2024-09-02 04:25:47'),
       (13, 'Burj Al Arab', 'Jumeirah Street, Dubai, UAE', '+971-4-3018888', 'Asia/Dubai', '2024-04-30 04:15:38'),
       (14, 'Marina Bay Sands', '10 Bayfront Avenue, Singapore', '+65-66888868', 'Asia/Singapore',
        '2024-10-01 08:03:29'),
       (15, 'The Plaza New York', '768 5th Avenue, Manhattan, New York, USA', '+1-212-7593000', 'Australia/Sydney',
        '2024-05-20 10:55:54'),
       (16, 'Shangri-La Tokyo', '1-8-3 Marunouchi, Chiyoda-ku, Tokyo, Japan', '+81-3-67391111', 'Asia/Tokyo',
        '2024-11-05 02:52:36'),
       (17, 'Four Seasons Sydney', '199 George Street, Sydney, Australia', '+61-2-92506677', 'Australia/Sydney',
        '2024-06-14 08:10:29'),
       (18, 'Hotel de Paris Monaco', 'Place du Casino, Monte Carlo, Monaco', '+377-98-068868', 'Europe/Monaco',
        '2024-12-03 04:35:44'),
       (19, 'Raffles Singapore', '1 Beach Road, Singapore', '+65-63371886', 'Asia/Singapore', '2024-12-15 06:25:33'),
       (20, 'The Peninsula Hong Kong', 'Salisbury Road, Tsim Sha Tsui, Hong Kong', '+852-29202888', 'Asia/Hong_Kong',
        '2025-01-02 13:55:07'),
       (21, 'Hotel City Meridian',
        'The City Meridian Hotel No.21 and 23/1 P.S. Lane, KV Temple Street Cross, behind SSK Sangha, Cross, Bengaluru',
        '080 2228 7334', 'Asia/Kolkata', '2024-07-01 02:45:12');
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
    `id`          bigint       NOT NULL AUTO_INCREMENT,
    `room_id`     bigint       NOT NULL,
    `status`      varchar(255) NOT NULL DEFAULT 'PENDING',
    `reported_at` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `handled_by`  bigint                DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_housekeeping_room` (`room_id`),
    KEY `fk_housekeeping_staff` (`handled_by`),
    CONSTRAINT `fk_housekeeping_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
    CONSTRAINT `fk_housekeeping_staff` FOREIGN KEY (`handled_by`) REFERENCES `staff` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 36
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housekeeping_event`
--

LOCK TABLES `housekeeping_event` WRITE;
/*!40000 ALTER TABLE `housekeeping_event`
    DISABLE KEYS */;
INSERT INTO `housekeeping_event`
VALUES (1, 1, 'PENDING', '2023-08-01 05:00:00', 6),
       (2, 2, 'REPORTED', '2023-08-02 06:15:00', 6),
       (3, 3, 'NEEDS_REPAIR', '2023-08-03 03:45:00', 6),
       (4, 4, 'COMPLETED', '2023-08-04 08:50:00', 6),
       (5, 5, 'PENDING', '2023-08-05 10:30:00', 6),
       (6, 6, 'REPORTED', '2024-01-10 07:00:00', 6),
       (7, 7, 'NEEDS_REPAIR', '2024-01-12 03:20:00', 6),
       (8, 8, 'COMPLETED', '2024-01-13 10:15:00', 6),
       (9, 9, 'PENDING', '2024-02-01 03:40:00', 6),
       (10, 10, 'REPORTED', '2024-02-03 06:00:00', 6),
       (11, 11, 'NEEDS_REPAIR', '2025-03-10 07:30:00', 6),
       (12, 12, 'COMPLETED', '2025-03-12 04:55:00', 6),
       (13, 13, 'PENDING', '2025-03-14 11:10:00', 6),
       (14, 14, 'REPORTED', '2025-04-01 02:45:00', 6),
       (15, 15, 'NEEDS_REPAIR', '2025-04-02 04:20:00', 6),
       (16, 16, 'COMPLETED', '2025-05-05 09:00:00', 6),
       (17, 17, 'PENDING', '2025-05-06 06:30:00', 6),
       (18, 18, 'REPORTED', '2025-05-07 05:50:00', 6),
       (19, 19, 'NEEDS_REPAIR', '2025-06-10 10:20:00', 6),
       (20, 20, 'COMPLETED', '2025-06-12 08:15:00', 6),
       (21, 1, 'IN_PROGRESS', '2025-09-26 11:08:44', 6),
       (22, 1, 'COMPLETED', '2025-09-26 11:09:07', 6),
       (23, 1, 'COMPLETED', '2025-10-01 02:18:07', 6),
       (24, 1, 'COMPLETED', '2025-10-01 02:18:15', 6),
       (25, 1, 'COMPLETED', '2025-10-01 02:19:04', 6),
       (26, 1, 'REPORTED', '2025-10-01 14:47:50', 6),
       (27, 1, 'COMPLETED', '2025-10-01 14:48:07', 6),
       (29, 6, 'COMPLETED', '2025-10-02 01:46:50', 2),
       (30, 12, 'COMPLETED', '2025-10-02 01:47:30', 11),
       (31, 11, 'NEEDS_REPAIR', '2025-10-02 01:48:21', 9),
       (32, 11, 'COMPLETED', '2025-10-02 01:48:48', 9),
       (33, 1, 'IN_PROGRESS', '2025-10-02 11:16:45', 6),
       (34, 1, 'COMPLETED', '2025-10-02 11:16:51', 6),
       (35, 6, 'IN_PROGRESS', '2025-10-02 11:16:56', 6);
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
  AUTO_INCREMENT = 27
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
VALUES (1, 1, 600.00, 'INR', 'UPI', 'Completed', 'TXN10001US'),
       (2, 2, 180.00, 'USD', 'PayPal', 'Completed', 'TXN10002PP'),
       (3, 3, 7200.00, 'INR', 'UPI', 'Completed', 'TXN10003UP'),
       (4, 4, 5600.00, 'INR', 'Credit Card', 'Failed', 'TXN10004CC'),
       (5, 5, 450.00, 'EUR', 'Debit Card', 'Completed', 'TXN10005DC'),
       (6, 6, 12000.00, 'INR', 'Cash', 'Completed', 'TXN10006CS'),
       (7, 7, 300.00, 'USD', 'Credit Card', 'Completed', 'TXN10007US'),
       (8, 8, 220.00, 'EUR', 'Debit Card', 'Failed', 'TXN10008DC'),
       (9, 9, 8900.00, 'INR', 'UPI', 'Completed', 'TXN10009UP'),
       (10, 10, 150.00, 'USD', 'PayPal', 'Completed', 'TXN10010PP'),
       (11, 11, 4000.00, 'INR', 'Credit Card', 'Refunded', 'TXN10011RF'),
       (12, 12, 560.00, 'EUR', 'Debit Card', 'Completed', 'TXN10012DC'),
       (13, 13, 7500.00, 'INR', 'UPI', 'Completed', 'TXN10013UP'),
       (14, 14, 275.00, 'USD', 'Credit Card', 'Completed', 'TXN10014US'),
       (15, 15, 13500.00, 'INR', 'Cash', 'Completed', 'TXN10015CS'),
       (16, 16, 620.00, 'EUR', 'Debit Card', 'Pending', 'TXN10016DC'),
       (17, 17, 9800.00, 'INR', 'UPI', 'Completed', 'TXN10017UP'),
       (18, 18, 330.00, 'USD', 'Credit Card', 'Failed', 'TXN10018CC'),
       (19, 19, 240.00, 'EUR', 'PayPal', 'Completed', 'TXN10019PP'),
       (20, 20, 11200.00, 'INR', 'UPI', 'Completed', 'TXN10020UP'),
       (21, 21, 9000.00, 'INR', 'Credit Card', 'Completed', 'TXN10021CC'),
       (22, 5, 45767.00, 'INR', 'Credit Card', 'Pending', 'TXNINR005000CC28092025011523'),
       (23, 2, 50000.00, 'INR', 'Credit Card', 'Completed', 'TXNINR002000CC28092025012055'),
       (24, 7, 7000.00, 'EUR', 'UPI', 'Completed', 'TXNEUR007000UP28092025133206'),
       (25, 23, 7000.00, 'INR', 'Credit Card', 'Completed', 'TXNINR023000CC01102025132616'),
       (26, 9, 60000.00, 'USD', 'Credit Card', 'Pending', 'TXNINR009000CC02102025121728');
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
  AUTO_INCREMENT = 25
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
VALUES (1, 1, 3, 'CHECKED_IN', '2025-10-02', '2025-10-03', 8000.00, '2025-10-04 15:53:56'),
       (2, 2, 7, 'CHECKED_IN', '2025-09-25', '2025-09-28', 15600.00, '2025-09-10 04:00:00'),
       (3, 3, 12, 'CHECKED_OUT', '2025-09-10', '2025-09-13', 10000.00, '2025-10-04 15:53:56'),
       (4, 4, 5, 'BOOKED', '2025-11-01', '2025-11-06', 40000.00, '2025-10-04 15:53:56'),
       (5, 5, 9, 'CANCELLED', '2025-09-02', '2025-10-03', 10000.00, '2025-10-04 15:53:56'),
       (6, 2, 14, 'CHECKED_IN', '2025-09-24', '2025-09-27', 15600.00, '2025-09-12 12:55:00'),
       (7, 3, 1, 'BOOKED', '2025-10-12', '2025-10-15', 25500.00, '2025-09-21 06:10:00'),
       (8, 6, 4, 'BOOKED', '2025-10-20', '2025-10-22', 24000.00, '2025-09-19 03:25:00'),
       (9, 7, 10, 'CHECKED_OUT', '2025-09-05', '2025-09-09', 48000.00, '2025-08-15 04:35:00'),
       (10, 8, 6, 'BOOKED', '2025-11-03', '2025-11-07', 30000.00, '2025-09-24 13:45:00'),
       (11, 1, 8, 'CHECKED_IN', '2025-09-26', '2025-09-29', 36000.00, '2025-09-14 02:20:00'),
       (12, 5, 2, 'BOOKED', '2025-10-10', '2025-10-14', 14000.00, '2025-09-17 14:35:00'),
       (13, 9, 11, 'CANCELLED', '2025-09-18', '2025-09-20', 17000.00, '2025-09-05 04:05:00'),
       (14, 10, 13, 'CHECKED_OUT', '2025-09-01', '2025-09-04', 25500.00, '2025-08-12 08:25:00'),
       (15, 4, 16, 'BOOKED', '2025-10-15', '2025-10-19', 48000.00, '2025-09-23 11:00:00'),
       (16, 6, 17, 'BOOKED', '2025-10-08', '2025-10-11', 36000.00, '2025-09-18 15:50:00'),
       (17, 7, 19, 'CHECKED_IN', '2025-09-27', '2025-09-30', 22500.00, '2025-09-13 10:15:00'),
       (18, 8, 15, 'CHECKED_OUT', '2025-09-06', '2025-09-09', 25500.00, '2025-08-20 06:35:00'),
       (19, 9, 20, 'BOOKED', '2025-10-25', '2025-10-29', 34000.00, '2025-09-25 03:00:00'),
       (20, 10, 18, 'BOOKED', '2025-10-18', '2025-10-21', 36000.00, '2025-09-22 12:15:00'),
       (21, 2, 21, 'BOOKED', '2025-09-26', '2025-09-27', 9000.00, '2025-10-04 15:53:56'),
       (23, 12, 21, 'BOOKED', '2025-09-28', '2025-09-29', 20000.00, '2025-10-04 15:53:56'),
       (24, 1, 1, 'BOOKED', '2025-10-02', '2025-10-03', 12000.00, '2025-10-04 15:53:56');
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
  AUTO_INCREMENT = 22
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
VALUES (2, 2, 12, 4200.00, 2),
       (6, 6, 7, 3000.00, 6),
       (7, 7, 18, 4500.00, 3),
       (8, 8, 10, 2200.00, 1),
       (9, 9, 25, 5500.00, 4),
       (10, 10, 14, 4000.00, 2),
       (11, 11, 30, 4800.00, 3),
       (12, 12, 21, 2600.00, 5),
       (13, 13, 33, 7000.00, 7),
       (14, 14, 28, 3200.00, 2),
       (15, 15, 40, 3700.00, 3),
       (16, 16, 35, 2900.00, 2),
       (17, 17, 44, 5200.00, 6),
       (18, 18, 38, 4100.00, 4),
       (19, 19, 48, 2300.00, 1),
       (20, 20, 50, 6500.00, 5),
       (21, 24, 5, NULL, NULL);
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
  AUTO_INCREMENT = 21
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
VALUES (10, 'ACCOUNTANT'),
       (1, 'ADMIN'),
       (17, 'BELLBOY'),
       (7, 'CHEF'),
       (16, 'CLEANING_SUPERVISOR'),
       (13, 'CONCIERGE'),
       (3, 'CUSTOMER'),
       (14, 'EVENT_MANAGER'),
       (8, 'FRONT_DESK'),
       (15, 'GUEST_RELATIONS'),
       (5, 'HOUSEKEEPING'),
       (11, 'IT_SUPPORT'),
       (6, 'MAINTENANCE'),
       (2, 'MANAGER'),
       (20, 'MARKETING'),
       (19, 'POOL_LIFEGUARD'),
       (4, 'RECEPTIONIST'),
       (9, 'SALES'),
       (12, 'SECURITY'),
       (18, 'SPA_MANAGER');
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
  AUTO_INCREMENT = 102
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
VALUES (1, 1, '101', 3, 1, 'Maintenance'),
       (2, 1, '102', 2, 1, 'Available'),
       (3, 1, '201', 3, 2, 'Available'),
       (4, 1, '202', 4, 2, 'Reserved'),
       (5, 1, '301', 5, 3, 'Occupied'),
       (6, 2, '101', 7, 1, 'Maintenance'),
       (7, 2, '102', 2, 1, 'Occupied'),
       (8, 2, '201', 3, 2, 'Available'),
       (9, 2, '202', 4, 2, 'Reserved'),
       (10, 2, '301', 5, 3, 'Available'),
       (11, 3, '101', 1, 1, 'Available'),
       (12, 3, '102', 2, 1, 'Maintenance'),
       (13, 3, '201', 3, 2, 'Available'),
       (14, 3, '202', 4, 2, 'Occupied'),
       (15, 3, '301', 5, 3, 'Available'),
       (16, 4, '101', 1, 1, 'Reserved'),
       (17, 4, '102', 2, 1, 'Available'),
       (18, 4, '201', 3, 2, 'Available'),
       (19, 4, '202', 4, 2, 'Occupied'),
       (20, 4, '301', 5, 3, 'Maintenance'),
       (21, 5, '101', 1, 1, 'Available'),
       (22, 5, '102', 2, 1, 'Available'),
       (23, 5, '201', 3, 2, 'Occupied'),
       (24, 5, '202', 4, 2, 'Available'),
       (25, 5, '301', 5, 3, 'Reserved'),
       (26, 6, '101', 1, 1, 'Available'),
       (27, 6, '102', 2, 1, 'Reserved'),
       (28, 6, '201', 3, 2, 'Available'),
       (29, 6, '202', 4, 2, 'Occupied'),
       (30, 6, '301', 5, 3, 'Available'),
       (31, 7, '101', 1, 1, 'Maintenance'),
       (32, 7, '102', 2, 1, 'Available'),
       (33, 7, '201', 3, 2, 'Reserved'),
       (34, 7, '202', 4, 2, 'Available'),
       (35, 7, '301', 5, 3, 'Available'),
       (36, 8, '101', 1, 1, 'Available'),
       (37, 8, '102', 2, 1, 'Available'),
       (38, 8, '201', 3, 2, 'Occupied'),
       (39, 8, '202', 4, 2, 'Available'),
       (40, 8, '301', 5, 3, 'Reserved'),
       (41, 9, '101', 1, 1, 'Available'),
       (42, 9, '102', 2, 1, 'Occupied'),
       (43, 9, '201', 3, 2, 'Available'),
       (44, 9, '202', 4, 2, 'Reserved'),
       (45, 9, '301', 5, 3, 'Available'),
       (46, 10, '101', 1, 1, 'Available'),
       (47, 10, '102', 2, 1, 'Reserved'),
       (48, 10, '201', 3, 2, 'Available'),
       (49, 10, '202', 4, 2, 'Occupied'),
       (50, 10, '301', 5, 3, 'Available'),
       (51, 11, '101', 1, 1, 'Available'),
       (52, 11, '102', 2, 1, 'Available'),
       (53, 11, '201', 3, 2, 'Maintenance'),
       (54, 11, '202', 4, 2, 'Available'),
       (55, 11, '301', 5, 3, 'Reserved'),
       (56, 12, '101', 1, 1, 'Available'),
       (57, 12, '102', 2, 1, 'Reserved'),
       (58, 12, '201', 3, 2, 'Available'),
       (59, 12, '202', 4, 2, 'Occupied'),
       (60, 12, '301', 5, 3, 'Available'),
       (61, 13, '101', 1, 1, 'Maintenance'),
       (62, 13, '102', 2, 1, 'Available'),
       (63, 13, '201', 3, 2, 'Reserved'),
       (64, 13, '202', 4, 2, 'Available'),
       (65, 13, '301', 5, 3, 'Available'),
       (66, 14, '101', 1, 1, 'Available'),
       (67, 14, '102', 2, 1, 'Occupied'),
       (68, 14, '201', 3, 2, 'Available'),
       (69, 14, '202', 4, 2, 'Reserved'),
       (70, 14, '301', 5, 3, 'Available'),
       (71, 15, '101', 1, 1, 'Available'),
       (72, 15, '102', 2, 1, 'Reserved'),
       (73, 15, '201', 3, 2, 'Available'),
       (74, 15, '202', 4, 2, 'Occupied'),
       (75, 15, '301', 5, 3, 'Available'),
       (76, 16, '101', 1, 1, 'Available'),
       (77, 16, '102', 2, 1, 'Available'),
       (78, 16, '201', 3, 2, 'Reserved'),
       (79, 16, '202', 4, 2, 'Available'),
       (80, 16, '301', 5, 3, 'Occupied'),
       (81, 17, '101', 1, 1, 'Maintenance'),
       (82, 17, '102', 2, 1, 'Available'),
       (83, 17, '201', 3, 2, 'Available'),
       (84, 17, '202', 4, 2, 'Reserved'),
       (85, 17, '301', 5, 3, 'Available'),
       (86, 18, '101', 1, 1, 'Available'),
       (87, 18, '102', 2, 1, 'Available'),
       (88, 18, '201', 3, 2, 'Occupied'),
       (89, 18, '202', 4, 2, 'Reserved'),
       (90, 18, '301', 5, 3, 'Available'),
       (91, 19, '101', 1, 1, 'Available'),
       (92, 19, '102', 2, 1, 'Reserved'),
       (93, 19, '201', 3, 2, 'Available'),
       (94, 19, '202', 4, 2, 'Available'),
       (95, 19, '301', 5, 3, 'Occupied'),
       (96, 20, '101', 1, 1, 'Available'),
       (97, 20, '102', 2, 1, 'Available'),
       (98, 20, '201', 3, 2, 'Reserved'),
       (99, 20, '202', 4, 2, 'Available'),
       (100, 20, '301', 5, 3, 'Available'),
       (101, 1, '302', 4, 3, 'Available');
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
  AUTO_INCREMENT = 21
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
VALUES (1, 1, 'STD', 'Standard Room', 2, 3500.00),
       (2, 1, 'DLX', 'Deluxe Room', 3, 5200.00),
       (3, 1, 'SUI', 'Executive Suite', 4, 8500.00),
       (4, 1, 'FAM', 'Family Room', 5, 7500.00),
       (5, 1, 'PEN', 'Penthouse', 4, 12000.00),
       (6, 2, 'STD', 'Standard Room', 2, 2800.00),
       (7, 2, 'DLX', 'Deluxe Room', 3, 4500.00),
       (8, 2, 'SUI', 'Suite', 4, 7000.00),
       (9, 2, 'FAM', 'Family Deluxe', 5, 6000.00),
       (10, 2, 'BUS', 'Business Room', 2, 5000.00),
       (11, 3, 'STD', 'Standard King', 2, 3200.00),
       (12, 3, 'DLX', 'Deluxe Twin', 2, 4800.00),
       (13, 3, 'SUI', 'Luxury Suite', 3, 9200.00),
       (14, 3, 'EXE', 'Executive Room', 2, 5600.00),
       (15, 3, 'PEN', 'Penthouse Suite', 4, 15000.00),
       (16, 4, 'STD', 'Standard Economy', 2, 2500.00),
       (17, 4, 'DLX', 'Deluxe Room', 3, 4200.00),
       (18, 4, 'EXE', 'Executive King', 2, 6000.00),
       (19, 4, 'FAM', 'Family Room', 5, 6800.00),
       (20, 4, 'SUI', 'Premium Suite', 4, 9900.00);
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
  AUTO_INCREMENT = 22
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
VALUES (1, 12, 1, 3, '2025-09-26'),
       (2, 2, 1, 2, '2020-07-22'),
       (3, 3, 1, 3, '2021-01-05'),
       (4, 4, 2, 2, '2018-11-10'),
       (5, 5, 2, 3, '2019-09-18'),
       (6, 6, 2, 5, '2020-05-12'),
       (7, 7, 1, 3, '2021-02-25'),
       (8, 8, 1, 2, '2019-12-30'),
       (9, 9, 2, 1, '2018-08-01'),
       (10, 10, 2, 4, '2022-04-10'),
       (11, 11, 1, 2, '2020-06-18'),
       (12, 12, 1, 3, '2019-10-07'),
       (13, 13, 2, 4, '2021-03-22'),
       (14, 14, 2, 2, '2018-12-14'),
       (15, 15, 1, 1, '2022-01-09'),
       (16, 16, 1, 3, '2019-05-27'),
       (17, 17, 2, 2, '2020-09-11'),
       (18, 18, 2, 4, '2021-07-30'),
       (19, 19, 1, 1, '2019-04-02'),
       (20, 20, 1, 5, '2023-02-16');
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
  AUTO_INCREMENT = 21
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
VALUES (1, 'admin_grandpalacehotel', 'admin_grandpalacehotel', 'admin@grandpalace.com'),
       (2, 'manager_grandpalace', 'manager_grandpalace', 'manager@grandpalace.com'),
       (3, 'reception_gp', 'hashed_password3', 'reception@grandpalace.com'),
       (4, 'manager_ov', 'hashed_password4', 'manager@oceanview.com'),
       (5, 'reception_ov', 'hashed_password5', 'reception@oceanview.com'),
       (6, 'housekeeping_ov', 'hashed_password6', 'housekeeping@oceanview.com'),
       (7, 'user_john', 'hashed_password7', 'john.doe@example.com'),
       (8, 'user_maria', 'hashed_password8', 'maria.garcia@example.com'),
       (9, 'user_li', 'hashed_password9', 'li.wei@example.com'),
       (10, 'user_ahmed', 'hashed_password10', 'ahmed.khan@example.com'),
       (11, 'user_sophia', 'hashed_password11', 'sophia.martin@example.com'),
       (12, 'user_oliver', 'hashed_password12', 'oliver.brown@example.com'),
       (13, 'user_emily', 'hashed_password13', 'emily.jones@example.com'),
       (14, 'user_noah', 'hashed_password14', 'noah.davis@example.com'),
       (15, 'user_chloe', 'hashed_password15', 'chloe.miller@example.com'),
       (16, 'user_liam', 'hashed_password16', 'liam.wilson@example.com'),
       (17, 'user_amanda', 'hashed_password17', 'amanda.moore@example.com'),
       (18, 'user_ryan', 'hashed_password18', 'ryan.taylor@example.com'),
       (19, 'user_elena', 'hashed_password19', 'elena.anderson@example.com'),
       (20, 'user_daniel', 'hashed_password20', 'daniel.thomas@example.com');
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
VALUES (9, 2),
       (13, 2),
       (17, 2),
       (3, 3),
       (4, 3),
       (8, 3),
       (12, 3),
       (16, 3),
       (20, 3),
       (5, 4),
       (6, 4),
       (7, 4),
       (10, 4),
       (11, 4),
       (14, 4),
       (15, 4),
       (18, 4),
       (19, 4);
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

-- Dump completed on 2025-10-04 21:49:13
