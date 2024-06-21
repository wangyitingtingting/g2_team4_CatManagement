-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: pet
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `animals`
--

DROP TABLE IF EXISTS `animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animals` (
  `AnimalId` int NOT NULL AUTO_INCREMENT,
  `AnimalName` varchar(50) DEFAULT NULL,
  `AnimalType` varchar(50) DEFAULT NULL,
  `AnimalGender` varchar(50) DEFAULT NULL,
  `Health` varchar(50) DEFAULT NULL,
  `LYStatus` varchar(10) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `PicAnimal` varchar(255) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AnimalId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
INSERT INTO `animals` VALUES (7,'小一','1','0','健康','0',8,'imgs/5f2fbb008e484ac9abcfb6aac153c327.jpeg',NULL),(8,'小花','0','1','不健康','0',3,'imgs/eea833caff97497d8068d0dfcc38600e.jpg',NULL),(9,'娃娃','1','0','健康','1',2,'imgs/cd3ef6dca58b4542aa4df138318098a0.jpg','ppp'),(10,'小花花','0','0','健康','1',6,'imgs/9376d213e90944d288d5afeb5595fba7.jpg','小明'),(11,'开开','0','0','健康','0',9,'imgs/6bcf0ddfe4814d4685983e032ae93607.jpg',NULL),(12,'123','0','0','健康','0',1,'imgs/e3c879488b994c63ac5578cd7d59be29.jpg',NULL),(13,'dog','1','0','健康','0',4,'imgs/83cd3bedad874daabbad78a76db1fe96.jpeg',NULL),(14,'小d','1','0','健康','0',12,'imgs/ebebd75cdd244b3dae8a5d4a383939fc.png',NULL),(15,'心心','0','0','健康','0',7,'imgs/8ce02d01bcba4715835705e538011b17.jpg',NULL);
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-21 15:27:37
