-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: tlv8-vue
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
-- Table structure for table `im_fileinfo`
--

DROP TABLE IF EXISTS `im_fileinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_fileinfo` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `savetype` int(11) DEFAULT NULL,
  `saveinfo` text COLLATE utf8mb4_unicode_ci,
  `fsize` longtext COLLATE utf8mb4_unicode_ci,
  `folderid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_fileinfo`
--

LOCK TABLES `im_fileinfo` WRITE;
/*!40000 ALTER TABLE `im_fileinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `im_fileinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im_group`
--

DROP TABLE IF EXISTS `im_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_group` (
  `id` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `head` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `im_group_creator` (`creator`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_group`
--

LOCK TABLES `im_group` WRITE;
/*!40000 ALTER TABLE `im_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `im_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im_group_memli`
--

DROP TABLE IF EXISTS `im_group_memli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_group_memli` (
  `id` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupid` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `im_group_memli_userid` (`userid`) USING BTREE,
  KEY `im_groupm_groupid` (`groupid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_group_memli`
--

LOCK TABLES `im_group_memli` WRITE;
/*!40000 ALTER TABLE `im_group_memli` DISABLE KEYS */;
/*!40000 ALTER TABLE `im_group_memli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im_header`
--

DROP TABLE IF EXISTS `im_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_header` (
  `userid` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `head` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_header`
--

LOCK TABLES `im_header` WRITE;
/*!40000 ALTER TABLE `im_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `im_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im_message`
--

DROP TABLE IF EXISTS `im_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_message` (
  `mid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mcontenttype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mcontent` longtext COLLATE utf8mb4_unicode_ci,
  `mfrom` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mto` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mstate` int(11) DEFAULT NULL,
  `isgroup` int(11) DEFAULT NULL,
  `msendtime` datetime DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  KEY `im_message_from` (`mfrom`) USING BTREE,
  KEY `im_message_state` (`mstate`) USING BTREE,
  KEY `im_message_to` (`mto`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_message`
--

LOCK TABLES `im_message` WRITE;
/*!40000 ALTER TABLE `im_message` DISABLE KEYS */;
INSERT INTO `im_message` VALUES ('C47C108FEC7F49C29D991D3454D03E4B','content','[{\"text\":\"22\"}]','DC349D31F5FE4113ABA2BBC06B1E42D7','PSN01',0,0,'2024-11-21 22:44:31'),('FF229591BE254B708B97463699D33088','content','[{\"text\":\"11\"}]','PSN01','DC349D31F5FE4113ABA2BBC06B1E42D7',1,0,'2024-11-21 22:41:48');
/*!40000 ALTER TABLE `im_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `im_message_memli`
--

DROP TABLE IF EXISTS `im_message_memli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `im_message_memli` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tid` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `im_message_memli_mid` (`mid`) USING BTREE,
  KEY `im_message_memli_tid` (`tid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `im_message_memli`
--

LOCK TABLES `im_message_memli` WRITE;
/*!40000 ALTER TABLE `im_message_memli` DISABLE KEYS */;
/*!40000 ALTER TABLE `im_message_memli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_doclog`
--

DROP TABLE IF EXISTS `sa_doclog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_doclog` (
  `sid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `spersonname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `saccesstype` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限类型',
  `sdocid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文档ID',
  `stime` datetime DEFAULT NULL COMMENT '操作时间',
  `sdeptname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门',
  `spersonfid` text COLLATE utf8mb4_unicode_ci COMMENT '人员ID路径',
  `sdocversionid` int(11) DEFAULT NULL COMMENT '文档版本',
  `sdocname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文档名称',
  `ssize` double DEFAULT NULL COMMENT '文档大小',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='文档日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_doclog`
--

LOCK TABLES `sa_doclog` WRITE;
/*!40000 ALTER TABLE `sa_doclog` DISABLE KEYS */;
/*!40000 ALTER TABLE `sa_doclog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_docnamespace`
--

DROP TABLE IF EXISTS `sa_docnamespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_docnamespace` (
  `sid` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sdisplayname` text COLLATE utf8mb4_unicode_ci COMMENT '显示名称',
  `shost` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主机地址',
  `sport` int(11) DEFAULT NULL COMMENT '服务端口',
  `surl` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '访问地址',
  `sflag` int(11) DEFAULT NULL COMMENT '使用状态',
  `shtths` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否HTTPS',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='文档配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_docnamespace`
--

LOCK TABLES `sa_docnamespace` WRITE;
/*!40000 ALTER TABLE `sa_docnamespace` DISABLE KEYS */;
INSERT INTO `sa_docnamespace` VALUES ('defaultDocNameSpace','文档中心','127.0.0.1',8085,'http://127.0.0.1:8085/DocServer',1,'false',5);
/*!40000 ALTER TABLE `sa_docnamespace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_docnode`
--

DROP TABLE IF EXISTS `sa_docnode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_docnode` (
  `sid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sparentid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '父id',
  `sdocname` text COLLATE utf8mb4_unicode_ci COMMENT '名称',
  `ssequence` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '排序',
  `ssize` double DEFAULT NULL COMMENT '文件大小',
  `skind` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型',
  `sdocpath` text COLLATE utf8mb4_unicode_ci COMMENT '文件id路径',
  `sdocdisplaypath` text COLLATE utf8mb4_unicode_ci COMMENT '文件路径名称',
  `screatorfid` text COLLATE utf8mb4_unicode_ci COMMENT '创建人全id',
  `screatorname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `screatordeptname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建部门',
  `screatetime` datetime DEFAULT NULL COMMENT '创建时间',
  `seditorfid` text COLLATE utf8mb4_unicode_ci COMMENT '编辑人全id',
  `seditorname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编辑人名称',
  `seditordeptname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编辑部门',
  `slastwriterfid` text COLLATE utf8mb4_unicode_ci COMMENT '最后修改人全id',
  `slastwritername` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后修改人名称',
  `slastwriterdeptname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后修改部门',
  `slastwritetime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `sfileid` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件id',
  `sdescription` longtext COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `sdocliveversionid` int(11) DEFAULT NULL COMMENT '文件版本号',
  `sclassification` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类',
  `skeywords` text COLLATE utf8mb4_unicode_ci COMMENT '关键字',
  `sdocserialnumber` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文档序列',
  `snamespace` text COLLATE utf8mb4_unicode_ci COMMENT '文档空间',
  `scachename` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缓存名称',
  `srevisioncachename` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编辑缓存',
  `sflag` int(11) DEFAULT NULL COMMENT '状态',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `idx_sa_docnode` (`sparentid`) USING BTREE,
  KEY `idx_sa_docnode_sfileid` (`sfileid`) USING BTREE,
  KEY `inx_sa_donnode_skind` (`skind`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='文档信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_docnode`
--

LOCK TABLES `sa_docnode` WRITE;
/*!40000 ALTER TABLE `sa_docnode` DISABLE KEYS */;
INSERT INTO `sa_docnode` VALUES ('root',NULL,'文档中心','',NULL,'dir','/root','/文档中心','','','',NULL,'','','','','','',NULL,'','',NULL,'','','','defaultDocNameSpace','','',1,NULL);
/*!40000 ALTER TABLE `sa_docnode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_flowdrawlg`
--

DROP TABLE IF EXISTS `sa_flowdrawlg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_flowdrawlg` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sprocessid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程图id',
  `sprocessname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流程图名称',
  `sdrawlg` longtext COLLATE utf8mb4_unicode_ci COMMENT '流程图文本',
  `sprocessacty` longtext COLLATE utf8mb4_unicode_ci COMMENT '流程图JSON',
  `screatorid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人id',
  `screatorname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `supdatorid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人id',
  `supdatorname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人名称',
  `screatetime` datetime DEFAULT NULL COMMENT '创建时间',
  `supdatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `fenabled` int(11) DEFAULT NULL COMMENT '状态',
  `sfolderid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目录id',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `idx_sa_flowdrawlg_sprocessid` (`sprocessid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='流程图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_flowdrawlg`
--

LOCK TABLES `sa_flowdrawlg` WRITE;
/*!40000 ALTER TABLE `sa_flowdrawlg` DISABLE KEYS */;
INSERT INTO `sa_flowdrawlg` VALUES ('8729A781E09B42F283EFEE0FB2F7EF68','EFB1385BEB1441BCA87404D318B7F9BC','测试流程','<v:line title=\"New Line\" style=\"position: absolute; z-index: 1; cursor: pointer; display: none;\"><v:stroke></v:stroke></v:line><div id=\"bizActivity\" title=\"New bizActivity\" style=\"border: 1px solid blue; position: absolute; left: 300px; top: 80px; width: 100px; height: 40px; cursor: default; z-index: 100; display: none;\"><v:stroke></v:stroke></div><div id=\"Activity1\" title=\"开始\" style=\"position: absolute; left: 300px; top: 80px; width: 40px; height: 40px; cursor: pointer; z-index: 1;\"><svg id=\"SvgjsSvg1000\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><ellipse id=\"SvgjsEllipse1006\" rx=\"20\" ry=\"20\" cx=\"20\" cy=\"20\" stroke=\"#33cc00\" stroke-width=\"1\" fill=\"#33cc00\"></ellipse><defs id=\"SvgjsDefs1001\"></defs></svg><v:shadow></v:shadow><div style=\"position: inherit; left: 2px; top: 12px; z-index: 1; width: 100%; height: 100%; text-align: center; color: blue; font-size: 9pt;\">开始</div></div><div id=\"bizActivity2\" title=\"bizActivity2\" style=\"border: 1px solid blue; position: absolute; left: 270px; top: 140px; width: 100px; height: 40px; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;\"><div id=\"bizActivity2_Label\" style=\"width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;\">bizActivity2</div></div><div id=\"bizActivity4\" title=\"bizActivity4\" style=\"border: 1px solid blue; position: absolute; left: 270px; top: 200px; width: 100px; height: 40px; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;\"><div id=\"bizActivity4_Label\" style=\"width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;\">bizActivity4</div></div><div id=\"bizActivity6\" title=\"bizActivity6\" style=\"border: 1px solid green; position: absolute; left: 270px; top: 260px; width: 100px; height: 40px; z-index: 99999; background: rgb(255, 255, 255); box-shadow: green 5px 5px 5px;\"><div id=\"bizActivity6_Label\" style=\"width: 100%; height: 100%; margin-top: 6px; text-align: center; color: green; font-size: 10pt; line-height: 25px;\">bizActivity6</div></div><div id=\"Activity8\" title=\"结束\" style=\"position: absolute; left: 300px; top: 320px; width: 40px; height: 40px; cursor: pointer; z-index: 1;\"><svg id=\"SvgjsSvg1007\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><ellipse id=\"SvgjsEllipse1009\" rx=\"20\" ry=\"20\" cx=\"20\" cy=\"20\" stroke=\"red\" stroke-width=\"1\" fill=\"red\"></ellipse><defs id=\"SvgjsDefs1008\"></defs></svg><v:shadow></v:shadow><div style=\"position: inherit; left: 2px; top: 12px; z-index: 1; width: 100%; height: 100%; text-align: center; color: blue; font-size: 9pt;\">结束</div></div><div id=\"line_3\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1010\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1012\" points=\"320,90 320,102\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1011\"></defs></svg></div><div id=\"line_5\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1013\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1015\" points=\"320,150 320,162\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1014\"></defs></svg></div><div id=\"line_7\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1016\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1018\" points=\"320,210 320,222\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1017\"></defs></svg></div><div id=\"line_9\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1019\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1021\" points=\"320,270 320,282\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1020\"></defs></svg></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"><svg id=\"SvgjsSvg1022\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1023\"></defs></svg><svg id=\"SvgjsSvg1024\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1025\"></defs></svg><svg id=\"SvgjsSvg1026\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1027\"></defs></svg><svg id=\"SvgjsSvg1028\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1029\"></defs></svg><svg id=\"SvgjsSvg1030\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1031\"></defs></svg><svg id=\"SvgjsSvg1032\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1033\"></defs></svg><svg id=\"SvgjsSvg1034\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1035\"></defs></svg><svg id=\"SvgjsSvg1036\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1037\"></defs></svg><svg id=\"SvgjsSvg1038\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1039\"></defs></svg><svg id=\"SvgjsSvg1040\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1041\"></defs></svg><svg id=\"SvgjsSvg1042\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1043\"></defs></svg><svg id=\"SvgjsSvg1044\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1045\"></defs></svg></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div>','{\"id\":\"EFB1385BEB1441BCA87404D318B7F9BC\",\"name\":\"测试流程\",\"count\":9,\"nodes\":[{\"id\":\"Activity1\",\"name\":\"开始\",\"type\":\"start\",\"shape\":\"oval\",\"number\":1,\"left\":300,\"top\":80,\"width\":40,\"height\":40,\"property\":null},{\"id\":\"bizActivity2\",\"name\":\"bizActivity2\",\"type\":\"node\",\"shape\":\"rect\",\"number\":2,\"left\":270,\"top\":140,\"width\":100,\"height\":40,\"property\":[{\"id\":\"n_p_id\",\"text\":\"input\",\"value\":\"bizActivity2\"},{\"id\":\"n_p_name\",\"text\":\"input\",\"value\":\"bizActivity2\"},{\"id\":\"n_p_exepage\",\"text\":\"input\",\"value\":\"\\/demo\\/flow\\/mainActivity.html\"},{\"id\":\"n_p_label\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_desc\",\"text\":\"textarea\",\"value\":\"\"},{\"id\":\"n_p_group\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_roleID\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_role\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_r_grab\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_r_grabway\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_t_queryt\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_p_back\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_note\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_r_transe\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_in\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_time\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_timetype\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call1\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call2\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call3\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call4\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call5\",\"text\":\"input\",\"value\":\"\"}]},{\"id\":\"bizActivity4\",\"name\":\"bizActivity4\",\"type\":\"node\",\"shape\":\"rect\",\"number\":4,\"left\":270,\"top\":200,\"width\":100,\"height\":40,\"property\":[{\"id\":\"n_p_id\",\"text\":\"input\",\"value\":\"bizActivity4\"},{\"id\":\"n_p_name\",\"text\":\"input\",\"value\":\"bizActivity4\"},{\"id\":\"n_p_exepage\",\"text\":\"input\",\"value\":\"\\/demo\\/flow\\/mainActivity2.html\"},{\"id\":\"n_p_label\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_desc\",\"text\":\"textarea\",\"value\":\"\"},{\"id\":\"n_p_group\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_roleID\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_role\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_r_grab\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_r_grabway\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_t_queryt\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_p_back\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_note\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_r_transe\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_in\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_time\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_timetype\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call1\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call2\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call3\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call4\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call5\",\"text\":\"input\",\"value\":\"\"}]},{\"id\":\"bizActivity6\",\"name\":\"bizActivity6\",\"type\":\"node\",\"shape\":\"rect\",\"number\":6,\"left\":270,\"top\":260,\"width\":100,\"height\":40,\"property\":[{\"id\":\"n_p_id\",\"text\":\"input\",\"value\":\"bizActivity6\"},{\"id\":\"n_p_name\",\"text\":\"input\",\"value\":\"bizActivity6\"},{\"id\":\"n_p_exepage\",\"text\":\"input\",\"value\":\"\\/demo\\/flow\\/mainActivity2.html\"},{\"id\":\"n_p_label\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_desc\",\"text\":\"textarea\",\"value\":\"\"},{\"id\":\"n_p_group\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_roleID\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_role\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_r_grab\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_r_grabway\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_t_queryt\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_p_back\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_note\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_r_transe\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_in\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_time\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_timetype\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call1\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call2\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call3\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call4\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call5\",\"text\":\"input\",\"value\":\"\"}]},{\"id\":\"Activity8\",\"name\":\"结束\",\"type\":\"end\",\"shape\":\"oval\",\"number\":8,\"left\":300,\"top\":320,\"width\":40,\"height\":40,\"property\":null}],\"lines\":[{\"id\":\"line_3\",\"name\":\"line_3\",\"type\":\"line\",\"shape\":\"line\",\"number\":3,\"from\":\"Activity1\",\"to\":\"bizActivity2\",\"fromx\":320,\"fromy\":120,\"tox\":320,\"toy\":140,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null},{\"id\":\"line_5\",\"name\":\"line_5\",\"type\":\"line\",\"shape\":\"line\",\"number\":5,\"from\":\"bizActivity2\",\"to\":\"bizActivity4\",\"fromx\":320,\"fromy\":180,\"tox\":320,\"toy\":200,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null},{\"id\":\"line_7\",\"name\":\"line_7\",\"type\":\"line\",\"shape\":\"line\",\"number\":7,\"from\":\"bizActivity4\",\"to\":\"bizActivity6\",\"fromx\":320,\"fromy\":240,\"tox\":320,\"toy\":260,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null},{\"id\":\"line_9\",\"name\":\"line_9\",\"type\":\"line\",\"shape\":\"line\",\"number\":9,\"from\":\"bizActivity6\",\"to\":\"Activity8\",\"fromx\":320,\"fromy\":300,\"tox\":320,\"toy\":320,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null}]}',NULL,NULL,NULL,NULL,'2024-01-12 18:05:57','2024-01-12 18:05:57',1,'F92A0C6C8F2F4B5AB30ED547B38F48B0',0),('CAA7A851D81000012321190013501BC9','CAA7A851D83000013D93140DD05F1084','test1','<v:line title=\"New Line\" style=\"position: absolute; z-index: 1; cursor: pointer; display: none;\"><v:stroke></v:stroke></v:line><div id=\"bizActivity\" title=\"New bizActivity\" style=\"border: 1px solid blue; position: absolute; left: 300px; top: 80px; width: 100px; height: 40px; cursor: default; z-index: 100; display: none;\"><v:stroke></v:stroke></div><div id=\"Activity1\" title=\"开始\" style=\"position: absolute; left: 300px; top: 80px; width: 40px; height: 40px; cursor: pointer; z-index: 1; border: 0px none;\"><svg id=\"SvgjsSvg1000\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><ellipse id=\"SvgjsEllipse1006\" rx=\"20\" ry=\"20\" cx=\"20\" cy=\"20\" stroke=\"#33cc00\" stroke-width=\"1\" fill=\"#33cc00\"></ellipse><defs id=\"SvgjsDefs1001\"></defs></svg><v:shadow></v:shadow><div style=\"position: inherit; left: 2px; top: 12px; z-index: 1; width: 100%; height: 100%; text-align: center; color: blue; font-size: 9pt;\">开始</div></div><div id=\"bizActivity2\" title=\"bizActivity2\" style=\"border: 1px solid blue; position: absolute; left: 270px; top: 140px; width: 100px; height: 40px; cursor: default; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;\"><div id=\"bizActivity_Label\" style=\"width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;\">bizActivity2</div></div><div id=\"line_3\" title=\"line_3\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1007\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1009\" points=\"320,90 320,102\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1008\"></defs></svg></div><div id=\"bizActivity4\" title=\"bizActivity4\" style=\"border: 1px solid blue; position: absolute; left: 270px; top: 200px; width: 100px; height: 40px; cursor: default; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;\"><div id=\"bizActivity_Label\" style=\"width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;\">bizActivity4</div></div><div id=\"line_5\" title=\"line_5\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1010\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1012\" points=\"320,150 320,162\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1011\"></defs></svg></div><div id=\"bizActivity6\" title=\"bizActivity6\" style=\"border: 1px solid blue; position: absolute; left: 270px; top: 260px; width: 100px; height: 40px; cursor: default; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;\"><div id=\"bizActivity_Label\" style=\"width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;\">bizActivity6</div></div><div id=\"line_7\" title=\"line_7\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1013\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1015\" points=\"320,210 320,222\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1014\"></defs></svg></div><div id=\"Activity8\" title=\"结束\" style=\"position: absolute; left: 300px; top: 320px; width: 40px; height: 40px; cursor: pointer; z-index: 1; border: 1px dashed green;\"><svg id=\"SvgjsSvg1016\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><ellipse id=\"SvgjsEllipse1018\" rx=\"20\" ry=\"20\" cx=\"20\" cy=\"20\" stroke=\"red\" stroke-width=\"1\" fill=\"red\"></ellipse><defs id=\"SvgjsDefs1017\"></defs></svg><v:shadow></v:shadow><div style=\"position: inherit; left: 2px; top: 12px; z-index: 1; width: 100%; height: 100%; text-align: center; color: green; font-size: 9pt;\">结束</div></div><div id=\"line_9\" title=\"line_9\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1019\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1021\" points=\"320,270 320,282\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1020\"></defs></svg></div>','{\"id\":\"CAA7A851D83000013D93140DD05F1084\",\"name\":\"test1\",\"count\":9,\"nodes\":[{\"id\":\"Activity1\",\"name\":\"开始\",\"type\":\"start\",\"shape\":\"oval\",\"number\":1,\"left\":300,\"top\":80,\"width\":40,\"height\":40,\"property\":null},{\"id\":\"bizActivity2\",\"name\":\"bizActivity2\",\"type\":\"node\",\"shape\":\"rect\",\"number\":2,\"left\":270,\"top\":140,\"width\":100,\"height\":40,\"property\":null},{\"id\":\"bizActivity4\",\"name\":\"bizActivity4\",\"type\":\"node\",\"shape\":\"rect\",\"number\":4,\"left\":270,\"top\":200,\"width\":100,\"height\":40,\"property\":null},{\"id\":\"bizActivity6\",\"name\":\"bizActivity6\",\"type\":\"node\",\"shape\":\"rect\",\"number\":6,\"left\":270,\"top\":260,\"width\":100,\"height\":40,\"property\":null},{\"id\":\"Activity8\",\"name\":\"结束\",\"type\":\"end\",\"shape\":\"oval\",\"number\":8,\"left\":300,\"top\":320,\"width\":40,\"height\":40,\"property\":null}],\"lines\":[{\"id\":\"line_3\",\"name\":\"line_3\",\"type\":\"line\",\"shape\":\"line\",\"number\":3,\"from\":\"Activity1\",\"to\":\"bizActivity2\",\"fromx\":320,\"fromy\":120,\"tox\":320,\"toy\":140,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null},{\"id\":\"line_5\",\"name\":\"line_5\",\"type\":\"line\",\"shape\":\"line\",\"number\":5,\"from\":\"bizActivity2\",\"to\":\"bizActivity4\",\"fromx\":320,\"fromy\":180,\"tox\":320,\"toy\":200,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null},{\"id\":\"line_7\",\"name\":\"line_7\",\"type\":\"line\",\"shape\":\"line\",\"number\":7,\"from\":\"bizActivity4\",\"to\":\"bizActivity6\",\"fromx\":320,\"fromy\":240,\"tox\":320,\"toy\":260,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null},{\"id\":\"line_9\",\"name\":\"line_9\",\"type\":\"line\",\"shape\":\"line\",\"number\":9,\"from\":\"bizActivity6\",\"to\":\"Activity8\",\"fromx\":320,\"fromy\":300,\"tox\":320,\"toy\":320,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null}]}',NULL,NULL,NULL,NULL,'2024-03-06 11:33:04','2024-03-06 11:33:04',1,'F92A0C6C8F2F4B5AB30ED547B38F48B0',2);
/*!40000 ALTER TABLE `sa_flowdrawlg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_flowfolder`
--

DROP TABLE IF EXISTS `sa_flowfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_flowfolder` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sprocessid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流程图id',
  `sprocessname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流程图名称',
  `scode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目录编号',
  `sname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目录名称',
  `sparent` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '父id',
  `sidpath` text COLLATE utf8mb4_unicode_ci COMMENT 'id路径',
  `snamepath` text COLLATE utf8mb4_unicode_ci COMMENT '路径名称',
  `scodepath` text COLLATE utf8mb4_unicode_ci COMMENT '编号路径',
  `version` int(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `idx_sa_flwfolder_sparent` (`sparent`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='流程目录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_flowfolder`
--

LOCK TABLES `sa_flowfolder` WRITE;
/*!40000 ALTER TABLE `sa_flowfolder` DISABLE KEYS */;
INSERT INTO `sa_flowfolder` VALUES ('F92A0C6C8F2F4B5AB30ED547B38F48B0',NULL,NULL,'root','流程图',NULL,'/F92A0C6C8F2F4B5AB30ED547B38F48B0','/流程图','/root',0);
/*!40000 ALTER TABLE `sa_flowfolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_handwr_signature`
--

DROP TABLE IF EXISTS `sa_handwr_signature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_handwr_signature` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spersonid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '人员id',
  `spersonname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `screaterid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人id',
  `screatername` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `screatetime` datetime DEFAULT NULL COMMENT '创建时间',
  `shspic` longblob COMMENT '签名图片',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='手写签名';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_handwr_signature`
--

LOCK TABLES `sa_handwr_signature` WRITE;
/*!40000 ALTER TABLE `sa_handwr_signature` DISABLE KEYS */;
INSERT INTO `sa_handwr_signature` VALUES ('PSN01','PSN01','system','PSN01','system','2024-03-04 11:29:34','PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0d\0\0\0<\rÀ\0\0\0	pHYs\0\0\0\0\0\0\0\nMiCCPPhotoshop ICC profile\0\0xڝSwX÷>\߷eVB\ذ±l\0\"#¬\ȐY¢\0a@Ņ\nVHUĂ\՜nH\⠨¸gAZU\\8\§µ}z\\?׻¼\眜缜ι\Ϗ&\梪\09R<:\؟OH\ĉ½H\Ġ\朋\§\Ŝ0\0ퟏ?~t°?ü¯o\0\0p\ծ$\ǜῃºP&W\0 \0\ܢ\狁R\0\ȮT\Ȕ\0\Ș\0°S³d\n\0\0\0ly|B\"\0ª\r\0\촉>\0ة\ܗ\0آ©\0\0(G$@»\0`UR,À\0 ¬@\".À®Y¶2G½\0vX@`\0B,\̜0 8\0C\̓ L 0ҿ\੟p¸H\0À˕͗K\ҳ¸\МZw򰜠\⡜✂l±Ba)f	\䜢#H\烌\Ό\0\0\Zù\сþ8?\眦\䜡\榜笜ﴅ¢þk𯜢>!񜟾¼\0N\Ϝ_\圥\փp\ǁ°u¿k©[\0\ږ\0h\߹]3\ۉ Z\n\кùy8ü@¡P\ȼ\n\?¡½0\㋾ÿ3\ᯜ˾öü@þ\ۺ𜰱@­À£ýqanv®R\看B1n÷\磾ǅý)\ќⴱ\\,񘉸P\"M\ǹ¹RD!ɕ\⒜鿲񟖽	w\r\0¬OÀN¶µ\ˬÀ~\X\Ҷ\0@~󭌜Z\0g42y÷\0\0¿ù@+\0͗¤\㜰\0¼\蘜\¨L\ƈ\0\0D *°AÁ¬ÀÁ¼ÀaD@$À<B\䀜\n¡ATÀ:\؄µ°\Z \ᐴÁ18\r\眠\\\밗`\¼	A\Ȉa!:b\؜"\Έ\"aH4¤ \鈔Q\"\ŜȲ¤©Bj]H#򭲔9\\@ú\ۜȠ2ü¼G1²Q\Ԃu@¹¨\ZƠs\Ѵ4]¢k\ќZ´=¶¢§\ы\赴\0}c\ѱf\١\\E`X\Z&\ǖc\嘵V5cX7vÀa\\숞\¬GXLXC¨%\죴ºW	1\'\"¨O´%zù\ĸb:±XF¬&\!%^\'_H$ɒ\䎜n!%2IIkH\ۈ-¤S¤>\ҐiL&\됭\ɜޜ䈲¬ ·Oû\ɜÜ䷔:ň\⌉¢$R¤J5e?\儥2B ªQͩ\Ԉª:ZIm vP/S©4u%͛Cˤ-£\Րigi÷h/\鴺	݃EЗ\ҫ\臜霧\郴w\r\r\ǈb(k{§·/L¦ӗ\Ȕ0\ײgoUX*ö*|\ʒ:V~\窔UsU?\չªT«U«^V}¦FU³P\㩉\Ԗ«թU»©6®\ΒwRP\ϑ_£¾_ýúc\r²F H£Tc·\ƙ!\Ʋe񘂜ֲV\묫Mb[²ù\쌶ûv/{LSCsªf¬ff\汜́Ʊ\హٜJ\Ρ\Μr\λ--?-±\֪­f­~­7\ںھ\ڢ\?햜휫\ڜﵰ@,õ:m:÷u	º6ºQºº\۵\Ϝ꾜ӣ\빜鉵\ʵ\霝\чõm??\ꜯ\֜7046l18cퟱ?\諘i¸\Ѱ\ᨑ\˨º\Ĩ£\щ£\'¸&\\㵸>f¬ob¬4\ޥ\ܫ<abi2ۤĤ\Ŝ侩͔kfºѴ\Ӵ\̜̜Ȭܬج\ɜ쎹՜ka¾ټ\ۼ¥E\Ŋ6ǖږ|\˅M÷¬V>VyVõV׬I\֜\\묜뭜֗lPW:˶¨­­\Ķm\ߔ\┏)\ҩõSn\ڱ\켜윮\욜솜?aö%ömö\ϝ\̜\ֻt;|rtu\̶lp¼\뤜ᴃ©ĩ\Ü闧g¡s󵗦K\˒vSm§§nz˕\圚\µ\ӵ£»ܭ\٭\Ԝݜ̽\Ž«ûM.\ɝ\ý\𷘜ⱜ̣§§\³\篞v^Y^û½O³&\ְm\Ȝۜě\ཛྷ˻`:>=eú\Μ郾\ƾz¾¦¾\"\߽¾#~\־~üû;ú\˽ø¿\Ṳ񎅠Á\偽\Z³k¥5»/>B	\rYroÀ򛹣3\ܧ,\ѕ\ʈZú0\̦L\֑\ψ\ߐ~o¦ùL\錶\Ǭ¸iù})*2ª.\ꑴStqt÷,֬\䙻g½񏩌¹;\۪¶rvg¬jlRlc웸¸ª¸xøE񗒴$	\퉜䜄\؜Ľ\㳂\笚3\䚔tc®\圢¹\朩\΋w<Y5Y|8²?\僠BP/O\姮M򄛅OE¾¢¢Q±·¸J<\杖ö8\ݻ}CúhOFu\Ƴ	OR+y¹#󍖄\֞¬\Ϝٱ\٭9£R\ri´+\װ·(·Of++\r\乜歜ʛ\ʷ\䣹s󜛕lLѣ´R®PL/¨+x[[x¸H½HZ\Գ\ߦþ\깣|½°P¸°³ظxY񜠜"¿E»#Sw.1]Rºdxi𜒽\˨˲ýP\☒U򪹜ܲRҥ¥C+W4©\ɜˮ®??adU\流\՛V*_¬p¬¨®ø°F¸\朢WN_\ռõym\ڜڜފ·\ʜ휫H\뤜뮬÷Y¿¯J½jA\Ր𜲭񍜥_mJ\޴¡zjõʹ\͜ʜ̓5a5\훌¶¬\۲¡6£öz]\˖ý­«·¾\٦\ږ¿\ݷ{󎃝;\ޜ¼µ+xWk½E}õn\Ҝ\Zbº¿\澝¸GwOŞ{¥{öE\jtolܯ¿¿²	mR6H:p囀oڛ\횷µpZ*\\停'ߦ|{\㐜衜ΜÜܜÜ͟·õ\눹+\Һ¿u¬-£m =¡½\兀£^G¾·ÿ~\ﱜ㣵\ǵW (=񹤂\㧤§N?=ԙ\ܹ÷Lük]Q]½gCϞ?t\_÷\ɳ\ޜ珝𼰴\"÷b\ۥ·K­=®=G~pý\ሯ[o\륷\˜헼®t􍜫;\ќújÀ\ճ\׸\׮]y½\\웷n&\ݜ¸%ºõøvö\헷\n\ܝzx¯ü¾\ڽ\ꇺ\꿴þ±eÀm\ภÀ`\ϜÙ\þÿӇ\ᜒG\̇\գF#\r\Z½򤎓᧲§\ϜʾVÿy\볫\真ý\⻋\Ϙü\ذùϿ®y©󲯫©¯:\ǣ\ǟ¼\ι=񦼭\Μ۽\︜ﺜ߇½(ü@þP󜑺cǧ\Џ÷>\缾ü/÷󻥒3\0\0\0 cHRM\0\0z%\0\0\0\0ùÿ\0\0\霰\0u0\0\0\ꠜ0\0:\0\0o_\ņ\0\0:IDATx\ڜ콧w\ۘlIm\ٲh»\Ӝ?\￿7©³dYV¤H\ڜըH*\زukqQ)\Ι»v\ՎYYhöhöøW8:\?öh\֠µG{´G{´«=ڣ=Z\՞\휑\휑\Z¬öhöh»9z\?û>²,û\߶̣\ǜ£UÁ[\՞\?\옄<J{,m¼ڣ5X\휑\ʘu\乛\ϝ1N<1\\\휑\Z¬öh\Ϫ¬h¨z\0ú\0񜜕c5\Ǵ4\\­\Ѫ\r\֜'X-o\ў\͆ªjÀ:a<úqÿ\ǜ0\Μ㱁``҆­Áº/C\ղ\`\rÀ\0\0\؉0R\ǜ0|³Fڣ5Xt±v\噿.\䜑򖟷º\ꅈ¸`Às\0/<°¯=𖀟a\ಈ\˶,l\r\֜瀖Y¬\ʙ??yÀþQ\˛|µ	ö\0\0ö\0ü\0\ܧ\0/iÀ_c}LcM\Ϝ괨«5Xcöc¡®\Ƣ]\Å5p\ഫ\᭖qEz\ˠ˲,yÿe\óR\®\\\'$¿¨ü\ՐÀ6§\0¾퟽?ߋÁúkch\룼_\Ĺ¶N¬5X, ªZCµ¼\Ŗü𴖜껸.¿b\ނeýLd3\ޅ¦Lf\ӜnJy\͜Ԝ΃·¹þbTù¹ýxl\ƺ\؋õk¢ÿ¿uퟙ?\תü¾=ZõI\Նx\χ±8\Ă\ݎO:\ŕÁú*þ\Ŝﲯ,,¤P\ԜٕcA/\K)äݍ\׶\寊ù\\\˱÷kbW¤ûv8°\?\ϥ%\ܶ<6\㷜݆T\ڞ­ÁºU\裹6\롬ö\0|\пg±Xûýba2,ü\Zx\'W5݌\㻟\Ƴ~Mݵ\돇~6\r\倌\Z\ⳜƱٗ\Ɲ\ݜֱ¨񜜉°p#f31jC¡:F¿\Đߟ¯Rÿ\½{ژ??a¡ú\'\à\톈0²O9û 6Nÿ\ʷd\՜㍘j¨?\Ƶ\Ȝ°@8z\ݩV\㹨½\ZGCIc@\ќ㼜³\㜠NqC>q#\늹­\⣜⨊¡Á\焘K򄙱t0G !¾f򜏜ܜӹ·Ș]ӼU\䧸ø\ݺ÷¸9Wb3\W\Ĝ꿜ð=ߗyxÿ\לÜלѱB󏶰%\῎\밸¾o+Rù=wÁ\ݴ\°h¨8\Ϙr£¯¡66\䜧¡­õ¸\ƌÁ0L\'qö\㼺w\̜'ªQ\퉜ڜ뜘Frܙ³\ќv\휜»(sAй<\n¹?Ǿ\04\ܜۢ	c\爲´¯M#??c®Z(øc«\灋??ⷍ~M¯	ձ\'aÀ\и;^w«ü£_\⵺\ȯ!gûy\Μ⑸M	ÁVè1$%gx򝜃/>sr|¢®\rU5µ¥H\\7_ü5¤}K¥??^÷¾ÿUùϽ#\ᾄP󄮭%CU7¬\ʩfD󄜢\ꤸXOWԘ\ᛚ\?󹮤\뜯\¸m\ʂ-\妝 *\Ř\ۜ渗\毴a¯¢úÀ\Ĝ㹪µ??ְþ!\☵>^­\؜rø4\ូ~KԊ[}\᯦q»q\"\Ŧ[Ol\؄j´r\Ȥ¼\ZiJ¹\˰P¹H-/ڐP]o)\ܜȖ¹>\Ɯƕ󜎜皆V\r\ԀkOŖQ\✜r¹?]\჻\앃UÁlj°lºün½{0VȰ\繼¼78C½\"ÿWɂLi`\Μʹz\Ϝ呻p𥪜£\ǡH²@B\뱺q\\q}.p9M\ð2O|\ל\¯ûZ\"\닚¥q¸{Ĵx??'ªW¾*\ۃ.򜩂u58À§I񰾫\㸇\ʍª3Ǻ>µ\μ²񻋁^ù¢0q\ɵ\ݕ£²&´À¶񇄽§񸋃ª4DO(¡4\Z÷y)Àd.Wv!!	\ߍ¸O\",\ٶdEcu\굮\ҜZ\ބr.H\득«{\囜Ŝ݋.ퟆ?g񜘕o\̜С\'\͑\\7a0\Τ|\Ȥm\ĵ}𻀳\Ϝ序-\Ԝ-$\ܚ\Ϝّ4\윩7¹TþT!\\÷\麗\ꉠ*¹(^\⥜眗\✜\Ɯ٥\®G\ؽ$\\Z/㻜:ퟁ?񹼶6$x&b\'\鮪úM¦L\㳉\ƹ^Ⱥ`\p¤\Zþr]\nR?\ü\"\Ȳ\"\蜫^\rz}򓜛r¡/!7s_\쐀¸ª{7??⻲ϳ3G%\ꮜ0͵\ොۂ´®+¨²À\ƫb4¦򾜫q}öS ·±q6\'rc]iª<\ђ\ᕒ^\ќ \r񲚢Ŵ3AS1\ꄮ+МSh맇4}¯ü>®ý·\ℶm­8¨¿𿕬ýU9\܀/kP!|(Ff/\뷱3\ׇW\П\Ϝ啼\Μ㳇\k±úАZ\߱$h򽘜會p\§\Ƈ÷°\赈&\腵c²0/\¸½𻜜¬·񅯯.0TS¦<D͛.\譹¬\ꪝ7\ƴ9m\ǳ\䭶Q·ü+ö\ۘ¨\癑õ\·)W£¸\'[Ft\煗)õ¨+CA\ƧvĈNds3­BC÷L\芳$?ĿW£W\ܰm35dUª\οx)\׽U\ڤ\ޜϥ򠜕Ǌƅܫ\钧«¦*ŏ\Đ}\뜣© ,\恞 J\榜'ú!>B\Σy<@¥4wř#yûú\ϸ?÷\ɽ\Z¬T¯£UCH,J_0ü7??¢\渴g7y¹]!&Kln𞼇C\ög¸* &\'¶z²¥£F5<ª@R%ü\䷘lG\ᘦ\r÷\"K(G!ǁ\Ǳؑµ¡»²ÿ\\Bnl@\ᗒ{(\߷\ߜ㠞{l\߹»&b\Ի²öE\\󟂡\?Qa¸°%üצ¬ǎq»ù¡\⫝̸=ыt\Ö56E|ֆ«\Ͱ8y\瞼-ÁH\ר	\깼o\ĸ\ُû0X&²wLþ\̥a½\Ä\Ŝ˹\䶊ݪ\՜̷\ꈜⓕg4/D\\24ԍX\\6 \֗𡸋\၉󻆦U\ü)΁j\࡬²_\"D?42T\Ե叛\ߵ\휜Ǩ\'\̲!7³a¡õ¶( E¬£ý@\?ܾ5£#NbUª\ηq\ퟜƹ??3ް+\׫\ŜС)\߽\噉dµ\n0DU\ߋ\ȺPε+R+\"򏜢ÿ·$¤\܁=¯c\׉Œp¡\ܧSYKS¹\緊ºw\ͤ\숲¹\Ͱ&\꜄ø\ސ.-T\؏\ų(ü(¤㉐¾ӛvú»2Áe¦úF¨¤􇱈\ķ\ـ½\̅ÐS1\禘\Ϝ䞐ƿ\Ǉ!KõdøV\Ļd\亳4yj\ĴGB¹\\u7¾\糰N}1P#\ՒRøl\ь7	C÷­«\ǖE²!k¾cl`õHBª3£E\ʹk9x\✚¿Cõ𖪬2£!\ﱈU^\䞼oo\՗#\鈲\'\綌(\ѣcb\r»¢xWҔ ]PO$C¤~)¡\靖Ѕ\ٲdü¤¥ij>c\ܔ??`µ#Rúa¨?\̞?dC:\ŜגjgJ\ŜȶNf\\Ɇ M	b\Ķ$z\Z\羀l·\ޯ¢ª<¾_&o[ɑ*t¿\㽥º# e\ʢ4Mg7\֌·񽞴욎¡\࡯א׆\"\ԑ \ēA\\YÁ\ꋪùD)炪V}»:\ΫN\Ò\Ϝ嚛´kg_»\⼇¢\Zõ򗒼¯ZBA۱Z\'gt\ש¸ù n*\뜚¡j[򞈇\'AobHy=&T¹¦󮱛,º*\nᶅVH\ܤ>C\նøDׅ8\rý÷¥¡\nd\朜1i]»ºk\n\Ȏ|޶,\̥ڐ𧯞¿¿¿¸)¯S¡eû¨Fa󜞠\ޥBĥ!\̂|\r\ǜԁ={³?\Ž\뤐¡·nzH\ꇜ0ÿ\Ϝυy¯𕤜֕)¨i(=£34]¤H¿|¿¾­1ƇúÿB\﷕bI\霞Ow\پ$\ì񇂔ÿ35wöö{\ʓR!a¹Àhe\眦{\ٌO\Ѕ9ö\0ÿ\땜Ȝ˗\?\״¡v,­\⁬r:\乜֜Ĝ诈´fo\'±~\֥D\ɥ\Ợ¢·\ʱk­!uJ\؜Ɯٹ\Z\Ë1\̜먜緩\葼.\㽶©lQþ9u\⽟\Ŝ﯒ܛ;qn?±bW=Gw¹½©÷-3õl\02aD\չ\蜞#·¶/H\볳X*\ǂ³ý<󘿯@º󜥝¥[h¢%S\ʜʙ\\4ȵ8	\ҋ??e\✚¤ 5N^U??\ʕ\霟h\煜"¬W¸j;L%öBH\?D-\ݯM]¡Rù\"6\ɏ±qú\Ƨz\Δ\֐\⸜ᜒ\ۊ!\ڕ¡W\굈Tǰ)˝¶!úg¢e\ޕ\䙜쑕sDk򺜲­{	\˻@ý%ª\ݜϜߜ똰\ຜЫ®¢\'\纂\Eiډ¢_}_6C\ܞ{+¢N@q!ai<J\✉l3w± \לѭ{e¦\иUý©]j¨}\䷠\᳛,\ڵڵ\隷/\ʜ籪\윪CTynn|uõkFDÿq`\߳ö\Ф6xɐ;E?¹鱠J¦\ɜШø÷]´\Ԡ0ew\rϛʅ/¤±ú@¶\Ǳ~;a\؋Yo}\̶/\ӜĜڵ\㮂\0«Ir\뜆f*ț\ȨhQF)¿ӚH¶zQ\՜ܝq\ϳ¥A~$Hü¯<®û\츚hX\Z\ٓ\~[ZgWC¢\Ŝ东n¢¦y3»$|Cx¡2~6󊄻(,<,-<-\͐¤\딾¿7p³\䜘T\ȃT9E\ޜƜĜr\β¡Xf\χ\冁²Py}?¢܏ͥe!׹_ün2X3.­y\㳿üWT9`\⚓9n¡\䃚V-lV5QCUvD¡Ȝ§©󓑜䙅¢¼T¯O\ԵDy«\\½\ס´N%\콦>«k\蟅T))\ρd÷Áai\؜䜕õe²b¿º&\ʜҜϜ㦜Ւ]³𚷴@þFz\Ő\\G\'\Ѕsm^aױ°\ߩ\ȱ®«o\ߋXn\ӽR(	ٻsS½\\}\ΜŰ049ވï¸\ʜú÷û:]\ػ~õ\"\ݜȄW¯q\ÜƜϿױ¨ü1\꜅ýSQ\,\"\Ȭ\㻲©ƪcΚ׉)ºmA>h\ഴ\ݍ\ø±ý\Я񽏑]\nq?´k\ձfõ\޷\ՠ©*LY*\좨:²*eå\뜚,\Ϲܴ·¨2pfD`ʋ·Q\匹&þL́\ݜĔץ\眬´´zi\Ꭱr·\歹\ԴFK\ﳘ¤x󌄜۱pzöNª¹½L\à\ZÀ!ª\"z\ޜ߷񻖘-*\֜©5!´¬\Z \ݑ?\žbZböդv\㰼6$xݎNgh¥3\˹u\ZP\Ѿ۱¬õmC°Yb-B\Щüa\﫸¾TmX\r°c*ª5v=3\0ûJk\Ђ֦°¥/C\˜rbq\ݕù®\ܜ\X[¨±¬%֞(?gf¸¶±𩅌Fw\Мھm\ৡ\損©:a¼+c\Գ\׳:±9\ߜ⻝\Z8Àl)T·Ah(\ԾL\Z\Οp,¨\άtT N°¸r\ú\"(\윊󆱎¥7\÷(Hjõ*w.>\ݓ\rۣjI!ym\뉜啉\ѯõ¢J¸\Μᠽ񻲻¾8b+ߑ\т¼򙫲N\0.>7\ªeaMP\Ϝ휉\֫\赥uAy|\õBCE+¨¦\no\Լ\Ĭ_&߶𣜜(: cQw®y\ǜؙp/\Đùÿ1ú \糄=Q·zû÷\ǹybG\\÷2¡¹La\ཪD\ŵ\ԓK¨\י¦\๜ꉪ#.𽒜ǇùYg[j.T±@H蚒ü06\ܓ	·´ö1t\ŖIû±¶>°Á?ÀlKN\ȑAc4R\no¥U:Jq¹\晪þoܫR\Բa¨\ʄ\̥??¾CIK\蜛ý8G±btG³Ô;÷榘h©G=g\Ӳw»K\"U23cg¢U\㜒Tµy °j^¿u\݄Zû\沶ǚÁ?\'\Б¤q,F\뱪l÷񅬜׸(¿\Z¬¹¹eFJ\뵤¨AT}&\ꏃQ򿰅YH¥\ٸF\嚜\ȷøh\ȷ$\豌\媇]@\ؖE\\)\޳\䧡\震ø7¯)њv$\Z)\Λ	y\沱ᅨZ\۷!\ߜ'Op°\nRh°N\徜Р­ɺPg\멋J??콬¤»ö3Rk|&¤cO \:C\É\朔}]i©§\Ǻzտö\뚷$H£õ\\\摂p£z¡h+hN°-£6o}zGP\霚\쯵&)\뜼?\눜Іl!󸌥&\Ӊ^rû²©\㜲ü.»;·O,\̝¦x\ٚÁǒ\"𣠘\̈́RH¡\ݓ٨,\ځµz2\ϕ??l\'??ü\纣!·vk=tõk\\׳x¿\깓h@Xz^D¸ZZ35c«}\띥&\Դ]¼075񂳹%\ڜr񱸜⃜Ի6\̕³®\ќn¹4??Y~]84\ﮱ¤򔵖\ΧbH&\ơ\re¨4X\⼇¶a\Ճ1D=FU¤¬¥\"=6\؀MS\Z¼TfĖ¹\¾oI¨°\턷ie?\ܿ\\ջ9_\?Mù´\׽²F*e°³z\꟡\ڜڜճ¢ퟁ?	TùMؕ??ý\ɜ\\؜µ\ʷùw\\Ui|ª/\Հ\Z[\?y\뜦\Ꝛ;	·LpX:\\÷ө\Ԟ\֬ø¿\\熘¹ K\㜚NP%\ܹO򝜘p\印orEM򺓆|j񲁟 >ÀaM!\ͤ\R!¡HE\옔 Sy\=³Kh1£*£¡N!^	P¶ٓū\命	¢􊴱?󻬒ÿ5½B\r\ֈl&a󅪾W|\뷁XS1¹©\Ϸ1Rn¬´±⣸Wÿõ¬}WKC\ꜜW\àa1ÿA\޳!\깘¥¥iHH\ŷ܉¿ý÷0¦ߢq\ߵõö\̔S«l­÷?5B\͕Bu#\ٜ眓ª(.¸VÙ\ݗ¦»²Yy\Yög\˻õ%\0Fܗö\勜۸ý¬\㽑\Û6¬ª\᎜\'=M.Hq$!»4²y\Z\؆\揜\\ϭ]`P¦\ϷQ5S¥hõq􌍲S§zb`O$d\\T^&\ҎrQ\Ʋ-¼B\הA\އ¦#\죶¿@ºk\ƭr\ɼ \ĮܧoQu\?#u\ߘ°=A5\Ʈ=\ĳ	\߶󫁜Ĝ׏B¥bø^\nú\㻴\켴\͂¯)3þW\䞜r\以Tös	.\0\"Ňu\r\ѷ\蜫^JsTA\₼ퟢ?Q e\ڗ5W$\撾\ʾfKL¼W½3Q\ʑª\ܨ\턹\َ \ṎE\ΝW\̤±\\߰³­Sü\Јõö¾<ÿ\̜䜪󸮯E¸\Тh\刼|Oø9*¦\"*h\ꆼΫE\⻴\庰y\͐.GY6õº\˚S£¹ú !f\˅²\Ć\䔢iü})ߝEӜªõ\շ\Z9S0|«߈°z[u\̌³u¨\đª\춝õյ2§\",%@eý\ꥪ÷¥½\ޜǬOhBבI¤\Ꙝϙf۶\褎-Á¡\޹r,j\ʜ٤\ǜɇi\ǬøoQ¬>²Uú\⑗0À\rѱ\ȳyS Wx \⁒ºqZt:݈	²Q\呩\ᠠ2\Ƽ\\̾´s\Z\Zi=\Ŭ\偩¨\Zn\܉N\Z\ώ,\\.³RM\Y\ÜڶE±h+dO\ȼ¾\镜ܓT3\'J\൹󴜞C\r򜨙\ꍽ¿\\臋Yp*\鱦ꀺ\«P÷q#^ȅQ\Z$/dÓ(>¤\᳜͜ʄ8p,d°&YN9÷Wp²)H	øMù\ܜ͜ম$lՁl¼-;k\؜䓓\rz;W£ɛ«\1\Ĝ뜚\ߵBXC¡a¬v\ð½\"ajޠ\ަfܘ¥\?CG\"`¤Ɩ·5R\ڲ򄜢𺏭 ɡ»&!q\ߐ[zý_\à½A\Ջ¿/!\ҭy\̜ŉ\㭗!%\ќn\ל䙅+¾PU%D\МޛH¨¤ۅx7¨÷򞜈\䜦\ٴ)~O6m*¯\ƹ¬R.\䈶󁐺,\ըRT6Qcø\0R1E/µú\ܼþ7n¿a925H\䥜æ\㢼DK¶b(v³ý£T\Χ\ꅜ'¬p\⫹fG񺜲\ϓeW]9T=Ya\yc1\ʀ5«)\ꙴ\"ú4񳚦B¤\nY\ޟ¾\ٜ淜VûWIÿ«ú¼}¡\֑50\\Tڤ£\Ҵ½h\"\«\r\뒣\ޜ'õ=A½ÁQhªM¬!L\Ľ\T+vDɢwWϿ\"(\Ј6­{\ݔ·\ٜ͢ý/¨÷²\ְq\"F뽡Á\r̶\՜n??"ù]\ԓf\籅Z z ¶)\ՠ\Űõўqeq½\퇟\¡L1\ً\ĉõ/\咳\͛¼\檦±jzɥ(O§r/\߷텚&\鞜ɜƜԤ\繝5ºb¤S]<=£]?\¢ÿFՒ\杜\cO9IEz.y\Ūz\Ԣj¢\ޜޜ\ܫD-d\׵\ׯ\ִA\ߴ¾\\\Μ䜆0yRõL±\Ѯ>\0\ӕÀN\\\n1\ǒ÷ûH/}~\˖ۢ訑{0T¾h;\r8\ʀ\r\䳓\ȁ4®#?\'-}\Ҷ\"D\뜢X¿õ&®\ǟ񾺙X[\'wlS¸p%h3\̖ɱ򚑤f\ɉ± þނԈ\̐D\ז¨®ɩ%DV?£jG\ÜѪ#T\Ñƨ·6jRõ:´õ\Ѧ!\침-k󑸜Ʊf\먓)\˜ĽOu\n\鼖%µfM!\ˮþAGAi֯*XS\Ǵۖ\謷QTx>>6{\"üX7Qö\ɜ顃1ý5¯¦º0\豕ø>Ár-Q\n\ᨴ\0HG\옔¬5C`݄¡\ќޕk-\6$A;¢®%\ѽn±¼e¨w]§\ꝜrޅQ~ú8¬\ԽK\ݜߜ̔²\¸¥sq\࿊\Ȍt½0aT\睜\\Zٝ£4kڈ·¦\霚*F¥tɱ þ\鬸\ҐSSg\ᬡ??aA.Xõ\֣«¶¡vP\r\ɴ\毩\蜘i ܁z_­³Dr!\蜢P\﷜Zõ®<Mù\Ŝn\ʛt¤¤q\?.>R´֤-2XDg¨7þ\ӎ©\ƣv1;»/F¨k[T.\ퟜ乑Z\ʴ@½a¡+Dn°<c}\ᱍ*EFk,\Ĳ¨*vP\뜏	¼÷[a{@ù:6ü#\կ¸J\݇}h-C¸\҈\Z&ք\ك\ޫ-K𐗜搦Mq񡳾¾EB\ɴ ÷֐º£\'W\Ͽ<~\ހl·¬ANOÁϮHûc3³¿ùkSI¨<\שB\ܲ\܃½®¬c*ߔº¤h\Ɯ갼\쫔³ý\ǘ®\\§\Z >\фǇS\ĸ \׻5º*ÿ¶&\ᜢPЪ¦:\ԝ\n\ǒ\"ÿ®§&a·RF??ªŨڬ÷`*¿אb\ӗފ\Z;2À\뚘!V\✧J¸õ²¦\bst¹\\fµc4\Ҫ¦\͠5\ꭆfUu#±%\ȃ񜢃\̎.PI:	£%@̳\ڊӚ¥\菱!uj񠁱\հyù³½N]½t5º&S\Ȃl\ǺNִ\?ꖱ0¶zzQ\恩	û¨O5N¹	¯ݹ#C\곜傍·\˜᜜ÃQGµ¨¼c¢M򕪜ႮýªLþý¸\由\α [Zt\᳡ý;¦B\朲ߗb\؈³ý꼫\?WH·#򁦗¨w\µ®ªk\έ¯;_\²/¯\ဘ\ԇ\΄d𐜩BdX,¬襏\ٖĺ¨i\"c??󄡹F\0»)hC\˷t£󱴜㜧¼+\ꙩ򜈈\֜뜢Zm<CL;<<~jӤnM9\і½\㜆ü©õ\ᜮ«\쬡ö̿\Ĝ숱\ۜZª=Z·(H??F²\nþQ®\燋%	bg\ҥ\됿\Z\ٴ\휜\rc\ʸu¬܌\\n$ú³iS!\ۿ\nºj\n\ٳ»·\ӄb.M𜩣>F¬󥘬¼-D59¢}³wDװ0\Ҝ㜮¾$&\ƕ)JH%À\ިf\?£º.\\\ά\ˠ?¨z ;eܕn\✢bX¨\粽÷§\і»z\헌\ꉇ·\'\罠\ᜫõ񴃜ԫ2³嵒\孌\Μ훈¯-§\Ɯ픉ŕ\Ȣx´µûM±-²[\ᜭ¶󹆺)󔴜ϊS3ùy\"\\?܄²¨W<\̻\̋\Ի\ĜҨöM) \ޥ¸÷\ٜrV¢??7¸øþuk\ڜ̏󸒼7\Ǧª:¿\٨®\ָM/j\ƺ§m¶%{õ6À¬{ª÷#>^z°7B¼j\㲆!x\꺗²\خP\՜?ŹQ¥h)¶«yz­\ڱ\깠½\ķvria켐Yc¥\?ܷ°^{\Ꮜui\³N^4®ü*\Z欝\ZI=ìeG\ŜN\ʜɩ`¹±f<y \귦ª\\\\ㅟ©??õy0[k\Z_ZH\蜊!A¨1`Ԛ,8=\ԫ´T\ݞ\ع¡h0N\揮q[¡õyӡ!5򵜰ҍ󜡜汜ē´¢\Α\x[T«\耍¯>¬õ<ÀUq-ùGaú\ӡª\̸&R\5\陂\Τ*)\?̜´\ќ\EK¦H½.)#®ym߉¨\ɣ\㜣2Cq:\Քc¶%\Μ"~²l0@\ˌ \ⷱ\ݜےýªT%g\'¨Z_\ɷ\'ø8±K3X	NZ¿ùW\Ͽ/\Ѡ³ɠ\ڜ\숕\⨷Ɋ¥3(Á»z񜩥y\ݜҶ򧓹\ꑻ¥BR=hmVªg\͐\┵\귷J \ޫ\认ý\"\ۇ¢\0±õ󉠃)\깙>u\"\ƃÿ\ǲÿ^75´S4weX])\'\Ά\Z\ī,q\ͳ\̎y򺔆\ڴOc^QA\ͤ³5º\˺\"\\\﬐A3»®S!\ҷqû\ŜꇜӰB\ﻇÿ£u`±\鳋1c\㑝𜨢\޳\Kn!l²h7\³i¼Vŀ\좜ʝ\ќr¦|7©½󺐀ø6?¯O»iJ\䊱(\꜃0þD(z*\ᜇMy$Ĉ\콕\"\ճƠ\乖¨¯·j)Cé[\ȯӑA=6\ۈÿª\űN¼\Lý\ܐ~n\ꘗf\阜ڤUÀk\ᐜϐ\ѹc\윝J\̜\φ\̶O`򜯱ûT­­됩¢\ZW6]\Գ¨Q\꜕\Z¡|ö\ɷ\rY|\߄ùõ4õ(\ᜌ	b赆zS2͉q򳑓:$¼[)DhW}I¬\ŜӜ"\ﬡ`¢\臜Ԝǯ-cK%ۦ\އ-Ϙ\nú\nõ¹y\ꝗ\ZđnB&Ou\✚½®\挩f\뜜퀕\߃ø7\\õ#S5cM³úI󩖞*\řir\λA«qr¸*Pꢵ\Ꙝ暷§ý4Ӛ0\҅\✤\畍¹#R;5\揋\ÿju󥛬$¼A\朦øJDj\ߥ򖛜rRº.\£#E󫒽¹u:0{n?A\ߤU\nÿU\✠){­»LD¸¥\nY󻜜髩lׅRѣgaªµ]CP9f[¨\ݳR*\؍\Е\烼	\ᅠ¬MY+Tu|o\㾱:`\"÷\肜[\\\孜휈\稙ٖû¢¬\ʛ6÷\"\㓛9?O𼨜¸cu¶gNPo٬-º9.-_À«ªc\ʑ/K¡\̌÷û\ϴ_24\硜朅ö\̵bªj#;¯\꽦®\ۏ¼/\ܕ\ؘ\ߜƳ\Ԝ眄Av킠\ʜ༃¢YÁ]\㓸Y*\廦}z\a\ɻ<£»ٶ\ԞFA-^\޻!¥\ƛ\ݔdƫ\?¶¡{\rUº	y§\ֺ̜N@g}\ỔoRkw¨i\ǐM]H9²\ᚸzTg\'/u\봰\ԜĜ휳i\ꜤsS8©g-\ԡ!E\⻹2򗫒\޶\ŜՔJ񻨏W\ʼ*övºÀQbs\ϟBùõ\Z´¾\͋񜮯»ri_û3??ձõ1¸\鳟?\Ȥ3o ꤱ+ܶ®rz!¹7Á\똇Ħm\ny\Z2\Ի;\Ѡm	*a¶W\餐߅(싮sµ\녪?\ϜÑ1􌸔-O\˰\ۼНgi\´Áx8­¢eo©A\ڽb¥ˀ\r-¹º0#\딆õù\ݯ\ ©4}˂UmAÜ«oPõ\̞\䊈*>\'¨dº\ιª±\ڒc\őN\Ęy\"󸾌pp\՜Мrf£¼̚ -1\"º\醢¨4þk¡¡6\뉷ÀpSHt¾w³9d:\蜠P⥽>%\߻ö\β\ܕp°k\ƊvO¸F\r;	¤£ơª³\Z¬\ԛ#A\S!÷uªú\̜ɉ\"H4pz\睷VZ\0ٖ4)\师p¤7A¿¥E\璎^&a\ǜSü\ܨ??̅IΈ.wQek¢Nl&T?I,eυ(c¡E(ø©2S	\r퟇?㜨=r]B\'¨zÓc\Z \ޙAû\Ʒiyz·ԓ,W0;³\Μ玪ÿ¨#T\퍝£»߱\М䶭G\Z\nJd;\ꁦk;\˄\׃4w*P\Ū\0m9¤F\\&K\ޜȚ+$ü^3\圙\ﰄĉ:\'Bg\䘍{ s>(b¼#[¦󃲔f¸k¿~&\߶1;¥§֖\眆\뎚w\\\ˠ-a¬²(±ú&~~`$7\ˉ\Ĝ묐® ¼GB\&²e\͜︊\ƻ\'Ho\ڠ°Dþ!#\'ýnª\Z\Ⲱ®	\QQ\ٱdG±\ٵ\∄Wt7r®K s­\ݔ.s3!xhªª Mu|©{\ǉ\发ZðHӣ÷a¢$«\ڈE\M턫\r\'	ýM\ﵷȢdϛ\Z§y\ﳕ\"\绁öF_Η\豯\бS!¬´^~\"è\ń¼\ᜥþª4J¶\񜂩\ߓ̙p<+¡±\ڰcŐt\ّV\\D,¿!ºrT\ℵÀýp%ӿ@}TT\鎢®ªª7\?M¤ p\ۜ씺ߢ\ꔉ\퓜ԧ\ϵ\ᇜ栚\뮣\徸uiOT\ΡHfXE8\՜΅\џz\ϼ7¶QN\ĵ¡\\\Ӹ\Ǵ 4fb\r娦wÿa!¦#Àþ¿_´\ϔQùU\'MMù$\0Dö\҅z͔®\ᜫ\؛\순Ԝȱ\ª\욊\ǭª	CT¹./pg\ðl\˖O.a\՜۸>1õ¢¼ƹ??!wµg^]¶=\攜㜗rT\֐\Ȝa´\ʢM\՜饜ʷ:\Ɨ¤r¸¼c\ϵ\ԙ¿£ރk\朞\穵3¯m\d¥\䡪ü7v\ҕ:®j\޺С¶G¨úY=Ip¦(¨øC¢±½pn\Ϣ½񞿡J«¡\޲GC\ӗ¨º±\ѹ¶\?Μ?ǽyú\ϱøø6\"S\ޏ\۸WVYús`\ڻ\ʳ|ٶ¬ù-/W\ݯýWo¿A\s¯FB\Ґ \֜ќQ\'\ׄ?\ۃ:\犍\կ¨򮜨UzX\Ȟ󜤧z¨\'qz«¦^\ۈ \㔹®I£\ڜᜡ­pp¿¢w\ٚ¹&cZW)\少s\ӡ°$»÷,\\s\㻮BÁG\ԓ\"\֫úP`¦8<0Gˑt\콳ø{\湽°þ¬¾\ţT½ùY]Áp_BªӸj°^\Žù%þ\¬򖴜̵\΅d\Գ\뾕¯ù\뜨縞§\0.{wh¬4»Y\'Ǫ²2\Ƭ%zùe>\ǌf¬Bdr\䷿P\בZ\픜侳0lrMJbJ\гTx	\ﵳع?\✾D3\Ɯ⒜²! ex\nC%f1eL\sA#lE򚌖ûª¦\'=úi\ʑjpÁ²|\搜Ԝ┨\֕¤\˄PM\켛\'¼ \ޗJ\'\Z±ösU¾+\ț±>®­\ƹ>\'»&\ꡉ»*­¤.¨Xvd\ÿ&¨öLā}A½\˜䐜ݙz{&/E¶/Q\r|\ќȜ眖+ն\͜ﴞ.t\휑M%®#·t)<񪜜x*q\߃ø)o¥7wb\Ձ\ꃺ5X:%w\'۞ «mQ;;\Ŝܜ\r󹷞[1»	½À[	ۢA*Po\r={x,\޾=\ꝸ\㙜\\२`9ҭv3»)C</\ל'3`ETA\Z«\'¨;û	\ᅷ\Ŝ懜漖e³`ߟý\Ğ¢꽦?PeþQ\͜ڜ܆½¾W\'N{ÿø\\\֔.\籡低L;pw»m;½lXT}·¦S\绗·ֻ@Xw¤Ʌ¨jú(a \紱\"&±k¿*\휎À¼ B\믃]½i_\塜?򱧀¯\䬜摾ü\ڜ٢x(QCAv\'吁·¨\'¬s<£­k±ø·£Q«½¯¼+¶xQWûD1_Ɗsú|򯎏\ձkZ{X˱\ݜŬ¿w5õnS㈺ƽ`\ؔ\ވõ2C1¶\ӥւ*¬T8\룢\ˀ\\\T8\ɵ1\꾸\'©\їº<\Z¾¥Gh\ۜ鱜\эV. B[iúK\Ү¥\Ꜣa\\þ@º\炮¦\r0üõö¯\3YԅÀ\㕁rhÿU&¿񹀦Ný=6:¹«\봙\ʜ伶\齔tµz\Z¬}Qlޢj{±G÷\ѓ¯P\蒜"ö\䜔\Ҝ云,\ډbxouö:C=ÁöT<¶.®zS½&´°ͨe\ڊz$\녓´·\؆\\ÿ±_ ʏ\ҍ\°\逜Ұ򥜲7ޱoQϽӰ뢏z󃾹k߸yCM¤û©kªoa-\ǽ\޺ի%r{w°º¨\'J~\࿜⹑ü\ߘ\\ƜϜ'¨§\末\馌Chg8Eu\ވM\˞þD5\덜ǜ'Àc\'y.¬U|&ª \朜\rdA\鄟NÀyzr\圢\铷\㽈bߢ\ʶ׮ª:_qdÀVf$¹öù\搌ARc\ᜥ¼\'ºw\֜\Ӑi\0񜚷XZ ;´û񴜨\熀g	ø½µ7\᷸^l|\Ȱ_\ɷ)´H|6\Z\ԓ\۳E\0\ܫG¿\ܜ\眡\Ü\Ԍ󝠬®l\ܝ!¾÷P\T\✨KS)R򽡡\'!ÿ:ª¨:j¶\"#T\éÿ+\֫L\ǳ¹\̼\Z\·𾃕CG 9\r7qþª¦l´¤z\꜈\眄8\ע´\)\ٿÁ\젇Á򉱓{öjy¬ýN\ŘqM=\׬\ȹk\֜0õ\凜ᄞ¢ª#¥ø¢!lý\♹\˲3\ڜ؜ª>Xxµµ£\⎑¯\¸}3sne\"bÁb¤(¬a­\̨\ط¥ö\ś²L¸a\"¿0\ۯm\횦¼Oõb\֕	¼pTի0RùýZB\ӱ¹=\휍ͤ­õTB\Ҡ¯¶<~#j\Ӝ˺s\ȷ+$Qά+|·֐¨W\>&j\پaH	)Ŕ\ݰkz*öª8°-Ի\UeP{3|\'ª\柜\ɜr	e椽sY}\Ŝ"\0Oe_4퉶1ýbӒ󅖺\ﻜ"\ݕmi¡mj֚!ET¿7\Ӂ\̎]\Ѱ\땄\̜Ȅ¹Q\"§\?\䜜W\ٜ?®þQ¸叴{\'v¬\죞­2¿¦w\ʍ¨0LSc¥¤­O\"\Μru1;v©LÀם^ª\ќӡ¢9&E\쥜\\룹N¬_m7=G\ߵ1;OQ¥uޓ}T}\篱³®®J&3C}S\Ժ\"\ލS\ÛID𻂔¹鴤ù\㮌\סQ¯\類S$\ࠪ\ļ\'\붜͜ȩb\"«ׁ¬þ\՜诖%7(r\䖥¨\׾`\ᜠsT	\ښDN\nr¢¯7\Ӝꙻ񞳪\r\朜' ݝ 	\ϯ¸F|ē;(Up!e\٪~%\湳\ό·\׌Ra\թ\ڴXs\ɶ9}ܴM󞾐𜡜^[=\㲦\"ýNkö·\ﶷ6X\ꜙu\ܶ@k\尜Рa#¡5u,\缬$¸Xh¬þ\'\֯B²_\́5®À0W9]TY\嬶Uuҧ񪱤\Z\ûAW·#U;\rµ¼??\ՍևM0\ۋIǁ\ѡ&\θ\꣜úu¤\ƊˡþD½,kzK\㬽ѵº³\ۚõPsbü\붏\Ԝ'\Ӥ\Ϝ¨\ߺ,üVi\Ұ+T>\̰u±¸2Y.7lúC!ü\Z7<&ͥB܎\꜏CmúUö:¡¾\"Jø\빑Cû\rUv8Ky󫲄_\̑(ĻWj>{¡\렐E\㹬£²	\갋,Ľ\ӥ٫@0¤PoX.³	¸B\]£Rsz𾦻w|D½oú\߲¸+Ői\벜Ȇ%VpW#\捜ƜnSz\؏󷑜☜ޜ%R\ƒ{¯zúÀ?\㱌8¢\0m§\קl\ƜꗸY\'\༝_i+\r§D¥\ő!$_® ;Bõ)7)\使񸃺\Ꜣ\狵\\U?%㷅>Áb®\⁪þl>»5X·G\Ƃ³ûB\ޒ³B\崙 -¯\̏5fi¥<k\ژ|ú:4:\ġù㈔lgû\'ÁS±0u\Ÿ\ߜ\\ڲ\㭘«\Ÿ»úu\\_¡5dLe5\0\ׂ\麆¦ZB\Ϝ霒!\ڏɮ\ڜƇ\뷏Qo%sWFZˬF \օ±wQ	\Ȣj\֫^ü\r\לʜ'#\݋¹\Ŝ묰~3\ٴ±3E£??ձW\ڗ\ﴁõö¼ːʉ\͜ڼ­t󾞏\ͅ¡\'ÿU\ٜǒퟭ?$nHºO-\칝U2\'üº\晑	ºN\n»\\\\ʜƿ5񆜜ھfS®e\시ԫ\n.Ph*¿c\빲h\r\֜헣\ǜ՚\綎\ֆfG³\ӸxWf%_m¶O#t*\룰\"??󯜋\喇þ\ʵ\쏯y_?±{ú7\圢4,<4\κBR\n;¨z\ƏP¯\'l*שۤR5\\̵ۜ²\И\ݜй\蹍PWHύw\Ӝ뜣yn\藜䜜>¹ÁrRU\'¦\0*yO§\ŴXEü¾@º©P¯+\"\₥\괦7¿\לԼ¡±y\鏨O \᣷Rõ-*u򿂴ªü\术*Kk¾\服1\ۼ5ªDKo񜬜r	!÷U{s±¢##ć\ݤ\ۍø^:h\{±õ­ÁºAh\跥$\臡\જ«¶ù½`³٤G\ZEfk\ɜȘ³uH\יX>ݗ<\Ԡ>K\'®f Qµ­ùo\\ÿ:Pb!G򕻜˒ø\ó\ԇp\ǵc\؍¥¡´d¨\統%@´\ɭ2núú[]𫜎\ל̜͐es\֡{|B\别úl:\头±_·F+O¡\˜˝\n\̶¼M¼\¨\ߜ罬*Mո\㶠ɟ\᜚ùW~\С¨\ʻ*=H| Ag(f¶Ӽ¥h{b;o27u\׼»[\ͺh\r\֜ݜÜߌõ\ԃ1\糜漥Ao¤7÷󺴜"񳝰-1P\ɜΜ'¸Rµ´)7£*y(\ራ򤯱64\Ԏ¦tn\Ṇ򷽹;-õ!\▾\纴ÁG³·Gk°ć1bv\Ü屾¿÷\r@Ø(U´Fb$)\ǯ÷\ב]ʥi+¥󧾮ĩ\݃\?ْ\ZgR*J3\\ºK\\¿ö±=¾\УûmZb³ֵ1\ŁꆙX<A½\̣©\̜鯱:/󲃜ޮ6\袶«\眨\݉\⾻\֠ýkn,\ݴ:Y½¿¦¤{Lým\՜r\\㟄q·«5X_\Üƒ\Ü坡½Iڼ	0\휆hö¸\圑k/ÁR\\÷ O¹·oöhaµG{´\ǜߵ贗 =ڣ=Z\՞\휑\휑\Z¬öhöh\rV{´G{´Gk°ڣ=ڣ=\ø¿\0y\ɀ\ݘ̍\0\0\0\0IEND®B`',2);
/*!40000 ALTER TABLE `sa_handwr_signature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_kvsequence`
--

DROP TABLE IF EXISTS `sa_kvsequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_kvsequence` (
  `k` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `v` int(11) NOT NULL,
  PRIMARY KEY (`k`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自动单号索引';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_kvsequence`
--

LOCK TABLES `sa_kvsequence` WRITE;
/*!40000 ALTER TABLE `sa_kvsequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sa_kvsequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_log`
--

DROP TABLE IF EXISTS `sa_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_log` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `stypename` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型名称',
  `sdescription` longtext COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `sprocess` text COLLATE utf8mb4_unicode_ci COMMENT 'Process',
  `sprocessname` text COLLATE utf8mb4_unicode_ci COMMENT '模块名称',
  `sactivity` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '功能',
  `sactivityname` text COLLATE utf8mb4_unicode_ci COMMENT '功能名称',
  `saction` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '动作',
  `sactionname` text COLLATE utf8mb4_unicode_ci COMMENT '动作名称',
  `sstatusname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态名称',
  `screatetime` datetime DEFAULT NULL COMMENT '创建时间',
  `screatorfid` text COLLATE utf8mb4_unicode_ci COMMENT '创建人全id',
  `screatorfname` text COLLATE utf8mb4_unicode_ci COMMENT '创建人全名称',
  `screatorpersonid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人id',
  `screatorpersonname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `screatorposid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人岗位id',
  `screatorposname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人岗位',
  `screatordeptid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人部门id',
  `screatordeptname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人部门',
  `screatorognid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人机构id',
  `screatorognname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' 创建人机构',
  `sip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户端IP',
  `sdevicetype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终端类型',
  `soperatingsystem` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作系统',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_log`
--

LOCK TABLES `sa_log` WRITE;
/*!40000 ALTER TABLE `sa_log` DISABLE KEYS */;
INSERT INTO `sa_log` VALUES ('078792816D3C4C94A0DA9E1B1B12399F','功能页面','{\"flowID\":[\"48C357DFDC2B4D88A28D3F0F34A1420D\"],\"taskID\":[\"4D24D25F3B484616A13C8AFE65158300\"],\"sData1\":[\"D9F40DD3A388405DBAB2F6C5E2393CEF\"],\"task\":[\"4D24D25F3B484616A13C8AFE65158300\"],\"activity-pattern\":[\"do\"],\"language\":[\"zh_CN\"],\"tabId\":[\"D6973CB15B4C5BB72F64851D46A62972\"]}',NULL,'流程',NULL,'流程审批','/demo/flow/mainActivity2.html','打开页面',NULL,'2024-12-25 21:00:46','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('0BA37DA16343453582F8328DC2E71A06','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"7667776866354B469085E9BD7A1146C2\"]}',NULL,'系统管理',NULL,'菜单设置','/system/sysMenu','打开页面',NULL,'2024-11-23 21:11:26','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('0F427750B9584A0CB750970CD9477F9C','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"4D13B453761E5B899CC0206A3D6E1E86\"]}',NULL,'通知公告',NULL,'通知发布','/OA/notice/publicnotice/publicnoticeadd.html','打开页面',NULL,'2024-12-27 20:43:28','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('121B744F7FEB4E399FAAC493A42CA1E4','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"B7B3ED4AFF648686C1FE1314ADFD0038\"]}',NULL,'讨论区',NULL,'分类设置','/OA/forum/Bo_category.html','打开页面',NULL,'2024-12-27 20:47:35','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('1F2CE63DE1D4481E95E81EC42498C448','功能页面','{\"flowID\":[\"48C357DFDC2B4D88A28D3F0F34A1420D\"],\"taskID\":[\"2D81B8BAA3624C29BE4687AB4711068B\"],\"sData1\":[\"D9F40DD3A388405DBAB2F6C5E2393CEF\"],\"task\":[\"2D81B8BAA3624C29BE4687AB4711068B\"],\"activity-pattern\":[\"do\"],\"language\":[\"zh_CN\"],\"tabId\":[\"91E48F74D7E2A31E873BDC412EA9E45E\"]}',NULL,'流程',NULL,'流程审批','/demo/flow/mainActivity2.html','打开页面',NULL,'2024-12-25 21:05:35','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('21B269493F524929B7BD2A50EA087361','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"35BB231EE844412863751504BD6A2AE1\"]}',NULL,'讨论区',NULL,'讨论区设置','/OA/forum/BO_bloglist.html','打开页面',NULL,'2024-12-27 20:52:50','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('2D10820794AC4EBD9DED533F9ED13E40','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"60AB1761F8C0F0C54FC246FA8040536A\"]}',NULL,'内部论坛',NULL,'发帖','/OA/forum/BO_talkl.html','打开页面',NULL,'2024-12-27 20:52:53','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('338D5E37EFA647C3B285768D26547AE1','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"EF704D6A8B3CE3A3506759F1D2B82CD5\"]}',NULL,'通知公告',NULL,'通知列表','/OA/notice/publicnotice/looknoticepushlist.html','打开页面',NULL,'2024-12-27 20:53:08','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('392999D6793D40209D528FEEA6CF3317','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"3C8CC0C3A07DF38310EA6F846EFBF922\"]}',NULL,'日常办公',NULL,'内部邮箱','/OA/email/mainActivity.html','打开页面',NULL,'2024-12-25 21:27:08','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('3C9429F375984AB9AD0FBF31B2E6A291','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"B7B3ED4AFF648686C1FE1314ADFD0038\"]}',NULL,'讨论区',NULL,'分类设置','/OA/forum/Bo_category.html','打开页面',NULL,'2024-12-27 20:52:46','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('48E15193160A4ED9A632FD9EC3641CC1','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"892D19B21D1766A8A1FED950E6B8B7A7\"]}',NULL,'讨论区',NULL,'讨论区管理','/OA/forum/BO_blogManage.html','打开页面',NULL,'2024-12-27 20:52:51','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('4A5604F817DE4679A487C065C362DF05','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"60AB1761F8C0F0C54FC246FA8040536A\"]}',NULL,'内部论坛',NULL,'发帖','/OA/forum/BO_talkl.html','打开页面',NULL,'2024-12-27 20:47:24','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('4D490078D45C413EAC27C786C1EF184F','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"60AB1761F8C0F0C54FC246FA8040536A\"]}',NULL,'内部论坛',NULL,'发帖','/OA/forum/BO_talkl.html','打开页面',NULL,'2024-12-27 20:43:58','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('5127E4D6F9594602BB6B0EA2E3FA7CDF','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"3C8CC0C3A07DF38310EA6F846EFBF922\"]}',NULL,'日常办公',NULL,'内部邮箱','/OA/email/mainActivity.html','打开页面',NULL,'2024-12-25 21:35:56','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('5865F1FD3DDC477CBAF5A0564A3421FB','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"C89A0E1956C113A91A8249591D9B3E30\"]}',NULL,'文档管理',NULL,'文档配置','/docManage/docSetting','打开页面',NULL,'2024-12-25 21:10:27','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('6F6C49E069524810B2D0DFDB67B25A7A','功能页面','{\"flowID\":[\"48C357DFDC2B4D88A28D3F0F34A1420D\"],\"taskID\":[\"4D24D25F3B484616A13C8AFE65158300\"],\"sData1\":[\"D9F40DD3A388405DBAB2F6C5E2393CEF\"],\"task\":[\"4D24D25F3B484616A13C8AFE65158300\"],\"activity-pattern\":[\"do\"],\"language\":[\"zh_CN\"],\"tabId\":[\"D6973CB15B4C5BB72F64851D46A62972\"]}',NULL,'流程',NULL,'流程审批','/demo/flow/mainActivity2.html','打开页面',NULL,'2024-12-25 21:01:51','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('72FAE5362617400286776AECEE12200A','功能页面','{\"language\":[\"zh_CN\"],\"process\":[\"/doc/docSettingProcess\"],\"activity\":[\"/doc/docSettingProcess\"],\"tabId\":[\"383DFCD37CF142F8A22EE5BC517A3A1D\"]}','/doc/docSettingProcess','文档管理','/doc/docSettingProcess','文档配置','/docManage/docSetting','打开页面',NULL,'2024-11-23 21:09:55','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('869F0CEDC1BE49989324C2AAD6ABA1FF','功能页面','{\"flowID\":[\"48C357DFDC2B4D88A28D3F0F34A1420D\"],\"taskID\":[\"189FDC6BB47647AEB3AABF589ED1CD6E\"],\"sData1\":[\"D9F40DD3A388405DBAB2F6C5E2393CEF\"],\"task\":[\"189FDC6BB47647AEB3AABF589ED1CD6E\"],\"activity-pattern\":[\"do\"],\"language\":[\"zh_CN\"],\"tabId\":[\"310D5F4EB58CBFBD100E528779F7257F\"]}',NULL,'流程',NULL,'流程测试','/demo/flow/mainActivity.html','打开页面',NULL,'2024-12-25 21:04:57','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('98EABAF3D1B6405686D01B200EF651E9','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"B7B3ED4AFF648686C1FE1314ADFD0038\"]}',NULL,'讨论区',NULL,'分类设置','/OA/forum/Bo_category.html','打开页面',NULL,'2024-12-27 20:47:27','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('A3A5FF505C8F47F5A3A72DA5464F07AA','功能页面','{\"language\":[\"zh_CN\"],\"process\":[\"/doc/docCenter/process\"],\"activity\":[\"/doc/docCenter/process\"],\"tabId\":[\"0B5307D27B7E41AA9D9D7552F4E97D61\"]}','/doc/docCenter/process','文档管理','/doc/docCenter/process','文档中心','/docManage/docCenter','打开页面',NULL,'2024-11-23 21:09:56','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('A5FAC5880FAF40F0B33B965B67DB0919','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"B7B3ED4AFF648686C1FE1314ADFD0038\"]}',NULL,'讨论区',NULL,'分类设置','/OA/forum/Bo_category.html','打开页面',NULL,'2024-12-27 20:52:49','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('A8F6F65B09AD4859B97D518479A9C99A','功能页面','{\"flowID\":[\"48C357DFDC2B4D88A28D3F0F34A1420D\"],\"taskID\":[\"4B12E1B3069E4AD9A03B660CE415CFBC\"],\"sData1\":[\"D9F40DD3A388405DBAB2F6C5E2393CEF\"],\"task\":[\"4B12E1B3069E4AD9A03B660CE415CFBC\"],\"activity-pattern\":[\"do\"],\"language\":[\"zh_CN\"],\"tabId\":[\"C81B3472E6CD51F0A8412C25A1EE7C8D\"]}',NULL,'流程',NULL,'流程审批','/demo/flow/mainActivity2.html','打开页面',NULL,'2024-12-25 21:05:21','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('AE6B471063C14D939506A56FBFE397D1','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"4D13B453761E5B899CC0206A3D6E1E86\"]}',NULL,'通知公告',NULL,'通知发布','/OA/notice/publicnotice/publicnoticeadd.html','打开页面',NULL,'2024-12-27 20:53:05','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('B3950C693B28453084CCA8457A6F8894','功能页面','{\"flowID\":[\"48C357DFDC2B4D88A28D3F0F34A1420D\"],\"taskID\":[\"189FDC6BB47647AEB3AABF589ED1CD6E\"],\"sData1\":[\"D9F40DD3A388405DBAB2F6C5E2393CEF\"],\"task\":[\"189FDC6BB47647AEB3AABF589ED1CD6E\"],\"activity-pattern\":[\"do\"],\"language\":[\"zh_CN\"],\"tabId\":[\"310D5F4EB58CBFBD100E528779F7257F\"]}',NULL,'流程',NULL,'流程测试','/demo/flow/mainActivity.html','打开页面',NULL,'2024-12-25 21:05:08','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('B3A2EF197A7242BE94E758BF21977B57','功能页面','{\"language\":[\"zh_CN\"],\"process\":[\"/SA/functionTree/process\"],\"activity\":[\"/SA/functionTree/process\"],\"tabId\":[\"sysmenus\"]}','/SA/functionTree/process','系统管理','/SA/functionTree/process','菜单设置','/system/sysMenu','打开页面',NULL,'2024-11-23 21:10:05','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('B62BD7B26C644447AFB3AC4E8B378D83','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"A398B489BD684EE9C11D9682B953F71F\"]}',NULL,'通知公告',NULL,'通知管理','/OA/notice/publicnotice/publicnoticepushlist.html','打开页面',NULL,'2024-12-27 20:53:07','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('BA3623FE5AA7487E93045D18BB22D3F3','功能页面','{\"flowID\":[\"48C357DFDC2B4D88A28D3F0F34A1420D\"],\"taskID\":[\"189FDC6BB47647AEB3AABF589ED1CD6E\"],\"sData1\":[\"D9F40DD3A388405DBAB2F6C5E2393CEF\"],\"task\":[\"189FDC6BB47647AEB3AABF589ED1CD6E\"],\"activity-pattern\":[\"do\"],\"language\":[\"zh_CN\"],\"tabId\":[\"310D5F4EB58CBFBD100E528779F7257F\"]}',NULL,'流程',NULL,'流程测试','/demo/flow/mainActivity.html','打开页面',NULL,'2024-12-25 21:04:35','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('CA732A4EF7AB4CE1A3456F76345C02AA','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"B0BA9CFC3E07166C4A1239A8E01F58BE\"]}',NULL,'流程',NULL,'流程测试','/demo/flow/mainActivity.html','打开页面',NULL,'2024-12-27 20:43:24','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('CA7380C7C1F04A7BAB91022450FBB0DB','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"3C8CC0C3A07DF38310EA6F846EFBF922\"]}',NULL,'日常办公',NULL,'内部邮箱','/OA/email/mainActivity.html','打开页面',NULL,'2024-12-27 20:53:04','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('CED7AE0FF96247BBA70DD25291902C21','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"3C8CC0C3A07DF38310EA6F846EFBF922\"]}',NULL,'日常办公',NULL,'内部邮箱','/OA/email/mainActivity.html','打开页面',NULL,'2024-12-25 21:19:47','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0),('EDACAB8DDB5B490E8DBCAA963A98302B','功能页面','{\"language\":[\"zh_CN\"],\"tabId\":[\"2C81E3F394387A774ECE5F7109FFD0BB\"]}',NULL,'文档管理',NULL,'文档中心','/docManage/docCenter','打开页面',NULL,'2024-12-25 21:10:35','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','PSN01','system','','','','','ORG01','管理员','127.0.0.1','PC',NULL,0);
/*!40000 ALTER TABLE `sa_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_loginlog`
--

DROP TABLE IF EXISTS `sa_loginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_loginlog` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `suserid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户id',
  `susername` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `sloginip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `slogintime` datetime DEFAULT NULL COMMENT '登录时间',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `sserviceip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '服务器IP',
  `sday` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '星期几',
  `sdaynum` int(11) DEFAULT NULL COMMENT '周几',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_loginlog`
--

LOCK TABLES `sa_loginlog` WRITE;
/*!40000 ALTER TABLE `sa_loginlog` DISABLE KEYS */;
INSERT INTO `sa_loginlog` VALUES ('39362301DDC5434F8BDE1ACA198D70CE','PSN01','system','127.0.0.1','2024-12-25 21:00:41','·! @¹#y$¤%^¦&«*µ¸q¢«¥¤°¹{¥¬´ª²­m¨¬µ','192.168.1.3','星期三',4,0),('9C58B2FC216E4FD9ACFFE722B791F30D','PSN01','system','127.0.0.1','2024-11-23 21:09:47','·! @¹#y$¤%^¦&«*µ¸q¢«¥¤°¹{¥¬´ª²­m¨¬µ','192.168.119.1','星期六',7,0),('CCDC4106801F485FA689F3B378FF2B63','PSN01','system','127.0.0.1','2024-12-25 21:35:54','·! @¹#y$¤%^¦&«*µ¸q¢«¥¤°¹{¥¬´ª²­m¨¬µ','192.168.1.3','星期三',4,0),('FED56C1490154A6EA227037B1563423E','PSN01','system','127.0.0.1','2024-12-27 20:43:20','·! @¹#y$¤%^¦&«*µ¸q¢«¥¤°¹{¥¬´ª²­m¨¬µ','192.168.1.3','星期五',6,0);
/*!40000 ALTER TABLE `sa_loginlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_mailset`
--

DROP TABLE IF EXISTS `sa_mailset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_mailset` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱地址',
  `saccount` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `sname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发信名称',
  `stype` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱类型',
  `ssendhost` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发件服务器',
  `ssendpost` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发件端口',
  `sisssl` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发件是否启用SSL',
  `srechost` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件服务器',
  `srecport` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件端口',
  `srecssl` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件是否启用SSL',
  `sispub` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否公用',
  `fcreatepsnfid` text COLLATE utf8mb4_unicode_ci COMMENT '创建人FID',
  `fcreatepsnid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人ID',
  `fcreatepsnname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `fcreatedeptid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门ID',
  `fcreatedeptname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `fcreateognid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构ID',
  `fcreateognname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名称',
  `fcreateorgid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织ID',
  `fcreateorgname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织名称',
  `fcreatetime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='邮箱接口设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_mailset`
--

LOCK TABLES `sa_mailset` WRITE;
/*!40000 ALTER TABLE `sa_mailset` DISABLE KEYS */;
/*!40000 ALTER TABLE `sa_mailset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_onlineinfo`
--

DROP TABLE IF EXISTS `sa_onlineinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_onlineinfo` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `suserid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户id',
  `susername` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `suserfid` text COLLATE utf8mb4_unicode_ci COMMENT '用户路径id',
  `suserfname` text COLLATE utf8mb4_unicode_ci COMMENT '用户路径名称',
  `sloginip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `slogindate` datetime DEFAULT NULL COMMENT '登录时间',
  `ssessionid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户标志',
  `sserviceip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '服务器IP',
  `smachinecode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机器码',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `sa_onlineinfo_sserviceip` (`sserviceip`) USING BTREE,
  KEY `sa_onlineinfo_ssessionid` (`ssessionid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='在线用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_onlineinfo`
--

LOCK TABLES `sa_onlineinfo` WRITE;
/*!40000 ALTER TABLE `sa_onlineinfo` DISABLE KEYS */;
INSERT INTO `sa_onlineinfo` VALUES ('FD431A2692194D57924DDF7F12445412','PSN01','system','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','127.0.0.1','2024-12-27 20:43:20','54fb1db7-c8a9-431f-8eed-3f7544fccbfa','192.168.1.3','06D3C72DFBB4490B878CA394CDB9F8CD',0);
/*!40000 ALTER TABLE `sa_onlineinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_opagent`
--

DROP TABLE IF EXISTS `sa_opagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_opagent` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sorgfid` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织路径id',
  `sorgfname` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织路径名',
  `sagentid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '代理用户id',
  `svalidstate` int(11) DEFAULT NULL COMMENT '状态',
  `sstarttime` datetime DEFAULT NULL COMMENT '开始时间',
  `sfinishtime` datetime DEFAULT NULL COMMENT '结束时间',
  `sprocess` longtext COLLATE utf8mb4_unicode_ci COMMENT '流程id',
  `screatorid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人id',
  `screatorname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `screatetime` datetime DEFAULT NULL COMMENT '创建时间',
  `scantranagent` int(11) DEFAULT NULL COMMENT '是否可以再次代理',
  `version` int(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户代理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_opagent`
--

LOCK TABLES `sa_opagent` WRITE;
/*!40000 ALTER TABLE `sa_opagent` DISABLE KEYS */;
/*!40000 ALTER TABLE `sa_opagent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_opauthorize`
--

DROP TABLE IF EXISTS `sa_opauthorize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_opauthorize` (
  `sid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sorgid` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织id',
  `sorgname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织名称',
  `sorgfid` text COLLATE utf8mb4_unicode_ci COMMENT '组织路径id',
  `sorgfname` text COLLATE utf8mb4_unicode_ci COMMENT '组织路径名称',
  `sauthorizeroleid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '授权的角色id',
  `sdescription` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `screatorfid` text COLLATE utf8mb4_unicode_ci COMMENT '创建人路径id',
  `screatorfname` text COLLATE utf8mb4_unicode_ci COMMENT '创建人路径名称',
  `screatetime` datetime DEFAULT NULL COMMENT '创建时间',
  `srolelevel` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色级别',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `idx_opauth_roleid` (`sauthorizeroleid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='授权信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_opauthorize`
--

LOCK TABLES `sa_opauthorize` WRITE;
/*!40000 ALTER TABLE `sa_opauthorize` DISABLE KEYS */;
INSERT INTO `sa_opauthorize` VALUES ('614F99FC54CB4466BCBF70D43BB05279','5979D9B4A264438C84054F540CB7F032','测试机构','/5979D9B4A264438C84054F540CB7F032.ogn','/测试机构','RL02','任务','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','2023-03-24 15:47:48',NULL,0),('AHR01','PSN01@ORG01','管理员','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','RL01','超级管理员','/ORG01.ogn/PSN01@ORG01.psm','/管理员/system','2009-11-03 00:00:00','0',0);
/*!40000 ALTER TABLE `sa_opauthorize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_opmanagement`
--

DROP TABLE IF EXISTS `sa_opmanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_opmanagement` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sorgid` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织id',
  `sorgname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织名称',
  `sorgfid` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织路径id',
  `sorgfname` text COLLATE utf8mb4_unicode_ci COMMENT '组织路径名称',
  `smanageorgid` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理的组织id',
  `smanageorgname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理的组织名称',
  `smanageorgfid` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理的组织路径id',
  `smanageorgfname` text COLLATE utf8mb4_unicode_ci COMMENT '管理的组织路径名称',
  `smanagetypeid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理类型id',
  `screatorfid` text COLLATE utf8mb4_unicode_ci COMMENT '创建人路径id',
  `screatorfname` text COLLATE utf8mb4_unicode_ci COMMENT '创建人路径名称',
  `screatetime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='管理权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_opmanagement`
--

LOCK TABLES `sa_opmanagement` WRITE;
/*!40000 ALTER TABLE `sa_opmanagement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sa_opmanagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_opmanagetype`
--

DROP TABLE IF EXISTS `sa_opmanagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_opmanagetype` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smanageorgkind` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smanageorgkindname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sleadernumber` int(11) DEFAULT NULL,
  `sissystem` int(11) DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_opmanagetype`
--

LOCK TABLES `sa_opmanagetype` WRITE;
/*!40000 ALTER TABLE `sa_opmanagetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `sa_opmanagetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_opmenutree`
--

DROP TABLE IF EXISTS `sa_opmenutree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_opmenutree` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `layuiicon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '样式图标',
  `url` text COLLATE utf8mb4_unicode_ci COMMENT '路径',
  `process` text COLLATE utf8mb4_unicode_ci COMMENT '流程id',
  `activity` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '环节id',
  `display` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '展示',
  `icon32` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小图标',
  `icon64` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '大图标',
  `pid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '父id',
  `sorts` int(11) DEFAULT NULL COMMENT '排序',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编号',
  `i18n` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '多语言编号',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `idx_sa_function_tree_pid` (`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='菜单信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_opmenutree`
--

LOCK TABLES `sa_opmenutree` WRITE;
/*!40000 ALTER TABLE `sa_opmenutree` DISABLE KEYS */;
INSERT INTO `sa_opmenutree` VALUES ('0B5307D27B7E41AA9D9D7552F4E97D61','文档中心','DatabaseOutlined','fa fa-reorder','/docManage/docCenter','/doc/docCenter/process','mainActivity',NULL,NULL,NULL,'7072717E0CB543A8876DA4B7282A07C6',2,'docCenter','docCenter',0),('0EAC50F0A3DF40A8AA949D1F1A9BEE81','发帖','DatabaseOutlined','layui-icon layui-icon-app','/OA/forum/BO_talkl.html','/OA/forum/process','BO_talkl',NULL,NULL,NULL,'13E42CA7A0AD4F2888A40DEF05AA44CC',2,'bo_post',NULL,1),('11C28B381745478282E0E391D61E2A53','分类设置','DatabaseOutlined','layui-icon layui-icon-app','/OA/forum/Bo_category.html','/OA/forum/process','Bo_category',NULL,NULL,NULL,'3B35B11CF8D04C4AAAEF410B847D2252',1,'bo_category',NULL,1),('13E42CA7A0AD4F2888A40DEF05AA44CC','内部论坛','DatabaseOutlined','layui-icon layui-icon-app',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'forum',NULL,1),('16C7EF0E65EA4683BFCAD11BB9B717CF','基础列表','DatabaseOutlined','layui-icon layui-icon-app','/list/baseList','','','',NULL,NULL,'6898A59107BC4E388A2D8F057AE4E857',1,'base-list','base-list',0),('1E9A00C2F9D4409D96597C40B9EA8571','详情','DatabaseOutlined','layui-icon layui-icon-app','/result/info','','','',NULL,NULL,'CE4E91608F3E4AC4A0A2D206D6D65A8B',4,'result-info','result-info',0),('1F736601DB7E499A805ECF0A1D3BDFBC','日常办公','DatabaseOutlined','layui-icon layui-icon-app',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'date-work',NULL,1),('27BD1F45508B49F4B11918F91E14E316','权限管理','DatabaseOutlined','fa fa-key','/system/manageMeant','/SA/manageMeantProcess','mainActivity',NULL,NULL,NULL,'sysfun',5,'manageMeant','manageMeant',0),('28DD3BE201134F3089924D050AED2D22','警告','DatabaseOutlined','layui-icon layui-icon-app','/result/warning','','','',NULL,NULL,'CE4E91608F3E4AC4A0A2D206D6D65A8B',3,'result-warning','result-warning',0),('337D6618FBB64291A0EA7A577F144521','500','DatabaseOutlined','layui-icon layui-icon-app','/error/500','','','','null','null','91AE4D6AA06446CC9543AD0D51A291F6',3,'error-500','error-500',0),('383DFCD37CF142F8A22EE5BC517A3A1D','文档配置','DatabaseOutlined','fa fa-server','/docManage/docSetting','/doc/docSettingProcess','mainActivity',NULL,NULL,NULL,'7072717E0CB543A8876DA4B7282A07C6',1,'docSetting','docSetting',0),('3B35B11CF8D04C4AAAEF410B847D2252','讨论区','DatabaseOutlined','layui-icon layui-icon-app',NULL,NULL,NULL,NULL,NULL,NULL,'13E42CA7A0AD4F2888A40DEF05AA44CC',1,'discussion-area',NULL,1),('41103463A6744853BFE32F26BC3D7EA0','表单页面','FormOutlined','layui-icon layui-icon-app','/form','','','',NULL,NULL,'',2,'form','form',0),('412181B528E545F0B8D9EE3CF312DF98','流程设计','DatabaseOutlined','layui-icon layui-icon-slider','/flowManager/flowDesign','/flowDesign/process','mainActivity',NULL,NULL,NULL,'AFDEF15E8D7B4EC89446C68CF73D5B0D',9,'flowDesigner','flowDesigner',0),('41663E4FCF5149358F30056A56A4797F','失败','DatabaseOutlined','layui-icon layui-icon-app','/result/failure','','','',NULL,NULL,'CE4E91608F3E4AC4A0A2D206D6D65A8B',2,'result-failure','result-failure',0),('44DAA56DDDCB44339EE9718E79B35214','图文列表','DatabaseOutlined','layui-icon layui-icon-app','/list/newsList','','','',NULL,NULL,'6898A59107BC4E388A2D8F057AE4E857',3,'news-list','news-list',0),('45C85E85E41943B3981ACEFCDD27564E','讨论区设置','DatabaseOutlined','layui-icon layui-icon-app','/OA/forum/BO_bloglist.html','/OA/forum/process','BO_bloglist',NULL,NULL,NULL,'3B35B11CF8D04C4AAAEF410B847D2252',2,'bo_dis_set',NULL,1),('4C55668342EA451EA6B7F7D0581FD7FA','服务器监控','DatabaseOutlined','layui-icon layui-icon-chart-screen','/SA/cockpit/show.html','/SA/cockpit','mainActivity',NULL,NULL,NULL,'5004DBF28EF840438B55BEF5294C7C01',1,'ServerMonitor',NULL,1),('4D537DDA3E3B4CFEA192A981BDC5B266','分析页','DashboardOutlined','layui-icon layui-icon-app','/dashboard/console',NULL,NULL,NULL,NULL,NULL,'5C027D8A8B074441923D6C3D5530555C',1,'dashboard-console','console',0),('5004DBF28EF840438B55BEF5294C7C01','系统工具','DatabaseOutlined','layui-icon layui-icon-util',NULL,NULL,NULL,NULL,NULL,NULL,NULL,99,'systemTools',NULL,1),('5316BC0BC6374BAD9E50E164C0D4192A','系统日志','DatabaseOutlined','layui-icon layui-icon-log','/SA/system/syslog/mainActivity.html','/SA/sysLogProcess','mainActivity',NULL,NULL,NULL,'sysfun',6,'sysLog','sysLog',1),('5C027D8A8B074441923D6C3D5530555C','工作空间','HomeOutlined','layui-icon layui-icon-app','/dashboard','','','',NULL,NULL,'',1,'dashboard','dashboard',0),('6276A3096D834B9BA39BC08E2507C550','服务器信息','DatabaseOutlined','layui-icon layui-icon-engine','/SA/services/servicesInfo.html','/SA/services/servicesInfo','mainActivity',NULL,NULL,NULL,'5004DBF28EF840438B55BEF5294C7C01',2,'ServerInfo',NULL,1),('636B998F3485463E94083AB2448E4232','流程审批','DatabaseOutlined','layui-icon layui-icon-app','/demo/flow/mainActivity2.html','EFB1385BEB1441BCA87404D318B7F9BC','bizActivity4','hide',NULL,NULL,'FB10A917C8A647D9B9099A1E4B35C310',NULL,'bizActivity4',NULL,2),('64103C00B8AF45778B6F0B3FA022A17A','讨论区管理','DatabaseOutlined','layui-icon layui-icon-app','/OA/forum/BO_blogManage.html','/OA/forum/process','BO_blogManage',NULL,NULL,NULL,'3B35B11CF8D04C4AAAEF410B847D2252',3,'bo_dis_manage',NULL,1),('6898A59107BC4E388A2D8F057AE4E857','列表页面','UnorderedListOutlined','layui-icon layui-icon-app','/list','','','',NULL,NULL,'',3,'list','list',0),('6E918A31278C475B823012B960C3AD44','内部邮箱','DatabaseOutlined','layui-icon layui-icon-app','/OA/email/mainActivity.html','/OA/email','mainActivity',NULL,NULL,NULL,'1F736601DB7E499A805ECF0A1D3BDFBC',1,'org-email',NULL,1),('7072717E0CB543A8876DA4B7282A07C6','文档管理','ContainerOutlined','fa fa-gear','/docManage',NULL,NULL,NULL,NULL,NULL,NULL,97,'docManage','docManage',1),('759D35AFC1EB438BB2B2E122F83CD763','授权管理','DatabaseOutlined','layui-icon layui-icon-auz','/system/authorManage','/SA/role/authorManageProcess','mainActivity','','null','null','sysfun',4,'authorManage','authorManage',0),('826434CF9E734ED9ABA235C2BFF696B0','流程监控','DatabaseOutlined','fa fa-stack-overflow','/SA/process/monitor/mainActivity.html','/SA/process/monitor','mainActivity',NULL,NULL,NULL,'AFDEF15E8D7B4EC89446C68CF73D5B0D',2,'processmonitor',NULL,1),('89F94C93D75549DEBDF33190828721EE','403','DatabaseOutlined','layui-icon layui-icon-app','/error/403','','','',NULL,NULL,'91AE4D6AA06446CC9543AD0D51A291F6',1,'error-403','error-403',0),('8EB2FDB9C11D49E781B75374E5F48B49','查询表格','DatabaseOutlined','layui-icon layui-icon-app','/list/tableList','','','',NULL,NULL,'6898A59107BC4E388A2D8F057AE4E857',4,'table-list','table-list',0),('8EC0FF9DB10549B0898B8F7CD4E6C6F2','回收站','DatabaseOutlined','layui-icon layui-icon-delete','/system/recycle','/SA/recycleProcess','mainActivity',NULL,NULL,NULL,'sysfun',9,'recycle','recycle',0),('91AE4D6AA06446CC9543AD0D51A291F6','错误页面','StopOutlined','layui-icon layui-icon-app','/error','','','',NULL,NULL,'',5,'error','error',0),('9ECFAA70CC174D12A1E5FB25F681F89A','通知公告','DatabaseOutlined','layui-icon layui-icon-app',NULL,NULL,NULL,NULL,NULL,NULL,'1F736601DB7E499A805ECF0A1D3BDFBC',2,'notes',NULL,1),('A0446547A3684727A1DBD1A05E8A799C','基础表单','DatabaseOutlined','layui-icon layui-icon-app','/form/baseForm',NULL,NULL,NULL,NULL,NULL,'41103463A6744853BFE32F26BC3D7EA0',1,'base-form','base-form',0),('A4A6236099464082BB1ED5270EB64804','个人中心','DashboardOutlined','layui-icon layui-icon-app','/account/center',NULL,NULL,'hide',NULL,NULL,'E316E4AC20544555840E4F25535CCC4D',1,'account-center','account-center',0),('AF66D9A7835145319EC0C358A9CDD5D9','报表设计器',NULL,'layui-icon layui-icon-app','/reportManager/ureportDesigner','/ureportDesigner/process','mainActivity',NULL,NULL,NULL,'5004DBF28EF840438B55BEF5294C7C01',3,'ureportDesigner',NULL,3),('AFDEF15E8D7B4EC89446C68CF73D5B0D','流程管理','AntDesignOutlined','layui-icon layui-icon-app','/flowManager',NULL,NULL,NULL,NULL,NULL,NULL,98,'flowManager','flowManager',1),('B7C66B18C7B14A7AB20E928867F0636A','手写签名','DatabaseOutlined','fa fa-pencil-square-o','/SA/handwrittenSignature/mainActivity.html','/SA/handwrittenSignature','mainActivity',NULL,NULL,NULL,'sysfun',7,'handwrittenSignature',NULL,2),('C5C5D87019BA413B8929A85FC362C9C3','DEMO','DatabaseOutlined','layui-icon layui-icon-app',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo',NULL,2),('C834A7AC780B464789B4B5B55D104B83','流程审批2','DatabaseOutlined','layui-icon layui-icon-app','/demo/flow/mainActivity2.html','EFB1385BEB1441BCA87404D318B7F9BC','bizActivity6','hide',NULL,NULL,'FB10A917C8A647D9B9099A1E4B35C310',NULL,'bizActivity6',NULL,1),('C8351E6F2E0E4E9986D7CC19DD01C459','流程测试','DatabaseOutlined','layui-icon layui-icon-app','/demo/flow/mainActivity.html','EFB1385BEB1441BCA87404D318B7F9BC','bizActivity2',NULL,NULL,NULL,'FB10A917C8A647D9B9099A1E4B35C310',NULL,'bizActivity2',NULL,1),('CE4E91608F3E4AC4A0A2D206D6D65A8B','结果页面','TagOutlined','layui-icon layui-icon-app','/result','','','',NULL,NULL,'',4,'result-menu','result-menu',0),('D00BED3BCFC648C59F8A2EA716118717','分步表单','DatabaseOutlined','layui-icon layui-icon-app','/form/stepForm',NULL,NULL,NULL,NULL,NULL,'41103463A6744853BFE32F26BC3D7EA0',3,'step-form','step-form',0),('D57EE339F5AE494FBCEC1E325B5E5FEE','工作台','DashboardOutlined','layui-icon layui-icon-app','/dashboard/workspace',NULL,NULL,NULL,NULL,NULL,'5C027D8A8B074441923D6C3D5530555C',2,'dashboard-workspace','workspace',0),('DFAC4983AE14411CAE7200A7B025713C','404','DatabaseOutlined','layui-icon layui-icon-app','/error/404','','','',NULL,NULL,'91AE4D6AA06446CC9543AD0D51A291F6',2,'error-404','error-404',0),('E316E4AC20544555840E4F25535CCC4D','account','DashboardOutlined','layui-icon layui-icon-app','/account',NULL,NULL,'hide',NULL,NULL,NULL,0,'account','account',0),('E54E71CA26184648A58865889B711943','任务中心','DatabaseOutlined','fa fa-tasks','/SA/task/taskCenter/mainActivity.html','/SA/task/taskCenter','mainActivity',NULL,NULL,NULL,'AFDEF15E8D7B4EC89446C68CF73D5B0D',1,'taskCenter','taskCenter',1),('E8883F6C63FC453CB25E161847559D53','通知管理','DatabaseOutlined','layui-icon layui-icon-app','/OA/notice/publicnotice/publicnoticepushlist.html','/OA/notice/publicnotice/process','publicnoticepushlist',NULL,NULL,NULL,'9ECFAA70CC174D12A1E5FB25F681F89A',2,'note-manage',NULL,1),('E8B707468AF14D099A19843EFCA597E8','卡片列表','DatabaseOutlined','layui-icon layui-icon-app','/list/cardList','','','',NULL,NULL,'6898A59107BC4E388A2D8F057AE4E857',2,'card-list','card-list',0),('E95861E3A7FB411AB9ECBFE19C555423','通知列表','DatabaseOutlined','layui-icon layui-icon-app','/OA/notice/publicnotice/looknoticepushlist.html','/OA/notice/publicnotice/process','looknoticepushlist',NULL,NULL,NULL,'9ECFAA70CC174D12A1E5FB25F681F89A',3,'note-list',NULL,1),('F1F34234AA12430BACF128E0689E2622','高级表单','DatabaseOutlined','layui-icon layui-icon-app','/form/moreForm',NULL,NULL,NULL,NULL,NULL,'41103463A6744853BFE32F26BC3D7EA0',2,'more-form','more-form',0),('FA73F4BC3DB745B3B01413521D861E2B','通知发布','DatabaseOutlined','layui-icon layui-icon-app','/OA/notice/publicnotice/publicnoticeadd.html','/OA/notice/publicnotice/process','publicnoticeadd',NULL,NULL,NULL,'9ECFAA70CC174D12A1E5FB25F681F89A',1,'notify',NULL,1),('FB103B23EF0E4D698DDFCEF228A1EB7B','成功','DatabaseOutlined','layui-icon layui-icon-app','/result/success','','','',NULL,NULL,'CE4E91608F3E4AC4A0A2D206D6D65A8B',1,'result-success','result-success',0),('FB10A917C8A647D9B9099A1E4B35C310','流程','DatabaseOutlined','layui-icon layui-icon-app',NULL,NULL,NULL,NULL,NULL,NULL,'C5C5D87019BA413B8929A85FC362C9C3',NULL,'flow',NULL,1),('sysfun','系统管理','SettingOutlined','layui-icon layui-icon-set','/system','','','','','','',100,'system','system',0),('sysmenus','菜单设置','DatabaseOutlined','fa fa-window-maximize','/system/sysMenu','/SA/functionTree/process','mainActivity',NULL,NULL,NULL,'sysfun',1,'sysMenu','sysMenu',0),('sysognzation','机构管理','DatabaseOutlined','fa fa-group','/system/organization','/SA/organization/organizationProcess','mainActivity',NULL,NULL,NULL,'sysfun',2,'organization','organization',0),('sysrolem','角色管理','DatabaseOutlined','fa fa-cogs','/system/roleManage','/SA/role/roleProcess','mainActivity',NULL,NULL,NULL,'sysfun',3,'roleManage','roleManage',0);
/*!40000 ALTER TABLE `sa_opmenutree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sa_opoeg_view`
--

DROP TABLE IF EXISTS `sa_opoeg_view`;
/*!50001 DROP VIEW IF EXISTS `sa_opoeg_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sa_opoeg_view` AS SELECT 
 1 AS `sid`,
 1 AS `sparent`,
 1 AS `scode`,
 1 AS `sname`,
 1 AS `sorgkindid`,
 1 AS `sfid`,
 1 AS `svalidstate`,
 1 AS `sfcode`,
 1 AS `sfname`,
 1 AS `ssequence`,
 1 AS `sdescription`,
 1 AS `saddress`,
 1 AS `smobilephone`,
 1 AS `version`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sa_oporg`
--

DROP TABLE IF EXISTS `sa_oporg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_oporg` (
  `sid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sname` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `scode` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编号',
  `slongname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '长名称',
  `sfname` text COLLATE utf8mb4_unicode_ci COMMENT '路径名',
  `sfcode` text COLLATE utf8mb4_unicode_ci COMMENT '路径编号',
  `sfid` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '路径id',
  `sorgkindid` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构类型',
  `svalidstate` int(11) NOT NULL COMMENT '状态',
  `sparent` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '父id',
  `slevel` int(11) DEFAULT NULL COMMENT '层级',
  `sphone` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `sfax` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '传真',
  `saddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `szip` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮编',
  `sdescription` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `spersonid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '人员id',
  `snodekind` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '节点id',
  `sshowname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '展示名称',
  `ssequence` int(11) DEFAULT NULL COMMENT '排序',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `idx_oporg_code` (`scode`) USING BTREE,
  KEY `idx_sa_oporg_sorgkindid` (`sorgkindid`) USING BTREE,
  KEY `idx_sa_oporg_sparent` (`sparent`) USING BTREE,
  KEY `idx_sa_oporg_spersonid` (`spersonid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='组织机构';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_oporg`
--

LOCK TABLES `sa_oporg` WRITE;
/*!40000 ALTER TABLE `sa_oporg` DISABLE KEYS */;
INSERT INTO `sa_oporg` VALUES ('45BB9FCAF8394E43B45A55CF564F9CCD@775F53432CDC40A1A1F12BBEF4F93B74','测试人员2','test2',NULL,'/测试机构/测试部门2/测试人员2','/testogn/testdept2/test2','/5979D9B4A264438C84054F540CB7F032.ogn/775F53432CDC40A1A1F12BBEF4F93B74.dpt/45BB9FCAF8394E43B45A55CF564F9CCD@775F53432CDC40A1A1F12BBEF4F93B74.psm','psm',1,'775F53432CDC40A1A1F12BBEF4F93B74',3,'','','','','','45BB9FCAF8394E43B45A55CF564F9CCD',NULL,NULL,1,NULL),('490BA0D6B1FC4EFE962E376C76B09BBA','测试部门1','testdept1',NULL,'/测试机构/测试部门1','/testogn/testdept1','/5979D9B4A264438C84054F540CB7F032.ogn/490BA0D6B1FC4EFE962E376C76B09BBA.dpt','dpt',1,'5979D9B4A264438C84054F540CB7F032',2,'','','','','',NULL,NULL,NULL,1,NULL),('5979D9B4A264438C84054F540CB7F032','测试机构','testogn',NULL,'/测试机构','/testogn','/5979D9B4A264438C84054F540CB7F032.ogn','ogn',1,NULL,1,'','','','','',NULL,NULL,NULL,1,NULL),('775F53432CDC40A1A1F12BBEF4F93B74','测试部门2','testdept2',NULL,'/测试机构/测试部门2','/testogn/testdept2','/5979D9B4A264438C84054F540CB7F032.ogn/775F53432CDC40A1A1F12BBEF4F93B74.dpt','dpt',1,'5979D9B4A264438C84054F540CB7F032',2,'','','','','',NULL,NULL,NULL,2,NULL),('DC349D31F5FE4113ABA2BBC06B1E42D7@490BA0D6B1FC4EFE962E376C76B09BBA','测试人员1','test1',NULL,'/测试机构/测试部门1/测试人员1','/testogn/testdept1/test1','/5979D9B4A264438C84054F540CB7F032.ogn/490BA0D6B1FC4EFE962E376C76B09BBA.dpt/DC349D31F5FE4113ABA2BBC06B1E42D7@490BA0D6B1FC4EFE962E376C76B09BBA.psm','psm',1,'490BA0D6B1FC4EFE962E376C76B09BBA',3,'','','','','','DC349D31F5FE4113ABA2BBC06B1E42D7',NULL,NULL,1,NULL),('ORG01','管理员','TULIN','','/管理员','/TULIN','/ORG01.ogn','ogn',1,NULL,1,'','','','','','','','',96,NULL),('PSN01@ORG01','system','SYSTEM','','/管理员/system','/TULIN/SYSTEM','/ORG01.ogn/PSN01@ORG01.psm','psm',1,'ORG01',2,'','','','','','PSN01','nkLeaf','',1,NULL);
/*!40000 ALTER TABLE `sa_oporg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sa_oporg_view`
--

DROP TABLE IF EXISTS `sa_oporg_view`;
/*!50001 DROP VIEW IF EXISTS `sa_oporg_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sa_oporg_view` AS SELECT 
 1 AS `sID`,
 1 AS `sParent`,
 1 AS `sCode`,
 1 AS `sName`,
 1 AS `sOrgKindID`,
 1 AS `sFID`,
 1 AS `sValidState`,
 1 AS `SFCODE`,
 1 AS `sFName`,
 1 AS `sSequence`,
 1 AS `SDESCRIPTION`,
 1 AS `SADDRESS`,
 1 AS `smobilephone`,
 1 AS `version`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sa_oppermission`
--

DROP TABLE IF EXISTS `sa_oppermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_oppermission` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `spermissionroleid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色id',
  `smenuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单id',
  `sprocess` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流程id',
  `sactivityfname` text COLLATE utf8mb4_unicode_ci COMMENT '功能名称',
  `sactivity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '环节id',
  `sactionsnames` longtext COLLATE utf8mb4_unicode_ci COMMENT '动作名',
  `sactions` longtext COLLATE utf8mb4_unicode_ci COMMENT '动作',
  `ssemanticdp` text COLLATE utf8mb4_unicode_ci COMMENT '扩展描述',
  `spermissionkind` int(11) DEFAULT NULL COMMENT '授权类型id',
  `sdescription` text COLLATE utf8mb4_unicode_ci COMMENT '备注描述',
  `ssequence` int(11) DEFAULT NULL COMMENT '排序',
  `svalidstate` int(11) NOT NULL COMMENT '状态',
  `version` int(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `idx_opperm_activity` (`sactivity`) USING BTREE,
  KEY `idx_opperm_process` (`sprocess`) USING BTREE,
  KEY `idx_opperm_roleid` (`spermissionroleid`) USING BTREE,
  KEY `idx_opperm_smenuid` (`smenuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_oppermission`
--

LOCK TABLES `sa_oppermission` WRITE;
/*!40000 ALTER TABLE `sa_oppermission` DISABLE KEYS */;
INSERT INTO `sa_oppermission` VALUES ('05E1122206E34FC796F0C38250D6CE81','RL01','6276A3096D834B9BA39BC08E2507C550','/SA/services/servicesInfo','服务器信息','mainActivity',NULL,NULL,NULL,0,NULL,1,1,0),('09CCE2452D844847BC69B4EE34C07CF2','RL01','sysrolem','/SA/role/roleProcess','角色管理','mainActivity',NULL,NULL,NULL,0,'角色管理',1,1,0),('15B57007135848A6BA9BE7C6B5E969F8','RL01','sysognzation','/SA/organization/organizationProcess','机构管理','mainActivity',NULL,NULL,NULL,0,'机构管理',1,1,0),('16E384E9A8C84A888FD9F4221412E078','RL01','sysmenus','/SA/functionTree/process','菜单设置','mainActivity',NULL,NULL,NULL,0,'菜单设置',1,1,0),('1A972C931F8742C58BE07A01D8E7C075','RL01','826434CF9E734ED9ABA235C2BFF696B0','/SA/process/monitor','流程监控','mainActivity',NULL,NULL,NULL,0,NULL,1,1,0),('1D61F2FA4A904BE6B8F360FD631AEB7B','RL01','8EC0FF9DB10549B0898B8F7CD4E6C6F2','/SA/recycleProcess','回收站','mainActivity',NULL,NULL,NULL,0,'回收站',1,1,0),('20BAF9C9D1CA4C759B1BBDA9C40ADFC2','RL01','4C55668342EA451EA6B7F7D0581FD7FA','/SA/cockpit','服务器监控','mainActivity',NULL,NULL,NULL,0,NULL,1,1,0),('25E76761EEFC4AED9357173FCB955189','RL01','0B5307D27B7E41AA9D9D7552F4E97D61','/doc/docCenter/process','文档中心','mainActivity',NULL,NULL,NULL,0,'文档中心',1,1,0),('28DA9CC3C865433BB72FDFF4862D653C','RL01','FB10A917C8A647D9B9099A1E4B35C310',NULL,'流程',NULL,NULL,NULL,NULL,0,NULL,1,1,0),('2BB27622E99C4E3899EB1D69E60807A4','RL01','5316BC0BC6374BAD9E50E164C0D4192A','/SA/sysLogProcess','系统日志','mainActivity',NULL,NULL,NULL,0,'系统日志',1,1,0),('2D056D229C6247388B5F3DD7D3AA86B8','RL01','C8351E6F2E0E4E9986D7CC19DD01C459','EFB1385BEB1441BCA87404D318B7F9BC','流程测试','bizActivity2',NULL,NULL,NULL,0,NULL,1,1,0),('32229A11012040E3BD7AF8012A7B8B7C','RL01','759D35AFC1EB438BB2B2E122F83CD763','/SA/role/authorManageProcess','授权管理','mainActivity',NULL,NULL,NULL,0,'授权管理',1,1,0),('35938A2ED52F49308C0CABBFE1AD91FF','RL01','636B998F3485463E94083AB2448E4232','EFB1385BEB1441BCA87404D318B7F9BC','流程审批','bizActivity4',NULL,NULL,NULL,0,NULL,1,1,0),('39CB395DF4124458AF9E2D16BEBFC671','RL01','C5C5D87019BA413B8929A85FC362C9C3',NULL,'DEMO',NULL,NULL,NULL,NULL,0,NULL,1,1,0),('3CC060C19A884E27AFBE7C177646DDE1','RL01','5004DBF28EF840438B55BEF5294C7C01',NULL,'系统工具',NULL,NULL,NULL,NULL,0,NULL,1,1,0),('46C80A03E26B4179BDDCDE81AD33BFDC','RL01','45C85E85E41943B3981ACEFCDD27564E','/OA/forum/process','讨论区设置','BO_bloglist',NULL,NULL,NULL,0,NULL,1,1,0),('4CA03F30040B42BC840BF1C6B11B28D9','RL01','0EAC50F0A3DF40A8AA949D1F1A9BEE81','/OA/forum/process','发帖','BO_talkl',NULL,NULL,NULL,0,NULL,1,1,0),('510978C776274507ABD4A89B10C45803','RL01','1F736601DB7E499A805ECF0A1D3BDFBC',NULL,'日常办公',NULL,NULL,NULL,NULL,0,NULL,1,1,0),('710970CC13B6491FB9013019C2616324','RL01','383DFCD37CF142F8A22EE5BC517A3A1D','/doc/docSettingProcess','文档配置','mainActivity',NULL,NULL,NULL,0,'文档配置',1,1,0),('716F53800ADD4C009AB7F0082787A418','RL01','E95861E3A7FB411AB9ECBFE19C555423','/OA/notice/publicnotice/process','通知列表','looknoticepushlist',NULL,NULL,NULL,0,NULL,1,1,0),('76C646D8DDE14CB29D47ECFABA7F04E3','RL01','sysfun','','系统管理','',NULL,NULL,NULL,0,'系统管理',1,1,0),('8844382D546F42D78F83B0E85CE24818','RL01','412181B528E545F0B8D9EE3CF312DF98','/flowDesign/process','流程设计','mainActivity',NULL,NULL,NULL,0,'流程设计',1,1,0),('8973A87FA6344748B8D2C4DF55440A88','RL01','AFDEF15E8D7B4EC89446C68CF73D5B0D',NULL,'流程管理',NULL,NULL,NULL,NULL,0,'流程管理',1,1,0),('9C71EFBECA784F61A3B4E255E72325A9','RL01','C834A7AC780B464789B4B5B55D104B83','EFB1385BEB1441BCA87404D318B7F9BC','流程审批2','bizActivity6',NULL,NULL,NULL,0,NULL,1,1,0),('9EBF63E02EEF4C4AB498836912EF3133','RL01','6E918A31278C475B823012B960C3AD44','/OA/email','内部邮箱','mainActivity',NULL,NULL,NULL,0,NULL,1,1,0),('A23832868F2E432B9C3861D49F60A4E9','RL01','13E42CA7A0AD4F2888A40DEF05AA44CC',NULL,'内部论坛',NULL,NULL,NULL,NULL,0,NULL,1,1,0),('B903B34C093F4AB9B84F7C20AFF58D64','RL01','AF66D9A7835145319EC0C358A9CDD5D9','/ureportDesigner/process','报表设计器','mainActivity',NULL,NULL,NULL,0,NULL,1,1,0),('C192BFCE969B454AB64B79790B36A6F3','RL01','B7C66B18C7B14A7AB20E928867F0636A','/SA/handwrittenSignature','手写签名','mainActivity',NULL,NULL,NULL,0,NULL,1,1,0),('C785D415CF8A453D97487FE54F658333','RL01','6E918A31278C475B823012B960C3AD44','/OA/email','内部邮箱','mainActivity',NULL,NULL,NULL,0,NULL,1,1,0),('CAC1325E02C94175A8AADE2985F8C4A6','RL01','3B35B11CF8D04C4AAAEF410B847D2252',NULL,'讨论区',NULL,NULL,NULL,NULL,0,NULL,1,1,0),('CBA1667533DC4C5E8B96C0BAA71732F9','RL01','64103C00B8AF45778B6F0B3FA022A17A','/OA/forum/process','讨论区管理','BO_blogManage',NULL,NULL,NULL,0,NULL,1,1,0),('CE01BD0E0646458DB5B027E87A463DA7','RL01','27BD1F45508B49F4B11918F91E14E316','/SA/manageMeantProcess','权限管理','mainActivity',NULL,NULL,NULL,0,'权限管理',1,1,0),('D73A36F728194D1E96253B780970A1E9','RL01','FA73F4BC3DB745B3B01413521D861E2B','/OA/notice/publicnotice/process','通知发布','publicnoticeadd',NULL,NULL,NULL,0,NULL,1,1,0),('E65482587B1F4D76B9CF1ED1EA7F8AE4','RL01','E8883F6C63FC453CB25E161847559D53','/OA/notice/publicnotice/process','通知管理','publicnoticepushlist',NULL,NULL,NULL,0,NULL,1,1,0),('EB6FA085BE3B4A6A87958D1E315D818A','RL01','E54E71CA26184648A58865889B711943','/SA/task/taskCenter','任务中心','mainActivity',NULL,NULL,NULL,0,NULL,1,1,0),('ED9348734D66443E9F97D39B63CC4AC1','RL01','7072717E0CB543A8876DA4B7282A07C6',NULL,'文档管理',NULL,NULL,NULL,NULL,0,'文档管理',1,1,0),('F487368123EA4C109350ED04EC3D0B98','RL01','11C28B381745478282E0E391D61E2A53','/OA/forum/process','分类设置','Bo_category',NULL,NULL,NULL,0,NULL,1,1,0),('F7891CD2ABB84EC7A07764783C6CEED2','RL01','9ECFAA70CC174D12A1E5FB25F681F89A',NULL,'通知公告',NULL,NULL,NULL,NULL,0,NULL,1,1,0);
/*!40000 ALTER TABLE `sa_oppermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_opperson`
--

DROP TABLE IF EXISTS `sa_opperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_opperson` (
  `sid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `scode` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `sidcard` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证',
  `snumb` int(11) NOT NULL COMMENT '年龄',
  `sloginname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录名',
  `spassword` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `spasswordtimelimit` int(11) DEFAULT NULL COMMENT '密码过期时限（天）',
  `spasswordmodifytime` datetime DEFAULT NULL COMMENT '密码修改时间',
  `smainorgid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属组织id',
  `ssafelevelid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '安全级别',
  `ssequence` int(11) DEFAULT NULL COMMENT '排序',
  `svalidstate` int(11) NOT NULL COMMENT '状态',
  `sdescription` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `ssex` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `sbirthday` datetime DEFAULT NULL COMMENT '生日',
  `sjoindate` datetime DEFAULT NULL COMMENT '参加工作时间',
  `shomeplace` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '住址',
  `sdegree` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学位',
  `sgraduateschool` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '毕业学校',
  `sspeciality` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专业',
  `sschoollength` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学制',
  `stitle` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '称呼',
  `smarriage` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '婚否',
  `scardno` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '工号',
  `scardkind` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '工种',
  `sfamilyaddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '家庭住址',
  `szip` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮编',
  `smsn` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'MSN',
  `sqq` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'QQ',
  `smail` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `smobilephone` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机',
  `sfamilyphone` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '家用电话',
  `sofficephone` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '办公电话',
  `sphoto` longblob COMMENT '照片',
  `scountry` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '国籍',
  `sprovince` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省',
  `scity` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市',
  `spositions` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '县区',
  `sschool` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学校',
  `sstudy` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学习',
  `senglishname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '英文名',
  `fcasn` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'UKey编号',
  `fsignm` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签名信息',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `idx_opperson_scode` (`scode`) USING BTREE,
  KEY `idx_opperson_smainorgid` (`smainorgid`) USING BTREE,
  KEY `xmsgindexmessagesvalidstate` (`svalidstate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='人员信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_opperson`
--

LOCK TABLES `sa_opperson` WRITE;
/*!40000 ALTER TABLE `sa_opperson` DISABLE KEYS */;
INSERT INTO `sa_opperson` VALUES ('45BB9FCAF8394E43B45A55CF564F9CCD','测试人员2','test2',NULL,0,NULL,'E10ADC3949BA59ABBE56E057F20F883E',0,NULL,'775F53432CDC40A1A1F12BBEF4F93B74',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('DC349D31F5FE4113ABA2BBC06B1E42D7','测试人员1','test1',NULL,0,NULL,'E10ADC3949BA59ABBE56E057F20F883E',0,NULL,'490BA0D6B1FC4EFE962E376C76B09BBA',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('PSN01','system','SYSTEM','',1,'管理员','C4CA4238A0B923820DCC509A6F75849B',120,'2013-10-20 00:00:00','ORG01','',1,1,'','男','1976-12-03 00:00:00','2006-06-06 00:00:00','','','','','','','','','','','','','','','14769660886','','','4',NULL,'','','','','','','','',NULL);
/*!40000 ALTER TABLE `sa_opperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_opperson_deatail`
--

DROP TABLE IF EXISTS `sa_opperson_deatail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_opperson_deatail` (
  `sid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spersonid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stype` text COLLATE utf8mb4_unicode_ci,
  `ssquns` text COLLATE utf8mb4_unicode_ci,
  `scode` text COLLATE utf8mb4_unicode_ci,
  `sname` text COLLATE utf8mb4_unicode_ci,
  `sremark` text COLLATE utf8mb4_unicode_ci,
  `sclass` text COLLATE utf8mb4_unicode_ci,
  `supdatedate` datetime DEFAULT NULL,
  `supdatorid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supdatorname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_opperson_deatail`
--

LOCK TABLES `sa_opperson_deatail` WRITE;
/*!40000 ALTER TABLE `sa_opperson_deatail` DISABLE KEYS */;
/*!40000 ALTER TABLE `sa_opperson_deatail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_oprole`
--

DROP TABLE IF EXISTS `sa_oprole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_oprole` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `scode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色编号',
  `scatalog` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色类型',
  `srolekind` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型id',
  `sparentrolesnames` text COLLATE utf8mb4_unicode_ci COMMENT '父角色名称',
  `sdescription` text COLLATE utf8mb4_unicode_ci COMMENT '角色描述',
  `ssequence` int(11) DEFAULT NULL COMMENT '角色排序',
  `svalidstate` int(11) DEFAULT NULL COMMENT '状态',
  `version` int(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `idx_oprole_code` (`scode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_oprole`
--

LOCK TABLES `sa_oprole` WRITE;
/*!40000 ALTER TABLE `sa_oprole` DISABLE KEYS */;
INSERT INTO `sa_oprole` VALUES ('RL01','超级管理员','opm','勿删-系统应用','fun','','',1,1,4),('RL02','任务','task','系统管理','fun','','',2,1,2),('RL02-doc','文档','doc','系统管理','fun','','',3,1,2);
/*!40000 ALTER TABLE `sa_oprole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_oprolemanage`
--

DROP TABLE IF EXISTS `sa_oprolemanage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_oprolemanage` (
  `sid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorgid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorgfid` text COLLATE utf8mb4_unicode_ci,
  `spersonid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sroleid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `screatorid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `screatetime` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_oprolemanage`
--

LOCK TABLES `sa_oprolemanage` WRITE;
/*!40000 ALTER TABLE `sa_oprolemanage` DISABLE KEYS */;
/*!40000 ALTER TABLE `sa_oprolemanage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_oprolemanagement`
--

DROP TABLE IF EXISTS `sa_oprolemanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_oprolemanagement` (
  `sid` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorgid` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorgname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorgfid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorgfname` text COLLATE utf8mb4_unicode_ci,
  `sroleid` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `screatorfid` text COLLATE utf8mb4_unicode_ci,
  `screatorfname` text COLLATE utf8mb4_unicode_ci,
  `screatetime` datetime DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_oprolemanagement`
--

LOCK TABLES `sa_oprolemanagement` WRITE;
/*!40000 ALTER TABLE `sa_oprolemanagement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sa_oprolemanagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_psnmytask`
--

DROP TABLE IF EXISTS `sa_psnmytask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_psnmytask` (
  `sid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scaption` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `sstartdate` datetime DEFAULT NULL COMMENT '开始时间',
  `senddate` datetime DEFAULT NULL COMMENT '结束时间',
  `spriority` int(11) DEFAULT NULL COMMENT '优先级',
  `scontent` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `sstatus` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `saffairstype` int(11) DEFAULT NULL COMMENT '事务类型',
  `scompleterate` int(11) DEFAULT NULL COMMENT '完成率',
  `sstartdate_axis` int(11) DEFAULT NULL COMMENT '开始时间轴',
  `ssenddate` int(11) DEFAULT NULL COMMENT '结束时间轴',
  `swhouser` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属用户',
  `ssenddate_axis` int(11) DEFAULT NULL COMMENT '发布时间轴',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `sa_psntask_user` (`swhouser`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_psnmytask`
--

LOCK TABLES `sa_psnmytask` WRITE;
/*!40000 ALTER TABLE `sa_psnmytask` DISABLE KEYS */;
/*!40000 ALTER TABLE `sa_psnmytask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_psnschedule`
--

DROP TABLE IF EXISTS `sa_psnschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_psnschedule` (
  `sid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scaption` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `sstartdate` datetime DEFAULT NULL COMMENT '开始时间',
  `senddate` datetime DEFAULT NULL COMMENT '结束时间',
  `scontent` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `spriority` int(11) DEFAULT NULL COMMENT '优先级别',
  `sstatus` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `sstartdate_axis` int(11) DEFAULT NULL COMMENT '开始时间轴',
  `ssenddate_axis` int(11) DEFAULT NULL COMMENT '结束时间轴',
  `saffairstype` int(11) DEFAULT NULL COMMENT '事务类型',
  `swhouser` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属用户',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `sa_psnschedule_user` (`swhouser`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_psnschedule`
--

LOCK TABLES `sa_psnschedule` WRITE;
/*!40000 ALTER TABLE `sa_psnschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `sa_psnschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sa_task`
--

DROP TABLE IF EXISTS `sa_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_task` (
  `sid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sparentid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '父id',
  `sname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务标题',
  `scontent` longtext COLLATE utf8mb4_unicode_ci COMMENT '任务内容',
  `sremark` longtext COLLATE utf8mb4_unicode_ci COMMENT '任务备注',
  `sflowid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流程id',
  `stypeid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型id',
  `stypename` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型名称',
  `sprocess` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流程图',
  `sactivity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流程环节',
  `screatetime` datetime DEFAULT NULL COMMENT '创建时间',
  `sdistributetime` datetime DEFAULT NULL COMMENT '分发时间',
  `slastmodifytime` datetime DEFAULT NULL COMMENT '最后编辑时间',
  `swarningtime` datetime DEFAULT NULL COMMENT '报警时间',
  `slimittime` datetime DEFAULT NULL COMMENT '最后期限',
  `sestarttime` datetime DEFAULT NULL COMMENT '执行开始时间',
  `sefinishtime` datetime DEFAULT NULL COMMENT '执行结束时间',
  `sastarttime` datetime DEFAULT NULL COMMENT '动作开始时间',
  `safinishtime` datetime DEFAULT NULL COMMENT '动作结束时间',
  `sexecutetime` datetime DEFAULT NULL COMMENT '处理时间',
  `scpersonid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交人id',
  `scpersonname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交人名称',
  `scdeptid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交人部门id',
  `scdeptname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交人部门名称',
  `scognid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交人单位id',
  `scognname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交人单位名称',
  `sepersonid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人id',
  `sepersonname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人名称',
  `sedeptid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人部门id',
  `sedeptname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人部门名称',
  `seognid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人单位id',
  `seognname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人单位名称',
  `slock` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务锁定',
  `sstatusid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态id',
  `sstatusname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态名称',
  `skindid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型id',
  `scurl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交页面地址',
  `seurl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行页面地址',
  `sexecutemode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行模式',
  `ssequence` int(11) DEFAULT NULL COMMENT '排序',
  `scpersoncode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交人编号',
  `scposid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交人岗位id',
  `scposcode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交人岗位编号',
  `scposname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交人岗位名称',
  `scdeptcode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交人部门编号',
  `scogncode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交人单位编号',
  `scfid` text COLLATE utf8mb4_unicode_ci COMMENT '提交人路径id',
  `sepersoncode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人编号',
  `seposid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人岗位id',
  `seposcode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人编号',
  `seposname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人名称',
  `sedeptcode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人部门编号',
  `seogncode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人单位编号',
  `sefid` text COLLATE utf8mb4_unicode_ci COMMENT '执行人路径id',
  `sdata1` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务主键',
  `sdata2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务子表id',
  `sdata3` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务从表id',
  `sdata4` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '业务外键',
  `scfname` text COLLATE utf8mb4_unicode_ci COMMENT '提交人路径名称',
  `sefname` text COLLATE utf8mb4_unicode_ci COMMENT '执行人路径名称',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `sa_flowid` (`sflowid`) USING BTREE,
  KEY `sa_status` (`sstatusid`) USING BTREE,
  KEY `sa_task_sdata_1` (`sdata1`) USING BTREE,
  KEY `sa_task_sparentid` (`sparentid`) USING BTREE,
  KEY `sa_task_sprocess` (`sprocess`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='流程管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_task`
--

LOCK TABLES `sa_task` WRITE;
/*!40000 ALTER TABLE `sa_task` DISABLE KEYS */;
INSERT INTO `sa_task` VALUES ('1752513F978846E7B328109C6AC5062A','2D7C816D00794540828AB9418E6A7E01','结束:测试流程',NULL,NULL,'64F722F0D4B743CFB3792C407744656C',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC','Activity8','2024-10-18 14:52:54',NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-18 14:52:54',NULL,NULL,'PSN01','system','','','ORG01','管理员','PSN01','system','','','ORG01','管理员',NULL,'tesFinished','已完成',NULL,'/demo/flow/mainActivity2.html',NULL,NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','69FB950E3D5045978EB3D0D042F0AEC2',NULL,NULL,NULL,'/管理员/system','/管理员/system',0),('189FDC6BB47647AEB3AABF589ED1CD6E','4D24D25F3B484616A13C8AFE65158300','bizActivity2←回退-bizActivity4:测试流程',NULL,NULL,'48C357DFDC2B4D88A28D3F0F34A1420D',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC','bizActivity2','2024-12-25 21:04:29',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-25 21:04:29','2024-12-25 21:05:19','2024-12-25 21:05:19','PSN01','system','','','ORG01','管理员','PSN01','system',NULL,NULL,NULL,NULL,'452A711420974C43A5549F331014AB0D','tesFinished','已完成',NULL,'/demo/flow/mainActivity2.html','/demo/flow/mainActivity.html',NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM',NULL,NULL,NULL,NULL,NULL,'/ORG01.ogn/PSN01@ORG01.psm','D9F40DD3A388405DBAB2F6C5E2393CEF',NULL,NULL,NULL,'/管理员/system','/管理员/system',1),('2D7C816D00794540828AB9418E6A7E01','C028F91196C3483B8B2E822CF5267F2F','bizActivity6:测试流程',NULL,NULL,'64F722F0D4B743CFB3792C407744656C',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC','bizActivity6','2024-03-06 12:52:28',NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-06 12:52:28','2024-10-18 14:52:54','2024-10-18 14:52:54','PSN01','system','','','ORG01','管理员','PSN01','system',NULL,NULL,NULL,NULL,'B0F68890FC4541E2BE6C2BCB618CC76B','tesFinished','已完成',NULL,'/demo/flow/mainActivity2.html','/demo/flow/mainActivity2.html',NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM',NULL,NULL,NULL,NULL,NULL,'/ORG01.ogn/PSN01@ORG01.psm','69FB950E3D5045978EB3D0D042F0AEC2',NULL,NULL,NULL,'/管理员/system','/管理员/system',1),('2D81B8BAA3624C29BE4687AB4711068B','4B12E1B3069E4AD9A03B660CE415CFBC','bizActivity6:测试流程',NULL,NULL,'48C357DFDC2B4D88A28D3F0F34A1420D',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC','bizActivity6','2024-12-25 21:05:33',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-25 21:05:33','2024-12-25 21:05:37','2024-12-25 21:05:37','PSN01','system','','','ORG01','管理员','PSN01','system',NULL,NULL,NULL,NULL,'BF7225B5B5D14A7192C61766EBCD36E3','tesFinished','已完成',NULL,'/demo/flow/mainActivity2.html','/demo/flow/mainActivity2.html',NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM',NULL,NULL,NULL,NULL,NULL,'/ORG01.ogn/PSN01@ORG01.psm','D9F40DD3A388405DBAB2F6C5E2393CEF',NULL,NULL,NULL,'/管理员/system','/管理员/system',1),('3F9021623C064E6C8707B9AC7E2E0E4C','AD370EC51EC54F91B6F29AAB29F11B71','bizActivity4:测试流程',NULL,NULL,'64F722F0D4B743CFB3792C407744656C',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC','bizActivity4','2024-03-06 12:47:53',NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-06 12:47:53','2024-03-06 12:48:52','2024-03-06 12:48:52','PSN01','system','','','ORG01','管理员','PSN01','system',NULL,NULL,NULL,NULL,NULL,'tesFinished','已完成',NULL,'/demo/flow/mainActivity.html','/demo/flow/mainActivity2.html',NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM',NULL,NULL,NULL,NULL,NULL,'/ORG01.ogn/PSN01@ORG01.psm','69FB950E3D5045978EB3D0D042F0AEC2',NULL,NULL,NULL,'/管理员/system','/管理员/system',1),('48C357DFDC2B4D88A28D3F0F34A1420D',NULL,'测试流程',NULL,NULL,'48C357DFDC2B4D88A28D3F0F34A1420D',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC',NULL,'2024-10-18 14:59:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-25 21:05:37','PSN01','system','','','ORG01','管理员','PSN01','system','','','ORG01','管理员',NULL,'tesFinished','已完成',NULL,NULL,NULL,NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','D9F40DD3A388405DBAB2F6C5E2393CEF',NULL,NULL,NULL,'/管理员/system','/管理员/system',1),('4B12E1B3069E4AD9A03B660CE415CFBC','189FDC6BB47647AEB3AABF589ED1CD6E','bizActivity4:测试流程',NULL,NULL,'48C357DFDC2B4D88A28D3F0F34A1420D',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC','bizActivity4','2024-12-25 21:05:19',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-25 21:05:19','2024-12-25 21:05:33','2024-12-25 21:05:33','PSN01','system','','','ORG01','管理员','PSN01','system',NULL,NULL,NULL,NULL,'043964C9A36C4F73ADA8C77384A99C54','tesFinished','已完成',NULL,'/demo/flow/mainActivity.html','/demo/flow/mainActivity2.html',NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM',NULL,NULL,NULL,NULL,NULL,'/ORG01.ogn/PSN01@ORG01.psm','D9F40DD3A388405DBAB2F6C5E2393CEF',NULL,NULL,NULL,'/管理员/system','/管理员/system',1),('4D24D25F3B484616A13C8AFE65158300','7392F8F988FB40A8B911C18F112565F5','bizActivity4:测试流程',NULL,NULL,'48C357DFDC2B4D88A28D3F0F34A1420D',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC','bizActivity4','2024-10-18 14:59:11',NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-18 14:59:11',NULL,'2024-12-25 21:04:29','PSN01','system','','','ORG01','管理员','PSN01','system',NULL,NULL,NULL,NULL,'37258CC8136B41BB955E8B85BB9D066C','tesReturned','已回退',NULL,'/demo/flow/mainActivity.html','/demo/flow/mainActivity2.html',NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM',NULL,NULL,NULL,NULL,NULL,'/ORG01.ogn/PSN01@ORG01.psm','D9F40DD3A388405DBAB2F6C5E2393CEF',NULL,NULL,NULL,'/管理员/system','/管理员/system',1),('64F722F0D4B743CFB3792C407744656C',NULL,'测试流程',NULL,NULL,'64F722F0D4B743CFB3792C407744656C',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC',NULL,'2024-03-06 12:47:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-18 14:52:57','PSN01','system','','','ORG01','管理员','PSN01','system','','','ORG01','管理员',NULL,'tesFinished','已完成',NULL,NULL,NULL,NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','69FB950E3D5045978EB3D0D042F0AEC2',NULL,NULL,NULL,'/管理员/system','/管理员/system',1),('7392F8F988FB40A8B911C18F112565F5','48C357DFDC2B4D88A28D3F0F34A1420D','bizActivity2:测试流程',NULL,NULL,'48C357DFDC2B4D88A28D3F0F34A1420D',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC','bizActivity2','2024-10-18 14:59:06',NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-18 14:59:06','2024-10-18 14:59:11','2024-10-18 14:59:11','PSN01','system','','','ORG01','管理员','PSN01','system','','','ORG01','管理员',NULL,'tesFinished','已完成',NULL,NULL,'/demo/flow/mainActivity.html',NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','D9F40DD3A388405DBAB2F6C5E2393CEF',NULL,NULL,NULL,'/管理员/system','/管理员/system',1),('AD370EC51EC54F91B6F29AAB29F11B71','64F722F0D4B743CFB3792C407744656C','bizActivity2:测试流程',NULL,NULL,'64F722F0D4B743CFB3792C407744656C',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC','bizActivity2','2024-03-06 12:47:50',NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-06 12:47:50','2024-03-06 12:47:53','2024-03-06 12:47:53','PSN01','system','','','ORG01','管理员','PSN01','system','','','ORG01','管理员',NULL,'tesFinished','已完成',NULL,NULL,'/demo/flow/mainActivity.html',NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','69FB950E3D5045978EB3D0D042F0AEC2',NULL,NULL,NULL,'/管理员/system','/管理员/system',1),('C028F91196C3483B8B2E822CF5267F2F','3F9021623C064E6C8707B9AC7E2E0E4C','bizActivity4:测试流程',NULL,NULL,'64F722F0D4B743CFB3792C407744656C',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC','bizActivity4','2024-03-06 12:48:52',NULL,NULL,NULL,NULL,NULL,NULL,'2024-03-06 12:48:52','2024-03-06 12:52:28','2024-03-06 12:52:28','PSN01','system','','','ORG01','管理员','PSN01','system',NULL,NULL,NULL,NULL,'E1E1113D288548B0A51F738C37F54EE7','tesFinished','已完成',NULL,'/demo/flow/mainActivity2.html','/demo/flow/mainActivity2.html',NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM',NULL,NULL,NULL,NULL,NULL,'/ORG01.ogn/PSN01@ORG01.psm','69FB950E3D5045978EB3D0D042F0AEC2',NULL,NULL,NULL,'/管理员/system','/管理员/system',1),('EF0AB284D11C4A5BB63395638C3BC7ED','2D81B8BAA3624C29BE4687AB4711068B','结束:测试流程',NULL,NULL,'48C357DFDC2B4D88A28D3F0F34A1420D',NULL,NULL,'EFB1385BEB1441BCA87404D318B7F9BC','Activity8','2024-12-25 21:05:37',NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-25 21:05:37',NULL,NULL,'PSN01','system','','','ORG01','管理员','PSN01','system','','','ORG01','管理员',NULL,'tesFinished','已完成',NULL,'/demo/flow/mainActivity2.html',NULL,NULL,NULL,'SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','SYSTEM','','','','','TULIN','/ORG01.ogn/PSN01@ORG01.psm','D9F40DD3A388405DBAB2F6C5E2393CEF',NULL,NULL,NULL,'/管理员/system','/管理员/system',0);
/*!40000 ALTER TABLE `sa_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sa_task_monitor`
--

DROP TABLE IF EXISTS `sa_task_monitor`;
/*!50001 DROP VIEW IF EXISTS `sa_task_monitor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sa_task_monitor` AS SELECT 
 1 AS `sid`,
 1 AS `sparentid`,
 1 AS `sname`,
 1 AS `scontent`,
 1 AS `sremark`,
 1 AS `sflowid`,
 1 AS `stypeid`,
 1 AS `stypename`,
 1 AS `sprocess`,
 1 AS `sactivity`,
 1 AS `screatetime`,
 1 AS `sdistributetime`,
 1 AS `slastmodifytime`,
 1 AS `swarningtime`,
 1 AS `slimittime`,
 1 AS `sestarttime`,
 1 AS `sefinishtime`,
 1 AS `sastarttime`,
 1 AS `safinishtime`,
 1 AS `sexecutetime`,
 1 AS `scpersonid`,
 1 AS `scpersonname`,
 1 AS `scdeptid`,
 1 AS `scdeptname`,
 1 AS `scognid`,
 1 AS `scognname`,
 1 AS `sepersonid`,
 1 AS `sepersonname`,
 1 AS `sedeptid`,
 1 AS `sedeptname`,
 1 AS `seognid`,
 1 AS `seognname`,
 1 AS `slock`,
 1 AS `sstatusid`,
 1 AS `sstatusname`,
 1 AS `skindid`,
 1 AS `scurl`,
 1 AS `seurl`,
 1 AS `sexecutemode`,
 1 AS `ssequence`,
 1 AS `scpersoncode`,
 1 AS `scposid`,
 1 AS `scposcode`,
 1 AS `scposname`,
 1 AS `scdeptcode`,
 1 AS `scogncode`,
 1 AS `scfid`,
 1 AS `sepersoncode`,
 1 AS `seposid`,
 1 AS `seposcode`,
 1 AS `seposname`,
 1 AS `sedeptcode`,
 1 AS `seogncode`,
 1 AS `sefid`,
 1 AS `sdata1`,
 1 AS `sdata2`,
 1 AS `sdata3`,
 1 AS `sdata4`,
 1 AS `scfname`,
 1 AS `sefname`,
 1 AS `version`,
 1 AS `sflowname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sa_task_timelimit`
--

DROP TABLE IF EXISTS `sa_task_timelimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sa_task_timelimit` (
  `sid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sprocessid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sprocessname` text COLLATE utf8mb4_unicode_ci,
  `sactivity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sactivityname` text COLLATE utf8mb4_unicode_ci,
  `sdlimit` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sa_task_timelimit`
--

LOCK TABLES `sa_task_timelimit` WRITE;
/*!40000 ALTER TABLE `sa_task_timelimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `sa_task_timelimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tlv8-vue'
--

--
-- Final view structure for view `sa_opoeg_view`
--

/*!50001 DROP VIEW IF EXISTS `sa_opoeg_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sa_opoeg_view` AS select `o`.`sid` AS `sid`,`o`.`sparent` AS `sparent`,`o`.`scode` AS `scode`,`o`.`sname` AS `sname`,ifnull(`o`.`sorgkindid`,'org') AS `sorgkindid`,`o`.`sfid` AS `sfid`,`o`.`svalidstate` AS `svalidstate`,`o`.`sfcode` AS `sfcode`,`o`.`sfname` AS `sfname`,`o`.`ssequence` AS `ssequence`,`o`.`sdescription` AS `sdescription`,`o`.`saddress` AS `saddress`,'' AS `smobilephone`,`o`.`version` AS `version` from `sa_oporg` `o` where ((`o`.`svalidstate` = 1) and (`o`.`sorgkindid` <> 'psm')) union all select `p`.`sid` AS `sid`,`t`.`sid` AS `sparent`,`p`.`scode` AS `scode`,`p`.`sname` AS `sname`,'psm' AS `sorgkindid`,concat(`t`.`sfid`,'/',`p`.`sid`) AS `sfid`,`t`.`svalidstate` AS `svalidstate`,concat(`t`.`sfcode`,'/',`p`.`scode`) AS `sfcode`,concat(`t`.`sfname`,'/',`p`.`sname`) AS `sfname`,(`t`.`slevel` + `p`.`ssequence`) AS `ssequence`,`t`.`sdescription` AS `sdescription`,`t`.`saddress` AS `saddress`,ifnull(`p`.`smobilephone`,'') AS `smobilephone`,`p`.`version` AS `version` from (`sa_opperson` `p` left join `sa_oporg` `t` on((`p`.`smainorgid` = `t`.`sid`))) where ((`p`.`smainorgid` is not null) and (`t`.`svalidstate` = 1) and (`p`.`svalidstate` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sa_oporg_view`
--

/*!50001 DROP VIEW IF EXISTS `sa_oporg_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sa_oporg_view` AS select `o`.`sid` AS `sID`,`o`.`sparent` AS `sParent`,`o`.`scode` AS `sCode`,`o`.`sname` AS `sName`,ifnull(`o`.`sorgkindid`,'org') AS `sOrgKindID`,`o`.`sfid` AS `sFID`,`o`.`svalidstate` AS `sValidState`,`o`.`sfcode` AS `SFCODE`,`o`.`sfname` AS `sFName`,`o`.`ssequence` AS `sSequence`,`o`.`sdescription` AS `SDESCRIPTION`,`o`.`saddress` AS `SADDRESS`,'' AS `smobilephone`,`o`.`version` AS `version` from `sa_oporg` `o` where ((`o`.`svalidstate` = 1) and (`o`.`sorgkindid` <> 'psm')) union all select `p`.`sid` AS `sID`,`t`.`sid` AS `sParent`,`p`.`scode` AS `sCode`,`p`.`sname` AS `sName`,'psm' AS `sOrgKindID`,concat(`t`.`sfid`,'/',`p`.`sid`) AS `CONCAT(t.sFID,'/',p.sid)`,`t`.`svalidstate` AS `sValidState`,concat(`t`.`sfcode`,'/',`p`.`scode`) AS `CONCAT(t.sfcode,'/',p.scode)`,concat(`t`.`sfname`,'/',`p`.`sname`) AS `CONCAT(t.sFName,'/',p.sname)`,(`t`.`slevel` + `p`.`ssequence`) AS `sSequence`,`t`.`sdescription` AS `SDESCRIPTION`,`t`.`saddress` AS `SADDRESS`,ifnull(`p`.`smobilephone`,'') AS `smobilephone`,`p`.`version` AS `version` from (`sa_opperson` `p` left join `sa_oporg` `t` on((`p`.`smainorgid` = `t`.`sid`))) where ((`p`.`smainorgid` is not null) and (`t`.`svalidstate` = 1) and (`p`.`svalidstate` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sa_task_monitor`
--

/*!50001 DROP VIEW IF EXISTS `sa_task_monitor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sa_task_monitor` AS select `t`.`sid` AS `sid`,`t`.`sparentid` AS `sparentid`,`t`.`sname` AS `sname`,`t`.`scontent` AS `scontent`,`t`.`sremark` AS `sremark`,`t`.`sflowid` AS `sflowid`,`t`.`stypeid` AS `stypeid`,`t`.`stypename` AS `stypename`,`t`.`sprocess` AS `sprocess`,`t`.`sactivity` AS `sactivity`,`t`.`screatetime` AS `screatetime`,`t`.`sdistributetime` AS `sdistributetime`,`t`.`slastmodifytime` AS `slastmodifytime`,`t`.`swarningtime` AS `swarningtime`,`t`.`slimittime` AS `slimittime`,`t`.`sestarttime` AS `sestarttime`,`t`.`sefinishtime` AS `sefinishtime`,`t`.`sastarttime` AS `sastarttime`,`t`.`safinishtime` AS `safinishtime`,`t`.`sexecutetime` AS `sexecutetime`,`t`.`scpersonid` AS `scpersonid`,`t`.`scpersonname` AS `scpersonname`,`t`.`scdeptid` AS `scdeptid`,`t`.`scdeptname` AS `scdeptname`,`t`.`scognid` AS `scognid`,`t`.`scognname` AS `scognname`,`t`.`sepersonid` AS `sepersonid`,`t`.`sepersonname` AS `sepersonname`,`t`.`sedeptid` AS `sedeptid`,`t`.`sedeptname` AS `sedeptname`,`t`.`seognid` AS `seognid`,`t`.`seognname` AS `seognname`,`t`.`slock` AS `slock`,`t`.`sstatusid` AS `sstatusid`,`t`.`sstatusname` AS `sstatusname`,`t`.`skindid` AS `skindid`,`t`.`scurl` AS `scurl`,`t`.`seurl` AS `seurl`,`t`.`sexecutemode` AS `sexecutemode`,`t`.`ssequence` AS `ssequence`,`t`.`scpersoncode` AS `scpersoncode`,`t`.`scposid` AS `scposid`,`t`.`scposcode` AS `scposcode`,`t`.`scposname` AS `scposname`,`t`.`scdeptcode` AS `scdeptcode`,`t`.`scogncode` AS `scogncode`,`t`.`scfid` AS `scfid`,`t`.`sepersoncode` AS `sepersoncode`,`t`.`seposid` AS `seposid`,`t`.`seposcode` AS `seposcode`,`t`.`seposname` AS `seposname`,`t`.`sedeptcode` AS `sedeptcode`,`t`.`seogncode` AS `seogncode`,`t`.`sefid` AS `sefid`,`t`.`sdata1` AS `sdata1`,`t`.`sdata2` AS `sdata2`,`t`.`sdata3` AS `sdata3`,`t`.`sdata4` AS `sdata4`,`t`.`scfname` AS `scfname`,`t`.`sefname` AS `sefname`,`t`.`version` AS `version`,`p`.`sname` AS `sflowname` from (`sa_task` `t` join `sa_task` `p`) where ((`t`.`sid` = `p`.`sparentid`) and (`t`.`sflowid` = `t`.`sid`)) */;
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

-- Dump completed on 2024-12-27 21:05:46
