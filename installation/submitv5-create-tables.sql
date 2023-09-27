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
) ENGINE=InnoDB AUTO_INCREMENT=10029365 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=988 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commonGradeLink` (
  `gid` bigint NOT NULL,
  `user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sid` bigint DEFAULT NULL,
  `location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`gid`,`user`),
  KEY `fk_cgl_submission` (`sid`),
  CONSTRAINT `fk_cgl_submission` FOREIGN KEY (`sid`) REFERENCES `submission` (`sid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_commonGradeLink_commonGrade` FOREIGN KEY (`gid`) REFERENCES `commonGrade` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gradeType` (
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10008966 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission` (
  `sid` bigint NOT NULL AUTO_INCREMENT,
  `pid` bigint NOT NULL,
  `user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UUID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `datestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`),
  KEY `fk_submission_project` (`pid`),
  CONSTRAINT `fk_submission_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10337567 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11799832 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
  KEY `fk_test_dbases` (`docker`),
  CONSTRAINT `fk_test_dbases` FOREIGN KEY (`docker`) REFERENCES `docker_bases` (`docker`) ON UPDATE CASCADE,
  CONSTRAINT `fk_test_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10022826 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10011678 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
