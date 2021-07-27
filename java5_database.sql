-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: java5_database
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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (3,'Chè'),(4,'Fresh Fruit Tea'),(5,'Macchiato'),(6,'Trà sữa');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ice`
--

DROP TABLE IF EXISTS `ice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ice_percent` int NOT NULL,
  `icePercent` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ice`
--

LOCK TABLES `ice` WRITE;
/*!40000 ALTER TABLE `ice` DISABLE KEYS */;
INSERT INTO `ice` VALUES (1,101,NULL),(2,75,NULL),(3,50,NULL),(4,1,NULL);
/*!40000 ALTER TABLE `ice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
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
  CONSTRAINT `FK_ITEM_ICE` FOREIGN KEY (`ice_id`) REFERENCES `ice` (`id`),
  CONSTRAINT `FK_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_ITEM_SIZE` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `FK_ITEM_SUGAR` FOREIGN KEY (`sugar_id`) REFERENCES `sugar` (`id`),
  CONSTRAINT `FK_RECEIPT` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`),
  CONSTRAINT `FKddm68cs60y6ut3srss14mxyic` FOREIGN KEY (`sugar_id`) REFERENCES `sugar` (`id`),
  CONSTRAINT `FKe0es87ddfnjc34vb3atxiv0qm` FOREIGN KEY (`ice_id`) REFERENCES `ice` (`id`),
  CONSTRAINT `FKese81yfpu2o55cuhplvr0lxe8` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `FKt9no2hebi43y3umpo8xj3fadr` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (41,5,3,3,3,4,19),(42,8,3,3,3,2,19),(43,5,3,3,3,1,20),(44,5,3,3,3,1,21),(45,7,3,3,3,2,22),(46,5,3,3,3,1,23),(47,8,3,3,3,1,23),(48,5,3,3,1,1,24),(49,5,3,3,1,4,25),(50,7,3,4,1,1,26),(51,4,2,1,1,5,27),(52,12,3,4,1,3,28),(53,7,3,4,1,1,28),(54,4,3,4,1,1,29),(55,22,3,4,1,1,30),(56,21,3,4,1,1,31),(57,20,3,4,1,1,32),(58,5,3,4,1,1,33),(59,5,3,4,3,1,33),(60,15,3,4,3,5,34),(61,6,3,4,3,1,35),(62,6,3,4,3,1,35),(63,15,3,4,4,1,36),(64,7,3,4,4,1,36),(65,5,3,4,4,3,37),(66,10,3,4,4,1,38),(67,11,3,4,4,1,38),(68,9,3,4,4,1,38);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_topping`
--

DROP TABLE IF EXISTS `item_topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_topping` (
  `item_id` int DEFAULT NULL,
  `topping_id` int DEFAULT NULL,
  KEY `FK_ITEM` (`item_id`),
  KEY `FK_TOPPING` (`topping_id`),
  CONSTRAINT `FK_ITEM` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_TOPPING` FOREIGN KEY (`topping_id`) REFERENCES `topping` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_topping`
--

LOCK TABLES `item_topping` WRITE;
/*!40000 ALTER TABLE `item_topping` DISABLE KEYS */;
INSERT INTO `item_topping` VALUES (41,1),(41,2),(41,3),(42,1),(42,2),(42,3),(44,1),(47,1),(47,2),(49,1),(49,2),(49,3),(51,1),(51,2),(51,3),(51,4),(51,5),(61,1),(61,2),(61,3),(61,4),(61,5),(61,6),(61,7),(62,1),(62,2),(62,3),(62,4),(62,5),(62,6),(62,7),(64,1),(64,2),(64,3),(64,4),(68,1),(68,2),(68,3);
/*!40000 ALTER TABLE `item_topping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` float NOT NULL,
  `sale` int DEFAULT NULL,
  `image` longtext NOT NULL,
  `category_id` int NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'không có dữ liệu',
  PRIMARY KEY (`id`),
  KEY `FKexqqeaksnmmku5py194ywp140` (`category_id`),
  CONSTRAINT `FK_PRODUCT_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKexqqeaksnmmku5py194ywp140` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (4,'Choco Cream Cake hạt dẻ',40000,10,'images/product/Screenshot from 2021-06-19 21-31-38.png',4,'không có dữ liêu'),(5,'Chanh Leo Trân Châu Sương Mai',25000,20,'images/product/chanh-leo-tran-chau-suong-mai.png',6,'không có dữ liêu'),(6,'Hồng long xoài trân châu baby',100000,20,'images/product/hong-long-xoai-tran-chau-baby.png',5,'không có dữ liêu'),(7,'Hồng trà bưởi mật ong',39000,10,'images/product/Screenshot from 2021-06-17 22-07-42.png',3,'không có dữ liêu'),(8,'Oolong Trân châu Baby Kem Café',25000,15,'images/product/tran-chau-baby-kem-cafe.png',6,'không có dữ liêu'),(9,'Probi bưởi trân châu sương mai',25000,15,'images/product/buoi-chan-trau-suong-mai.png',6,'không có dữ liêu'),(10,'Probi xoài trân châu sương mai',25000,15,'images/product/xoai-tran-chau-suong-mai.png',6,'không có dữ liêu'),(11,'Trà sữa Panda',25000,15,'images/product/tra-sua-panda.png',6,'không có dữ liêu'),(12,'Trà sữa khoai môn hoàng kim',25000,15,'images/product/tra-sua-khoai-mon-hoang-kim.png',6,'không có dữ liêu'),(13,'Trà sữa trân châu hoàng gia',25000,15,'images/product/tra-sua-tran-chau-hoang-gia.png',6,'không có dữ liêu'),(14,'Ô Long Kiwi QQ',25000,15,'images/product/o-long-kiwi-qq.png',6,'không có dữ liêu'),(15,'cafe',20000,10,'images/product/cafe.png',3,'không có dữ liêu'),(20,'Bear',111,10,'images/product/Screenshot from 2021-06-17 16-44-39.png',3,'asdfasdf'),(21,'SuongNguyen',111,0,'images/product/Screenshot from 2021-06-19 21-31-38.png',4,'Beo'),(22,'Nguyen Van F',111,0,'images/product/Screenshot from 2021-06-17 22-07-42.png',4,'Beo'),(33,'asdfasfdasdf',111,1,'images/product/orange-mirinda.jpg',3,'asdfasdfs'),(34,'san pham',10000,0,'images/product/0063149.jpg',4,'khong co du lieu'),(35,'sdafasdf',121,0,'images/product/green-mirinda.jpg',3,'sadfasdfasdf');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_receipt_user` (`user_id`),
  CONSTRAINT `fk_receipt_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (19,'2021-06-19 00:00:00',1),(20,'2021-06-19 00:00:00',1),(21,'2021-06-19 00:00:00',1),(22,'2021-06-19 00:00:00',1),(23,'2021-06-20 00:00:00',1),(24,'2021-06-21 00:00:00',2),(25,'2021-06-22 00:00:00',1),(26,'2021-06-24 00:00:00',1),(27,'2021-06-24 00:00:00',1),(28,'2021-06-24 00:00:00',5),(29,'2021-06-24 00:00:00',5),(30,'2021-06-24 00:00:00',5),(31,'2021-06-24 00:00:00',5),(32,'2021-06-24 00:00:00',1),(33,'2021-06-24 00:00:00',5),(34,'2021-06-24 00:00:00',5),(35,'2021-06-24 00:00:00',1),(36,'2021-06-25 00:00:00',5),(37,'2021-06-25 00:00:00',1),(38,'2021-06-25 00:00:00',1);
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'Size M'),(2,'Size S'),(3,'Size L'),(4,'XMLA');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugar`
--

DROP TABLE IF EXISTS `sugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sugar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sugar_percent` int NOT NULL,
  `sugarPercent` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugar`
--

LOCK TABLES `sugar` WRITE;
/*!40000 ALTER TABLE `sugar` DISABLE KEYS */;
INSERT INTO `sugar` VALUES (1,101,NULL),(2,75,NULL),(3,50,NULL);
/*!40000 ALTER TABLE `sugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topping`
--

DROP TABLE IF EXISTS `topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` float NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topping`
--

LOCK TABLES `topping` WRITE;
/*!40000 ALTER TABLE `topping` DISABLE KEYS */;
INSERT INTO `topping` VALUES (1,8000,'Trân châu sợi'),(2,8000,'Rau Câu'),(3,8000,'Thạch Cafe'),(4,8000,'Trân châu baby'),(5,8000,'Trân châu hoàng kim'),(6,8000,'Pudding'),(7,8000,'Đậu đỏ'),(8,10001,'trân châu');
/*!40000 ALTER TABLE `topping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','ha noi','suong@gmail.com','01','ROLE_ADMIN',_binary ''),(2,'nguyenvansuong','nguyenvansuong',NULL,'suongnguyenytm2001@gmail.com',NULL,'ROLE_USER',_binary ''),(5,'lelongdung','123456789','Ha Noi','admin@gmail.com','+84387958475','ROLE_USER',_binary ''),(16,'asdflasdfkjl','lkasjfdlkajsdflkasd','asdflkasjdf','suongnguyenytm2001@gmail.com','0387958475','ROLE_USER',_binary ''),(17,'adfasdfasdf','asdfasdfasdf','sadfasdfasd','suongnguyenytm2001@gmail.com','0387958475','ROLE_USER',_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'java5_database'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-29 12:52:05
