-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: v8oa
-- ------------------------------------------------------
-- Server version	5.7.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bo_blog`
--

DROP TABLE IF EXISTS `bo_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bo_blog` (
  `fid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENTRY_NUMBER` int(11) DEFAULT NULL,
  `RECENT_NUMBER` int(11) DEFAULT NULL,
  `RECENT_ENTRY_NUMBER` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `COMMENT_AUDIT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPENSCOPE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SETTING` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BLOGCATEGORY` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CHAIRMAN` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CHAIRMAN_ID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bo_blog`
--

LOCK TABLES `bo_blog` WRITE;
/*!40000 ALTER TABLE `bo_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `bo_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bo_category`
--

DROP TABLE IF EXISTS `bo_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bo_category` (
  `fID` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FMASTERID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bo_category`
--

LOCK TABLES `bo_category` WRITE;
/*!40000 ALTER TABLE `bo_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `bo_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bo_comment`
--

DROP TABLE IF EXISTS `bo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bo_comment` (
  `fID` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复人',
  `EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `CONTENT` text COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
  `CREATED_TIME` datetime DEFAULT NULL COMMENT '回复时间',
  `ENTRY_ID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '帖子ID',
  `ENTRY_TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '帖子标题',
  `IP` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bo_comment`
--

LOCK TABLES `bo_comment` WRITE;
/*!40000 ALTER TABLE `bo_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `bo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bo_entry`
--

DROP TABLE IF EXISTS `bo_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bo_entry` (
  `fID` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTENT` longtext COLLATE utf8mb4_unicode_ci,
  `CATEGORY_ID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENT_HIT` int(11) DEFAULT NULL,
  `ALLOW_COMMENT` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '0',
  `CREATED_TIME` datetime DEFAULT NULL,
  `UPDATED_TIME` datetime DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `BO_BLOGID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACCESSORIES` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEXTEND01` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ONESELF` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bo_entry`
--

LOCK TABLES `bo_entry` WRITE;
/*!40000 ALTER TABLE `bo_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `bo_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `look_month_work_plan`
--

DROP TABLE IF EXISTS `look_month_work_plan`;
/*!50001 DROP VIEW IF EXISTS `look_month_work_plan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `look_month_work_plan` AS SELECT 
 1 AS `fid`,
 1 AS `FPUSHDATETIME`,
 1 AS `FPUSHID`,
 1 AS `FPUSHNAME`,
 1 AS `FCREATEID`,
 1 AS `FTITLE`,
 1 AS `FCREATENAME`,
 1 AS `forgid`,
 1 AS `forgname`,
 1 AS `fpersonname`,
 1 AS `FCREATEDATETIME`,
 1 AS `fpersonid`,
 1 AS `fbrowse`,
 1 AS `version`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `look_week_work_plan`
--

DROP TABLE IF EXISTS `look_week_work_plan`;
/*!50001 DROP VIEW IF EXISTS `look_week_work_plan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `look_week_work_plan` AS SELECT 
 1 AS `fid`,
 1 AS `FPUSHDATETIME`,
 1 AS `FPUSHID`,
 1 AS `FPUSHNAME`,
 1 AS `FCREATEID`,
 1 AS `FTITLE`,
 1 AS `FCREATENAME`,
 1 AS `FCONTENT`,
 1 AS `STARTTIME`,
 1 AS `finishtime`,
 1 AS `forgname`,
 1 AS `fpersonname`,
 1 AS `fpersonid`,
 1 AS `fbrowse`,
 1 AS `version`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oa_adm_mygroupfrom`
--

DROP TABLE IF EXISTS `oa_adm_mygroupfrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_adm_mygroupfrom` (
  `FID` varchar(32) NOT NULL,
  `FCREATORID` varchar(100) DEFAULT NULL,
  `FCREATOR` varchar(100) DEFAULT NULL,
  `FCREATEDEPTID` varchar(100) DEFAULT NULL,
  `FCREATEDEPT` varchar(100) DEFAULT NULL,
  `FCREATEDATE` timestamp NULL DEFAULT NULL,
  `FOUTKEY` varchar(32) DEFAULT NULL,
  `FPERSONID` varchar(32) DEFAULT NULL,
  `FPERSONNAME` varchar(200) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_adm_mygroupfrom`
--

LOCK TABLES `oa_adm_mygroupfrom` WRITE;
/*!40000 ALTER TABLE `oa_adm_mygroupfrom` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_adm_mygroupfrom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_adm_mygroupmain`
--

DROP TABLE IF EXISTS `oa_adm_mygroupmain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_adm_mygroupmain` (
  `FID` varchar(32) NOT NULL,
  `FCREATORID` varchar(100) DEFAULT NULL,
  `FCREATOR` varchar(100) DEFAULT NULL,
  `FCREATEDEPTID` varchar(100) DEFAULT NULL,
  `FCREATEDEPT` varchar(100) DEFAULT NULL,
  `FCREATEDATE` timestamp NULL DEFAULT NULL,
  `FGROUPNAME` varchar(200) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_adm_mygroupmain`
--

LOCK TABLES `oa_adm_mygroupmain` WRITE;
/*!40000 ALTER TABLE `oa_adm_mygroupmain` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_adm_mygroupmain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_dc_recvdoc`
--

DROP TABLE IF EXISTS `oa_dc_recvdoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_dc_recvdoc` (
  `FID` varchar(32) NOT NULL,
  `VERSION` decimal(10,0) DEFAULT NULL,
  `FDOCNUMBER` varchar(100) DEFAULT NULL,
  `FTITLE` varchar(150) DEFAULT NULL,
  `FDOCSOURCEDEPT` varchar(100) DEFAULT NULL,
  `FDOCSOURCEDATE` timestamp NULL DEFAULT NULL,
  `FDOCCOPIES` decimal(10,0) DEFAULT NULL,
  `FPAGECOUNT` varchar(10) DEFAULT NULL,
  `FDOCTYPE` varchar(100) DEFAULT NULL,
  `FURGENCY` varchar(10) DEFAULT NULL,
  `FCONFIDENTIALITY` varchar(10) DEFAULT NULL,
  `FDOCRECVNO` varchar(100) DEFAULT NULL,
  `FDOCRECVDATE` date DEFAULT NULL,
  `FREMARK` varchar(2000) DEFAULT NULL,
  `FATTACHMENT` varchar(2000) DEFAULT NULL,
  `FCREATEOGNID` varchar(32) DEFAULT NULL,
  `FCREATEOGNNAME` varchar(64) DEFAULT NULL,
  `FCREATEDEPTID` varchar(32) DEFAULT NULL,
  `FCREATEDEPTNAME` varchar(64) DEFAULT NULL,
  `FCREATEPOSID` varchar(32) DEFAULT NULL,
  `FCREATEPOSNAME` varchar(64) DEFAULT NULL,
  `FCREATEPERSONID` varchar(32) DEFAULT NULL,
  `FCREATEPERSONNAME` varchar(64) DEFAULT NULL,
  `FCREATEPERSONFID` varchar(512) DEFAULT NULL,
  `FCREATEPERSONFNAME` varchar(1024) DEFAULT NULL,
  `FCREATETIME` date DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_dc_recvdoc`
--

LOCK TABLES `oa_dc_recvdoc` WRITE;
/*!40000 ALTER TABLE `oa_dc_recvdoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_dc_recvdoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_dc_senddoc`
--

DROP TABLE IF EXISTS `oa_dc_senddoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_dc_senddoc` (
  `FID` varchar(32) NOT NULL,
  `VERSION` decimal(10,0) DEFAULT NULL,
  `FTITLE` varchar(150) DEFAULT NULL,
  `FTYPE` varchar(100) DEFAULT NULL,
  `FDOCNUMBER` varchar(100) DEFAULT NULL,
  `FURGENCY` varchar(10) DEFAULT NULL,
  `FCONFIDENTIALITY` varchar(10) DEFAULT NULL,
  `FPAGECOUNT` varchar(10) DEFAULT NULL,
  `FPRINTCOUNT` varchar(10) DEFAULT NULL,
  `FMAINDEPT` varchar(2000) DEFAULT NULL,
  `FCOPYDEPT` varchar(2000) DEFAULT NULL,
  `FSENDDATE` timestamp NULL DEFAULT NULL,
  `FCREATEOGNID` varchar(32) DEFAULT NULL,
  `FCREATEOGNNAME` varchar(64) DEFAULT NULL,
  `FCREATEDEPTID` varchar(32) DEFAULT NULL,
  `FCREATEDEPTNAME` varchar(64) DEFAULT NULL,
  `FCREATEPOSID` varchar(32) DEFAULT NULL,
  `FCREATEPOSNAME` varchar(64) DEFAULT NULL,
  `FCREATEPERSONID` varchar(32) DEFAULT NULL,
  `FCREATEPERSONNAME` varchar(64) DEFAULT NULL,
  `FCREATEPERSONFID` varchar(512) DEFAULT NULL,
  `FCREATEPERSONFNAME` varchar(1024) DEFAULT NULL,
  `FCREATETIME` date DEFAULT NULL,
  `FATTACHMENT` varchar(4000) DEFAULT NULL,
  `FDOCFILE` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_dc_senddoc`
--

LOCK TABLES `oa_dc_senddoc` WRITE;
/*!40000 ALTER TABLE `oa_dc_senddoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_dc_senddoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_doc_redheadperm`
--

DROP TABLE IF EXISTS `oa_doc_redheadperm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_doc_redheadperm` (
  `FID` varchar(32) NOT NULL,
  `FTYPE` varchar(100) DEFAULT NULL,
  `FNAME` varchar(100) DEFAULT NULL,
  `FRHFILE` varchar(1024) DEFAULT NULL,
  `FOGNID` varchar(100) DEFAULT NULL,
  `FOGNNAME` varchar(100) DEFAULT NULL,
  `FCREATORID` varchar(100) DEFAULT NULL,
  `FCREATOR` varchar(100) DEFAULT NULL,
  `FCREATEDEPTID` varchar(100) DEFAULT NULL,
  `FCREATEDEPT` varchar(100) DEFAULT NULL,
  `FCREATEDATE` timestamp NULL DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`),
  KEY `OA_REDHEAD_OGNID` (`FOGNID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_doc_redheadperm`
--

LOCK TABLES `oa_doc_redheadperm` WRITE;
/*!40000 ALTER TABLE `oa_doc_redheadperm` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_doc_redheadperm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_em_receiveemail`
--

DROP TABLE IF EXISTS `oa_em_receiveemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_em_receiveemail` (
  `FID` varchar(100) NOT NULL,
  `VERSION` decimal(10,0) DEFAULT NULL,
  `FEMAILNAME` varchar(100) DEFAULT NULL,
  `FTEXT` longtext,
  `FFJID` varchar(4000) DEFAULT NULL,
  `FSENDPERNAME` varchar(100) DEFAULT NULL,
  `FSENDPERID` varchar(100) DEFAULT NULL,
  `FREPLYSTATE` varchar(100) DEFAULT NULL,
  `FQUREY` varchar(100) DEFAULT NULL,
  `FCONSIGNEE` varchar(100) DEFAULT NULL,
  `FCONSIGNEEID` varchar(100) DEFAULT NULL,
  `FCONSIGNEECODE` varchar(100) DEFAULT NULL,
  `FSENDTIME` timestamp NULL DEFAULT NULL,
  `FSENDPERCODE` varchar(100) DEFAULT NULL,
  `FSENDOGN` varchar(100) DEFAULT NULL,
  `FSENDDEPT` varchar(100) DEFAULT NULL,
  `FCOLLECT` varchar(10) DEFAULT '0',
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_em_receiveemail`
--

LOCK TABLES `oa_em_receiveemail` WRITE;
/*!40000 ALTER TABLE `oa_em_receiveemail` DISABLE KEYS */;
INSERT INTO `oa_em_receiveemail` VALUES ('7C69724DCE98411FB0094A805DA7F125',NULL,'1212','121212','','system','PSN01','未回复','未查看','测试人员2','45BB9FCAF8394E43B45A55CF564F9CCD','','2024-12-25 13:27:01','SYSTEM','管理员','','0');
/*!40000 ALTER TABLE `oa_em_receiveemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_em_sendemail`
--

DROP TABLE IF EXISTS `oa_em_sendemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_em_sendemail` (
  `FID` varchar(100) NOT NULL,
  `VERSION` decimal(10,0) DEFAULT NULL,
  `FEMAILNAME` varchar(200) DEFAULT NULL,
  `FCONSIGNEE` longtext,
  `FTEXT` longtext,
  `FSTATE` varchar(100) DEFAULT NULL,
  `FCONSIGNEEID` longtext,
  `FCONSIGNEECODE` longtext,
  `FFJID` varchar(4000) DEFAULT NULL,
  `FSENDPERNAME` varchar(100) DEFAULT NULL,
  `FSENDPERID` varchar(100) DEFAULT NULL,
  `FCREATTIME` timestamp NULL DEFAULT NULL,
  `FSENDTIME` timestamp NULL DEFAULT NULL,
  `FSENDPERCODE` varchar(100) DEFAULT NULL,
  `FSENDOGN` varchar(100) DEFAULT NULL,
  `FSENDDEPT` varchar(100) DEFAULT NULL,
  `FCOLLECT` varchar(10) DEFAULT '0',
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_em_sendemail`
--

LOCK TABLES `oa_em_sendemail` WRITE;
/*!40000 ALTER TABLE `oa_em_sendemail` DISABLE KEYS */;
INSERT INTO `oa_em_sendemail` VALUES ('714C637BCAAC4182B744ADFAB34E1FDE',0,'1212','测试人员2','121212','已发送','45BB9FCAF8394E43B45A55CF564F9CCD','','','system','PSN01','2024-12-25 13:27:01','2024-12-25 13:27:01','SYSTEM','管理员','','0');
/*!40000 ALTER TABLE `oa_em_sendemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_flowconclusion`
--

DROP TABLE IF EXISTS `oa_flowconclusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_flowconclusion` (
  `FID` varchar(32) NOT NULL,
  `FCONCLUSIONNAME` varchar(4000) DEFAULT NULL,
  `FORDER` int(11) DEFAULT NULL,
  `FCREATORID` varchar(100) DEFAULT NULL,
  `FCREATOR` varchar(100) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_flowconclusion`
--

LOCK TABLES `oa_flowconclusion` WRITE;
/*!40000 ALTER TABLE `oa_flowconclusion` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_flowconclusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_flowrecord`
--

DROP TABLE IF EXISTS `oa_flowrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_flowrecord` (
  `FID` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `FNODENAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '环节名称',
  `FAGREETEXT` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批意见',
  `FCREATEPERNAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人',
  `FCREATEDEPTNAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批部门',
  `FCREATETIME` datetime DEFAULT NULL COMMENT '审批时间',
  `FBILLID` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务ID',
  `FCREATEDEPTID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批部门ID',
  `FCREATEPERID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批人ID',
  `FNODEID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '环节标识',
  `VERSION` int(11) DEFAULT NULL COMMENT '版本号',
  `FOPVIEWID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '显示位置div id',
  `FTASKID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务id',
  `FFLOWID` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流程id',
  `FSIGN` text COLLATE utf8mb4_unicode_ci COMMENT '签名',
  `fremark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_flowrecord`
--

LOCK TABLES `oa_flowrecord` WRITE;
/*!40000 ALTER TABLE `oa_flowrecord` DISABLE KEYS */;
INSERT INTO `oa_flowrecord` VALUES ('E48EFA88C3B94C93A62A656F3DF433CE','bizActivity4','11','system','','2023-03-13 17:11:34','2FBBE01A305A4714B60531FB62377171','','PSN01','bizActivity4',0,'opts','50EA327BADD24F219BFBEBB844893CCE','12517F33498C4027AFB48FB931E2F697','','');
/*!40000 ALTER TABLE `oa_flowrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_hr_warg`
--

DROP TABLE IF EXISTS `oa_hr_warg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_hr_warg` (
  `FID` varchar(32) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `FCREATORID` varchar(100) DEFAULT NULL,
  `FCREATOR` varchar(100) DEFAULT NULL,
  `FCREATEDEPTID` varchar(100) DEFAULT NULL,
  `FCREATEDEPT` varchar(100) DEFAULT NULL,
  `FCREATEDATE` datetime DEFAULT NULL,
  `FSCODE` varchar(64) DEFAULT NULL COMMENT '员工编号',
  `FPERSONNEME` varchar(64) DEFAULT NULL COMMENT '姓名',
  `FPOSTWAGE` float DEFAULT NULL COMMENT '岗位工资',
  `FLEVEWAGE` float DEFAULT NULL COMMENT '薪级工资',
  `FBASEJX` float DEFAULT NULL COMMENT '基础性绩效工资标准',
  `FREFORM` float DEFAULT NULL COMMENT '改革性补贴',
  `FAWARDJX` float DEFAULT NULL COMMENT '奖励性绩效补贴',
  `FAGEWAGE` float DEFAULT NULL COMMENT '护龄津贴',
  `FRETURN` float DEFAULT NULL COMMENT '回贴',
  `FONLYSON` float DEFAULT NULL COMMENT '独子费',
  `FLEAVE` float DEFAULT NULL COMMENT '病事假',
  `FOTHERSUM` float DEFAULT NULL COMMENT '其他',
  `FSHOULDPAY` float DEFAULT NULL COMMENT '应发合计',
  `FDUE` float DEFAULT NULL COMMENT '会费',
  `FHOUSE` float DEFAULT NULL COMMENT '住房',
  `FMEDICARE` float DEFAULT NULL COMMENT '医保',
  `FLOSSCARE` float DEFAULT NULL COMMENT '失保',
  `FOTHERDIV` float DEFAULT NULL COMMENT '其他费',
  `FLOANDEBIT` float DEFAULT NULL COMMENT '贷扣款',
  `FTAX` float DEFAULT NULL COMMENT '代扣税',
  `FDIVSUM` float DEFAULT NULL COMMENT '扣款合计',
  `FPAYWAGE` float DEFAULT NULL COMMENT '实发合计',
  `FPAYDATE` varchar(30) DEFAULT NULL COMMENT '日期',
  `FWAGEYEAR` float DEFAULT NULL COMMENT '薪资年',
  `FWAGEMONTH` float DEFAULT NULL COMMENT '薪资月',
  `FJIJIANBUTIE` float DEFAULT NULL COMMENT '纪检补贴',
  `FYEBANFEI` float DEFAULT NULL COMMENT '夜班费',
  `FBEIZHU` varchar(4000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_hr_warg`
--

LOCK TABLES `oa_hr_warg` WRITE;
/*!40000 ALTER TABLE `oa_hr_warg` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_hr_warg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_km_knowledge`
--

DROP TABLE IF EXISTS `oa_km_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_km_knowledge` (
  `FID` varchar(36) NOT NULL,
  `VERSION` decimal(10,0) DEFAULT NULL,
  `FCREATEOGNID` varchar(36) DEFAULT NULL,
  `FCREATEOGNNAME` varchar(64) DEFAULT NULL,
  `FCREATEDEPTID` varchar(36) DEFAULT NULL,
  `FCREATEDEPTNAME` varchar(64) DEFAULT NULL,
  `FCREATEPSNID` varchar(36) DEFAULT NULL,
  `FCREATEPSNNAME` varchar(64) DEFAULT NULL,
  `FCREATETIME` timestamp NULL DEFAULT NULL,
  `FNOTICETYPE` varchar(30) DEFAULT NULL,
  `FSENDTYPE` decimal(10,0) DEFAULT NULL,
  `FPOSTEDRANGE` varchar(4000) DEFAULT NULL,
  `FTITLE` varchar(200) DEFAULT NULL,
  `FSENDDATE` date DEFAULT NULL,
  `FCONTENT` varchar(4000) DEFAULT NULL,
  `FATTACHMENT` longtext,
  `FSENDSTATUS` decimal(10,0) DEFAULT NULL,
  `FDEPTCHECK` varchar(4000) DEFAULT NULL,
  `FOFFICECHECK` varchar(4000) DEFAULT NULL,
  `FLEADERCHECK` varchar(4000) DEFAULT NULL,
  `FPOSTEDRANGEID` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_km_knowledge`
--

LOCK TABLES `oa_km_knowledge` WRITE;
/*!40000 ALTER TABLE `oa_km_knowledge` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_km_knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_km_knowledgerange`
--

DROP TABLE IF EXISTS `oa_km_knowledgerange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_km_knowledgerange` (
  `FID` varchar(32) NOT NULL,
  `FBILLID` varchar(32) DEFAULT NULL,
  `FFULLID` varchar(1024) DEFAULT NULL,
  `FFULLNAME` varchar(1024) DEFAULT NULL,
  `FCREATORID` varchar(100) DEFAULT NULL,
  `FCREATOR` varchar(100) DEFAULT NULL,
  `FCREATEDEPTID` varchar(100) DEFAULT NULL,
  `FCREATEDEPT` varchar(100) DEFAULT NULL,
  `FCREATEDATE` timestamp NULL DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `FNAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_km_knowledgerange`
--

LOCK TABLES `oa_km_knowledgerange` WRITE;
/*!40000 ALTER TABLE `oa_km_knowledgerange` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_km_knowledgerange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_leave`
--

DROP TABLE IF EXISTS `oa_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_leave` (
  `FID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `FCREATORNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请人名称',
  `FCREATORID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请人',
  `FCREATORFID` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请人FID',
  `FCREATORFNAME` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请人FNAME',
  `FCREATEDATE` datetime DEFAULT NULL COMMENT '申请时间',
  `FSTARTDATE` date DEFAULT NULL COMMENT '开始时间',
  `FENDDATE` date DEFAULT NULL COMMENT '结束时间',
  `FDAY` int(5) DEFAULT NULL COMMENT '请假天数',
  `FLEAVETYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '请假类型',
  `FSTATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请状态',
  `FREASON` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '请假原因',
  `VERSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_leave`
--

LOCK TABLES `oa_leave` WRITE;
/*!40000 ALTER TABLE `oa_leave` DISABLE KEYS */;
INSERT INTO `oa_leave` VALUES ('2FBBE01A305A4714B60531FB62377171','system','PSN01','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','2022-05-01 16:39:13',NULL,NULL,NULL,'事假',NULL,'对方的豆腐干大师傅公司的发的方式给对手犯规十公分的身高岁的法国《《M，。第三方。，的生命，。 >dsmkfhjsdh<a>sdfjsdhfjk</a>','9'),('419170A47D834F688C61F87DA5B743A7',NULL,'1111',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'1','1');
/*!40000 ALTER TABLE `oa_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_notice_person`
--

DROP TABLE IF EXISTS `oa_notice_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_notice_person` (
  `FID` varchar(64) NOT NULL COMMENT '主键',
  `VERSION` int(11) DEFAULT NULL COMMENT '版本号',
  `FOGNID` varchar(64) DEFAULT NULL COMMENT '机构ID',
  `FOGNNAME` varchar(200) DEFAULT NULL COMMENT '机构名称',
  `FORGID` varchar(64) DEFAULT NULL COMMENT '组织ID',
  `FORGNAME` varchar(200) DEFAULT NULL COMMENT '组织名称',
  `FCREATEID` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `FCREATENAME` varchar(200) DEFAULT NULL COMMENT '创建人名称',
  `FCREATEDATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `FPERSONID` varchar(64) DEFAULT NULL COMMENT '人员ID',
  `FPERSONNAME` varchar(200) DEFAULT NULL COMMENT '人员名称',
  `FREADDATE` datetime DEFAULT NULL COMMENT '查看时间',
  `FPERSONFNAME` varchar(500) DEFAULT NULL COMMENT '查看人全名称',
  `FMAINID` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `FBROWSE` varchar(5) DEFAULT NULL COMMENT '查看',
  `FDEPTNAME` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `FDEPTID` varchar(100) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_notice_person`
--

LOCK TABLES `oa_notice_person` WRITE;
/*!40000 ALTER TABLE `oa_notice_person` DISABLE KEYS */;
INSERT INTO `oa_notice_person` VALUES ('95D2F0C0DFE04ED58594B16E9F6F2CD2',0,'ORG01','管理员','ORG01','管理员','PSN01','system','2022-05-01 16:57:47','PSN01','system','2022-05-01 16:57:47',NULL,'C850D7710F1641938328C24365C1A1F7','是','',''),('9A1DE26A031441B1A6375E6FDF7BDB08',0,'ORG01','管理员','ORG01','管理员','PSN01','system','2021-04-13 21:32:44','PSN01','system','2021-04-13 21:32:50',NULL,'5A25A33A9C8B4A94A9FE191DCF7FE57B','是','','');
/*!40000 ALTER TABLE `oa_notice_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `oa_notice_person_view`
--

DROP TABLE IF EXISTS `oa_notice_person_view`;
/*!50001 DROP VIEW IF EXISTS `oa_notice_person_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `oa_notice_person_view` AS SELECT 
 1 AS `FID`,
 1 AS `VERSION`,
 1 AS `FOGNID`,
 1 AS `FOGNNAME`,
 1 AS `FORGID`,
 1 AS `FORGNAME`,
 1 AS `FCREATEID`,
 1 AS `FCREATENAME`,
 1 AS `FCREATEDATETIME`,
 1 AS `FPUSHDATETIME`,
 1 AS `FTITLE`,
 1 AS `FCONTENT`,
 1 AS `FCREATEDATE`,
 1 AS `FPUSHID`,
 1 AS `FPUSHNAME`,
 1 AS `FTYPE`,
 1 AS `fpersonid`,
 1 AS `fbrowse`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oa_pub_docpigeonhole`
--

DROP TABLE IF EXISTS `oa_pub_docpigeonhole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_pub_docpigeonhole` (
  `FID` varchar(32) NOT NULL,
  `FNAME` varchar(100) DEFAULT NULL,
  `FPARENTID` varchar(32) DEFAULT NULL,
  `FTABLENAME` varchar(100) DEFAULT NULL,
  `FBILLID` varchar(32) DEFAULT NULL,
  `FURL` varchar(1024) DEFAULT NULL,
  `FCREATEDEPT` varchar(100) DEFAULT NULL,
  `FCREATEDEPTID` varchar(100) DEFAULT NULL,
  `FCREATOR` varchar(100) DEFAULT NULL,
  `FCREATORID` varchar(100) DEFAULT NULL,
  `FCREATEDATE` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT '0',
  `FFID` varchar(1024) DEFAULT NULL,
  `FFNAME` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_pub_docpigeonhole`
--

LOCK TABLES `oa_pub_docpigeonhole` WRITE;
/*!40000 ALTER TABLE `oa_pub_docpigeonhole` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_pub_docpigeonhole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_pub_docpigperm`
--

DROP TABLE IF EXISTS `oa_pub_docpigperm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_pub_docpigperm` (
  `FID` varchar(32) NOT NULL,
  `FFOLDERID` varchar(100) DEFAULT NULL,
  `FPERGORGFID` varchar(1024) DEFAULT NULL,
  `FPERGORG` varchar(1024) DEFAULT NULL,
  `FJURISDICTION` decimal(10,0) DEFAULT NULL,
  `FCREATORID` varchar(100) DEFAULT NULL,
  `FCREATOR` varchar(100) DEFAULT NULL,
  `FCREATEDEPTID` varchar(100) DEFAULT NULL,
  `FCREATEDEPT` varchar(100) DEFAULT NULL,
  `FCREATEDATE` timestamp NULL DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_pub_docpigperm`
--

LOCK TABLES `oa_pub_docpigperm` WRITE;
/*!40000 ALTER TABLE `oa_pub_docpigperm` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_pub_docpigperm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_pub_execute`
--

DROP TABLE IF EXISTS `oa_pub_execute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_pub_execute` (
  `FID` varchar(32) NOT NULL,
  `FMASTERID` varchar(100) DEFAULT NULL,
  `FTASKID` varchar(100) DEFAULT NULL,
  `FACTIVITYNAME` varchar(500) DEFAULT NULL,
  `FACTIVITYLABEL` varchar(1000) DEFAULT NULL,
  `FOPINION` varchar(1024) DEFAULT NULL,
  `FSTATE` varchar(100) DEFAULT NULL,
  `FSTATENAME` varchar(100) DEFAULT NULL,
  `FCREATEPSNID` varchar(64) DEFAULT NULL,
  `FCREATEPSNNAME` varchar(100) DEFAULT NULL,
  `FCREATEPSNFID` varchar(1024) DEFAULT NULL,
  `FCREATEPSNFNAME` varchar(2048) DEFAULT NULL,
  `FCREATETIME` timestamp NULL DEFAULT NULL,
  `VERSION` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_pub_execute`
--

LOCK TABLES `oa_pub_execute` WRITE;
/*!40000 ALTER TABLE `oa_pub_execute` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_pub_execute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_pulicnotice`
--

DROP TABLE IF EXISTS `oa_pulicnotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_pulicnotice` (
  `FID` varchar(64) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `FOGNID` varchar(64) DEFAULT NULL,
  `FOGNNAME` varchar(200) DEFAULT NULL,
  `FORGID` varchar(64) DEFAULT NULL,
  `FORGNAME` varchar(200) DEFAULT NULL,
  `FCREATEID` varchar(64) DEFAULT NULL,
  `FCREATENAME` varchar(200) DEFAULT NULL,
  `FCREATEDATETIME` timestamp NULL DEFAULT NULL,
  `FPUSHDATETIME` timestamp NULL DEFAULT NULL,
  `FTITLE` varchar(200) DEFAULT NULL,
  `FCONTENT` longtext,
  `FCREATEDATE` timestamp NULL DEFAULT NULL,
  `FPUSHID` varchar(64) DEFAULT NULL,
  `FPUSHNAME` varchar(200) DEFAULT NULL,
  `FTYPE` varchar(100) DEFAULT NULL,
  `FATTFILE` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_pulicnotice`
--

LOCK TABLES `oa_pulicnotice` WRITE;
/*!40000 ALTER TABLE `oa_pulicnotice` DISABLE KEYS */;
INSERT INTO `oa_pulicnotice` VALUES ('5A25A33A9C8B4A94A9FE191DCF7FE57B',3,'ORG01','管理员','ORG01','管理员','PSN01','system','2021-04-13 13:18:36','2021-04-13 13:32:46','测试通知','随风倒士大夫<img src=\"/tlv8/comon/kindeditor/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />','2021-04-13 13:18:36','PSN01','system','限制发布',NULL),('C850D7710F1641938328C24365C1A1F7',2,'ORG01','管理员','ORG01','管理员','PSN01','system','2022-05-01 08:57:22','2022-05-01 08:57:35','事实上士大夫大师傅','手动阀手动阀<img src=\"/tlv8/comon/kindeditor/plugins/emoticons/images/20.gif\" border=\"0\" alt=\"\" />','2022-05-01 08:57:22','PSN01','system','限制发布',NULL),('5D93350DEF98484E8D12B75941AA95B3',3,'ORG01','管理员','ORG01','管理员','PSN01','system','2024-12-27 12:43:27',NULL,'1121','21212','2024-12-27 12:43:27',NULL,NULL,'集体发布',NULL);
/*!40000 ALTER TABLE `oa_pulicnotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_re_dayreport`
--

DROP TABLE IF EXISTS `oa_re_dayreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_re_dayreport` (
  `FID` varchar(64) NOT NULL,
  `VERSION` decimal(10,0) DEFAULT NULL,
  `FTITLE` varchar(1024) DEFAULT NULL,
  `FCREATEOGNID` varchar(64) DEFAULT NULL,
  `FCREATEOGNNAME` varchar(200) DEFAULT NULL,
  `FCREATEDEPTID` varchar(64) DEFAULT NULL,
  `FCREATEDEPTNAME` varchar(200) DEFAULT NULL,
  `FCREATEPOSID` varchar(64) DEFAULT NULL,
  `FCREATEPOSNAME` varchar(200) DEFAULT NULL,
  `FCREATEPERSONID` varchar(64) DEFAULT NULL,
  `FCREATEPERSONNAME` varchar(200) DEFAULT NULL,
  `FCREATEPERSONFID` varchar(1024) DEFAULT NULL,
  `FCREATEPERSONFNAME` varchar(2048) DEFAULT NULL,
  `FCREATETIME` timestamp NULL DEFAULT NULL,
  `FPUSHDATETIME` timestamp NULL DEFAULT NULL,
  `FFILE` varchar(1000) DEFAULT NULL,
  `FCONTEXT` longtext,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_re_dayreport`
--

LOCK TABLES `oa_re_dayreport` WRITE;
/*!40000 ALTER TABLE `oa_re_dayreport` DISABLE KEYS */;
INSERT INTO `oa_re_dayreport` VALUES ('F3C50290B17A495A9F992ECDF0F8D23C',3,'56','ORG01','管理员','ORG01','管理员',NULL,NULL,'PSN01','system','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','2023-03-13 09:12:00',NULL,NULL,NULL);
/*!40000 ALTER TABLE `oa_re_dayreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_re_dayreportdetail`
--

DROP TABLE IF EXISTS `oa_re_dayreportdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_re_dayreportdetail` (
  `FID` varchar(100) NOT NULL,
  `VERSION` decimal(10,0) DEFAULT NULL,
  `FMASTERID` varchar(100) DEFAULT NULL,
  `FCONTENT` longtext,
  `FPLANDATE` date DEFAULT NULL,
  `FOTHERPERSON` varchar(2000) DEFAULT NULL,
  `FCOMPLETE` varchar(1024) DEFAULT NULL,
  `FREMARK` varchar(1024) DEFAULT NULL,
  `FCOMPLETEREMARK` varchar(1024) DEFAULT NULL,
  `FCREATETIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_re_dayreportdetail`
--

LOCK TABLES `oa_re_dayreportdetail` WRITE;
/*!40000 ALTER TABLE `oa_re_dayreportdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_re_dayreportdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_re_monthreport`
--

DROP TABLE IF EXISTS `oa_re_monthreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_re_monthreport` (
  `FID` varchar(100) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `FTITLE` varchar(1000) DEFAULT NULL,
  `FCREATEOGNID` varchar(64) DEFAULT NULL,
  `FCREATEOGNNAME` varchar(200) DEFAULT NULL,
  `FCREATEDEPTID` varchar(64) DEFAULT NULL,
  `FCREATEDEPTNAME` varchar(200) DEFAULT NULL,
  `FCREATEPOSID` varchar(64) DEFAULT NULL,
  `FCREATEPOSNAME` varchar(200) DEFAULT NULL,
  `FCREATEPERSONID` varchar(64) DEFAULT NULL,
  `FCREATEPERSONNAME` varchar(200) DEFAULT NULL,
  `FCREATEPERSONFID` varchar(1024) DEFAULT NULL,
  `FCREATEPERSONFNAME` varchar(1024) DEFAULT NULL,
  `FCREATETIME` timestamp NULL DEFAULT NULL,
  `FPUSHDATETIME` timestamp NULL DEFAULT NULL,
  `FFILE` varchar(1000) DEFAULT NULL,
  `FCONTEXT` longtext,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_re_monthreport`
--

LOCK TABLES `oa_re_monthreport` WRITE;
/*!40000 ALTER TABLE `oa_re_monthreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_re_monthreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_re_weekreport`
--

DROP TABLE IF EXISTS `oa_re_weekreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_re_weekreport` (
  `FID` varchar(100) NOT NULL,
  `VERSION` decimal(10,0) DEFAULT NULL,
  `FTITLE` varchar(1000) DEFAULT NULL,
  `FCREATEOGNID` varchar(64) DEFAULT NULL,
  `FCREATEOGNNAME` varchar(200) DEFAULT NULL,
  `FCREATEDEPTID` varchar(64) DEFAULT NULL,
  `FCREATEDEPTNAME` varchar(200) DEFAULT NULL,
  `FCREATEPOSID` varchar(64) DEFAULT NULL,
  `FCREATEPOSNAME` varchar(200) DEFAULT NULL,
  `FCREATEPERSONID` varchar(64) DEFAULT NULL,
  `FCREATEPERSONNAME` varchar(200) DEFAULT NULL,
  `FCREATEPERSONFID` varchar(1024) DEFAULT NULL,
  `FCREATEPERSONFNAME` varchar(1024) DEFAULT NULL,
  `FCREATETIME` timestamp NULL DEFAULT NULL,
  `FPUSHDATETIME` timestamp NULL DEFAULT NULL,
  `FFILE` varchar(1000) DEFAULT NULL,
  `FCONTEXT` longtext,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_re_weekreport`
--

LOCK TABLES `oa_re_weekreport` WRITE;
/*!40000 ALTER TABLE `oa_re_weekreport` DISABLE KEYS */;
INSERT INTO `oa_re_weekreport` VALUES ('3417429E79DF4D0B8F791F4D08344B53',3,'测试通知',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'system',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oa_re_weekreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_re_weekreportdetail`
--

DROP TABLE IF EXISTS `oa_re_weekreportdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_re_weekreportdetail` (
  `FID` varchar(4000) NOT NULL,
  `VERSION` decimal(10,0) DEFAULT NULL,
  `FMASTERID` varchar(4000) DEFAULT NULL,
  `FCONTENT` varchar(4000) DEFAULT NULL,
  `FPLANDATE` timestamp NULL DEFAULT NULL,
  `FOTHERPERSON` varchar(4000) DEFAULT NULL,
  `FCOMPLETE` varchar(4000) DEFAULT NULL,
  `FREMARK` varchar(4000) DEFAULT NULL,
  `FCOMPLETEREMARK` varchar(4000) DEFAULT NULL,
  `FCREATETIME` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_re_weekreportdetail`
--

LOCK TABLES `oa_re_weekreportdetail` WRITE;
/*!40000 ALTER TABLE `oa_re_weekreportdetail` DISABLE KEYS */;
INSERT INTO `oa_re_weekreportdetail` VALUES ('C9CE77834B900001E2E9122311C091C0',1,'3417429E79DF4D0B8F791F4D08344B53','11',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oa_re_weekreportdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_test1`
--

DROP TABLE IF EXISTS `oa_test1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_test1` (
  `FID` varchar(32) NOT NULL,
  `FMINGCHENG` varchar(100) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE` varchar(20) DEFAULT NULL,
  `SCODE` varchar(20) DEFAULT NULL,
  `fdate` datetime DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_test1`
--

LOCK TABLES `oa_test1` WRITE;
/*!40000 ALTER TABLE `oa_test1` DISABLE KEYS */;
INSERT INTO `oa_test1` VALUES ('CA96495C79F0000127101D5019DA1F20','十分士大夫',1,NULL,'4444',NULL),('C9B4B5B74F100001EBB611009CABC930','所发生的',2,NULL,'22',NULL),('CA96567CEC500001F1E97C1012001E69','sfsdfdsf',2,NULL,'1333','1970-01-01 16:06:07'),('CA9656BDB530000147C317A01097AD60','1212',0,NULL,'111','2024-01-12 16:10:33');
/*!40000 ALTER TABLE `oa_test1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_work_plan_person`
--

DROP TABLE IF EXISTS `oa_work_plan_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_work_plan_person` (
  `FID` varchar(100) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `FOGNID` varchar(64) DEFAULT NULL,
  `FOGNNAME` varchar(200) DEFAULT NULL,
  `FORGID` varchar(64) DEFAULT NULL,
  `FORGNAME` varchar(200) DEFAULT NULL,
  `FCREATEID` varchar(64) DEFAULT NULL,
  `FCREATENAME` varchar(200) DEFAULT NULL,
  `FCREATEDATETIME` datetime DEFAULT NULL,
  `FPERSONID` varchar(64) DEFAULT NULL,
  `FPERSONNAME` varchar(200) DEFAULT NULL,
  `FREADDATE` datetime DEFAULT NULL,
  `FPERSONFNAME` varchar(200) DEFAULT NULL,
  `FMAINID` varchar(100) DEFAULT NULL,
  `FBROWSE` varchar(100) DEFAULT NULL,
  `FOPINION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_work_plan_person`
--

LOCK TABLES `oa_work_plan_person` WRITE;
/*!40000 ALTER TABLE `oa_work_plan_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_work_plan_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_wp_monthplan`
--

DROP TABLE IF EXISTS `oa_wp_monthplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_wp_monthplan` (
  `FID` varchar(100) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `FOGNID` varchar(64) DEFAULT NULL,
  `FOGNNAME` varchar(200) DEFAULT NULL,
  `FORGID` varchar(64) DEFAULT NULL,
  `FORGNAME` varchar(200) DEFAULT NULL,
  `FCREATEID` varchar(64) DEFAULT NULL,
  `FCREATENAME` varchar(200) DEFAULT NULL,
  `FCREATEDATETIME` timestamp NULL DEFAULT NULL,
  `FPUSHDATETIME` timestamp NULL DEFAULT NULL,
  `FPUSHID` varchar(64) DEFAULT NULL,
  `FPUSHNAME` varchar(200) DEFAULT NULL,
  `FTARGETFINISHCONDITION` varchar(100) DEFAULT NULL,
  `FUNFINISHEDCAUSE` varchar(100) DEFAULT NULL,
  `FWINTHROUGHMETHOD` varchar(100) DEFAULT NULL,
  `FINNOVATEHARVEST` varchar(100) DEFAULT NULL,
  `FTITLE` varchar(200) DEFAULT NULL,
  `PLANPERSON` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_wp_monthplan`
--

LOCK TABLES `oa_wp_monthplan` WRITE;
/*!40000 ALTER TABLE `oa_wp_monthplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_wp_monthplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_wp_monthplan_detail`
--

DROP TABLE IF EXISTS `oa_wp_monthplan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_wp_monthplan_detail` (
  `FID` varchar(100) NOT NULL,
  `VERSION` decimal(10,0) DEFAULT NULL,
  `FOGNID` varchar(64) DEFAULT NULL,
  `FOGNNAME` varchar(200) DEFAULT NULL,
  `FORGID` varchar(64) DEFAULT NULL,
  `FORGNAME` varchar(200) DEFAULT NULL,
  `FCREATEID` varchar(64) DEFAULT NULL,
  `FCREATENAME` varchar(200) DEFAULT NULL,
  `FCREATEDATETIME` timestamp NULL DEFAULT NULL,
  `FSIGNIFICANCEGRADE` varchar(100) DEFAULT NULL,
  `FTARGETCONTENT` varchar(200) DEFAULT NULL,
  `FMETHODMEASURE` varchar(200) DEFAULT NULL,
  `FACCOMPLISH` varchar(100) DEFAULT NULL,
  `FMAINID` varchar(100) DEFAULT NULL,
  `FOPINION` varchar(100) DEFAULT NULL,
  `FORDERTIME` timestamp NULL DEFAULT NULL,
  `FCOMPLETE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_wp_monthplan_detail`
--

LOCK TABLES `oa_wp_monthplan_detail` WRITE;
/*!40000 ALTER TABLE `oa_wp_monthplan_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_wp_monthplan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_wp_weekplan`
--

DROP TABLE IF EXISTS `oa_wp_weekplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_wp_weekplan` (
  `FID` varchar(100) NOT NULL,
  `VERSION` decimal(10,0) DEFAULT NULL,
  `FOGNID` varchar(64) DEFAULT NULL,
  `FOGNNAME` varchar(200) DEFAULT NULL,
  `FORGID` varchar(64) DEFAULT NULL,
  `FORGNAME` varchar(200) DEFAULT NULL,
  `FCREATEID` varchar(64) DEFAULT NULL,
  `FCREATENAME` varchar(200) DEFAULT NULL,
  `FCREATEDATETIME` timestamp NULL DEFAULT NULL,
  `FPUSHDATETIME` timestamp NULL DEFAULT NULL,
  `FPUSHID` varchar(100) DEFAULT NULL,
  `FPUSHNAME` varchar(200) DEFAULT NULL,
  `FTITLE` varchar(1000) DEFAULT NULL,
  `STARTTIME` timestamp NULL DEFAULT NULL,
  `FINISHTIME` timestamp NULL DEFAULT NULL,
  `PLANPERSON` varchar(100) DEFAULT NULL,
  `FAPPROVALPSNID` varchar(100) DEFAULT NULL,
  `FCONTENT` longtext,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_wp_weekplan`
--

LOCK TABLES `oa_wp_weekplan` WRITE;
/*!40000 ALTER TABLE `oa_wp_weekplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_wp_weekplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_wp_weekplan_detail`
--

DROP TABLE IF EXISTS `oa_wp_weekplan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_wp_weekplan_detail` (
  `FID` varchar(100) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `FOGNID` varchar(64) DEFAULT NULL,
  `FOGNNAME` varchar(200) DEFAULT NULL,
  `FORGID` varchar(64) DEFAULT NULL,
  `FORGNAME` varchar(200) DEFAULT NULL,
  `FCREATEID` varchar(64) DEFAULT NULL,
  `FCREATENAME` varchar(200) DEFAULT NULL,
  `FCREATEDATETIME` timestamp NULL DEFAULT NULL,
  `MONTHLY` varchar(50) DEFAULT NULL,
  `PROJECTNAME` varchar(100) DEFAULT NULL,
  `SERIALNUMBER` varchar(20) DEFAULT NULL,
  `JOBCONTENT` varchar(200) DEFAULT NULL,
  `DEPARTMENTCOOPERATION` varchar(200) DEFAULT NULL,
  `COMPLETIONEVALUATION` varchar(200) DEFAULT NULL,
  `COMPLETECONDITION` varchar(50) DEFAULT NULL,
  `UNFINISHEDCAUSE` varchar(200) DEFAULT NULL,
  `AUDITOR` varchar(20) DEFAULT NULL,
  `MAINID` varchar(100) DEFAULT NULL,
  `STARTTIME` timestamp NULL DEFAULT NULL,
  `FINISHTIME` timestamp NULL DEFAULT NULL,
  `SORT` decimal(10,0) DEFAULT NULL,
  `PLANTYPE` varchar(20) DEFAULT NULL,
  `FCONTENT` varchar(50) DEFAULT NULL,
  `ACCOMPLISH` varchar(50) DEFAULT NULL,
  `FCOMPLETTIME` timestamp NULL DEFAULT NULL,
  `FIMPORTANT` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_wp_weekplan_detail`
--

LOCK TABLES `oa_wp_weekplan_detail` WRITE;
/*!40000 ALTER TABLE `oa_wp_weekplan_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_wp_weekplan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `show_oa_re_dayreport`
--

DROP TABLE IF EXISTS `show_oa_re_dayreport`;
/*!50001 DROP VIEW IF EXISTS `show_oa_re_dayreport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `show_oa_re_dayreport` AS SELECT 
 1 AS `FID`,
 1 AS `VERSION`,
 1 AS `FTITLE`,
 1 AS `FCREATEOGNID`,
 1 AS `FCREATEOGNNAME`,
 1 AS `FCREATEDEPTID`,
 1 AS `FCREATEDEPTNAME`,
 1 AS `FCREATEPOSID`,
 1 AS `FCREATEPOSNAME`,
 1 AS `FCREATEPERSONID`,
 1 AS `FCREATEPERSONNAME`,
 1 AS `FCREATEPERSONFID`,
 1 AS `FCREATEPERSONFNAME`,
 1 AS `FCREATETIME`,
 1 AS `FPUSHDATETIME`,
 1 AS `FFILE`,
 1 AS `fpersonid`,
 1 AS `fbrowse`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `show_oa_re_monthreport`
--

DROP TABLE IF EXISTS `show_oa_re_monthreport`;
/*!50001 DROP VIEW IF EXISTS `show_oa_re_monthreport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `show_oa_re_monthreport` AS SELECT 
 1 AS `FID`,
 1 AS `VERSION`,
 1 AS `FTITLE`,
 1 AS `FCREATEOGNID`,
 1 AS `FCREATEOGNNAME`,
 1 AS `FCREATEDEPTID`,
 1 AS `FCREATEDEPTNAME`,
 1 AS `FCREATEPOSID`,
 1 AS `FCREATEPOSNAME`,
 1 AS `FCREATEPERSONID`,
 1 AS `FCREATEPERSONNAME`,
 1 AS `FCREATEPERSONFID`,
 1 AS `FCREATEPERSONFNAME`,
 1 AS `FCREATETIME`,
 1 AS `FPUSHDATETIME`,
 1 AS `FFILE`,
 1 AS `fpersonid`,
 1 AS `fbrowse`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `show_oa_re_weekreport`
--

DROP TABLE IF EXISTS `show_oa_re_weekreport`;
/*!50001 DROP VIEW IF EXISTS `show_oa_re_weekreport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `show_oa_re_weekreport` AS SELECT 
 1 AS `FID`,
 1 AS `VERSION`,
 1 AS `FTITLE`,
 1 AS `FCREATEOGNID`,
 1 AS `FCREATEOGNNAME`,
 1 AS `FCREATEDEPTID`,
 1 AS `FCREATEDEPTNAME`,
 1 AS `FCREATEPOSID`,
 1 AS `FCREATEPOSNAME`,
 1 AS `FCREATEPERSONID`,
 1 AS `FCREATEPERSONNAME`,
 1 AS `FCREATEPERSONFID`,
 1 AS `FCREATEPERSONFNAME`,
 1 AS `FCREATETIME`,
 1 AS `FPUSHDATETIME`,
 1 AS `FFILE`,
 1 AS `fpersonid`,
 1 AS `fbrowse`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'v8oa'
--

--
-- Final view structure for view `look_month_work_plan`
--

/*!50001 DROP VIEW IF EXISTS `look_month_work_plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `look_month_work_plan` AS select `t`.`FID` AS `fid`,`t`.`FPUSHDATETIME` AS `FPUSHDATETIME`,`t`.`FPUSHID` AS `FPUSHID`,`t`.`FPUSHNAME` AS `FPUSHNAME`,`t`.`FCREATEID` AS `FCREATEID`,`t`.`FTITLE` AS `FTITLE`,`t`.`FCREATENAME` AS `FCREATENAME`,`t`.`FORGID` AS `forgid`,`t`.`FORGNAME` AS `forgname`,`t1`.`FPERSONNAME` AS `fpersonname`,`t`.`FCREATEDATETIME` AS `FCREATEDATETIME`,`t1`.`FPERSONID` AS `fpersonid`,`t1`.`FBROWSE` AS `fbrowse`,`t`.`VERSION` AS `version` from (`oa_wp_monthplan` `t` left join `oa_work_plan_person` `t1` on((convert(`t`.`FID` using utf8mb4) = `t1`.`FMAINID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `look_week_work_plan`
--

/*!50001 DROP VIEW IF EXISTS `look_week_work_plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `look_week_work_plan` AS select `t`.`FID` AS `fid`,`t`.`FPUSHDATETIME` AS `FPUSHDATETIME`,`t`.`FPUSHID` AS `FPUSHID`,`t`.`FPUSHNAME` AS `FPUSHNAME`,`t`.`FCREATEID` AS `FCREATEID`,`t`.`FTITLE` AS `FTITLE`,`t`.`FCREATENAME` AS `FCREATENAME`,`t`.`FCONTENT` AS `FCONTENT`,`t`.`STARTTIME` AS `STARTTIME`,`t`.`FINISHTIME` AS `finishtime`,`t`.`FORGNAME` AS `forgname`,`t1`.`FPERSONNAME` AS `fpersonname`,`t1`.`FPERSONID` AS `fpersonid`,`t1`.`FBROWSE` AS `fbrowse`,`t`.`VERSION` AS `version` from (`oa_wp_weekplan` `t` left join `oa_work_plan_person` `t1` on((convert(`t`.`FID` using utf8mb4) = `t1`.`FMAINID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oa_notice_person_view`
--

/*!50001 DROP VIEW IF EXISTS `oa_notice_person_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `oa_notice_person_view` AS select `t`.`FID` AS `FID`,`t`.`VERSION` AS `VERSION`,`t`.`FOGNID` AS `FOGNID`,`t`.`FOGNNAME` AS `FOGNNAME`,`t`.`FORGID` AS `FORGID`,`t`.`FORGNAME` AS `FORGNAME`,`t`.`FCREATEID` AS `FCREATEID`,`t`.`FCREATENAME` AS `FCREATENAME`,`t`.`FCREATEDATETIME` AS `FCREATEDATETIME`,`t`.`FPUSHDATETIME` AS `FPUSHDATETIME`,`t`.`FTITLE` AS `FTITLE`,`t`.`FCONTENT` AS `FCONTENT`,`t`.`FCREATEDATE` AS `FCREATEDATE`,`t`.`FPUSHID` AS `FPUSHID`,`t`.`FPUSHNAME` AS `FPUSHNAME`,`t`.`FTYPE` AS `FTYPE`,`t1`.`FPERSONID` AS `fpersonid`,`t1`.`FBROWSE` AS `fbrowse` from (`oa_pulicnotice` `t` left join `oa_notice_person` `t1` on((convert(`t`.`FID` using utf8mb4) = `t1`.`FMAINID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_oa_re_dayreport`
--

/*!50001 DROP VIEW IF EXISTS `show_oa_re_dayreport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_oa_re_dayreport` AS select `t`.`FID` AS `FID`,`t`.`VERSION` AS `VERSION`,`t`.`FTITLE` AS `FTITLE`,`t`.`FCREATEOGNID` AS `FCREATEOGNID`,`t`.`FCREATEOGNNAME` AS `FCREATEOGNNAME`,`t`.`FCREATEDEPTID` AS `FCREATEDEPTID`,`t`.`FCREATEDEPTNAME` AS `FCREATEDEPTNAME`,`t`.`FCREATEPOSID` AS `FCREATEPOSID`,`t`.`FCREATEPOSNAME` AS `FCREATEPOSNAME`,`t`.`FCREATEPERSONID` AS `FCREATEPERSONID`,`t`.`FCREATEPERSONNAME` AS `FCREATEPERSONNAME`,`t`.`FCREATEPERSONFID` AS `FCREATEPERSONFID`,`t`.`FCREATEPERSONFNAME` AS `FCREATEPERSONFNAME`,`t`.`FCREATETIME` AS `FCREATETIME`,`t`.`FPUSHDATETIME` AS `FPUSHDATETIME`,`t`.`FFILE` AS `FFILE`,`t1`.`FPERSONID` AS `fpersonid`,`t1`.`FBROWSE` AS `fbrowse` from (`oa_re_dayreport` `t` left join `oa_notice_person` `t1` on((convert(`t`.`FID` using utf8mb4) = `t1`.`FMAINID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_oa_re_monthreport`
--

/*!50001 DROP VIEW IF EXISTS `show_oa_re_monthreport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_oa_re_monthreport` AS select `t`.`FID` AS `FID`,`t`.`VERSION` AS `VERSION`,`t`.`FTITLE` AS `FTITLE`,`t`.`FCREATEOGNID` AS `FCREATEOGNID`,`t`.`FCREATEOGNNAME` AS `FCREATEOGNNAME`,`t`.`FCREATEDEPTID` AS `FCREATEDEPTID`,`t`.`FCREATEDEPTNAME` AS `FCREATEDEPTNAME`,`t`.`FCREATEPOSID` AS `FCREATEPOSID`,`t`.`FCREATEPOSNAME` AS `FCREATEPOSNAME`,`t`.`FCREATEPERSONID` AS `FCREATEPERSONID`,`t`.`FCREATEPERSONNAME` AS `FCREATEPERSONNAME`,`t`.`FCREATEPERSONFID` AS `FCREATEPERSONFID`,`t`.`FCREATEPERSONFNAME` AS `FCREATEPERSONFNAME`,`t`.`FCREATETIME` AS `FCREATETIME`,`t`.`FPUSHDATETIME` AS `FPUSHDATETIME`,`t`.`FFILE` AS `FFILE`,`t1`.`FPERSONID` AS `fpersonid`,`t1`.`FBROWSE` AS `fbrowse` from (`oa_re_monthreport` `t` left join `oa_notice_person` `t1` on((convert(`t`.`FID` using utf8mb4) = `t1`.`FMAINID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_oa_re_weekreport`
--

/*!50001 DROP VIEW IF EXISTS `show_oa_re_weekreport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_oa_re_weekreport` AS select `t`.`FID` AS `FID`,`t`.`VERSION` AS `VERSION`,`t`.`FTITLE` AS `FTITLE`,`t`.`FCREATEOGNID` AS `FCREATEOGNID`,`t`.`FCREATEOGNNAME` AS `FCREATEOGNNAME`,`t`.`FCREATEDEPTID` AS `FCREATEDEPTID`,`t`.`FCREATEDEPTNAME` AS `FCREATEDEPTNAME`,`t`.`FCREATEPOSID` AS `FCREATEPOSID`,`t`.`FCREATEPOSNAME` AS `FCREATEPOSNAME`,`t`.`FCREATEPERSONID` AS `FCREATEPERSONID`,`t`.`FCREATEPERSONNAME` AS `FCREATEPERSONNAME`,`t`.`FCREATEPERSONFID` AS `FCREATEPERSONFID`,`t`.`FCREATEPERSONFNAME` AS `FCREATEPERSONFNAME`,`t`.`FCREATETIME` AS `FCREATETIME`,`t`.`FPUSHDATETIME` AS `FPUSHDATETIME`,`t`.`FFILE` AS `FFILE`,`t1`.`FPERSONID` AS `fpersonid`,`t1`.`FBROWSE` AS `fbrowse` from (`oa_re_weekreport` `t` left join `oa_notice_person` `t1` on((convert(`t`.`FID` using utf8mb4) = `t1`.`FMAINID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-27 21:04:22
