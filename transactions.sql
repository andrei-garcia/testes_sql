-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bancoEstrutural
-- ------------------------------------------------------
-- Server version	5.7.42-log

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
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wallet_id` int(10) unsigned NOT NULL,
  `amount` decimal(20,9) NOT NULL,
  `created_at` datetime NOT NULL,
  `type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `src` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,255.550000000,'2023-09-01 11:04:42','credit','approved','deposit_charge'),(2,1,255.550000000,'2023-09-01 14:05:24','credit','approved','deposit_charge'),(3,1,300.550000000,'2023-09-01 15:05:46','credit','approved','deposit_charge'),(4,1,600.550000000,'2023-09-01 16:05:46','credit','approved','deposit_charge'),(5,2,355.000000000,'2023-09-01 16:26:47','credit','approved','deposit_charge'),(6,2,400.550000000,'2023-09-01 17:26:47','credit','approved','deposit_charge'),(7,2,600.660000000,'2023-09-01 19:26:47','credit','approved','deposit_charge'),(8,2,800.550000000,'2023-09-01 19:35:47','credit','approved','deposit_charge'),(9,1,600.550000000,'2023-09-01 17:05:46','credit','approved','deposit_charge'),(10,2,800.550000000,'2023-09-01 22:35:47','credit','approved','deposit_charge'),(11,3,400.000000000,'2023-09-02 01:18:13','credit','approved','deposit_charge'),(12,3,600.000000000,'2023-09-02 01:18:13','credit','approved','deposit_charge'),(13,3,700.000000000,'2023-09-02 01:19:07','credit','approved','deposit_charge'),(14,4,555.000000000,'2023-09-02 01:53:23','credit','approved','deposit_charge'),(15,4,666.000000000,'2023-09-02 01:53:23','credit','approved','deposit_charge'),(16,4,966.000000000,'2023-09-02 01:54:03','credit','approved','deposit_charge');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-02  3:19:23
