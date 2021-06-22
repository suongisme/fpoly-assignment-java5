-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: TocotocoSpring
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (3,'Chè'),(4,'Fresh Fruit Tea'),(5,'Macchiato'),(6,'Trà sữa');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ice`
--

DROP TABLE IF EXISTS `Ice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ice_percent` int NOT NULL,
  `icePercent` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ice`
--

LOCK TABLES `Ice` WRITE;
/*!40000 ALTER TABLE `Ice` DISABLE KEYS */;
INSERT INTO `Ice` VALUES (1,100,NULL),(2,75,NULL),(3,50,NULL);
/*!40000 ALTER TABLE `Ice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `sugar_id` int DEFAULT NULL,
  `ice_id` int DEFAULT NULL,
  `size_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `receipt_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe0es87ddfnjc34vb3atxiv0qm` (`ice_id`),
  KEY `FKt9no2hebi43y3umpo8xj3fadr` (`product_id`),
  KEY `FKese81yfpu2o55cuhplvr0lxe8` (`size_id`),
  KEY `FKddm68cs60y6ut3srss14mxyic` (`sugar_id`),
  KEY `FK_RECEIPT` (`receipt_id`),
  CONSTRAINT `FK_ITEM_ICE` FOREIGN KEY (`ice_id`) REFERENCES `Ice` (`id`),
  CONSTRAINT `FK_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`),
  CONSTRAINT `FK_ITEM_SIZE` FOREIGN KEY (`size_id`) REFERENCES `Size` (`id`),
  CONSTRAINT `FK_ITEM_SUGAR` FOREIGN KEY (`sugar_id`) REFERENCES `Sugar` (`id`),
  CONSTRAINT `FK_RECEIPT` FOREIGN KEY (`receipt_id`) REFERENCES `Receipt` (`id`),
  CONSTRAINT `FKddm68cs60y6ut3srss14mxyic` FOREIGN KEY (`sugar_id`) REFERENCES `Sugar` (`id`),
  CONSTRAINT `FKe0es87ddfnjc34vb3atxiv0qm` FOREIGN KEY (`ice_id`) REFERENCES `Ice` (`id`),
  CONSTRAINT `FKese81yfpu2o55cuhplvr0lxe8` FOREIGN KEY (`size_id`) REFERENCES `Size` (`id`),
  CONSTRAINT `FKt9no2hebi43y3umpo8xj3fadr` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item_Topping`
--

DROP TABLE IF EXISTS `Item_Topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Item_Topping` (
  `item_id` int DEFAULT NULL,
  `toppings_id` int DEFAULT NULL,
  KEY `FK_ITEM` (`item_id`),
  KEY `FK_TOPPING` (`toppings_id`),
  CONSTRAINT `FK_ITEM` FOREIGN KEY (`item_id`) REFERENCES `Item` (`id`),
  CONSTRAINT `FK_TOPPING` FOREIGN KEY (`toppings_id`) REFERENCES `Topping` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item_Topping`
--

LOCK TABLES `Item_Topping` WRITE;
/*!40000 ALTER TABLE `Item_Topping` DISABLE KEYS */;
/*!40000 ALTER TABLE `Item_Topping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` float NOT NULL,
  `sale` int DEFAULT NULL,
  `image` longtext NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKexqqeaksnmmku5py194ywp140` (`category_id`),
  CONSTRAINT `FK_PRODUCT_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`),
  CONSTRAINT `FKexqqeaksnmmku5py194ywp140` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (4,'Choco Cream Cake hạt dẻ',40000,10,'image/product/chanh-leo-tran-chau-suong-mai.png',3),(5,'Chanh Leo Trân Châu Sương Mai',25000,20,'image/product/chanh-leo-tran-chau-suong-mai.png',6),(6,'Hồng long xoài trân châu baby',100000,20,'image/product/hong-long-xoai-tran-chau-baby.png',5),(7,'Hồng trà bưởi mật ong',39000,10,'image/product/hong-tra-buoi-mat-ong.png',3),(8,'Oolong Trân châu Baby Kem Café',25000,15,'image/product/tran-chau-baby-kem-cafe.png',6),(9,'Probi bưởi trân châu sương mai',25000,15,'image/product/buoi-chan-trau-suong-mai.png',6),(10,'Probi xoài trân châu sương mai',25000,15,'image/product/xoai-tran-chau-suong-mai.png',6),(11,'Trà sữa Panda',25000,15,'image/product/tra-sua-panda.png',6),(12,'Trà sữa khoai môn hoàng kim',25000,15,'image/product/tra-sua-khoai-mon-hoang-kim.png',6),(13,'Trà sữa trân châu hoàng gia',25000,15,'image/product/tra-sua-tran-chau-hoang-gia.png',6),(14,'Ô Long Kiwi QQ',25000,15,'image/product/o-long-kiwi-qq.png',6),(15,'cafe',20000,10,'image/product/cafe.png',3);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Receipt`
--

DROP TABLE IF EXISTS `Receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Receipt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receipt`
--

LOCK TABLES `Receipt` WRITE;
/*!40000 ALTER TABLE `Receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `Receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Size`
--

DROP TABLE IF EXISTS `Size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Size`
--

LOCK TABLES `Size` WRITE;
/*!40000 ALTER TABLE `Size` DISABLE KEYS */;
INSERT INTO `Size` VALUES (1,'Size M'),(2,'Size S'),(3,'Size L');
/*!40000 ALTER TABLE `Size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sugar`
--

DROP TABLE IF EXISTS `Sugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sugar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sugar_percent` int NOT NULL,
  `sugarPercent` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sugar`
--

LOCK TABLES `Sugar` WRITE;
/*!40000 ALTER TABLE `Sugar` DISABLE KEYS */;
INSERT INTO `Sugar` VALUES (1,100,NULL),(2,75,NULL),(3,50,NULL);
/*!40000 ALTER TABLE `Sugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Topping`
--

DROP TABLE IF EXISTS `Topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Topping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` float NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Topping`
--

LOCK TABLES `Topping` WRITE;
/*!40000 ALTER TABLE `Topping` DISABLE KEYS */;
INSERT INTO `Topping` VALUES (1,8000,'Trân châu sợi'),(2,8000,'Rau Câu'),(3,8000,'Thạch Cafe'),(4,8000,'Trân châu baby'),(5,8000,'Trân châu hoàng kim'),(6,8000,'Pudding'),(7,8000,'Đậu đỏ');
/*!40000 ALTER TABLE `Topping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (6,1111,'clothes','nothing','2021-05-21 15:25:17','2021-05-21 15:25:17');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url_image` varchar(1000) NOT NULL,
  `quantity` int NOT NULL,
  `quantity_sold` int NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `repository_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `fk_product1_category` (`category_id`),
  KEY `fk_product1_repository` (`repository_id`),
  CONSTRAINT `fk_product1_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_product1_repository` FOREIGN KEY (`repository_id`) REFERENCES `repository` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (4,123,'polo shirt','nothing','google',12,0,'2021-05-21 15:32:29','2021-05-21 15:32:29',1,6);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository`
--

DROP TABLE IF EXISTS `repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repository` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repository_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repository_id` (`repository_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository`
--

LOCK TABLES `repository` WRITE;
/*!40000 ALTER TABLE `repository` DISABLE KEYS */;
INSERT INTO `repository` VALUES (1,12345,'hanoi','Hà Nội','2021-05-21 14:25:40','2021-05-21 14:25:40'),(3,12346,'hanoi','Hà Nội','2021-05-21 14:27:30','2021-05-21 14:27:30');
/*!40000 ALTER TABLE `repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'TocotocoSpring'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-16  9:58:39
