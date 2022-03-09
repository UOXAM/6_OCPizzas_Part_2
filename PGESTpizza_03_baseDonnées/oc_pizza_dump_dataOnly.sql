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
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'4 rue du Mistral',NULL,'34000','MONTPELLIER'),(2,'5 place d\'Assas',NULL,'34000','MONTPELLIER'),(3,'4 rue pablo Picasso',NULL,'34920','LE CRES'),(4,'10 rue Victor Hugo',NULL,'34170','CASTELNAU LE LEZ'),(5,'9 Boulevard du Jeu de Paume',NULL,'34000','MONTPELLIER'),(6,'18 rue Occitanie',NULL,'34920','LE CRES'),(7,'12 rue d\'Albia',NULL,'34920','LE CRES'),(8,'1 rue Mitterrand',NULL,'34920','LE CRES');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,0,'Jean','PARISI','0600000000','j.parisi@gmail.com','1H34920',0,3),(2,1,'Christelle','FONS','0600000001','c.fons@gmail.com','2F34170',5,4);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Deliverer',0,'John','DOE','0700000000','john.doe@gmail.com','1D34000',5,1),(2,'Pizzaiolo',1,'Marie','BOIS','0700000001','marie.bois@gmail.com','2O34920',6,1),(3,'Pizzaiolo',0,'Paul','LACOUR','0700000002','paul.lacour@gmail.com','3P34920',7,2),(4,'Deliverer',1,'Chiara','ESTEVE','0700000003','chiara.esteve@gmail.com','4D34920',8,2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'mozzarela','kilogram'),(2,'tomato sauce','liter'),(3,'ham','kilogram'),(4,'goat cheese','kilogram'),(5,'peppers','kilogram'),(6,'pasta','quantity');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'A00001',20,24,'paid','2021-12-15 13:05:21','credit card'),(2,'A00002',25,30,'paid','2021-12-16 18:05:00','cash');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2021-12-15 00:00:00','prepared',1,'2021-12-15 20:00:00',1,24,1,1,1),(2,'2021-12-16 00:00:00','order editable',1,'2021-12-16 21:00:00',0,30,2,2,2);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1,1,NULL,2),(2,2,'no olives',1),(2,3,NULL,1);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,'Reine',10,0.2),(2,'Napolitaine',12,0.2),(3,'Diavola',13,0.2);
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pizza_ingredient`
--

LOCK TABLES `pizza_ingredient` WRITE;
/*!40000 ALTER TABLE `pizza_ingredient` DISABLE KEYS */;
INSERT INTO `pizza_ingredient` VALUES (1,1,0.15),(1,2,0.15),(1,3,0.15),(1,6,1),(2,2,0.15),(2,4,0.15),(2,6,1),(3,2,0.15),(3,5,0.15),(3,6,1);
/*!40000 ALTER TABLE `pizza_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pizzeria`
--

LOCK TABLES `pizzeria` WRITE;
/*!40000 ALTER TABLE `pizzeria` DISABLE KEYS */;
INSERT INTO `pizzeria` VALUES (1,'Pizzeria Roma','0400000000','pizzeria_roma@ocpizza.fr',1,1),(2,'Pizzeria Dei Fiori','0400000001','pizzeria_dei_fiori@ocpizza.fr',1,2);
/*!40000 ALTER TABLE `pizzeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stock_pizzeria`
--

LOCK TABLES `stock_pizzeria` WRITE;
/*!40000 ALTER TABLE `stock_pizzeria` DISABLE KEYS */;
INSERT INTO `stock_pizzeria` VALUES (1,1,10),(1,2,15),(1,3,5),(1,4,2),(1,5,3),(1,6,100),(2,1,8),(2,2,10),(2,3,3.5),(2,4,1.5),(2,5,2),(2,6,50);
/*!40000 ALTER TABLE `stock_pizzeria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-16  9:46:53
