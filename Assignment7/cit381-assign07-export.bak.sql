-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: assign06
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `media_only`
--

DROP TABLE IF EXISTS `media_only`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `media_only` (
  `media_only` tinyint(1) NOT NULL,
  `link_flair_template_id` varchar(45) DEFAULT NULL,
  `can_gild` tinyint(1) DEFAULT NULL,
  `spoiler` tinyint(1) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `author_flair_text` varchar(45) DEFAULT NULL,
  `visited` tinyint(1) DEFAULT NULL,
  `num_reports` int(11) DEFAULT NULL,
  `distinguished` varchar(45) DEFAULT NULL,
  `mod_reason_by` varchar(45) DEFAULT NULL,
  `removal_reason` varchar(45) DEFAULT NULL,
  `link_flair_background_color` varchar(45) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `is_robot_indexable` varchar(45) DEFAULT NULL,
  `reports_reasons` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `num_crossposts` int(11) DEFAULT NULL,
  `num_comments` int(11) DEFAULT NULL,
  `send_replies` tinyint(1) DEFAULT NULL,
  `whitelist_status` varchar(45) DEFAULT NULL,
  `mod_reports` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`media_only`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_only`
--

LOCK TABLES `media_only` WRITE;
/*!40000 ALTER TABLE `media_only` DISABLE KEYS */;
INSERT INTO `media_only` VALUES (1,'null',0,0,0,'null',0,0,'null','null','null',NULL,'9yfoc','1','1','Cyberthere',0,7,1,'all_ads',NULL),(2,'null',0,0,0,'null',1,1,'null','null','null',NULL,'4rmda','1','0','Aecial',0,2,1,'all_ads',NULL),(3,'null',0,0,0,'null',0,0,'null','null','null',NULL,'4piod','1','0','windowsrcer',0,5,1,'all_ads',NULL),(4,'null',0,0,0,'null',0,0,'null','null','null',NULL,'6asts','1','0','speckz',0,3,1,'all_ads',NULL),(5,'null',0,0,0,'null',1,1,'null','null','null',NULL,'4bqik','1','0','rb1611282',0,8,1,NULL,NULL);
/*!40000 ALTER TABLE `media_only` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Cyperthere'),(2,'Aecial'),(3,'windowsrcer'),(4,'speckz'),(5,'t4_45q4v');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'assign06'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-01 18:31:59
