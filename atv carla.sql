CREATE DATABASE  IF NOT EXISTS `northwind` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `northwind`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: northwind
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `categoryproducts`
--

DROP TABLE IF EXISTS `categoryproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoryproducts` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoryproducts`
--

LOCK TABLES `categoryproducts` WRITE;
/*!40000 ALTER TABLE `categoryproducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoryproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(255) NOT NULL,
  `ContactName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(15) DEFAULT NULL,
  `FirstName` varchar(15) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `Photo` varchar(25) DEFAULT NULL,
  `Notes` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `ShipperID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `ShipperID` (`ShipperID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`ShipperID`) REFERENCES `shippers` (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) NOT NULL,
  `Unit` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `SupplierID` (`SupplierID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categoryproducts` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Chais','10 boxes x 20 bags',18.00,1,1),(2,'Chang','24 - 12 oz bottles',19.00,1,1),(3,'Aniseed Syrup','12 - 550 ml bottles',10.00,1,2),(4,'Chef Anton\'s Cajun Seasoning','48 - 6 oz jars',22.00,2,2),(5,'Chef Anton\'s Gumbo Mix','36 boxes',21.35,2,2),(6,'Grandma\'s Boysenberry Spread','12 - 8 oz jars',25.00,3,2),(7,'Uncle Bob\'s Organic Dried Pears','12 - 1 lb pkgs.',30.00,3,7),(8,'Northwoods Cranberry Sauce','12 - 12 oz jars',40.00,3,2),(9,'Mishi Kobe Niku','18 - 500 g pkgs.',97.00,4,6),(10,'Ikura','12 - 200 ml jars',31.00,4,8),(11,'Queso Cabrales','1 kg pkg.',21.00,5,4),(12,'Queso Manchego La Pastora','10 - 500 g pkgs.',38.00,5,4),(13,'Konbu','2 kg box',6.00,6,8),(14,'Tofu','40 - 100 g pkgs.',23.25,6,7),(15,'Genen Shouyu','24 - 250 ml bottles',15.50,6,2),(16,'Pavlova','32 - 500 g boxes',17.45,7,3),(17,'Alice Mutton','20 - 1 kg tins',39.00,7,6),(18,'Carnarvon Tigers','16 kg pkg.',62.50,7,8),(19,'Teatime Chocolate Biscuits','10 boxes x 12 pieces',9.20,8,3),(20,'Sir Rodney\'s Marmalade','30 gift boxes',81.00,8,3),(21,'Sir Rodney\'s Scones','24 pkgs. x 4 pieces',10.00,8,3),(22,'Gustaf\'s Knäckebröd','24 - 500 g pkgs.',21.00,9,5),(23,'Tunnbröd','12 - 250 g pkgs.',9.00,9,5),(24,'Guaraná Fantástica','12 - 355 ml cans',4.50,10,1),(25,'NuNuCa Nuß-Nougat-Creme','20 - 450 g glasses',14.00,11,3),(26,'Gumbär Gummibärchen','100 - 250 g bags',31.23,11,3),(27,'Schoggi Schokolade','100 - 100 g pieces',43.90,11,3),(28,'Rössle Sauerkraut','25 - 825 g cans',45.60,12,7),(29,'Thüringer Rostbratwurst','50 bags x 30 sausgs.',123.79,12,6),(30,'Nord-Ost Matjeshering','10 - 200 g glasses',25.89,13,8),(31,'Gorgonzola Telino','12 - 100 g pkgs',12.50,14,4),(32,'Mascarpone Fabioli','24 - 200 g pkgs.',32.00,14,4),(33,'Geitost','500 g',2.50,15,4),(34,'Sasquatch Ale','24 - 12 oz bottles',14.00,16,1),(35,'Steeleye Stout','24 - 12 oz bottles',18.00,16,1),(36,'Inlagd Sill','24 - 250 g jars',19.00,17,8),(37,'Gravad lax','12 - 500 g pkgs.',26.00,17,8),(38,'Côte de Blaye','12 - 75 cl bottles',263.50,18,1),(39,'Chartreuse verte','750 cc per bottle',18.00,18,1),(40,'Boston Crab Meat','24 - 4 oz tins',18.40,19,8),(41,'Jack\'s New England Clam Chowder','12 - 12 oz cans',9.65,19,8),(42,'Singaporean Hokkien Fried Mee','32 - 1 kg pkgs.',14.00,20,5),(43,'Ipoh Coffee','16 - 500 g tins',46.00,20,1),(44,'Gula Malacca','20 - 2 kg bags',19.45,20,2),(45,'Røgede sild','1k pkg.',9.50,21,8),(46,'Spegesild','4 - 450 g glasses',12.00,21,8),(47,'Zaanse koeken','10 - 4 oz boxes',9.50,22,3),(48,'Chocolade','10 pkgs.',12.75,22,3),(49,'Maxilaku','24 - 50 g pkgs.',20.00,23,3),(50,'Valkoinen suklaa','12 - 100 g bars',16.25,23,3),(51,'Manjimup Dried Apples','50 - 300 g pkgs.',53.00,24,7),(52,'Filo Mix','16 - 2 kg boxes',7.00,24,5),(53,'Perth Pasties','48 pieces',32.80,24,6),(54,'Tourtière','16 pies',7.45,25,6),(55,'Pâté chinois','24 boxes x 2 pies',24.00,25,6),(56,'Gnocchi di nonna Alice','24 - 250 g pkgs.',38.00,26,5),(57,'Ravioli Angelo','24 - 250 g pkgs.',19.50,26,5),(58,'Escargots de Bourgogne','24 pieces',13.25,27,8),(59,'Raclette Courdavault','5 kg pkg.',55.00,28,4),(60,'Camembert Pierrot','15 - 300 g rounds',34.00,28,4),(61,'Sirop d\'érable','24 - 500 ml bottles',28.50,29,2),(62,'Tarte au sucre','48 pies',49.30,29,3),(63,'Vegie-spread','15 - 625 g jars',43.90,7,2),(64,'Wimmers gute Semmelknödel','20 bags x 4 pieces',33.25,12,5),(65,'Louisiana Fiery Hot Pepper Sauce','32 - 8 oz bottles',21.05,2,2),(66,'Louisiana Hot Spiced Okra','24 - 8 oz jars',17.00,2,2),(67,'Laughing Lumberjack Lager','24 - 12 oz bottles',14.00,16,1),(68,'Scottish Longbreads','10 boxes x 8 pieces',12.50,8,3),(69,'Gudbrandsdalsost','10 kg pkg.',36.00,15,4),(70,'Outback Lager','24 - 355 ml bottles',15.00,7,1),(71,'Fløtemysost','10 - 500 g pkgs.',21.50,15,4),(72,'Mozzarella di Giovanni','24 - 200 g pkgs.',34.80,14,4),(73,'Röd Kaviar','24 - 150 g jars',15.00,17,8),(74,'Longlife Tofu','5 kg pkg.',10.00,4,7),(75,'Rhönbräu Klosterbier','24 - 0.5 l bottles',7.75,12,1),(76,'Lakkalikööri','500 ml',18.00,23,1),(77,'Original Frankfurter grüne Soße','12 boxes',13.00,12,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippers` (
  `ShipperID` int(11) NOT NULL AUTO_INCREMENT,
  `ShipperName` varchar(255) NOT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(255) NOT NULL,
  `ContactName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-28 10:32:14
