-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: 192.168.122.20    Database: bl
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название группы',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Группы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'sit','2004-06-07 16:45:00','2021-02-28 19:47:57'),(2,'aut','1975-07-14 21:07:39','1997-12-21 00:04:07'),(3,'eius','2010-04-20 14:20:36','1987-07-04 20:10:37'),(4,'deleniti','1970-02-15 11:01:19','1970-06-08 14:54:53'),(5,'ratione','1987-05-06 04:33:51','1979-12-13 10:45:15'),(6,'rerum','1990-10-22 14:48:24','1971-09-03 17:59:16'),(7,'quisquam','1980-10-08 02:13:28','1974-12-05 08:48:24'),(8,'inventore','1977-10-24 19:24:52','1975-07-06 09:51:44'),(9,'minus','1996-10-26 12:25:32','1972-07-16 06:31:24'),(10,'nesciunt','1993-12-27 11:24:22','1980-06-22 04:29:09'),(11,'mollitia','2019-06-09 23:24:15','1980-10-12 18:23:29'),(12,'dolorum','2019-01-06 13:01:00','1996-09-09 16:06:35'),(13,'quas','2000-09-27 02:37:52','2001-04-14 05:11:25'),(14,'dolor','2002-06-28 08:09:33','2000-01-23 23:59:43'),(15,'quo','2011-01-20 22:45:27','1983-06-10 07:01:11');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_users` (
  `community_id` int unsigned NOT NULL COMMENT 'Ссылка на группу',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`community_id`,`user_id`) COMMENT 'Составной первичный ключ',
  KEY `communities_users_user_id` (`user_id`),
  CONSTRAINT `communities_users_community_id_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `communities_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Участники групп, связь между пользователями и группами';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
INSERT INTO `communities_users` VALUES (1,1,'1988-02-18 09:16:28'),(1,6,'1999-12-30 02:35:08'),(1,16,'1998-04-07 00:12:52'),(2,2,'1992-05-22 18:41:53'),(2,7,'2006-05-28 13:28:15'),(2,17,'2011-09-25 06:39:27'),(3,3,'1996-11-06 11:02:15'),(3,8,'2005-04-13 07:47:12'),(3,18,'1982-02-09 08:06:45'),(4,4,'2005-03-27 10:16:30'),(4,9,'1994-06-07 19:14:28'),(4,19,'1997-11-16 16:00:30'),(5,5,'1971-07-28 18:28:46'),(5,10,'1980-01-17 04:37:24'),(5,20,'1983-08-16 06:21:53'),(6,6,'1995-06-06 16:30:37'),(6,11,'1976-12-03 23:09:59'),(6,21,'2005-10-06 19:18:00'),(7,7,'2011-04-06 18:39:48'),(7,12,'1994-04-26 11:36:47'),(7,22,'1970-04-13 18:09:50'),(8,8,'1996-08-06 15:59:16'),(8,13,'2018-05-26 00:22:02'),(8,23,'1990-01-23 23:42:03'),(9,9,'2001-10-03 15:53:22'),(9,14,'1970-07-07 13:30:09'),(9,24,'2009-11-27 21:46:25'),(10,10,'2002-11-04 03:18:24'),(10,15,'1981-03-23 17:04:47'),(10,25,'2006-10-30 04:21:26'),(11,1,'1992-12-16 10:09:44'),(11,11,'2008-03-16 12:25:18'),(11,16,'2017-06-19 18:56:52'),(12,2,'1986-12-19 10:46:47'),(12,12,'1999-05-14 14:40:47'),(12,17,'1986-06-13 23:38:53'),(13,3,'1976-02-06 14:15:58'),(13,13,'2002-03-07 14:12:49'),(13,18,'1986-07-05 05:17:39'),(14,4,'2015-11-21 11:44:50'),(14,14,'1977-03-04 15:10:53'),(14,19,'2007-04-27 16:17:26'),(15,5,'2001-10-30 17:33:08'),(15,15,'2004-02-16 23:16:06'),(15,20,'2000-09-08 03:50:48');
/*!40000 ALTER TABLE `communities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship` (
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `friend_id` int unsigned NOT NULL COMMENT 'Ссылка на друга пользователя',
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время отправления приглашения дружить',
  `confirmed_at` datetime DEFAULT NULL COMMENT 'Время подтверждения приглашения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  `request_type_id` int unsigned NOT NULL COMMENT 'Ссылка на тип запроса',
  PRIMARY KEY (`user_id`,`friend_id`),
  KEY `friendship_friend_id` (`friend_id`),
  KEY `friendship_request_type_id` (`request_type_id`),
  CONSTRAINT `friendship_friend_id` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friendship_request_type_id` FOREIGN KEY (`request_type_id`) REFERENCES `friendship_request_types` (`id`),
  CONSTRAINT `friendship_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
INSERT INTO `friendship` VALUES (1,1,'2019-10-04 12:49:38','1974-05-01 21:15:43','1972-12-20 20:54:50','2021-02-17 14:50:35',1),(2,2,'1984-06-24 17:09:19','1978-12-01 19:15:05','2009-06-07 04:09:15','1977-11-20 04:45:21',2),(3,3,'1972-09-13 13:02:41','2016-01-25 05:34:27','1980-01-30 02:15:09','1977-06-05 13:14:59',3),(4,4,'2012-05-23 22:13:56','2013-05-14 09:18:06','2014-09-16 13:29:00','1997-06-16 03:16:38',1),(5,5,'1977-07-20 08:36:03','2012-10-24 14:09:26','2009-05-03 01:11:57','1996-04-11 15:03:12',2),(6,6,'1996-05-16 16:26:27','2007-07-16 04:34:10','1972-04-23 02:00:16','1998-05-10 03:13:28',3),(7,7,'1996-03-17 02:13:50','1985-11-03 06:50:34','1975-05-10 19:22:25','1992-11-20 01:34:52',1),(8,8,'1996-11-27 22:25:00','1976-11-06 05:31:25','1990-08-26 09:52:59','1988-09-29 06:23:09',2),(9,9,'2020-02-21 23:15:52','1995-09-30 06:34:45','2014-04-09 04:59:45','1976-10-09 07:50:36',3),(10,10,'1995-12-27 14:48:03','2003-03-12 03:57:35','2006-04-07 14:11:43','1993-03-01 01:16:13',1),(11,11,'2019-02-13 00:39:38','2007-11-30 20:06:07','1976-11-02 00:21:16','1980-12-23 18:56:33',2),(12,12,'1998-10-14 02:12:30','1971-10-17 20:18:09','2012-05-07 16:30:46','2008-12-18 11:31:11',3),(13,13,'2016-01-12 13:46:34','1978-11-23 03:03:50','1986-08-22 15:21:05','1990-09-10 07:23:19',1),(14,14,'1975-11-17 18:56:25','2004-02-16 13:53:37','1988-09-22 14:59:55','2004-04-11 23:17:55',2),(15,15,'1988-03-01 18:43:07','1987-04-24 19:28:33','2004-08-12 17:16:17','1973-12-10 00:39:46',3),(16,16,'1988-04-02 12:58:49','2019-04-23 12:14:35','1977-04-15 14:55:25','1980-06-06 08:01:49',1),(17,17,'1979-06-18 09:42:13','1998-11-04 12:40:03','2002-12-11 02:33:04','2002-02-08 02:04:09',2),(18,18,'1996-10-25 11:04:51','2002-01-04 00:22:01','1979-11-25 01:35:31','1986-04-30 04:46:02',3),(19,19,'1994-02-10 22:25:48','1981-02-23 14:10:35','1982-02-19 22:37:01','1985-04-13 05:00:48',1),(20,20,'2015-10-07 03:58:52','1987-06-13 14:02:56','1995-12-23 15:26:59','1972-05-19 15:12:49',2),(21,21,'2004-06-11 20:33:14','1986-04-17 07:26:27','1973-12-27 00:29:30','1994-11-11 23:25:40',3),(22,22,'2019-11-23 01:13:26','1979-12-09 13:31:52','2019-12-18 01:12:19','2013-09-07 08:48:56',1),(23,23,'2018-07-23 13:22:18','1997-11-10 07:30:20','1971-07-07 10:46:47','1998-07-14 19:25:23',2),(24,24,'1985-08-23 23:07:55','2002-02-05 05:09:47','1971-02-11 20:12:51','2012-10-05 21:19:13',3),(25,25,'2010-05-03 07:17:54','2018-07-16 11:48:51','1983-09-07 11:25:30','2009-08-31 18:44:22',1);
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship_request_types`
--

DROP TABLE IF EXISTS `friendship_request_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship_request_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название статуса',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Типы запроса на дружбы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship_request_types`
--

LOCK TABLES `friendship_request_types` WRITE;
/*!40000 ALTER TABLE `friendship_request_types` DISABLE KEYS */;
INSERT INTO `friendship_request_types` VALUES (1,'architecto','1982-05-29 05:33:56','1986-03-14 01:06:45'),(2,'dolores','2014-09-10 12:32:23','2000-04-22 19:24:16'),(3,'totam','1974-05-06 10:59:25','1974-01-21 06:51:43');
/*!40000 ALTER TABLE `friendship_request_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instances_ids`
--

DROP TABLE IF EXISTS `instances_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instances_ids` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'content_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='unique identifier for all content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instances_ids`
--

LOCK TABLES `instances_ids` WRITE;
/*!40000 ALTER TABLE `instances_ids` DISABLE KEYS */;
INSERT INTO `instances_ids` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100);
/*!40000 ALTER TABLE `instances_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `user_id` int unsigned NOT NULL COMMENT 'who liked?',
  `content_id` int unsigned NOT NULL COMMENT 'content type id',
  PRIMARY KEY (`user_id`,`content_id`),
  KEY `content_id` (`content_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `instances_ids` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='LIKES';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1),(1,2),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(1,26),(2,27),(3,28),(4,29),(5,30),(6,31),(7,32),(8,33),(9,34),(10,35),(11,36),(12,37),(13,38),(14,39),(15,40),(16,41),(17,42),(18,43),(19,44),(20,45),(21,46),(22,47),(23,48),(24,49),(25,50),(1,51),(2,52),(3,53),(4,54),(5,55),(6,56),(7,57),(8,58),(9,59),(10,60),(11,61),(12,62),(13,63),(14,64),(15,65),(16,66),(17,67),(18,68),(19,69),(20,70),(21,71),(22,72),(23,73),(24,74),(25,75),(1,76),(2,77),(3,78),(4,79),(5,80),(6,81),(7,82),(8,83),(9,84),(10,85),(11,86),(12,87),(13,88),(14,89),(15,90),(16,91),(17,92),(18,93),(19,94),(20,95),(21,96),(22,97),(23,98),(24,99),(25,100);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Путь к файлу',
  `size` int NOT NULL COMMENT 'Размер файла',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  `media_type_id` int unsigned NOT NULL COMMENT 'Ссылка на тип файла',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `media_media_type_id` (`media_type_id`),
  CONSTRAINT `media_instance_id` FOREIGN KEY (`id`) REFERENCES `instances_ids` (`id`),
  CONSTRAINT `media_media_type_id` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `media_chk_1` CHECK (json_valid(`metadata`))
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Медиафайлы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'dicta',73028445,'1980-02-06 05:26:41','2020-10-22 21:51:37',1,NULL),(2,'expedita',55976,'1976-08-13 12:25:00','1978-11-13 10:57:09',2,NULL),(3,'veniam',0,'2008-08-12 11:17:57','1987-11-28 03:18:30',3,NULL),(4,'et',9175430,'2020-01-19 10:34:33','2001-06-20 01:28:02',4,NULL),(5,'dolores',5888843,'2013-04-07 11:45:28','1985-05-21 09:35:25',5,NULL),(6,'at',0,'1998-07-04 02:48:13','1981-12-12 23:39:46',1,NULL),(7,'velit',4,'1980-02-19 19:58:14','2011-03-25 15:16:35',2,NULL),(8,'vel',9972769,'1992-06-23 14:37:22','1987-11-18 01:01:17',3,NULL),(9,'tempore',81,'1983-08-02 05:15:14','1992-07-16 23:10:07',4,NULL),(10,'officia',5513,'2009-12-03 21:53:44','1996-02-24 07:06:12',5,NULL),(11,'non',99317632,'1992-07-22 15:25:31','2001-06-24 15:10:51',1,NULL),(12,'veritatis',4204,'1999-01-27 11:16:20','2016-03-26 20:20:54',2,NULL),(13,'tenetur',258440,'1995-03-08 11:59:18','1975-10-12 01:25:31',3,NULL),(14,'ut',5538013,'2004-02-09 00:46:55','1994-07-03 18:06:48',4,NULL),(15,'aliquid',206993845,'1995-11-05 17:49:36','2009-03-25 04:47:38',5,NULL),(16,'possimus',5929,'1986-12-23 06:49:56','2011-04-10 17:11:43',1,NULL),(17,'repellat',2,'2019-05-04 09:08:20','1982-05-21 19:38:46',2,NULL),(18,'facilis',536810,'1980-07-10 09:03:42','2004-11-17 04:25:37',3,NULL),(19,'nostrum',830,'2003-07-02 03:16:48','1985-03-21 09:16:10',4,NULL),(20,'doloremque',8,'1995-04-27 18:06:48','1986-12-02 14:23:54',5,NULL),(21,'vitae',716798,'2019-04-18 00:23:38','1988-08-03 14:33:47',1,NULL),(22,'corrupti',816712,'2000-03-03 16:24:04','2006-10-31 17:43:19',2,NULL),(23,'itaque',97723898,'1986-03-03 07:24:48','1996-01-09 06:14:16',3,NULL),(24,'a',8561,'1999-03-25 15:24:40','1981-11-03 22:17:11',4,NULL),(25,'est',106748,'1976-02-11 22:32:13','1992-12-18 01:38:35',5,NULL),(26,'maxime',487,'2011-04-27 13:00:52','1977-11-04 10:07:59',1,NULL),(27,'odio',49608,'2010-05-10 20:19:18','2017-04-01 04:17:45',2,NULL),(28,'quod',395919,'1998-04-17 07:39:15','2015-04-25 17:23:57',3,NULL),(29,'eligendi',9159948,'2006-05-16 00:46:21','1986-12-19 19:04:17',4,NULL),(30,'sunt',2726,'2021-05-26 13:08:22','1999-03-29 06:06:28',5,NULL),(31,'nihil',403,'1976-07-21 09:02:48','1988-10-01 01:40:56',1,NULL),(32,'voluptatibus',6,'1989-01-17 23:20:15','2004-02-29 12:59:48',2,NULL),(33,'eum',301510,'2012-12-27 16:06:32','1974-04-22 11:34:11',3,NULL),(34,'provident',669401,'1990-05-12 13:39:42','2015-05-12 18:03:41',4,NULL),(35,'hic',0,'2018-09-20 19:36:22','2021-04-24 22:45:40',5,NULL),(36,'ad',56988988,'1996-08-14 19:03:03','2013-08-27 02:17:10',1,NULL),(37,'repellendus',258162,'1995-05-15 22:16:41','2014-03-26 12:03:42',2,NULL),(38,'delectus',536100591,'2010-02-23 05:12:14','2017-05-19 13:39:14',3,NULL),(39,'ex',78,'1979-04-01 23:23:55','2002-10-06 03:16:16',4,NULL),(40,'dolorum',6493,'1970-03-29 02:53:13','1989-04-27 02:08:10',5,NULL),(41,'cumque',8667809,'1990-04-05 13:25:25','2017-08-08 20:09:33',1,NULL),(42,'nam',12494304,'1970-09-27 04:06:45','2009-09-02 20:43:03',2,NULL),(43,'officiis',877,'1985-04-22 00:46:45','1997-04-25 06:49:09',3,NULL),(44,'autem',338009,'1994-05-15 11:50:49','2014-01-20 12:10:04',4,NULL),(45,'quis',1925995,'2012-10-21 06:22:28','2004-08-29 02:32:56',5,NULL),(46,'eius',8662,'2014-07-09 18:00:02','1978-05-15 21:12:00',1,NULL),(47,'id',3,'1984-09-22 19:15:55','1992-04-25 04:42:14',2,NULL),(48,'aut',94,'1990-09-19 17:04:51','1987-12-28 21:27:38',3,NULL),(49,'minus',58459391,'2015-12-06 04:27:52','2000-04-07 21:50:47',4,NULL),(50,'dolor',409399,'2012-08-14 22:05:26','1982-08-22 06:35:44',5,NULL),(51,'reprehenderit',1188835,'1997-03-23 11:11:19','2017-01-16 06:05:24',1,NULL),(52,'eos',157482984,'1987-09-04 20:13:56','1991-01-16 15:29:28',2,NULL),(53,'recusandae',61457004,'2011-12-05 08:53:17','1980-01-30 14:36:06',3,NULL),(54,'molestiae',7136,'1976-01-24 00:13:50','2008-05-30 07:13:18',4,NULL),(55,'enim',3,'1988-05-09 17:14:09','1998-12-06 17:40:58',5,NULL),(56,'dignissimos',75696,'1996-12-11 22:27:17','2019-02-16 07:56:28',1,NULL),(57,'nemo',15,'1985-10-08 00:53:14','2014-12-14 19:13:37',2,NULL),(58,'perferendis',91644,'1991-03-18 11:42:10','1985-11-16 22:48:32',3,NULL),(59,'beatae',30347,'1971-06-25 02:40:07','2011-10-29 10:53:27',4,NULL),(60,'optio',4628820,'2014-10-18 07:35:49','1981-03-30 14:02:24',5,NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название типа',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Типы медиафайлов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'laboriosam','2003-01-04 18:32:57','2006-05-26 02:43:12'),(2,'quod','1999-01-27 01:18:45','1971-05-06 09:42:29'),(3,'unde','2017-06-05 22:47:39','1995-11-05 19:52:28'),(4,'et','2017-02-21 17:16:46','1985-04-06 05:45:53'),(5,'quia','2015-09-10 18:40:21','2015-05-19 15:28:02');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` int unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Текст сообщения',
  `is_important` tinyint(1) DEFAULT NULL COMMENT 'Признак важности',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `messages_from_user_id` (`from_user_id`),
  KEY `messages_to_user_id` (`to_user_id`),
  CONSTRAINT `messages_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Сообщения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Dormouse. \'Write that down,\' the King in a large mustard-mine near here. And the moral of that is, but I THINK I can guess that,\' she added in an undertone,.',0,0,'2021-09-10 09:16:03','1973-12-14 22:41:27'),(2,2,2,'She got up very sulkily and crossed over to the waving of the wood--(she considered him to be no chance of getting up and saying, \'Thank you, sir, for your interesting story,\' but she felt very.',1,1,'2008-08-09 09:02:47','2004-10-31 05:56:22'),(3,3,3,'Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'It must have a prize herself, you know,\' said the Cat. \'--so long as you are; secondly, because they\'re making such a thing as a partner!\' cried the.',1,1,'1983-11-10 04:18:14','1997-10-27 20:13:26'),(4,4,4,'First, however, she went on, half to herself, \'the way all the players, except the Lizard, who seemed ready to talk to.\' \'How are you getting on now, my dear?\' it continued, turning to Alice, very.',0,0,'1981-09-26 17:51:06','2013-06-26 23:51:46'),(5,5,5,'Seven flung down his brush, and had just succeeded in curving it down into a large caterpillar, that was lying under the window, and one foot to the executioner: \'fetch her here.\' And the Eaglet.',0,0,'2008-05-15 06:47:59','2002-01-17 09:37:13'),(6,6,6,'I hadn\'t mentioned Dinah!\' she said to the table to measure herself by it, and then added them up, and there they lay sprawling about, reminding her very much what would be QUITE as much use in.',1,0,'1983-02-03 22:08:12','2015-08-09 17:33:24'),(7,7,7,'Crab took the opportunity of adding, \'You\'re looking for the pool as it was too small, but at any rate, the Dormouse turned out, and, by the time they were trying to find that her flamingo was gone.',1,1,'1983-02-10 09:16:20','2009-05-05 18:56:26'),(8,8,8,'Alice replied in an offended tone, and she was up to her in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an explanation; \'I\'ve none of my own. I\'m a deal too far off to other parts of.',0,1,'2017-07-16 23:53:11','2016-06-18 10:32:28'),(9,9,9,'I don\'t take this young lady to see it trot away quietly into the garden, where Alice could see, as she had caught the baby with some difficulty, as it was not here before,\' said the King, and the.',0,1,'1976-05-04 06:07:56','1983-07-22 11:24:56'),(10,10,10,'I\'d only been the whiting,\' said Alice, \'and why it is to do that,\' said the Duchess; \'and the moral of that dark hall, and close to her, \'if we had the best way you can;--but I must go by the hand,.',0,0,'1987-12-10 11:15:29','2019-08-29 23:38:12'),(11,11,11,'Alice\'s elbow was pressed hard against it, that attempt proved a failure. Alice heard it say to itself, half to Alice. \'Nothing,\' said Alice. \'Why, there they lay sprawling about, reminding her very.',1,1,'1989-06-04 20:38:09','2000-06-12 07:23:26'),(12,12,12,'Hatter, who turned pale and fidgeted. \'Give your evidence,\' said the King had said that day. \'No, no!\' said the Caterpillar took the regular course.\' \'What was THAT like?\' said Alice. \'And ever.',0,1,'2011-01-31 18:57:22','2013-02-13 05:58:23'),(13,13,13,'Owl, as a drawing of a candle is like after the others. \'We must burn the house if it wasn\'t trouble enough hatching the eggs,\' said the March Hare. \'Exactly so,\' said the Cat, \'a dog\'s not mad. You.',0,1,'1984-05-02 13:47:28','2015-01-14 12:28:19'),(14,14,14,'It was all finished, the Owl, as a drawing of a sea of green leaves that lay far below her. \'What CAN all that stuff,\' the Mock Turtle, suddenly dropping his voice; and Alice was silent. The King.',1,1,'2009-12-08 11:21:16','1992-08-05 22:45:52'),(15,15,15,'KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, \'as all the same, shedding gallons of tears, but said nothing. \'Perhaps it hasn\'t one,\' Alice ventured to say. \'What is it?\' \'Why,\' said.',1,1,'1979-04-13 11:31:00','1999-01-11 21:00:07'),(16,16,16,'I shall have somebody to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the centre of the legs of the room. The cook threw a frying-pan after her as she could not tell.',1,0,'1978-03-12 10:27:13','2017-05-27 19:08:30'),(17,17,17,'I ever heard!\' \'Yes, I think that there was a very curious to know when the race was over. However, when they liked, and left foot, so as to size,\' Alice hastily replied; \'at least--at least I mean.',0,0,'2011-06-25 09:36:45','1992-01-05 23:42:37'),(18,18,18,'Cat again, sitting on the other was sitting on the top of the door began sneezing all at once. \'Give your evidence,\' said the Mock Turtle: \'why, if a fish came to ME, and told me he was speaking,.',0,1,'1986-01-17 01:33:52','1984-08-26 15:08:27'),(19,19,19,'Edgar Atheling to meet William and offer him the crown. William\'s conduct at first was in such long curly brown hair! And it\'ll fetch things when you have to fly; and the March Hare and his buttons,.',1,0,'1998-08-14 01:32:41','1977-06-21 19:22:32'),(20,20,20,'Once more she found herself in the morning, just time to be seen: she found her way into a chrysalis--you will some day, you know--and then after that savage Queen: so she sat down and cried. \'Come,.',0,1,'2001-02-25 12:40:29','1970-08-14 22:15:55'),(21,21,21,'Alice, very much pleased at having found out a race-course, in a rather offended tone, \'Hm! No accounting for tastes! Sing her \"Turtle Soup,\" will you, old fellow?\' The Mock Turtle went on, \'you.',0,1,'1977-03-13 10:53:40','2014-07-15 15:17:03'),(22,22,22,'Footman continued in the court!\' and the Dormouse go on for some time after the others. \'We must burn the house till she too began dreaming after a pause: \'the reason is, that there\'s any one left.',0,0,'1988-12-13 21:13:40','1986-04-24 23:38:29'),(23,23,23,'And the Eaglet bent down its head down, and was a long sleep you\'ve had!\' \'Oh, I\'ve had such a thing I ever saw in another moment, when she was about a thousand times as large as the doubled-up.',1,1,'1970-01-09 21:22:02','1995-11-20 08:39:44'),(24,24,24,'White Rabbit cried out, \'Silence in the world! Oh, my dear Dinah! I wonder what I like\"!\' \'You might just as if nothing had happened. \'How am I to get out again. That\'s all.\' \'Thank you,\' said the.',1,1,'1988-11-03 06:32:46','2014-02-16 09:19:30'),(25,25,25,'Five, who had been found and handed back to them, and the baby at her with large eyes full of the Mock Turtle, \'but if you\'ve seen them at dinn--\' she checked herself hastily, and said \'No, never\').',0,1,'1986-02-11 02:54:38','2009-01-12 02:23:00'),(26,1,1,'Alice said very humbly; \'I won\'t indeed!\' said the Dodo could not taste theirs, and the Dormouse turned out, and, by the carrier,\' she thought; \'and how funny it\'ll seem, sending presents to one\'s.',1,1,'1987-07-02 19:11:56','2011-05-17 19:32:09'),(27,2,2,'And oh, I wish you could only hear whispers now and then Alice dodged behind a great many teeth, so she began looking at the corners: next the ten courtiers; these were ornamented all over with.',1,1,'1985-11-27 22:30:21','1977-06-18 13:07:28'),(28,3,3,'YOUR business, Two!\' said Seven. \'Yes, it IS his business!\' said Five, in a shrill, loud voice, and see what was coming. It was opened by another footman in livery, with a trumpet in one hand, and a.',0,1,'1980-09-03 14:27:28','1987-10-02 02:41:37'),(29,4,4,'The only things in the flurry of the sense, and the great concert given by the officers of the game, the Queen said to herself. \'Of the mushroom,\' said the King. \'Nearly two miles high,\' added the.',1,1,'2013-10-08 07:55:36','2003-02-07 23:56:25'),(30,5,5,'March Hare, who had been looking over his shoulder as he found it made no mark; but he could think of nothing else to do, so Alice ventured to remark. \'Tut, tut, child!\' said the White Rabbit, \'but.',0,0,'2015-01-08 01:20:57','1977-01-02 02:01:37'),(31,6,6,'But if I\'m Mabel, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice, quite forgetting in the distance, sitting sad and lonely on a little of it?\' said the Hatter, and, just as.',0,1,'2001-10-18 16:15:05','2008-06-28 08:26:53'),(32,7,7,'You see the earth takes twenty-four hours to turn round on its axis--\' \'Talking of axes,\' said the Duchess: you\'d better ask HER about it.\' (The jury all brightened up at the house, and found in it.',1,1,'2017-11-25 19:13:09','1971-10-21 02:06:52'),(33,8,8,'Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of a dance is it?\' The Gryphon lifted up both its paws in surprise. \'What! Never heard of uglifying!\' it exclaimed. \'You know what.',1,0,'2006-06-22 01:13:36','1997-05-28 20:30:00'),(34,9,9,'Majesty,\' he began. \'You\'re a very short time the Mouse replied rather impatiently: \'any shrimp could have been that,\' said the King, \'or I\'ll have you executed, whether you\'re a little quicker..',1,0,'2011-07-04 11:02:28','1977-12-23 11:53:12'),(35,10,10,'I should say \"With what porpoise?\"\' \'Don\'t you mean by that?\' said the Caterpillar decidedly, and the White Rabbit read out, at the end of the tea--\' \'The twinkling of the game, the Queen had never.',0,1,'2004-04-10 11:50:44','2011-01-19 00:11:33'),(36,11,11,'Alice, they all cheered. Alice thought she might as well as she remembered that she might find another key on it, or at any rate, there\'s no use their putting their heads down! I am to see that she.',0,0,'1983-01-27 18:44:48','2018-09-02 02:00:02'),(37,12,12,'Alice had not got into a doze; but, on being pinched by the end of the sort!\' said Alice. \'I wonder what Latitude was, or Longitude either, but thought they were all talking together: she made some.',1,1,'1982-10-15 14:36:32','1973-02-25 09:20:15'),(38,13,13,'Christmas.\' And she went slowly after it: \'I never was so much frightened to say a word, but slowly followed her back to them, and then a voice of the way--\' \'THAT generally takes some time,\'.',1,0,'2006-05-01 07:58:52','2003-07-12 15:09:01'),(39,14,14,'Cat\'s head with great curiosity. \'It\'s a Cheshire cat,\' said the King. \'I can\'t help it,\' said Alice, who was sitting on a little startled when she got to the Queen. \'You make me giddy.\' And then,.',1,1,'2016-05-18 14:39:33','2021-07-20 06:32:12'),(40,15,15,'I WAS when I was going to shrink any further: she felt sure it would be four thousand miles down, I think--\' (for, you see, so many different sizes in a melancholy air, and, after folding his arms.',0,1,'1984-05-31 15:01:36','1987-02-09 01:21:08'),(41,16,16,'Queen said to itself \'The Duchess! The Duchess! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have none, Why, I wouldn\'t say anything about it, and yet.',0,0,'1990-11-09 01:58:07','1975-06-29 21:30:50'),(42,17,17,'SAID was, \'Why is a very curious sensation, which puzzled her very much what would happen next. \'It\'s--it\'s a very decided tone: \'tell her something about the games now.\' CHAPTER X. The Lobster.',0,0,'1986-03-28 14:43:55','1975-06-06 22:53:19'),(43,18,18,'Alice replied, so eagerly that the mouse doesn\'t get out.\" Only I don\'t think,\' Alice went on growing, and, as a drawing of a well?\' The Dormouse slowly opened his eyes were looking up into the air,.',1,0,'1988-01-20 18:47:45','2004-04-23 18:49:05'),(44,19,19,'Will you, won\'t you, will you join the dance?\"\' \'Thank you, it\'s a French mouse, come over with William the Conqueror.\' (For, with all speed back to yesterday, because I was a bright brass plate.',0,0,'2002-02-04 13:11:57','2008-11-14 14:42:28'),(45,20,20,'Ann! Mary Ann!\' said the Mock Turtle at last, they must needs come wriggling down from the Gryphon, the squeaking of the trees as well as she swam nearer to watch them, and all her riper years, the.',0,0,'2006-04-15 19:57:00','1982-12-27 10:27:23'),(46,21,21,'PROVES his guilt,\' said the Queen, and Alice, were in custody and under sentence of execution.\' \'What for?\' said Alice. \'Of course they were\', said the Gryphon. \'Do you play croquet?\' The soldiers.',0,0,'1986-02-15 09:49:54','1993-01-13 01:27:14'),(47,22,22,'Alice thought she had brought herself down to them, and it\'ll sit up and down looking for eggs, I know I have ordered\'; and she went on in a day or two: wouldn\'t it be murder to leave it behind?\'.',1,0,'2003-02-15 03:25:50','1976-08-27 14:24:00'),(48,23,23,'Queen said to the door, she found she had not as yet had any dispute with the other side of WHAT?\' thought Alice; \'but when you throw them, and then all the party sat silent for a minute or two, she.',0,1,'1970-06-05 00:54:21','2019-06-03 17:11:43'),(49,24,24,'Alice could see it trying in a hoarse, feeble voice: \'I heard every word you fellows were saying.\' \'Tell us a story.\' \'I\'m afraid I don\'t know,\' he went on planning to herself in a moment: she.',0,1,'2010-12-28 12:31:30','2015-01-21 17:44:56'),(50,25,25,'Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at the Mouse\'s tail; \'but why do you know why it\'s called a whiting?\' \'I never said I didn\'t!\' interrupted Alice..',1,0,'1987-03-25 02:47:52','1979-03-25 04:17:38'),(51,1,1,'Gryphon hastily. \'Go on with the name of nearly everything there. \'That\'s the judge,\' she said this she looked up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Mock Turtle sang this, very.',0,1,'2010-04-21 12:15:31','2004-12-26 03:52:43'),(52,2,2,'Gryphon said, in a sort of people live about here?\' \'In THAT direction,\' the Cat said, waving its tail about in all directions, \'just like a stalk out of breath, and said \'No, never\') \'--so you can.',0,1,'2020-09-28 16:45:42','1998-03-04 10:17:08'),(53,3,3,'Queen. An invitation from the shock of being upset, and their slates and pencils had been anything near the entrance of the hall; but, alas! the little passage: and THEN--she found herself at last.',0,1,'1992-11-12 13:23:47','1971-03-12 12:07:29'),(54,4,4,'So she called softly after it, and finding it very hard indeed to make it stop. \'Well, I\'d hardly finished the first minute or two to think that there ought! And when I learn music.\' \'Ah! that.',0,1,'1974-05-13 23:42:22','2000-11-28 22:09:09'),(55,5,5,'And mentioned me to sell you a present of everything I\'ve said as yet.\' \'A cheap sort of way, \'Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, because some of the jurymen. \'No,.',1,1,'2007-06-24 16:33:55','2001-10-08 23:33:58'),(56,6,6,'M?\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'I can\'t remember half of fright and half of anger, and tried to speak, and no room to open it; but, as the Rabbit, and had come back with the.',0,0,'2009-07-20 11:29:26','2014-11-04 07:40:16'),(57,7,7,'WHAT?\' said the Dormouse, not choosing to notice this question, but hurriedly went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty!\' the Duchess said in a minute or two, she.',1,0,'1982-06-15 11:46:35','2012-12-20 20:37:46'),(58,8,8,'Hatter. \'You might just as usual. I wonder what Latitude was, or Longitude either, but thought they were trying which word sounded best. Some of the Rabbit\'s little white kid gloves and the Panther.',0,1,'1982-08-13 14:11:33','1992-11-15 02:08:20'),(59,9,9,'Wonderland, though she felt that this could not help bursting out laughing: and when she looked up, and reduced the answer to shillings and pence. \'Take off your hat,\' the King triumphantly,.',1,1,'1982-10-16 12:37:34','1998-06-24 06:34:37'),(60,10,10,'She took down a good many little girls in my own tears! That WILL be a queer thing, to be sure! However, everything is to-day! And yesterday things went on in a helpless sort of use in the act of.',1,1,'1977-12-18 12:01:41','1979-02-07 02:26:54'),(61,11,11,'I\'m never sure what I\'m going to dive in among the distant green leaves. As there seemed to be rude, so she went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen.',0,1,'2020-03-03 01:47:46','1997-03-03 22:34:56'),(62,12,12,'The rabbit-hole went straight on like a telescope! I think you\'d better leave off,\' said the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve kept her eyes immediately met those of a well?\' The.',0,1,'2008-02-22 14:44:18','2002-08-10 21:02:44'),(63,13,13,'Queen said--\' \'Get to your little boy, And beat him when he pleases!\' CHORUS. \'Wow! wow! wow!\' While the Panther were sharing a pie--\' [later editions continued as follows When the Mouse in the long.',0,0,'1974-09-10 10:59:44','1985-12-09 02:22:00'),(64,14,14,'I suppose I ought to be no use going back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves and a pair of gloves and a Canary called out in a pleased tone..',1,0,'2002-05-10 23:23:02','1998-08-21 02:44:06'),(65,15,15,'As there seemed to be told so. \'It\'s really dreadful,\' she muttered to herself, \'whenever I eat or drink something or other; but the Hatter was the cat.) \'I hope they\'ll remember her saucer of milk.',0,1,'1978-04-10 20:59:10','1997-07-27 18:29:52'),(66,16,16,'Mouse, who seemed ready to play croquet.\' The Frog-Footman repeated, in the sea, though you mayn\'t believe it--\' \'I never thought about it,\' said Alice, always ready to agree to everything that.',0,0,'2018-03-28 12:49:16','1973-01-27 13:20:59'),(67,17,17,'Then the Queen to-day?\' \'I should like to drop the jar for fear of their hearing her; and the Gryphon said to herself; \'his eyes are so VERY nearly at the thought that she was near enough to drive.',1,0,'2020-03-06 01:42:49','2007-04-22 11:59:45'),(68,18,18,'Alice crouched down among the distant green leaves. As there seemed to be true): If she should chance to be Number One,\' said Alice. \'It must have imitated somebody else\'s hand,\' said the.',1,0,'1988-01-04 02:25:40','2009-11-16 05:41:51'),(69,19,19,'Queen left off, quite out of it, and they repeated their arguments to her, \'if we had the best of educations--in fact, we went to the Knave. The Knave shook his head contemptuously. \'I dare say.',1,1,'2009-12-13 11:54:29','1995-03-17 16:00:21'),(70,20,20,'There was a long way back, and barking hoarsely all the things between whiles.\' \'Then you may SIT down,\' the King had said that day. \'No, no!\' said the youth, \'as I mentioned before, And have grown.',1,0,'2018-01-14 11:06:24','1997-01-15 15:37:54'),(71,21,21,'The Cat seemed to be done, I wonder?\' Alice guessed who it was, and, as she went on just as I get SOMEWHERE,\' Alice added as an explanation; \'I\'ve none of my own. I\'m a deal too flustered to tell me.',1,1,'1993-06-10 15:04:48','1978-09-22 22:01:24'),(72,22,22,'Queen, \'Really, my dear, I think?\' \'I had NOT!\' cried the Mouse, turning to Alice again. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t opened it yet,\' said the Duchess; \'and the.',1,1,'1972-03-10 16:08:33','2007-11-13 12:22:55'),(73,23,23,'I don\'t think,\' Alice went on for some while in silence. Alice noticed with some difficulty, as it was too late to wish that! She went on to her daughter \'Ah, my dear! Let this be a book written.',0,1,'1971-10-04 17:38:09','2007-12-26 23:58:15'),(74,24,24,'Pig and Pepper For a minute or two. \'They couldn\'t have wanted it much,\' said the Footman, \'and that for two reasons. First, because I\'m on the breeze that followed them, the melancholy words:--.',0,1,'1999-06-29 13:07:02','1999-04-25 06:32:32'),(75,25,25,'COULD grin.\' \'They all can,\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found.',1,1,'1998-03-01 17:29:06','1983-01-11 20:35:44'),(76,1,1,'White Rabbit cried out, \'Silence in the air. This time there were TWO little shrieks, and more faintly came, carried on the trumpet, and then all the right thing to get us dry would be so easily.',0,1,'2015-09-02 21:58:38','2002-12-05 16:53:27'),(77,2,2,'Mock Turtle. \'No, no! The adventures first,\' said the King; and the words all coming different, and then turned to the beginning of the conversation. Alice felt a violent shake at the end of the.',1,0,'1998-03-22 06:18:57','2013-02-17 21:46:31'),(78,3,3,'Why, it fills the whole court was in managing her flamingo: she succeeded in curving it down \'important,\' and some of YOUR adventures.\' \'I could tell you how the game was going on rather better.',1,0,'2015-05-23 14:58:05','1989-06-12 08:37:53'),(79,4,4,'Alice crouched down among the leaves, which she had read about them in books, and she thought to herself. \'I dare say you never even spoke to Time!\' \'Perhaps not,\' Alice cautiously replied: \'but I.',0,1,'2014-11-28 18:24:01','1989-11-30 02:19:30'),(80,5,5,'I get SOMEWHERE,\' Alice added as an explanation; \'I\'ve none of them say, \'Look out now, Five! Don\'t go splashing paint over me like that!\' \'I couldn\'t help it,\' she said to the other was sitting.',0,0,'1985-10-30 19:24:16','1989-06-07 02:18:11'),(81,6,6,'She had just begun \'Well, of all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was thoroughly puzzled. \'Does the boots and shoes!\' she repeated in a hoarse growl, \'the world would.',1,1,'1980-07-18 12:00:27','2013-10-30 08:38:33'),(82,7,7,'Mouse, who seemed too much of a globe of goldfish she had hoped) a fan and a scroll of parchment in the pool was getting quite crowded with the end of half those long words, and, what\'s more, I.',0,0,'2018-05-01 05:28:33','1971-01-19 09:39:27'),(83,8,8,'Alice could not possibly reach it: she could see it trying in a melancholy tone: \'it doesn\'t seem to put it right; \'not that it would be very likely true.) Down, down, down. There was nothing on it.',1,0,'1971-11-16 06:01:34','1983-05-19 20:33:42'),(84,9,9,'Mock Turtle replied; \'and then the Rabbit\'s voice; and the beak-- Pray how did you do lessons?\' said Alice, in a minute. Alice began to get to,\' said the Dormouse; \'VERY ill.\' Alice tried to say.',1,1,'2019-10-31 23:41:53','1980-11-01 21:49:31'),(85,10,10,'HIS time of life. The King\'s argument was, that if you wouldn\'t squeeze so.\' said the Caterpillar. \'Well, perhaps not,\' said the Gryphon repeated impatiently: \'it begins \"I passed by his face only,.',1,1,'1994-01-12 01:59:12','1975-12-15 06:11:31'),(86,11,11,'Alice said to the porpoise, \"Keep back, please: we don\'t want to be?\' it asked. \'Oh, I\'m not looking for them, but they were IN the well,\' Alice said very humbly; \'I won\'t interrupt again. I dare.',0,1,'2006-06-01 17:23:42','1980-04-10 07:43:42'),(87,12,12,'KNOW IT TO BE TRUE--\" that\'s the queerest thing about it.\' (The jury all looked so good, that it would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the.',1,1,'2010-02-16 20:28:40','2010-03-08 08:36:31'),(88,13,13,'Eaglet. \'I don\'t quite understand you,\' she said, \'than waste it in asking riddles that have no answers.\' \'If you can\'t take LESS,\' said the Dormouse, after thinking a minute or two she stood.',1,1,'2001-03-23 02:50:24','1980-07-25 19:04:04'),(89,14,14,'King, who had followed him into the wood. \'If it had lost something; and she could see this, as she listened, or seemed to rise like a star-fish,\' thought Alice. \'Now we shall have to beat time when.',1,1,'1993-12-18 07:54:12','2010-08-23 22:12:07'),(90,15,15,'March Hare will be much the most confusing thing I ask! It\'s always six o\'clock now.\' A bright idea came into her eyes; and once she remembered having seen in her life before, and behind it, it.',1,1,'2006-08-21 00:15:57','2020-06-29 06:00:59'),(91,16,16,'Gryphon, with a sudden burst of tears, until there was hardly room for this, and Alice rather unwillingly took the opportunity of taking it away. She did not like to hear the words:-- \'I speak.',1,0,'2020-03-22 03:03:21','1986-03-30 06:40:23'),(92,17,17,'I don\'t understand. Where did they live at the mushroom (she had grown in the pool was getting quite crowded with the bread-and-butter getting so used to it!\' pleaded poor Alice in a wondering tone..',0,1,'1972-10-21 19:05:54','1987-09-26 16:49:56'),(93,18,18,'The Mouse gave a little snappishly. \'You\'re enough to get us dry would be as well as she spoke. Alice did not venture to say \'creatures,\' you see, Alice had got so much contradicted in her hand, and.',1,1,'1992-11-15 04:48:07','1990-08-23 00:31:00'),(94,19,19,'White Rabbit cried out, \'Silence in the court!\' and the King triumphantly, pointing to the Mock Turtle. \'Hold your tongue!\' added the Hatter, and he went on, \'you throw the--\' \'The lobsters!\'.',0,0,'2017-12-26 05:59:28','2000-11-18 19:54:49'),(95,20,20,'There was a sound of a well?\' \'Take some more of it altogether; but after a fashion, and this he handed over to the door. \'Call the next witness would be wasting our breath.\" \"I\'ll be judge, I\'ll be.',1,0,'1975-07-10 08:23:23','1999-10-29 02:58:55'),(96,21,21,'Yet you turned a back-somersault in at the house, and have next to no toys to play croquet with the other: he came trotting along in a tone of the sort,\' said the Caterpillar; and it put the Lizard.',1,1,'2015-07-09 09:37:53','2018-11-08 13:05:20'),(97,22,22,'I THINK I can go back by railway,\' she said to the garden with one foot. \'Get up!\' said the Duchess: \'and the moral of that is--\"The more there is of mine, the less there is of finding morals in.',0,0,'2013-08-30 06:21:59','2012-02-29 14:28:16'),(98,23,23,'Alice, who had spoken first. \'That\'s none of YOUR business, Two!\' said Seven. \'Yes, it IS his business!\' said Five, in a very curious thing, and she heard the Rabbit came up to her to wink with one.',0,0,'2002-11-07 14:55:27','1975-03-06 19:19:01'),(99,24,24,'Soup! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Soo--oop of the trees under which she had never seen such a thing. After a minute or two to.',0,0,'2020-05-28 23:03:12','1981-03-18 08:36:05'),(100,25,25,'Alice thought to herself, in a great letter, nearly as she left her, leaning her head to keep back the wandering hair that curled all over crumbs.\' \'You\'re wrong about the same size: to be sure,.',0,0,'2017-02-06 19:09:41','2008-02-07 19:00:12');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `gerder` enum('M','F','?') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `photo_id` int unsigned DEFAULT NULL COMMENT 'Ссылка на основную фотографию пользователя',
  `status` enum('online','offline','disabled') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Текущий статус',
  `city` varchar(130) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Город проживания',
  `country` varchar(130) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Страна проживания',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `profiles_user_id` (`user_id`),
  KEY `profiles_photo_id` (`photo_id`),
  CONSTRAINT `profiles_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`),
  CONSTRAINT `profiles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Профили';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,'M','1972-12-30',NULL,'online','Ornton','81489','2008-05-02 20:41:53','2013-07-08 15:14:09'),(2,2,'?','1998-05-29',NULL,'offline','Gaylordshire','','2014-12-04 04:19:05','2003-12-07 18:34:48'),(3,3,'M','1977-12-11',NULL,'offline','Emersonbury','25026','2019-07-16 07:01:23','1975-05-26 11:06:43'),(4,4,'M','1996-03-15',NULL,'disabled','West Mariammouth','285991','1982-08-17 07:39:11','2005-08-17 20:41:43'),(5,5,'?','1985-02-27',NULL,'offline','Port Tryciaport','23595546','2018-06-27 20:19:43','2009-02-26 18:20:30'),(6,6,'F','1973-03-06',NULL,'online','Lake Monroe','904','1975-08-21 21:21:02','1991-06-06 04:11:51'),(7,7,'M','2012-09-12',NULL,'online','Lake Zoiestad','5','2009-03-15 11:34:24','1973-12-26 17:45:30'),(8,8,'M','2004-03-21',NULL,'disabled','Jessieland','788955745','2018-06-14 17:08:54','1998-06-26 22:46:31'),(9,9,'M','1995-04-09',NULL,'disabled','East Jennyfer','93250744','1987-01-22 06:31:19','2015-06-30 16:54:19'),(10,10,'?','2003-11-23',NULL,'disabled','Delfinamouth','40907','2001-01-02 23:50:17','1999-02-15 17:16:21'),(11,11,'F','1994-03-22',NULL,'online','Bradtkemouth','5755393','2015-12-14 00:24:31','1997-07-09 10:05:16'),(12,12,'M','2011-04-22',NULL,'disabled','New Greyson','','2014-06-23 12:48:51','2017-11-11 13:30:40'),(13,13,'F','1984-11-06',NULL,'disabled','North Lilian','1994088','1988-10-05 08:10:12','2003-08-01 22:56:03'),(14,14,'M','2006-09-23',NULL,'offline','North Jailynfort','5194','1991-07-11 21:47:26','2014-06-18 14:32:31'),(15,15,'F','2003-10-22',NULL,'offline','Spencerport','7084','1991-07-02 05:27:43','1988-04-01 14:43:09'),(16,16,'?','1984-04-18',NULL,'disabled','Lamartown','701154957','1994-08-18 18:15:32','1997-06-29 23:33:27'),(17,17,'M','2017-04-22',NULL,'disabled','Jensenmouth','404','1983-10-18 06:53:35','2017-04-20 11:04:37'),(18,18,'?','2003-12-04',NULL,'online','South Madalineland','','2006-01-31 08:23:16','1998-12-09 00:43:09'),(19,19,'F','2021-06-28',NULL,'disabled','Kieranview','81551','1997-03-19 04:26:35','2000-10-06 02:02:15'),(20,20,'?','2003-02-02',NULL,'offline','New Destinimouth','76929484','2003-11-23 04:47:52','1981-12-23 07:07:13'),(21,21,'F','1980-08-26',NULL,'disabled','Kristown','68','2012-03-14 04:37:44','1971-01-30 02:02:53'),(22,22,'M','1980-10-23',NULL,'offline','Deckowbury','','1999-06-11 18:03:23','2017-01-09 12:44:14'),(23,23,'M','1984-07-10',NULL,'offline','West Brittany','49207','1979-12-27 13:02:41','2012-03-29 07:09:31'),(24,24,'F','1981-10-10',NULL,'offline','Parkerstad','63','1986-01-02 14:38:15','1970-05-26 18:42:35'),(25,25,'?','1979-12-16',NULL,'online','Lake Chanelle','4898','1994-02-27 00:38:02','2019-03-06 06:17:39');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Почта',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Телефон',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Cassie','Klocko','helene.paucek@example.com','165-631-396','1975-02-07 08:31:51','1993-04-13 13:27:37'),(2,'Kameron','Goodwin','johnny.hickle@example.net','271-587-684','1983-11-20 07:56:34','1997-01-21 22:42:24'),(3,'Maybelle','Keeling','flemke@example.com','(692)573-61','1980-03-24 03:27:47','2019-06-14 14:22:07'),(4,'Electa','Lueilwitz','kilback.cleo@example.org','244-408-192','1990-12-24 14:38:08','2015-01-21 07:53:45'),(5,'Travon','Zboncak','darlene46@example.net','469.966.308','1999-12-01 09:53:41','2007-04-26 15:16:27'),(6,'Keara','Hilll','brennon11@example.com','(917)060-27','2002-09-29 01:38:01','1993-11-07 18:45:39'),(7,'Cecilia','McLaughlin','walker.joey@example.org','1-880-071-5','1973-11-12 07:22:15','1987-12-13 20:08:54'),(8,'Tristin','Rau','merritt36@example.net','565-630-232','2009-07-27 16:18:27','2021-01-11 09:43:55'),(9,'Rocky','Bosco','pink.abshire@example.net','(715)395-03','1986-02-09 00:35:15','2017-04-05 04:46:04'),(10,'Joanny','Johnston','mblick@example.net','1-642-779-6','2012-01-30 04:24:57','1979-07-14 18:41:05'),(11,'Eldred','Abernathy','marisa.raynor@example.com','1-743-939-8','1994-05-08 01:50:37','1979-05-26 21:04:28'),(12,'Kaleb','Schoen','mayer.riley@example.com','931.393.415','1971-02-13 14:20:09','2000-06-15 11:34:08'),(13,'Harmony','Hyatt','mallie.stanton@example.net','721.454.974','2015-12-19 19:28:48','2016-02-09 01:29:26'),(14,'Rebeka','Graham','francisca.predovic@example.org','620-778-005','1985-09-15 17:26:01','2003-01-30 18:49:16'),(15,'Edwin','Keebler','ruby51@example.net','+82(3)51528','1983-05-03 10:44:36','1994-04-09 04:34:14'),(16,'Edmond','Rohan','olen79@example.org','150-579-997','1975-11-07 18:03:18','1989-12-31 19:50:38'),(17,'Lydia','Sporer','fahey.enrico@example.com','059-772-344','1972-07-19 06:32:51','2015-11-16 23:17:47'),(18,'Chelsie','Wuckert','treutel.sincere@example.org','+13(1)79987','1997-01-08 21:41:12','1983-02-07 09:56:22'),(19,'Brandt','Krajcik','paris61@example.org','474-519-444','2014-06-06 19:24:58','1980-11-27 22:51:23'),(20,'Maegan','Glover','wreichert@example.com','882.137.692','2000-08-10 15:50:26','1971-10-17 17:58:30'),(21,'Erwin','White','idouglas@example.org','1-522-810-7','1982-12-05 15:43:41','1986-02-19 13:28:50'),(22,'Roberta','Hodkiewicz','mante.carter@example.net','1-765-032-3','2011-02-27 00:03:15','1983-01-25 03:17:31'),(23,'Chelsie','Huels','kevon.tillman@example.org','(420)598-33','1988-06-25 03:06:47','1981-02-06 17:39:44'),(24,'Domenica','Renner','hauck.heaven@example.com','(902)576-54','1972-10-24 17:51:49','1971-05-02 18:30:03'),(25,'Dana','Pollich','ofelia.shields@example.org','09673616970','1987-10-04 13:01:43','2011-11-19 07:12:31');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-16 12:54:57
