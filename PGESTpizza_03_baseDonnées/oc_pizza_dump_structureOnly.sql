CREATE DATABASE  IF NOT EXISTS `oc_pizza` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oc_pizza`;
-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: oc_pizza
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(45) NOT NULL,
  `address_complement` varchar(45) DEFAULT NULL,
  `postcode` varchar(5) NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `civility` tinyint DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `family_name` varchar(45) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `credit` double NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_address_idx` (`address_id`),
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `civility` tinyint DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `family_name` varchar(45) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `address_id` int NOT NULL,
  `pizzeria_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_address1_idx` (`address_id`),
  KEY `fk_employee_pizzeria1_idx` (`pizzeria_id`),
  CONSTRAINT `fk_employee_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_employee_pizzeria1` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(45) NOT NULL,
  `amount_tax_excluded` double NOT NULL,
  `amount_tax_included` double NOT NULL,
  `paiement_status` varchar(45) DEFAULT NULL,
  `date` datetime NOT NULL,
  `paiement_method` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `is_to_deliver` tinyint NOT NULL,
  `delivery_time` datetime NOT NULL,
  `is_paid` tinyint NOT NULL,
  `amount` double NOT NULL,
  `customer_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_customer1_idx` (`customer_id`),
  KEY `fk_order_employee1_idx` (`employee_id`),
  KEY `fk_order_invoice1_idx` (`invoice_id`),
  CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_order_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_order_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line` (
  `order_id` int NOT NULL,
  `pizza_id` int NOT NULL,
  `commentary` varchar(150) DEFAULT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`pizza_id`),
  KEY `fk_order_has_pizza_pizza1_idx` (`pizza_id`),
  KEY `fk_order_has_pizza_order1_idx` (`order_id`),
  CONSTRAINT `fk_order_has_pizza_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_order_has_pizza_pizza1` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pizza_name` varchar(45) NOT NULL,
  `price_tax_excluded` double NOT NULL,
  `tax_rate` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizza_ingredient`
--

DROP TABLE IF EXISTS `pizza_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_ingredient` (
  `pizza_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity` double NOT NULL,
  PRIMARY KEY (`pizza_id`,`ingredient_id`),
  KEY `fk_pizza_has_ingredient_ingredient1_idx` (`ingredient_id`),
  KEY `fk_pizza_has_ingredient_pizza1_idx` (`pizza_id`),
  CONSTRAINT `fk_pizza_has_ingredient_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `fk_pizza_has_ingredient_pizza1` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizzeria`
--

DROP TABLE IF EXISTS `pizzeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzeria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pizzeria_name` varchar(45) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `is_open` tinyint NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pizzeria_address1_idx` (`address_id`),
  CONSTRAINT `fk_pizzeria_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_pizzeria`
--

DROP TABLE IF EXISTS `stock_pizzeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_pizzeria` (
  `pizzeria_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity` double NOT NULL,
  PRIMARY KEY (`pizzeria_id`,`ingredient_id`),
  KEY `fk_pizzeria_has_ingredient_ingredient1_idx` (`ingredient_id`),
  KEY `fk_pizzeria_has_ingredient_pizzeria1_idx` (`pizzeria_id`),
  CONSTRAINT `fk_pizzeria_has_ingredient_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `fk_pizzeria_has_ingredient_pizzeria1` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-16  9:47:14
