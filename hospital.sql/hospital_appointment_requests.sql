-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `appointment_requests`
--

DROP TABLE IF EXISTS `appointment_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_requests` (
  `request_id` varchar(14) NOT NULL,
  `patient_name` varchar(30) NOT NULL,
  `patient_age` tinyint NOT NULL,
  `patient_contact` varchar(10) NOT NULL,
  `staff_id` int NOT NULL,
  `requested_date` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'Pending',
  `time` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  UNIQUE KEY `patient_contact` (`patient_contact`),
  KEY `fk_staff_request` (`staff_id`),
  CONSTRAINT `fk_staff_request` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_requests`
--

LOCK TABLES `appointment_requests` WRITE;
/*!40000 ALTER TABLE `appointment_requests` DISABLE KEYS */;
INSERT INTO `appointment_requests` VALUES ('22032610150001','Rahul Verma',25,'9000000001',10000001,'25-03-2026','Pending','10:30 AM'),('22032610150002','Ankit Sharma',32,'9000000002',10000002,'25-03-2026','Pending','11:00 AM'),('22032610150003','Priya Singh',28,'9000000003',10000001,'26-03-2026','Approved','12:00 PM'),('22032610150004','Neha Gupta',30,'9000000004',10000002,'26-03-2026','Rejected','01:00 PM'),('22032610150005','Amit Yadav',40,'9000000005',10000001,'27-03-2026','Pending','02:00 PM'),('22032610150006','Karan Mehta',35,'9000000006',10000002,'27-03-2026','Approved','03:00 PM'),('22032610150007','Simran Kaur',22,'9000000007',10000001,'28-03-2026','Pending','04:00 PM'),('22032610150008','Rohit Jain',29,'9000000008',10000002,'28-03-2026','Rejected','05:00 PM'),('220326200412','Aryan Singh',19,'987654333',10000001,'2026-03-23','Approved','11:00 AM'),('220326203025','Siddharth',22,'7894455611',10000002,'2026-03-31','Rejected','12:00 PM'),('230326131021','Raj',24,'7777888999',10000001,'2026-03-24','Pending','06:00 PM'),('230326134144','Deepika',29,'8887775646',10000002,'2026-03-24','Pending','09:00 PM');
/*!40000 ALTER TABLE `appointment_requests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-23 19:29:34
