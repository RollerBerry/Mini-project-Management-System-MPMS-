-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: mpms
-- ------------------------------------------------------
-- Server version	8.0.39
CREATE DATABASE IF NOT EXISTS mpms;
USE mpms;
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
-- Table structure for table `allocation`
--

DROP TABLE IF EXISTS `allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocation` (
  `allocation_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `project_id` int NOT NULL,
  `project_role_id` int NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `effort_rate` decimal(5,2) DEFAULT NULL,
  `description` text,
  `status` bit(1) DEFAULT b'0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_id` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`allocation_id`),
  KEY `fk_allocation_created_by` (`created_by_id`),
  KEY `fk_allocation_member` (`member_id`),
  KEY `fk_allocation_project` (`project_id`),
  KEY `fk_allocation_project_role` (`project_role_id`),
  KEY `fk_allocation_updated_by` (`updated_by_id`),
  CONSTRAINT `fk_allocation_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_allocation_member` FOREIGN KEY (`member_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_allocation_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `fk_allocation_project_role` FOREIGN KEY (`project_role_id`) REFERENCES `setting` (`setting_id`),
  CONSTRAINT `fk_allocation_updated_by` FOREIGN KEY (`updated_by_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation`
--

LOCK TABLES `allocation` WRITE;
/*!40000 ALTER TABLE `allocation` DISABLE KEYS */;
INSERT INTO `allocation` VALUES (1,1,1,1,'2022-01-01','2022-03-01',100.00,'Project manager for website redesign',_binary '','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(2,2,2,2,'2022-01-15','2022-04-15',75.00,'Frontend developer for marketing campaign',_binary '','2024-10-23 09:42:11',2,'2024-10-23 09:42:11',2),(3,3,3,2,'2022-02-01','2022-06-01',100.00,'Lead developer for mobile app',_binary '','2024-10-23 09:42:11',3,'2024-10-23 09:42:11',3),(4,4,4,3,'2022-02-20','2022-05-20',50.00,'Tester for SEO optimization',_binary '','2024-10-23 09:42:11',4,'2024-10-23 09:42:11',4),(5,5,5,1,'2022-03-01','2022-06-01',50.00,'Project manager for new feature implementation',_binary '','2024-10-23 09:42:11',5,'2024-10-23 09:42:11',5),(6,6,6,2,'2022-03-15','2022-07-15',100.00,'Developer for product launch',_binary '','2024-10-23 09:42:11',6,'2024-10-23 09:42:11',6),(7,7,7,3,'2022-04-01','2022-08-01',50.00,'Tester for customer support system',_binary '','2024-10-23 09:42:11',7,'2024-10-23 09:42:11',7),(8,8,8,2,'2022-05-01','2022-09-01',100.00,'Developer for cloud migration',_binary '','2024-10-23 09:42:11',8,'2024-10-23 09:42:11',8),(9,9,9,1,'2022-05-20','2022-09-20',75.00,'Project manager for e-commerce platform',_binary '','2024-10-23 09:42:11',9,'2024-10-23 09:42:11',9),(10,10,10,2,'2022-06-01','2022-10-01',100.00,'Developer for CRM system update',_binary '','2024-10-23 09:42:11',10,'2024-10-23 09:42:11',10);
/*!40000 ALTER TABLE `allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue` (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `type_id` int DEFAULT NULL,
  `req_id` int DEFAULT NULL,
  `assigner_id` int DEFAULT NULL,
  `assignee_id` int DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `status_id` bit(3) DEFAULT b'1',
  `status_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_id` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `fk_issue_assignee` (`assignee_id`),
  KEY `fk_issue_assigner` (`assigner_id`),
  KEY `fk_issue_created_by` (`created_by_id`),
  KEY `fk_issue_req` (`req_id`),
  KEY `fk_issue_updated_by` (`updated_by_id`),
  CONSTRAINT `fk_issue_assignee` FOREIGN KEY (`assignee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_issue_assigner` FOREIGN KEY (`assigner_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_issue_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_issue_req` FOREIGN KEY (`req_id`) REFERENCES `requirement` (`req_id`),
  CONSTRAINT `fk_issue_updated_by` FOREIGN KEY (`updated_by_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES (11,'Fix mobile layout',1,11,1,2,'2022-03-01',_binary '','2024-10-23 09:42:11','Fix mobile layout for website','2024-10-23 09:42:11',1,'2024-10-23 14:42:06',1),(12,'Improve SEO ranking',2,12,2,3,'2022-03-15',_binary '','2024-10-23 09:42:11','Improve SEO ranking','2024-10-23 09:42:11',2,'2024-10-23 14:42:06',2),(13,'Authentication bug',1,13,3,4,'2022-03-20',_binary '','2024-10-23 09:42:11','Fix authentication timeout issue','2024-10-23 09:42:11',3,'2024-10-23 14:42:06',3),(14,'Content mismatch',2,14,4,5,'2022-04-01',_binary '','2024-10-23 09:42:11','Content mismatch with marketing strategy','2024-10-23 09:42:11',4,'2024-10-23 14:42:06',4),(15,'Push notification delay',1,15,5,6,'2022-04-05',_binary '','2024-10-23 09:42:11','Push notifications are delayed','2024-10-23 09:42:11',5,'2024-10-23 14:42:06',5),(16,'Server downtime',1,16,6,7,'2022-04-10',_binary '','2024-10-23 09:42:11','Server downtime during migration','2024-10-23 09:42:11',6,'2024-10-23 14:42:06',6),(17,'Marketing material delay',2,17,7,8,'2022-04-15',_binary '','2024-10-23 09:42:11','Marketing materials delayed','2024-10-23 09:42:11',7,'2024-10-23 14:42:06',7),(18,'Database query performance',1,18,8,9,'2022-04-20',_binary '','2024-10-23 09:42:11','Slow database queries','2024-10-23 09:42:11',8,'2024-10-23 14:42:06',8),(19,'API authentication issue',1,19,9,10,'2022-04-25',_binary '','2024-10-23 09:42:11','Issue with API authentication','2024-10-23 09:42:11',9,'2024-10-23 14:42:06',9),(20,'User onboarding flow bug',1,20,10,1,'2022-05-01',_binary '','2024-10-23 09:42:11','Bug in user onboarding flow','2024-10-23 09:42:11',10,'2024-10-23 14:42:06',10);
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `status` bit(2) DEFAULT b'1',
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_id` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `code` (`code`),
  KEY `fk_project_created_by` (`created_by_id`),
  KEY `fk_project_department` (`dept_id`),
  KEY `fk_project_updated_by` (`updated_by_id`),
  CONSTRAINT `fk_project_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_project_department` FOREIGN KEY (`dept_id`) REFERENCES `setting` (`setting_id`),
  CONSTRAINT `fk_project_updated_by` FOREIGN KEY (`updated_by_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (11,'Website Redesign','P001','2022-01-01','2022-03-01',19,_binary '','Redesign company website','2024-10-23 09:42:11',1,'2024-10-23 09:45:21',1),(12,'Marketing Campaign','P002','2022-01-15','2022-04-15',20,_binary '','Launch marketing campaign','2024-10-23 09:42:11',2,'2024-10-23 09:45:21',2),(13,'Mobile App Development','P003','2022-02-01','2022-06-01',21,_binary '','Develop mobile app','2024-10-23 09:42:11',3,'2024-10-23 09:45:21',3),(14,'SEO Optimization','P004','2022-02-20','2022-05-20',22,_binary '','Optimize website for SEO','2024-10-23 09:42:11',4,'2024-10-23 09:45:21',4),(15,'New Feature Implementation','P005','2022-03-01','2022-06-01',19,_binary '','Implement new features','2024-10-23 09:42:11',5,'2024-10-23 09:45:21',5),(16,'Product Launch','P006','2022-03-15','2022-07-15',20,_binary '','Launch new product','2024-10-23 09:42:11',6,'2024-10-23 09:45:21',6),(17,'Customer Support System','P007','2022-04-01','2022-08-01',21,_binary '','Develop support system','2024-10-23 09:42:11',7,'2024-10-23 09:45:21',7),(18,'Cloud Migration','P008','2022-05-01','2022-09-01',22,_binary '','Migrate systems to the cloud','2024-10-23 09:42:11',8,'2024-10-23 09:45:21',8),(19,'E-commerce Platform','P009','2022-05-20','2022-09-20',19,_binary '','Develop e-commerce platform','2024-10-23 09:42:11',9,'2024-10-23 09:45:21',9),(20,'CRM System Update','P010','2022-06-01','2022-10-01',20,_binary '','Update CRM system for customer management','2024-10-23 09:42:11',10,'2024-10-23 09:45:21',10);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirement` (
  `req_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `owner_id` int DEFAULT NULL,
  `complexity_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_id` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`req_id`),
  KEY `fk_requirement_complexity` (`complexity_id`),
  KEY `fk_requirement_created_by` (`created_by_id`),
  KEY `fk_requirement_owner` (`owner_id`),
  KEY `fk_requirement_status` (`status_id`),
  KEY `fk_requirement_updated_by` (`updated_by_id`),
  CONSTRAINT `fk_requirement_complexity` FOREIGN KEY (`complexity_id`) REFERENCES `setting` (`setting_id`),
  CONSTRAINT `fk_requirement_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_requirement_owner` FOREIGN KEY (`owner_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_requirement_status` FOREIGN KEY (`status_id`) REFERENCES `setting` (`setting_id`),
  CONSTRAINT `fk_requirement_updated_by` FOREIGN KEY (`updated_by_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
INSERT INTO `requirement` VALUES (11,'Responsive Design',1,1,1,'Create responsive design for website','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(12,'SEO Keyword Research',2,2,2,'Research SEO keywords for campaign','2024-10-23 09:42:11',2,'2024-10-23 09:42:11',2),(13,'User Authentication',3,1,3,'Implement user authentication','2024-10-23 09:42:11',3,'2024-10-23 09:42:11',3),(14,'Content Strategy',4,2,4,'Develop content strategy for marketing','2024-10-23 09:42:11',4,'2024-10-23 09:42:11',4),(15,'Push Notifications',5,3,1,'Add push notifications to mobile app','2024-10-23 09:42:11',5,'2024-10-23 09:42:11',5),(16,'Server Migration',6,3,2,'Migrate server to cloud','2024-10-23 09:42:11',6,'2024-10-23 09:42:11',6),(17,'Marketing Material Creation',7,2,3,'Create marketing materials for campaign','2024-10-23 09:42:11',7,'2024-10-23 09:42:11',7),(18,'Database Optimization',8,3,4,'Optimize database for performance','2024-10-23 09:42:11',8,'2024-10-23 09:42:11',8),(19,'API Development',9,3,1,'Develop APIs for e-commerce platform','2024-10-23 09:42:11',9,'2024-10-23 09:42:11',9),(20,'User Onboarding',10,2,2,'Implement user onboarding flow','2024-10-23 09:42:11',10,'2024-10-23 09:42:11',10);
/*!40000 ALTER TABLE `requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` varchar(50) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_id` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `fk_setting_created_by` (`created_by_id`),
  KEY `fk_setting_updated_by` (`updated_by_id`),
  CONSTRAINT `fk_setting_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_setting_updated_by` FOREIGN KEY (`updated_by_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (11,'Project Manager','Project Role',1,1,_binary '','Role in projects','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(12,'Developer','Project Role',1,2,_binary '','Role in projects','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(13,'Tester','Project Role',1,3,_binary '','Role in projects','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(14,'Designer','Project Role',1,4,_binary '','Role in projects','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(15,'Admin','User Role',2,1,_binary '','User role','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(16,'Staff','User Role',2,2,_binary '','User role','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(17,'Team Leader','User Role',2,3,_binary '','User role','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(18,'Project Leader','User Role',2,4,_binary '','User role','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(19,'Development','Department',3,1,_binary '','Department','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(20,'Marketing','Department',3,2,_binary '','Department','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(21,'Finance','Department',3,3,_binary '','Department','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(22,'HR','Department',3,4,_binary '','Department','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(23,'High','Complexity Level',4,1,_binary '','Complexity level','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(24,'Medium','Complexity Level',4,2,_binary '','Complexity level','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(25,'Low','Complexity Level',4,3,_binary '','Complexity level','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(26,'Pending','Requirement Status',5,1,_binary '','Requirement status','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(27,'In-progress','Requirement Status',5,2,_binary '','Requirement status','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(28,'Closed','Requirement Status',5,3,_binary '','Requirement status','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1),(29,'Cancelled','Requirement Status',5,4,_binary '','Requirement status','2024-10-23 09:42:11',1,'2024-10-23 09:42:11',1);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `note` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by_id` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_user_role` (`role_id`),
  KEY `fk_user_department` (`dept_id`),
  KEY `fk_user_created_by` (`created_by_id`),
  KEY `fk_user_updated_by` (`updated_by_id`),
  CONSTRAINT `fk_user_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_user_department` FOREIGN KEY (`dept_id`) REFERENCES `setting` (`setting_id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `setting` (`setting_id`),
  CONSTRAINT `fk_user_updated_by` FOREIGN KEY (`updated_by_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (13,'John Doe','jdoe','jdoe@example.com','123',15,19,'2022-01-01',_binary '','Admin user','2024-10-23 09:42:11',1,'2024-10-23 09:53:37',1),(14,'Jane Smith','jsmith','jsmith@example.com','password123',16,20,'2022-01-15',_binary '','Marketing specialist','2024-10-23 09:42:11',1,'2024-10-23 09:49:10',1),(15,'Michael Johnson','mjohnson','mjohnson@example.com','password123',16,21,'2022-02-01',_binary '','Developer','2024-10-23 09:42:11',1,'2024-10-23 09:49:10',1),(16,'Emily Davis','edavis','edavis@example.com','password123',17,22,'2022-02-10',_binary '','Team Leader','2024-10-23 09:42:11',1,'2024-10-23 09:49:10',1),(17,'David Wilson','dwilson','dwilson@example.com','password123',17,19,'2022-02-20',_binary '','Admin user','2024-10-23 09:42:11',1,'2024-10-23 09:49:10',1),(18,'Sarah Brown','sbrown','sbrown@example.com','password123',18,20,'2022-03-01',_binary '','Marketing manager','2024-10-23 09:42:11',1,'2024-10-23 09:49:10',1),(19,'Chris Lee','clee','clee@example.com','password123',18,21,'2022-03-10',_binary '','Developer','2024-10-23 09:42:11',1,'2024-10-23 09:49:10',1),(20,'Olivia Martin','omartin','omartin@example.com','password123',16,22,'2022-03-15',_binary '','Team Leader','2024-10-23 09:42:11',1,'2024-10-23 09:49:10',1),(21,'James White','jwhite','jwhite@example.com','password123',17,19,'2022-04-01',_binary '','Finance manager','2024-10-23 09:42:11',1,'2024-10-24 22:20:11',1),(22,'Sophia Harris','sharris','sharris@example.com','password123',18,20,'2022-04-10',_binary '','Finance specialist','2024-10-23 09:42:11',1,'2024-10-24 22:20:11',1),(23,'aa','aa','ac@gmail.com','aa',NULL,NULL,NULL,NULL,NULL,'2024-10-24 08:17:20',NULL,'2024-10-24 08:17:20',NULL),(24,'bb','bb','bb@gmail.com','3b64db95cb55c763391c707108489ae18b4112d783300de38e033b4c98c3deaf',NULL,NULL,NULL,NULL,NULL,'2024-10-24 08:44:52',NULL,'2024-10-24 08:44:52',NULL),(29,'cc','ccc','cc@gmail.com','355b1bbfc96725cdce8f4a2708fda310a80e6d13315aec4e5eed2a75fe8032ce',16,19,NULL,_binary '\0',NULL,'2024-10-24 14:26:15',NULL,'2024-10-24 22:20:23',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-25  5:24:30
