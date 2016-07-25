-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: localhost    Database: profedex
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
-- Table structure for table `academic_center`
--

DROP TABLE IF EXISTS `academic_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_center` (
  `center_id` int(11) NOT NULL AUTO_INCREMENT,
  `center_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_center`
--

LOCK TABLES `academic_center` WRITE;
/*!40000 ALTER TABLE `academic_center` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(1000) DEFAULT NULL,
  `comment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `professor_id` int(11) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`comment_id`,`user_id`),
  KEY `fk_comment_student1_idx` (`user_id`),
  KEY `fk_commnent_professor_idx` (`professor_id`),
  CONSTRAINT `fk_comment_student1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_commnent_professor` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'asdfasdf','2016-07-23 22:27:23',1,1),(2,'asdfasdf','2016-07-24 11:13:30',1,1),(5,'34j,kgjk,g,','2016-07-24 17:11:52',1,1),(9,'asdfasdfasdfasdfasdf','2016-07-24 19:10:52',1,3),(10,'asdfasdfasdfasdfasdfkansdfkolansdklfjansdlfknaçsodlfnaowenaoiernvboeirnvoaenrvoaiervoasdkclvnasdfiouvaervnaosdçfinvasdfvasdfasdf','2016-07-24 19:11:35',1,3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_info` varchar(45) DEFAULT NULL,
  `complaint_date` datetime DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `con_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`complaint_id`,`user_id`),
  KEY `fk_complaint_student1_idx` (`user_id`),
  KEY `fk_complaint_student2_idx` (`con_user_id`),
  CONSTRAINT `fk_complaint_student1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_complaint_student2` FOREIGN KEY (`con_user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_info` (
  `professor_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_info_id` int(11) NOT NULL,
  `contact_info_name` varchar(45) DEFAULT NULL,
  `contact_info_value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`contact_info_id`),
  KEY `fk_contact_info_professor1_idx` (`professor_id`),
  CONSTRAINT `fk_contact_info_professor1` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_data` varchar(45) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `professor_professor_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`professor_professor_id`),
  KEY `fk_location_student1_idx` (`user_id`),
  KEY `fk_location_professor1_idx` (`professor_professor_id`),
  CONSTRAINT `fk_location_professor1` FOREIGN KEY (`professor_professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_student1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `professor_id` int(11) NOT NULL AUTO_INCREMENT,
  `professor_name` varchar(255) DEFAULT NULL,
  `professor_email` varchar(255) DEFAULT NULL,
  `professor_picture` varchar(255) DEFAULT NULL,
  `professor_description` varchar(4000) DEFAULT NULL,
  `professor_room` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`professor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Zachery','feugiat@Fuscediamnunc.edu','AWW19BDK8UM','Descritption','T0T 5K6'),(2,'Griffith','egestas@placerat.co.uk','XYN57VQC6IH','posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse','N7E 3J9'),(3,'Rajah','malesuada@neceleifend.org','IMP12NJA3SE','ornare tortor at risus.','D7W 3C4'),(4,'Valentine','lorem@sem.com','QLM62LPB0SZ','volutpat. Nulla','W7X 9C3'),(5,'Cain','Nullam@famesacturpis.edu','UCO05ACG6UU','erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis','E0A 4C2'),(6,'Norman','arcu.eu@mollisDuis.com','HJK66GHW0QA','lacinia at, iaculis quis, pede. Praesent eu dui.','F3A 5N3'),(7,'Noah','urna.convallis@Vestibulumante.co.uk','UZE69EVV0VN','venenatis a, magna. Lorem','L6U 7X2'),(8,'Zachery','a.magna@nostraper.co.uk','ZLK33YMH5PS','Proin','O2H 0T0'),(9,'Justin','in@montesnasceturridiculus.com','WHH53CIG7MN','amet risus. Donec egestas. Aliquam nec enim. Nunc ut','L6M 4W7'),(10,'Cyrus','pharetra.felis.eget@Integertincidunt.com','TCD78UDE4PY','sit amet ante. Vivamus non','R5A 0N4'),(11,'Batata','batata@asdf.fy',NULL,'Frita','McDonalds'),(12,'hueheuheuhueh','asdf',NULL,'ehuahuerhasdfaklsjdfnaksnvasdifhauisdfhasdkvnasiduvbakbvaksjdvakjsdbaipeervnasivansjkdlvnasidvasldmvnasiodufvalsvnasdivabwrvasdkjvbansdjikvbaksjdvbakjsdvbajksdbvakjsdvbakjlsdvbajlsdbvkajbsdvkjabsdkvasd','asdf');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_picture`
--

DROP TABLE IF EXISTS `professor_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor_picture` (
  `professor_id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_id` int(11) NOT NULL,
  `picture_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`picture_id`),
  KEY `fk_table1_professor1_idx` (`professor_id`),
  CONSTRAINT `fk_table1_professor1` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_picture`
--

LOCK TABLES `professor_picture` WRITE;
/*!40000 ALTER TABLE `professor_picture` DISABLE KEYS */;
INSERT INTO `professor_picture` VALUES (1,1,'asdfasdfasdf');
/*!40000 ALTER TABLE `professor_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating_name` varchar(45) DEFAULT NULL,
  `rating_value` float DEFAULT NULL,
  `professor_id` int(11) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `rating_type_id` int(11) NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `fk_rating_professor1_idx` (`professor_id`),
  KEY `fk_rating_student1_idx` (`user_id`),
  KEY `fk_rating_rating_type1_idx` (`rating_type_id`),
  CONSTRAINT `fk_rating_professor1` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_rating_type1` FOREIGN KEY (`rating_type_id`) REFERENCES `rating_type` (`rating_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_student1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,NULL,3.545,1,1,1),(3,NULL,2.4,1,1,2),(5,NULL,4,1,2,2),(6,NULL,2.4,1,2,1),(17,NULL,5,1,3,2),(18,NULL,2.5,1,3,1);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_type`
--

DROP TABLE IF EXISTS `rating_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_type` (
  `rating_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating_type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rating_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_type`
--

LOCK TABLES `rating_type` WRITE;
/*!40000 ALTER TABLE `rating_type` DISABLE KEYS */;
INSERT INTO `rating_type` VALUES (1,'Dificuldade'),(2,'Didatica');
/*!40000 ALTER TABLE `rating_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(45) DEFAULT NULL,
  `subject_info` varchar(255) DEFAULT NULL,
  `subject_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_lecturer`
--

DROP TABLE IF EXISTS `subject_lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_lecturer` (
  `subject_lecturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_lecturer_semester` varchar(45) DEFAULT NULL,
  `professor_professor_id` int(11) NOT NULL,
  `subject_subject_id` int(11) NOT NULL,
  PRIMARY KEY (`subject_lecturer_id`),
  KEY `fk_subject_lecturer_professor1_idx` (`professor_professor_id`),
  KEY `fk_subject_lecturer_subject1_idx` (`subject_subject_id`),
  CONSTRAINT `fk_subject_lecturer_professor1` FOREIGN KEY (`professor_professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_lecturer_subject1` FOREIGN KEY (`subject_subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_lecturer`
--

LOCK TABLES `subject_lecturer` WRITE;
/*!40000 ALTER TABLE `subject_lecturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `password_hash` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `academic_center_center_id` int(11) DEFAULT NULL,
  `api_key` varchar(32) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `fk_student_academic_center1_idx` (`academic_center_center_id`),
  CONSTRAINT `fk_student_academic_center1` FOREIGN KEY (`academic_center_center_id`) REFERENCES `academic_center` (`center_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'asdf','asdf@asdf.asdf','$2a$10$d191f95474223b4a12936OXvTmWj2Hcc7JlHlVTApovCMlQ/4iNg6','2016-07-24 01:27:14',NULL,NULL,'d4295770394f1d3b8e37f8b38d2dbae8',1),(2,'asdf','asdf3@asdf.asdf','$2a$10$f9a13ddf9b1fb8e8f85c3uJpQfH..8/KEXO2l8/6Wa8t8vv0lc6kS','2016-07-24 05:30:49',NULL,NULL,'3b70cd7bb206725cefee8c07e2e4585a',1),(3,'Asdf','asdf@asdf.com','$2a$10$052f5dcd557ea485e4ae1upSNsYfDCcY6Vtq44NO5FO/D5.xuiwIK','2016-07-24 13:34:39',NULL,NULL,'da1bd92395dbb7ecfa321a3e3c650a07',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `comment_user_id` int(10) unsigned NOT NULL,
  `voter_id` int(10) unsigned NOT NULL,
  `vote_val` int(1) DEFAULT NULL,
  PRIMARY KEY (`vote_id`),
  KEY `fk_vote_user1_idx` (`voter_id`),
  KEY `fk_vote_comment1` (`comment_id`,`comment_user_id`),
  CONSTRAINT `fk_vote_comment1` FOREIGN KEY (`comment_id`, `comment_user_id`) REFERENCES `comment` (`comment_id`, `user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vote_user1` FOREIGN KEY (`voter_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (1,1,1,1,1),(2,5,1,3,-1),(3,9,3,3,-1),(5,10,3,3,1);
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-25 17:07:40
