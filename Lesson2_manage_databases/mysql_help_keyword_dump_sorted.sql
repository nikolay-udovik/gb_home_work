-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 192.168.122.20    Database: mysql
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
-- Dumping data for table `help_keyword`
--
-- WHERE:  help_keyword_id <= 99

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (0,'HELP_DATE'),(1,'HELP_VERSION'),(2,'DEFAULT'),(3,'SERIAL'),(4,'VALUE'),(5,'HELP'),(6,'ASYMMETRIC_DECRYPT'),(7,'ASYMMETRIC_DERIVE'),(8,'ASYMMETRIC_ENCRYPT'),(9,'ASYMMETRIC_SIGN'),(10,'ASYMMETRIC_VERIFY'),(11,'CREATE_ASYMMETRIC_PRIV_KEY'),(12,'CREATE_ASYMMETRIC_PUB_KEY'),(13,'CREATE_DH_PARAMETERS'),(14,'CREATE_DIGEST'),(15,'FALSE'),(16,'TRUE'),(17,'BOOL'),(18,'BOOLEAN'),(19,'INT1'),(20,'UNSIGNED'),(21,'ZEROFILL'),(22,'INT2'),(23,'INT3'),(24,'MIDDLEINT'),(25,'INT4'),(26,'INTEGER'),(27,'INT8'),(28,'DEC'),(29,'FIXED'),(30,'NUMERIC'),(31,'DECIMAL'),(32,'FLOAT4'),(33,'FLOAT8'),(34,'PRECISION'),(35,'REAL'),(36,'DATE'),(37,'TIMESTAMP'),(38,'TIME'),(39,'CHARACTER'),(40,'NATIONAL'),(41,'NCHAR'),(42,'BYTE'),(43,'CHAR'),(44,'NVARCHAR'),(45,'VARCHARACTER'),(46,'VARYING'),(47,'LONG'),(48,'LONGBINARY'),(49,'ADD'),(50,'ALTER'),(51,'CREATE'),(52,'INDEX'),(53,'KEY'),(54,'TABLE'),(55,'='),(56,'<=>'),(57,'<>'),(58,'<='),(59,'<'),(60,'>='),(61,'>'),(62,'AND'),(63,'BETWEEN'),(64,'NOT'),(65,'COALESCE'),(66,'GREATEST'),(67,'IN'),(68,'INTERVAL'),(69,'IS'),(70,'NULL'),(71,'ISNULL'),(72,'LEAST'),(73,'OR'),(74,'XOR'),(75,':='),(76,'CASE'),(77,'ELSE'),(78,'END'),(79,'THEN'),(80,'WHEN'),(81,'IF'),(82,'IFNULL'),(83,'NULLIF'),(84,'+'),(85,'-'),(86,'*'),(87,'/'),(88,'DIV'),(89,'MOD'),(90,'ABS'),(91,'ACOS'),(92,'ASIN'),(93,'ATAN'),(94,'ATAN2'),(95,'CEIL'),(96,'CEILING'),(97,'CONV'),(98,'COS'),(99,'COT');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-06 14:27:52
