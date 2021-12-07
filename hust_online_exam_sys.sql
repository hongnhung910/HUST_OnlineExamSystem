-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: login_accounts
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'meoluoi910@gmail.com','1234','Hong Nhung'),(2,'hongnhung910@gmail.com','1234','Nhung');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `courseID` varchar(20) NOT NULL,
  `courseName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('ET4152','Python Programing'),('ET4245','AI and Applications');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `et4020`
--

DROP TABLE IF EXISTS `et4020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `et4020` (
  `courseID` varchar(20) NOT NULL,
  `quesID` int NOT NULL AUTO_INCREMENT,
  `ques_title` varchar(45) NOT NULL,
  `ans_choice1` varchar(45) NOT NULL,
  `ans_choice2` varchar(45) DEFAULT NULL,
  `ans_correct` varchar(45) NOT NULL,
  PRIMARY KEY (`quesID`),
  UNIQUE KEY `quesID_UNIQUE` (`quesID`),
  KEY `courseID_idx` (`courseID`),
  CONSTRAINT `et4020` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `et4020`
--

LOCK TABLES `et4020` WRITE;
/*!40000 ALTER TABLE `et4020` DISABLE KEYS */;
/*!40000 ALTER TABLE `et4020` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `et4152`
--

DROP TABLE IF EXISTS `et4152`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `et4152` (
  `courseID` varchar(20) NOT NULL,
  `quesID` int NOT NULL,
  `ques_title` text NOT NULL,
  `ans_choice1` varchar(100) NOT NULL,
  `ans_choice2` varchar(100) DEFAULT NULL,
  `ans_correct` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`quesID`),
  KEY `et4152_idx` (`courseID`),
  CONSTRAINT `et4152` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `et4152`
--

LOCK TABLES `et4152` WRITE;
/*!40000 ALTER TABLE `et4152` DISABLE KEYS */;
INSERT INTO `et4152` VALUES ('',1,'This is a system of programs and data structures that approximates the operation of the human brain.','Decision support system','Neural network',NULL);
/*!40000 ALTER TABLE `et4152` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_question_bank`
--

DROP TABLE IF EXISTS `exam_question_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_question_bank` (
  `examID` varchar(20) NOT NULL,
  `quesID` varchar(20) NOT NULL,
  `question_title` text NOT NULL,
  `answer_options` enum('a','b','c','d') NOT NULL,
  `correct_answer` char(1) NOT NULL,
  PRIMARY KEY (`quesID`),
  KEY `examID_idx` (`examID`),
  CONSTRAINT `quesbank_examID` FOREIGN KEY (`examID`) REFERENCES `online_exams` (`examID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question_bank`
--

LOCK TABLES `exam_question_bank` WRITE;
/*!40000 ALTER TABLE `exam_question_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_question_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_exams`
--

DROP TABLE IF EXISTS `online_exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_exams` (
  `examID` varchar(20) NOT NULL,
  `exam_name` varchar(100) NOT NULL,
  `exam_time_start` datetime NOT NULL,
  `exam_duration` datetime NOT NULL,
  `total_question` int NOT NULL,
  `mark_right_answers` float NOT NULL,
  `mark_wrong_answers` float NOT NULL,
  `exam_type` varchar(50) DEFAULT NULL,
  `exam_time_created` datetime DEFAULT NULL,
  `courseID` varchar(20) NOT NULL,
  `teaID` varchar(20) NOT NULL,
  PRIMARY KEY (`examID`),
  UNIQUE KEY `examID_UNIQUE` (`examID`),
  KEY `courseID_idx` (`courseID`),
  KEY `teaID_idx` (`teaID`),
  CONSTRAINT `courseID` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`),
  CONSTRAINT `teaID` FOREIGN KEY (`teaID`) REFERENCES `teachers` (`teaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_exams`
--

LOCK TABLES `online_exams` WRITE;
/*!40000 ALTER TABLE `online_exams` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `stdID` int NOT NULL,
  `std_email` varchar(50) NOT NULL,
  `std_name` varchar(50) NOT NULL,
  `std_password` varchar(50) NOT NULL,
  `std_dateofbirth` datetime NOT NULL,
  `std_gender` varchar(10) NOT NULL,
  `std_phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`stdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (20172717,'hongnt172717','Nguyen Thi Hong 20172717','20172717','0000-00-00 00:00:00','',NULL),(20172720,'nghia.vt172720@sis.hust.edu.vn','Vu Trong Nghia 20172720','20172720','0000-00-00 00:00:00','',NULL),(20172737,'nhung.nth172737@sis.hust.edu.vn','Nguyen Thi Hong Nhung 20172737','20172737','0000-00-00 00:00:00','',NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `take_exam`
--

DROP TABLE IF EXISTS `take_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `take_exam` (
  `take_exam_ID` varchar(20) NOT NULL,
  `examID` varchar(20) NOT NULL,
  `stdID` int NOT NULL,
  `startDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `grade` float NOT NULL,
  PRIMARY KEY (`take_exam_ID`),
  KEY `stdID_idx` (`stdID`),
  KEY `examID_idx` (`examID`),
  CONSTRAINT `examID` FOREIGN KEY (`examID`) REFERENCES `online_exams` (`examID`),
  CONSTRAINT `stdID` FOREIGN KEY (`stdID`) REFERENCES `students` (`stdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `take_exam`
--

LOCK TABLES `take_exam` WRITE;
/*!40000 ALTER TABLE `take_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `take_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teaID` varchar(100) NOT NULL,
  `teaEmail` varchar(100) NOT NULL,
  `teaName` varchar(100) NOT NULL,
  `teaPassword` varchar(50) NOT NULL,
  `teaPhone` varchar(20) NOT NULL,
  PRIMARY KEY (`teaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 11:14:45
