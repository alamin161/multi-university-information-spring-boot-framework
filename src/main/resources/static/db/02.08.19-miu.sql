-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.21-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for multiuniversityinformation
CREATE DATABASE IF NOT EXISTS `multiuniversityinformation` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `multiuniversityinformation`;

-- Dumping structure for table multiuniversityinformation.achievement
CREATE TABLE IF NOT EXISTS `achievement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `achievementTitle` varchar(256) NOT NULL,
  `fkVarsity_type` int(11) NOT NULL,
  `fkVarsity_name` int(11) NOT NULL,
  `competitionPosition` varchar(20) NOT NULL,
  `competitionTitle` varchar(256) NOT NULL,
  `competitionPlace` varchar(256) NOT NULL,
  `competitionDate` date DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_achievementCreatedBy` (`createdBy`),
  KEY `FK_achievementVarsity_type` (`fkVarsity_type`),
  KEY `FK_achievementVarsity_name` (`fkVarsity_name`),
  CONSTRAINT `FK_achievementCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_achievementVarsity_name` FOREIGN KEY (`fkVarsity_name`) REFERENCES `university` (`id`),
  CONSTRAINT `FK_achievementVarsity_type` FOREIGN KEY (`fkVarsity_type`) REFERENCES `university_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.achievement: ~2 rows (approximately)
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
INSERT INTO `achievement` (`id`, `achievementTitle`, `fkVarsity_type`, `fkVarsity_name`, `competitionPosition`, `competitionTitle`, `competitionPlace`, `competitionDate`, `createdBy`, `createdTime`) VALUES
	(1, '', 1, 4, '', '', '', NULL, NULL, '2019-07-22 12:50:46'),
	(2, 'ergert', 4, 7, '2nd', 'eqr345243', 'erw45t54g', NULL, NULL, '2019-07-22 12:52:02');
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.department_type
CREATE TABLE IF NOT EXISTS `department_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(254) NOT NULL,
  `departmentNickname` varchar(60) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_department_typeCreatedBy` (`createdBy`),
  CONSTRAINT `FK_department_typeCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.department_type: ~4 rows (approximately)
/*!40000 ALTER TABLE `department_type` DISABLE KEYS */;
INSERT INTO `department_type` (`id`, `departmentName`, `departmentNickname`, `createdBy`, `createdTime`) VALUES
	(6, 'Computer Science and Engineering', 'CSE', NULL, '2019-07-30 10:01:11'),
	(7, 'Electrical 3', 'EEE', NULL, '2019-07-30 09:42:46'),
	(8, 'Software Engineering', 'SWE', NULL, '2019-07-30 10:13:27');
/*!40000 ALTER TABLE `department_type` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.engineering_university
CREATE TABLE IF NOT EXISTS `engineering_university` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `en_varsity_name` varchar(256) NOT NULL,
  `en_varsity_nickname` varchar(20) NOT NULL,
  `campus` varchar(256) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_engineering_universityCreatedBy` (`createdBy`),
  CONSTRAINT `FK_engineering_universityCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.engineering_university: ~0 rows (approximately)
/*!40000 ALTER TABLE `engineering_university` DISABLE KEYS */;
INSERT INTO `engineering_university` (`id`, `en_varsity_name`, `en_varsity_nickname`, `campus`, `createdBy`, `createdTime`) VALUES
	(1, 'Bangladesh University of Engineering and Technology', 'BUET', 'BUET Central Road, Dhaka 1000', NULL, '2019-02-28 11:47:00');
/*!40000 ALTER TABLE `engineering_university` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.en_achievement
CREATE TABLE IF NOT EXISTS `en_achievement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `achievementTitle` varchar(256) NOT NULL,
  `competitionPosition` varchar(20) NOT NULL,
  `competitionTitle` varchar(256) NOT NULL,
  `competitionPlace` varchar(256) NOT NULL,
  `competitionDate` date DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_en_achievementCreatedBy` (`createdBy`),
  CONSTRAINT `FK_en_achievementCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.en_achievement: ~0 rows (approximately)
/*!40000 ALTER TABLE `en_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `en_achievement` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.en_research
CREATE TABLE IF NOT EXISTS `en_research` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_name` varchar(256) NOT NULL,
  `fkEngineering_varsity` int(11) NOT NULL,
  `teacherName` varchar(150) NOT NULL,
  `department_name` varchar(256) NOT NULL,
  `research_published` date DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_en_researchCreatedBy` (`createdBy`),
  KEY `FK_en_researchEngineering_varsity` (`fkEngineering_varsity`),
  CONSTRAINT `FK_en_researchCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_en_researchEngineering_varsity` FOREIGN KEY (`fkEngineering_varsity`) REFERENCES `engineering_university` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.en_research: ~0 rows (approximately)
/*!40000 ALTER TABLE `en_research` DISABLE KEYS */;
/*!40000 ALTER TABLE `en_research` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.private_medical_college
CREATE TABLE IF NOT EXISTS `private_medical_college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `college_name` varchar(256) NOT NULL,
  `college_nickname` varchar(20) NOT NULL,
  `campus` varchar(256) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_private_medical_collegeCreatedBy` (`createdBy`),
  CONSTRAINT `FK_private_medical_collegeCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.private_medical_college: ~0 rows (approximately)
/*!40000 ALTER TABLE `private_medical_college` DISABLE KEYS */;
INSERT INTO `private_medical_college` (`id`, `college_name`, `college_nickname`, `campus`, `createdBy`, `createdTime`) VALUES
	(1, 'Ibn Sina Medical College', 'ISMC', '1/1-B, Dhaka 1216', NULL, '2019-02-28 11:53:13');
/*!40000 ALTER TABLE `private_medical_college` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.private_university
CREATE TABLE IF NOT EXISTS `private_university` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_varsity_name` varchar(256) NOT NULL,
  `pr_varsity_nickname` varchar(20) NOT NULL,
  `campus` varchar(256) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_private_universityCreatedBy` (`createdBy`),
  CONSTRAINT `FK_private_universityCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.private_university: ~3 rows (approximately)
/*!40000 ALTER TABLE `private_university` DISABLE KEYS */;
INSERT INTO `private_university` (`id`, `pr_varsity_name`, `pr_varsity_nickname`, `campus`, `createdBy`, `createdTime`) VALUES
	(1, 'Daffodil International University', 'DIU', '4/2, Sobhanbag, Mirpur Rd, Dhaka 1207', NULL, '2019-02-28 11:54:15'),
	(2, 'Dhaka International Univarsity', 'DIU', 'Panthopath', NULL, '2019-05-02 10:35:49'),
	(6, 'Daffodil Myself', 'Diume ko', 'Dhaka,Mirpur', NULL, '2019-07-28 12:08:32');
/*!40000 ALTER TABLE `private_university` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.pr_achievement
CREATE TABLE IF NOT EXISTS `pr_achievement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `achievementTitle` varchar(256) NOT NULL,
  `competitionPosition` varchar(20) NOT NULL,
  `competitionTitle` varchar(256) NOT NULL,
  `competitionPlace` varchar(256) NOT NULL,
  `competitionDate` date DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_pr_achievementCreatedBy` (`createdBy`),
  CONSTRAINT `FK_pr_achievementCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.pr_achievement: ~0 rows (approximately)
/*!40000 ALTER TABLE `pr_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `pr_achievement` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.pr_me_achievement
CREATE TABLE IF NOT EXISTS `pr_me_achievement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `achievementTitle` varchar(256) NOT NULL,
  `competitionPosition` varchar(20) NOT NULL,
  `competitionTitle` varchar(256) NOT NULL,
  `competitionPlace` varchar(256) NOT NULL,
  `competitionDate` date DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_pr_me_achievementCreatedBy` (`createdBy`),
  CONSTRAINT `FK_pr_me_achievementCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.pr_me_achievement: ~0 rows (approximately)
/*!40000 ALTER TABLE `pr_me_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `pr_me_achievement` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.pr_me_research
CREATE TABLE IF NOT EXISTS `pr_me_research` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_name` varchar(256) NOT NULL,
  `fkPrivateMedical_college` int(11) NOT NULL,
  `teacherName` varchar(150) NOT NULL,
  `department_name` varchar(256) NOT NULL,
  `research_published` date DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_pr_me_researchCreatedBy` (`createdBy`),
  KEY `FK_pr_me_researchMedical_college` (`fkPrivateMedical_college`),
  CONSTRAINT `FK_pr_me_researchCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_pr_me_researchMedical_college` FOREIGN KEY (`fkPrivateMedical_college`) REFERENCES `private_medical_college` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.pr_me_research: ~0 rows (approximately)
/*!40000 ALTER TABLE `pr_me_research` DISABLE KEYS */;
/*!40000 ALTER TABLE `pr_me_research` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.pr_research
CREATE TABLE IF NOT EXISTS `pr_research` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_name` varchar(256) NOT NULL,
  `fkPrivate_varsity` int(11) NOT NULL,
  `teacherName` varchar(150) NOT NULL,
  `department_name` varchar(256) NOT NULL,
  `research_published` date DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_pr_researchCreatedBy` (`createdBy`),
  KEY `FK_pr_researchPrivate_varsity` (`fkPrivate_varsity`),
  CONSTRAINT `FK_pr_researchCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_pr_researchPrivate_varsity` FOREIGN KEY (`fkPrivate_varsity`) REFERENCES `private_university` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.pr_research: ~0 rows (approximately)
/*!40000 ALTER TABLE `pr_research` DISABLE KEYS */;
/*!40000 ALTER TABLE `pr_research` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.public_medical_college
CREATE TABLE IF NOT EXISTS `public_medical_college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `college_name` varchar(256) NOT NULL,
  `college_nickname` varchar(20) NOT NULL,
  `campus` varchar(256) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_public_medical_collegeCreatedBy` (`createdBy`),
  CONSTRAINT `FK_public_medical_collegeCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.public_medical_college: ~0 rows (approximately)
/*!40000 ALTER TABLE `public_medical_college` DISABLE KEYS */;
INSERT INTO `public_medical_college` (`id`, `college_name`, `college_nickname`, `campus`, `createdBy`, `createdTime`) VALUES
	(1, 'Dhaka Medical College', 'DMC', 'dhaka 1000', NULL, '2019-02-28 11:49:39');
/*!40000 ALTER TABLE `public_medical_college` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.public_university
CREATE TABLE IF NOT EXISTS `public_university` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pu_varsity_name` varchar(256) NOT NULL,
  `pu_varsity_nickname` varchar(20) NOT NULL,
  `campus` varchar(256) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_public_universityCreatedBy` (`createdBy`),
  CONSTRAINT `FK_public_universityCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.public_university: ~0 rows (approximately)
/*!40000 ALTER TABLE `public_university` DISABLE KEYS */;
INSERT INTO `public_university` (`id`, `pu_varsity_name`, `pu_varsity_nickname`, `campus`, `createdBy`, `createdTime`) VALUES
	(1, 'University of Dhaka', 'DU', 'Nilkhet Rd, Dhaka 1000', NULL, '2019-02-28 11:50:45');
/*!40000 ALTER TABLE `public_university` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.pu_achievement
CREATE TABLE IF NOT EXISTS `pu_achievement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `achievementTitle` varchar(256) NOT NULL,
  `competitionPosition` varchar(20) NOT NULL,
  `competitionTitle` varchar(256) NOT NULL,
  `competitionPlace` varchar(256) NOT NULL,
  `competitionDate` date DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_pu_achievementCreatedBy` (`createdBy`),
  CONSTRAINT `FK_pu_achievementCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.pu_achievement: ~0 rows (approximately)
/*!40000 ALTER TABLE `pu_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `pu_achievement` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.pu_me_achievement
CREATE TABLE IF NOT EXISTS `pu_me_achievement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `achievementTitle` varchar(256) NOT NULL,
  `competitionPosition` varchar(20) NOT NULL,
  `competitionTitle` varchar(256) NOT NULL,
  `competitionPlace` varchar(256) NOT NULL,
  `competitionDate` date DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_pu_me_achievementCreatedBy` (`createdBy`),
  CONSTRAINT `FK_pu_me_achievementCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.pu_me_achievement: ~0 rows (approximately)
/*!40000 ALTER TABLE `pu_me_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `pu_me_achievement` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.pu_me_research
CREATE TABLE IF NOT EXISTS `pu_me_research` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_name` varchar(256) NOT NULL,
  `fkPublicMedical_college` int(11) NOT NULL,
  `teacherName` varchar(150) NOT NULL,
  `department_name` varchar(256) NOT NULL,
  `research_published` date DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_pu_me_researchCreatedBy` (`createdBy`),
  KEY `FK_pu_me_researchMedical_college` (`fkPublicMedical_college`),
  CONSTRAINT `FK_pu_me_researchCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_pu_me_researchMedical_college` FOREIGN KEY (`fkPublicMedical_college`) REFERENCES `public_medical_college` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.pu_me_research: ~0 rows (approximately)
/*!40000 ALTER TABLE `pu_me_research` DISABLE KEYS */;
/*!40000 ALTER TABLE `pu_me_research` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.pu_research
CREATE TABLE IF NOT EXISTS `pu_research` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_name` varchar(256) NOT NULL,
  `fkPublic_varsity` int(11) NOT NULL,
  `teacherName` varchar(150) NOT NULL,
  `department_name` varchar(256) NOT NULL,
  `research_published` date DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_pu_researchCreatedBy` (`createdBy`),
  KEY `FK_pu_researchPublic_varsity` (`fkPublic_varsity`),
  CONSTRAINT `FK_pu_researchCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_pu_researchPublic_varsity` FOREIGN KEY (`fkPublic_varsity`) REFERENCES `public_university` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.pu_research: ~0 rows (approximately)
/*!40000 ALTER TABLE `pu_research` DISABLE KEYS */;
/*!40000 ALTER TABLE `pu_research` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.research
CREATE TABLE IF NOT EXISTS `research` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `research_name` varchar(256) NOT NULL,
  `fkVarsity_type` int(11) NOT NULL,
  `fkVarsity_name` int(11) NOT NULL,
  `teacherName` varchar(256) NOT NULL,
  `fkDepartment_name` int(11) NOT NULL,
  `research_published` date DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_researchCreatedBy` (`createdBy`),
  KEY `FK_researchVarsity_type` (`fkVarsity_type`),
  KEY `FK_researchVarsity_name` (`fkVarsity_name`),
  KEY `FK_researchDepartment_name` (`fkDepartment_name`),
  CONSTRAINT `FK_researchCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_researchDepartment_name` FOREIGN KEY (`fkDepartment_name`) REFERENCES `department_type` (`id`),
  CONSTRAINT `FK_researchVarsity_name` FOREIGN KEY (`fkVarsity_name`) REFERENCES `university` (`id`),
  CONSTRAINT `FK_researchVarsity_type` FOREIGN KEY (`fkVarsity_type`) REFERENCES `university_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.research: ~2 rows (approximately)
/*!40000 ALTER TABLE `research` DISABLE KEYS */;
INSERT INTO `research` (`id`, `research_name`, `fkVarsity_type`, `fkVarsity_name`, `teacherName`, `fkDepartment_name`, `research_published`, `createdBy`, `createdTime`) VALUES
	(1, '', 1, 4, '', 6, NULL, NULL, '2019-07-30 08:31:12'),
	(2, 'sdfsdfgsd', 5, 6, 'sdfsergrete', 8, NULL, NULL, '2019-07-30 08:32:02'),
	(3, 'Tools', 4, 8, 'akash', 7, NULL, NULL, '2019-07-30 09:36:26');
/*!40000 ALTER TABLE `research` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `fk_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_role` (`name`,`fk_user_id`),
  KEY `FK_roleUserId` (`fk_user_id`),
  CONSTRAINT `FK_roleUserId` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.role: ~2 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `fk_user_id`) VALUES
	(11, 'ROLE_ADMIN', 15),
	(12, 'ROLE_ADMIN', 16);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `skill` varchar(256) DEFAULT NULL,
  `graduation` varchar(256) NOT NULL,
  `achievement` varchar(256) DEFAULT NULL,
  `fkUniversity_name` int(20) NOT NULL,
  `fkUniversity_type` int(20) NOT NULL,
  `photo` varchar(256) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_teacherUniversity_type` (`fkUniversity_type`),
  KEY `FK_teacherUniversity_name` (`fkUniversity_name`),
  KEY `FK_teacherCreatedBy` (`createdBy`),
  CONSTRAINT `FK_teacherCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_teacherUniversity_name` FOREIGN KEY (`fkUniversity_name`) REFERENCES `university` (`id`),
  CONSTRAINT `FK_teacherUniversity_type` FOREIGN KEY (`fkUniversity_type`) REFERENCES `university_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.teacher: ~0 rows (approximately)
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`id`, `name`, `email`, `skill`, `graduation`, `achievement`, `fkUniversity_name`, `fkUniversity_type`, `photo`, `createdBy`, `createdTime`) VALUES
	(4, 'Alamin', 'alamin15@gmail.com', 'qqWDQWDQEDQEDQW', 'ADCSDFWERFWREWR', 'AXSCSDCSEFERGT', 4, 2, NULL, NULL, '2019-06-30 10:05:33'),
	(5, '', '', '', '', '', 4, 1, NULL, NULL, '2019-07-22 09:07:52');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.university
CREATE TABLE IF NOT EXISTS `university` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varsity_name` varchar(256) NOT NULL,
  `varsity_nickname` varchar(20) NOT NULL,
  `campus` varchar(256) NOT NULL,
  `fkUniversity_type` int(20) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_universityUniversity_type` (`fkUniversity_type`),
  KEY `FK_universityCreatedBy` (`createdBy`),
  CONSTRAINT `FK_universityCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_universityUniversity_type` FOREIGN KEY (`fkUniversity_type`) REFERENCES `university_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.university: ~7 rows (approximately)
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` (`id`, `varsity_name`, `varsity_nickname`, `campus`, `fkUniversity_type`, `createdBy`, `createdTime`) VALUES
	(4, 'Daffodil International University', 'DIU', 'Dhanmondi-27, Mirpur Road23', 2, NULL, '2019-08-02 09:33:17'),
	(5, 'Dhaka University', 'DU', 'Shah Bag, Dhaka-1234', 1, NULL, '2019-05-09 16:12:36'),
	(6, 'Dhaka Medical College', 'DMC', 'Shah Bag, Dhaka', 5, NULL, '2019-05-10 16:04:54'),
	(7, 'Jahangirnagor University', 'JU', 'Jahangirnogor, Savar', 1, NULL, '2019-05-18 17:03:58'),
	(8, 'Dhaka International University', 'DIU', 'Dhanmondi-27, Mirpur Road', 2, NULL, '2019-07-16 20:21:52'),
	(9, 'BUET', 'BUET', 'New Market', 3, NULL, '2019-08-02 09:34:02'),
	(10, 'PG Hospital', 'PG', 'Dhaka,Bangladesh', 5, NULL, '2019-08-02 09:36:10');
/*!40000 ALTER TABLE `university` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.university_type
CREATE TABLE IF NOT EXISTS `university_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniVersityType` varchar(100) NOT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_university_typeCreatedBy` (`createdBy`),
  CONSTRAINT `FK_university_typeCreatedBy` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.university_type: ~5 rows (approximately)
/*!40000 ALTER TABLE `university_type` DISABLE KEYS */;
INSERT INTO `university_type` (`id`, `uniVersityType`, `createdBy`, `createdTime`) VALUES
	(1, 'Public University', NULL, '2019-05-05 11:46:29'),
	(2, 'Private University', NULL, '2019-05-05 11:46:08'),
	(3, 'Engineering University', NULL, '2019-05-05 11:47:28'),
	(4, 'Private Medical University', NULL, '2019-05-06 21:17:31'),
	(5, 'Public Medical College', NULL, '2019-07-23 11:54:05');
/*!40000 ALTER TABLE `university_type` ENABLE KEYS */;

-- Dumping structure for table multiuniversityinformation.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) NOT NULL,
  `password` varchar(80) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `con_users_usercode_uk` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Dumping data for table multiuniversityinformation.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `enabled`, `createdTime`) VALUES
	(15, 'admin', '$2a$10$W2FYB/zACVsjmwtM1UL.vO8bsfWgsYqod7Uq3DSJOx4wAm02YKP82', 1, '2019-01-05 12:34:07'),
	(16, 'alamin', 'alamin', 1, '2019-01-05 12:16:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
