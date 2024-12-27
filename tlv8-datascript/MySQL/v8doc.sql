-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: v8doc
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
-- Table structure for table `doc_admin`
--

DROP TABLE IF EXISTS `doc_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_admin` (
  `FID` varchar(32) NOT NULL,
  `FLEVE` int(11) DEFAULT NULL,
  `FNAME` varchar(500) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_admin`
--

LOCK TABLES `doc_admin` WRITE;
/*!40000 ALTER TABLE `doc_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_author`
--

DROP TABLE IF EXISTS `doc_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_author` (
  `FID` varchar(32) NOT NULL,
  `FUSERID` varchar(32) DEFAULT NULL,
  `FAMLEVE` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_author`
--

LOCK TABLES `doc_author` WRITE;
/*!40000 ALTER TABLE `doc_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_docpath`
--

DROP TABLE IF EXISTS `doc_docpath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_docpath` (
  `FID` varchar(32) NOT NULL,
  `FFILEID` varchar(32) DEFAULT NULL,
  `FFILEPATH` varchar(200) DEFAULT NULL,
  `FFILESIZE` decimal(10,0) DEFAULT NULL,
  `FVERSION` int(11) DEFAULT NULL,
  `FADDTIME` timestamp NULL DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_docpath`
--

LOCK TABLES `doc_docpath` WRITE;
/*!40000 ALTER TABLE `doc_docpath` DISABLE KEYS */;
INSERT INTO `doc_docpath` VALUES ('0123EF0D5E6D4C30B16F480DE86D5DB1','36-root','2021/03/27/11/33',401550,1,'2021-03-26 16:00:00',0),('04CCE524CC5F4A9885D6BFAE5AB2FF12','33-root','2021/03/27/11/26',401550,1,'2021-03-26 16:00:00',0),('06AED8E90B034B8DBA95B15544B9F48A','24-root','2021/03/27/10/59',401550,1,'2021-03-26 16:00:00',0),('0B79FE10EFE34B8E827AD936555CD720','41-root','2021/03/27/12/26',4518210,1,'2021-03-26 16:00:00',0),('157C3A19513840E0B394274DDB93B6D1','31-root','2021/03/27/11/22',401550,1,'2021-03-26 16:00:00',0),('1652E76A75E34DC1AD1116FCE1B28C37','5-root','2021/03/26/21/09',401550,1,'2021-03-25 16:00:00',0),('18A087971FDA4D9C86339E8F619E0B7E','13-root','2021/03/26/21/31',401550,1,'2021-03-25 16:00:00',0),('1E0937AB7A2C41C294829FAE76BAF322','28-root','2021/03/27/11/04',401550,1,'2021-03-26 16:00:00',0),('1E40F91BA0B0492FB6C020D9EEB8841F','12-root','2021/03/26/21/27',401550,1,'2021-03-25 16:00:00',0),('2712654BEFBD42079DCC41A3C1BD7F9C','25-root','2021/03/27/10/59',401550,1,'2021-03-26 16:00:00',0),('2C54B4FDEA174362B437770919B42A97','49-root','2022/05/01/15/59',5488640,1,'2022-05-01 07:59:32',0),('2FB64BDD0FE245ED8FD4BF86F4C2BDB2','15-root','2021/03/26/22/37',401550,1,'2021-03-25 16:00:00',0),('31CEF59A1A9B459ABCF04A870E62CD64','6-root','2021/03/26/21/12',401550,1,'2021-03-25 16:00:00',0),('39679EEEE5004179861CE744BD131FAE','22-root','2021/03/27/10/56',401550,1,'2021-03-26 16:00:00',0),('3EA832D26C504CE2AED8BD9785B37069','34-root','2021/03/27/11/27',401550,1,'2021-03-26 16:00:00',0),('4173E6A7162549008CE38548CCA56525','9-root','2021/03/26/21/17',401550,1,'2021-03-25 16:00:00',0),('41DBA6A482204116BE5C3E23B97A6426','20-root','2021/03/26/22/47',401550,1,'2021-03-25 16:00:00',0),('470C51772D714EDAB8AC0A3B4BF8AE3E','23-root','2021/03/27/10/58',401550,1,'2021-03-26 16:00:00',0),('4B93238A44C0466FAC75D5F707F59EC2','7-root','2021/03/26/21/12',401550,1,'2021-03-25 16:00:00',0),('4DA2FDCECFA2434FB57BF8FB892E862E','40-root','2021/03/27/12/25',4518210,1,'2021-03-26 16:00:00',0),('5410A2C3C4194C01807B09CE61C875EF','4-root','2021/03/26/21/09',401550,1,'2021-03-25 16:00:00',0),('5FEEFF4832B14FB09ADCB6E0413A4ADE','10-root','2021/03/26/21/21',401550,1,'2021-03-25 16:00:00',0),('6A86DAAB9A93405DA5E28F1CB9FC32CB','32-root','2021/03/27/11/24',401550,1,'2021-03-26 16:00:00',0),('8361E76E5D3949B69D6C58114E1D6BBF','18-root','2021/03/26/22/46',401550,1,'2021-03-25 16:00:00',0),('84273FED034A4FECB92D2364DE0E8C98','11-root','2021/03/26/21/21',401550,1,'2021-03-25 16:00:00',0),('857F62021136414581DFD88FF0885AF6','29-root','2021/03/27/11/05',401550,1,'2021-03-26 16:00:00',0),('8D107F62E59D457D9FFF6B189ED6CDE0','8-root','2021/03/26/21/16',401550,1,'2021-03-25 16:00:00',0),('90924FADC24949CCB58CA0F29197CAC5','19-root','2021/03/26/22/47',401550,1,'2021-03-25 16:00:00',0),('9754BC00EAD44DC9A4ABF3F53FB56C78','47-root','2022/05/01/15/25',5488640,1,'2022-05-01 07:25:37',0),('9889A35EF7EE44449395668C9B24D67A','35-root','2021/03/27/11/31',401550,1,'2021-03-26 16:00:00',0),('A15ACE6CCCCD4F1F9AB48BF72689E203','42-root','2021/03/27/12/27',616176,1,'2021-03-26 16:00:00',0),('B44E63D6E4814075944635B0EBBA8BCE','21-root','2021/03/27/10/44',401550,1,'2021-03-26 16:00:00',0),('BA12D7EA9BF84FEC9FB60ABC7B6F7A72','26-root','2021/03/27/11/02',401550,1,'2021-03-26 16:00:00',0),('C0278B6F9C474629B43AC901367031E6','17-root','2021/03/26/22/43',401550,1,'2021-03-25 16:00:00',0),('C3D9453A3FE84FEB8A90612E2DB132A5','48-root','2022/05/01/15/53',5488640,1,'2022-05-01 07:53:52',0),('C798F1FBB68A4F419FA804B11494CF3F','38-root','2021/03/27/11/51',401550,1,'2021-03-26 16:00:00',0),('D60CBEAD1B234E018AAA56D187CDEE67','27-root','2021/03/27/11/03',401550,1,'2021-03-26 16:00:00',0),('D72CCE55C978488F9EFD3134C03CBEA7','50-root','2022/05/01/16/00',5488640,1,'2022-05-01 08:00:19',0),('DB6527572C55457BBFC17E1EBE895B31','3-root','2021/03/26/21/02',401550,1,'2021-03-25 16:00:00',0),('DF29E03688BC46859363E28D5D23BDAE','51-root','2022/05/01/16/06',66048,1,'2022-05-01 08:06:49',0),('DFC706837F314A1DB313560530EB3F61','16-root','2021/03/26/22/41',401550,1,'2021-03-25 16:00:00',0),('EA441DD6AE364A95AE12826BD1299FA1','43-root','2021/04/14/10/01',5353,1,'2021-04-14 02:01:04',0),('EB4D2D63E43A4E7E9087B230A3EDB821','14-root','2021/03/26/21/32',401550,1,'2021-03-25 16:00:00',0),('EFD0452844604185A4B3CF384C1DA2E3','37-root','2021/03/27/11/45',401550,1,'2021-03-26 16:00:00',0),('F1F442EAD53647459DE26729E507031E','30-root','2021/03/27/11/20',401550,1,'2021-03-26 16:00:00',0),('FA9B153B52244C9C8775BA95694F13D2','39-root','2021/03/27/11/51',415744,1,'2021-03-26 16:00:00',0),('FFD7BFD9864249BBA29DE405E878CDA8','2-root','2021/03/26/21/01',401550,1,'2021-03-25 16:00:00',0);
/*!40000 ALTER TABLE `doc_docpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_document`
--

DROP TABLE IF EXISTS `doc_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_document` (
  `FID` varchar(32) NOT NULL,
  `FDOCID` varchar(32) DEFAULT NULL,
  `FDOCNAME` varchar(1000) DEFAULT NULL,
  `FEXTNAME` varchar(100) DEFAULT NULL,
  `FDOCSIZE` decimal(10,0) DEFAULT NULL,
  `FDOCTYPE` varchar(100) DEFAULT NULL,
  `FADDTIME` timestamp NULL DEFAULT NULL,
  `FUPDATETIME` timestamp NULL DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_document`
--

LOCK TABLES `doc_document` WRITE;
/*!40000 ALTER TABLE `doc_document` DISABLE KEYS */;
INSERT INTO `doc_document` VALUES ('019F9486085043239CABE79601657C96','30-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('0415F60D1BCE4B0E8602FE59DBCEF38B','5-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('0835D6F41FF147F6A540533B1CC579EE','34-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('0C644CFEBF3947AB9463122B1533ACD2','47-root','SQL2008????????.doc','.doc',5488640,'application/octet-stream','2022-05-01 07:25:37',NULL,0),('0DB83EFBAA6745F7914C3E4B27415C89','22-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('0F7FCDF2E1274D8D9C25B8936592F135','39-root','ocx签名.doc','.doc',415744,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('1A19A905212D49F993ED29BD10755BA8','28-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('1CB854A1DCC3405DA9DF2FDF2021F416','8-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('21675FACDA544D08BE1B91F72F567FDF','26-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('259FA94104BC4C3DA27679182D5A9A2A','12-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('27394E48553F48D6BFB00125C320C065','23-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('2D609B9BB82B411F87DFF9F539558932','37-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('306A13F971F245CCBC934E19451917B2','50-root','SQL2008????????.doc','.doc',5488640,'application/octet-stream','2022-05-01 08:00:19',NULL,0),('30ECA32C8721491DA56F477B4DDA4255','16-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('321C226808284912B20E1A29FD937FB0','19-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('344011A907F94B33A60C7931BE7E312E','25-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('3613157E80C64649B14D037F2EA40A5B','29-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('39608F8806E044089400FA9E4702724C','4-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('3B66BAC2D3134B46A815843ADAE58F94','42-root','中共文山州委办公室文件.wps','.wps',616176,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('453C709A92D6459A97C0B4989D7988F8','2-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('473AFF793D8E44ACB8CB27E84DFC1A4B','33-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('49195FDD724D4F47B87F6FC346153CEC','10-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('50151DFB1DBB46AA9DA544E4BE5AFAE6','38-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('5788F8FB4C394C32B341FA2352D11A6C','36-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('598BDEBB47B947DDBA512C21C92196B4','41-root','Windows2008+sqlserver2008 集群安装（双机热备）.pdf','.pdf',4518210,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('77955AD067F34A27872C43E57FF9B5C4','24-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('843FCC114BF54695973ACEC7749FC867','13-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('89CA74D9A5D24E37BB31A63F4B36A22C','17-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('8C6A668A4B7941FE98CA3430F323EFDA','20-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('969B863867D94A8082FD38D01483483A','9-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('969BF42CD8414B26873A3A098A36CFA7','40-root','Windows2008+sqlserver2008 ??????????.pdf','.pdf',4518210,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('9757A45933F24173BB5E9CE42E5FBD09','31-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('AEF83DA05AEC4F4D928A705D38E46410','14-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('B8D47379C8AC4296B849413BE4E26A55','11-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('CAB0A57B1FED40D08CB8D8B26614F9B3','27-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('CDBBF45D175F4A7ABF9A04F5D7F04761','35-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('D645F47A20184647AB9E84D580E7F30E','32-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('E00CFEE199784BD39202240B031A038D','3-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('E0E524B6BB344A7C96BB6CC23A243047','48-root','SQL2008????????.doc','.doc',5488640,'application/octet-stream','2022-05-01 07:53:52',NULL,0),('E1110B89AD234723B53527D1DC95B2BA','7-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('E2A960A4AC474971BA189C7ED72E6386','43-root','ddlu.jpg','.jpg',5353,'application/octet-stream','2021-04-14 02:01:04',NULL,0),('ED0FB41E41784D3F85B54719B1F793C1','6-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('F018E1E0B4684D9896C659EEAD30D08E','15-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('F03D7336BB264B3CBE43B0A98C3A67AF','51-root','tomcat_6.0配置.doc','.doc',66048,'application/msword','2022-05-01 08:06:49',NULL,0),('F2B0C4F2A5D3472A899A6CDF1B65C0A2','21-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-26 16:00:00',NULL,0),('F59E4FF2A5AE47AFB47AB98A46BBB82A','18-root','12.jpg','.jpg',401550,'application/octet-stream','2021-03-25 16:00:00',NULL,0),('FF1851526B1645A9B4453C9A1D4FFE2F','49-root','SQL2008????????.doc','.doc',5488640,'application/octet-stream','2022-05-01 07:59:32',NULL,0);
/*!40000 ALTER TABLE `doc_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_index`
--

DROP TABLE IF EXISTS `doc_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_index` (
  `FMAX` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_index`
--

LOCK TABLES `doc_index` WRITE;
/*!40000 ALTER TABLE `doc_index` DISABLE KEYS */;
INSERT INTO `doc_index` VALUES (100);
/*!40000 ALTER TABLE `doc_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_log`
--

DROP TABLE IF EXISTS `doc_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_log` (
  `FID` varchar(32) NOT NULL,
  `FUSERID` varchar(32) DEFAULT NULL,
  `FADDTIME` timestamp NULL DEFAULT NULL,
  `FACTION` varchar(100) DEFAULT NULL,
  `FMESSAGE` longtext,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_log`
--

LOCK TABLES `doc_log` WRITE;
/*!40000 ALTER TABLE `doc_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_pathindex`
--

DROP TABLE IF EXISTS `doc_pathindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_pathindex` (
  `FDOCPATH` varchar(200) DEFAULT NULL,
  `FMAX` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_pathindex`
--

LOCK TABLES `doc_pathindex` WRITE;
/*!40000 ALTER TABLE `doc_pathindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_pathindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_result`
--

DROP TABLE IF EXISTS `doc_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_result` (
  `RESULTID` varchar(500) DEFAULT NULL,
  `RESULTCONTENT` longtext
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_result`
--

LOCK TABLES `doc_result` WRITE;
/*!40000 ALTER TABLE `doc_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_user`
--

DROP TABLE IF EXISTS `doc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_user` (
  `FID` varchar(32) NOT NULL,
  `FLOGINID` varchar(100) DEFAULT NULL,
  `FUSERNAME` varchar(100) DEFAULT NULL,
  `FENABLE` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_user`
--

LOCK TABLES `doc_user` WRITE;
/*!40000 ALTER TABLE `doc_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'v8doc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-27 21:05:22
