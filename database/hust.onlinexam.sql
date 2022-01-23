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
INSERT INTO `courses` VALUES ('ET4040','Kiến trúc máy tính'),('ET4152','Python Programing'),('ET4230','Mạng máy tính'),('ET4245','AI and Applications');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
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
  `ques_title` text NOT NULL,
  `ans_choice1` text,
  `ans_choice2` text,
  `ans_choice3` text,
  `ans_choice4` text,
  `ans_correct` text,
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
INSERT INTO `exam_question_bank` VALUES ('et4040_ck','et4040_ck_01','Trong kiến trúc xử lý 4 bits. Thanh ghi MBR làm nhiệm vụ gì?','Đọc dữ liệu từ ô nhớ trong bộ nhớ','Ghi dữ liệu ra bộ nhớ','Đọc địa chỉ ô nhớ trong bộ nhớ','Tín hiệu đọc dữ liệu từ một ô nhớ trong bộ nhớ.','Đọc dữ liệu từ ô nhớ trong bộ nhớ'),('et4040_ck','et4040_ck_02','Các loại BUS nào sử dụng trong kiến trúc vào/ra của máy tính số là:','Cả 3 loại BUS: Dữ liệu, địa chỉ, điều khiển','BUS địa chỉ','BUS điều khiển','BUS dữ liệu','Cả 3 loại BUS: Dữ liệu, địa chỉ, điều khiển'),('et4040_ck','et4040_ck_03','Loại BUS nào làm nhiệm vụ điều khiển các tín hiệu đọc/ghi dữ liệu giữa chip vi xử lý và bộ nhớ','BUS điều khiển','BUS địa chỉ','BUS dữ liệu','BUS địa chỉ và BUS điều khiển.','BUS dữ liệu'),('et4040_ck','et4040_ck_04','Loại BUS nào làm nhiệm vụ điều khiển các tín hiệu đọc/ghi dữ liệu giữa chip vi xử lý và bộ nhớ','BUS điều khiển','BUS địa chỉ','BUS dữ liệu','BUS địa chỉ và BUS điều khiển.','BUS dữ liệu'),('et4040_ck','et4040_ck_05','Loại BUS nào làm nhiệm vụ điều khiển các tín hiệu đọc/ghi dữ liệu giữa chip vi xử lý và bộ nhớ','BUS điều khiển','BUS địa chỉ','BUS dữ liệu','BUS địa chỉ và BUS điều khiển.','BUS dữ liệu'),('et4040_ck','et4040_ck_06','Loại BUS nào làm nhiệm vụ điều khiển các tín hiệu đọc/ghi dữ liệu giữa chip vi xử lý và bộ nhớ','BUS điều khiển','BUS địa chỉ','BUS dữ liệu','BUS địa chỉ và BUS điều khiển.','BUS dữ liệu'),('et4040_ck','et4040_ck_07','Loại BUS nào làm nhiệm vụ điều khiển các tín hiệu đọc/ghi dữ liệu giữa chip vi xử lý và bộ nhớ','BUS điều khiển','BUS địa chỉ','BUS dữ liệu','BUS địa chỉ và BUS điều khiển.','BUS dữ liệu'),('et4040_ck','et4040_ck_08','Loại BUS nào làm nhiệm vụ điều khiển các tín hiệu đọc/ghi dữ liệu giữa chip vi xử lý và bộ nhớ','BUS điều khiển','BUS địa chỉ','BUS dữ liệu','BUS địa chỉ và BUS điều khiển.','BUS dữ liệu'),('et4230_gk','et4230_gk_01','Mạng máy tính là gì?','Các máy tính kết nối với nhau qua hệ thống cáp để trao đổi thông tin','Các máy tính trao đổi thông tin với nhau theo tập giao thức mạng','Các máy tính kết nối qua môi trường truyền tin và trao đổi thông tin theo một kiến trúc mạng xác định','Các máy tính kết nối với nhau chia sẻ nguồn thông tin chung','Các máy tính kết nối qua môi trường truyền tin và trao đổi thông tin theo một kiến trúc mạng xác định'),('et4230_gk','et4230_gk_02','Lợi ích của mạng máy tính mang lại là?','Tăng khả năng phát hiện và chống thâm nhập mạng bất hợp pháp','Rút ngắn thời gian trao đổi thông tin','Giúp bảo vệ thông tin tại các nút mạng tốt hơn','Tạo nhiều cơ hội thuận lợi cho công việc, kinh doanh,…','Tạo nhiều cơ hội thuận lợi cho công việc, kinh doanh,…');
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
  `exam_time_start` time NOT NULL,
  `exam_duration` time NOT NULL,
  `total_question` int NOT NULL,
  `mark_right_answers` float NOT NULL,
  `mark_wrong_answers` float NOT NULL,
  `exam_type` varchar(50) DEFAULT NULL,
  `exam_time_created` datetime DEFAULT NULL,
  `courseID` varchar(20) NOT NULL,
  `teaID` varchar(20) NOT NULL,
  `exam_date_start` date DEFAULT NULL,
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
INSERT INTO `online_exams` VALUES ('et4040_ck','Kiểm tra cuối kì 20211','09:00:00','00:40:00',10,1,0,'TN','2021-01-19 03:56:49','et4040','dtvt10','2022-01-10'),('et4230_gk','Kiểm tra giữa kì 20211','14:00:00','00:40:00',10,1,0,'TN','2021-01-19 03:56:51','et4230','dtvt10','2022-01-08');
/*!40000 ALTER TABLE `online_exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_exam`
--

DROP TABLE IF EXISTS `result_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_exam` (
  `take_exam_ID` varchar(20) NOT NULL,
  `result_exam_ID` varchar(20) NOT NULL,
  `quesID` varchar(20) DEFAULT NULL,
  `std_choice` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`result_exam_ID`),
  KEY `take_exam_ID_idx` (`take_exam_ID`),
  KEY `ques_ID_idx` (`quesID`),
  CONSTRAINT `ques_ID` FOREIGN KEY (`quesID`) REFERENCES `exam_question_bank` (`quesID`),
  CONSTRAINT `take_exam_ID` FOREIGN KEY (`take_exam_ID`) REFERENCES `take_exam` (`take_exam_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_exam`
--

LOCK TABLES `result_exam` WRITE;
/*!40000 ALTER TABLE `result_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `result_exam` ENABLE KEYS */;
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
  `std_dateofbirth` date NOT NULL,
  `std_phone` varchar(20) DEFAULT NULL,
  `std_gender` enum('male','female') DEFAULT NULL,
  `std_faculty` text,
  `std_class` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (20172717,'hongnt172717','Nguyễn Thị Ngọc Huyền','20172717','1999-10-10','0383113522','female','Điện tử - Viễn thông','ĐTVT.03-K62'),(20172720,'nghia.vt172720@sis.hust.edu.vn','Vũ Trọng Nghĩa','20172720','1999-09-09','0341413423','male','Điện tử - Viễn thông','ĐTVT.03-K62'),(20172737,'nhung.nth172737@sis.hust.edu.vn','Nguyễn Thị Hồng Nhung','20172737','1999-10-09','0383113523','female','Điện tử - Viễn thông','ĐTVT.08-K62'),(20172915,'viet.nh172915@sis.hust.edu.vn','Nguyễn Hoàng Việt','20172915','1999-12-01','0943555112','male','Điện tử - Viễn thông','ĐTVT.08-K62'),(20181111,'linh.nt181111@sis.hust.edu.vn','Nguyễn Thùy Linh','20181111','2000-08-20','0342115466','female','Điện tử - Viễn thông','ĐTVT.08-K62');
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
  `grade` float NOT NULL,
  `status` enum('0','1') DEFAULT NULL,
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
INSERT INTO `take_exam` VALUES ('et4040_ck_20172737','et4040_ck',20172737,'2021-01-10','09:00:00','00:35:10',8.5,'1'),('et4230_gk_20172737','et4230_gk',20172737,'2021-10-09','09:00:00','00:34:01',9,'1');
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
INSERT INTO `teachers` VALUES ('dtvt10','hue.ttk@hust.edu.vn','Tạ Thị Kim Huệ','123456','0943511223');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'login_accounts'
--

--
-- Dumping routines for database 'login_accounts'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-19  7:17:48
