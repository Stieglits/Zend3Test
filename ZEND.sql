-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: empire
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
-- Table structure for table `Alpha`
--

DROP TABLE IF EXISTS `Alpha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alpha` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alpha`
--

LOCK TABLES `Alpha` WRITE;
/*!40000 ALTER TABLE `Alpha` DISABLE KEYS */;
INSERT INTO `Alpha` VALUES (1,'Пукин-вор'),(2,'Гнойный сел за клитор');
/*!40000 ALTER TABLE `Alpha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Charlie`
--

DROP TABLE IF EXISTS `Charlie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Charlie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Charlie`
--

LOCK TABLES `Charlie` WRITE;
/*!40000 ALTER TABLE `Charlie` DISABLE KEYS */;
INSERT INTO `Charlie` VALUES (1,'Политика'),(2,'Сатира'),(3,'кирпич');
/*!40000 ALTER TABLE `Charlie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plus`
--

DROP TABLE IF EXISTS `Plus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `a_id` int NOT NULL,
  `c_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `relation_row_unique` (`a_id`,`c_id`),
  KEY `a_id` (`a_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `FK_alpha` FOREIGN KEY (`a_id`) REFERENCES `Alpha` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_charlie` FOREIGN KEY (`c_id`) REFERENCES `Charlie` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица связи заявок участников и номинаций конкурса';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plus`
--

LOCK TABLES `Plus` WRITE;
/*!40000 ALTER TABLE `Plus` DISABLE KEYS */;
INSERT INTO `Plus` VALUES (1,1,1),(3,2,1),(2,2,2);
/*!40000 ALTER TABLE `Plus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id` int NOT NULL AUTO_INCREMENT,
  `artist` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'loh','pidr');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook`
--

DROP TABLE IF EXISTS `guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `timestamp` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guestbook_timestamp_index` (`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook`
--

LOCK TABLES `guestbook` WRITE;
/*!40000 ALTER TABLE `guestbook` DISABLE KEYS */;
INSERT INTO `guestbook` VALUES (1,'test@guest.com','hola!','2021-03-03 01:33:15'),(2,'days99@yandex.ru','adfdf','2021-03-12 01:33:28'),(3,'blabla@mail.ru','я стас- это самое последнее сообщение','2021-03-09 01:33:33'),(4,'proverka@mail.ru','proverka','2021-03-14 13:53:52'),(5,'zek@aye.ru','жизньваранам','2021-03-14 15:37:28'),(6,'ggvp@mail.ru','alert(\'sosi hyi\');','2021-03-14 16:06:01');
/*!40000 ALTER TABLE `guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mark` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '1',
  `country` text,
  `date_of_foundation` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `  Mark_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark`
--

LOCK TABLES `mark` WRITE;
/*!40000 ALTER TABLE `mark` DISABLE KEYS */;
INSERT INTO `mark` VALUES (1,'Kia','S.KOREA','1960-11-10'),(2,'Toyota','Japan','2000-12-12');
/*!40000 ALTER TABLE `mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark_model`
--

DROP TABLE IF EXISTS `mark_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mark_model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `parent` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mark_model_id_uindex` (`id`),
  KEY `mark_model_mark_id_fk` (`parent`),
  CONSTRAINT `mark_model_mark_id_fk` FOREIGN KEY (`parent`) REFERENCES `mark` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark_model`
--

LOCK TABLES `mark_model` WRITE;
/*!40000 ALTER TABLE `mark_model` DISABLE KEYS */;
INSERT INTO `mark_model` VALUES (1,'sorento',1),(2,'picanto',1),(3,'belta',2),(4,'sportage',1);
/*!40000 ALTER TABLE `mark_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `director` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'huila','stas');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newcar`
--

DROP TABLE IF EXISTS `newcar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newcar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `markname` varchar(255) NOT NULL,
  `modelname` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newcar`
--

LOCK TABLES `newcar` WRITE;
/*!40000 ALTER TABLE `newcar` DISABLE KEYS */;
INSERT INTO `newcar` VALUES (1,'TOYOTA','SUPRA','JAPAN',1989),(108,'Kia','Rio','S.KOREA',1999),(109,'Kia','Rio','S.KOREA',1999);
/*!40000 ALTER TABLE `newcar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `news_name` text NOT NULL,
  `news_text` text NOT NULL,
  `n_category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `news_news_category_category_id_fk` (`n_category_id`),
  CONSTRAINT `news_news_category_category_id_fk` FOREIGN KEY (`n_category_id`) REFERENCES `news_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (12,'test','гавр',2),(14,'312','123',1),(16,'ТЕСТ','ТЕСТ',1),(17,'ТЕСТ','ТЕСТ',3),(18,'1','1',1),(19,'1','21',1),(21,'F{F{F{F{{F{F','F{F{{F{F',3),(22,'ПРОВЕРКА1','ПРОВЕРКА!',3),(23,'111','111',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_and_cats`
--

DROP TABLE IF EXISTS `news_and_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_and_cats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `news_id` int NOT NULL,
  `cats_id` int NOT NULL,
  PRIMARY KEY (`id`,`news_id`,`cats_id`),
  KEY `news_and_cats_news__table_id_fk` (`news_id`),
  KEY `news_and_cats_news_category_table_id_fk` (`cats_id`),
  CONSTRAINT `news_and_cats_news__table_id_fk` FOREIGN KEY (`news_id`) REFERENCES `news_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `news_and_cats_news_category_table_id_fk` FOREIGN KEY (`cats_id`) REFERENCES `news_category_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_and_cats`
--

LOCK TABLES `news_and_cats` WRITE;
/*!40000 ALTER TABLE `news_and_cats` DISABLE KEYS */;
INSERT INTO `news_and_cats` VALUES (1,1,1),(2,2,1),(3,3,2);
/*!40000 ALTER TABLE `news_and_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_category`
--

DROP TABLE IF EXISTS `news_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`),
  KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_category`
--

LOCK TABLES `news_category` WRITE;
/*!40000 ALTER TABLE `news_category` DISABLE KEYS */;
INSERT INTO `news_category` VALUES (1,1,'Любовь'),(2,2,'Политика'),(3,3,'Сатира'),(6,4,'Greg'),(7,5,'6'),(8,99,'600');
/*!40000 ALTER TABLE `news_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_category_table`
--

DROP TABLE IF EXISTS `news_category_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_category_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_category_table`
--

LOCK TABLES `news_category_table` WRITE;
/*!40000 ALTER TABLE `news_category_table` DISABLE KEYS */;
INSERT INTO `news_category_table` VALUES (1,'Политика'),(2,'Юмор');
/*!40000 ALTER TABLE `news_category_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_table`
--

DROP TABLE IF EXISTS `news_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `news_name` varchar(255) NOT NULL,
  `news_text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_name` (`news_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_table`
--

LOCK TABLES `news_table` WRITE;
/*!40000 ALTER TABLE `news_table` DISABLE KEYS */;
INSERT INTO `news_table` VALUES (1,'Навальный присел','Но выглядит лидером'),(2,'Привет','Олег'),(3,'1','fq'),(4,'op','op'),(5,'проверка145','проверка145'),(6,'проверка146','проверка146'),(7,'прроверка171','1'),(8,'1332','131'),(9,'тест148','тест148'),(10,'Тест192','Тест192'),(11,'Теест1993','Тест192'),(12,'пять','пять');
/*!40000 ALTER TABLE `news_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nov_tem`
--

DROP TABLE IF EXISTS `nov_tem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nov_tem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nov_id` int NOT NULL,
  `tem_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nov_tem`
--

LOCK TABLES `nov_tem` WRITE;
/*!40000 ALTER TABLE `nov_tem` DISABLE KEYS */;
INSERT INTO `nov_tem` VALUES (1,1,1),(3,12,1),(4,16,1),(10,2,1),(15,1,3);
/*!40000 ALTER TABLE `nov_tem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novosti`
--

DROP TABLE IF EXISTS `novosti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `novosti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `status_id` tinyint NOT NULL DEFAULT '1',
  `sort` tinyint NOT NULL DEFAULT '50',
  `user_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `sort` (`sort`),
  KEY `novosti_the_user_id_fk` (`user_id`),
  CONSTRAINT `novosti_the_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `the_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novosti`
--

LOCK TABLES `novosti` WRITE;
/*!40000 ALTER TABLE `novosti` DISABLE KEYS */;
INSERT INTO `novosti` VALUES (1,'Пук в лужу','<p>Очередной политический долбаёб (депутат) сравнил акцию с фонариками с колаборационистами блокадного Ленинграда.</p>','hz',1,1,1),(2,'Проверка','<p>раз два</p>','victory',1,3,1),(3,'11','323','32',0,50,1),(4,'5','<p>5</p>','veritas',1,50,1),(5,'15','<p>15</p>','ver',1,50,1),(6,'8-800','<p>20015</p>','700',1,50,1),(9,'gamli','<p>gamli</p>','rrrr1',1,50,1),(10,'qq','11','4',0,50,1),(11,'ver','<p>ver</p>','verit',0,50,1),(12,'Парапа','<p>парапа</p>','parapa',1,50,1),(13,'роверкаП','<p>тематикиа</p>','zapis',1,50,1),(14,'beb','<p>bebe</p>','bebe',0,50,1),(15,'adin','<p style=\"margin-left: 40px;\">adin</p>','adin',1,50,1),(16,'a','avbb','abv',1,50,1);
/*!40000 ALTER TABLE `novosti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (11,'Автор','mail@mail.com','Введите текст сообщения'),(13,'Gleb','Stas@mail.ru','flkskdfjslfjВведите текст сообщения'),(14,'Автор','mail@mail.com','Введите текст сообщения'),(15,'Privet','vsem@ya.dobryi','krasavchik ivanych');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tematika`
--

DROP TABLE IF EXISTS `tematika`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tematika` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tematika`
--

LOCK TABLES `tematika` WRITE;
/*!40000 ALTER TABLE `tematika` DISABLE KEYS */;
INSERT INTO `tematika` VALUES (1,'Политика'),(2,'Юмор'),(3,'Жизнь');
/*!40000 ALTER TABLE `tematika` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `the_user`
--

DROP TABLE IF EXISTS `the_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `the_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `password_reserved` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` smallint DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `the_user_pk` (`username`),
  UNIQUE KEY `the_user_pk_2` (`password_reserved`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `the_user`
--

LOCK TABLES `the_user` WRITE;
/*!40000 ALTER TABLE `the_user` DISABLE KEYS */;
INSERT INTO `the_user` VALUES (1,'Michael',NULL,'877851','877851','skygsn@gmail.com',1,NULL,NULL);
/*!40000 ALTER TABLE `the_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-15  1:12:24
