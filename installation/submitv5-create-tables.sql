-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: submit5
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

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
-- Current Database: `submit5`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `submit5` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `submit5`;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `cid` bigint NOT NULL AUTO_INCREMENT,
  `pid` bigint NOT NULL,
  `user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentby` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(8192) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint(1) DEFAULT '1',
  `datestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`),
  KEY `fk_comments_project` (`pid`),
  CONSTRAINT `fk_comments_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10028291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commonGrade`
--

DROP TABLE IF EXISTS `commonGrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commonGrade` (
  `gid` bigint NOT NULL AUTO_INCREMENT,
  `pid` bigint NOT NULL,
  `category` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` float DEFAULT '0',
  PRIMARY KEY (`gid`),
  KEY `FK_commonGrade_project` (`pid`),
  CONSTRAINT `FK_commonGrade_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=729 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commonGrade`
--

LOCK TABLES `commonGrade` WRITE;
/*!40000 ALTER TABLE `commonGrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `commonGrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commonGradeFocus`
--

DROP TABLE IF EXISTS `commonGradeFocus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commonGradeFocus` (
  `instructor` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `student` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid` bigint DEFAULT NULL,
  `pid` bigint DEFAULT NULL,
  PRIMARY KEY (`instructor`),
  KEY `FK_cfg_project` (`pid`),
  KEY `FK_cfg_submission` (`sid`),
  CONSTRAINT `FK_cfg_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cfg_submission` FOREIGN KEY (`sid`) REFERENCES `submission` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commonGradeFocus`
--

LOCK TABLES `commonGradeFocus` WRITE;
/*!40000 ALTER TABLE `commonGradeFocus` DISABLE KEYS */;
/*!40000 ALTER TABLE `commonGradeFocus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commonGradeLink`
--

DROP TABLE IF EXISTS `commonGradeLink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commonGradeLink` (
  `gid` bigint NOT NULL,
  `user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sid` bigint DEFAULT NULL,
  `location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`gid`,`user`),
  CONSTRAINT `FK_commonGradeLink_commonGrade` FOREIGN KEY (`gid`) REFERENCES `commonGrade` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commonGradeLink`
--

LOCK TABLES `commonGradeLink` WRITE;
/*!40000 ALTER TABLE `commonGradeLink` DISABLE KEYS */;
/*!40000 ALTER TABLE `commonGradeLink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commonGradeSettings`
--

DROP TABLE IF EXISTS `commonGradeSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commonGradeSettings` (
  `pid` bigint NOT NULL,
  `visible` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `FK_commonGradeSettings_project` (`pid`),
  CONSTRAINT `FK_commonGradeSettings_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commonGradeSettings`
--

LOCK TABLES `commonGradeSettings` WRITE;
/*!40000 ALTER TABLE `commonGradeSettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `commonGradeSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docker_bases`
--

DROP TABLE IF EXISTS `docker_bases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docker_bases` (
  `docker` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `docker_last_seen` datetime DEFAULT CURRENT_TIMESTAMP,
  `docker_expires` datetime DEFAULT '2099-01-01 23:59:59',
  `docker_desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`docker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docker_bases`
--

LOCK TABLES `docker_bases` WRITE;
/*!40000 ALTER TABLE `docker_bases` DISABLE KEYS */;
INSERT INTO `docker_bases` VALUES ('cs-base','2023-07-29 14:41:51','2099-01-01 23:59:59','Base CS/Cyber Grader Image');
/*!40000 ALTER TABLE `docker_bases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `pid` bigint NOT NULL,
  `user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade` float(5,2) DEFAULT '0.00',
  PRIMARY KEY (`pid`,`user`),
  CONSTRAINT `fk_grade_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradeSetup`
--

DROP TABLE IF EXISTS `gradeSetup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gradeSetup` (
  `year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `block` int NOT NULL DEFAULT '1',
  `course` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` float(5,2) NOT NULL,
  PRIMARY KEY (`year`,`semester`,`block`,`course`,`period`,`type`),
  KEY `fk_gradeSetup_gradeType` (`type`),
  CONSTRAINT `fk_gradeSetup_gradeType` FOREIGN KEY (`type`) REFERENCES `gradeType` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradeSetup`
--

LOCK TABLES `gradeSetup` WRITE;
/*!40000 ALTER TABLE `gradeSetup` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradeSetup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradeType`
--

DROP TABLE IF EXISTS `gradeType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gradeType` (
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradeType`
--

LOCK TABLES `gradeType` WRITE;
/*!40000 ALTER TABLE `gradeType` DISABLE KEYS */;
INSERT INTO `gradeType` VALUES ('12wk'),('12wk-practicum'),('6wk'),('6wk-practicum'),('capstone'),('final'),('final-practicum'),('homework'),('instructor-option1'),('instructor-option2'),('instructor-option3'),('instructor-option4'),('instructor-option5'),('lab'),('paper'),('participation'),('practicum'),('project'),('project1'),('project2'),('project3'),('project4'),('quiz');
/*!40000 ALTER TABLE `gradeType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `pid` bigint NOT NULL AUTO_INCREMENT,
  `year` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `block` int NOT NULL DEFAULT '1',
  `course` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `open` datetime DEFAULT CURRENT_TIMESTAMP,
  `close` datetime NOT NULL DEFAULT '2050-01-01 23:59:59',
  `realclose` datetime NOT NULL DEFAULT '2050-01-01 23:59:59',
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'lab',
  `title` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `link` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `maxattempts` int unsigned NOT NULL DEFAULT '99',
  `waitperiod` int unsigned NOT NULL DEFAULT '0',
  `compile_target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `run_target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'run',
  `analysis_target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `makefile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'makefile',
  `run` tinyint(1) DEFAULT '1',
  `showgrades` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `uk_project` (`year`,`semester`,`block`,`course`,`project`),
  KEY `fk_project_gradeType` (`type`),
  CONSTRAINT `fk_project_gradeType` FOREIGN KEY (`type`) REFERENCES `gradeType` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10008624 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectAuthMoreAttempts`
--

DROP TABLE IF EXISTS `projectAuthMoreAttempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectAuthMoreAttempts` (
  `pid` bigint NOT NULL,
  `user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`pid`,`user`),
  CONSTRAINT `fk_projectAuthMoreAttempts_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectAuthMoreAttempts`
--

LOCK TABLES `projectAuthMoreAttempts` WRITE;
/*!40000 ALTER TABLE `projectAuthMoreAttempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectAuthMoreAttempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectRequiredFiles`
--

DROP TABLE IF EXISTS `projectRequiredFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectRequiredFiles` (
  `pid` bigint NOT NULL,
  `filename` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`pid`,`filename`),
  CONSTRAINT `fk_projectRequiredFiles_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectRequiredFiles`
--

LOCK TABLES `projectRequiredFiles` WRITE;
/*!40000 ALTER TABLE `projectRequiredFiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectRequiredFiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission` (
  `sid` bigint NOT NULL AUTO_INCREMENT,
  `pid` bigint NOT NULL,
  `user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UUID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `gitlab` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `datestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`),
  KEY `fk_submission_project` (`pid`),
  CONSTRAINT `fk_submission_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10326180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissionFiles`
--

DROP TABLE IF EXISTS `submissionFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissionFiles` (
  `sfid` bigint NOT NULL AUTO_INCREMENT,
  `sid` bigint NOT NULL,
  `filename` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `size` int unsigned DEFAULT NULL,
  PRIMARY KEY (`sfid`),
  UNIQUE KEY `uk_submissionFiles` (`sid`,`filename`),
  CONSTRAINT `fk_submissionFiles_submission` FOREIGN KEY (`sid`) REFERENCES `submission` (`sid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11773331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissionFiles`
--

LOCK TABLES `submissionFiles` WRITE;
/*!40000 ALTER TABLE `submissionFiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissionFiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `tid` bigint NOT NULL AUTO_INCREMENT,
  `pid` bigint NOT NULL,
  `rulename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `points` float DEFAULT '1',
  `compile_target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `run_target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'run',
  `analysis_target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `makefile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Output',
  `sourcefile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `stdin` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `outvalue` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cond` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'is exactly',
  `infinite` int unsigned NOT NULL DEFAULT '20',
  `view_open` datetime DEFAULT CURRENT_TIMESTAMP,
  `view_close` datetime DEFAULT '2050-01-01 23:59:59',
  `hide` tinyint(1) DEFAULT '0',
  `run` tinyint(1) DEFAULT '1',
  `docker` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'cs-base',
  PRIMARY KEY (`tid`),
  UNIQUE KEY `uk_test` (`pid`,`rulename`),
  CONSTRAINT `fk_test_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10021254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testAnalysisResults`
--

DROP TABLE IF EXISTS `testAnalysisResults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testAnalysisResults` (
  `tid` bigint NOT NULL,
  `sid` bigint NOT NULL,
  `returnval` int DEFAULT NULL,
  `stime` float DEFAULT NULL,
  `stderr` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `stdout` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`tid`,`sid`),
  KEY `fk_testAnalysisResults_submission` (`sid`),
  CONSTRAINT `fk_testAnalysisResults_submission` FOREIGN KEY (`sid`) REFERENCES `submission` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_testAnalysisResults_test` FOREIGN KEY (`tid`) REFERENCES `test` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testAnalysisResults`
--

LOCK TABLES `testAnalysisResults` WRITE;
/*!40000 ALTER TABLE `testAnalysisResults` DISABLE KEYS */;
/*!40000 ALTER TABLE `testAnalysisResults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testCompileResults`
--

DROP TABLE IF EXISTS `testCompileResults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testCompileResults` (
  `tid` bigint NOT NULL,
  `sid` bigint NOT NULL,
  `returnval` int DEFAULT NULL,
  `stime` float DEFAULT NULL,
  `stderr` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `stdout` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`tid`,`sid`),
  KEY `fk_testCompileResults_submission` (`sid`),
  CONSTRAINT `fk_testCompileResults_submission` FOREIGN KEY (`sid`) REFERENCES `submission` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_testCompileResults_test` FOREIGN KEY (`tid`) REFERENCES `test` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testCompileResults`
--

LOCK TABLES `testCompileResults` WRITE;
/*!40000 ALTER TABLE `testCompileResults` DISABLE KEYS */;
/*!40000 ALTER TABLE `testCompileResults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testFiles`
--

DROP TABLE IF EXISTS `testFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testFiles` (
  `fid` bigint NOT NULL AUTO_INCREMENT,
  `pid` bigint NOT NULL,
  `filename` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `storage` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible_always` tinyint(1) DEFAULT '1',
  `visible_after_close` tinyint(1) DEFAULT '0',
  `visible_after_realclose` tinyint(1) DEFAULT '1',
  `has_priority` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `uk_testFiles` (`pid`,`filename`),
  CONSTRAINT `fk_testFiles_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10010841 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testFiles`
--

LOCK TABLES `testFiles` WRITE;
/*!40000 ALTER TABLE `testFiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `testFiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testInProgress`
--

DROP TABLE IF EXISTS `testInProgress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testInProgress` (
  `sid` bigint NOT NULL,
  `tid` bigint NOT NULL,
  `claimed` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(96) DEFAULT NULL,
  `process` varchar(96) DEFAULT NULL,
  `lint` mediumtext,
  `course` varchar(45) DEFAULT NULL,
  `rulename` varchar(255) DEFAULT NULL,
  `project` varchar(100) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sid`,`tid`),
  CONSTRAINT `fs_testInProgress_submision` FOREIGN KEY (`sid`) REFERENCES `submission` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testInProgress`
--

LOCK TABLES `testInProgress` WRITE;
/*!40000 ALTER TABLE `testInProgress` DISABLE KEYS */;
/*!40000 ALTER TABLE `testInProgress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testRunResults`
--

DROP TABLE IF EXISTS `testRunResults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testRunResults` (
  `tid` bigint NOT NULL,
  `sid` bigint NOT NULL,
  `returnval` int DEFAULT NULL,
  `stime` float DEFAULT NULL,
  `stderr` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `stdout` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sourcefile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pass` tinyint(1) DEFAULT '0',
  `diff` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`tid`,`sid`),
  KEY `fk_testRunResults_submission` (`sid`),
  CONSTRAINT `fk_testRunResults_submission` FOREIGN KEY (`sid`) REFERENCES `submission` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_testRunResults_test` FOREIGN KEY (`tid`) REFERENCES `test` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testRunResults`
--

LOCK TABLES `testRunResults` WRITE;
/*!40000 ALTER TABLE `testRunResults` DISABLE KEYS */;
/*!40000 ALTER TABLE `testRunResults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'submit5'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-27 13:46:11
