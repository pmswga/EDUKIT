-- MySQL dump 10.16  Distrib 10.1.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: iep
-- ------------------------------------------------------
-- Server version	10.1.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `iep`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `iep` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `iep`;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `sn` char(30) NOT NULL,
  `fn` char(30) NOT NULL,
  `pt` char(30) NOT NULL,
  `email` char(30) DEFAULT NULL,
  `passwd` char(32) NOT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'??T├ж??-?-','?╒ж-?????-????','??T?T╠ж??-??T?','jackxp@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99'),(6,'sn','fn','pt','asf@mail.rui','d8578edf8458ce06fbc5bb76a58c5ca4');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insAdmin BEFORE INSERT ON `admins` FOR EACH ROW
BEGIN
	IF new.sn = ''     OR
		new.fn = ''     OR
		new.pt = ''     OR
		new.email  = '' OR
		new.passwd = ''
	THEN
		SIGNAL SQLSTATE '45000' SET 
			MESSAGE_TEXT = 'Field is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_insAdmin AFTER INSERT ON `admins` FOR EACH ROW
BEGIN
	call writeLog('admins', CONCAT(
		'ж╘ж-ж-ж-ж-жмжжж- ж-ж-ж-T╦жж ж-ж+ж-жмж-жмT┴T┬T└ж-T┬ж-T└ ',
        new.sn, ' ',
        new.fn, ' ',
        new.pt, ' '
    ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_uptAdmin AFTER UPDATE ON `admins` FOR EACH ROW
BEGIN
	call writeLog('users', CONCAT('ж╘ж-ж-ж-T╦жж ж-ж+ж-жмж-жмT┴T┬T└ж-T┬ж-T└ж- ж-ж-ж-ж-ж-жмжжж-T╦ [',
		old.sn, ' ',
		old.fn, ' ',
		old.pt, ' ',
		old.email, '] ---> [',
		new.sn,  ' ',
		new.fn, ' ',
		new.pt, ' ',
		new.email, ']'
	));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_delAdmin AFTER DELETE ON `admins` FOR EACH ROW
BEGIN
	call writeLog('users', CONCAT('ж╨ж+ж-жмж-жмT┴T┬T└ж-T┬ж-T└ [',
		old.sn, ' ',
		old.fn, ' ',
		old.pt, ' ',
		old.email, '] ж-T╦жм T├ж+ж-жмT╤ж-'
	));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id_answer` int(11) NOT NULL AUTO_INCREMENT,
  `id_question` int(11) NOT NULL,
  `answer` char(255) NOT NULL,
  PRIMARY KEY (`id_answer`),
  KEY `id_question` (`id_question`),
  CONSTRAINT `R17` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id_question`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insAnswer BEFORE INSERT ON `answers` FOR EACH ROW
BEGIN
	IF new.answer = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `grp` int(11) NOT NULL AUTO_INCREMENT,
  `description` char(10) NOT NULL,
  `edu_year` char(10) NOT NULL,
  `spec_id` int(11) NOT NULL,
  `is_budget` int(11) NOT NULL,
  PRIMARY KEY (`grp`),
  KEY `spec_id` (`spec_id`),
  CONSTRAINT `R6` FOREIGN KEY (`spec_id`) REFERENCES `specialty` (`id_spec`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'??-304','2016-2017',1,1);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insGroup BEFORE INSERT ON `groups` FOR EACH ROW
BEGIN
	IF new.description = '' OR
		new.edu_year = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `groups_tests`
--

DROP TABLE IF EXISTS `groups_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_tests` (
  `id_test` int(11) NOT NULL,
  `id_group` int(11) NOT NULL,
  PRIMARY KEY (`id_test`,`id_group`),
  KEY `R21` (`id_group`),
  CONSTRAINT `R21` FOREIGN KEY (`id_group`) REFERENCES `groups` (`grp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `R22` FOREIGN KEY (`id_test`) REFERENCES `tests` (`id_test`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_tests`
--

LOCK TABLES `groups_tests` WRITE;
/*!40000 ALTER TABLE `groups_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `tbl` char(255) NOT NULL,
  `msg` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (5,'subjects','?╘ж-?-?-?-?????- ?-?-?-T╦ж? ??T????+?-??T? ?▐ж?','2017-06-19');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id_news` int(11) NOT NULL AUTO_INCREMENT,
  `caption` char(255) NOT NULL,
  `content` text NOT NULL,
  `id_author` int(11) NOT NULL,
  `date_publication` date NOT NULL,
  PRIMARY KEY (`id_news`),
  KEY `id_author` (`id_author`),
  CONSTRAINT `R11` FOREIGN KEY (`id_author`) REFERENCES `teachers` (`id_teacher`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insNews BEFORE INSERT ON `news` FOR EACH ROW
BEGIN
	IF new.caption = '' OR
		new.content = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `parent_child`
--

DROP TABLE IF EXISTS `parent_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent_child` (
  `id_parent` int(11) NOT NULL,
  `id_children` int(11) NOT NULL,
  `id_type_relation` int(11) NOT NULL,
  PRIMARY KEY (`id_parent`,`id_children`),
  KEY `id_children` (`id_children`),
  KEY `id_type_relation` (`id_type_relation`),
  CONSTRAINT `R7` FOREIGN KEY (`id_parent`) REFERENCES `parents` (`id_parent`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `R8` FOREIGN KEY (`id_children`) REFERENCES `students` (`id_student`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `R9` FOREIGN KEY (`id_type_relation`) REFERENCES `relations` (`id_relation`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_child`
--

LOCK TABLES `parent_child` WRITE;
/*!40000 ALTER TABLE `parent_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `parent_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parents` (
  `id_parent` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `education` char(50) NOT NULL,
  `work_place` char(255) NOT NULL,
  `post` char(255) NOT NULL,
  `home_phone` char(30) NOT NULL,
  `cell_phone` char(30) NOT NULL,
  PRIMARY KEY (`id_parent`),
  CONSTRAINT `R4` FOREIGN KEY (`id_parent`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insParent BEFORE INSERT ON `parents` FOR EACH ROW
BEGIN
	IF new.education = ''  OR
		new.work_place = '' OR
		new.post = ''       OR
		new.home_phone = '' OR
		new.cell_phone = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id_question` int(11) NOT NULL AUTO_INCREMENT,
  `id_test` int(11) NOT NULL,
  `question` char(255) NOT NULL,
  `r_answer` char(255) NOT NULL,
  PRIMARY KEY (`id_question`),
  KEY `id_test` (`id_test`),
  CONSTRAINT `R16` FOREIGN KEY (`id_test`) REFERENCES `tests` (`id_test`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insQuestion BEFORE INSERT ON `questions` FOR EACH ROW
BEGIN
	IF new.question = '' OR
		new.r_answer = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS uptRAnswer AFTER UPDATE ON `questions` FOR EACH ROW
BEGIN
	UPDATE `answers` SET `answer`=new.r_answer WHERE `id_question`=new.id_question AND `answer`=old.r_answer;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id_relation` int(11) NOT NULL AUTO_INCREMENT,
  `description` char(255) NOT NULL,
  PRIMARY KEY (`id_relation`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (1,'?▄ж-?-?-'),(2,'?▀ж-???-'),(3,'?╤ж-?-T?T╚ж??-'),(4,'?╘ж??+T?T╚ж??-'),(5,'??T?T╟ж??-'),(6,'?▌ж? ?-??T????+????T╤ж-');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insRelation BEFORE INSERT ON `relations` FOR EACH ROW
BEGIN
	IF	new.description = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialty` (
  `id_spec` int(11) NOT NULL AUTO_INCREMENT,
  `code_spec` char(10) NOT NULL,
  `description` char(255) NOT NULL,
  `pdf_file` char(255) NOT NULL,
  PRIMARY KEY (`id_spec`),
  UNIQUE KEY `code_spec` (`code_spec`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (1,'09.02.03','?▀ж┌ж?','C:\\OpenServer\\domains\\EDUKIT\\admin\\pdfs\\FS.pdf'),(2,'09.02.05','?╪ж?','C:\\OpenServer\\domains\\EDUKIT\\admin\\pdfs\\FS.pdf');
/*!40000 ALTER TABLE `specialty` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insSpecialty BEFORE INSERT ON `specialty` FOR EACH ROW
BEGIN
	IF new.code_spec = ''   OR
		new.description = '' OR
		new.pdf_file = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_insSpecialty AFTER INSERT ON `specialty` FOR EACH ROW
BEGIN
	call writeLog('specialty', CONCAT(
		'ж╘ж-ж-ж-ж-жмжжж-ж- ж-ж-ж-ж-T╧ T┴жмжжT╞жмж-жмT╠ж-ж-T┴T┬T╠ ', new.code_spec, ' ', new.description
    ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_uptSpecialty AFTER UPDATE ON `specialty` FOR EACH ROW
BEGIN
	call writeLog('specialty', CONCAT(
		'жсжмжжT╞жмж-жмT╠ж-ж-T┴T┬T╠ ж-ж-ж-ж-ж-жмжжж-ж- [', 
        old.code_spec, ' ',
		old.description, ' ',
        old.pdf_file, '] ж-T╦жмж- ж-ж-ж-ж-ж-жмT╤ж- ж-ж- [',
        new.code_spec, ' ',
        new.description, ' ',
        new.pdf_file
    ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_delSpecialty AFTER DELETE ON `specialty` FOR EACH ROW 
BEGIN
	call writeLog('specialty', CONCAT(
		'жсжмжжT╞жмж-жмT╠ж-ж-T┴T┬T╠ ', old.code_spec, ' ', old.description, ' ж-T╦жмж- T├ж+ж-жмT╤ж-ж-'
    ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_answers`
--

DROP TABLE IF EXISTS `student_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_answers` (
  `id_student_answer` int(11) NOT NULL AUTO_INCREMENT,
  `id_student_test` int(11) NOT NULL,
  `question` char(255) DEFAULT NULL,
  `answer` char(255) DEFAULT NULL,
  PRIMARY KEY (`id_student_answer`),
  KEY `id_student_test` (`id_student_test`),
  CONSTRAINT `R19` FOREIGN KEY (`id_student_test`) REFERENCES `student_tests` (`id_student_test`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_answers`
--

LOCK TABLES `student_answers` WRITE;
/*!40000 ALTER TABLE `student_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_answers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insStudentAnswer BEFORE INSERT ON `student_answers` FOR EACH ROW
BEGIN
	IF new.question = '' OR
		new.answer = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_tests`
--

DROP TABLE IF EXISTS `student_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_tests` (
  `id_student_test` int(11) NOT NULL AUTO_INCREMENT,
  `id_student` int(11) NOT NULL,
  `caption` char(255) NOT NULL,
  `subject` char(255) NOT NULL,
  `date_pass` date NOT NULL,
  `mark` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_student_test`),
  KEY `id_student` (`id_student`),
  CONSTRAINT `R18` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_student`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_tests`
--

LOCK TABLES `student_tests` WRITE;
/*!40000 ALTER TABLE `student_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_tests` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insStudentTest BEFORE INSERT ON `student_tests` FOR EACH ROW
BEGIN
	IF new.subject = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_traffic`
--

DROP TABLE IF EXISTS `student_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_traffic` (
  `id_traffic` int(11) NOT NULL AUTO_INCREMENT,
  `id_student` int(11) NOT NULL,
  `date_visit` date NOT NULL,
  `count_passed_hours` int(11) NOT NULL,
  `count_all_hours` int(11) NOT NULL,
  PRIMARY KEY (`id_traffic`),
  KEY `id_student` (`id_student`),
  CONSTRAINT `R20` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_student`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_traffic`
--

LOCK TABLES `student_traffic` WRITE;
/*!40000 ALTER TABLE `student_traffic` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_traffic` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insStudentTraffic BEFORE INSERT ON `student_traffic` FOR EACH ROW
BEGIN
	IF
		(new.count_passed_hours < 0) OR
		(new.count_all_hours < 0)    
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Incorrect value';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id_student` int(11) NOT NULL,
  `home_address` char(255) NOT NULL,
  `cell_phone` char(12) NOT NULL,
  `grp` int(11) NOT NULL,
  PRIMARY KEY (`id_student`),
  KEY `grp` (`grp`),
  CONSTRAINT `R3` FOREIGN KEY (`id_student`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `R5` FOREIGN KEY (`grp`) REFERENCES `groups` (`grp`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'null','null',1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insStudent BEFORE INSERT ON `students` FOR EACH ROW
BEGIN
	IF new.home_address = '' OR
		new.cell_phone = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_insStudent AFTER INSERT ON `students` FOR EACH ROW
BEGIN
	call writeLog('students', CONCAT(
		'ж╘ж-ж-ж-ж-жмжжж- ж-ж-ж-T╦жж T┴T┬T├ж+жжж-T┬'
    ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_uptStudent AFTER UPDATE ON `students` FOR EACH ROW
BEGIN
	call writeLog('students', CONCAT(
		'ж▐ж-ж-ж-ж-жмжжж-ж- жмж-T─ж-T└ж-ж-T╞жмT╧ ж- T┴T┬T├ж+жжж-T┬жж T┴ ID ', new.id_student
    ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_delStudent AFTER DELETE ON `students` FOR EACH ROW 
BEGIN
	call writeLog('students', CONCAT(
		'жсT┬T├ж+жжж-T┬ T┴ ', old.id_student, ' ж-T╦жм T├ж+ж-жмT╤ж-'
    ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id_subject` int(11) NOT NULL AUTO_INCREMENT,
  `description` char(255) NOT NULL,
  PRIMARY KEY (`id_subject`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (3,'?╨ж?'),(4,'?▐ж?');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insSubject BEFORE INSERT ON `subjects` FOR EACH ROW
BEGIN
	IF new.description = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_insSubject AFTER INSERT ON `subjects` FOR EACH ROW
BEGIN
	call writeLog('subjects', CONCAT(
		'ж╘ж-ж-ж-ж-жмжжж- ж-ж-ж-T╦жж жмT└жжж+ж-жжT┬ ', new.description
    ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_uptSubject AFTER UPDATE ON `subjects` FOR EACH ROW
BEGIN
	call writeLog('subjects', CONCAT(
		'ж▀T└жжж+ж-жжT┬ ', old.description, ' ж-T╦жм ж-ж-ж-ж-ж-жмT╤ж- ж-ж- ', new.description
    ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_delSubject AFTER DELETE ON `subjects` FOR EACH ROW 
BEGIN
	call writeLog('subjects', CONCAT(
		'ж▀T└жжж+ж-жжT┬ ', old.description, ' ж-T╦жм T├ж+ж-жмT╤ж-'
    ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `teacher_subjects`
--

DROP TABLE IF EXISTS `teacher_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_subjects` (
  `id_teacher` int(11) NOT NULL,
  `id_subject` int(11) NOT NULL,
  PRIMARY KEY (`id_teacher`,`id_subject`),
  KEY `id_subject` (`id_subject`),
  CONSTRAINT `R12` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_teacher`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `R13` FOREIGN KEY (`id_subject`) REFERENCES `subjects` (`id_subject`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_subjects`
--

LOCK TABLES `teacher_subjects` WRITE;
/*!40000 ALTER TABLE `teacher_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `id_teacher` int(11) NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`id_teacher`),
  CONSTRAINT `R10` FOREIGN KEY (`id_teacher`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insTeacher BEFORE INSERT ON `teachers` FOR EACH ROW
BEGIN
	IF	new.info = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `id_test` int(11) NOT NULL AUTO_INCREMENT,
  `id_subject` int(11) NOT NULL,
  `id_teacher` int(11) NOT NULL,
  `caption` char(255) NOT NULL,
  PRIMARY KEY (`id_test`),
  KEY `id_subject` (`id_subject`),
  KEY `id_teacher` (`id_teacher`),
  CONSTRAINT `R14` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_teacher`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `R15` FOREIGN KEY (`id_subject`) REFERENCES `subjects` (`id_subject`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insTest BEFORE INSERT ON `tests` FOR EACH ROW
BEGIN
	IF new.caption = ''
	THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Filed is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `typeuser`
--

DROP TABLE IF EXISTS `typeuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeuser` (
  `id_type_user` int(11) NOT NULL AUTO_INCREMENT,
  `description` char(30) NOT NULL,
  PRIMARY KEY (`id_type_user`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeuser`
--

LOCK TABLES `typeuser` WRITE;
/*!40000 ALTER TABLE `typeuser` DISABLE KEYS */;
INSERT INTO `typeuser` VALUES (2,'ELDER'),(4,'PARENT'),(3,'STUDENT'),(1,'TEACHER');
/*!40000 ALTER TABLE `typeuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insTypeUser BEFORE INSERT ON `typeUser` FOR EACH ROW
BEGIN
	IF new.description = '' THEN
		SIGNAL SQLSTATE '45000' SET
			MESSAGE_TEXT = 'Field is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `sn` char(30) NOT NULL,
  `fn` char(30) NOT NULL,
  `pt` char(30) NOT NULL,
  `email` char(30) NOT NULL,
  `passwd` char(32) NOT NULL,
  `id_type_user` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`),
  KEY `id_type_user` (`id_type_user`),
  CONSTRAINT `R1` FOREIGN KEY (`id_type_user`) REFERENCES `typeuser` (`id_type_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'?╤ж-T?T?T??-?-','?сжжT???????','?╨ж-??T??-?-??T?','pmswga@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS insUser BEFORE INSERT ON `users` FOR EACH ROW
BEGIN
	IF new.sn = '' OR
		new.fn = ''  OR
		new.email  = ''      OR
		new.passwd = ''
	THEN
		SIGNAL SQLSTATE '45000' SET 
			MESSAGE_TEXT = 'Field is empty';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_insUser AFTER INSERT ON `users` FOR EACH ROW
BEGIN
	call writeLog('users', CONCAT(
		'ж╘ж-ж-ж-ж-жмжжж- ж-ж-ж-T╦жж жмж-жмT╠жмж-ж-ж-T┬жжжмT╠ [',
        new.sn, ' ',
        new.fn, ' ',
        new.pt, ' ',
		new.email, ']'
    ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_uptUser AFTER UPDATE ON `users` FOR EACH ROW
BEGIN
	call writeLog('users', CONCAT('ж╘ж-ж-ж-T╦жж жмж-жмT╠жмж-ж-ж-T┬жжжмT╧ ж-ж-ж-ж-ж-жмжжж-T╦ [s',
		old.sn, ' ',
		old.fn, ' ',
		old.pt, ' ',
		old.email, '] ---> [',
		new.sn,  ' ',
		new.fn, ' ',
		new.pt, ' ',
		new.email, ']'
	));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_delUser AFTER DELETE ON `users` FOR EACH ROW 
BEGIN
	call writeLog('users', CONCAT(
		'ж▀ж-жмT╠жмж-ж-ж-T┬жжжмT╠ ',
        old.sn, ' ',
        old.fn, ' ',
        old.pt, ' T├ж+ж-жмT╤ж-'
    ));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `v_admins`
--

DROP TABLE IF EXISTS `v_admins`;
/*!50001 DROP VIEW IF EXISTS `v_admins`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_admins` (
  `sn` tinyint NOT NULL,
  `fn` tinyint NOT NULL,
  `pt` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `passwd` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_elders`
--

DROP TABLE IF EXISTS `v_elders`;
/*!50001 DROP VIEW IF EXISTS `v_elders`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_elders` (
  `sn` tinyint NOT NULL,
  `fn` tinyint NOT NULL,
  `pt` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `paswd` tinyint NOT NULL,
  `type_user` tinyint NOT NULL,
  `home_address` tinyint NOT NULL,
  `cell_phone` tinyint NOT NULL,
  `grp` tinyint NOT NULL,
  `grp_id` tinyint NOT NULL,
  `edu_year` tinyint NOT NULL,
  `is_budget` tinyint NOT NULL,
  `spec_id` tinyint NOT NULL,
  `spec_code` tinyint NOT NULL,
  `spec_descp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_groups`
--

DROP TABLE IF EXISTS `v_groups`;
/*!50001 DROP VIEW IF EXISTS `v_groups`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_groups` (
  `id_grp` tinyint NOT NULL,
  `number` tinyint NOT NULL,
  `edu_year` tinyint NOT NULL,
  `budget` tinyint NOT NULL,
  `spec_id` tinyint NOT NULL,
  `spec_code` tinyint NOT NULL,
  `spec_descp` tinyint NOT NULL,
  `spec_file` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_news`
--

DROP TABLE IF EXISTS `v_news`;
/*!50001 DROP VIEW IF EXISTS `v_news`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_news` (
  `id_news` tinyint NOT NULL,
  `caption` tinyint NOT NULL,
  `content` tinyint NOT NULL,
  `author` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `dp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_parents`
--

DROP TABLE IF EXISTS `v_parents`;
/*!50001 DROP VIEW IF EXISTS `v_parents`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_parents` (
  `sn` tinyint NOT NULL,
  `fn` tinyint NOT NULL,
  `pt` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `paswd` tinyint NOT NULL,
  `age` tinyint NOT NULL,
  `education` tinyint NOT NULL,
  `work_place` tinyint NOT NULL,
  `post` tinyint NOT NULL,
  `home_phone` tinyint NOT NULL,
  `cell_phone` tinyint NOT NULL,
  `type_user` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_relations`
--

DROP TABLE IF EXISTS `v_relations`;
/*!50001 DROP VIEW IF EXISTS `v_relations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_relations` (
  `descp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_specialtyes`
--

DROP TABLE IF EXISTS `v_specialtyes`;
/*!50001 DROP VIEW IF EXISTS `v_specialtyes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_specialtyes` (
  `id_spec` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `descp` tinyint NOT NULL,
  `file` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_students`
--

DROP TABLE IF EXISTS `v_students`;
/*!50001 DROP VIEW IF EXISTS `v_students`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_students` (
  `sn` tinyint NOT NULL,
  `fn` tinyint NOT NULL,
  `pt` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `paswd` tinyint NOT NULL,
  `type_user` tinyint NOT NULL,
  `home_address` tinyint NOT NULL,
  `cell_phone` tinyint NOT NULL,
  `grp` tinyint NOT NULL,
  `grp_id` tinyint NOT NULL,
  `edu_year` tinyint NOT NULL,
  `is_budget` tinyint NOT NULL,
  `spec_id` tinyint NOT NULL,
  `spec_code` tinyint NOT NULL,
  `spec_descp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_subjects`
--

DROP TABLE IF EXISTS `v_subjects`;
/*!50001 DROP VIEW IF EXISTS `v_subjects`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_subjects` (
  `id_subject` tinyint NOT NULL,
  `descp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_teachers`
--

DROP TABLE IF EXISTS `v_teachers`;
/*!50001 DROP VIEW IF EXISTS `v_teachers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_teachers` (
  `sn` tinyint NOT NULL,
  `fn` tinyint NOT NULL,
  `pt` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `paswd` tinyint NOT NULL,
  `info` tinyint NOT NULL,
  `type_user` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_tests`
--

DROP TABLE IF EXISTS `v_tests`;
/*!50001 DROP VIEW IF EXISTS `v_tests`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_tests` (
  `id_test` tinyint NOT NULL,
  `author` tinyint NOT NULL,
  `caption` tinyint NOT NULL,
  `subject_id` tinyint NOT NULL,
  `subject_caption` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_traffic`
--

DROP TABLE IF EXISTS `v_traffic`;
/*!50001 DROP VIEW IF EXISTS `v_traffic`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_traffic` (
  `fn` tinyint NOT NULL,
  `sn` tinyint NOT NULL,
  `pt` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `date_visit` tinyint NOT NULL,
  `count_passed_hours` tinyint NOT NULL,
  `count_all_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_users`
--

DROP TABLE IF EXISTS `v_users`;
/*!50001 DROP VIEW IF EXISTS `v_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_users` (
  `sn` tinyint NOT NULL,
  `fn` tinyint NOT NULL,
  `pt` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `paswd` tinyint NOT NULL,
  `type_user` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `iep`
--

USE `iep`;

--
-- Final view structure for view `v_admins`
--

/*!50001 DROP TABLE IF EXISTS `v_admins`*/;
/*!50001 DROP VIEW IF EXISTS `v_admins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_admins` AS select `admins`.`sn` AS `sn`,`admins`.`fn` AS `fn`,`admins`.`pt` AS `pt`,`admins`.`email` AS `email`,`admins`.`passwd` AS `passwd` from `admins` order by `admins`.`sn`,`admins`.`fn`,`admins`.`pt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_elders`
--

/*!50001 DROP TABLE IF EXISTS `v_elders`*/;
/*!50001 DROP VIEW IF EXISTS `v_elders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_elders` AS select `u`.`sn` AS `sn`,`u`.`fn` AS `fn`,`u`.`pt` AS `pt`,`u`.`email` AS `email`,`u`.`passwd` AS `paswd`,`u`.`id_type_user` AS `type_user`,`s`.`home_address` AS `home_address`,`s`.`cell_phone` AS `cell_phone`,`g`.`description` AS `grp`,`g`.`grp` AS `grp_id`,`g`.`edu_year` AS `edu_year`,`g`.`is_budget` AS `is_budget`,`sp`.`id_spec` AS `spec_id`,`sp`.`code_spec` AS `spec_code`,`sp`.`description` AS `spec_descp` from (((`users` `u` join `students` `s` on((`u`.`id_user` = `s`.`id_student`))) join `groups` `g` on((`s`.`grp` = `g`.`grp`))) join `specialty` `sp` on((`sp`.`id_spec` = `g`.`spec_id`))) where (`u`.`id_type_user` = 2) order by `u`.`sn`,`u`.`fn`,`u`.`pt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_groups`
--

/*!50001 DROP TABLE IF EXISTS `v_groups`*/;
/*!50001 DROP VIEW IF EXISTS `v_groups`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_groups` AS select `g`.`grp` AS `id_grp`,`g`.`description` AS `number`,`g`.`edu_year` AS `edu_year`,`g`.`is_budget` AS `budget`,`g`.`spec_id` AS `spec_id`,`s`.`code_spec` AS `spec_code`,`s`.`description` AS `spec_descp`,`s`.`pdf_file` AS `spec_file` from (`groups` `g` join `specialty` `s` on((`g`.`spec_id` = `s`.`id_spec`))) order by `g`.`grp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_news`
--

/*!50001 DROP TABLE IF EXISTS `v_news`*/;
/*!50001 DROP VIEW IF EXISTS `v_news`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_news` AS select `n`.`id_news` AS `id_news`,`n`.`caption` AS `caption`,`n`.`content` AS `content`,concat(`u`.`sn`,' ',left(`u`.`fn`,1),'. ',left(`u`.`pt`,1),'.') AS `author`,`u`.`email` AS `email`,`n`.`date_publication` AS `dp` from (`news` `n` join `users` `u` on((`n`.`id_author` = `u`.`id_user`))) order by `n`.`date_publication`,`n`.`caption` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_parents`
--

/*!50001 DROP TABLE IF EXISTS `v_parents`*/;
/*!50001 DROP VIEW IF EXISTS `v_parents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_parents` AS select `u`.`sn` AS `sn`,`u`.`fn` AS `fn`,`u`.`pt` AS `pt`,`u`.`email` AS `email`,`u`.`passwd` AS `paswd`,`p`.`age` AS `age`,`p`.`education` AS `education`,`p`.`work_place` AS `work_place`,`p`.`post` AS `post`,`p`.`home_phone` AS `home_phone`,`p`.`cell_phone` AS `cell_phone`,`u`.`id_type_user` AS `type_user` from (`users` `u` join `parents` `p` on((`u`.`id_user` = `p`.`id_parent`))) where (`u`.`id_type_user` = 4) order by `u`.`sn`,`u`.`fn`,`u`.`pt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_relations`
--

/*!50001 DROP TABLE IF EXISTS `v_relations`*/;
/*!50001 DROP VIEW IF EXISTS `v_relations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_relations` AS select `relations`.`description` AS `descp` from `relations` order by `relations`.`description` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_specialtyes`
--

/*!50001 DROP TABLE IF EXISTS `v_specialtyes`*/;
/*!50001 DROP VIEW IF EXISTS `v_specialtyes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_specialtyes` AS select `specialty`.`id_spec` AS `id_spec`,`specialty`.`code_spec` AS `code`,`specialty`.`description` AS `descp`,`specialty`.`pdf_file` AS `file` from `specialty` order by `specialty`.`code_spec` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_students`
--

/*!50001 DROP TABLE IF EXISTS `v_students`*/;
/*!50001 DROP VIEW IF EXISTS `v_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_students` AS select `u`.`sn` AS `sn`,`u`.`fn` AS `fn`,`u`.`pt` AS `pt`,`u`.`email` AS `email`,`u`.`passwd` AS `paswd`,`u`.`id_type_user` AS `type_user`,`s`.`home_address` AS `home_address`,`s`.`cell_phone` AS `cell_phone`,`g`.`description` AS `grp`,`g`.`grp` AS `grp_id`,`g`.`edu_year` AS `edu_year`,`g`.`is_budget` AS `is_budget`,`sp`.`id_spec` AS `spec_id`,`sp`.`code_spec` AS `spec_code`,`sp`.`description` AS `spec_descp` from (((`users` `u` join `students` `s` on((`u`.`id_user` = `s`.`id_student`))) join `groups` `g` on((`s`.`grp` = `g`.`grp`))) join `specialty` `sp` on((`sp`.`id_spec` = `g`.`spec_id`))) where (`u`.`id_type_user` = 3) order by `u`.`sn`,`u`.`fn`,`u`.`pt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_subjects`
--

/*!50001 DROP TABLE IF EXISTS `v_subjects`*/;
/*!50001 DROP VIEW IF EXISTS `v_subjects`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_subjects` AS select `subjects`.`id_subject` AS `id_subject`,`subjects`.`description` AS `descp` from `subjects` order by `subjects`.`description` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_teachers`
--

/*!50001 DROP TABLE IF EXISTS `v_teachers`*/;
/*!50001 DROP VIEW IF EXISTS `v_teachers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_teachers` AS select `u`.`sn` AS `sn`,`u`.`fn` AS `fn`,`u`.`pt` AS `pt`,`u`.`email` AS `email`,`u`.`passwd` AS `paswd`,`t`.`info` AS `info`,`u`.`id_type_user` AS `type_user` from (`users` `u` join `teachers` `t` on((`u`.`id_user` = `t`.`id_teacher`))) where (`u`.`id_type_user` = 1) order by `u`.`sn`,`u`.`fn`,`u`.`pt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_tests`
--

/*!50001 DROP TABLE IF EXISTS `v_tests`*/;
/*!50001 DROP VIEW IF EXISTS `v_tests`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_tests` AS select `t`.`id_test` AS `id_test`,`u`.`email` AS `author`,`t`.`caption` AS `caption`,`s`.`id_subject` AS `subject_id`,`s`.`description` AS `subject_caption` from ((`tests` `t` join `users` `u` on((`t`.`id_teacher` = `u`.`id_user`))) join `subjects` `s` on((`t`.`id_subject` = `s`.`id_subject`))) order by `t`.`id_test` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_traffic`
--

/*!50001 DROP TABLE IF EXISTS `v_traffic`*/;
/*!50001 DROP VIEW IF EXISTS `v_traffic`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_traffic` AS select `u`.`sn` AS `fn`,`u`.`fn` AS `sn`,`u`.`pt` AS `pt`,`u`.`email` AS `email`,`s_t`.`date_visit` AS `date_visit`,`s_t`.`count_passed_hours` AS `count_passed_hours`,`s_t`.`count_all_hours` AS `count_all_hours` from ((`student_traffic` `s_t` join `students` `s` on((`s_t`.`id_student` = `s`.`id_student`))) join `users` `u` on((`s`.`id_student` = `u`.`id_user`))) where (`u`.`id_type_user` = 4) order by `u`.`sn`,`u`.`fn`,`u`.`pt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_users`
--

/*!50001 DROP TABLE IF EXISTS `v_users`*/;
/*!50001 DROP VIEW IF EXISTS `v_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_users` AS select `users`.`sn` AS `sn`,`users`.`fn` AS `fn`,`users`.`pt` AS `pt`,`users`.`email` AS `email`,`users`.`passwd` AS `paswd`,`users`.`id_type_user` AS `type_user` from `users` order by `users`.`sn`,`users`.`fn`,`users`.`pt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-25 23:43:00
