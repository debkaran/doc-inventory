CREATE DATABASE  IF NOT EXISTS `doc_inventory` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `doc_inventory`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: doc_inventory
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `default_user_space`
--

DROP TABLE IF EXISTS `default_user_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_user_space` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storage_space` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_user_space`
--

LOCK TABLES `default_user_space` WRITE;
/*!40000 ALTER TABLE `default_user_space` DISABLE KEYS */;
INSERT INTO `default_user_space` VALUES (1,5);
/*!40000 ALTER TABLE `default_user_space` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_default_user_space_update` AFTER UPDATE ON `default_user_space` FOR EACH ROW BEGIN
	DECLARE balance_space float;
    set balance_space = new.storage_space - old.storage_space;
    SET SQL_SAFE_UPDATES = 0;
    INSERT INTO default_user_space_log(old_storage_space, new_storage_space)
        VALUES(old.storage_space, new.storage_space);
    update user_details set storage_space = storage_space + balance_space 
		where role = 'user';
	SET SQL_SAFE_UPDATES = 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `default_user_space_log`
--

DROP TABLE IF EXISTS `default_user_space_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_user_space_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `old_storage_space` float NOT NULL,
  `new_storage_space` float NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_user_space_log`
--

LOCK TABLES `default_user_space_log` WRITE;
/*!40000 ALTER TABLE `default_user_space_log` DISABLE KEYS */;
INSERT INTO `default_user_space_log` VALUES (4,5,6,'2021-06-12 23:38:00'),(5,6,5,'2021-06-12 23:42:25'),(6,5,7,'2021-06-13 11:02:05'),(7,7,5,'2021-06-13 11:02:58'),(8,5,5,'2021-06-13 11:04:02'),(9,5,5,'2021-06-13 11:04:24'),(10,5,10,'2021-06-13 11:05:24'),(11,10,5,'2021-06-13 11:05:40'),(12,5,7,'2021-06-13 11:06:40'),(13,7,2,'2021-06-13 11:08:06'),(14,2,5,'2021-06-13 11:08:49');
/*!40000 ALTER TABLE `default_user_space_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_file_details`
--

DROP TABLE IF EXISTS `temp_file_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_file_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT 'forign key of user_details(id)',
  `file_name` text NOT NULL COMMENT 'only file name',
  `file_type` varchar(2) NOT NULL COMMENT 'f = file, d = directory',
  `file_path` text NOT NULL COMMENT 'fully qualified file name',
  `content_type` varchar(100) NOT NULL,
  `file_size` float NOT NULL COMMENT 'In bytes',
  `physical_upload_directory` text NOT NULL,
  `relative_upload_directory` text NOT NULL,
  `parent_directory_name` varchar(256) NOT NULL COMMENT 'only selected upload folder',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_file_details`
--

LOCK TABLES `temp_file_details` WRITE;
/*!40000 ALTER TABLE `temp_file_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_file_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(250) DEFAULT NULL,
  `pass` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (2,'suvankarsen@outlook.com','123'),(3,'suvankarsen@outlook.com','858589');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(6) NOT NULL DEFAULT 'user' COMMENT 'admin/user',
  `password` varchar(256) NOT NULL,
  `profile_picture` text NOT NULL,
  `storage_space` float NOT NULL,
  `dob` date NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Account created date',
  `last_login_time` datetime DEFAULT NULL,
  `no_of_failure_login` int NOT NULL DEFAULT '0',
  `last_failure_login_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (2,'Ram','ram@gmail.com','user','ram','/home/deb/Downloads/nature.jpeg',5,'2021-04-30',NULL,NULL,0,NULL,0,0),(9,'user1','user1@gmail.com','user','passOfUser1','c:\\default_picture.jpg',5,'1989-10-15','2021-06-12 18:31:08',NULL,0,NULL,0,0),(10,'user2','user2@gmail.com','user','passOfUser2','c:\\default_picture.jpg',5,'1989-10-15','2021-06-12 20:27:10',NULL,0,NULL,0,0),(39,'Deb Karan Singhania','debkaransinghania@gmail.com','user','debkaran','http://localhost:8080/doc-inventory/profile-image?text=D',5,'1999-12-26','2021-07-01 18:47:40',NULL,0,NULL,0,0),(42,'Suvankar Sen','suvankarsen89@gmail.com','user','123456','http://localhost:8080/doc-inventory/profile-image?text=S',5,'2020-12-27','2021-07-02 10:38:41',NULL,4,'2021-07-06 09:28:16',0,0);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_otp_details`
--

DROP TABLE IF EXISTS `user_otp_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_otp_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `source_page` varchar(100) DEFAULT NULL,
  `otp` varchar(512) DEFAULT NULL,
  `otp_generation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_used` tinyint(1) DEFAULT '0',
  `is_delete` tinyint DEFAULT '0',
  `is_expired` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_otp_details`
--

LOCK TABLES `user_otp_details` WRITE;
/*!40000 ALTER TABLE `user_otp_details` DISABLE KEYS */;
INSERT INTO `user_otp_details` VALUES (2,20,NULL,'vWEaZCxw','2021-06-14 11:30:15',0,0,1),(3,21,NULL,'qiA22fxN','2021-06-14 12:05:04',0,0,1),(4,24,NULL,'D9MZ24f7','2021-06-14 14:08:16',0,0,1),(6,26,NULL,'uRA5dZTw','2021-06-19 11:00:11',0,0,1),(7,27,NULL,'zoyIoMpA','2021-06-19 11:08:49',0,0,1),(8,28,NULL,'enx6z1lc','2021-06-19 11:19:47',0,0,1),(9,30,NULL,'8ApRaVfA','2021-06-19 11:29:38',0,0,1),(10,31,NULL,'ZBdetfYZ','2021-06-19 11:31:53',0,0,1),(11,32,NULL,'YQynHtV8','2021-06-19 11:37:48',0,0,1),(19,39,'registration','mEdenpnx','2021-07-01 18:47:41',0,0,1),(22,42,'registration','QSRF9qH2','2021-07-02 10:38:41',1,1,1),(23,42,'registration','OdNA3zlm','2021-07-05 09:48:26',1,1,1),(24,42,'registration','QngJz1qB','2021-07-05 09:48:29',1,1,1),(25,42,'registration','slVuZiRB','2021-07-05 09:48:30',1,1,1),(26,42,'registration','RHqUSEYO','2021-07-05 09:48:31',0,0,1);
/*!40000 ALTER TABLE `user_otp_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'doc_inventory'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `otp_expired_event` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `otp_expired_event` ON SCHEDULE EVERY 1 MINUTE STARTS '2021-07-02 09:36:05' ON COMPLETION PRESERVE ENABLE DO UPDATE user_otp_details 
		SET 
			`is_expired` = TRUE
		WHERE
			`otp_generation_date` < (NOW() - INTERVAL 10 MINUTE)
				AND `is_expired` IS FALSE */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'doc_inventory'
--
/*!50003 DROP PROCEDURE IF EXISTS `CreateAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateAccount`(IN `name` VARCHAR(100), IN `email` VARCHAR(100), IN `password` VARCHAR(256), IN `profile_picture` TEXT, IN `dob` DATE, OUT `l_account_id` INT)
BEGIN
    DECLARE s_space float DEFAULT 0.0;
    
    START TRANSACTION;
    
SELECT 
    storage_space
INTO s_space FROM
    default_user_space;
        
	SELECT s_space;
    
        INSERT INTO user_details(`name`, `email`,  `password`, `profile_picture`, `storage_space`, `dob`)
    VALUES(name, email, password, profile_picture, s_space, dob);
    
        SET l_account_id = LAST_INSERT_ID();
    
    	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-30 19:43:39
