-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: SecurityExample
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangelog`
--

LOCK TABLES `databasechangelog` WRITE;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` VALUES ('00000000000001','jhipster','config/liquibase/changelog/00000000000000_initial_schema.xml','2022-09-18 04:28:25',1,'EXECUTED','8:1a5f32270e664dee65256c5fff5c0e33','createTable tableName=jhi_user; createTable tableName=jhi_authority; createTable tableName=jhi_user_authority; addPrimaryKey tableName=jhi_user_authority; addForeignKeyConstraint baseTableName=jhi_user_authority, constraintName=fk_authority_name, ...','',NULL,'4.15.0',NULL,NULL,'3475305042');
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangeloglock`
--

LOCK TABLES `databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_authority`
--

DROP TABLE IF EXISTS `jhi_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_authority` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_authority`
--

LOCK TABLES `jhi_authority` WRITE;
/*!40000 ALTER TABLE `jhi_authority` DISABLE KEYS */;
INSERT INTO `jhi_authority` VALUES ('ROLE_ADMIN'),('ROLE_USER');
/*!40000 ALTER TABLE `jhi_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_user`
--

DROP TABLE IF EXISTS `jhi_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(10) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_user_login` (`login`),
  UNIQUE KEY `ux_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_user`
--

LOCK TABLES `jhi_user` WRITE;
/*!40000 ALTER TABLE `jhi_user` DISABLE KEYS */;
INSERT INTO `jhi_user` VALUES (1,'admin','$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC','Administrator','Administrator','admin@localhost','',_binary '','en',NULL,NULL,'system',NULL,NULL,'system',NULL),(2,'user','$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K','User','User','user@localhost','',_binary '','en',NULL,NULL,'system',NULL,NULL,'system',NULL);
/*!40000 ALTER TABLE `jhi_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_user_authority`
--

DROP TABLE IF EXISTS `jhi_user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_user_authority` (
  `user_id` bigint NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_user_authority`
--

LOCK TABLES `jhi_user_authority` WRITE;
/*!40000 ALTER TABLE `jhi_user_authority` DISABLE KEYS */;
INSERT INTO `jhi_user_authority` VALUES (1,'ROLE_ADMIN'),(1,'ROLE_USER'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `jhi_user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category`
--

DROP TABLE IF EXISTS `sys_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_category` (
  `id` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pid` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Parent node',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Type name',
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Type code',
  `create_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Created by',
  `create_time` datetime DEFAULT NULL COMMENT 'create date',
  `update_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update by',
  `update_time` datetime DEFAULT NULL COMMENT 'update date',
  `sys_org_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Department',
  `has_child` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Is there a child node',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_code` (`code`) USING BTREE,
  KEY `idx_sc_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category`
--

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_check_rule`
--

DROP TABLE IF EXISTS `sys_check_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_check_rule` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'primary key id',
  `rule_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Rule name',
  `rule_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Rule Code',
  `rule_json` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Rule JSON',
  `rule_description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'rule description',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update by',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Created by',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_scr_rule_code` (`rule_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_check_rule`
--

LOCK TABLES `sys_check_rule` WRITE;
/*!40000 ALTER TABLE `sys_check_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_check_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_data_log`
--

DROP TABLE IF EXISTS `sys_data_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_data_log` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'id',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Creator login name',
  `create_time` datetime DEFAULT NULL COMMENT 'create date',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update person login name',
  `update_time` datetime DEFAULT NULL COMMENT 'update date',
  `data_table` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'table name',
  `data_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Data ID',
  `data_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT 'Data content',
  `data_version` int DEFAULT NULL COMMENT 'version number',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sdl_data_table_id` (`data_table`,`data_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_data_log`
--

LOCK TABLES `sys_data_log` WRITE;
/*!40000 ALTER TABLE `sys_data_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_data_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_data_source`
--

DROP TABLE IF EXISTS `sys_data_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_data_source` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Data source code',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Data source name',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Remark',
  `db_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Database type',
  `db_driver` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Driver class',
  `db_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Data source address',
  `db_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Database name',
  `db_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'username',
  `db_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'password',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Created by',
  `create_time` datetime DEFAULT NULL COMMENT 'create date',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Updater',
  `update_time` datetime DEFAULT NULL COMMENT 'update date',
  `sys_org_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Department',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_sdc_rule_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_data_source`
--

LOCK TABLES `sys_data_source` WRITE;
/*!40000 ALTER TABLE `sys_data_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_data_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_depart`
--

DROP TABLE IF EXISTS `sys_depart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_depart` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ID',
  `parent_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Parent institution ID',
  `depart_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Institution/department name',
  `depart_name_en` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'English name',
  `depart_name_abbr` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Abbreviation',
  `depart_order` int DEFAULT '0' COMMENT 'sort',
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'description',
  `org_category` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1' COMMENT 'Organization category 1 company, 2 organization, 2 position',
  `org_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Organization type 1 primary department 2 sub-department',
  `org_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Organization code',
  `mobile` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Mobile number',
  `fax` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'fax',
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'address',
  `memo` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Remark',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Status (1 enabled, 0 not enabled)',
  `del_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Delete status (0, normal, 1 deleted)',
  `qywx_identifier` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'The ID of the enterprise WeChat',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Created by',
  `create_time` datetime DEFAULT NULL COMMENT 'create date',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update by',
  `update_time` datetime DEFAULT NULL COMMENT 'update date',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_depart_org_code` (`org_code`) USING BTREE,
  KEY `idx_sd_parent_id` (`parent_id`) USING BTREE,
  KEY `idx_sd_depart_order` (`depart_order`) USING BTREE,
  KEY `idx_sd_org_code` (`org_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Organization table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_depart`
--

LOCK TABLES `sys_depart` WRITE;
/*!40000 ALTER TABLE `sys_depart` DISABLE KEYS */;
INSERT INTO `sys_depart` VALUES ('4f1765520d6346f9bd9c79e2479e5b12','c6d7cb4deeac411cb3384b1b31278596','Marketing Department',NULL,NULL,0,NULL,'1','2','A01A03',NULL,NULL,NULL,NULL,NULL,'0',NULL,'admin','2019-02-20 17:15:34','admin','2019-02-26 16:36:18'),('5159cde220114246b045e574adceafe9','6d35e179cd814e3299bd588ea7daed3f','R&D Department',NULL,NULL,0,NULL,'1','2','A02A02',NULL,NULL,NULL,NULL,NULL,'0',NULL,'admin','2019-02-26 16:44:38','admin','2019-03-07 09:36:53'),('57197590443c44f083d42ae24ef26a2c','c6d7cb4deeac411cb3384b1b31278596','R&D Department',NULL,NULL,0,NULL,'1','2','A01A05',NULL,NULL,NULL,NULL,NULL,'0',NULL,'admin','2019-02-21 16:14:41','admin','2019-03-27 19:05:49'),('63775228b7b041a99825f79760590b7d','57197590443c44f083d42ae24ef26a2c','R&D manager',NULL,NULL,0,NULL,'3','3','A01A05A01',NULL,NULL,NULL,NULL,NULL,'0',NULL,'admin','2020-05-02 15:29:09',NULL,NULL),('67fc001af12a4f9b8458005d3f19934a','c6d7cb4deeac411cb3384b1b31278596','Finance Department',NULL,NULL,0,NULL,'1','2','A01A04',NULL,NULL,NULL,NULL,NULL,'0',NULL,'admin','2019-02-21 16:14:35','admin','2019-02-25 12:49:41'),('6d35e179cd814e3299bd588ea7daed3f','','SpaceX Software',NULL,NULL,0,NULL,'1','1','A02',NULL,NULL,NULL,NULL,NULL,'0',NULL,'admin','2019-02-26 16:36:39','admin','2020-05-02 18:21:22'),('a7d7e77e06c84325a40932163adcdaa6','6d35e179cd814e3299bd588ea7daed3f','Finance Department',NULL,NULL,0,NULL,'1','2','A02A01',NULL,NULL,NULL,NULL,NULL,'0',NULL,'admin','2019-02-26 16:36:47','admin','2019-02-26 16:37:25'),('c6d7cb4deeac411cb3384b1b31278596','','Viettel Software',NULL,NULL,0,NULL,'1','1','A01',NULL,NULL,NULL,NULL,NULL,'0',NULL,'admin','2019-02-11 14:21:51','admin','2020-05-02 18:21:27');
/*!40000 ALTER TABLE `sys_depart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_depart_permission`
--

DROP TABLE IF EXISTS `sys_depart_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_depart_permission` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `depart_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'department id',
  `permission_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'permission id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Data rule id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Department permission table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_depart_permission`
--

LOCK TABLES `sys_depart_permission` WRITE;
/*!40000 ALTER TABLE `sys_depart_permission` DISABLE KEYS */;
INSERT INTO `sys_depart_permission` VALUES ('1260925131934519297','6d35e179cd814e3299bd588ea7daed3f','f0675b52d89100ee88472b6800754a08',NULL),('1260925131947102209','6d35e179cd814e3299bd588ea7daed3f','2aeddae571695cd6380f6d6d334d6e7d',NULL),('1260925131955490818','6d35e179cd814e3299bd588ea7daed3f','020b06793e4de2eee0007f603000c769',NULL),('1260925131959685121','6d35e179cd814e3299bd588ea7daed3f','1232123780958064642',NULL);
/*!40000 ALTER TABLE `sys_depart_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_depart_role`
--

DROP TABLE IF EXISTS `sys_depart_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_depart_role` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `depart_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'department id',
  `role_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Department role name',
  `role_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Department role code',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'description',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Created by',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update by',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Department role table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_depart_role`
--

LOCK TABLES `sys_depart_role` WRITE;
/*!40000 ALTER TABLE `sys_depart_role` DISABLE KEYS */;
INSERT INTO `sys_depart_role` VALUES ('1260925293226479618','6d35e179cd814e3299bd588ea7daed3f','roless','ssss',NULL,'admin','2020-05-14 21:29:51',NULL,NULL);
/*!40000 ALTER TABLE `sys_depart_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_depart_role_permission`
--

DROP TABLE IF EXISTS `sys_depart_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_depart_role_permission` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `depart_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'department id',
  `role_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'role id',
  `permission_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'permission id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Data authority ids',
  `operate_date` datetime DEFAULT NULL COMMENT 'Operation time',
  `operate_ip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'operate ip',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sdrp_role_per_id` (`role_id`,`permission_id`) USING BTREE,
  KEY `idx_sdrp_role_id` (`role_id`) USING BTREE,
  KEY `idx_sdrp_per_id` (`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='Department role permission table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_depart_role_permission`
--

LOCK TABLES `sys_depart_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_depart_role_permission` DISABLE KEYS */;
INSERT INTO `sys_depart_role_permission` VALUES ('1260925328689319938',NULL,'1260925293226479618','2aeddae571695cd6380f6d6d334d6e7d',NULL,NULL,NULL),('1260925328706097153',NULL,'1260925293226479618','020b06793e4de2eee0007f603000c769',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_depart_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_depart_role_user`
--

DROP TABLE IF EXISTS `sys_depart_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_depart_role_user` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'primary key id',
  `user_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'userid',
  `drole_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'role id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Department role user table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_depart_role_user`
--

LOCK TABLES `sys_depart_role_user` WRITE;
/*!40000 ALTER TABLE `sys_depart_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_depart_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dict_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'dictionary name',
  `dict_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'dictionary code',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'description',
  `del_flag` int DEFAULT NULL COMMENT 'Delete status',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Created by',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update by',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `type` int(1) unsigned zerofill DEFAULT '0' COMMENT 'dictionary type 0 is string, 1 is number',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_sd_dict_code` (`dict_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_item`
--

DROP TABLE IF EXISTS `sys_dict_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_item` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dict_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'dictionary id',
  `item_text` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'dictionary item text',
  `item_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'dictionary item value',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'description',
  `sort_order` int DEFAULT NULL COMMENT 'sort',
  `status` int DEFAULT NULL COMMENT 'Status (1 enabled 0 not enabled)',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sdi_role_dict_id` (`dict_id`) USING BTREE,
  KEY `idx_sdi_role_sort_order` (`sort_order`) USING BTREE,
  KEY `idx_sdi_status` (`status`) USING BTREE,
  KEY `idx_sdi_dict_val` (`dict_id`,`item_value`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_item`
--

LOCK TABLES `sys_dict_item` WRITE;
/*!40000 ALTER TABLE `sys_dict_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dict_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_fill_rule`
--

DROP TABLE IF EXISTS `sys_fill_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_fill_rule` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键ID',
  `rule_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规则名称',
  `rule_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规则Code',
  `rule_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规则实现类',
  `rule_params` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规则参数',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_sfr_rule_code` (`rule_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_fill_rule`
--

LOCK TABLES `sys_fill_rule` WRITE;
/*!40000 ALTER TABLE `sys_fill_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_fill_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_gateway_route`
--

DROP TABLE IF EXISTS `sys_gateway_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_gateway_route` (
  `id` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `router_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Router ID',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Service name',
  `uri` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Service address',
  `predicates` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT 'Predicate',
  `filters` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT 'filters',
  `retryable` int DEFAULT NULL COMMENT 'Whether to retry: 0-no 1-yes',
  `strip_prefix` int DEFAULT NULL COMMENT 'whether to ignore prefix 0-no 1-yes',
  `persistable` int DEFAULT NULL COMMENT 'Is it reserved data: 0-no 1-yes',
  `show_api` int DEFAULT NULL COMMENT 'Whether to show in the interface document: 0-no 1-yes',
  `status` int DEFAULT NULL COMMENT 'Status: 0-invalid 1-valid',
  `create_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Created by',
  `create_time` datetime DEFAULT NULL COMMENT 'create date',
  `update_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update by',
  `update_time` datetime DEFAULT NULL COMMENT 'update date',
  `sys_org_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Department',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_gateway_route`
--

LOCK TABLES `sys_gateway_route` WRITE;
/*!40000 ALTER TABLE `sys_gateway_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_gateway_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_log` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `log_type` int DEFAULT NULL COMMENT 'Log type (1 log log, 2 operation log)',
  `log_content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Log content',
  `operate_type` int DEFAULT NULL COMMENT 'Operation type',
  `userid` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Operation user account',
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Operation user name',
  `ip` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'IP',
  `method` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Request java method',
  `request_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Request path',
  `request_param` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT 'Request parameter',
  `request_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Request type',
  `cost_time` bigint DEFAULT NULL COMMENT 'cost',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Created by',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update by',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `response_code` varchar(100) DEFAULT NULL,
  `response_content` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sl_userid` (`userid`) USING BTREE,
  KEY `idx_sl_log_type` (`log_type`) USING BTREE,
  KEY `idx_sl_operate_type` (`operate_type`) USING BTREE,
  KEY `idx_sl_create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='System log table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_permission` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'primary key id',
  `parent_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'parent id',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Menu title',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'path',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'component',
  `component_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'component name',
  `redirect` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'First-level menu jump address',
  `menu_type` int DEFAULT NULL COMMENT 'menu type (0: first level menu; 1: submenu: 2: button permission)',
  `perms` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Menu permission code',
  `perms_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT 'Permission policy 1 shows 2 disable',
  `sort_no` double(8,2) DEFAULT NULL COMMENT 'Menu sort',
  `always_show` tinyint(1) DEFAULT NULL COMMENT 'Aggregate sub-routes: 1 is 0 or not',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Menu icon',
  `is_route` tinyint(1) DEFAULT '1' COMMENT 'Whether to route the menu: 0: not 1: yes (default value 1)',
  `is_leaf` tinyint(1) DEFAULT NULL COMMENT 'Is it a leaf node: 1: yes 0: no',
  `keep_alive` tinyint(1) DEFAULT NULL COMMENT 'Whether to cache this page: 1: yes 0: no',
  `hidden` tinyint(1) DEFAULT '0' COMMENT 'Whether the route is hidden: 0 no, 1 yes',
  `hide_tab` tinyint(1) DEFAULT NULL COMMENT 'Hide tab: 0 no, 1 yes',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'description',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Created by',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update by',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  `del_flag` int DEFAULT '0' COMMENT 'Deletion status 0 normal 1 deleted',
  `rule_flag` int DEFAULT '0' COMMENT 'Whether to add data permission 1 is 0 or not',
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Button permission status (0 invalid 1 valid)',
  `internal_or_external` tinyint(1) DEFAULT NULL COMMENT 'External link menu open mode 0/internal open 1/external open',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sp_parent_id` (`parent_id`) USING BTREE,
  KEY `idx_sp_is_route` (`is_route`) USING BTREE,
  KEY `idx_sp_is_leaf` (`is_leaf`) USING BTREE,
  KEY `idx_sp_sort_no` (`sort_no`) USING BTREE,
  KEY `idx_sp_del_flag` (`del_flag`) USING BTREE,
  KEY `idx_sp_menu_type` (`menu_type`) USING BTREE,
  KEY `idx_sp_hidden` (`hidden`) USING BTREE,
  KEY `idx_sp_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Menu permission table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES ('00a2a0ae65cdca5e93209cdbde97cbe6','2e42e3835c2b44ec9f7bc26c146ee531','Succeed','/result/success','result/Success',NULL,NULL,1,NULL,'0',1.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('020b06793e4de2eee0007f603000c769','f0675b52d89100ee88472b6800754a08','ViserChartDemo','/report/ViserChartDemo','jeecg/report/ViserChartDemo',NULL,NULL,1,NULL,'0',3.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-03 19:08:53','admin','2019-04-03 19:08:53',0,0,NULL,NULL),('024f1fd1283dc632458976463d8984e1','700b7f95165c46cc7a78bf227aa8fed3','Tomcat information','/monitor/TomcatInfo','modules/monitor/TomcatInfo',NULL,NULL,1,NULL,'0',4.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-02 09:44:29','admin','2019-05-07 15:19:10',0,0,NULL,NULL),('043780fa095ff1b2bec4dc406d76f023','2a470fc0c3954d9dbb61de6d80846549','Table Total','/jeecg/tableTotal','jeecg/TableTotal',NULL,NULL,1,NULL,'1',3.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-08-14 10:28:46',NULL,NULL,0,0,'1',NULL),('05b3c82ddb2536a4a5ee1a4c46b5abef','540a2936940846cb98114ffb0d145cb8','User List','/list/user-list','examples/list/UserList',NULL,NULL,1,NULL,'0',3.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('0620e402857b8c5b605e1ad9f4b89350','2a470fc0c3954d9dbb61de6d80846549','Asynchronous tree list Demo','/jeecg/JeecgTreeTable','jeecg/JeecgTreeTable',NULL,NULL,1,NULL,'0',3.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-05-13 17:30:30','admin','2019-05-13 17:32:17',0,0,'1',NULL),('078f9558cdeab239aecb2bda1a8ed0d1','fb07ca05a3e13674dbf6d3245956da2e','Search Lists (Articles)','/list/search/article','examples/list/TableList',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-02-12 14:00:34','admin','2019-02-12 14:17:54',0,0,NULL,NULL),('08e6b9dc3c04489c8e1ff2ce6f105aa4','','System monitoring','/dashboard3','layouts/RouteView',NULL,NULL,0,NULL,'0',6.00,0,'dashboard',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-03-31 22:19:58',0,0,NULL,NULL),('0ac2ad938963b6c6d1af25477d5b8b51','8d4683aacaa997ab86b966b464360338','Code generation button',NULL,NULL,NULL,NULL,2,'online:goGenerateCode','1',1.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-06-11 14:20:09',NULL,NULL,0,0,'1',NULL),('109c78a583d4693ce2f16551b7786786','e41b69c57a941a3bbcce45032fe57605','Online report configuration','/online/cgreport','modules/online/cgreport/OnlCgreportHeadList',NULL,NULL,1,NULL,'0',2.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-03-08 10:51:07','admin','2019-03-30 19:04:28',0,0,NULL,NULL),('1166535831146504193','2a470fc0c3954d9dbb61de6d80846549','Object Storage','/oss/file','modules/oss/OSSFileList',NULL,NULL,1,NULL,'1',1.00,0,'',1,1,0,0,NULL,NULL,'admin','2019-08-28 02:19:50','admin','2019-08-28 02:20:57',0,0,'1',NULL),('1170592628746878978','d7d6e2e4e2934f2c9385a623fd98c6f3','Menu Management 2','/isystem/newPermissionList','system/NewPermissionList',NULL,NULL,1,NULL,'1',100.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-09-08 15:00:05','admin','2019-12-25 09:58:18',0,0,'1',0),('1174506953255182338','d7d6e2e4e2934f2c9385a623fd98c6f3','Job Management','/isystem/position','system/SysPositionList',NULL,NULL,1,NULL,'1',2.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-09-19 10:14:13','admin','2019-09-19 10:15:22',0,0,'1',0),('1174590283938041857','d7d6e2e4e2934f2c9385a623fd98c6f3','Address Book','/isystem/addressList','system/AddressList',NULL,NULL,1,NULL,'1',3.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-09-19 15:45:21',NULL,NULL,0,0,'1',0),('1192318987661234177','e41b69c57a941a3bbcce45032fe57605','System Coding Rules','/isystem/fillRule','system/SysFillRuleList',NULL,NULL,1,NULL,'1',3.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-11-07 13:52:53','admin','2020-07-10 16:55:03',0,0,'1',0),('1205097455226462210','','Report Design','/big/screen','layouts/RouteView',NULL,NULL,0,NULL,'1',2.10,0,'area-chart',1,0,0,0,0,NULL,'admin','2019-12-12 20:09:58','admin','2022-02-23 18:22:02',0,0,'1',0),('1205098241075453953','1205097455226462210','Production and sales monitoring','{{ window._CONFIG[\'domianURL\'] }}/test/bigScreen/templat/index1','layouts/IframePageView',NULL,NULL,1,NULL,'1',1.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-12-12 20:13:05','admin','2019-12-12 20:15:27',0,0,'1',1),('1205306106780364802','1205097455226462210','Smart Logistics Monitoring','{{ window._CONFIG[\'domianURL\'] }}/test/bigScreen/templat/index2','layouts/IframePageView',NULL,NULL,1,NULL,'1',2.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-12-13 09:59:04','admin','2019-12-25 09:28:03',0,0,'1',0),('1209731624921534465','e41b69c57a941a3bbcce45032fe57605','Multiple data source management','/isystem/dataSource','system/SysDataSourceList',NULL,NULL,1,NULL,'1',6.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-12-25 15:04:30','admin','2020-02-23 22:43:37',0,0,'1',0),('1224641973866467330','e41b69c57a941a3bbcce45032fe57605','System check rules','/isystem/checkRule','system/SysCheckRuleList',NULL,NULL,1,NULL,'1',5.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-11-07 13:52:53','admin','2020-07-10 16:55:12',0,0,'1',0),('1229674163694841857','e41b69c57a941a3bbcce45032fe57605','AUTO Online Form ERP','/online/cgformErpList/:code','modules/online/cgform/auto/erp/OnlCgformErpList',NULL,NULL,1,NULL,'1',5.00,0,NULL,1,1,0,1,NULL,NULL,'admin','2020-02-18 15:49:00','admin','2020-02-18 15:52:25',0,0,'1',0),('1232123780958064642','f0675b52d89100ee88472b6800754a08','Online report example','/online/cgreport/6c7f59741c814347905a938f06ee003c','modules/online/cgreport/auto/OnlCgreportAutoList',NULL,NULL,1,NULL,'1',4.00,0,NULL,0,1,0,0,NULL,NULL,'admin','2020-02-25 10:02:56','admin','2020-05-02 15:37:30',0,0,'1',0),('1235823781053313025','e41b69c57a941a3bbcce45032fe57605','AUTO online inline subtable','/online/cgformInnerTableList/:code','modules/online/cgform/auto/innerTable/OnlCgformInnerTableList',NULL,NULL,1,NULL,'1',999.00,0,NULL,1,1,0,1,NULL,NULL,'admin','2020-03-06 15:05:24','admin','2020-03-06 15:07:42',0,0,'1',0),('1260922988733255681','2a470fc0c3954d9dbb61de6d80846549','Online Order Management','/online/cgformInnerTableList/56efb74326e74064b60933f6f8af30ea','111111',NULL,NULL,1,NULL,'1',11.00,0,NULL,0,1,0,0,NULL,NULL,'admin','2020-05-14 21:20:42','admin','2020-09-09 15:31:48',0,0,'1',0),('1260923256208216065','2a470fc0c3954d9dbb61de6d80846549','Online User Report','/online/cgreport/1260179852088135681','333333',NULL,NULL,1,NULL,'1',11.00,0,NULL,0,1,0,0,NULL,NULL,'admin','2020-05-14 21:21:46','admin','2020-09-09 15:31:54',0,0,'1',0),('1260928341675982849','3f915b2769fc80648e92d04e84ca059d','Add Button',NULL,NULL,NULL,NULL,2,'user:add','1',1.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-05-14 21:41:58',NULL,NULL,0,0,'1',0),('1260929666434318338','3f915b2769fc80648e92d04e84ca059d','User edit',NULL,NULL,NULL,NULL,2,'user:edit','1',1.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-05-14 21:47:14',NULL,NULL,0,0,'1',0),('1260931366557696001','3f915b2769fc80648e92d04e84ca059d','Form gender visible','',NULL,NULL,NULL,2,'user:sex','1',1.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-05-14 21:53:59','admin','2020-05-14 21:57:00',0,0,'1',0),('1260933542969458689','3f915b2769fc80648e92d04e84ca059d','Disable birthday field',NULL,NULL,NULL,NULL,2,'user:form:birthday','2',1.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-05-14 22:02:38',NULL,NULL,0,0,'1',0),('1265162119913824258','08e6b9dc3c04489c8e1ff2ce6f105aa4','Routing Gateway','/isystem/gatewayroute','system/SysGatewayRouteList',NULL,NULL,1,NULL,'1',0.00,0,NULL,1,1,0,0,NULL,NULL,NULL,'2020-05-26 14:05:30','admin','2020-09-09 14:47:52',0,0,'1',0),('1280350452934307841','d7d6e2e4e2934f2c9385a623fd98c6f3','Tenant management','/isys/tenant','system/TenantList',NULL,NULL,1,NULL,'1',1.31,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-07-07 11:58:30','admin','2021-08-16 16:24:03',0,0,'1',0),('1280464606292099074','2a470fc0c3954d9dbb61de6d80846549','Image Cropping','/jeecg/ImagCropper','jeecg/ImagCropper',NULL,NULL,1,NULL,'1',9.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-07-07 19:32:06',NULL,NULL,0,0,'1',0),('1287715272999944193','2a470fc0c3954d9dbb61de6d80846549','JVXE Table Example','/jeecg/j-vxe-table-demo','layouts/RouteView',NULL,NULL,1,NULL,'1',0.10,0,'',1,0,0,0,NULL,NULL,'admin','2020-07-27 19:43:40','admin','2020-09-09 14:52:06',0,0,'1',0),('1287715783966834689','1287715272999944193','Common Example','/jeecg/j-vxe-table-demo/normal','jeecg/JVXETableDemo',NULL,NULL,1,NULL,'1',1.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-07-27 19:45:42',NULL,NULL,0,0,'1',0),('1287716451494510593','1287715272999944193','Layout template','/jeecg/j-vxe-table-demo/layout','jeecg/JVxeDemo/layout-demo/Index',NULL,NULL,1,NULL,'1',2.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-07-27 19:48:21',NULL,NULL,0,0,'1',0),('1287718919049691137','1287715272999944193','Instant Save','/jeecg/j-vxe-table-demo/jsbc','jeecg/JVxeDemo/demo/JSBCDemo',NULL,NULL,1,NULL,'1',3.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-07-27 19:57:36','admin','2020-07-27 20:03:37',0,0,'1',0),('1287718938179911682','1287715272999944193','Popup Subtable','/jeecg/j-vxe-table-demo/tczb','jeecg/JVxeDemo/demo/PopupSubTable',NULL,NULL,1,NULL,'1',4.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-07-27 19:57:41','admin','2020-07-27 20:03:47',0,0,'1',0),('1287718956957810689','1287715272999944193','Incognito Refresh','/jeecg/j-vxe-table-demo/whsx','jeecg/JVxeDemo/demo/SocketReload',NULL,NULL,1,NULL,'1',5.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-07-27 19:57:44','admin','2020-07-27 20:03:57',0,0,'1',0),('1304032910990495745','e41b69c57a941a3bbcce45032fe57605','AUTO online form TAB','/online/cgformTabList/:code','modules/online/cgform/auto/tab/OnlCgformTabList',NULL,NULL,1,NULL,'1',8.00,0,NULL,1,1,0,1,NULL,NULL,'admin','2020-09-10 20:24:08','admin','2020-09-10 20:36:37',0,0,'1',0),('13212d3416eb690c2e1d5033166ff47a','2e42e3835c2b44ec9f7bc26c146ee531','Failure','/result/fail','result/Error',NULL,NULL,1,NULL,'0',2.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('1335960713267093506','1205097455226462210','Building block report design','{{ window._CONFIG[\'domianURL\'] }}/jmreport/list?token=${token}','layouts/IframePageView',NULL,NULL,1,NULL,'1',0.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2020-12-07 22:53:50','admin','2020-12-08 09:28:06',0,0,'1',1),('1352200630711652354','f0675b52d89100ee88472b6800754a08','Redis monitoring','{{ window._CONFIG[\'domianURL\'] }}/jmreport/view/1352160857479581696?token=${token}','layouts/IframePageView',NULL,NULL,1,NULL,'1',5.00,0,'',1,1,0,0,NULL,NULL,'admin','2021-01-21 18:25:28','admin','2021-04-07 14:00:57',0,0,'1',1),('1365187528377102337','2a470fc0c3954d9dbb61de6d80846549','One-to-many JVxe Table','/jeecg/JeecgOrderMainListForJVxeTable','jeecg/JeecgOrderMainListForJVxeTable',NULL,NULL,1,NULL,'1',2.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2021-02-26 14:30:45','admin','2021-02-26 14:32:05',0,0,'1',0),('1367a93f2c410b169faa7abcbad2f77c','6e73eb3c26099c191bf03852ee1310a1','Basic Settings','/account/settings/BaseSetting','account/settings/BaseSetting','account-settings-base',NULL,1,'BaseSettings','0',NULL,0,NULL,1,1,NULL,1,NULL,NULL,NULL,'2018-12-26 18:58:35','admin','2019-03-20 12:57:31',0,0,NULL,NULL),('1387612436586065922','2a470fc0c3954d9dbb61de6d80846549','Third-party APP message testing','/jeecg/ThirdAppMessageTest','jeecg/ThirdAppMessageTest',NULL,NULL,1,NULL,'1',3.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2021-04-29 11:39:20','admin','2021-04-29 11:39:27',0,0,'1',0),('1400726868091015170','4148ec82b6acd69f470bea75fe41c357','Demo Add Function',NULL,NULL,NULL,NULL,2,'demo:add','1',NULL,0,NULL,1,1,0,0,NULL,NULL,'admin','2021-06-04 16:11:24',NULL,NULL,0,0,'1',0),('1404684556047024130','08e6b9dc3c04489c8e1ff2ce6f105aa4','Online User','/isystem/online','system/SysUserOnlineList',NULL,NULL,1,NULL,'1',NULL,0,NULL,1,1,0,0,NULL,NULL,'admin','2021-06-15 14:17:51',NULL,NULL,0,0,'1',0),('1494641317580423169','2a470fc0c3954d9dbb61de6d80846549','Tabular Total News','/jeecg/tableOrderTotal','jeecg/TableOrderTotal',NULL,NULL,1,NULL,'1',3.00,0,NULL,1,1,0,0,0,NULL,'admin','2022-02-18 19:53:54','admin','2022-02-18 19:55:04',0,0,'1',0),('190c2b43bec6a5f7a4194a85db67d96a','d7d6e2e4e2934f2c9385a623fd98c6f3','Role Management','/isystem/roleUserList','system/RoleUserList',NULL,NULL,1,NULL,'0',1.20,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-04-17 15:13:56','admin','2019-12-25 09:36:31',0,0,NULL,0),('1a0811914300741f4e11838ff37a1d3a','3f915b2769fc80648e92d04e84ca059d','Mobile number disabled',NULL,NULL,NULL,NULL,2,'user:form:phone','2',1.00,0,NULL,0,1,NULL,0,NULL,NULL,'admin','2019-05-11 17:19:30','admin','2019-05-11 18:00:22',0,0,'1',NULL),('200006f0edf145a2b50eacca07585451','fb07ca05a3e13674dbf6d3245956da2e','Search List (Apps)','/list/search/application','examples/list/TableList',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-02-12 14:02:51','admin','2019-02-12 14:14:01',0,0,NULL,NULL),('22d6a3d39a59dd7ea9a30acfa6bfb0a5','e41b69c57a941a3bbcce45032fe57605','AUTO dynamic form','/online/df/:table/:id','modules/online/cgform/auto/OnlineDynamicForm',NULL,NULL,1,NULL,'0',9.00,0,NULL,0,1,NULL,1,NULL,NULL,'admin','2019-04-22 15:15:43','admin','2019-04-30 18:18:26',0,0,NULL,NULL),('265de841c58907954b8877fb85212622','2a470fc0c3954d9dbb61de6d80846549','Drag and drop images to sort','/jeecg/imgDragSort','jeecg/ImgDragSort',NULL,NULL,1,NULL,'0',4.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-25 10:43:08','admin','2019-04-25 10:46:26',0,0,NULL,NULL),('277bfabef7d76e89b33062b16a9a5020','e3c13679c73a4f829bcff2aba8fd68b1','Basic Form','/form/base-form','examples/form/BasicForm',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-02-26 17:02:08',0,0,NULL,NULL),('2a470fc0c3954d9dbb61de6d80846549','','Common Cases','/jeecg','layouts/RouteView',NULL,NULL,0,NULL,'0',7.00,0,'qrcode',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-04-02 11:46:42',0,0,NULL,NULL),('2aeddae571695cd6380f6d6d334d6e7d','f0675b52d89100ee88472b6800754a08','Layout Statistics Report','/report/ArchivesStatisticst','jeecg/report/ArchivesStatisticst',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-03 18:32:48',NULL,NULL,0,0,NULL,NULL),('2dbbafa22cda07fa5d169d741b81fe12','08e6b9dc3c04489c8e1ff2ce6f105aa4','Online Documentation','{{ window._CONFIG[\'domianURL\'] }}/doc.html','layouts/IframePageView',NULL,NULL,1,NULL,'0',4.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-01-30 10:00:01','admin','2020-09-09 14:48:58',0,0,NULL,0),('2e42e3835c2b44ec9f7bc26c146ee531','','Results Page','/result','layouts/PageView',NULL,NULL,0,NULL,'0',8.00,0,'check-circle-o',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-04-02 11:46:56',0,0,NULL,NULL),('339329ed54cf255e1f9392e84f136901','2a470fc0c3954d9dbb61de6d80846549','Hello world','/jeecg/helloworld','jeecg/helloworld',NULL,NULL,1,NULL,'0',4.00,0,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-02-15 16:24:56',0,0,NULL,NULL),('3f915b2769fc80648e92d04e84ca059d','d7d6e2e4e2934f2c9385a623fd98c6f3','User Management','/isystem/user','system/UserList',NULL,NULL,1,NULL,'0',1.10,0,NULL,1,0,0,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-12-25 09:36:24',0,0,NULL,0),('3fac0d3c9cd40fa53ab70d4c583821f8','2a470fc0c3954d9dbb61de6d80846549','Split Screen','/jeecg/splitPanel','jeecg/SplitPanel',NULL,NULL,1,NULL,'0',6.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-25 16:27:06',NULL,NULL,0,0,NULL,NULL),('4148ec82b6acd69f470bea75fe41c357','2a470fc0c3954d9dbb61de6d80846549','Single table model example','/jeecg/jeecgDemoList','jeecg/JeecgDemoList','DemoList',NULL,1,NULL,'0',1.00,0,NULL,1,0,0,0,NULL,NULL,NULL,'2018-12-28 15:57:30','jeecg','2020-05-14 22:09:34',0,1,NULL,0),('418964ba087b90a84897b62474496b93','540a2936940846cb98114ffb0d145cb8','Inquiry form','/list/query-list','examples/list/TableList',NULL,NULL,1,NULL,'0',1.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('4356a1a67b564f0988a484f5531fd4d9','2a470fc0c3954d9dbb61de6d80846549','Embedded Table','/jeecg/TableExpandeSub','jeecg/TableExpandeSub',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-04 22:48:13',NULL,NULL,0,0,NULL,NULL),('45c966826eeff4c99b8f8ebfe74511fc','d7d6e2e4e2934f2c9385a623fd98c6f3','Department management','/isystem/depart','system/DepartList',NULL,NULL,1,NULL,'0',1.40,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-01-29 18:47:40','admin','2019-12-25 09:36:47',0,0,NULL,0),('4875ebe289344e14844d8e3ea1edd73f','','Details page','/profile','layouts/RouteView',NULL,NULL,0,NULL,'0',8.00,0,'profile',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-04-02 11:46:48',0,0,NULL,NULL),('4f66409ef3bbd69c1d80469d6e2a885e','6e73eb3c26099c191bf03852ee1310a1','Account Binding','/account/settings/binding','account/settings/Binding',NULL,NULL,1,'BindingSettings','0',NULL,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-26 19:01:20',NULL,NULL,0,0,NULL,NULL),('4f84f9400e5e92c95f05b554724c2b58','540a2936940846cb98114ffb0d145cb8','Role List','/list/role-list','examples/list/RoleList',NULL,NULL,1,NULL,'0',4.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('53a9230444d33de28aa11cc108fb1dba','5c8042bd6c601270b2bbd9b20bccc68b','My Message','/isps/userAnnouncement','system/UserAnnouncementList',NULL,NULL,1,NULL,'0',3.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-04-19 10:16:00','admin','2019-12-25 09:54:34',0,0,NULL,0),('54097c6a3cf50fad0793a34beff1efdf','e41b69c57a941a3bbcce45032fe57605','AUTO online form','/online/cgformList/:code','modules/online/cgform/auto/OnlCgformAutoList',NULL,NULL,1,NULL,'0',9.00,0,NULL,1,1,NULL,1,NULL,NULL,'admin','2019-03-19 16:03:06','admin','2019-04-30 18:19:03',0,0,NULL,NULL),('540a2936940846cb98114ffb0d145cb8','','List','/list','layouts/PageView',NULL,'/list/query-list',0,NULL,'0',9.00,0,'table',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-03-31 22:20:20',0,0,NULL,NULL),('54dd5457a3190740005c1bfec55b1c34','d7d6e2e4e2934f2c9385a623fd98c6f3','Menu Management','/isystem/permission','system/PermissionList',NULL,NULL,1,NULL,'0',1.30,0,NULL,1,1,0,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-12-25 09:36:39',0,0,NULL,0),('58857ff846e61794c69208e9d3a85466','08e6b9dc3c04489c8e1ff2ce6f105aa4','Log Management','/isystem/log','system/LogList',NULL,NULL,1,NULL,'0',2.00,0,'',1,1,0,0,NULL,NULL,NULL,'2018-12-26 10:11:18','admin','2020-09-09 14:48:25',0,0,NULL,0),('58b9204feaf07e47284ddb36cd2d8468','2a470fc0c3954d9dbb61de6d80846549','Image Flip','/jeecg/imgTurnPage','jeecg/ImgTurnPage',NULL,NULL,1,NULL,'0',4.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-25 11:36:42',NULL,NULL,0,0,NULL,NULL),('5c2f42277948043026b7a14692456828','d7d6e2e4e2934f2c9385a623fd98c6f3','My Department','/isystem/departUserList','system/DepartUserList',NULL,NULL,1,NULL,'0',2.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-04-17 15:12:24','admin','2019-12-25 09:35:26',0,0,NULL,0),('5c8042bd6c601270b2bbd9b20bccc68b','','Message Center','/message','layouts/RouteView',NULL,NULL,0,NULL,'0',6.00,0,'message',1,0,NULL,0,NULL,NULL,'admin','2019-04-09 11:05:04','admin','2019-04-11 19:47:54',0,0,NULL,NULL),('6531cf3421b1265aeeeabaab5e176e6d','e3c13679c73a4f829bcff2aba8fd68b1','Step-By-Step Form','/form/step-form','examples/form/stepForm/StepForm',NULL,NULL,1,NULL,'0',2.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('655563cd64b75dcf52ef7bcdd4836953','2a470fc0c3954d9dbb61de6d80846549','Picture Preview','/jeecg/ImagPreview','jeecg/ImagPreview',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-17 11:18:45',NULL,NULL,0,0,NULL,NULL),('65a8f489f25a345836b7f44b1181197a','c65321e57b7949b7a975313220de0422','403','/exception/403','exception/403',NULL,NULL,1,NULL,'0',1.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('6ad53fd1b220989a8b71ff482d683a5a','2a470fc0c3954d9dbb61de6d80846549','One-to-many erp style example','/jeecg/tablist/JeecgOrderDMainList','jeecg/tablist/JeecgOrderDMainList',NULL,NULL,1,NULL,'0',2.00,0,NULL,1,1,0,0,0,NULL,'admin','2019-02-20 14:45:09','admin','2022-01-17 17:02:51',0,0,NULL,0),('6e73eb3c26099c191bf03852ee1310a1','717f6bee46f44a3897eca9abd6e2ec44','Personal settings','/account/settings/BaseSetting','account/settings/Index',NULL,NULL,1,NULL,'0',2.00,1,NULL,1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-04-19 09:41:05',0,0,NULL,NULL),('700b7f95165c46cc7a78bf227aa8fed3','08e6b9dc3c04489c8e1ff2ce6f105aa4','Performance Monitoring','/monitor','layouts/RouteView',NULL,NULL,1,NULL,'0',3.00,0,NULL,1,0,0,0,NULL,NULL,'admin','2019-04-02 11:34:34','admin','2020-09-09 14:48:51',0,0,NULL,0),('717f6bee46f44a3897eca9abd6e2ec44','','Personal Page','/account','layouts/RouteView',NULL,NULL,0,NULL,'0',9.00,0,'user',1,0,0,1,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2020-02-23 22:41:37',0,0,NULL,0),('73678f9daa45ed17a3674131b03432fb','540a2936940846cb98114ffb0d145cb8','List Of Permissions','/list/permission-list','examples/list/PermissionList',NULL,NULL,1,NULL,'0',5.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('7960961b0063228937da5fa8dd73d371','2a470fc0c3954d9dbb61de6d80846549','JEditable Table Example','/jeecg/JEditableTable','jeecg/JeecgEditableTableExample',NULL,NULL,1,NULL,'0',2.10,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-03-22 15:22:18','admin','2019-12-25 09:48:16',0,0,NULL,0),('7ac9eb9ccbde2f7a033cd4944272bf1e','540a2936940846cb98114ffb0d145cb8','Card List','/list/card','examples/list/CardList',NULL,NULL,1,NULL,'0',7.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('841057b8a1bef8f6b4b20f9a618a7fa6','08e6b9dc3c04489c8e1ff2ce6f105aa4','Data Log','/sys/dataLog-list','system/DataLogList',NULL,NULL,1,NULL,'0',2.10,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-03-11 19:26:49','admin','2020-09-09 14:48:32',0,0,NULL,0),('882a73768cfd7f78f3a37584f7299656','6e73eb3c26099c191bf03852ee1310a1','Personalize','/account/settings/custom','account/settings/Custom',NULL,NULL,1,'CustomSettings','0',NULL,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-26 19:00:46',NULL,'2018-12-26 21:13:25',0,0,NULL,NULL),('8b3bff2eee6f1939147f5c68292a1642','700b7f95165c46cc7a78bf227aa8fed3','Server Information','/monitor/SystemInfo','modules/monitor/SystemInfo',NULL,NULL,1,NULL,'0',4.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-02 11:39:19','admin','2019-04-02 15:40:02',0,0,NULL,NULL),('8d1ebd663688965f1fd86a2f0ead3416','700b7f95165c46cc7a78bf227aa8fed3','Redis Monitoring','/monitor/redis/info','modules/monitor/RedisInfo',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-02 13:11:33','admin','2019-05-07 15:18:54',0,0,NULL,NULL),('8d4683aacaa997ab86b966b464360338','e41b69c57a941a3bbcce45032fe57605','Online form development','/online/cgform','modules/online/cgform/OnlCgformHeadList',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,0,NULL,0,NULL,NULL,'admin','2019-03-12 15:48:14','admin','2019-06-11 14:19:17',0,0,NULL,NULL),('8fb8172747a78756c11916216b8b8066','717f6bee46f44a3897eca9abd6e2ec44','Workbench','/dashboard/workplace','dashboard/Workplace',NULL,NULL,1,NULL,'0',3.00,0,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-04-02 11:45:02',0,0,NULL,NULL),('944abf0a8fc22fe1f1154a389a574154','5c8042bd6c601270b2bbd9b20bccc68b','Message Management','/modules/message/sysMessageList','modules/message/SysMessageList',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-09 11:27:53','admin','2019-04-09 19:31:23',0,0,NULL,NULL),('9502685863ab87f0ad1134142788a385','','Home','/dashboard/analysis','dashboard/Analysis',NULL,NULL,0,NULL,'0',0.00,0,'home',1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-03-29 11:04:13',0,0,NULL,NULL),('97c8629abc7848eccdb6d77c24bb3ebb','700b7f95165c46cc7a78bf227aa8fed3','Disk monitoring','/monitor/Disk','modules/monitor/DiskMonitoring',NULL,NULL,1,NULL,'0',6.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-25 14:30:06','admin','2019-05-05 14:37:14',0,0,NULL,NULL),('9a90363f216a6a08f32eecb3f0bf12a3','2a470fc0c3954d9dbb61de6d80846549','Custom Component','/jeecg/SelectDemo','jeecg/SelectDemo',NULL,NULL,1,NULL,'0',0.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-03-19 11:19:05','admin','2019-12-25 09:47:04',0,0,NULL,0),('9cb91b8851db0cf7b19d7ecc2a8193dd','1939e035e803a99ceecb6f5563570fb2','MyTask Form','/modules/bpm/task/form/FormModule','modules/bpm/task/form/FormModule',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-03-08 16:49:05','admin','2019-03-08 18:37:56',0,0,NULL,NULL),('9fe26464838de2ea5e90f2367e35efa0','e41b69c57a941a3bbcce45032fe57605','AUTO Online Report','/online/cgreport/:code','modules/online/cgreport/auto/OnlCgreportAutoList','onlineAutoList',NULL,1,NULL,'0',9.00,0,NULL,1,1,NULL,1,NULL,NULL,'admin','2019-03-12 11:06:48','admin','2019-04-30 18:19:10',0,0,NULL,NULL),('a400e4f4d54f79bf5ce160ae432231af','2a470fc0c3954d9dbb61de6d80846549','JEECG official website','http://www.jeecg.com','layouts/IframePageView',NULL,NULL,1,NULL,'0',4.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-01-29 19:44:06','admin','2019-02-15 16:25:02',0,0,NULL,NULL),('ae4fed059f67086fd52a73d913cf473d','540a2936940846cb98114ffb0d145cb8','Inline edit form','/list/edit-table','examples/list/TableInnerEditList',NULL,NULL,1,NULL,'0',2.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('aedbf679b5773c1f25e9f7b10111da73','08e6b9dc3c04489c8e1ff2ce6f105aa4','SQL Monitoring','{{ window._CONFIG[\'domianURL\'] }}/druid/','layouts/IframePageView',NULL,NULL,1,NULL,'0',3.00,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-01-30 09:43:22','admin','2020-09-09 14:48:38',0,0,NULL,0),('b1cb0a3fedf7ed0e4653cb5a229837ee','08e6b9dc3c04489c8e1ff2ce6f105aa4','Timed Task','/isystem/QuartzJobList','system/QuartzJobList',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,1,0,0,NULL,NULL,NULL,'2019-01-03 09:38:52','admin','2020-09-09 14:48:16',0,0,NULL,0),('b3c824fc22bd953e2eb16ae6914ac8f9','4875ebe289344e14844d8e3ea1edd73f','Advanced Details Page','/profile/advanced','examples/profile/advanced/Advanced',NULL,NULL,1,NULL,'0',2.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('b4dfc7d5dd9e8d5b6dd6d4579b1aa559','c65321e57b7949b7a975313220de0422','500','/exception/500','exception/500',NULL,NULL,1,NULL,'0',3.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('b6bcee2ccc854052d3cc3e9c96d90197','71102b3b87fb07e5527bbd2c530dd90a','Overtime Application','/modules/extbpm/joa/JoaOvertimeList','modules/extbpm/joa/JoaOvertimeList',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-03 15:33:10','admin','2019-04-03 15:34:48',0,0,NULL,NULL),('c431130c0bc0ec71b0a5be37747bb36a','2a470fc0c3954d9dbb61de6d80846549','OneToMany JEditable','/jeecg/JeecgOrderMainListForJEditableTable','jeecg/JeecgOrderMainListForJEditableTable',NULL,NULL,1,NULL,'0',3.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-03-29 10:51:59','admin','2019-04-04 20:09:39',0,0,NULL,NULL),('c65321e57b7949b7a975313220de0422',NULL,'Exception Page','/exception','layouts/RouteView',NULL,NULL,0,NULL,'0',8.00,NULL,'warning',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('c6cf95444d80435eb37b2f9db3971ae6','2a470fc0c3954d9dbb61de6d80846549','Data receipt simulation','/jeecg/InterfaceTest','jeecg/InterfaceTest',NULL,NULL,1,NULL,'0',6.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-02-19 16:02:23','admin','2019-02-21 16:25:45',0,0,NULL,NULL),('cc50656cf9ca528e6f2150eba4714ad2','4875ebe289344e14844d8e3ea1edd73f','Basic Details Page','/profile/basic','examples/profile/basic/Index',NULL,NULL,1,NULL,'0',1.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('d07a2c87a451434c99ab06296727ec4f','700b7f95165c46cc7a78bf227aa8fed3','JVM information','/monitor/JvmInfo','modules/monitor/JvmInfo',NULL,NULL,1,NULL,'0',4.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-01 23:07:48','admin','2019-04-02 11:37:16',0,0,NULL,NULL),('d2bbf9ebca5a8fa2e227af97d2da7548','c65321e57b7949b7a975313220de0422','404','/exception/404','exception/404',NULL,NULL,1,NULL,'0',2.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('d7d6e2e4e2934f2c9385a623fd98c6f3','','System Management','/isystem','layouts/RouteView',NULL,NULL,0,NULL,'0',4.00,0,'setting',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-03-31 22:19:52',0,0,NULL,NULL),('d86f58e7ab516d3bc6bfb1fe10585f97','717f6bee46f44a3897eca9abd6e2ec44','Persona lCenter','/account/center','account/center/Index',NULL,NULL,1,NULL,'0',1.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('de13e0f6328c069748de7399fcc1dbbd','fb07ca05a3e13674dbf6d3245956da2e','Search list (item)','/list/search/project','examples/list/TableList',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-02-12 14:01:40','admin','2019-02-12 14:14:18',0,0,NULL,NULL),('e08cb190ef230d5d4f03824198773950','d7d6e2e4e2934f2c9385a623fd98c6f3','System Notification','/isystem/annountCement','system/SysAnnouncementList',NULL,NULL,1,'annountCement','0',6.00,NULL,'',1,1,NULL,0,NULL,NULL,NULL,'2019-01-02 17:23:01',NULL,'2019-01-02 17:31:23',0,0,NULL,NULL),('e1979bb53e9ea51cecc74d86fd9d2f64','2a470fc0c3954d9dbb61de6d80846549','PDF preview','/jeecg/jeecgPdfView','jeecg/JeecgPdfView',NULL,NULL,1,NULL,'0',3.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-25 10:39:35',NULL,NULL,0,0,NULL,NULL),('e3c13679c73a4f829bcff2aba8fd68b1','','Form Page','/form','layouts/PageView',NULL,NULL,0,NULL,'0',9.00,0,'form',1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-03-31 22:20:14',0,0,NULL,NULL),('e41b69c57a941a3bbcce45032fe57605','','Online Development','/online','layouts/RouteView',NULL,NULL,0,NULL,'0',2.00,0,'cloud',1,0,0,0,NULL,NULL,'admin','2019-03-08 10:43:10','admin','2021-01-24 14:15:12',0,0,NULL,0),('e5973686ed495c379d829ea8b2881fc6','e3c13679c73a4f829bcff2aba8fd68b1','Advanced Form','/form/advanced-form','examples/form/advancedForm/AdvancedForm',NULL,NULL,1,NULL,'0',3.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('e6bfd1fcabfd7942fdd05f076d1dad38','2a470fc0c3954d9dbb61de6d80846549','Print Test','/jeecg/PrintDemo','jeecg/PrintDemo',NULL,NULL,1,NULL,'0',3.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-02-19 15:58:48','admin','2019-05-07 20:14:39',0,0,NULL,NULL),('ebb9d82ea16ad864071158e0c449d186','d7d6e2e4e2934f2c9385a623fd98c6f3','Classification dictionary','/isys/category','system/SysCategoryList',NULL,NULL,1,NULL,'1',5.20,0,NULL,1,1,0,0,NULL,NULL,'admin','2019-05-29 18:48:07','admin','2020-02-23 22:45:33',0,0,'1',0),('ec8d607d0156e198b11853760319c646','6e73eb3c26099c191bf03852ee1310a1','Security Settings','/account/settings/security','account/settings/Security',NULL,NULL,1,'SecuritySettings','0',NULL,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-26 18:59:52',NULL,NULL,0,0,NULL,NULL),('f0675b52d89100ee88472b6800754a08','','Statistical report','/report','layouts/RouteView',NULL,NULL,0,NULL,'0',1.00,0,'bar-chart',1,0,NULL,0,NULL,NULL,'admin','2019-04-03 18:32:02','admin','2019-05-19 18:34:13',0,0,NULL,NULL),('f1cb187abf927c88b89470d08615f5ac','d7d6e2e4e2934f2c9385a623fd98c6f3','Data Dictionary','/isystem/dict','system/DictList',NULL,NULL,1,NULL,'0',5.00,0,NULL,1,1,0,0,NULL,NULL,NULL,'2018-12-28 13:54:43','admin','2020-02-23 22:45:25',0,0,NULL,0),('f23d9bfff4d9aa6b68569ba2cff38415','540a2936940846cb98114ffb0d145cb8','Standard list','/list/basic-list','examples/list/StandardList',NULL,NULL,1,NULL,'0',6.00,NULL,NULL,1,1,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38',NULL,NULL,0,0,NULL,NULL),('f2849d3814fc97993bfc519ae6bbf049','e41b69c57a941a3bbcce45032fe57605','AUTO copy form','/online/copyform/:code','modules/online/cgform/OnlCgformCopyList',NULL,NULL,1,NULL,'1',1.00,0,NULL,1,1,0,1,NULL,NULL,'admin','2019-08-29 16:05:37',NULL,NULL,0,0,'1',NULL),('f780d0d3083d849ccbdb1b1baee4911d','5c8042bd6c601270b2bbd9b20bccc68b','Template management','/modules/message/sysMessageTemplateList','modules/message/SysMessageTemplateList',NULL,NULL,1,NULL,'0',1.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-09 11:50:31','admin','2019-04-12 10:16:34',0,0,NULL,NULL),('fb07ca05a3e13674dbf6d3245956da2e','540a2936940846cb98114ffb0d145cb8','Search List','/list/search','examples/list/search/SearchLayout',NULL,'/list/search/article',1,NULL,'0',8.00,0,NULL,1,0,NULL,0,NULL,NULL,NULL,'2018-12-25 20:34:38','admin','2019-02-12 15:09:13',0,0,NULL,NULL),('fb367426764077dcf94640c843733985','2a470fc0c3954d9dbb61de6d80846549','One-to-many example','/jeecg/JeecgOrderMainList','jeecg/JeecgOrderMainList',NULL,NULL,1,NULL,'0',2.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-02-15 16:24:11','admin','2019-02-18 10:50:14',0,0,NULL,NULL),('fba41089766888023411a978d13c0aa4','e41b69c57a941a3bbcce45032fe57605','AUTO tree form list','/online/cgformTreeList/:code','modules/online/cgform/auto/OnlCgformTreeList',NULL,NULL,1,NULL,'1',9.00,0,NULL,1,1,NULL,1,NULL,NULL,'admin','2019-05-21 14:46:50','admin','2019-06-11 13:52:52',0,0,'1',NULL),('fc810a2267dd183e4ef7c71cc60f4670','700b7f95165c46cc7a78bf227aa8fed3','Request Tracking','/monitor/HttpTrace','modules/monitor/HttpTrace',NULL,NULL,1,NULL,'0',4.00,0,NULL,1,1,NULL,0,NULL,NULL,'admin','2019-04-02 09:46:19','admin','2019-04-02 11:37:27',0,0,NULL,NULL),('fedfbf4420536cacc0218557d263dfea','6e73eb3c26099c191bf03852ee1310a1','New message notification','/account/settings/notification','account/settings/Notification',NULL,NULL,1,'NotificationSettings','0',NULL,NULL,'',1,1,NULL,0,NULL,NULL,NULL,'2018-12-26 19:02:05',NULL,NULL,0,0,NULL,NULL);
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission_data_rule`
--

DROP TABLE IF EXISTS `sys_permission_data_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_permission_data_rule` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ID',
  `permission_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Menu ID',
  `rule_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Rule name',
  `rule_column` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Field',
  `rule_conditions` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'condition',
  `rule_value` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Rule value',
  `status` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Permission valid status 1 has 0 no',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT 'Modification time',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'modified by',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_spdr_permission_id` (`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission_data_rule`
--

LOCK TABLES `sys_permission_data_rule` WRITE;
/*!40000 ALTER TABLE `sys_permission_data_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_permission_data_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_position`
--

DROP TABLE IF EXISTS `sys_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_position` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Job Code',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Job Name',
  `post_rank` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Rank',
  `company_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'company id',
  `create_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Created by',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'modified by',
  `update_time` datetime DEFAULT NULL COMMENT 'Modification time',
  `sys_org_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Organization code',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_position`
--

LOCK TABLES `sys_position` WRITE;
/*!40000 ALTER TABLE `sys_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_quartz_job`
--

DROP TABLE IF EXISTS `sys_quartz_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_quartz_job` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Created by',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `del_flag` int DEFAULT NULL COMMENT 'Delete status',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'modified by',
  `update_time` datetime DEFAULT NULL COMMENT 'Modification time',
  `job_class_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'job class name',
  `cron_expression` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'cron expression',
  `parameter` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'parameter',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'description',
  `status` int DEFAULT NULL COMMENT 'status 0 normal -1 stop',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_quartz_job`
--

LOCK TABLES `sys_quartz_job` WRITE;
/*!40000 ALTER TABLE `sys_quartz_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_quartz_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'primary key id',
  `role_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'role name',
  `role_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'role code',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'description',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Created by',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update by',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_sys_role_role_code` (`role_code`) USING BTREE,
  KEY `idx_sr_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Role table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('1169504891467464705','第三方登录角色','third_role','第三方登录角色','admin','2019-09-05 14:57:49','admin','2020-05-02 18:20:58'),('1260924539346472962','财务出纳','caiwu',NULL,'admin','2020-05-14 21:26:52',NULL,NULL),('e51758fa916c881624b046d26bd09230','人力资源部','hr',NULL,'admin','2019-01-21 18:07:24','admin','2019-10-18 11:39:43'),('ee8626f80f7c2619917b6236f3a7f02b','临时角色','test','这是新建的临时角色123',NULL,'2018-12-20 10:59:04','admin','2019-02-19 15:08:37'),('f6817f48af4fb3af11b9e8bf182f618b','管理员','admin','管理员',NULL,'2018-12-21 18:03:39','admin','2019-05-20 11:40:26');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_permission`
--

DROP TABLE IF EXISTS `sys_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_permission` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'role id',
  `permission_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'permission id',
  `data_rule_ids` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Data authority ids',
  `operate_date` datetime DEFAULT NULL COMMENT 'Operation time',
  `operate_ip` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'operate ip',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_srp_role_per_id` (`role_id`,`permission_id`) USING BTREE,
  KEY `idx_srp_role_id` (`role_id`) USING BTREE,
  KEY `idx_srp_permission_id` (`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Role permission table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_permission`
--

LOCK TABLES `sys_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;
INSERT INTO `sys_role_permission` VALUES ('00b0748f04d3ea52c8cfa179c1c9d384','52b0cf022ac4187b2a70dfa4f8b2d940','d7d6e2e4e2934f2c9385a623fd98c6f3',NULL,NULL,NULL),('00b82058779cca5106fbb84783534c9b','f6817f48af4fb3af11b9e8bf182f618b','4148ec82b6acd69f470bea75fe41c357','',NULL,NULL),('0254c0b25694ad5479e6d6935bbc176e','f6817f48af4fb3af11b9e8bf182f618b','944abf0a8fc22fe1f1154a389a574154',NULL,NULL,NULL),('09bd4fc30ffe88c4a44ed3868f442719','f6817f48af4fb3af11b9e8bf182f618b','e6bfd1fcabfd7942fdd05f076d1dad38',NULL,NULL,NULL),('0c2d2db76ee3aa81a4fe0925b0f31365','f6817f48af4fb3af11b9e8bf182f618b','024f1fd1283dc632458976463d8984e1',NULL,NULL,NULL),('0c6b8facbb1cc874964c87a8cf01e4b1','f6817f48af4fb3af11b9e8bf182f618b','841057b8a1bef8f6b4b20f9a618a7fa6',NULL,NULL,NULL),('0c6e1075e422972083c3e854d9af7851','f6817f48af4fb3af11b9e8bf182f618b','08e6b9dc3c04489c8e1ff2ce6f105aa4',NULL,NULL,NULL),('0d9d14bc66e9d5e99b0280095fdc8587','ee8626f80f7c2619917b6236f3a7f02b','277bfabef7d76e89b33062b16a9a5020',NULL,NULL,NULL),('0dec36b68c234767cd35466efef3b941','ee8626f80f7c2619917b6236f3a7f02b','54dd5457a3190740005c1bfec55b1c34',NULL,NULL,NULL),('0e1469997af2d3b97fff56a59ee29eeb','f6817f48af4fb3af11b9e8bf182f618b','e41b69c57a941a3bbcce45032fe57605',NULL,NULL,NULL),('0f861cb988fdc639bb1ab943471f3a72','f6817f48af4fb3af11b9e8bf182f618b','97c8629abc7848eccdb6d77c24bb3ebb',NULL,NULL,NULL),('105c2ac10741e56a618a82cd58c461d7','e51758fa916c881624b046d26bd09230','1663f3faba244d16c94552f849627d84',NULL,NULL,NULL),('115a6673ae6c0816d3f60de221520274','21c5a3187763729408b40afb0d0fdfa8','63b551e81c5956d5c861593d366d8c57',NULL,NULL,NULL),('1185039870491439105','f6817f48af4fb3af11b9e8bf182f618b','1174506953255182338',NULL,NULL,NULL),('1185039870529187841','f6817f48af4fb3af11b9e8bf182f618b','1174590283938041857',NULL,NULL,NULL),('1185039870537576450','f6817f48af4fb3af11b9e8bf182f618b','1166535831146504193',NULL,NULL,NULL),('1197431682208206850','f6817f48af4fb3af11b9e8bf182f618b','1192318987661234177',NULL,NULL,NULL),('1197795315916271617','f6817f48af4fb3af11b9e8bf182f618b','109c78a583d4693ce2f16551b7786786',NULL,NULL,NULL),('1197795316268593154','f6817f48af4fb3af11b9e8bf182f618b','9fe26464838de2ea5e90f2367e35efa0',NULL,NULL,NULL),('1209423530518761473','f6817f48af4fb3af11b9e8bf182f618b','1205097455226462210',NULL,NULL,NULL),('1209423530594258945','f6817f48af4fb3af11b9e8bf182f618b','1205098241075453953',NULL,NULL,NULL),('1209423530606841858','f6817f48af4fb3af11b9e8bf182f618b','1205306106780364802',NULL,NULL,NULL),('1209423580355481602','f6817f48af4fb3af11b9e8bf182f618b','190c2b43bec6a5f7a4194a85db67d96a',NULL,NULL,NULL),('1209654501558046722','f6817f48af4fb3af11b9e8bf182f618b','f2849d3814fc97993bfc519ae6bbf049',NULL,NULL,NULL),('1231590078632955905','f6817f48af4fb3af11b9e8bf182f618b','1224641973866467330',NULL,NULL,NULL),('1231590078658121729','f6817f48af4fb3af11b9e8bf182f618b','1209731624921534465',NULL,NULL,NULL),('1231590078662316033','f6817f48af4fb3af11b9e8bf182f618b','1229674163694841857',NULL,NULL,NULL),('1232123957949304833','ee8626f80f7c2619917b6236f3a7f02b','f0675b52d89100ee88472b6800754a08',NULL,NULL,NULL),('1232123957978664962','ee8626f80f7c2619917b6236f3a7f02b','1232123780958064642',NULL,NULL,NULL),('1232123957978664963','ee8626f80f7c2619917b6236f3a7f02b','020b06793e4de2eee0007f603000c769',NULL,NULL,NULL),('1232123957987053570','ee8626f80f7c2619917b6236f3a7f02b','2aeddae571695cd6380f6d6d334d6e7d',NULL,NULL,NULL),('1232124727411150850','f6817f48af4fb3af11b9e8bf182f618b','1232123780958064642',NULL,NULL,NULL),('1232125488694104066','ee8626f80f7c2619917b6236f3a7f02b','e41b69c57a941a3bbcce45032fe57605',NULL,NULL,NULL),('1260923306820882434','f6817f48af4fb3af11b9e8bf182f618b','1260923256208216065',NULL,NULL,NULL),('1260923306841853953','f6817f48af4fb3af11b9e8bf182f618b','1260922988733255681',NULL,NULL,NULL),('1260928399955836929','f6817f48af4fb3af11b9e8bf182f618b','1260928341675982849',NULL,NULL,NULL),('1260929736852488194','ee8626f80f7c2619917b6236f3a7f02b','1260929666434318338',NULL,NULL,NULL),('1260931414095937537','ee8626f80f7c2619917b6236f3a7f02b','1260931366557696001',NULL,NULL,NULL),('1269526122208522241','f6817f48af4fb3af11b9e8bf182f618b','1267412134208319489',NULL,NULL,NULL),('126ea9faebeec2b914d6d9bef957afb6','f6817f48af4fb3af11b9e8bf182f618b','f1cb187abf927c88b89470d08615f5ac',NULL,NULL,NULL),('1281494164924653569','f6817f48af4fb3af11b9e8bf182f618b','1280350452934307841',NULL,'2020-07-10 15:43:13','127.0.0.1'),('1281494164945625089','f6817f48af4fb3af11b9e8bf182f618b','1280464606292099074',NULL,'2020-07-10 15:43:13','127.0.0.1'),('1281494684632473602','f6817f48af4fb3af11b9e8bf182f618b','1265162119913824258',NULL,'2020-07-10 15:45:16','127.0.0.1'),('1303585080082485250','f6817f48af4fb3af11b9e8bf182f618b','1287715272999944193',NULL,'2020-09-09 14:44:37','127.0.0.1'),('1303585080103456769','f6817f48af4fb3af11b9e8bf182f618b','1287715783966834689',NULL,'2020-09-09 14:44:37','127.0.0.1'),('1303585080116039682','f6817f48af4fb3af11b9e8bf182f618b','1287716451494510593',NULL,'2020-09-09 14:44:37','127.0.0.1'),('1303585080124428290','f6817f48af4fb3af11b9e8bf182f618b','1287718919049691137',NULL,'2020-09-09 14:44:37','127.0.0.1'),('1303585080128622593','f6817f48af4fb3af11b9e8bf182f618b','1287718938179911682',NULL,'2020-09-09 14:44:37','127.0.0.1'),('1303585080141205506','f6817f48af4fb3af11b9e8bf182f618b','1287718956957810689',NULL,'2020-09-09 14:44:37','127.0.0.1'),('1335960787783098369','f6817f48af4fb3af11b9e8bf182f618b','1335960713267093506',NULL,'2020-12-07 22:54:07','0:0:0:0:0:0:0:1'),('1372092783227596802','f6817f48af4fb3af11b9e8bf182f618b','1352200630711652354',NULL,'2021-03-17 15:49:46','0:0:0:0:0:0:0:1'),('1372092783240179713','f6817f48af4fb3af11b9e8bf182f618b','1365187528377102337',NULL,'2021-03-17 15:49:46','0:0:0:0:0:0:0:1'),('1400734738941505537','f6817f48af4fb3af11b9e8bf182f618b','1400726868091015170',NULL,'2021-06-04 16:42:41','0:0:0:0:0:0:0:1'),('1427184491288727554','f6817f48af4fb3af11b9e8bf182f618b','1404684556047024130',NULL,'2021-08-16 16:24:33','0:0:0:0:0:0:0:1'),('1427184491297116161','f6817f48af4fb3af11b9e8bf182f618b','1387612436586065922',NULL,'2021-08-16 16:24:33','0:0:0:0:0:0:0:1'),('1427184775947751425','ee8626f80f7c2619917b6236f3a7f02b','1352200630711652354',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775956140034','ee8626f80f7c2619917b6236f3a7f02b','1205097455226462210',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775956140035','ee8626f80f7c2619917b6236f3a7f02b','1335960713267093506',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775964528642','ee8626f80f7c2619917b6236f3a7f02b','1205098241075453953',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775964528643','ee8626f80f7c2619917b6236f3a7f02b','1205306106780364802',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775972917250','ee8626f80f7c2619917b6236f3a7f02b','109c78a583d4693ce2f16551b7786786',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775972917251','ee8626f80f7c2619917b6236f3a7f02b','1192318987661234177',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775972917252','ee8626f80f7c2619917b6236f3a7f02b','1224641973866467330',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775977111554','ee8626f80f7c2619917b6236f3a7f02b','1229674163694841857',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775977111555','ee8626f80f7c2619917b6236f3a7f02b','1209731624921534465',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775977111556','ee8626f80f7c2619917b6236f3a7f02b','1304032910990495745',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775977111557','ee8626f80f7c2619917b6236f3a7f02b','190c2b43bec6a5f7a4194a85db67d96a',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775977111558','ee8626f80f7c2619917b6236f3a7f02b','1280350452934307841',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775977111559','ee8626f80f7c2619917b6236f3a7f02b','1174506953255182338',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775977111560','ee8626f80f7c2619917b6236f3a7f02b','5c2f42277948043026b7a14692456828',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775985500162','ee8626f80f7c2619917b6236f3a7f02b','1174590283938041857',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775985500163','ee8626f80f7c2619917b6236f3a7f02b','ebb9d82ea16ad864071158e0c449d186',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775985500164','ee8626f80f7c2619917b6236f3a7f02b','1404684556047024130',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775985500165','ee8626f80f7c2619917b6236f3a7f02b','1265162119913824258',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775989694465','ee8626f80f7c2619917b6236f3a7f02b','841057b8a1bef8f6b4b20f9a618a7fa6',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775989694466','ee8626f80f7c2619917b6236f3a7f02b','700b7f95165c46cc7a78bf227aa8fed3',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775989694467','ee8626f80f7c2619917b6236f3a7f02b','8d1ebd663688965f1fd86a2f0ead3416',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775989694468','ee8626f80f7c2619917b6236f3a7f02b','024f1fd1283dc632458976463d8984e1',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775989694469','ee8626f80f7c2619917b6236f3a7f02b','8b3bff2eee6f1939147f5c68292a1642',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775998083074','ee8626f80f7c2619917b6236f3a7f02b','d07a2c87a451434c99ab06296727ec4f',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775998083075','ee8626f80f7c2619917b6236f3a7f02b','fc810a2267dd183e4ef7c71cc60f4670',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775998083076','ee8626f80f7c2619917b6236f3a7f02b','97c8629abc7848eccdb6d77c24bb3ebb',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775998083077','ee8626f80f7c2619917b6236f3a7f02b','1287715272999944193',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184775998083078','ee8626f80f7c2619917b6236f3a7f02b','1287715783966834689',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776006471682','ee8626f80f7c2619917b6236f3a7f02b','1287716451494510593',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776006471683','ee8626f80f7c2619917b6236f3a7f02b','1287718919049691137',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776006471684','ee8626f80f7c2619917b6236f3a7f02b','1287718938179911682',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776006471685','ee8626f80f7c2619917b6236f3a7f02b','1287718956957810689',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776006471686','ee8626f80f7c2619917b6236f3a7f02b','1166535831146504193',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776006471687','ee8626f80f7c2619917b6236f3a7f02b','9a90363f216a6a08f32eecb3f0bf12a3',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776014860289','ee8626f80f7c2619917b6236f3a7f02b','4356a1a67b564f0988a484f5531fd4d9',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776014860290','ee8626f80f7c2619917b6236f3a7f02b','655563cd64b75dcf52ef7bcdd4836953',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776014860291','ee8626f80f7c2619917b6236f3a7f02b','1365187528377102337',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776014860292','ee8626f80f7c2619917b6236f3a7f02b','6ad53fd1b220989a8b71ff482d683a5a',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776014860293','ee8626f80f7c2619917b6236f3a7f02b','7960961b0063228937da5fa8dd73d371',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776014860294','ee8626f80f7c2619917b6236f3a7f02b','1387612436586065922',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776014860295','ee8626f80f7c2619917b6236f3a7f02b','043780fa095ff1b2bec4dc406d76f023',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776023248897','ee8626f80f7c2619917b6236f3a7f02b','0620e402857b8c5b605e1ad9f4b89350',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776023248898','ee8626f80f7c2619917b6236f3a7f02b','c431130c0bc0ec71b0a5be37747bb36a',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('1427184776023248899','ee8626f80f7c2619917b6236f3a7f02b','e1979bb53e9ea51cecc74d86fd9d2f64',NULL,'2021-08-16 16:25:41','0:0:0:0:0:0:0:1'),('145eac8dd88eddbd4ce0a800ab40a92c','e51758fa916c881624b046d26bd09230','08e6b9dc3c04489c8e1ff2ce6f105aa4',NULL,NULL,NULL),('1496429874513534978','f6817f48af4fb3af11b9e8bf182f618b','1494641317580423169',NULL,'2022-02-23 18:20:59','0:0:0:0:0:0:0:1'),('154edd0599bd1dc2c7de220b489cd1e2','f6817f48af4fb3af11b9e8bf182f618b','7ac9eb9ccbde2f7a033cd4944272bf1e',NULL,NULL,NULL),('165acd6046a0eaf975099f46a3c898ea','f6817f48af4fb3af11b9e8bf182f618b','4f66409ef3bbd69c1d80469d6e2a885e',NULL,NULL,NULL),('1664b92dff13e1575e3a929caa2fa14d','f6817f48af4fb3af11b9e8bf182f618b','d2bbf9ebca5a8fa2e227af97d2da7548',NULL,NULL,NULL),('16ef8ed3865ccc6f6306200760896c50','ee8626f80f7c2619917b6236f3a7f02b','e8af452d8948ea49d37c934f5100ae6a',NULL,NULL,NULL),('17ead5b7d97ed365398ab20009a69ea3','52b0cf022ac4187b2a70dfa4f8b2d940','e08cb190ef230d5d4f03824198773950',NULL,NULL,NULL),('1ac1688ef8456f384091a03d88a89ab1','52b0cf022ac4187b2a70dfa4f8b2d940','693ce69af3432bd00be13c3971a57961',NULL,NULL,NULL),('1af4babaa4227c3cbb830bc5eb513abb','ee8626f80f7c2619917b6236f3a7f02b','e08cb190ef230d5d4f03824198773950',NULL,NULL,NULL),('1ba162bbc2076c25561f8622f610d5bf','ee8626f80f7c2619917b6236f3a7f02b','aedbf679b5773c1f25e9f7b10111da73',NULL,NULL,NULL),('1c1dbba68ef1817e7fb19c822d2854e8','f6817f48af4fb3af11b9e8bf182f618b','fb367426764077dcf94640c843733985',NULL,NULL,NULL),('1c55c4ced20765b8ebab383caa60f0b6','e51758fa916c881624b046d26bd09230','fb367426764077dcf94640c843733985',NULL,NULL,NULL),('1e099baeae01b747d67aca06bdfc34d1','e51758fa916c881624b046d26bd09230','6ad53fd1b220989a8b71ff482d683a5a',NULL,NULL,NULL),('1e47db875601fd97723254046b5bba90','f6817f48af4fb3af11b9e8bf182f618b','baf16b7174bd821b6bab23fa9abb200d',NULL,NULL,NULL),('1fe4d408b85f19618c15bcb768f0ec22','1750a8fb3e6d90cb7957c02de1dc8e59','9502685863ab87f0ad1134142788a385',NULL,NULL,NULL),('20e53c87a785688bdc0a5bb6de394ef1','f6817f48af4fb3af11b9e8bf182f618b','540a2936940846cb98114ffb0d145cb8',NULL,NULL,NULL),('248d288586c6ff3bd14381565df84163','52b0cf022ac4187b2a70dfa4f8b2d940','3f915b2769fc80648e92d04e84ca059d',NULL,NULL,NULL),('25491ecbd5a9b34f09c8bc447a10ede1','f6817f48af4fb3af11b9e8bf182f618b','d07a2c87a451434c99ab06296727ec4f',NULL,NULL,NULL),('25f5443f19c34d99718a016d5f54112e','ee8626f80f7c2619917b6236f3a7f02b','6e73eb3c26099c191bf03852ee1310a1',NULL,NULL,NULL),('27489816708b18859768dfed5945c405','a799c3b1b12dd3ed4bd046bfaef5fe6e','9502685863ab87f0ad1134142788a385',NULL,NULL,NULL),('2779cdea8367fff37db26a42c1a1f531','f6817f48af4fb3af11b9e8bf182f618b','fef097f3903caf3a3c3a6efa8de43fbb',NULL,NULL,NULL),('296f9c75ca0e172ae5ce4c1022c996df','646c628b2b8295fbdab2d34044de0354','732d48f8e0abe99fe6a23d18a3171cd1',NULL,NULL,NULL),('29fb4d37aa29b9fa400f389237cf9fe7','ee8626f80f7c2619917b6236f3a7f02b','05b3c82ddb2536a4a5ee1a4c46b5abef',NULL,NULL,NULL),('29fb6b0ad59a7e911c8d27e0bdc42d23','f6817f48af4fb3af11b9e8bf182f618b','9a90363f216a6a08f32eecb3f0bf12a3',NULL,NULL,NULL),('2ad37346c1b83ddeebc008f6987b2227','f6817f48af4fb3af11b9e8bf182f618b','8d1ebd663688965f1fd86a2f0ead3416',NULL,NULL,NULL),('2c462293cbb0eab7e8ae0a3600361b5f','52b0cf022ac4187b2a70dfa4f8b2d940','9502685863ab87f0ad1134142788a385',NULL,NULL,NULL),('2dc1a0eb5e39aaa131ddd0082a492d76','ee8626f80f7c2619917b6236f3a7f02b','08e6b9dc3c04489c8e1ff2ce6f105aa4',NULL,NULL,NULL),('2ea2382af618ba7d1e80491a0185fb8a','ee8626f80f7c2619917b6236f3a7f02b','f23d9bfff4d9aa6b68569ba2cff38415',NULL,NULL,NULL),('2fcfa2ac3dcfadc7c67107dae9a0de6d','ee8626f80f7c2619917b6236f3a7f02b','73678f9daa45ed17a3674131b03432fb',NULL,NULL,NULL),('2fdaed22dfa4c8d4629e44ef81688c6a','52b0cf022ac4187b2a70dfa4f8b2d940','aedbf679b5773c1f25e9f7b10111da73',NULL,NULL,NULL),('300c462b7fec09e2ff32574ef8b3f0bd','52b0cf022ac4187b2a70dfa4f8b2d940','2a470fc0c3954d9dbb61de6d80846549',NULL,NULL,NULL),('326181da3248a62a05e872119a462be1','ee8626f80f7c2619917b6236f3a7f02b','3f915b2769fc80648e92d04e84ca059d',NULL,NULL,NULL),('3369650f5072b330543f8caa556b1b33','e51758fa916c881624b046d26bd09230','a400e4f4d54f79bf5ce160ae432231af',NULL,NULL,NULL),('35a7e156c20e93aa7e825fe514bf9787','e51758fa916c881624b046d26bd09230','c6cf95444d80435eb37b2f9db3971ae6',NULL,NULL,NULL),('35ac7cae648de39eb56213ca1b649713','52b0cf022ac4187b2a70dfa4f8b2d940','b1cb0a3fedf7ed0e4653cb5a229837ee',NULL,NULL,NULL),('37112f4d372541e105473f18da3dc50d','ee8626f80f7c2619917b6236f3a7f02b','a400e4f4d54f79bf5ce160ae432231af',NULL,NULL,NULL),('37789f70cd8bd802c4a69e9e1f633eaa','ee8626f80f7c2619917b6236f3a7f02b','ae4fed059f67086fd52a73d913cf473d',NULL,NULL,NULL),('381504a717cb3ce77dcd4070c9689a7e','ee8626f80f7c2619917b6236f3a7f02b','4f84f9400e5e92c95f05b554724c2b58',NULL,NULL,NULL),('38a2e55db0960262800576e34b3af44c','f6817f48af4fb3af11b9e8bf182f618b','5c2f42277948043026b7a14692456828',NULL,NULL,NULL),('38dd7a19711e7ffe864232954c06fae9','e51758fa916c881624b046d26bd09230','d2bbf9ebca5a8fa2e227af97d2da7548',NULL,NULL,NULL),('3b1886f727ac503c93fecdd06dcb9622','f6817f48af4fb3af11b9e8bf182f618b','c431130c0bc0ec71b0a5be37747bb36a',NULL,NULL,NULL),('3de2a60c7e42a521fecf6fcc5cb54978','f6817f48af4fb3af11b9e8bf182f618b','2d83d62bd2544b8994c8f38cf17b0ddf',NULL,NULL,NULL),('3e4e38f748b8d87178dd62082e5b7b60','f6817f48af4fb3af11b9e8bf182f618b','7960961b0063228937da5fa8dd73d371',NULL,NULL,NULL),('3e563751942b0879c88ca4de19757b50','1750a8fb3e6d90cb7957c02de1dc8e59','58857ff846e61794c69208e9d3a85466',NULL,NULL,NULL),('3f1d04075e3c3254666a4138106a4e51','f6817f48af4fb3af11b9e8bf182f618b','3fac0d3c9cd40fa53ab70d4c583821f8',NULL,NULL,NULL),('412e2de37a35b3442d68db8dd2f3c190','52b0cf022ac4187b2a70dfa4f8b2d940','f1cb187abf927c88b89470d08615f5ac',NULL,NULL,NULL),('4204f91fb61911ba8ce40afa7c02369f','f6817f48af4fb3af11b9e8bf182f618b','3f915b2769fc80648e92d04e84ca059d',NULL,NULL,NULL),('444126230885d5d38b8fa6072c9f43f8','f6817f48af4fb3af11b9e8bf182f618b','f780d0d3083d849ccbdb1b1baee4911d',NULL,NULL,NULL),('445656dd187bd8a71605f4bbab1938a3','f6817f48af4fb3af11b9e8bf182f618b','020b06793e4de2eee0007f603000c769',NULL,NULL,NULL),('44b5a73541bcb854dd5d38c6d1fb93a1','ee8626f80f7c2619917b6236f3a7f02b','418964ba087b90a84897b62474496b93',NULL,NULL,NULL),('455cdb482457f529b79b479a2ff74427','f6817f48af4fb3af11b9e8bf182f618b','e1979bb53e9ea51cecc74d86fd9d2f64',NULL,NULL,NULL),('459aa2e7021b435b4d65414cfbc71c66','e51758fa916c881624b046d26bd09230','4148ec82b6acd69f470bea75fe41c357',NULL,NULL,NULL),('45a358bb738782d1a0edbf7485e81459','f6817f48af4fb3af11b9e8bf182f618b','0ac2ad938963b6c6d1af25477d5b8b51',NULL,NULL,NULL),('4c0940badae3ef9231ee9d042338f2a4','e51758fa916c881624b046d26bd09230','2a470fc0c3954d9dbb61de6d80846549',NULL,NULL,NULL),('4d56ce2f67c94b74a1d3abdbea340e42','ee8626f80f7c2619917b6236f3a7f02b','d86f58e7ab516d3bc6bfb1fe10585f97',NULL,NULL,NULL),('4dab5a06acc8ef3297889872caa74747','f6817f48af4fb3af11b9e8bf182f618b','ffb423d25cc59dcd0532213c4a518261',NULL,NULL,NULL),('4e0a37ed49524df5f08fc6593aee875c','f6817f48af4fb3af11b9e8bf182f618b','f23d9bfff4d9aa6b68569ba2cff38415',NULL,NULL,NULL),('4ea403fc1d19feb871c8bdd9f94a4ecc','f6817f48af4fb3af11b9e8bf182f618b','2e42e3835c2b44ec9f7bc26c146ee531',NULL,NULL,NULL),('4f254549d9498f06f4cc9b23f3e2c070','f6817f48af4fb3af11b9e8bf182f618b','93d5cfb4448f11e9916698e7f462b4b6',NULL,NULL,NULL),('4faad8ff93cb2b5607cd3d07c1b624ee','a799c3b1b12dd3ed4bd046bfaef5fe6e','70b8f33da5f39de1981bf89cf6c99792',NULL,NULL,NULL),('504e326de3f03562cdd186748b48a8c7','f6817f48af4fb3af11b9e8bf182f618b','027aee69baee98a0ed2e01806e89c891',NULL,NULL,NULL),('520b5989e6fe4a302a573d4fee12a40a','f6817f48af4fb3af11b9e8bf182f618b','6531cf3421b1265aeeeabaab5e176e6d',NULL,NULL,NULL),('54fdf85e52807bdb32ce450814abc256','f6817f48af4fb3af11b9e8bf182f618b','cc50656cf9ca528e6f2150eba4714ad2',NULL,NULL,NULL),('57c0b3a547b815ea3ec8e509b08948b3','1750a8fb3e6d90cb7957c02de1dc8e59','3f915b2769fc80648e92d04e84ca059d',NULL,NULL,NULL),('593ee05c4fe4645c7826b7d5e14f23ec','52b0cf022ac4187b2a70dfa4f8b2d940','8fb8172747a78756c11916216b8b8066',NULL,NULL,NULL),('5affc85021fcba07d81c09a6fdfa8dc6','ee8626f80f7c2619917b6236f3a7f02b','078f9558cdeab239aecb2bda1a8ed0d1',NULL,NULL,NULL),('5d230e6cd2935c4117f6cb9a7a749e39','f6817f48af4fb3af11b9e8bf182f618b','fc810a2267dd183e4ef7c71cc60f4670',NULL,NULL,NULL),('5de6871fadb4fe1cdd28989da0126b07','f6817f48af4fb3af11b9e8bf182f618b','a400e4f4d54f79bf5ce160a3432231af',NULL,NULL,NULL),('5e4015a9a641cbf3fb5d28d9f885d81a','f6817f48af4fb3af11b9e8bf182f618b','2dbbafa22cda07fa5d169d741b81fe12',NULL,NULL,NULL),('5e634a89f75b7a421c02aecfd520325f','e51758fa916c881624b046d26bd09230','339329ed54cf255e1f9392e84f136901',NULL,NULL,NULL),('5e74637c4bec048d1880ad0bd1b00552','e51758fa916c881624b046d26bd09230','a400e4f4d54f79bf5ce160a3432231af',NULL,NULL,NULL),('5fc194b709336d354640fe29fefd65a3','a799c3b1b12dd3ed4bd046bfaef5fe6e','9ba60e626bf2882c31c488aba62b89f0',NULL,NULL,NULL),('60eda4b4db138bdb47edbe8e10e71675','f6817f48af4fb3af11b9e8bf182f618b','fb07ca05a3e13674dbf6d3245956da2e',NULL,NULL,NULL),('61835e48f3e675f7d3f5c9dd3a10dcf3','f6817f48af4fb3af11b9e8bf182f618b','f0675b52d89100ee88472b6800754a08',NULL,NULL,NULL),('6451dac67ba4acafb570fd6a03f47460','ee8626f80f7c2619917b6236f3a7f02b','e3c13679c73a4f829bcff2aba8fd68b1',NULL,NULL,NULL),('660fbc40bcb1044738f7cabdf1708c28','f6817f48af4fb3af11b9e8bf182f618b','b3c824fc22bd953e2eb16ae6914ac8f9',NULL,NULL,NULL),('66b202f8f84fe766176b3f51071836ef','f6817f48af4fb3af11b9e8bf182f618b','1367a93f2c410b169faa7abcbad2f77c',NULL,NULL,NULL),('6b605c261ffbc8ac8a98ae33579c8c78','f6817f48af4fb3af11b9e8bf182f618b','fba41089766888023411a978d13c0aa4',NULL,NULL,NULL),('6c43fd3f10fdaf2a0646434ae68709b5','ee8626f80f7c2619917b6236f3a7f02b','540a2936940846cb98114ffb0d145cb8',NULL,NULL,NULL),('6c74518eb6bb9a353f6a6c459c77e64b','f6817f48af4fb3af11b9e8bf182f618b','b4dfc7d5dd9e8d5b6dd6d4579b1aa559',NULL,NULL,NULL),('6daddafacd7eccb91309530c17c5855d','f6817f48af4fb3af11b9e8bf182f618b','edfa74d66e8ea63ea432c2910837b150',NULL,NULL,NULL),('6fb4c2142498dd6d5b6c014ef985cb66','f6817f48af4fb3af11b9e8bf182f618b','6e73eb3c26099c191bf03852ee1310a1',NULL,NULL,NULL),('71a5f54a90aa8c7a250a38b7dba39f6f','ee8626f80f7c2619917b6236f3a7f02b','8fb8172747a78756c11916216b8b8066',NULL,NULL,NULL),('737d35f582036cd18bfd4c8e5748eaa4','e51758fa916c881624b046d26bd09230','693ce69af3432bd00be13c3971a57961',NULL,NULL,NULL),('7413acf23b56c906aedb5a36fb75bd3a','f6817f48af4fb3af11b9e8bf182f618b','a4fc7b64b01a224da066bb16230f9c5a',NULL,NULL,NULL),('75002588591820806','16457350655250432','5129710648430592',NULL,NULL,NULL),('75002588604403712','16457350655250432','5129710648430593',NULL,NULL,NULL),('75002588612792320','16457350655250432','40238597734928384',NULL,NULL,NULL),('75002588625375232','16457350655250432','57009744761589760',NULL,NULL,NULL),('75002588633763840','16457350655250432','16392452747300864',NULL,NULL,NULL),('75002588637958144','16457350655250432','16392767785668608',NULL,NULL,NULL),('75002588650541056','16457350655250432','16439068543946752',NULL,NULL,NULL),('76a54a8cc609754360bf9f57e7dbb2db','f6817f48af4fb3af11b9e8bf182f618b','c65321e57b7949b7a975313220de0422',NULL,NULL,NULL),('77277779875336192','496138616573952','5129710648430592',NULL,NULL,NULL),('77277780043108352','496138616573952','5129710648430593',NULL,NULL,NULL),('77277780055691264','496138616573952','15701400130424832',NULL,NULL,NULL),('77277780064079872','496138616573952','16678126574637056',NULL,NULL,NULL),('77277780072468480','496138616573952','15701915807518720',NULL,NULL,NULL),('77277780076662784','496138616573952','15708892205944832',NULL,NULL,NULL),('77277780085051392','496138616573952','16678447719911424',NULL,NULL,NULL),('77277780089245696','496138616573952','25014528525733888',NULL,NULL,NULL),('77277780097634304','496138616573952','56898976661639168',NULL,NULL,NULL),('77277780135383040','496138616573952','40238597734928384',NULL,NULL,NULL),('77277780139577344','496138616573952','45235621697949696',NULL,NULL,NULL),('77277780147965952','496138616573952','45235787867885568',NULL,NULL,NULL),('77277780156354560','496138616573952','45235939278065664',NULL,NULL,NULL),('77277780164743168','496138616573952','43117268627886080',NULL,NULL,NULL),('77277780168937472','496138616573952','45236734832676864',NULL,NULL,NULL),('77277780181520384','496138616573952','45237010692050944',NULL,NULL,NULL),('77277780189908992','496138616573952','45237170029465600',NULL,NULL,NULL),('77277780198297600','496138616573952','57009544286441472',NULL,NULL,NULL),('77277780206686208','496138616573952','57009744761589760',NULL,NULL,NULL),('77277780215074816','496138616573952','57009981228060672',NULL,NULL,NULL),('77277780219269120','496138616573952','56309618086776832',NULL,NULL,NULL),('77277780227657728','496138616573952','57212882168844288',NULL,NULL,NULL),('77277780236046336','496138616573952','61560041605435392',NULL,NULL,NULL),('77277780244434944','496138616573952','61560275261722624',NULL,NULL,NULL),('77277780257017856','496138616573952','61560480518377472',NULL,NULL,NULL),('77277780265406464','496138616573952','44986029924421632',NULL,NULL,NULL),('77277780324126720','496138616573952','45235228800716800',NULL,NULL,NULL),('77277780332515328','496138616573952','45069342940860416',NULL,NULL,NULL),('77277780340903937','496138616573952','5129710648430594',NULL,NULL,NULL),('77277780349292544','496138616573952','16687383932047360',NULL,NULL,NULL),('77277780357681152','496138616573952','16689632049631232',NULL,NULL,NULL),('77277780366069760','496138616573952','16689745006432256',NULL,NULL,NULL),('77277780370264064','496138616573952','16689883993083904',NULL,NULL,NULL),('77277780374458369','496138616573952','16690313745666048',NULL,NULL,NULL),('77277780387041280','496138616573952','5129710648430595',NULL,NULL,NULL),('77277780395429888','496138616573952','16694861252005888',NULL,NULL,NULL),('77277780403818496','496138616573952','16695107491205120',NULL,NULL,NULL),('77277780412207104','496138616573952','16695243126607872',NULL,NULL,NULL),('77277780420595712','496138616573952','75002207560273920',NULL,NULL,NULL),('77277780428984320','496138616573952','76215889006956544',NULL,NULL,NULL),('77277780433178624','496138616573952','76216071333351424',NULL,NULL,NULL),('77277780441567232','496138616573952','76216264070008832',NULL,NULL,NULL),('77277780449955840','496138616573952','76216459709124608',NULL,NULL,NULL),('77277780458344448','496138616573952','76216594207870976',NULL,NULL,NULL),('77277780466733056','496138616573952','76216702639017984',NULL,NULL,NULL),('77277780475121664','496138616573952','58480609315524608',NULL,NULL,NULL),('77277780483510272','496138616573952','61394706252173312',NULL,NULL,NULL),('77277780491898880','496138616573952','61417744146370560',NULL,NULL,NULL),('77277780496093184','496138616573952','76606430504816640',NULL,NULL,NULL),('77277780504481792','496138616573952','76914082455752704',NULL,NULL,NULL),('77277780508676097','496138616573952','76607201262702592',NULL,NULL,NULL),('77277780517064704','496138616573952','39915540965232640',NULL,NULL,NULL),('77277780525453312','496138616573952','41370251991977984',NULL,NULL,NULL),('77277780538036224','496138616573952','45264987354042368',NULL,NULL,NULL),('77277780546424832','496138616573952','45265487029866496',NULL,NULL,NULL),('77277780554813440','496138616573952','45265762415284224',NULL,NULL,NULL),('77277780559007744','496138616573952','45265886315024384',NULL,NULL,NULL),('77277780567396352','496138616573952','45266070000373760',NULL,NULL,NULL),('77277780571590656','496138616573952','41363147411427328',NULL,NULL,NULL),('77277780579979264','496138616573952','41363537456533504',NULL,NULL,NULL),('77277780588367872','496138616573952','41364927394353152',NULL,NULL,NULL),('77277780596756480','496138616573952','41371711400054784',NULL,NULL,NULL),('77277780605145088','496138616573952','41469219249852416',NULL,NULL,NULL),('77277780613533696','496138616573952','39916171171991552',NULL,NULL,NULL),('77277780621922304','496138616573952','39918482854252544',NULL,NULL,NULL),('77277780630310912','496138616573952','41373430515240960',NULL,NULL,NULL),('77277780718391296','496138616573952','41375330996326400',NULL,NULL,NULL),('77277780722585600','496138616573952','63741744973352960',NULL,NULL,NULL),('77277780730974208','496138616573952','42082442672082944',NULL,NULL,NULL),('77277780739362816','496138616573952','41376192166629376',NULL,NULL,NULL),('77277780747751424','496138616573952','41377034236071936',NULL,NULL,NULL),('77277780756140032','496138616573952','56911328312299520',NULL,NULL,NULL),('77277780764528640','496138616573952','41378916912336896',NULL,NULL,NULL),('77277780768722944','496138616573952','63482475359244288',NULL,NULL,NULL),('77277780772917249','496138616573952','64290663792906240',NULL,NULL,NULL),('77277780785500160','496138616573952','66790433014943744',NULL,NULL,NULL),('77277780789694464','496138616573952','42087054753927168',NULL,NULL,NULL),('77277780798083072','496138616573952','67027338952445952',NULL,NULL,NULL),('77277780806471680','496138616573952','67027909637836800',NULL,NULL,NULL),('77277780810665985','496138616573952','67042515441684480',NULL,NULL,NULL),('77277780823248896','496138616573952','67082402312228864',NULL,NULL,NULL),('77277780827443200','496138616573952','16392452747300864',NULL,NULL,NULL),('77277780835831808','496138616573952','16392767785668608',NULL,NULL,NULL),('77277780840026112','496138616573952','16438800255291392',NULL,NULL,NULL),('77277780844220417','496138616573952','16438962738434048',NULL,NULL,NULL),('77277780852609024','496138616573952','16439068543946752',NULL,NULL,NULL),('77277860062040064','496138616573953','5129710648430592',NULL,NULL,NULL),('77277860070428672','496138616573953','5129710648430593',NULL,NULL,NULL),('77277860078817280','496138616573953','40238597734928384',NULL,NULL,NULL),('77277860091400192','496138616573953','43117268627886080',NULL,NULL,NULL),('77277860099788800','496138616573953','57009744761589760',NULL,NULL,NULL),('77277860112371712','496138616573953','56309618086776832',NULL,NULL,NULL),('77277860120760320','496138616573953','44986029924421632',NULL,NULL,NULL),('77277860129148928','496138616573953','5129710648430594',NULL,NULL,NULL),('77277860141731840','496138616573953','5129710648430595',NULL,NULL,NULL),('77277860150120448','496138616573953','75002207560273920',NULL,NULL,NULL),('77277860158509056','496138616573953','58480609315524608',NULL,NULL,NULL),('77277860162703360','496138616573953','76606430504816640',NULL,NULL,NULL),('77277860171091968','496138616573953','76914082455752704',NULL,NULL,NULL),('77277860179480576','496138616573953','76607201262702592',NULL,NULL,NULL),('77277860187869184','496138616573953','39915540965232640',NULL,NULL,NULL),('77277860196257792','496138616573953','41370251991977984',NULL,NULL,NULL),('77277860204646400','496138616573953','41363147411427328',NULL,NULL,NULL),('77277860208840704','496138616573953','41371711400054784',NULL,NULL,NULL),('77277860213035009','496138616573953','39916171171991552',NULL,NULL,NULL),('77277860221423616','496138616573953','39918482854252544',NULL,NULL,NULL),('77277860225617920','496138616573953','41373430515240960',NULL,NULL,NULL),('77277860234006528','496138616573953','41375330996326400',NULL,NULL,NULL),('77277860242395136','496138616573953','63741744973352960',NULL,NULL,NULL),('77277860250783744','496138616573953','42082442672082944',NULL,NULL,NULL),('77277860254978048','496138616573953','41376192166629376',NULL,NULL,NULL),('77277860263366656','496138616573953','41377034236071936',NULL,NULL,NULL),('77277860271755264','496138616573953','56911328312299520',NULL,NULL,NULL),('77277860313698304','496138616573953','41378916912336896',NULL,NULL,NULL),('77277860322086912','496138616573953','63482475359244288',NULL,NULL,NULL),('77277860326281216','496138616573953','64290663792906240',NULL,NULL,NULL),('77277860334669824','496138616573953','66790433014943744',NULL,NULL,NULL),('77277860343058432','496138616573953','42087054753927168',NULL,NULL,NULL),('77277860347252736','496138616573953','67027338952445952',NULL,NULL,NULL),('77277860351447041','496138616573953','67027909637836800',NULL,NULL,NULL),('77277860359835648','496138616573953','67042515441684480',NULL,NULL,NULL),('77277860364029952','496138616573953','67082402312228864',NULL,NULL,NULL),('77277860368224256','496138616573953','16392452747300864',NULL,NULL,NULL),('77277860372418560','496138616573953','16392767785668608',NULL,NULL,NULL),('77277860376612865','496138616573953','16438800255291392',NULL,NULL,NULL),('77277860385001472','496138616573953','16438962738434048',NULL,NULL,NULL),('77277860389195776','496138616573953','16439068543946752',NULL,NULL,NULL),('7750f9be48ee09cd561fce718219a3e2','ee8626f80f7c2619917b6236f3a7f02b','882a73768cfd7f78f3a37584f7299656',NULL,NULL,NULL),('7a5d31ba48fe3fb1266bf186dc5f7ba7','52b0cf022ac4187b2a70dfa4f8b2d940','58857ff846e61794c69208e9d3a85466',NULL,NULL,NULL),('7a6bca9276c128309c80d21e795c66c6','f6817f48af4fb3af11b9e8bf182f618b','54097c6a3cf50fad0793a34beff1efdf',NULL,NULL,NULL),('7ca833caa5eac837b7200d8b6de8b2e3','f6817f48af4fb3af11b9e8bf182f618b','fedfbf4420536cacc0218557d263dfea',NULL,NULL,NULL),('7d2ea745950be3357747ec7750c31c57','ee8626f80f7c2619917b6236f3a7f02b','2a470fc0c3954d9dbb61de6d80846549',NULL,NULL,NULL),('7de42bdc0b8c5446b7d428c66a7abc12','52b0cf022ac4187b2a70dfa4f8b2d940','54dd5457a3190740005c1bfec55b1c34',NULL,NULL,NULL),('7e19d90cec0dd87aaef351b9ff8f4902','646c628b2b8295fbdab2d34044de0354','f9d3f4f27653a71c52faa9fb8070fbe7',NULL,NULL,NULL),('7f862c47003eb20e8bad05f506371f92','ee8626f80f7c2619917b6236f3a7f02b','d7d6e2e4e2934f2c9385a623fd98c6f3',NULL,NULL,NULL),('812ed54661b1a24b81b58974691a73f5','e51758fa916c881624b046d26bd09230','e6bfd1fcabfd7942fdd05f076d1dad38',NULL,NULL,NULL),('83f704524b21b6a3ae324b8736c65333','ee8626f80f7c2619917b6236f3a7f02b','7ac9eb9ccbde2f7a033cd4944272bf1e',NULL,NULL,NULL),('84d32474316a43b01256d6644e6e7751','ee8626f80f7c2619917b6236f3a7f02b','ec8d607d0156e198b11853760319c646',NULL,NULL,NULL),('84eac2f113c23737128fb099d1d1da89','f6817f48af4fb3af11b9e8bf182f618b','03dc3d93261dda19fc86dd7ca486c6cf',NULL,NULL,NULL),('85755a6c0bdff78b3860b52d35310c7f','e51758fa916c881624b046d26bd09230','c65321e57b7949b7a975313220de0422',NULL,NULL,NULL),('86060e2867a5049d8a80d9fe5d8bc28b','f6817f48af4fb3af11b9e8bf182f618b','765dd244f37b804e3d00f475fd56149b',NULL,NULL,NULL),('8703a2410cddb713c33232ce16ec04b9','ee8626f80f7c2619917b6236f3a7f02b','1367a93f2c410b169faa7abcbad2f77c',NULL,NULL,NULL),('884f147c20e003cc80ed5b7efa598cbe','f6817f48af4fb3af11b9e8bf182f618b','e5973686ed495c379d829ea8b2881fc6',NULL,NULL,NULL),('885c1a827383e5b2c6c4f8ca72a7b493','ee8626f80f7c2619917b6236f3a7f02b','4148ec82b6acd69f470bea75fe41c357','',NULL,NULL),('8a60df8d8b4c9ee5fa63f48aeee3ec00','1750a8fb3e6d90cb7957c02de1dc8e59','d7d6e2e4e2934f2c9385a623fd98c6f3',NULL,NULL,NULL),('8b09925bdc194ab7f3559cd3a7ea0507','f6817f48af4fb3af11b9e8bf182f618b','ebb9d82ea16ad864071158e0c449d186',NULL,NULL,NULL),('8b1e326791375f325d3e6b797753b65e','ee8626f80f7c2619917b6236f3a7f02b','2dbbafa22cda07fa5d169d741b81fe12',NULL,NULL,NULL),('8ce1022dac4e558ff9694600515cf510','1750a8fb3e6d90cb7957c02de1dc8e59','08e6b9dc3c04489c8e1ff2ce6f105aa4',NULL,NULL,NULL),('8d154c2382a8ae5c8d1b84bd38df2a93','f6817f48af4fb3af11b9e8bf182f618b','d86f58e7ab516d3bc6bfb1fe10585f97',NULL,NULL,NULL),('8d848ca7feec5b7ebb3ecb32b2c8857a','52b0cf022ac4187b2a70dfa4f8b2d940','4148ec82b6acd69f470bea75fe41c357',NULL,NULL,NULL),('8dd64f65a1014196078d0882f767cd85','f6817f48af4fb3af11b9e8bf182f618b','e3c13679c73a4f829bcff2aba8fd68b1',NULL,NULL,NULL),('8e3dc1671abad4f3c83883b194d2e05a','f6817f48af4fb3af11b9e8bf182f618b','b1cb0a3fedf7ed0e4653cb5a229837ee',NULL,NULL,NULL),('8eec2c510f1ac9c5eee26c041b1f00ca','ee8626f80f7c2619917b6236f3a7f02b','58857ff846e61794c69208e9d3a85466',NULL,NULL,NULL),('8f762ff80253f634b08cf59a77742ba4','ee8626f80f7c2619917b6236f3a7f02b','9502685863ab87f0ad1134142788a385',NULL,NULL,NULL),('903b790e6090414343502c6dc393b7c9','ee8626f80f7c2619917b6236f3a7f02b','de13e0f6328c069748de7399fcc1dbbd',NULL,NULL,NULL),('905bf419332ebcb83863603b3ebe30f0','f6817f48af4fb3af11b9e8bf182f618b','8fb8172747a78756c11916216b8b8066',NULL,NULL,NULL),('90996d56357730e173e636b99fc48bea','ee8626f80f7c2619917b6236f3a7f02b','fb07ca05a3e13674dbf6d3245956da2e',NULL,NULL,NULL),('90e1c607a0631364eec310f3cc4acebd','ee8626f80f7c2619917b6236f3a7f02b','4f66409ef3bbd69c1d80469d6e2a885e',NULL,NULL,NULL),('9264104cee9b10c96241d527b2d0346d','1750a8fb3e6d90cb7957c02de1dc8e59','54dd5457a3190740005c1bfec55b1c34',NULL,NULL,NULL),('9380121ca9cfee4b372194630fce150e','f6817f48af4fb3af11b9e8bf182f618b','65a8f489f25a345836b7f44b1181197a',NULL,NULL,NULL),('94911fef73a590f6824105ebf9b6cab3','f6817f48af4fb3af11b9e8bf182f618b','8b3bff2eee6f1939147f5c68292a1642',NULL,NULL,NULL),('9700d20dbc1ae3cbf7de1c810b521fe6','f6817f48af4fb3af11b9e8bf182f618b','ec8d607d0156e198b11853760319c646',NULL,NULL,NULL),('980171fda43adfe24840959b1d048d4d','f6817f48af4fb3af11b9e8bf182f618b','d7d6e2e4e2934f2c9385a623fd98c6f3',NULL,NULL,NULL),('987c23b70873bd1d6dca52f30aafd8c2','f6817f48af4fb3af11b9e8bf182f618b','00a2a0ae65cdca5e93209cdbde97cbe6',NULL,NULL,NULL),('98f02353f91dd569e3c6b8fd6b4f4034','ee8626f80f7c2619917b6236f3a7f02b','6531cf3421b1265aeeeabaab5e176e6d',NULL,NULL,NULL),('9b2ad767f9861e64a20b097538feafd3','f6817f48af4fb3af11b9e8bf182f618b','73678f9daa45ed17a3674131b03432fb',NULL,NULL,NULL),('9d8772c310b675ae43eacdbc6c7fa04a','a799c3b1b12dd3ed4bd046bfaef5fe6e','1663f3faba244d16c94552f849627d84',NULL,NULL,NULL),('9d980ec0489040e631a9c24a6af42934','f6817f48af4fb3af11b9e8bf182f618b','05b3c82ddb2536a4a5ee1a4c46b5abef',NULL,NULL,NULL),('9f8311ecccd44e079723098cf2ffe1cc','1750a8fb3e6d90cb7957c02de1dc8e59','693ce69af3432bd00be13c3971a57961',NULL,NULL,NULL),('a034ed7c38c996b880d3e78f586fe0ae','f6817f48af4fb3af11b9e8bf182f618b','c89018ea6286e852b424466fd92a2ffc',NULL,NULL,NULL),('a098e2acc3f90316f161f6648d085640','ee8626f80f7c2619917b6236f3a7f02b','e6bfd1fcabfd7942fdd05f076d1dad38',NULL,NULL,NULL),('a307a9349ad64a2eff8ab69582fa9be4','f6817f48af4fb3af11b9e8bf182f618b','0620e402857b8c5b605e1ad9f4b89350',NULL,NULL,NULL),('a5d25fdb3c62904a8474182706ce11a0','f6817f48af4fb3af11b9e8bf182f618b','418964ba087b90a84897b62474496b93',NULL,NULL,NULL),('a66feaaf128417ad762e946abccf27ec','ee8626f80f7c2619917b6236f3a7f02b','c6cf95444d80435eb37b2f9db3971ae6',NULL,NULL,NULL),('a72c31a3913c736d4eca11d13be99183','e51758fa916c881624b046d26bd09230','a44c30db536349e91106223957e684eb',NULL,NULL,NULL),('a7ab87eac0f8fafa2efa4b1f9351923f','ee8626f80f7c2619917b6236f3a7f02b','fedfbf4420536cacc0218557d263dfea',NULL,NULL,NULL),('abdc324a2df9f13ee6e73d44c6e62bc8','ee8626f80f7c2619917b6236f3a7f02b','f1cb187abf927c88b89470d08615f5ac',NULL,NULL,NULL),('acacce4417e5d7f96a9c3be2ded5b4be','f6817f48af4fb3af11b9e8bf182f618b','f9d3f4f27653a71c52faa9fb8070fbe7',NULL,NULL,NULL),('ae1852fb349d8513eb3fdc173da3ee56','f6817f48af4fb3af11b9e8bf182f618b','8d4683aacaa997ab86b966b464360338',NULL,NULL,NULL),('aefc8c22e061171806e59cd222f6b7e1','52b0cf022ac4187b2a70dfa4f8b2d940','e8af452d8948ea49d37c934f5100ae6a',NULL,NULL,NULL),('af60ac8fafd807ed6b6b354613b9ccbc','f6817f48af4fb3af11b9e8bf182f618b','58857ff846e61794c69208e9d3a85466',NULL,NULL,NULL),('b0c8a20800b8bf1ebdd7be473bceb44f','f6817f48af4fb3af11b9e8bf182f618b','58b9204feaf07e47284ddb36cd2d8468',NULL,NULL,NULL),('b128ebe78fa5abb54a3a82c6689bdca3','f6817f48af4fb3af11b9e8bf182f618b','aedbf679b5773c1f25e9f7b10111da73',NULL,NULL,NULL),('b131ebeafcfd059f3c7e542606ea9ff5','ee8626f80f7c2619917b6236f3a7f02b','e5973686ed495c379d829ea8b2881fc6',NULL,NULL,NULL),('b21b07951bb547b09cc85624a841aea0','f6817f48af4fb3af11b9e8bf182f618b','4356a1a67b564f0988a484f5531fd4d9',NULL,NULL,NULL),('b2b2dcfff6986d3d7f890ea62d474651','ee8626f80f7c2619917b6236f3a7f02b','200006f0edf145a2b50eacca07585451',NULL,NULL,NULL),('b495a46fa0e0d4637abe0db7fd12fe1a','ee8626f80f7c2619917b6236f3a7f02b','717f6bee46f44a3897eca9abd6e2ec44',NULL,NULL,NULL),('b64c4ab9cd9a2ea8ac1e9db5fb7cf522','f6817f48af4fb3af11b9e8bf182f618b','2aeddae571695cd6380f6d6d334d6e7d',NULL,NULL,NULL),('bbec16ad016efec9ea2def38f4d3d9dc','f6817f48af4fb3af11b9e8bf182f618b','13212d3416eb690c2e1d5033166ff47a',NULL,NULL,NULL),('bd30561f141f07827b836878137fddd8','e51758fa916c881624b046d26bd09230','65a8f489f25a345836b7f44b1181197a',NULL,NULL,NULL),('be8e5a9080569e59863f20c4c57a8e22','f6817f48af4fb3af11b9e8bf182f618b','22d6a3d39a59dd7ea9a30acfa6bfb0a5',NULL,NULL,NULL),('bea2986432079d89203da888d99b3f16','f6817f48af4fb3af11b9e8bf182f618b','54dd5457a3190740005c1bfec55b1c34',NULL,NULL,NULL),('c09373ebfc73fb5740db5ff02cba4f91','f6817f48af4fb3af11b9e8bf182f618b','339329ed54cf255e1f9392e84f136901',NULL,NULL,NULL),('c56fb1658ee5f7476380786bf5905399','f6817f48af4fb3af11b9e8bf182f618b','de13e0f6328c069748de7399fcc1dbbd',NULL,NULL,NULL),('c689539d20a445b0896270290c58d01f','e51758fa916c881624b046d26bd09230','13212d3416eb690c2e1d5033166ff47a',NULL,NULL,NULL),('c6fee38d293b9d0596436a0cbd205070','f6817f48af4fb3af11b9e8bf182f618b','4f84f9400e5e92c95f05b554724c2b58',NULL,NULL,NULL),('c8571839e6b14796e661f3e2843b80b6','ee8626f80f7c2619917b6236f3a7f02b','45c966826eeff4c99b8f8ebfe74511fc',NULL,NULL,NULL),('c90b0b01c7ca454d2a1cb7408563e696','f6817f48af4fb3af11b9e8bf182f618b','882a73768cfd7f78f3a37584f7299656',NULL,NULL,NULL),('c9d35261cccd67ab2932107a0967a7d7','e51758fa916c881624b046d26bd09230','b4dfc7d5dd9e8d5b6dd6d4579b1aa559',NULL,NULL,NULL),('ced80e43584ce15e97bb07298e93020d','e51758fa916c881624b046d26bd09230','45c966826eeff4c99b8f8ebfe74511fc',NULL,NULL,NULL),('cf1feb1bf69eafc982295ad6c9c8d698','f6817f48af4fb3af11b9e8bf182f618b','a2b11669e98c5fe54a53c3e3c4f35d14',NULL,NULL,NULL),('cf2ef620217673e4042f695743294f01','f6817f48af4fb3af11b9e8bf182f618b','717f6bee46f44a3897eca9abd6e2ec44',NULL,NULL,NULL),('cf43895aef7fc684669483ab00ef2257','f6817f48af4fb3af11b9e8bf182f618b','700b7f95165c46cc7a78bf227aa8fed3',NULL,NULL,NULL),('d03d792b0f312e7b490afc5cec3dd6c5','e51758fa916c881624b046d26bd09230','8fb8172747a78756c11916216b8b8066',NULL,NULL,NULL),('d281a95b8f293d0fa2a136f46c4e0b10','f6817f48af4fb3af11b9e8bf182f618b','5c8042bd6c601270b2bbd9b20bccc68b',NULL,NULL,NULL),('d37ad568e26f46ed0feca227aa9c2ffa','f6817f48af4fb3af11b9e8bf182f618b','9502685863ab87f0ad1134142788a385',NULL,NULL,NULL),('d3ddcacee1acdfaa0810618b74e38ef2','f6817f48af4fb3af11b9e8bf182f618b','c6cf95444d80435eb37b2f9db3971ae6',NULL,NULL,NULL),('d3fe195d59811531c05d31d8436f5c8b','1750a8fb3e6d90cb7957c02de1dc8e59','e8af452d8948ea49d37c934f5100ae6a',NULL,NULL,NULL),('d5267597a4450f06d49d2fb63859641a','e51758fa916c881624b046d26bd09230','2dbbafa22cda07fa5d169d741b81fe12',NULL,NULL,NULL),('d83282192a69514cfe6161b3087ff962','f6817f48af4fb3af11b9e8bf182f618b','53a9230444d33de28aa11cc108fb1dba',NULL,NULL,NULL),('d8a5c9079df12090e108e21be94b4fd7','f6817f48af4fb3af11b9e8bf182f618b','078f9558cdeab239aecb2bda1a8ed0d1',NULL,NULL,NULL),('dbc5dd836d45c5bc7bc94b22596ab956','f6817f48af4fb3af11b9e8bf182f618b','1939e035e803a99ceecb6f5563570fb2',NULL,NULL,NULL),('dc83bb13c0e8c930e79d28b2db26f01f','f6817f48af4fb3af11b9e8bf182f618b','63b551e81c5956d5c861593d366d8c57',NULL,NULL,NULL),('dc8fd3f79bd85bd832608b42167a1c71','f6817f48af4fb3af11b9e8bf182f618b','91c23960fab49335831cf43d820b0a61',NULL,NULL,NULL),('de82e89b8b60a3ea99be5348f565c240','f6817f48af4fb3af11b9e8bf182f618b','56ca78fe0f22d815fabc793461af67b8',NULL,NULL,NULL),('de8f43229e351d34af3c95b1b9f0a15d','f6817f48af4fb3af11b9e8bf182f618b','a400e4f4d54f79bf5ce160ae432231af',NULL,NULL,NULL),('e258ca8bf7ee168b93bfee739668eb15','ee8626f80f7c2619917b6236f3a7f02b','fb367426764077dcf94640c843733985',NULL,NULL,NULL),('e339f7db7418a4fd2bd2c113f1182186','ee8626f80f7c2619917b6236f3a7f02b','b1cb0a3fedf7ed0e4653cb5a229837ee',NULL,NULL,NULL),('e3e922673f4289b18366bb51b6200f17','52b0cf022ac4187b2a70dfa4f8b2d940','45c966826eeff4c99b8f8ebfe74511fc',NULL,NULL,NULL),('e7467726ee72235baaeb47df04a35e73','f6817f48af4fb3af11b9e8bf182f618b','e08cb190ef230d5d4f03824198773950',NULL,NULL,NULL),('eaef4486f1c9b0408580bbfa2037eb66','f6817f48af4fb3af11b9e8bf182f618b','2a470fc0c3954d9dbb61de6d80846549',NULL,NULL,NULL),('ec4bc97829ab56afd83f428b6dc37ff6','f6817f48af4fb3af11b9e8bf182f618b','200006f0edf145a2b50eacca07585451',NULL,NULL,NULL),('ec846a3f85fdb6813e515be71f11b331','f6817f48af4fb3af11b9e8bf182f618b','732d48f8e0abe99fe6a23d18a3171cd1',NULL,NULL,NULL),('ec93bb06f5be4c1f19522ca78180e2ef','f6817f48af4fb3af11b9e8bf182f618b','265de841c58907954b8877fb85212622',NULL,NULL,NULL),('ecdd72fe694e6bba9c1d9fc925ee79de','f6817f48af4fb3af11b9e8bf182f618b','45c966826eeff4c99b8f8ebfe74511fc',NULL,NULL,NULL),('edefd8d468f5727db465cf1b860af474','f6817f48af4fb3af11b9e8bf182f618b','6ad53fd1b220989a8b71ff482d683a5a',NULL,NULL,NULL),('ef8bdd20d29447681ec91d3603e80c7b','f6817f48af4fb3af11b9e8bf182f618b','ae4fed059f67086fd52a73d913cf473d',NULL,NULL,NULL),('f12b6c90e8913183d7ca547c66600891','e51758fa916c881624b046d26bd09230','aedbf679b5773c1f25e9f7b10111da73',NULL,NULL,NULL),('f177acac0276329dc66af0c9ad30558a','f6817f48af4fb3af11b9e8bf182f618b','c2c356bf4ddd29975347a7047a062440',NULL,NULL,NULL),('f17ab8ad1e71341140857ef4914ef297','21c5a3187763729408b40afb0d0fdfa8','732d48f8e0abe99fe6a23d18a3171cd1',NULL,NULL,NULL),('f99f99cc3bc27220cdd4f5aced33b7d7','f6817f48af4fb3af11b9e8bf182f618b','655563cd64b75dcf52ef7bcdd4836953',NULL,NULL,NULL),('fafe73c4448b977fe42880a6750c3ee8','f6817f48af4fb3af11b9e8bf182f618b','9cb91b8851db0cf7b19d7ecc2a8193dd',NULL,NULL,NULL),('fced905c7598973b970d42d833f73474','f6817f48af4fb3af11b9e8bf182f618b','4875ebe289344e14844d8e3ea1edd73f',NULL,NULL,NULL),('fd86f6b08eb683720ba499f9d9421726','ee8626f80f7c2619917b6236f3a7f02b','693ce69af3432bd00be13c3971a57961',NULL,NULL,NULL),('fd97963dc5f144d3aecfc7045a883427','f6817f48af4fb3af11b9e8bf182f618b','043780fa095ff1b2bec4dc406d76f023',NULL,NULL,NULL),('fed41a4671285efb266cd404f24dd378','52b0cf022ac4187b2a70dfa4f8b2d940','00a2a0ae65cdca5e93209cdbde97cbe6',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sms`
--

DROP TABLE IF EXISTS `sys_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_sms` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ID',
  `es_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '消息标题',
  `es_type` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '发送方式：1短信 2邮件 3微信',
  `es_receiver` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '接收人',
  `es_param` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '发送所需参数Json格式',
  `es_content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '推送内容',
  `es_send_time` datetime DEFAULT NULL COMMENT '推送时间',
  `es_send_status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '推送状态 0未推送 1推送成功 2推送失败 -1失败不再发送',
  `es_send_num` int DEFAULT NULL COMMENT '发送次数 超过5次不再发送',
  `es_result` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '推送失败原因',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人登录名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人登录名称',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_ss_es_type` (`es_type`) USING BTREE,
  KEY `idx_ss_es_receiver` (`es_receiver`) USING BTREE,
  KEY `idx_ss_es_send_time` (`es_send_time`) USING BTREE,
  KEY `idx_ss_es_send_status` (`es_send_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sms`
--

LOCK TABLES `sys_sms` WRITE;
/*!40000 ALTER TABLE `sys_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sms_template`
--

DROP TABLE IF EXISTS `sys_sms_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_sms_template` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Primary key',
  `template_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Template title',
  `template_code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'template CODE',
  `template_type` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Template type: 1 SMS 2 Email 3 WeChat',
  `template_content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'template content',
  `template_test_json` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'template test json',
  `create_time` datetime DEFAULT NULL COMMENT 'create date',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Creator login name',
  `update_time` datetime DEFAULT NULL COMMENT 'update date',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update person login name',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_sst_template_code` (`template_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sms_template`
--

LOCK TABLES `sys_sms_template` WRITE;
/*!40000 ALTER TABLE `sys_sms_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_sms_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_tenant`
--

DROP TABLE IF EXISTS `sys_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_tenant` (
  `id` int NOT NULL COMMENT 'tenant code',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'tenant name',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Created by',
  `begin_date` datetime DEFAULT NULL COMMENT 'start time',
  `end_date` datetime DEFAULT NULL COMMENT 'end time',
  `status` int DEFAULT NULL COMMENT 'status 1 normal 0 frozen',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='Multi-tenant information table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_tenant`
--

LOCK TABLES `sys_tenant` WRITE;
/*!40000 ALTER TABLE `sys_tenant` DISABLE KEYS */;
INSERT INTO `sys_tenant` VALUES (1,'Viettel','2020-07-10 15:43:32','admin',NULL,NULL,1),(2,'Oracle','2020-07-10 15:43:32','admin',NULL,NULL,1),(3,'SpaceX','2020-07-10 15:43:32','admin',NULL,NULL,1);
/*!40000 ALTER TABLE `sys_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_third_account`
--

DROP TABLE IF EXISTS `sys_third_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_third_account` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Number',
  `sys_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'third-party login id',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'avatar',
  `status` tinyint(1) DEFAULT NULL COMMENT 'Status (1-normal, 2-frozen)',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT 'Delete status (0-normal, 1-deleted)',
  `realname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'real name',
  `third_user_uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Third party account',
  `third_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'third-party app user account',
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Creator login name',
  `create_time` datetime DEFAULT NULL COMMENT 'create date',
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update person login name',
  `update_time` datetime DEFAULT NULL COMMENT 'update date',
  `third_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Login source',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_sys_third_account_third_type_third_user_id` (`third_type`,`third_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_third_account`
--

LOCK TABLES `sys_third_account` WRITE;
/*!40000 ALTER TABLE `sys_third_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_third_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `realname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `salt` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `org_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `third_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `third_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `activiti_sync` tinyint(1) DEFAULT NULL,
  `work_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `post` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `telephone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `create_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_identity` tinyint(1) DEFAULT NULL,
  `depart_ids` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `rel_tenant_ids` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `client_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '设备ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_sys_user_work_no` (`work_no`) USING BTREE,
  UNIQUE KEY `uniq_sys_user_username` (`username`) USING BTREE,
  UNIQUE KEY `uniq_sys_user_phone` (`phone`) USING BTREE,
  UNIQUE KEY `uniq_sys_user_email` (`email`) USING BTREE,
  KEY `idx_su_username` (`username`) USING BTREE,
  KEY `idx_su_status` (`status`) USING BTREE,
  KEY `idx_su_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('3d464b4ea0d2491aab8a7bde74c57e95','user','user','02ea098224c7d0d2077c14b9a3a1ed16','x5xRdeKB','https://media.coolmate.me/cdn-cgi/image/quality=80/uploads/April2022/meme-cho-shiba-43.jpg',NULL,NULL,NULL,NULL,'财务部',1,0,NULL,NULL,1,'0005','Normal Guy',NULL,'admin','2020-05-14 21:26:24','admin','2020-09-09 14:42:51',1,'','1',NULL),('a75d45a015c44384a04449ee80dc3503','musk','Elon Musk','58a714412072f0b9','mIgiYJow','https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg/500px-Elon_Musk_Royal_Society_%28crop1%29.jpg',NULL,1,NULL,NULL,'A02A01',1,0,NULL,NULL,1,'00002','devleader',NULL,'admin','2019-02-13 16:02:36','admin','2020-11-26 15:16:05',1,'','2',NULL),('e9ca23d68d884d4ebb19d07889727dae','admin','Adminstrator','cb362cfeefbf3d8d','RCGTeGiH','https://media.coolmate.me/cdn-cgi/image/quality=80/uploads/April2022/meme-cho-shiba-43.jpg','2018-12-05 00:00:00',1,'jeecg@163.com','18611111111','A01',1,0,NULL,NULL,1,'00001','President',NULL,NULL,'2019-06-21 17:54:10','admin','2020-07-10 15:27:10',2,'c6d7cb4deeac411cb3384b1b31278596','1',NULL),('f0019fdebedb443c98dcb17d88222c38','anhtoi','Elon Quyet','f898134e5e52ae11a2ffb2c3b57a4e90','go3jJ4zX','https://upload.wikimedia.org/wikipedia/commons/1/12/Tr%E1%BB%8Bnh_V%C4%83n_Quy%E1%BA%BFt.jpg','2019-04-01 00:00:00',NULL,NULL,NULL,'研发部,财务部',2,0,NULL,NULL,1,'00003','President',NULL,'admin','2020-10-01 19:34:10','admin','2020-11-26 15:24:59',1,'','1',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_agent`
--

DROP TABLE IF EXISTS `sys_user_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_agent` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'serial number',
  `user_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'username',
  `agent_user_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'agent username',
  `start_time` datetime DEFAULT NULL COMMENT 'Agent start time',
  `end_time` datetime DEFAULT NULL COMMENT 'Agent end time',
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Status 0 invalid 1 valid',
  `create_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Creator name',
  `create_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Creator login name',
  `create_time` datetime DEFAULT NULL COMMENT 'create date',
  `update_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Update person name',
  `update_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Updater login name',
  `update_time` datetime DEFAULT NULL COMMENT 'update date',
  `sys_org_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Department',
  `sys_company_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'The company',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_sug_user_name` (`user_name`) USING BTREE,
  KEY `idx_sug_status` (`status`) USING BTREE,
  KEY `idx_sug_start_time` (`start_time`) USING BTREE,
  KEY `idx_sug_end_time` (`end_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='User Agent Settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_agent`
--

LOCK TABLES `sys_user_agent` WRITE;
/*!40000 ALTER TABLE `sys_user_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_depart`
--

DROP TABLE IF EXISTS `sys_user_depart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_depart` (
  `ID` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'id',
  `user_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'userid',
  `dep_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'department id',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `idx_sud_user_id` (`user_id`) USING BTREE,
  KEY `idx_sud_dep_id` (`dep_id`) USING BTREE,
  KEY `idx_sud_user_dep_id` (`user_id`,`dep_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_depart`
--

LOCK TABLES `sys_user_depart` WRITE;
/*!40000 ALTER TABLE `sys_user_depart` DISABLE KEYS */;
INSERT INTO `sys_user_depart` VALUES ('1303584634328633345','3d464b4ea0d2491aab8a7bde74c57e95','a7d7e77e06c84325a40932163adcdaa6'),('1256487210695356418','a75d45a015c44384a04449ee80dc3503','a7d7e77e06c84325a40932163adcdaa6'),('1f3a0267811327b9eca86b0cc2b956f3','bcbe1290783a469a83ae3bd8effe15d4','5159cde220114246b045e574adceafe9'),('1281490128540393474','e9ca23d68d884d4ebb19d07889727dae','c6d7cb4deeac411cb3384b1b31278596'),('1303623812558958593','f0019fdebedb443c98dcb17d88222c38','57197590443c44f083d42ae24ef26a2c'),('1303623812588318722','f0019fdebedb443c98dcb17d88222c38','67fc001af12a4f9b8458005d3f19934a');
/*!40000 ALTER TABLE `sys_user_depart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'primary key id',
  `user_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'userid',
  `role_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'role id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sur_user_id` (`user_id`) USING BTREE,
  KEY `idx_sur_role_id` (`role_id`) USING BTREE,
  KEY `idx_sur_user_role_id` (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='User role table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES ('b3ffd9311a1ca296c44e2409b547384f','01b802058ea94b978a2c96f4807f6b48','1'),('1303584634118918145','3d464b4ea0d2491aab8a7bde74c57e95','ee8626f80f7c2619917b6236f3a7f02b'),('0ede6d23d53bc7dc990346ff14faabee','3db4cf42353f4e868b7ccfeef90505d2','ee8626f80f7c2619917b6236f3a7f02b'),('e78d210d24aaff48e0a736e2ddff4cdc','3e177fede453430387a8279ced685679','ee8626f80f7c2619917b6236f3a7f02b'),('f2de3ae7b5efd8345581aa802a6675d6','41b1be8d4c52023b0798f51164ca682d','e51758fa916c881624b046d26bd09230'),('f2922a38ba24fb53749e45a0c459adb3','439ae3e9bcf7418583fcd429cadb1d72','1'),('f72c6190b0722e798147e73c776c6ac9','439ae3e9bcf7418583fcd429cadb1d72','ee8626f80f7c2619917b6236f3a7f02b'),('ee45d0343ecec894b6886effc92cb0b7','4d8fef4667574b24a9ccfedaf257810c','f6817f48af4fb3af11b9e8bf182f618b'),('be2639167ede09379937daca7fc3bb73','526f300ab35e44faaed54a9fb0742845','ee8626f80f7c2619917b6236f3a7f02b'),('31af310584bd5795f76b1fe8c38294a0','70f5dcf03f36471dabba81381919291f','e51758fa916c881624b046d26bd09230'),('8d7846ec783e157174e4ce2949231a65','7ee6630e89d17afbf6d12150197b578d','e51758fa916c881624b046d26bd09230'),('79d66ef7aa137cfa9957081a1483009d','9a668858c4c74cf5a2b25ad9608ba095','ee8626f80f7c2619917b6236f3a7f02b'),('1256487210544361473','a75d45a015c44384a04449ee80dc3503','ee8626f80f7c2619917b6236f3a7f02b'),('1281490128242597889','e9ca23d68d884d4ebb19d07889727dae','f6817f48af4fb3af11b9e8bf182f618b'),('1303623812290523138','f0019fdebedb443c98dcb17d88222c38','ee8626f80f7c2619917b6236f3a7f02b');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-18  5:51:48
