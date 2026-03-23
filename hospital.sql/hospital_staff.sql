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
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `specialization` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (10000001,'Raj','Sharma','Doctor','Cardiology'),(10000002,'Amit','Mehta','Doctor','Orthopedics'),(10000003,'Asha','Verma','Nurse',NULL),(10000004,'Riya','Singh','Nurse',NULL),(10000005,'Kavita','Gupta','Nurse',NULL),(10000006,'Nisha','Patel','Nurse',NULL),(10000007,'Ramesh','Yadav','Ward Boy',NULL),(10000008,'Suresh','Kumar','Ward Boy',NULL),(10000009,'Mahesh','Das','Ward Boy',NULL),(10000010,'Dinesh','Roy','Ward Boy',NULL),(10000011,'Pooja','Malik','Receptionist',NULL),(10000012,'Anjali','Saxena','Receptionist',NULL),(10000013,'Sanjay','Kapoor','Doctor','Dermatology'),(10000014,'Vikas','Rana','Doctor','Neurology'),(10000015,'Pooja','Bansal','Doctor','Pediatrics'),(10000016,'Nitin','Arora','Doctor','General Medicine'),(10000017,'Sneha','Iyer','Doctor','Gynecology'),(10000018,'Meena','Joshi','Nurse',NULL),(10000019,'Anu','Chopra','Nurse',NULL),(10000020,'Rekha','Sethi','Nurse',NULL),(10000021,'Divya','Nair','Nurse',NULL),(10000022,'Komal','Gill','Nurse',NULL),(10000023,'Deepak','Pal','Ward Boy',NULL),(10000024,'Sunil','Chauhan','Ward Boy',NULL),(10000025,'Raju','Mishra','Ward Boy',NULL),(10000026,'Shalini','Verma','Receptionist',NULL),(10000027,'Tanya','Khanna','Receptionist',NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
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
