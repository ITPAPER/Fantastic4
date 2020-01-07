-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: semoproject
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `co_member`
--

DROP TABLE IF EXISTS `co_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `co_name` varchar(50) NOT NULL,
  `broker_num` varchar(40) NOT NULL,
  `office_num` varchar(40) NOT NULL,
  `office_addr` varchar(100) NOT NULL,
  `tel_num` varchar(13) NOT NULL,
  `boss_name` varchar(20) DEFAULT NULL,
  `tel` varchar(13) NOT NULL,
  `assi_name` varchar(20) NOT NULL,
  `position` char(1) NOT NULL,
  `email_id` varchar(150) NOT NULL,
  `user_pw` varchar(50) NOT NULL,
  `approval` enum('Y','N') NOT NULL,
  `reg_date` datetime NOT NULL,
  `broker_img` varchar(255) DEFAULT NULL,
  `recent_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_member`
--

LOCK TABLES `co_member` WRITE;
/*!40000 ALTER TABLE `co_member` DISABLE KEYS */;
INSERT INTO `co_member` VALUES (20,'테스트부동산','12341234','12341234','서울 중랑구 공릉로 2','01012345678','홍길동','021231234','김부동','C','test@naver.com','test','Y','2019-12-09 16:24:59','/15758778879020.png','2019-12-09 16:24:59'),(21,'아이티부동산','12356465','12341234','학원입니다','01017487654','이재민','021231234','장상윤','A','parkharin@naver.com','asdf','Y','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(23,'이젠부동산','54564454','34563456','학원입니다.','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(24,'이젠부동산','14123123','24536435','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(25,'이젠부동산','12312323','45667565','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(26,'이젠부동산','15151232','45645675','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(27,'이젠부동산','23423423','34564565','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(28,'이젠부동산','23423524','35674653','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(29,'이젠부동산','23452435','35463578','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(30,'이젠부동산','23423441','24576136','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(31,'이젠부동산','12334232','34563545','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(32,'여기부동산','23423534','54676788','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(33,'저기부동산','23424353','56745645','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(34,'조기부동산','34523443','24574567','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(35,'쪼기부동산','36567564','35674368','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(36,'쩌기부동산','34556464','34567354','학원입니다','01012341234','박하린','029691234','이재민','A','parkaharin@naver.com','test','N','2019-11-18 12:32:30','123456789','2019-11-18 12:32:30'),(37,'파일다운로드','34554365','35467456','서울 중랑구 공릉로 2','01012341234','이재민','021231234','이재민','C','test1234123@naver.com','1234','N','2019-12-11 13:37:47','/15760390673430.png','2019-12-11 13:37:47'),(38,'아자부동산','23524352','34576455','서울 노원구 공릉로 95','01012341234','홍길동','029142135','이재민','C','test1020392@gmail.com','test','Y','2019-12-12 15:08:23','/15761309039060.png','2019-12-12 15:08:23'),(39,'어쩌라고부동산','24434342','24356724','서울 중랑구 공릉로 2','01012341234','이재민','021231234','이재민','C','whynot@gmail.com','1234','N','2019-12-12 16:40:57','/15761364573390.jpg','2019-12-12 16:40:57'),(41,'나이스부동산','123412412','1234123412','서울 동대문구 천호대로 지하 405','01012341234','나이스','021231234','나이샷','C','nice@naver.com','1234','N','2019-12-26 09:14:22','/15773192627480.png','2019-12-26 09:14:22');
/*!40000 ALTER TABLE `co_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ge_member`
--

DROP TABLE IF EXISTS `ge_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ge_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `user_pw` varchar(50) NOT NULL,
  `tel_num` varchar(13) NOT NULL,
  `reg_date` datetime NOT NULL,
  `recent_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ge_member`
--

LOCK TABLES `ge_member` WRITE;
/*!40000 ALTER TABLE `ge_member` DISABLE KEYS */;
INSERT INTO `ge_member` VALUES (1,'admin','admin@admin.com','admin','01022222222','2019-11-18 12:32:00','2019-12-13 17:44:00'),(2,'test1','test1@gmail.com','test1','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(3,'test2','test2@gmail.com','test2','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(4,'test3','test3@gmail.com','test3','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(5,'test4','test4@gmail.com','test4','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(6,'test5','test5@gmail.com','test5','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(7,'test6','test6@gmail.com','test6','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(8,'test7','test7@gmail.com','test7','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(9,'test8','test8@gmail.com','test8','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(10,'test9','test9@gmail.com','test9','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(11,'test10','test10@gmail.com','test10','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(12,'test11','test11@gmail.com','test11','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(13,'test12','test12@gmail.com','test12','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(14,'test13','test13@gmail.com','test13','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(15,'test14','test14@gmail.com','test14','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(16,'test15','test15@gmail.com','test15','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(17,'test16','test16@gmail.com','test16','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(18,'test17','test17@gmail.com','test17','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(19,'test18','test18@gmail.com','test18','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(20,'test19','test19@gmail.com','test19','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(21,'test20','test20@gmail.com','test20','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(22,'test21','test21@gmail.com','test21','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(23,'test22','test22@gmail.com','test22','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(24,'test23','test23@gmail.com','test23','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(25,'test24','test24@gmail.com','test24','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(26,'test25','test25@gmail.com','test25','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(27,'test26','test26@gmail.com','test26','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(28,'test27','test27@gmail.com','test27','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(29,'test28','test28@gmail.com','test28','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(30,'test29','test29@gmail.com','test29','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(31,'test30','test30@gmail.com','test30','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(32,'test31','test31@gmail.com','test31','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(33,'test32','test32@gmail.com','test32','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(34,'test33','test33@gmail.com','test33','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(35,'test34','test34@gmail.com','test34','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(36,'test35','test35@gmail.com','test35','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(37,'test36','test36@gmail.com','test36','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(38,'test37','test37@gmail.com','test37','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(39,'test38','test38@gmail.com','test38','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(40,'test39','test39@gmail.com','test39','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(41,'test40','test40@gmail.com','test40','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(42,'test41','test41@gmail.com','test41','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(43,'test42','test42@gmail.com','test42','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(44,'test43','test43@gmail.com','test43','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(45,'test44','test44@gmail.com','test44','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(46,'test45','test45@gmail.com','test45','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(47,'test46','test46@gmail.com','test46','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(48,'test47','test47@gmail.com','test47','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(49,'test48','test48@gmail.com','test48','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(50,'test49','test49@gmail.com','test49','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(51,'test50','test50@gmail.com','test50','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(52,'test51','test51@gmail.com','test51','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(53,'test52','test52@gmail.com','test52','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(54,'test53','test53@gmail.com','test53','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(55,'test54','test54@gmail.com','test54','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(56,'test55','test55@gmail.com','test55','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(57,'test56','test56@gmail.com','test56','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(58,'test57','test57@gmail.com','test57','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(59,'test58','test58@gmail.com','test58','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(60,'test59','test59@gmail.com','test59','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(61,'test60','test60@gmail.com','test60','01012341234','2019-11-18 12:32:00','2019-12-13 17:44:00'),(131,'정보변경','test62@naver.com','test62','01052368461','2019-12-26 14:44:20','2019-12-26 14:44:20');
/*!40000 ALTER TABLE `ge_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_file`
--

DROP TABLE IF EXISTS `item_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_file` (
  `item_num` int(11) NOT NULL AUTO_INCREMENT,
  `fieldName` varchar(50) NOT NULL,
  `origin_name` varchar(255) NOT NULL,
  `file_dir` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `content_type` varchar(50) NOT NULL,
  `file_size` int(11) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `maemul_num` int(11) NOT NULL,
  PRIMARY KEY (`item_num`),
  KEY `fk_item_file_maemul_register1_idx` (`maemul_num`),
  CONSTRAINT `fk_item_file_maemul_register1` FOREIGN KEY (`maemul_num`) REFERENCES `maemul_register` (`maemul_num`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_file`
--

LOCK TABLES `item_file` WRITE;
/*!40000 ALTER TABLE `item_file` DISABLE KEYS */;
INSERT INTO `item_file` VALUES (130,'getfile','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15752851100140.jpg','image/jpeg',75431,'2019-12-02 20:11:50','2019-12-02 20:11:50',185),(131,'maemulinput_imgs','매물03.png','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15752851100140.png','image/png',39059,'2019-12-02 20:11:50','2019-12-02 20:11:50',185),(132,'maemulinput_imgs','매물등록01.png','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15752851100150.png','image/png',34460,'2019-12-02 20:11:50','2019-12-02 20:11:50',185),(133,'getfile','sk.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15752852968890.jpg','image/jpeg',136336,'2019-12-02 20:14:56','2019-12-02 20:14:56',186),(134,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15752852968900.jpg','image/jpeg',161284,'2019-12-02 20:14:56','2019-12-02 20:14:56',186),(135,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15752852968910.jpg','image/jpeg',75431,'2019-12-02 20:14:56','2019-12-02 20:14:56',186),(136,'getfile','sk.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15752869369340.jpg','image/jpeg',136336,'2019-12-02 20:42:16','2019-12-02 20:42:16',187),(137,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15752869369351.jpg','image/jpeg',161284,'2019-12-02 20:42:16','2019-12-02 20:42:16',187),(138,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15752869369350.jpg','image/jpeg',75431,'2019-12-02 20:42:16','2019-12-02 20:42:16',187),(142,'getfile','sk.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15753503132890.jpg','image/jpeg',136336,'2019-12-03 14:18:33','2019-12-03 14:18:33',189),(143,'maemulinput_imgs','매물03.png','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15753503132890.png','image/png',39059,'2019-12-03 14:18:33','2019-12-03 14:18:33',189),(144,'maemulinput_imgs','매물등록01.png','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15753503132900.png','image/png',34460,'2019-12-03 14:18:33','2019-12-03 14:18:33',189),(145,'maemulinput_imgs','매물등록02.png','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15753503132901.png','image/png',31948,'2019-12-03 14:18:33','2019-12-03 14:18:33',189),(146,'getfile','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15753519125930.jpg','image/jpeg',161284,'2019-12-03 14:45:12','2019-12-03 14:45:12',190),(147,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15753519125940.jpg','image/jpeg',161284,'2019-12-03 14:45:12','2019-12-03 14:45:12',190),(148,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15753519125941.jpg','image/jpeg',75431,'2019-12-03 14:45:12','2019-12-03 14:45:12',190),(155,'getfile','위메프.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755216080270.jpg','image/jpeg',39954,'2019-12-05 13:53:28','2019-12-05 13:53:28',193),(156,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755216080280.jpg','image/jpeg',161284,'2019-12-05 13:53:28','2019-12-05 13:53:28',193),(157,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755216080281.jpg','image/jpeg',75431,'2019-12-05 13:53:28','2019-12-05 13:53:28',193),(158,'getfile','위메프.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755219845290.jpg','image/jpeg',39954,'2019-12-05 13:59:44','2019-12-05 13:59:44',194),(159,'maemulinput_imgs','sk.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755219845300.jpg','image/jpeg',136336,'2019-12-05 13:59:44','2019-12-05 13:59:44',194),(160,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755219845301.jpg','image/jpeg',161284,'2019-12-05 13:59:44','2019-12-05 13:59:44',194),(161,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755219845312.jpg','image/jpeg',75431,'2019-12-05 13:59:44','2019-12-05 13:59:44',194),(162,'getfile','카카오.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755248718560.jpg','image/jpeg',153466,'2019-12-05 14:47:51','2019-12-05 14:47:51',195),(163,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755248718570.jpg','image/jpeg',161284,'2019-12-05 14:47:51','2019-12-05 14:47:51',195),(164,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755248718571.jpg','image/jpeg',75431,'2019-12-05 14:47:51','2019-12-05 14:47:51',195),(165,'getfile','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755256724090.jpg','image/jpeg',75431,'2019-12-05 15:01:12','2019-12-05 15:01:12',196),(166,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755256724100.jpg','image/jpeg',75431,'2019-12-05 15:01:12','2019-12-05 15:01:12',196),(167,'getfile','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755258534660.jpg','image/jpeg',75431,'2019-12-05 15:04:13','2019-12-05 15:04:13',197),(168,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755258534661.jpg','image/jpeg',161284,'2019-12-05 15:04:13','2019-12-05 15:04:13',197),(169,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755258534670.jpg','image/jpeg',75431,'2019-12-05 15:04:13','2019-12-05 15:04:13',197),(170,'getfile','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755260131100.jpg','image/jpeg',161284,'2019-12-05 15:06:53','2019-12-05 15:06:53',198),(171,'maemulinput_imgs','매물03.png','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755260131110.png','image/png',39059,'2019-12-05 15:06:53','2019-12-05 15:06:53',198),(172,'maemulinput_imgs','매물등록01.png','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755260131111.png','image/png',34460,'2019-12-05 15:06:53','2019-12-05 15:06:53',198),(173,'getfile','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755270969910.jpg','image/jpeg',161284,'2019-12-05 15:24:57','2019-12-05 15:24:57',199),(174,'maemulinput_imgs','매물03.png','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755270969920.png','image/png',39059,'2019-12-05 15:24:57','2019-12-05 15:24:57',199),(175,'maemulinput_imgs','위메프.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755270969920.jpg','image/jpeg',39954,'2019-12-05 15:24:57','2019-12-05 15:24:57',199),(176,'getfile','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755339571980.jpg','image/jpeg',75431,'2019-12-05 17:19:17','2019-12-05 17:19:17',200),(177,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755339571981.jpg','image/jpeg',161284,'2019-12-05 17:19:17','2019-12-05 17:19:17',200),(178,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755339571990.jpg','image/jpeg',75431,'2019-12-05 17:19:17','2019-12-05 17:19:17',200),(182,'getfile','클릭2.png','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755432889960.png','image/png',16968,'2019-12-05 19:54:49','2019-12-05 19:54:49',202),(183,'maemulinput_imgs','naver.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755432889970.jpg','image/jpeg',385729,'2019-12-05 19:54:49','2019-12-05 19:54:49',202),(184,'maemulinput_imgs','위메프.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755432889971.jpg','image/jpeg',39954,'2019-12-05 19:54:49','2019-12-05 19:54:49',202),(185,'getfile','카카오.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755440234420.jpg','image/jpeg',153466,'2019-12-05 20:07:03','2019-12-05 20:07:03',203),(186,'maemulinput_imgs','sk.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755440234430.jpg','image/jpeg',136336,'2019-12-05 20:07:03','2019-12-05 20:07:03',203),(187,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755440234431.jpg','image/jpeg',161284,'2019-12-05 20:07:03','2019-12-05 20:07:03',203),(188,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15755440234432.jpg','image/jpeg',75431,'2019-12-05 20:07:03','2019-12-05 20:07:03',203),(189,'getfile','sk.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15756159326240.jpg','image/jpeg',136336,'2019-12-06 16:05:32','2019-12-06 16:05:32',204),(190,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15756159326250.jpg','image/jpeg',161284,'2019-12-06 16:05:32','2019-12-06 16:05:32',204),(191,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15756159326251.jpg','image/jpeg',75431,'2019-12-06 16:05:32','2019-12-06 16:05:32',204),(192,'getfile','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15759402668880.jpg','image/jpeg',161284,'2019-12-10 10:11:06','2019-12-10 10:11:06',205),(193,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15759402668890.jpg','image/jpeg',161284,'2019-12-10 10:11:06','2019-12-10 10:11:06',205),(194,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15759402668891.jpg','image/jpeg',75431,'2019-12-10 10:11:06','2019-12-10 10:11:06',205),(195,'getfile','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15759723760510.jpg','image/jpeg',75431,'2019-12-10 19:06:16','2019-12-10 19:06:16',206),(196,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15759723760520.jpg','image/jpeg',161284,'2019-12-10 19:06:16','2019-12-10 19:06:16',206),(197,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15759723760521.jpg','image/jpeg',75431,'2019-12-10 19:06:16','2019-12-10 19:06:16',206),(202,'getfile','naver.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15774138115440.jpg','image/jpeg',385729,'2019-12-02 18:56:46','2019-12-27 11:30:11',184),(203,'maemulinput_imgs','sk.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15774138115441.jpg','image/jpeg',136336,'2019-12-02 18:56:46','2019-12-27 11:30:11',184),(204,'maemulinput_imgs','Test3.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15774138115451.jpg','image/jpeg',75431,'2019-12-02 18:56:46','2019-12-27 11:30:11',184),(208,'getfile','naver.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15777572980740.jpg','image/jpeg',385729,'2019-12-02 23:48:22','2019-12-31 10:54:58',188),(209,'maemulinput_imgs','Test2.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15777572980750.jpg','image/jpeg',161284,'2019-12-02 23:48:22','2019-12-31 10:54:58',188),(210,'maemulinput_imgs','카카오.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15777572980751.jpg','image/jpeg',153466,'2019-12-02 23:48:22','2019-12-31 10:54:58',188);
/*!40000 ALTER TABLE `item_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maemul_register`
--

DROP TABLE IF EXISTS `maemul_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maemul_register` (
  `maemul_num` int(11) NOT NULL AUTO_INCREMENT,
  `item_addrst` varchar(50) NOT NULL,
  `item_addrnd` varchar(50) NOT NULL,
  `select_type` enum('Y','N') NOT NULL,
  `build_name` varchar(30) NOT NULL,
  `floor` int(11) NOT NULL,
  `all_floor` int(11) NOT NULL,
  `all_width` varchar(15) NOT NULL,
  `pri_width` varchar(15) NOT NULL,
  `heating` varchar(30) DEFAULT NULL,
  `toilet` varchar(30) DEFAULT NULL,
  `comple_year` int(11) NOT NULL,
  `movein` enum('Y','N') NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `hidden` text,
  `parking` int(3) DEFAULT NULL,
  `elv` int(3) DEFAULT NULL,
  `select_sale` enum('Y','N') NOT NULL,
  `monthly` int(11) DEFAULT NULL,
  `warrenty` int(11) DEFAULT NULL,
  `sale` int(11) DEFAULT NULL,
  `pre_war` int(11) DEFAULT NULL,
  `pre_month` int(11) DEFAULT NULL,
  `manage_ex` int(11) DEFAULT NULL,
  `premium` int(11) DEFAULT NULL,
  `latitude` decimal(27,25) NOT NULL,
  `longitude` decimal(28,25) NOT NULL,
  `co_num` int(11) NOT NULL,
  PRIMARY KEY (`maemul_num`),
  KEY `fk_maemul_register_co_member1_idx` (`co_num`),
  CONSTRAINT `fk_maemul_register_co_member1` FOREIGN KEY (`co_num`) REFERENCES `co_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maemul_register`
--

LOCK TABLES `maemul_register` WRITE;
/*!40000 ALTER TABLE `maemul_register` DISABLE KEYS */;
INSERT INTO `maemul_register` VALUES (184,'서울 중랑구 묵동 387','형네집 ','Y','오성빌라',3,18,'30','30','중앙난방','외부/남녀혼용',2002,'Y','test','test','test',0,0,'Y',500,7000,0,0,0,0,0,37.6186501219857700000000000,127.0814314072190700000000000,20),(185,'서울 강남구 도산대로 402-2','우리집','Y','우리빌딩',16,19,'20','20','중앙난방','내부/남녀구분',2003,'Y','test','test','test',0,0,'Y',800,8000,0,0,0,0,0,37.5230759916944340000000000,127.0395664044299600000000000,20),(186,'서울 강서구 강서로 375','너네집','Y','너네빌딩',1,18,'30','30','지역난방','외부/남녀혼용',2000,'Y','test','test','test',0,0,'Y',1200,12000,0,0,0,0,0,37.5591197241365000000000000,126.8380953570504600000000000,20),(187,'서울 강남구 테헤란로 101','모두의집','Y','모두빌딩',2,18,'30','30','중앙난방','내부/남녀구분',2003,'Y','test','test','test',0,0,'N',0,0,120000,6000,550,0,0,37.4986224205011200000000000,127.0280638045961400000000000,20),(188,'경기 부천시 역곡로45번길 36','상가건물','Y','상가빌딩',13,18,'60','30','개별냉난방','내부/남녀구분',2005,'Y','test','test','test',0,0,'Y',620,8000,0,0,0,0,0,37.4894164827969800000000000,126.8080371959067500000000000,20),(189,'경기 부천시 소사로 327','기억빌딩','Y','기억빌딩',15,20,'80','60','개별냉난방','외부/남녀혼용',2002,'Y','test','test','test',0,0,'Y',600,6000,0,0,0,0,0,37.4874954297718300000000000,126.7930308602619200000000000,20),(190,'경기 부천시 역곡로45번길 36','니은빌딩','Y','니은빌딩',1,3,'70','80','지역냉난방','외부/남녀혼용',2015,'Y','test','test','test',0,0,'Y',300,3000,0,0,0,0,0,37.4894164827969800000000000,126.8080371959067500000000000,20),(193,'서울 강남구 광평로 61','디긋빌딩','Y','디긋빌딩',3,16,'100','70','개별냉난방','외부/남녀혼용',2001,'Y','test','test','test',0,0,'Y',200,2000,0,0,0,0,0,37.4828458785775640000000000,127.0793707539510500000000000,20),(194,'서울 종로구 청와대로 1','리을빌딩','Y','리을빌딩',2,3,'120','120','중앙난방','내부/남녀구분',2013,'Y','test','test','test',0,0,'Y',400,4000,0,0,0,0,0,37.5862690756739200000000000,126.9766042181027400000000000,20),(195,'경기 성남시 분당구 돌마로 172','미음빌딩','Y','미음빌딩',3,10,'30','25','개별난방','내부/남녀구분',2014,'Y','test','test','test',0,0,'Y',700,7000,0,0,0,0,0,37.3542245130436000000000000,127.1209791611851800000000000,20),(196,'서울 강서구 마곡동로 30','비읍빌딩','Y','비읍빌딩',3,19,'20','20','개별냉난방','내부/남녀구분',2001,'Y','test','test','test',0,0,'Y',900,9000,0,0,0,0,0,37.5576931956342100000000000,126.8333812414780200000000000,20),(197,'서울 마포구 큰우물로 4','시옷빌딩','Y','시옷빌딩',2,18,'60','60','지역난방','외부/남녀혼용',2000,'Y','test','test','test',0,0,'Y',850,9000,0,0,0,0,0,37.5451166879709500000000000,126.9400354532951000000000000,20),(198,'서울 동작구 만양로 5','이응빌딩','Y','이응빌딩',3,17,'40','40','지역냉난방','외부/남녀혼용',2014,'Y','test','test','test',0,0,'Y',200,3000,0,0,0,0,0,37.5053747988217600000000000,126.9465273960235800000000000,20),(199,'서울 강남구 강남대로 476','지읏빌딩','Y','지읏빌딩',1,19,'50','50','지역난방','외부/남녀구분',2013,'Y','test','test','test',0,0,'Y',120,2000,0,0,0,0,0,37.5049085693727800000000000,127.0247908677035300000000000,20),(200,'서울 노원구 화랑로 815','하나빌딩','Y','하나빌딩',3,18,'90','90','중앙난방','내부/남녀구분',2001,'Y','test','test','test',0,0,'Y',320,7000,0,0,0,0,0,37.6433582691137760000000000,127.1088513642567400000000000,20),(202,'서울 강남구 남부순환로 2609','형제빌딩','Y','형제빌딩',14,18,'70','70','개별냉난방','내부/남녀구분',2001,'Y','test','test','test',5,8,'Y',820,9000,0,0,0,12,1200,37.4849612694205160000000000,127.0350959804903500000000000,20),(203,'서울 관악구 관악로 1','아우빌딩','Y','아우빌딩',15,18,'80','80','중앙난방','외부/남녀혼용',2003,'Y','test','test','test',5,6,'N',0,0,120000,120,3000,12,1200,37.4680385090860300000000000,126.9592960330252500000000000,20),(204,'서울 강남구 압구정로 102','마봉빌딩','Y','마음빌딩',2,17,'80','80','개별난방','내부/남녀구분',2001,'Y','test','test','test',0,0,'N',0,0,180000,200,3000,0,0,37.5223673855964460000000000,127.0196789419193700000000000,20),(205,'서울 강서구 강서로 375','모빌빌딩','Y','모빌빌딩',10,21,'80','80','지역난방','외부/남녀혼용',1990,'Y','test','test','test',0,0,'Y',300,3000,0,0,0,0,0,37.5591197241365000000000000,126.8380953570504600000000000,20),(206,'부산 해운대구 APEC로 17','사랑빌딩','Y','사랑빌딩',17,19,'80','80','중앙냉난방','내부/남녀혼용',2004,'Y','test','test','test',0,0,'Y',250,4000,0,0,0,0,0,35.1659340180106950000000000,129.1324095869916600000000000,20);
/*!40000 ALTER TABLE `maemul_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_file`
--

DROP TABLE IF EXISTS `member_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_name` varchar(255) NOT NULL,
  `file_dir` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `content_type` varchar(50) NOT NULL,
  `file_size` int(11) NOT NULL,
  `reg_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `file_type` char(1) NOT NULL,
  `co_member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_member_file_co_member_idx` (`co_member_id`),
  CONSTRAINT `fk_member_file_co_member` FOREIGN KEY (`co_member_id`) REFERENCES `co_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_file`
--

LOCK TABLES `member_file` WRITE;
/*!40000 ALTER TABLE `member_file` DISABLE KEYS */;
INSERT INTO `member_file` VALUES (5,'pic_ca1_img01.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15760390673410.jpg','image/jpeg',92482,'2019-12-11 13:37:47','2019-12-11 13:37:47','B',20),(6,'pic_ca1_img02.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15760390673420.jpg','image/jpeg',43090,'2019-12-11 13:37:47','2019-12-11 13:37:47','O',20),(7,'pic_ca1_img03.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15761309039050.jpg','image/jpeg',36833,'2019-12-12 15:08:23','2019-12-12 15:08:23','B',38),(8,'pic_ca1_img04.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15761309039060.jpg','image/jpeg',36473,'2019-12-12 15:08:23','2019-12-12 15:08:23','O',38),(9,'icon.png','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15761364573380.png','image/png',1861,'2019-12-12 16:40:57','2019-12-12 16:40:57','B',39),(10,'logo.png','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15761364573390.png','image/png',4591,'2019-12-12 16:40:57','2019-12-12 16:40:57','O',39),(13,'pic_ca1_img02.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15773192627460.jpg','image/jpeg',43090,'2019-12-26 09:14:22','2019-12-26 09:14:22','B',41),(14,'pic_ca1_img01.jpg','D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload','/15773192627470.jpg','image/jpeg',92482,'2019-12-26 09:14:22','2019-12-26 09:14:22','O',41);
/*!40000 ALTER TABLE `member_file` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-03 13:34:54
