/*
 Navicat Premium Data Transfer

 Source Server         : localhost-MySQL
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : tlv8-vue

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 24/11/2024 20:44:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bo_blog
-- ----------------------------
DROP TABLE IF EXISTS `bo_blog`;
CREATE TABLE `bo_blog`  (
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `entry_number` int(11) NULL DEFAULT NULL,
  `recent_number` int(11) NULL DEFAULT NULL,
  `recent_entry_number` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `comment_audit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `openscope` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `setting` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `blogcategory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `chairman` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `chairman_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bo_blog
-- ----------------------------
INSERT INTO `bo_blog` VALUES ('F26E62B825374E1485D7CFB30DC88A26', '电动汽车的未来', '聊一聊电动汽车', 1, NULL, NULL, 0, '否', NULL, '允许匿名', '科技', 'system', 'PSN01', 1);

-- ----------------------------
-- Table structure for bo_category
-- ----------------------------
DROP TABLE IF EXISTS `bo_category`;
CREATE TABLE `bo_category`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `display_order` int(11) NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fmasterid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bo_category
-- ----------------------------
INSERT INTO `bo_category` VALUES ('CAAC7ED134A000017E191C2ED3D07A30', '科技', 1, '科技频道，畅想未来！', NULL, 1);

-- ----------------------------
-- Table structure for bo_comment
-- ----------------------------
DROP TABLE IF EXISTS `bo_comment`;
CREATE TABLE `bo_comment`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '回复人',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '回复内容',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '回复时间',
  `entry_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '帖子ID',
  `entry_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '帖子标题',
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `bo_com_ENTRY_ID`(`entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bo_comment
-- ----------------------------

-- ----------------------------
-- Table structure for bo_entry
-- ----------------------------
DROP TABLE IF EXISTS `bo_entry`;
CREATE TABLE `bo_entry`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `category_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `comment_hit` int(11) NULL DEFAULT NULL,
  `allow_comment` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  `hits` int(11) NULL DEFAULT NULL,
  `bo_blogid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accessories` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fextend01` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `oneself` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `creatorid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `bo_entry_creatorid`(`creatorid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bo_entry
-- ----------------------------
INSERT INTO `bo_entry` VALUES ('F07BE5C9C5E1465A86E2BBF87036C873', '小米汽车', '小米汽车定价', NULL, '科技', NULL, NULL, 0, '2024-03-21 13:50:26', NULL, NULL, NULL, NULL, NULL, 'system', 'PSN01', 1);

-- ----------------------------
-- Table structure for doc_admin
-- ----------------------------
DROP TABLE IF EXISTS `doc_admin`;
CREATE TABLE `doc_admin`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fleve` int(11) NULL DEFAULT NULL,
  `fname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc_admin
-- ----------------------------

-- ----------------------------
-- Table structure for doc_author
-- ----------------------------
DROP TABLE IF EXISTS `doc_author`;
CREATE TABLE `doc_author`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fuserid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `famleve` int(11) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc_author
-- ----------------------------

-- ----------------------------
-- Table structure for doc_docpath
-- ----------------------------
DROP TABLE IF EXISTS `doc_docpath`;
CREATE TABLE `doc_docpath`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ffileid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ffilepath` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ffilesize` double NULL DEFAULT NULL,
  `fversion` int(11) NULL DEFAULT NULL,
  `faddtime` datetime(0) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc_docpath
-- ----------------------------
INSERT INTO `doc_docpath` VALUES ('2078071EC3C04F62B089F8EC65C2827C', '50-root', '2024/03/05/15/59', 24067, 1, '2024-03-05 15:59:32', 0);
INSERT INTO `doc_docpath` VALUES ('48914928D0FC46BA888B1CB89D4A9A76', '49-root', '2024/03/05/15/58', 24067, 1, '2024-03-05 15:58:25', 0);
INSERT INTO `doc_docpath` VALUES ('501E207B576A4F738D029315C399142B', '64-root', '2024/03/20/14/36', 12232, 1, '2024-03-20 14:36:21', 0);
INSERT INTO `doc_docpath` VALUES ('62B3BB4B6B0E408AB1E6427EE303DADF', '62-root', '2024/03/07/11/03', 14349, 1, '2024-03-07 11:03:12', 0);
INSERT INTO `doc_docpath` VALUES ('75F6F4FFF7374071B7B03EB45A833EAF', '58-root', '2024/03/06/15/53', 12232, 1, '2024-03-06 15:53:47', 0);
INSERT INTO `doc_docpath` VALUES ('8CA84CDCA36B4C9595C71851298FEFB7', '61-root', '2024/03/07/11/00', 14349, 1, '2024-03-07 11:00:53', 0);
INSERT INTO `doc_docpath` VALUES ('94ADDDB6755844F4B56C35C31FC75200', '66-root', '2024/03/21/11/22', 24020, 1, '2024-03-21 11:22:04', 0);
INSERT INTO `doc_docpath` VALUES ('9AADC6D9E9414E4AA4E9251DAADDC694', '60-root', '2024/03/07/10/57', 14349, 1, '2024-03-07 10:57:41', 0);
INSERT INTO `doc_docpath` VALUES ('A150B1A61FE94BADA58A84BEB1613067', '63-root', '2024/03/18/14/58', 24067, 1, '2024-03-18 14:58:31', 0);
INSERT INTO `doc_docpath` VALUES ('A64B33C02A8E4FDBBD4CD8A619322DC2', '59-root', '2024/03/07/10/55', 12232, 1, '2024-03-07 10:55:21', 0);
INSERT INTO `doc_docpath` VALUES ('AC1105AE01194D3CA7460413A110B38D', '54-root', '2024/03/06/15/42', 457809, 1, '2024-03-06 15:42:14', 0);
INSERT INTO `doc_docpath` VALUES ('ACC642D7038B46A6A55791BD35411578', '48-root', '2024/03/04/11/26', 17774, 1, '2024-03-04 11:26:50', 0);
INSERT INTO `doc_docpath` VALUES ('C169EA1DB24745718AB19B4BA82AA87E', '55-root', '2024/03/06/15/42', 14349, 1, '2024-03-06 15:42:29', 0);
INSERT INTO `doc_docpath` VALUES ('C9B260DAD7334E7DBC6E6BD7342E1DAA', '65-root', '2024/03/20/15/29', 24020, 1, '2024-03-20 15:29:36', 0);
INSERT INTO `doc_docpath` VALUES ('CCB95DE53E954D7B98B32E9A5BEC85C5', '57-root', '2024/03/06/15/53', 12232, 1, '2024-03-06 15:53:13', 0);
INSERT INTO `doc_docpath` VALUES ('E6598947DF774C86866E6F4ACA6A02ED', '56-root', '2024/03/06/15/52', 14349, 1, '2024-03-06 15:52:35', 0);
INSERT INTO `doc_docpath` VALUES ('E9FDAADB5A7B4DC28E4C4A2250E13676', '47-root', '2024/03/04/10/19', 17774, 1, '2024-03-04 10:19:19', 0);
INSERT INTO `doc_docpath` VALUES ('EA912F34899B493EB61BC9A3D174DC65', '52-root', '2024/03/06/10/27', 24067, 1, '2024-03-06 10:27:05', 0);
INSERT INTO `doc_docpath` VALUES ('F3FD1A3EDC4646DD8BEB80D7F2896C84', '51-root', '2024/03/06/10/26', 24067, 1, '2024-03-06 10:26:18', 0);

-- ----------------------------
-- Table structure for doc_document
-- ----------------------------
DROP TABLE IF EXISTS `doc_document`;
CREATE TABLE `doc_document`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fdocid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fdocname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fextname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fdocsize` double NULL DEFAULT NULL,
  `fdoctype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `faddtime` datetime(0) NULL DEFAULT NULL,
  `fupdatetime` datetime(0) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc_document
-- ----------------------------

-- ----------------------------
-- Table structure for doc_index
-- ----------------------------
DROP TABLE IF EXISTS `doc_index`;
CREATE TABLE `doc_index`  (
  `fmax` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc_index
-- ----------------------------
INSERT INTO `doc_index` VALUES (66);

-- ----------------------------
-- Table structure for doc_log
-- ----------------------------
DROP TABLE IF EXISTS `doc_log`;
CREATE TABLE `doc_log`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fuserid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `faddtime` datetime(0) NULL DEFAULT NULL,
  `faction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fmessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc_log
-- ----------------------------

-- ----------------------------
-- Table structure for doc_pathindex
-- ----------------------------
DROP TABLE IF EXISTS `doc_pathindex`;
CREATE TABLE `doc_pathindex`  (
  `fdocpath` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fmax` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc_pathindex
-- ----------------------------

-- ----------------------------
-- Table structure for doc_result
-- ----------------------------
DROP TABLE IF EXISTS `doc_result`;
CREATE TABLE `doc_result`  (
  `resultid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `resultcontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc_result
-- ----------------------------

-- ----------------------------
-- Table structure for doc_user
-- ----------------------------
DROP TABLE IF EXISTS `doc_user`;
CREATE TABLE `doc_user`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `floginid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fusername` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fenable` int(11) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc_user
-- ----------------------------

-- ----------------------------
-- Table structure for im_fileinfo
-- ----------------------------
DROP TABLE IF EXISTS `im_fileinfo`;
CREATE TABLE `im_fileinfo`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `savetype` int(11) NULL DEFAULT NULL,
  `saveinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fsize` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `folderid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_fileinfo
-- ----------------------------

-- ----------------------------
-- Table structure for im_group
-- ----------------------------
DROP TABLE IF EXISTS `im_group`;
CREATE TABLE `im_group`  (
  `id` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `head` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `creator` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `im_group_creator`(`creator`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_group
-- ----------------------------

-- ----------------------------
-- Table structure for im_group_memli
-- ----------------------------
DROP TABLE IF EXISTS `im_group_memli`;
CREATE TABLE `im_group_memli`  (
  `id` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupid` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `userid` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `im_group_memli_userid`(`userid`) USING BTREE,
  INDEX `im_groupm_groupid`(`groupid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_group_memli
-- ----------------------------

-- ----------------------------
-- Table structure for im_header
-- ----------------------------
DROP TABLE IF EXISTS `im_header`;
CREATE TABLE `im_header`  (
  `userid` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `head` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_header
-- ----------------------------

-- ----------------------------
-- Table structure for im_message
-- ----------------------------
DROP TABLE IF EXISTS `im_message`;
CREATE TABLE `im_message`  (
  `mid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mcontenttype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mcontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `mfrom` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mto` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mstate` int(11) NULL DEFAULT NULL,
  `isgroup` int(11) NULL DEFAULT NULL,
  `msendtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `im_message_from`(`mfrom`) USING BTREE,
  INDEX `im_message_state`(`mstate`) USING BTREE,
  INDEX `im_message_to`(`mto`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_message
-- ----------------------------
INSERT INTO `im_message` VALUES ('C47C108FEC7F49C29D991D3454D03E4B', 'content', '[{\"text\":\"22\"}]', 'DC349D31F5FE4113ABA2BBC06B1E42D7', 'PSN01', 0, 0, '2024-11-21 22:44:31');
INSERT INTO `im_message` VALUES ('FF229591BE254B708B97463699D33088', 'content', '[{\"text\":\"11\"}]', 'PSN01', 'DC349D31F5FE4113ABA2BBC06B1E42D7', 1, 0, '2024-11-21 22:41:48');

-- ----------------------------
-- Table structure for im_message_memli
-- ----------------------------
DROP TABLE IF EXISTS `im_message_memli`;
CREATE TABLE `im_message_memli`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tid` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `im_message_memli_mid`(`mid`) USING BTREE,
  INDEX `im_message_memli_tid`(`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of im_message_memli
-- ----------------------------

-- ----------------------------
-- Table structure for oa_adm_mygroupfrom
-- ----------------------------
DROP TABLE IF EXISTS `oa_adm_mygroupfrom`;
CREATE TABLE `oa_adm_mygroupfrom`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcreatorid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `fcreator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `fcreatedeptid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建部门ID',
  `fcreatedept` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建部门',
  `fcreatedate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `foutkey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '群组ID',
  `fpersonid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '成员ID',
  `fpersonname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '成员名称',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `oa_mygroupde_foutkey`(`foutkey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_adm_mygroupfrom
-- ----------------------------
INSERT INTO `oa_adm_mygroupfrom` VALUES ('CAABE4DB3A20000175A7106216C010BD', 'PSN01', 'system', NULL, NULL, '2024-03-19 15:26:34', '7D03AA29686542A2AAAFA06FB123EF14', '45BB9FCAF8394E43B45A55CF564F9CCD', '测试人员2', 1);
INSERT INTO `oa_adm_mygroupfrom` VALUES ('CAABE4DB3FA00001168635101E7715CD', 'PSN01', 'system', NULL, NULL, '2024-03-19 15:26:34', '7D03AA29686542A2AAAFA06FB123EF14', 'DC349D31F5FE4113ABA2BBC06B1E42D7', '测试人员1', 1);

-- ----------------------------
-- Table structure for oa_adm_mygroupmain
-- ----------------------------
DROP TABLE IF EXISTS `oa_adm_mygroupmain`;
CREATE TABLE `oa_adm_mygroupmain`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcreatorid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人员ID',
  `fcreator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `fcreatedeptid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人部门ID',
  `fcreatedept` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建部门',
  `fcreatedate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `fgroupname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '群组名称',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `oa_mygroup_psnid`(`fcreatorid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_adm_mygroupmain
-- ----------------------------
INSERT INTO `oa_adm_mygroupmain` VALUES ('7D03AA29686542A2AAAFA06FB123EF14', 'PSN01', 'system', NULL, NULL, '2024-03-19 15:26:19', '测试群组', 1);

-- ----------------------------
-- Table structure for oa_em_receiveemail
-- ----------------------------
DROP TABLE IF EXISTS `oa_em_receiveemail`;
CREATE TABLE `oa_em_receiveemail`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `femailname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮件标题',
  `ftext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '邮件内容',
  `ffjid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '附件',
  `fsendpername` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送名称',
  `fsendperid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送人ID',
  `freplystate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接收状态',
  `fqurey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '查看状态',
  `fconsignee` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件人',
  `fconsigneeid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件人ID',
  `fconsigneecode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件人编码',
  `fsendtime` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `fsendpercode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送人编码',
  `fsendogn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送机构',
  `fsenddept` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送部门',
  `fcollect` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'COLLECT',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收件箱' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_em_receiveemail
-- ----------------------------

-- ----------------------------
-- Table structure for oa_em_sendemail
-- ----------------------------
DROP TABLE IF EXISTS `oa_em_sendemail`;
CREATE TABLE `oa_em_sendemail`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `femailname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮件标题',
  `fconsignee` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '收件人',
  `ftext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '邮件内容',
  `fstate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送状态',
  `fconsigneeid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '收件人ID',
  `fconsigneecode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '收件人编码',
  `ffjid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '附件',
  `fsendpername` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发件人',
  `fsendperid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发件人ID',
  `fcreattime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `fsendtime` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `fsendpercode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发件人编码',
  `fsendogn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送机构',
  `fsenddept` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送部门',
  `fcollect` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'COLLECT',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '发件箱' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_em_sendemail
-- ----------------------------

-- ----------------------------
-- Table structure for oa_flowconclusion
-- ----------------------------
DROP TABLE IF EXISTS `oa_flowconclusion`;
CREATE TABLE `oa_flowconclusion`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fconclusionname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '审批意见',
  `forder` int(11) NULL DEFAULT NULL COMMENT '排序',
  `fcreatorid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `fcreator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '常用审批意见' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_flowconclusion
-- ----------------------------
INSERT INTO `oa_flowconclusion` VALUES ('78BB6847EF4249DCB144580BDF869911', '同意', 1, 'PSN01', 'system', 1);
INSERT INTO `oa_flowconclusion` VALUES ('BCF65903FC704F18BC9E8B322DFFC088', '已阅', 2, 'PSN01', 'system', 1);

-- ----------------------------
-- Table structure for oa_flowrecord
-- ----------------------------
DROP TABLE IF EXISTS `oa_flowrecord`;
CREATE TABLE `oa_flowrecord`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fnodename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '环节名称',
  `fagreetext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '审批意见',
  `fcreatepername` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审批人',
  `fcreatedeptname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审批部门',
  `fcreatetime` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `fbillid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '业务ID',
  `fcreatedeptid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审批部门ID',
  `fcreateperid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审批人ID',
  `fnodeid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '环节标识',
  `fopviewid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '显示位置div id',
  `ftaskid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务id',
  `fflowid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程id',
  `fsign` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '签名',
  `fremark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '审批记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_flowrecord
-- ----------------------------
INSERT INTO `oa_flowrecord` VALUES ('5E0E8901C273493B9FE4E5E3B3DDBD3B', 'bizActivity6', '已阅', 'system', '', '2024-03-04 11:57:25', '5DED8CED0A9F48C1818D116BBD21559E', '', 'PSN01', 'bizActivity6', 'opts', '8975DE9A89884850B581077AB0AB3D32', '153636D70465410FA166097E6E74A7DC', '', '', 0);
INSERT INTO `oa_flowrecord` VALUES ('B6DD63F558B7441E856FE958EDFF5E82', 'bizActivity4', '同意', 'system', '', '2024-03-04 09:55:23', '5DED8CED0A9F48C1818D116BBD21559E', '', 'PSN01', 'bizActivity4', 'opts', 'E985BA1782104968A2D0BFA804EFC699', '153636D70465410FA166097E6E74A7DC', '', '', 0);

-- ----------------------------
-- Table structure for oa_leave
-- ----------------------------
DROP TABLE IF EXISTS `oa_leave`;
CREATE TABLE `oa_leave`  (
  `fid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcreatorname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fcreatorid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fcreatorfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fcreatorfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fcreatedate` datetime(0) NULL DEFAULT NULL,
  `fstartdate` date NULL DEFAULT NULL,
  `fenddate` date NULL DEFAULT NULL,
  `fday` int(11) NULL DEFAULT NULL,
  `fleavetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fstate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `freason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_leave
-- ----------------------------
INSERT INTO `oa_leave` VALUES ('08002CF2B6994F5C957B14520C93E39E', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-01 11:15:14', NULL, NULL, NULL, '事假', NULL, NULL, 17);
INSERT INTO `oa_leave` VALUES ('165DF15A41044EAA85DF648F4C62D4D3', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-06 12:45:49', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO `oa_leave` VALUES ('3A444A2B0A164B349FE0305B96B875FC', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-10-18 14:46:06', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO `oa_leave` VALUES ('5DED8CED0A9F48C1818D116BBD21559E', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-01 14:36:48', NULL, NULL, NULL, '事假', NULL, NULL, 8);
INSERT INTO `oa_leave` VALUES ('69FB950E3D5045978EB3D0D042F0AEC2', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-06 12:47:47', NULL, NULL, NULL, '事假', NULL, NULL, 5);
INSERT INTO `oa_leave` VALUES ('76CD91F430294D35822ACA7533120427', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-06 12:37:58', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO `oa_leave` VALUES ('771FB983112A4F4C8E68BBDCDFBFAFA1', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-01 14:25:44', NULL, NULL, NULL, '事假', NULL, NULL, 2);
INSERT INTO `oa_leave` VALUES ('87658B0C52B3426685F4B75EFB41ACAC', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-01 14:12:24', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO `oa_leave` VALUES ('A77BB11A28BF4156A70746179CDB086E', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-06 12:27:31', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO `oa_leave` VALUES ('C4BDABFC0493439F86180500AA988D06', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-05 11:46:40', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO `oa_leave` VALUES ('D9F40DD3A388405DBAB2F6C5E2393CEF', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-10-18 14:59:01', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO `oa_leave` VALUES ('EC64552AC26F42A3AD8CE67C71213481', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-01 14:31:12', NULL, NULL, NULL, '事假', NULL, NULL, 1);

-- ----------------------------
-- Table structure for oa_news_column
-- ----------------------------
DROP TABLE IF EXISTS `oa_news_column`;
CREATE TABLE `oa_news_column`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcolumncode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fcolumnname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fcolumndescribes` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fcolumnstate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_news_column
-- ----------------------------

-- ----------------------------
-- Table structure for oa_news_count
-- ----------------------------
DROP TABLE IF EXISTS `oa_news_count`;
CREATE TABLE `oa_news_count`  (
  `fid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `news_number` int(11) NULL DEFAULT NULL,
  `news_person` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `news_personid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `news_releaseid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `yetperson` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `yetpersonid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_news_count
-- ----------------------------

-- ----------------------------
-- Table structure for oa_news_open
-- ----------------------------
DROP TABLE IF EXISTS `oa_news_open`;
CREATE TABLE `oa_news_open`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fopenid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fopenname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fnewsid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `oa_new_open_nid`(`fnewsid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_news_open
-- ----------------------------

-- ----------------------------
-- Table structure for oa_news_release
-- ----------------------------
DROP TABLE IF EXISTS `oa_news_release`;
CREATE TABLE `oa_news_release`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fnewstitle` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `freleasedepartment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布部门',
  `fpeople` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布人',
  `ftime` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `fnewsnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '新闻编号',
  `freleaseconnext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '新闻内容',
  `fstate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  `fsettopwhether` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '置顶',
  `fsettoptime` datetime(0) NULL DEFAULT NULL COMMENT '置顶开始时间',
  `fsetendtime` datetime(0) NULL DEFAULT NULL COMMENT '置顶结束时间',
  `faccessories` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '权限',
  `fcolumnname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '栏目名称',
  `sminipic` longblob NULL COMMENT '缩略图',
  `ftype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布类型',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_news_release
-- ----------------------------

-- ----------------------------
-- Table structure for oa_notice_person
-- ----------------------------
DROP TABLE IF EXISTS `oa_notice_person`;
CREATE TABLE `oa_notice_person`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fognid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fognname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `forgid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `forgname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fcreateid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fcreatename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fcreatedatetime` datetime(0) NULL DEFAULT NULL,
  `fpersonid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fpersonname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `freaddate` datetime(0) NULL DEFAULT NULL,
  `fpersonfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `fmainid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fbrowse` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fdeptname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fdeptid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `oa_nperson_fmainid`(`fmainid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_notice_person
-- ----------------------------
INSERT INTO `oa_notice_person` VALUES ('F1572428C0A743759F5DCC3048DD99D8', 'ORG01', '管理员', 'ORG01', '管理员', 'PSN01', 'system', '2024-03-20 14:51:31', 'PSN01', 'system', '2024-03-20 14:51:31', '/管理员/system', 'CF2A44B39A4040DF850CC8CBF20D7565', '是', '', '', NULL);

-- ----------------------------
-- Table structure for oa_pulicnotice
-- ----------------------------
DROP TABLE IF EXISTS `oa_pulicnotice`;
CREATE TABLE `oa_pulicnotice`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fognid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人机构ID',
  `fognname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人机构名称',
  `forgid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人组织ID',
  `forgname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人组织名称',
  `fcreateid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `fcreatename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `fcreatedatetime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `fpushdatetime` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `ftitle` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `fcontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `fcreatedate` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `fpushid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布ID',
  `fpushname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布人',
  `ftype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布类型',
  `fattfile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '附件',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `oa_notes_fcreateid`(`fcreateid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_pulicnotice
-- ----------------------------
INSERT INTO `oa_pulicnotice` VALUES ('CF2A44B39A4040DF850CC8CBF20D7565', 'ORG01', '管理员', 'ORG01', '管理员', 'PSN01', 'system', '2024-03-20 14:43:01', '2024-03-20 14:50:56', '测试通知', '测试通知内容', '2024-03-20 14:43:01', 'PSN01', 'system', '限制发布', NULL, 2);

-- ----------------------------
-- Table structure for oa_re_dayreport
-- ----------------------------
DROP TABLE IF EXISTS `oa_re_dayreport`;
CREATE TABLE `oa_re_dayreport`  (
  `fid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ftitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '标题',
  `fcreateognid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人机构ID',
  `fcreateognname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人机构名称',
  `fcreatedeptid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人部门ID',
  `fcreatedeptname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人部门名称',
  `fcreateposid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人岗位ID',
  `fcreateposname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人岗位名称',
  `fcreatepersonid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `fcreatepersonname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `fcreatepersonfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '创建人全ID',
  `fcreatepersonfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '创建人全名称',
  `fcreatetime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `fpushdatetime` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `ffile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '附件',
  `fcontext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_re_dayreport
-- ----------------------------
INSERT INTO `oa_re_dayreport` VALUES ('CB1747678EB6447DA2820A8D8DAE81AC', '测试个人日志', 'ORG01', '管理员', 'ORG01', '管理员', NULL, NULL, 'PSN01', 'system', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-19 15:33:44', NULL, NULL, '测试的内容', 2);

-- ----------------------------
-- Table structure for sa_doclog
-- ----------------------------
DROP TABLE IF EXISTS `sa_doclog`;
CREATE TABLE `sa_doclog`  (
  `sid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `spersonname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `saccesstype` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限类型',
  `sdocid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文档ID',
  `stime` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `sdeptname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门',
  `spersonfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '人员ID路径',
  `sdocversionid` int(11) NULL DEFAULT NULL COMMENT '文档版本',
  `sdocname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文档名称',
  `ssize` double NULL DEFAULT NULL COMMENT '文档大小',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文档日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_doclog
-- ----------------------------

-- ----------------------------
-- Table structure for sa_docnamespace
-- ----------------------------
DROP TABLE IF EXISTS `sa_docnamespace`;
CREATE TABLE `sa_docnamespace`  (
  `sid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sdisplayname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '显示名称',
  `shost` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '主机地址',
  `sport` int(11) NULL DEFAULT NULL COMMENT '服务端口',
  `surl` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '访问地址',
  `sflag` int(11) NULL DEFAULT NULL COMMENT '使用状态',
  `shtths` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否HTTPS',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文档配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_docnamespace
-- ----------------------------
INSERT INTO `sa_docnamespace` VALUES ('defaultDocNameSpace', '文档中心', '127.0.0.1', 8085, 'http://127.0.0.1:8085/DocServer', 1, 'false', 5);

-- ----------------------------
-- Table structure for sa_docnode
-- ----------------------------
DROP TABLE IF EXISTS `sa_docnode`;
CREATE TABLE `sa_docnode`  (
  `sid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sparentid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父id',
  `sdocname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '名称',
  `ssequence` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '排序',
  `ssize` double NULL DEFAULT NULL COMMENT '文件大小',
  `skind` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `sdocpath` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '文件id路径',
  `sdocdisplaypath` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '文件路径名称',
  `screatorfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '创建人全id',
  `screatorname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `screatordeptname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建部门',
  `screatetime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `seditorfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '编辑人全id',
  `seditorname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编辑人名称',
  `seditordeptname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编辑部门',
  `slastwriterfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后修改人全id',
  `slastwritername` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后修改人名称',
  `slastwriterdeptname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后修改部门',
  `slastwritetime` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `sfileid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件id',
  `sdescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '描述',
  `sdocliveversionid` int(11) NULL DEFAULT NULL COMMENT '文件版本号',
  `sclassification` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类',
  `skeywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '关键字',
  `sdocserialnumber` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文档序列',
  `snamespace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '文档空间',
  `scachename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '缓存名称',
  `srevisioncachename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编辑缓存',
  `sflag` int(11) NULL DEFAULT NULL COMMENT '状态',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `idx_sa_docnode`(`sparentid`) USING BTREE,
  INDEX `idx_sa_docnode_sfileid`(`sfileid`) USING BTREE,
  INDEX `inx_sa_donnode_skind`(`skind`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文档信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_docnode
-- ----------------------------
INSERT INTO `sa_docnode` VALUES ('root', NULL, '文档中心', '', NULL, 'dir', '/root', '/文档中心', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', NULL, '', '', '', 'defaultDocNameSpace', '', '', 1, NULL);

-- ----------------------------
-- Table structure for sa_flowdrawlg
-- ----------------------------
DROP TABLE IF EXISTS `sa_flowdrawlg`;
CREATE TABLE `sa_flowdrawlg`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sprocessid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流程图id',
  `sprocessname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程图名称',
  `sdrawlg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '流程图文本',
  `sprocessacty` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '流程图JSON',
  `screatorid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人id',
  `screatorname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `supdatorid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人id',
  `supdatorname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人名称',
  `screatetime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `supdatetime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `fenabled` int(11) NULL DEFAULT NULL COMMENT '状态',
  `sfolderid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '目录id',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `idx_sa_flowdrawlg_sprocessid`(`sprocessid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '流程图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_flowdrawlg
-- ----------------------------
INSERT INTO `sa_flowdrawlg` VALUES ('8729A781E09B42F283EFEE0FB2F7EF68', 'EFB1385BEB1441BCA87404D318B7F9BC', '测试流程', '<v:line title=\"New Line\" style=\"position: absolute; z-index: 1; cursor: pointer; display: none;\"><v:stroke></v:stroke></v:line><div id=\"bizActivity\" title=\"New bizActivity\" style=\"border: 1px solid blue; position: absolute; left: 300px; top: 80px; width: 100px; height: 40px; cursor: default; z-index: 100; display: none;\"><v:stroke></v:stroke></div><div id=\"Activity1\" title=\"开始\" style=\"position: absolute; left: 300px; top: 80px; width: 40px; height: 40px; cursor: pointer; z-index: 1;\"><svg id=\"SvgjsSvg1000\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><ellipse id=\"SvgjsEllipse1006\" rx=\"20\" ry=\"20\" cx=\"20\" cy=\"20\" stroke=\"#33cc00\" stroke-width=\"1\" fill=\"#33cc00\"></ellipse><defs id=\"SvgjsDefs1001\"></defs></svg><v:shadow></v:shadow><div style=\"position: inherit; left: 2px; top: 12px; z-index: 1; width: 100%; height: 100%; text-align: center; color: blue; font-size: 9pt;\">开始</div></div><div id=\"bizActivity2\" title=\"bizActivity2\" style=\"border: 1px solid blue; position: absolute; left: 270px; top: 140px; width: 100px; height: 40px; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;\"><div id=\"bizActivity2_Label\" style=\"width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;\">bizActivity2</div></div><div id=\"bizActivity4\" title=\"bizActivity4\" style=\"border: 1px solid blue; position: absolute; left: 270px; top: 200px; width: 100px; height: 40px; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;\"><div id=\"bizActivity4_Label\" style=\"width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;\">bizActivity4</div></div><div id=\"bizActivity6\" title=\"bizActivity6\" style=\"border: 1px solid green; position: absolute; left: 270px; top: 260px; width: 100px; height: 40px; z-index: 99999; background: rgb(255, 255, 255); box-shadow: green 5px 5px 5px;\"><div id=\"bizActivity6_Label\" style=\"width: 100%; height: 100%; margin-top: 6px; text-align: center; color: green; font-size: 10pt; line-height: 25px;\">bizActivity6</div></div><div id=\"Activity8\" title=\"结束\" style=\"position: absolute; left: 300px; top: 320px; width: 40px; height: 40px; cursor: pointer; z-index: 1;\"><svg id=\"SvgjsSvg1007\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><ellipse id=\"SvgjsEllipse1009\" rx=\"20\" ry=\"20\" cx=\"20\" cy=\"20\" stroke=\"red\" stroke-width=\"1\" fill=\"red\"></ellipse><defs id=\"SvgjsDefs1008\"></defs></svg><v:shadow></v:shadow><div style=\"position: inherit; left: 2px; top: 12px; z-index: 1; width: 100%; height: 100%; text-align: center; color: blue; font-size: 9pt;\">结束</div></div><div id=\"line_3\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1010\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1012\" points=\"320,90 320,102\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1011\"></defs></svg></div><div id=\"line_5\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1013\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1015\" points=\"320,150 320,162\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1014\"></defs></svg></div><div id=\"line_7\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1016\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1018\" points=\"320,210 320,222\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1017\"></defs></svg></div><div id=\"line_9\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1019\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1021\" points=\"320,270 320,282\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1020\"></defs></svg></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"><svg id=\"SvgjsSvg1022\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1023\"></defs></svg><svg id=\"SvgjsSvg1024\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1025\"></defs></svg><svg id=\"SvgjsSvg1026\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1027\"></defs></svg><svg id=\"SvgjsSvg1028\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1029\"></defs></svg><svg id=\"SvgjsSvg1030\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1031\"></defs></svg><svg id=\"SvgjsSvg1032\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1033\"></defs></svg><svg id=\"SvgjsSvg1034\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1035\"></defs></svg><svg id=\"SvgjsSvg1036\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1037\"></defs></svg><svg id=\"SvgjsSvg1038\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1039\"></defs></svg><svg id=\"SvgjsSvg1040\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1041\"></defs></svg><svg id=\"SvgjsSvg1042\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1043\"></defs></svg><svg id=\"SvgjsSvg1044\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs id=\"SvgjsDefs1045\"></defs></svg></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div><div id=\"EFB1385BEB1441BCA87404D318B7F9BC\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;\"></div>', '{\"id\":\"EFB1385BEB1441BCA87404D318B7F9BC\",\"name\":\"测试流程\",\"count\":9,\"nodes\":[{\"id\":\"Activity1\",\"name\":\"开始\",\"type\":\"start\",\"shape\":\"oval\",\"number\":1,\"left\":300,\"top\":80,\"width\":40,\"height\":40,\"property\":null},{\"id\":\"bizActivity2\",\"name\":\"bizActivity2\",\"type\":\"node\",\"shape\":\"rect\",\"number\":2,\"left\":270,\"top\":140,\"width\":100,\"height\":40,\"property\":[{\"id\":\"n_p_id\",\"text\":\"input\",\"value\":\"bizActivity2\"},{\"id\":\"n_p_name\",\"text\":\"input\",\"value\":\"bizActivity2\"},{\"id\":\"n_p_exepage\",\"text\":\"input\",\"value\":\"\\/demo\\/flow\\/mainActivity.html\"},{\"id\":\"n_p_label\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_desc\",\"text\":\"textarea\",\"value\":\"\"},{\"id\":\"n_p_group\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_roleID\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_role\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_r_grab\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_r_grabway\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_t_queryt\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_p_back\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_note\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_r_transe\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_in\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_time\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_timetype\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call1\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call2\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call3\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call4\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call5\",\"text\":\"input\",\"value\":\"\"}]},{\"id\":\"bizActivity4\",\"name\":\"bizActivity4\",\"type\":\"node\",\"shape\":\"rect\",\"number\":4,\"left\":270,\"top\":200,\"width\":100,\"height\":40,\"property\":[{\"id\":\"n_p_id\",\"text\":\"input\",\"value\":\"bizActivity4\"},{\"id\":\"n_p_name\",\"text\":\"input\",\"value\":\"bizActivity4\"},{\"id\":\"n_p_exepage\",\"text\":\"input\",\"value\":\"\\/demo\\/flow\\/mainActivity2.html\"},{\"id\":\"n_p_label\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_desc\",\"text\":\"textarea\",\"value\":\"\"},{\"id\":\"n_p_group\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_roleID\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_role\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_r_grab\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_r_grabway\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_t_queryt\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_p_back\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_note\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_r_transe\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_in\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_time\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_timetype\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call1\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call2\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call3\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call4\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call5\",\"text\":\"input\",\"value\":\"\"}]},{\"id\":\"bizActivity6\",\"name\":\"bizActivity6\",\"type\":\"node\",\"shape\":\"rect\",\"number\":6,\"left\":270,\"top\":260,\"width\":100,\"height\":40,\"property\":[{\"id\":\"n_p_id\",\"text\":\"input\",\"value\":\"bizActivity6\"},{\"id\":\"n_p_name\",\"text\":\"input\",\"value\":\"bizActivity6\"},{\"id\":\"n_p_exepage\",\"text\":\"input\",\"value\":\"\\/demo\\/flow\\/mainActivity2.html\"},{\"id\":\"n_p_label\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_desc\",\"text\":\"textarea\",\"value\":\"\"},{\"id\":\"n_p_group\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_roleID\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_role\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_r_grab\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_r_grabway\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_t_queryt\",\"text\":\"select\",\"value\":\"\"},{\"id\":\"n_p_back\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_note\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_r_transe\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_in\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_time\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_timetype\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call1\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call2\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call3\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call4\",\"text\":\"input\",\"value\":\"\"},{\"id\":\"n_p_call5\",\"text\":\"input\",\"value\":\"\"}]},{\"id\":\"Activity8\",\"name\":\"结束\",\"type\":\"end\",\"shape\":\"oval\",\"number\":8,\"left\":300,\"top\":320,\"width\":40,\"height\":40,\"property\":null}],\"lines\":[{\"id\":\"line_3\",\"name\":\"line_3\",\"type\":\"line\",\"shape\":\"line\",\"number\":3,\"from\":\"Activity1\",\"to\":\"bizActivity2\",\"fromx\":320,\"fromy\":120,\"tox\":320,\"toy\":140,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null},{\"id\":\"line_5\",\"name\":\"line_5\",\"type\":\"line\",\"shape\":\"line\",\"number\":5,\"from\":\"bizActivity2\",\"to\":\"bizActivity4\",\"fromx\":320,\"fromy\":180,\"tox\":320,\"toy\":200,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null},{\"id\":\"line_7\",\"name\":\"line_7\",\"type\":\"line\",\"shape\":\"line\",\"number\":7,\"from\":\"bizActivity4\",\"to\":\"bizActivity6\",\"fromx\":320,\"fromy\":240,\"tox\":320,\"toy\":260,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null},{\"id\":\"line_9\",\"name\":\"line_9\",\"type\":\"line\",\"shape\":\"line\",\"number\":9,\"from\":\"bizActivity6\",\"to\":\"Activity8\",\"fromx\":320,\"fromy\":300,\"tox\":320,\"toy\":320,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null}]}', NULL, NULL, NULL, NULL, '2024-01-12 18:05:57', '2024-01-12 18:05:57', 1, 'F92A0C6C8F2F4B5AB30ED547B38F48B0', 0);
INSERT INTO `sa_flowdrawlg` VALUES ('CAA7A851D81000012321190013501BC9', 'CAA7A851D83000013D93140DD05F1084', 'test1', '<v:line title=\"New Line\" style=\"position: absolute; z-index: 1; cursor: pointer; display: none;\"><v:stroke></v:stroke></v:line><div id=\"bizActivity\" title=\"New bizActivity\" style=\"border: 1px solid blue; position: absolute; left: 300px; top: 80px; width: 100px; height: 40px; cursor: default; z-index: 100; display: none;\"><v:stroke></v:stroke></div><div id=\"Activity1\" title=\"开始\" style=\"position: absolute; left: 300px; top: 80px; width: 40px; height: 40px; cursor: pointer; z-index: 1; border: 0px none;\"><svg id=\"SvgjsSvg1000\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><ellipse id=\"SvgjsEllipse1006\" rx=\"20\" ry=\"20\" cx=\"20\" cy=\"20\" stroke=\"#33cc00\" stroke-width=\"1\" fill=\"#33cc00\"></ellipse><defs id=\"SvgjsDefs1001\"></defs></svg><v:shadow></v:shadow><div style=\"position: inherit; left: 2px; top: 12px; z-index: 1; width: 100%; height: 100%; text-align: center; color: blue; font-size: 9pt;\">开始</div></div><div id=\"bizActivity2\" title=\"bizActivity2\" style=\"border: 1px solid blue; position: absolute; left: 270px; top: 140px; width: 100px; height: 40px; cursor: default; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;\"><div id=\"bizActivity_Label\" style=\"width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;\">bizActivity2</div></div><div id=\"line_3\" title=\"line_3\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1007\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1009\" points=\"320,90 320,102\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1008\"></defs></svg></div><div id=\"bizActivity4\" title=\"bizActivity4\" style=\"border: 1px solid blue; position: absolute; left: 270px; top: 200px; width: 100px; height: 40px; cursor: default; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;\"><div id=\"bizActivity_Label\" style=\"width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;\">bizActivity4</div></div><div id=\"line_5\" title=\"line_5\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1010\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1012\" points=\"320,150 320,162\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1011\"></defs></svg></div><div id=\"bizActivity6\" title=\"bizActivity6\" style=\"border: 1px solid blue; position: absolute; left: 270px; top: 260px; width: 100px; height: 40px; cursor: default; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;\"><div id=\"bizActivity_Label\" style=\"width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;\">bizActivity6</div></div><div id=\"line_7\" title=\"line_7\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1013\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1015\" points=\"320,210 320,222\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1014\"></defs></svg></div><div id=\"Activity8\" title=\"结束\" style=\"position: absolute; left: 300px; top: 320px; width: 40px; height: 40px; cursor: pointer; z-index: 1; border: 1px dashed green;\"><svg id=\"SvgjsSvg1016\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><ellipse id=\"SvgjsEllipse1018\" rx=\"20\" ry=\"20\" cx=\"20\" cy=\"20\" stroke=\"red\" stroke-width=\"1\" fill=\"red\"></ellipse><defs id=\"SvgjsDefs1017\"></defs></svg><v:shadow></v:shadow><div style=\"position: inherit; left: 2px; top: 12px; z-index: 1; width: 100%; height: 100%; text-align: center; color: green; font-size: 9pt;\">结束</div></div><div id=\"line_9\" title=\"line_9\" style=\"left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;\"><svg id=\"SvgjsSvg1019\" xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"100%\" height=\"100%\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><polyline id=\"SvgjsPolyline1021\" points=\"320,270 320,282\" stroke=\"blue\" stroke-width=\"1\" fill=\"none\" marker-end=\"url(#idArrow)\"></polyline><defs id=\"SvgjsDefs1020\"></defs></svg></div>', '{\"id\":\"CAA7A851D83000013D93140DD05F1084\",\"name\":\"test1\",\"count\":9,\"nodes\":[{\"id\":\"Activity1\",\"name\":\"开始\",\"type\":\"start\",\"shape\":\"oval\",\"number\":1,\"left\":300,\"top\":80,\"width\":40,\"height\":40,\"property\":null},{\"id\":\"bizActivity2\",\"name\":\"bizActivity2\",\"type\":\"node\",\"shape\":\"rect\",\"number\":2,\"left\":270,\"top\":140,\"width\":100,\"height\":40,\"property\":null},{\"id\":\"bizActivity4\",\"name\":\"bizActivity4\",\"type\":\"node\",\"shape\":\"rect\",\"number\":4,\"left\":270,\"top\":200,\"width\":100,\"height\":40,\"property\":null},{\"id\":\"bizActivity6\",\"name\":\"bizActivity6\",\"type\":\"node\",\"shape\":\"rect\",\"number\":6,\"left\":270,\"top\":260,\"width\":100,\"height\":40,\"property\":null},{\"id\":\"Activity8\",\"name\":\"结束\",\"type\":\"end\",\"shape\":\"oval\",\"number\":8,\"left\":300,\"top\":320,\"width\":40,\"height\":40,\"property\":null}],\"lines\":[{\"id\":\"line_3\",\"name\":\"line_3\",\"type\":\"line\",\"shape\":\"line\",\"number\":3,\"from\":\"Activity1\",\"to\":\"bizActivity2\",\"fromx\":320,\"fromy\":120,\"tox\":320,\"toy\":140,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null},{\"id\":\"line_5\",\"name\":\"line_5\",\"type\":\"line\",\"shape\":\"line\",\"number\":5,\"from\":\"bizActivity2\",\"to\":\"bizActivity4\",\"fromx\":320,\"fromy\":180,\"tox\":320,\"toy\":200,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null},{\"id\":\"line_7\",\"name\":\"line_7\",\"type\":\"line\",\"shape\":\"line\",\"number\":7,\"from\":\"bizActivity4\",\"to\":\"bizActivity6\",\"fromx\":320,\"fromy\":240,\"tox\":320,\"toy\":260,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null},{\"id\":\"line_9\",\"name\":\"line_9\",\"type\":\"line\",\"shape\":\"line\",\"number\":9,\"from\":\"bizActivity6\",\"to\":\"Activity8\",\"fromx\":320,\"fromy\":300,\"tox\":320,\"toy\":320,\"spwidth\":0,\"spheight\":0,\"polydot\":[],\"property\":null}]}', NULL, NULL, NULL, NULL, '2024-03-06 11:33:04', '2024-03-06 11:33:04', 1, 'F92A0C6C8F2F4B5AB30ED547B38F48B0', 2);

-- ----------------------------
-- Table structure for sa_flowfolder
-- ----------------------------
DROP TABLE IF EXISTS `sa_flowfolder`;
CREATE TABLE `sa_flowfolder`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sprocessid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程图id',
  `sprocessname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程图名称',
  `scode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '目录编号',
  `sname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '目录名称',
  `sparent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父id',
  `sidpath` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'id路径',
  `snamepath` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '路径名称',
  `scodepath` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '编号路径',
  `version` int(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `idx_sa_flwfolder_sparent`(`sparent`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '流程目录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_flowfolder
-- ----------------------------
INSERT INTO `sa_flowfolder` VALUES ('F92A0C6C8F2F4B5AB30ED547B38F48B0', NULL, NULL, 'root', '流程图', NULL, '/F92A0C6C8F2F4B5AB30ED547B38F48B0', '/流程图', '/root', 0);

-- ----------------------------
-- Table structure for sa_handwr_signature
-- ----------------------------
DROP TABLE IF EXISTS `sa_handwr_signature`;
CREATE TABLE `sa_handwr_signature`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spersonid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员id',
  `spersonname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `screaterid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人id',
  `screatername` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `screatetime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `shspic` longblob NULL COMMENT '签名图片',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '手写签名' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_handwr_signature
-- ----------------------------
INSERT INTO `sa_handwr_signature` VALUES ('PSN01', 'PSN01', 'system', 'PSN01', 'system', '2024-03-04 11:29:34', 0x89504E470D0A1A0A0000000D494844520000012C0000006408060000003C010DC0000000097048597300000B1300000B1301009A9C1800000A4D6943435050686F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDFF7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B57D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD81F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E0500D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C200A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422CCC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD974BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B231348E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158AF15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC864FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B91001067343279F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70170660189EC218BC86090441C8081361213A8811628ED822CE0817998E04226148349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD9615C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF0824028B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F9348240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB906DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA076502F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD831E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA12953A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A909D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB2868546A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16EDEBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C313863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE8767E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD946B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D65CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A64B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCADD96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3BFACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A50735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD115CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DCA2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A76E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58ECDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED926DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBFB2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BDEFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB75FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6FEB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBCCE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04FF73EE77CFEFC2FF784F3FB25D29F33000000206348524D00007A25000080830000F9FF000080E9000075300000EA6000003A980000176F925FC54600003A9B4944415478DAEC7D6777DBD8966C814912156DD97268BBD3ED3B33EFFFFF9A37A9B393645956A44802980FDAD528140F482AD8F275036B715196291204CED9BB76D50E595996688FF6688FF6F857383AED25688FF6688FD660B5477BB4477BB406AB3DDAA33D5A83D51EEDD11EEDD11AACF6688FF6688FBB397AED25688FFB3EB22C9BFBDFF6CCA38CC7DCA355C15B83D51EEDF159EC984401993C4A7B2C6DBCDAA33558EDD11E9FCA5875E4B91BCF1D314E05803C9E0B315CEDD11AACF6688FCF6AAC68A87A00FA0006F1DC1563358EC7341E345CADD16A0DD62758952D6FD11ECDC6AA1B066A15C03A80613CFA71FFC700CEE37101600460D28686ADC1BA2F43D5F2167FEF50B00F600DC0068087001E00D80903863052C7000E017C98B346DAA335589F74B176E5597F2EE4D1F2165F37BAEA4508B80E6017C073002F013C06B015AF3D01F016C01F61E0F2080BCB362C6C0DD6E740561D59ACCA59F45011AD79C0FE51CB5B7CB50709F615009B00F600FC00E027002F026901C011805F637D4C634D90CFEAB428AB35589F6391F663A1AEC6625D0FC3458435067006E0F46BE12D161871451D7A94CB20CBB22C9779FF65C3F352C22E5C2724BF069FA8FCD510C03680A700BE05F00F00DF8BC1FA106B631268EB633C5FC4F9B64EAC35589F2C0C20AA5A0F43B513BCC556FC9B0BF03416EAFB782EBF62DE4265FD4C8C066433DEC5A64C891B1966D30A4A79CDD4CE03B7B9FE6254F9B9FD786CC63AD80BC3B5176BA28CFFBF8C75F006575CD7AAFCBE3D5A83F54990158DD54678CF47B1389FC402DD0E4F3AC515C1FA2AFE9DC5EFF2AF2C2CA48150D4D91563410E2F97EF9F34164B881B29C3A49FDD8DD776E56F4AF95C0FCB7107F7806B620557A4FB7638B0EDF837CF65251CDC763C36E377DD0654DA1EADC1BA55E8A37936EB61ACF6007C17D0FF058067B158FB01FD0F626196121E322CFC1A780B279D5704350C04DD8CE37B5FC6737E4D83DDB5EBCF877E360DE5400C1AE2B3C6F1D997C61DDDD671A8F15C89B070239E07661033316A43A10E3A8646BFC410DF9FAF8552FFEE293BBD7BDA98F4E26B61949E86A1FA27801FC360ED460830888DB2137F4F39FB203696864EFFCA77930664D5C2E38DD89C6AA83FC675C8C2708C9740387ADD699856E379289FBD1A9F4743496340D1E33CC2F3E3E08D4E71433E718E23EBCAB9AD08E263E2684A9CA1C1C2E744584BF2849971743047A021BE66F2CFDCD3799FB7C8985D83D3BC551EE4A738F8DD7AF7B839576233EE02F80657C4EA3FC3703D1198DF979B79189B7818FFD7C3D7D17142F38F367025E13F8EEBF038BE6F862B52F93D8077C1DD74C27068A838CF1872A3AFA1123636E4E7A118ADF5B8C60CC18B304C27711FF6E33C3A77CC27AA51ED09DAEBD8467203DC99B3D1EEFBBE76ED5CBB86287341D0B93C0A0BB93FC7BE84810034DCDB620963E748B2B49FAF4D23F4EE7163AE5A28F86318ABE7C14BF40DE277CD9B7E4D07AF09D5B12761C07F8CD0783B5E7786ABFCA35FE2F5BAC82F132199678E0F85FB7918CEE25138814D09C156C3A831242567781906F25D9C432F3E7372077CA2AE0D558C35B5A5485C375FFC35A47D4BA5F43661985EF7BE18FF55F91DCFBD23E1FE4450F344AEED8D859625435537ACCA69166644F304E2EA2478584F0457D4988BE15B9A03ED7D019BF339AEA4EBEFC2786DCA422DE5A65DA02AC518DBE6F857E6AF7461AF07A2FA1EC07FC4E3392AB5F4340CD630FE8621E21875123E155EAD8583D80D83F8348CE15EFC7E4B8CD48A845B7DE1AF26710EBB717F18229EC5265B9A4F6CD8446AB406720EEEF121C8A4BC061A694A11B9CB7050B9482D2FDA90507F5D9C6F29DCE048D6B93EC6C61596F3CEE79A06560DD4408C6B4F9C15C59651E25C72B93F5DE143FB82EC950355C16C6A86B06CBA7FFC6EBD7B30569A18C8B0E779FCBC1D373843BD22FF0C57C9824C6960CECDF4137A9DCFE5913B8970F025AADCA3C76148B24042EBF1FA715C8B8F717D2E12709C394DC330324F831F7C19D75CAFFB5A2204EB0B9AA571B88C7BC4B4828378F46EC127AA571E0899BE2A1BDB430C2EF2E9827590358438C0A7498BF1F07E2B1CC2E3B807CACDAA3318C7BA3E8EB5CEFCB20FF1BB0B415EF9A23071C9F5DD15A3B226B4C0B6F187447DA7F1380B43AA34444F289C15A11E34049E8A911A0BF77929C0642E57761F212109DFCDB8914F222CD936644563751E86EA35AED21ADE0487722E48EB539DAB7BE51BC5DD4B2EF001AAF48E67F1D8156FCCD061270CCD515C93376130CE247CC864016DC4F57D1E06F0FB40B3CFE5BA0F2DD4EE98312D24DC5A8DCFD91134ECE91737B90654FE54215C8FF7EF2608EA8920122A97B985285EE2A5E7D714E2DCC6D965C2CFAE47D8FD24EE2595EFD45A2FE3BB9C8B913A109EF040EEF179BCF6362478260E860E62270CE92EAAFA4DA6924CE3B3C99F1EC6795EC8BA60EEDCA670A41AFE721D5D0A523F0FC37C22C87222E8EB5E0D967A7DF213DB72A1942F213773115FEC10C09FB8AA1D7B1737F4CCE2FBF28ECFB3334725998BEA6E00CDB5E077DB42B4AE858E2BA8B2C09FC66B876234A6F27EEB717D9F051FF65320B717B171368C2772635D1869AA3CD152E1D5929E5ED1DC9A20930DF1F25AA2C5B48A33411E5331EA442E2B82D09C0B538E6882EBA787347D0FAF83FC3EAEFDB7E284366DAD978238A802BF8FF0FF55ACFD551339DC402F6B5021867C2846662F8CEB37F133D74757D01FCFE5553CCEE3F307C2496BB1FAD0905A1EDF712468F27D18E6C370C267C6C796F789B0E8F58826E845756396B2302FC238BD06F07B5CACB7F1452F6F13122E30541D53A63C44CD9B2EE82D79AC01EA6A5D3711C67405396DC7F39A8914E4AD365195B7FC842B15F6DB588C9BA8E7599114F5CE07852957A3B8270C5B468274E7855729F508A82B984341999BC66776C4884E647333AD42439B8E11F74C91E88A33243FC4BF57A357DC706D3335640755AACE7F84937829D77D550C8F92DA24DECF25F260D5C78A84C685DCABE992E7AB9CA62AC58FC4507D17EBE3A9202CE6419EA04AE62627FA213E9B42CE63793C40A53477C599920B23107917FBFACF78EDBEACF7C97D1AAC54AFA3554307482C4A965F301CFC1037F4F28EBCA29F9BE6F8F48C67989A9A933779B91B1C5D219A078910264B6C0C6EF09EBC0743EE612CF667B82A202627B6877AB2A5A346353CAA405225FC180EE4B7586C47E158260DF7224B28479921C78118E087F1D891B5A106BB10B2FF5C42876E6C4088E157927B28DF7714DFE3205E7B6CDF39BB2662D47BB2151BF6455CF39F0261ED251C516186B81403B025FCD7A6ACC78E71BBF9129CA192E2ABC2533D12D18B7401C3563536457CD68618ABCD3038799CE75EFC2D8D15C148D7288609EAF97C6FC4380E0CD9CF8082FB30588A2614B2774CFECC6561BD8F8BC344C5CB391BE4B64ADDAA10D5CCF7EA08E2531567342F445C3234D48D5888175C36841CA09E93D6178EF06178CB97E14109F3FB8666950855C37C29CE816AE0612CB25F22443F34839532549A7FD435E58F9B888203858087C2DF75ED5CC7A827CC321C2137B361A1F5B628A045ACA3FD40ED7DDC3E35A3234E620755AACE7771ED9FC679F412483333DEB02BD76BC5D06129DF7D8A05E5590964B5160F0A304455DF4BC8FA50CEB52B06522B2288F28FE2FFB724A4DC413D87AF63D749C5929170A1DC6753594B53B9E7F74ABA778D10CD240CEC0872B98CCD7026EAC4F80E9195DE502E902D5405D80FC5339328FC28A4E38990BED39B8A8A760EFABB32C1156586A6FA469697A8A4F4C7B1089FC477D940BDCC45C3905331C2E76698CFE41E10C6BF8DC747214BF59E6486F856C43B0F64030CE4BA3334796AC4744742B95C167537BEE7B3304E7D31500F8423D5129F52F898816C9C91D10C3709059943F7AD18ABC7164514B219216BBE63866C608E9C84F54842AA33A345CA396B9B39788FE21ABF0C43F583F0566A6C32A32110EFF108555EE45E3C6F1B6FD51723E948B227E7364C28D1230106638F62EE0361157211BBA294785782D294205D50934F24430F85A47E291BA11717EF28D0051FD93264FC02A4A586696A1B3E9B63E0D401F4514F476088B52352FA86856185A83FCC5E3F889F8F64439C893AC5D7526A674AC5C8364E665CC986A09E4D098D0662C43624947A1AE73EC06CB708DE2FA2AA3CBE5F26866F5B9EC9912A07741EBFE33D65BA8C23A065CA62344D6737D6CCB7F13D9E3410EC9A8EA1E0A16F868BD790D78622D45120C453415C5983C1EA8B6AF9440C152982E782AA56057DBB3ACE6B4EC3D28DCFE55ADBB46B8C86675FBB1BE23C47A21A1E0BF5F21792BCAF5A421841DBB18D5A9A279A186774D729059AB8F9206E2AEB1A1FA16A5BF2DE884727416F6248793D260B54B9A6F32E319B2CBA2A0AE1B685564884DC243E7F43D576F84410D785380DFDF7A5A192C250876E64E6DC310F695D0C968A08BB12BA0E0C816B0AC84E7CDEB6842CCC25DA90F0A76F1EBF13BFBF0C84B829AF53A16599FBA846996111F3DC9EA0DE65429DC4A52188CC427C0DC7D4013D8E7BB3173F1FC5FDEB2450A1B76E7A1848EA4700FF16CFCF0579AF98F05524D65529A8960E9669283DA333345DA44884BF7CBFBE18AD0B31C68782FAFF42EFF715126219491CE9DE4F77D93E24C36C1FF1074254FF33160613357705F6F68C7BCA1386078B521F122161B9C06865897FE7E6997BC2D90C854FD005391515F60F00FF1D06EB95C8CB1798EDF4AA1CD734A198762CADE2416C0C723AE439D6C4E8AF0807B466846F27B17ED62544C965E17BE2A2B7CAF16BAD21754AE058C6D9791AC30B31CCEBA8E7B76982E8513C2EE37D3604A96C089A51FE8939758FE2FD5FC5EF2F12DC9B86823B716E3F84B16207573D47770CB985BDA9F72D8533F5116C85008D326144D539E8DE23B7B62F8E9348EBB373582AC702B3FD8B3CF358FFAF40BAF3E55DA55B68A2258953CACA595C3495C8B5973809E0124BF4A84A848665E21AA42035904E5E55F4A0F596CA15E9DF68E70522AC57B86A3B4C25F64248EDA92D442D8781DD2F4D5DA152F92236C94FB171889EFAC6677ACE54D610E2B8E1D216DBCA9D2181DA55A19A57EAB5481D54C7B0298201CB9DB60421FA671F04A26508DE1591E499EC915573446BF23A0DAD7B0983CB7B4092FD25AA9ADDEF50CFDFEB1830E0FAD06BAEA28027E77A42EE24C14569DA89A25F7D5F3643E0DE7B2BA24E1740711F2161693C4A13E2C96C3377B1A0D7D12D7B0565A6D07855FD8AA95D6AA8147DE43720E1335B041D2CEE4251DAB599DAB5E99A772F138691CAE731AAECEA4354796E6E7C177519F599826B4644FF108B7160DF3395F6D0243678C9903B1E453FB919E9B1A04AA6C9D068F8F75DB498D420309465770DCF9BCA852FA4B1FA9F40B6C7F17E3B61D80B596F7DCCF62FD3C4DAF506E3AE4200AB4988729F8902EBC6662AC89BC868680E51814629BFD39A48B61F7A1F0E51D5DC5D01019A71CFF3A5417E2448FCAF3CAEFBEC38DA9468581A11D913EFDB94817E5B035A8867180B5743A27FC5E4780A0297A2A67933BB85247C4378A1327E3687F3CA84BB282C3C2C2D3C2DCD10A490EB54BE13BF3770B3E4D8549AC803543945DEC6C40DCE32A158668ECF47C2E5C681B2509C797D3F07A2DC8FCDA56521D7B95FFC6E8F843258332E87AD798EE3B37F8D10FC575439600FE29A13396EA19E9BE4435A562D6C56355143557644A112C89CA79EA9F35351E45945A2BC54AF814FD47544047988AB5CBDD761B44E25ECFD263EAB6BE85F05861D5429290C8FCF0164F7C16169D8E4D5F5650317B26290BF9117BA26CAD2CFE366D5D2885DB3F09A37F440FE46077A8EC5505C471EEF0927D045736D5E61D7B1B0DF299AC8319B85AE06AB6F0BDF4B586ED33D14869E52280F09D9BB9C738F53BD945C7DCEC5F030343917DE8802C3AFB8CAC37A1DF7FB3A95135D1315D87B7E17F59C22DDC84457AF7195C3C6CF3F8BD7B1A8FC31EAC5FD5351EE14610E2C22C86CE3BB72A9C6AA63CE9AD7898A2915BA6D413E68E0B474DD4DC338B1FDD02FF17D8F5195945D0A713FB46BD531016613F5DE779FD560A9812A4C592AEC62A83AB22A8F65C3A5EB1A2C9ECF79DCB4B7A8327087664460CA8BB70251E5CCB99E26FE4C89CC81DDC414D7A5E7EC1BB4B48D7A69E14E6172B7E62D798ED4F406464BEFF358A47896F30C84DB7115701E7AF64E9C8585AAB911BD4CC3601AC021AA227ADEDF77F13B96182D2A82D61CA93521B489AC981AA0DD51993FC53E625A62F61ED5A41F76E3F0BC362478DD8E194E98936768A533121ECBF9751A50D17E9CDBB1ACF56D43B059622D964291D029FC1C61EFEBB8BE03546D89580DB0632AAA8A351B763D33009DFB4A6BD002D6A6B0A52F0B431BCB0D6271DD15F9AE179B99DC5C585BA897B1AC258CD69E283F6766B816B601B1F069458C467701C2D0DA3E6DE0A7619DE6508D05A93A61BC2B8F63D433D7F31B3A80B13980DFE27B5D8A1A38C06C2954B74168288C1FD47E4C1ACE5F8898702CA8E1BDF17454A04EB0B872C2CB8BFA2228ECCAF386F14EA58483143798C37728486A15F52A03772E3E05DD530D9CDBA36A492180796DEB09E59509D16F05F59DA24AB89DCEE1A07D0FF17BF23BBE0E03389208622B10DF9118D1428CBCF2596BB24E06002E3E37C22A65614D50CFEDC905D66BE8B5258F75411F9D797CC3354243452B17A8A60A6F8AD43CC46C5F269EDFB6F023DC283A2063517787AE79159DC7D859701D2FC450F9FF3104FA20E733443D51B7877AFB99F7C2C73917877962475CF732A1881D05B94C61E03DAA44C535D4134B87A8D719A60CE039EAC9AA23110F2E85F03D92C747F959675B6A2E54B14048E89A92FC3036DC5309B7B4F6311774C51649FBB1B63E88B0C18D3FC06C4B9C4E83C8519A416334520A6FA555033A814A1371B9E619AAFE6FDCAB52C2D43261A8CAC49ACC25F4E638BE43494BE8DBFD381747B162744717B3C3943BF71112E6A698687F9F89A9473D8B6719D3321B778ABB4B2255858332336367A28155E3D254B57920B09F8B919B6A5EBF75DD045AFBE672768AC79A8AC13F1327D011A4712C46EB31AA6CF78EF1052CD7F82892BF1AACB9B965464AEBB564A841547D26EA0F4351F23FB0059A5948A5D9F88746948FE55A9CC8F7F868C87724E8718CE56A075D40D81645EF85845C9A29DE33E4A761E9C7F837AF29D19A76241D1A29EE8FC2CE5B0979E632318DE185A8825ADB371121801105138711DF274F708A8EB00A8B5268B04EE53ED060ADC9BA5067EB294B4AF4F725ECFDECA4BBF633526B7C26A4634F20EE40BC19173A43C309E6D47D5D1369A917A7C77A8B7AD5BFF6EB5A372448A3F55C16E6D18270A3837AA1EEA6A8682B684EB02D8DA319891236156F7D817A475096890C12E91AECAF75268B29170EEBDCBCEDB2AAEB48D0C68584876C21F3380C652608D3095E728BFBB2A9989FE30DFC2E85BB3BB77F4F2CCC5DA6977886D95AC1C79222F0A3A098CD045248A1DD13D9A82C19DA419583B58B7A9F32CF55F46E9D9984826C27F45DA490FC10E7BA2321B7766B3D1774F56B5CD7B378BF11EA39936840587A5E44B85A5A333563AB7DEB1D259626D4745D91BC8F903037358E10F102B37925DA0DF17178E203D43B36CC55B3AED10AB934F4D737597E5D3834EF2E3110A4F214F556CE67624826C6210D8D1C65A83458E23C47B661D54331443D4655A4ACA5223D1336D8C04D531ABC540866C496B996EE0C48BE6F49A8B0129FED84776908653F88DCFFC2550ED57B395FED2EA14DF9B4D7FDB2462A65B094B37A1186EA1F61189E869119DADAD573A2F040C30954F94D8A88D895F461E2FD1CC95C8AD8C275CAF7F9775C55697C83AA2FD5C0101A5B05EDA36A8C7918EBE601EA5D5A3B0915B74C70583A02EEDCEE6926F7D3A992D41ED62CF8BFEED7E74658B920814BE31A4E5025DC794FF29DD870EF50E5CDB06F9172454DF27A53867C6AF172819FA03EC0614D9421CD24EF0A5221A14845EC5854A05379EF15793DB3909F4B683198A3842A9FA3A14E21105E0950B683D993C5ABE5113D09019EA29EF44A74B11F3FF3BB2C92FF35BD420DD648166C266187F345AAFE8D84577C159BEB774158533102B9A9CF3731526EACB4B1E2A3B857FF0FF5AC7D57924B431DEA5C57C3201161311CFF41DEF321EA3958A5A5699C4848C5F7DC89BFFDF730A6DFA29E71DF35F5F6CC545386AB6C7FADF73F3542CD1542759223D9E7D3048F9BAA9428902EB856C399DD57A6BB12B2949B5979EEA53B0C59F6846719CBFBF5258D0046DC97F6E50BDBF885FDAC178E0BE3BD11C31B989D36ACAAE14E9C273D4D2E487124211BBB34B2791A17D806E68F5CCF2D5D609C5096A602CFF751358253A56813F571F40C4D7253A77A62604F24645C548C5E26D20E725184C6722DBC9B42D75441DE07A623EC63361BBF40BA6BC66D72C97CA0C46EDCA76F517510ED63B6122375DF58B03D4135C66E3D9CC47309DFF6840FF36BC1C4D70F42A59462F85E0AFAE3FBF4ECBC34CD42AF2933FE57E41E0DE4FB650B54F673090595972E120022C587750DD17713E8EB5E4A735441E2423C881BF0C8A030512065DA170635572487E6527E9FCA7E06664B4CBC8857BD3351CA11AADC28ED04B982D9CEA003E1398E45CE1D8A57CC64B1EE1ADFF010B3AD9153FCD008F5F6BE3CFFCCE4EAF3B8AE6F45B8D06268E5487C1C7C4FF8392AA687222A68EAC6BCCEAB45E23B74E5BA309B79CD108A862E4782168F045936F582BACB5A539DA3B985FAA0862166CBC5B2C446E4D4A269FC7D29DF9D45D39CAAC3B5D5371A8504398753307C8384ABDF8810B0817A5B1B75CC0CB375A8C411AAEC761DF5D5B5149B328182A7222C1C259C899F8396406589FDEAA56AF79A87A5BD809418DEC76C1D164F949097684291D79149A405EA99CF1966DBB6E8640E2DC119A1DE79722C6A93CAD924C7C9076908C72CF86F5115AC3E12B255111689FA97E21157307FC0030DD1B1C8F379835320577820E28112BA99715A740E3ADD8809B20F51E511A9E1A06032C6FCEE975ECC3EB4731A1A693DC56CE5C1A9A8811A6EDC494E1E051AE13D3D2C5C152EB397089152088D4DEF0A59C3DAF64507B1682B644FC83C15BEE955DC538684035433271F4A04E035B9108EF334DE430D8C0EF2E819EA4D7DBFC21CE8474B597083952AE9F1669CEA80BAEEF4EEAB965089F70F71235E8B12C885511A242F64C393283E16A4E173CDCA4438981B1F702C64B026594E841F398D9BF71E5789709C0EB229884809F84DF9DCCDE0A62E246CD5810B6C07BC2D1E3B6BD8E41393EE4F0D7A3B57A3C99BABC2C131C4EB1A01DF35425843A18761AC76C370BD93057F22616ADEA0DE66660889DC988FA5ED60724315472260A486C696B735520BC2DA32810CF204E2F03A4FED96A0C9A11094BB262171DF105B8E7A1FFD5FC360BD41D54BBF2F8F21D26D799C1FCCC5499F8A8805E36D5712212512D10AEF13D7E499452BBE9E915004552544C2D0DE5B48A8A4DB85788E37A8F7F21EC805E4E6D934297E4F366D2AAFC6F9AC522EE44836F38110FA2CD568525436519563F800521D31452FB589FADC3CFE1F1704376EBF619139321D3548E465C366E3A23C44954BB662287607B3FDA354CE67EA0527AC701EE26BB96647F17A0DCF5365575D398F543D5961C201799163318C9FCA403519AB29EA59F49722FA34F1335A6642A40A5903DEDFBE8BD9E6771C56FB0E57499DFF8BABFABC7DA11CD65135305C54DAA4A3D234BD6822EFA15517AB0DEB52A315DE270EF53D41BD12C15168AA4D94828AAC214CC47D91EE48280B542B7644C9A27757CFBF2228861CD04836AD7BDD14B791D9CD6205FD2FA8F7B2D6F0712246EBBDA1C10DCCB686D50AF4F5842202F91E5DD41366E771055AA07A208BB629D52097C5F011F584D19E71650C71BDED475FC261861D4C31D90BC449C3B52F86E512B3CDDBBC0BE62A6607B16A7AC9A5284FA7722F92DFF796ED859A0C9626E99EC9C6D464E7799D35BA62A4535D3C3DA35D3FEF08D584A2FF46D592E65D5C634F394945167A2E7902C52A7AD4626AA2DEDE1CC2DC2B448E2D649FD735D76FD63441DF74BE949010825CCEE4C63079521B93F54CB1D12E953E00D355C04E835C0A3198C712F7FB482F7D7F9D7ECB1618DBA2E8A891829C7B9E3054BE683B0D103895CAC0128F0F0DE47393C8C13487AE19233F272D7DD2F6224483EBE2581E0BBFF526AEC71FF1BE3A19585B27776C53B8709125688333CC1695979FC9B1F2DA91A466C9C9B120FEDE82D488CC5044D7D6A8AEC9A9882544563FA36A47C3D16A2354C351C6A8B7366A52F53A89B49302F5D1669921EC79A82D976BF35138C63166EB68538D29CBC47D4F750AE97C568325B5664D210BCB2EFE941041474169D6AF2A580353C7340C049ADB96E82CB71D5154783E3E367B22FC188B5837511FF6C9E92103310485FD9C3518AFA60102BA30E87195F83EC1722D510AE1287400484716EC5854AC354360DD84A1198AD1DE15856B2DEE632F361D2485413BA2AE25909E860C9AD13D126EB1BC65A8775DA7EA1D0DDE85517E8CFA38ACD47D4BDDDFCC14B2C278A57371E0BF4A18C84C7496BD306154E71D5C1A9FD99DA3346BDA88B7A6E91A2A460307A574C9B120FE02E96CF8D210535367E12C61F4EF1D61412E580FF5D623ABB6A176500DC9F4E66F29E8D86920DC817A5FAD12B31D4419721121E82250EFF71AF5AE033C974D83F9C51C6ECA5B74A4A471EDBFFE2E3E9752B4D6A42D3258440B67A837FED3CEA997C62376313B01BB2F4699A86B5B542EED5FE4F9515ACA3440BD61A12B446EB03C637DE1718D2A8745466B2CC4F29FA82A1376508D81EBCF099BBCF75B617B40F93A3618FC2390D56FB84A94DD477D682D43B8D208EE724E885A26D6840B0813D943DE6B2D4BF0D097E65026984D71F16133FEBE4542C9F48120F796D690BA88A3842757CFFF3C7EDEC06C05B71B85AC414E4FC1CFAE48FB0F6333B3BFF96B534994A83C89D72942E00DDC43BDAEAC632A8BDF9494BAA46883C6EA303CEC6BD4B3FDC758AE085CA71A9FA03ED144C78753C47820D77B3511BA2AFFB626E1E250D0AAA63A8C8DD45D1583950A8B95C75222FFAEA7266101B7529A1246F4F33A04880786AA1DC5A8DAACF7602ABFD790936206D317DE8A1A3B3283C0EB5A98219B9756E2E7974AB8F5B2A6C2C08D86949A62738674B95C6688B5630204123489D22A7F85A69FCD60358485EA6D4666557523B125C803F1E203CC4E932E9650493A0914A32540CCB3DA4A10D39AA5EF651813211F756AF1200171D530791FF90CB3BD944E055DBD157435BA269F53C802876C1C9D07C7FA4ED6B4EDA0EA56313012B68B7A7A045193E68169170995FB07A84F354E91B99709AFDDB9234395EA33E5428DB7CBE11CC3435147B5A8BC63C281A20F4DF255AAE142AEFD01AA4CFEFDB8E71431CE319BA05B5A74E1B321FD3B17A642E60DDF9762D808B3FDEABCABEDB9F0579748B723F2012697A877C275AEAA6BCEEDAF963B5F02C2722FAFE1C058D407CE046481F010E94264582CACE8A58FD916C4BA89A88669226386F410CCF3846139469500BB296843CB3774A3F33134E3E7BC062BEAD9A9F2C848D6EB225A6D9D3C958D43154C3B3C3C127E6AD3A46E4D39D156BD9AE3C6FCA91CF5E10AAB989DECAC218AF6CCBFC4EC48B1DB1AAA8E3D9A5AB72802198948F41EB39D46B2840AFE51AEE7474B2518096267D225EB503F8A1AD934ED5C0D63CA387517AC81DC8C5C6E889624FA14B369175321DB3F0ABA6A0AD933BBB7D304622E4DF0E9A33E46ACF3A5182C18BC2D44353911A29B7DB3774486D7B08230D2E3EEBE192426C6151696294A489525C00C89DE6866EDBF15A3BA2E5C8F12CE2CCB603FA895047A209A3B166590DC956EE2E2860E629258A8E772BDF783A7D116BB7AED578C7FEA0987B727E77D20E1EB04F5F1F403D46B32B30683E5B592E52D8C950ECEED5B48AF2D96A7C6ED9409C595C8629A1078B4B50CFB4DB12DB28E9C1F5B14E1EDB6F339863A13012995F3D4B4CF4A530733F979221404EFDDB6EDB1DCC4B28FA8573CCCFBCC4BD43BC4D268F64D291CA0DE65B8F7D90D56A2F42165089C37B890F8FE75846BDACC4FF378523C1637C726AA3ABF1DD928AED6F84D2F136A89C6FAA7986D86B625177B15F536C0AC1F7B8AAAF793233E5E0B7AB03742BC6A0BE3F2062178EA7A17B2D82E50D5ED31A197868BC5B98F51A59F682989B6AB79827AADDA31EA3960BDC4F77684726961ECBC907F5963A5ED77F9DCB7B05E7BE14F0C7569C2F389844E5E34AEFC2A851AE6AC9D1A493D11C3AC6547C51C4ECAC96960B90EB19E668284933C11077920EA7726AAEF47591F5C97E3059FA9F4C908F5799E30155B6B1A075F5A48E8CA210441A831600ED49A2C38858C3DD46B90B45486DD1ED879A168304E05E64F6E71125BA1F5799CD3A12135F2359CB0D28DF3E1E6F1C4539FB4A20313CE51EFD4785B54ABE8408DAF863EACF53CC055712DF99847618081FA80D321AACC782697528EEFC935E9D982CE64932A29EDFCCCC2748686D15C0C45994BA648BD142E8F2923AE9C796DDF89A8C963E3E33243713A0392D5149A929063B625CE227EB26C3040CB4C20E27771C2DDDB12FD86AA548B256727A8125A5FC9F799278CF838B14B335885094E5ABFF957CFFF2FD16001B3C9A0DA1CEC0855E22837C98AA53328C1BB857AF1E9A579DDD2368DF2679339EA917BA5425203143D686D5689AA0C871B67CD10E214F5EAF7B7124A9CA0DE6BE8AE24FD2201DB47A200B1F5F389A08329EAB9593E759922C60391FFC7F2FF5E37963590B45334776558165D2927C2CE061AEE6EC46B892C8671CD73CC4E79F23A548686DA744F8963965E5141CD64B39E3584BACB3A2217845C15EF2C504133BBAE5321D2F77195FBC5EA87D3704288EFFB0780FF0CA3756088B1E9330B319263E3515DF0E8A2DE73EEF387844B86866E910B216C19B26837C20CB3137F69BC56C580ECA2CA5DD10DA67C0337A913BDF33A1040F836EDAAA808AF104FBB694AE48A712805EAC330FE4495287A2AE1C74D791C24C48894EC3D1522D533960796C6A0E4B916A8AF0B97B76A290C1D43C3A9025B95C86FD391413D36DB08FF80AAC5F14EBCEE03AA4CFDDC507E6EEA9817668F848BE918DA6455C06BE150CF509FD1791363ECDD0F4ACCEFC98504CF06CC764F6092F2EFF1FB0B54ADAD11EB90A9177FA21A57365DE01473030497A80F5101EAD5101AA17CF616C9370D597C16DF4416F908F53408F52884E1CC0962E8B5867A5332CD8971F27351933A24BC5B29446857887D8649ACC5D322EF2C2115931F60A2E847D4C76F2D63889C934B25DBA6DE07982DCF980AFA9A180AF5B979EA1D571AC4916E42264F759C9CE21ABDAEE64C6966EB9CED4055DF03F8375CF52353833514634D95B38FFA9C4995F3A9161E8B032AC559116972C2CE3B41AB1D7172B885032A1B50EAA2B5EA19E69AF7A70EFD340CD39A1830D20587E2E4E7954DB92352953B35E64F8BC3FF6A75F3A51B2C24BC4186E6E6F84A446ADF25F2565B0D52BA2EC2632345F36B12BD0EB9753A307B6E3F4195DFE49396550AFF0355E2E0299A7BADBB4C8F44B8A50A5907F3FB1CE96B696CD7859752D1A3676185AAB55D435039665BA8948910DDF38C522AD84DD015E7033C0901E14520AC4D592B1354757C6FE3FEB13A6022F7E842EED35B5CE5ADEDC8E76859D9968810FBA2AC9D0BC2CA1B36F722E3931B393F4F9CF07CA8C2786375B66702104E506FD9AC2DBA392E2D5FC0ABAA63CA512F074BA1CCCC88F7FBCF745F32349CE721E6C5F6CC75629701AA8B1B866A94233B11AFEA7DA6AEDB0FBC2FDCD583D818DFC6F313D4E7C44116028976ED82A0CAE03CC3A259C15DE353F8592AE57B667D867A81EE9A109F0C61C9FB3C15A3BB82D9B6D45E46938B412D125EDEFB21A5C65BDD148564C6ABEDA2EAB6A1887B0D55BA0979A715CCD63A4E8540677DE13B54136F52036B77C2A869C7504D5D483998B2E15A387A54679727102F0C75EBB4F0D4C4ED1CB3691CEAE473533897A9672D8D93D4612145E23B7932F217AB12DEF6E085D554064AF13BA88F125788CA3C2AF676BAC0825162730E95CF1F8842F912F51AB4BE19CD0BF1EE6F8CBB72695FFB8D33F45A31D57115F516319AB8E933DF9C3FC864336FA0EAA4B12B1CDCB68906AE727A21B937C1EB18C781C4A66D0A7996151A32D4FB3BD1206D09122A13619CB657E92490DF85288AEC8BAE1D73B5EBC5AA883FCFC3113191F44C38542D4FCB30DB3CD09D6769C2CFB4C17838ADA2656FA9411DDA3D826292978CA51ECB800D2DB9BA3023EB94460FF5F984DD2FC260A9347DCB82556D41C39CAB6F50F5CCDE9285E4CA882A3E27A88F64BACEF9AAB1DA1263C5114E8FC45879221EF3B8FE8C70701FD5D00D9D66A3BCCC9A20832D3122BAE90662A834C3BE6BA1A13682EB0977C09070534874BE771FB339643AE8E05010E2A5BD3E25DFFB98F6CE32DCD58270B06BC64A91764FB8460D993B09A4A3C6A183AAB3821AAC1DD45B2341EE930E5321F7758EAA081F868081FACCC94922849A483470817AE75D37565A007F89D9963429E5B84870A43741BFA54512E7124E5E269061C7EEC71753FCDC680C96F4A0308BCC8549CE88832E7751659E6BA29D4E6C26543F492C8E65CF85288663A19E4528F89D8482A9328E5309057F8F0DF001B3E3E83D01725D429C27A87AC393631AA0DE19418B8EFBC6776979907AB715D4932C57303BB3CEE74E6AFFA82354ED8DDDA3BB04DFB1D0E436AD9095471A0A4A643BEA01666B3BCB04D70334772A5094C56A006D39A4468B5C264B9EDEC85A2B24FC5E3383E5D9EF3044C4893A274267E4984D7BA0733E952862BC80235BA6F3C3B2548E66B86BBF7E26DFF6313BA5A7D696E7C606EB8E5A775CCB602D61AC06B2289E85B1FA267E7E60243704EEB2F48706CB89C4EB6C90AE20BC4742EE3E499C832688B265CDEFB84AC67B27486FDA60B09444FE210C2327FD6E08AA1A88E23230AE0B09EFD9B110510B5181D9316499851947B119D9F5E248440C57858074378B1472AE85854B2073AD11DD142E7333217868C2AAAAA04D757CA97BC709E50F519F5AC3B09C4898D3A3F7056115A224ABDA4845EE43AC4DED84AB82110D2709FD4D0BEFB577159DC8A264CF9B1AA779EF3315229FE7FB41F6465FCE97E8F1AFD0F15321AC94B45E7E22C3A8C5C4BCE11C25FE03AA89344AB617C25DF1C2698BDF53CC99703C872BA1B1DA3063C5907488D951565C442CBF21BA7254E204F5C008FD1F7025D3BF407D545417E90EA2AEAAAA37ED60364DA49B20700BDBEC94FADFA2EA94C982ED13D467CF7512E107E6209AEBAE23E53E3875694F54CE6182486658459538D5CE45D15F867ACFFC37829EB6519F4EC4F5A15CE0D3B8C7742034668F620DE5A8A677FF618E211704A623C0FE88BF5F13B4CF54040E51F9135527084D4DF9240044F68BD2057ACD94AEE1EBD81BEC48D4C871EF1318AAEC9A4AC76D909BAA094354B92E2F709567C3306CCB164F2E61188DD5DB783E31F5A2BCC6B9F4512F4B2177B5675E5D1518B63DE654E3D7721E1789905411D650C8DC9761B49ECA624DD5E9A5CA373AC657A472B8BC6385CF75D41988BFA3DE839C086B88E6DEE7A97533AF6DEE2264A50EE421AAFC37769E1818D2D5811D3AAE6ADE3AD0A1B647A8FA593D4970A6902880A8F843181BA2B1BD706ECF62BD14F19EBFA14AAB18A1DE724743D357A8BA8414B1D139B6ED34CEEDFFC77D798BFA1093CF71F8F8362253DE0F9DDBF81E579D5659FA730660DAFB0486CAF37C80D9B6ACF92D2F9257DD6F8A07FD1E57936FBF0F8341EECA73AF464298D2509020D6D1EFD75127D7C480903FDB433AE7CA8DD56FA8F2AEE8559A06947A58C81EF3E4677AA827717AAB9DA65EDB4820E31439AE49A3DAE1E1AD7070BFA29A9F778ED95AB92663955A5729E5709173D321B024BBF72C5C73E37B2E42C147D413229BD66B8EFA5060A6383C953047CB9174ECFDF3F87BE6393D8DB0FE8919ACBE18C52354BDF9595DC190705F42AAD3B81F6AB05EC57DF925FEEF5438ACF296B4CC758C96CE4564D43389EBBE15AFF918EBE8E7B89EA7002E7B7768AC34BB5927C7AAB232C66C257A81F965173EC70C66AC86426472E4F73F508D12D7115A8511ED54E47EB3306C724D834A629A4AD03354137809EF3573D8B99E3FE21CFE44959F33C6E2129CB221052065780A4313256693318B06654CEF1539857341236C45F25A8C16FB8F1F8BAAA61D273DC3BA69CA516A70C1B27CE650D4E254A8D615A4CB44504DEC3C9B27BCA0DE574A271AB1F6730F55BE9D2BC8DBB13E18AEADC6393E0B27BB26EAE1899DBB2AADA42EA8587664C3FF26A8F64CC4817D41BDCBE450DD5984887A7B269E2F4503B61D2F510D7CD1C8E7D6062BD5B683CDEF74DE9C2E74EDD14D25AE239C80B774291B3CF1AADC782A71DF03F8299E9F086FA53777628A1C8DD501EA833A9735583A25772716DB9EA0AB6D518C9C3B3B1083C5DC1C0D05F339375E5B9D9C0831BB920809BDC05B09DBA241112A506F0D3D967B782CDEFE3DEA1D380FE3995CE0A5286039D2AD7633BB9E29433C2FD7273391604554411AAB27A8123BFB09E185F783C5E687E6BC16659BB3609CDF9FFDC41EA2EABDA6EDA5B75065FE8F51CDDADC46BDBE948657274E7BFFF85CD6542EE7B121E4BD8E4C3B9370778ABB6D3BBD6C5808547DB7A6820853E7FB57B7D6BB40589E77A4C9859BA86AFA28619EA09EE73431221C26B16BBF2AEDCEC0BC2042EB6F035DBD10695FE561ED3145F2F1E7809DAF97E42CE611FEFCEE24DAD96278281E5143417627E59081B7A827AC16733C94A30292AD6BB1F8B78DA35194ABBDAFBC2B86B678518257FB44315F8DC68A73FA7CF2AF0E8FD5716B5A7B58CBB11114DDC56C16BF7735F56E0F1D53E388BA9FC6BD6017D8541EDE08F5329B4331B6D325D6822A86AC543888EBA362CB4004935CEED35438C93531EA3EB8C2270BA9D1D7BA3C1A80BEA54768DBE931EEA645D14D91562E8E9920425B0E69FA034BD26EA512EA22615CFE4014BAE7822EA6C20D309BFC1CF5F6AFEED93359D485C0E31541720F8D68FF06558F26BFF1B9C0660E4EFD3D363AB9ABEBF499CAE47C3604E9BD1474B5857A19901AAC7D516CDEA26A877BB18447F7D153AF5015E85222F6E4D4D2E4FA912CDA496213786F75F68A3A433DC1F6543CB62EAE89857A030B53BD26B4B0CDA86519DA4A7A24EB45531DB4B7D8465CFF97B1165FA0CA8FD24D910B9FC270E9C0D230F2250D1637DEB1880F6F51CFBDD3B09CEBA28F7AF3C3BE396BDFB87943084D94A4FBA96BAA6F61862DC7FD1CDE7A9A08D5AB25727B947781B0BAA8274A7E07E03FE2F951FCDF58C216C6CF27A8A7E6EB17E9268C9716430E85686793384575DE484DCB5EFE4435EB4DC7278D17C063277F792EAC557C26AAA0E65C0D6441E9445F4EC079837A72E52283E913778FE37D8862DFA2CA76D7AEAA3A5F71641BC091566624B9F6F9E6508C0B415263E1E5BC27BA9F7796E0D69C93D3D08E690017F11A37585A203BB4FBF134E881E74680670902F8BD84B537E177F85E6C7CC8705FC9F79E29B40313487C36811AD453DB33458300E0EB479DBF97E0DCE7E1C35C9B8682D48CF35D20ACAE6CDC5D21BE7F8A7FF750EF84F054E2E84B532952F27D61A12721FF3AAA0E029BA83A916A16B622842354C329FF2B0CD66B914CC77314B9CC3C961ACE0782F0BE43D58D819C434720390D378771FE8EAAA66CB4A47AEAC8E7C4388CD762B407C24329D93FC1EC608794C1F28931537BF66A807903089A16AC17FD4EC558714D3D8DD76CC8796B19D600F5C2E587E1C49EA2AA23A5F8A2218987836CFDE259F9CB7233DAD8EF0DAA3E588A78B596B59CA3E24E51AFC238947D339D736E652262C11762A49A288EAC61ADCC28D877A512F6C51BB24C84030BB8618622BF8F30DB2F1B986DED5A26BC4F17F562D615091BBC705491D5AB30521CF9FD5A42D3F11CB93D95EDCDCDA4AD977F0C83F5544280D260AFB63C7E236A9292D3CB7A73C8F72B241C51CEAC2B7C8DB79ED69003A857EE7BCE9C87113E266AD97E614888092984C59484DD7004886B7A2A1C1817F6AA38B02DD4BB9CEEA04A125565507B93331C7C27AAE65F9CC90D0965E6A4BD91735993107DC522009F4F998B93655F34ED89B68C31FD628CD392F305963AEFBB22DD156D69A16D6A94D69A8521458354BF8837D341061DCC4E5DD1F0EB5584819ACCC8C4B9518322A7ED7E57E4DC5705D9EDA02AAEFE51B812E58FB47B27897696ACECA3DEAD32BFA677CACDA8304C5363A5A4AD4F22CE0D8175313B76A94C10C0D79D5E93AAD1D3E1A285392645EC655CEB63B94E85AC5F6D373D1447C2DFF5313B4F51A575DE937D547DE72F71B3AEAE4A2633437D53D43A22DE4D53029DC31B4944F07B4294B9E9B4A47FF9E32E0C96D7618D51AF04EF1BF2E9A19E8F5324E0606AC47C2711EB76CDC8698B6222ABD781ACFE13D5E86F96259C3728728AE4566513A8D77E60E1E07354097FDA5A440B4E190A72A2AF861F3785D3EAD9BBF15EF32A0D80E69C2720DD9D2009CF6FB8467CC4933B28559D991270218E6582D96A7E25E6F973CF0CB7D70C5261D569DA345873C9F6397DDCB44D0CF39EFE90F09C21EF1EAA5E5B3DE372A6220CFD1C4E966BF604B71BEFF6B73658EAD975DCF691406BE570D0206123A1163575992CE7FCAC0324B85868ACFE2710D66F42B25FCC41359AAEC0305739915D5459E52C765575D2A7F1AAF1641AC33B4157B791970B23553B0D88B5BC0EF4FE849C05D54DD6874D30DB0B49C781D1611426CE388FEA63C33A8975A4C64ACBA1FE44BD2C6B7A4BE3AC7DD1B5BA81B31F8F82DB5A17F550738F0E628DFC12EBF60FD427D324CFEF1367A8DF3A2CFC121056698B90D2F02B54923ECC7075B1B8327F59822E37056C84FA0C439621FC1A379D3C8026CDA542DC8E91EACF436DFA1E55F63AA1BE86224AF8EB399143FB0D558F7686384B79F36B72445FCC1128C4BB576A3E177BA1EB601045E379ACA3B20109EA308B2C81C4BDD3259DD9AB4030A4080E506F94582EB3091BB8994290EEA1091E145D1EA35273817A12F03E663B777C44BD6FFADFF2B82B84C590876903EBB2C8C6989D149C258C568A705723E64DC60A537AD80F889EF37751E298DEEFC32552C6527B80AF077AFA06C03FE3F14C3812A2006D04A7D7676CC6EA97F85927E0FC1D165F6994012B0D98A74483A5C5D19921245F13AE203B42F5293729E4FDBFF178837A1BEAE2960886E74B755C553F25E3B7853E988AC162AEE201AAFE6C3E01BB3558B70847C602B3FB42DE1216B3429EE53499A02DAFCC4F853519661B9669A53C6BDA587CFA3A1E340E3AC4618AF9E388946C67FB9627C153B13075C5F811DF5CDAF2E36D18AB9FC57892BBFA9C755C5FC2A135644C9C653500D7421FE97AC6A65A42CFE9D22107DA4F89C9AEDAC647EB374F516F257357465ACBAC4682A0D6C5B177519F09C8626AD66B5EFC0DD7CA2723DD0BB91999C5EB2C307E141B9F33D934B133459CA381F42D0CD571011C8B57DA17EFF401F5F6BCCB90959E18CA89CDDAFCAD8B74F37E5E0FCDC5A127FF0555D9C7520BF04BE6246E48BA4F2DECF91D5532278DFCBA91E6995109BA4E0ABBEE2AFA5CCAC63F9235F1461CDA3E665319AE65149690EC0BD42B0A2E509F689C2A8ABF1463EBB972680DD6ED17A3C7D55AE7F64E10D6066647B3D3387857810E66255F6DB64F23742A06EBA3F022F4540AF3AFCBEF644BFE9FCAF5EC0FAF795F3F0BB17BFA37E522342C3C1734CEFA42520A3BA87AC60F50AF276C2A8CD7A9DBA40752358FEF506FDBCC75B2D058DDD079E8F94D505748CF8D77D3EBE3796E0B8DE857E4DC3EB9C172525527A690007F832A794FA7C5F4845845FCBE40BAA91C50AF2B22C2E202A5EA74260B37BF81D7D47CA1B179E90FA84FA0E1233752F52D2A75F27F82F47F87AAFCE6EF2A4B6BBE98E6CD31DBFC35AA444B6FF1EC0D0921F7557B739D9AB1A2232317C487961BDD6494DB4DF85E8D103A68EECC7B93B1F5ADC1BA4168E8376524E88761E06AC26B16B6F9BD60B383D9A4471A4566056BC9C818B37548D759583EDD973CD4203E4B27AE9466A00F51B5ADF96F5C11FF3A50622147F2157BCB52F8C373D407701CC77563D84D83A5A19396B464A8E7753125400BB4C96D328D820E6E8CFA08FA5B5DF06BCED7CCCD106573D6617B7C4283E5486B8AFA6C3AE524B4B15FB701462B4FA108CBCB5D0ACC3604BC4DBCEFE88A06A81FDFE77D6C2A4DD5B814E376201CC99FC2939CE11A92F9577ED021A8CA7B822A3D84487C208E41672866B60694D3BC1004A5687B62883B6F320C377518D7FCBB5BCD3A680DD6DDC3DF0CF5D4039D31E7F3E63CA5416FA437F7F33AB422F1F35D702D0C318E50C9CE27B852B5B4299F371BA32A7928E148ABF2A4AFB13634D40EA6746E03E1B906F2B77DF93B2DF521E2D6BEE73AB4C147B3B7476BB0921EC48731620E1C76C3E531BEBFF78D0D40C3982855B446622429C76F89F7D7515DCAA5692B90A5F367FE2EC4A9DD43ED3A7B89D9921A156752032A4A335C8EBA4B5CBFF6B13DBED023FB9B6D929A815A6282B3D6B531C5410791EA869958083C41BDCC63A9CCE9AFF13A2FF33243DE6E9C9436E8627608ABE7E8DD09E2FEBBEE8DD660FD6B6E2CDD343A0559BDBF87A613A47B4CFD6D91D50D07EE2E42E39F0471B706AB35585FC3C652C3E51D21BD49DABC0930EDC6688FF6B8E5D16B2FC1525C8BF7204F9513B9B76F8FF6688F1661B5477BB4C7DFF5E8B497A03DDAA33D5A83D51EEDD11EEDD11AACF6688FF6680D567BB4477BB4476BB0DAA33DDAA33DEEE6F8BF010079C94013DD58CC8D0000000049454E44AE426082, 2);

-- ----------------------------
-- Table structure for sa_kvsequence
-- ----------------------------
DROP TABLE IF EXISTS `sa_kvsequence`;
CREATE TABLE `sa_kvsequence`  (
  `k` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `v` int(11) NOT NULL,
  PRIMARY KEY (`k`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自动单号索引' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_kvsequence
-- ----------------------------

-- ----------------------------
-- Table structure for sa_log
-- ----------------------------
DROP TABLE IF EXISTS `sa_log`;
CREATE TABLE `sa_log`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `stypename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型名称',
  `sdescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '描述',
  `sprocess` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'Process',
  `sprocessname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '模块名称',
  `sactivity` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '功能',
  `sactivityname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '功能名称',
  `saction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '动作',
  `sactionname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '动作名称',
  `sstatusname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态名称',
  `screatetime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `screatorfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '创建人全id',
  `screatorfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '创建人全名称',
  `screatorpersonid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人id',
  `screatorpersonname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `screatorposid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人岗位id',
  `screatorposname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人岗位',
  `screatordeptid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人部门id',
  `screatordeptname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人部门',
  `screatorognid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人机构id',
  `screatorognname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT ' 创建人机构',
  `sip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户端IP',
  `sdevicetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '终端类型',
  `soperatingsystem` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作系统',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_log
-- ----------------------------
INSERT INTO `sa_log` VALUES ('0BA37DA16343453582F8328DC2E71A06', '功能页面', '{\"language\":[\"zh_CN\"],\"tabId\":[\"7667776866354B469085E9BD7A1146C2\"]}', NULL, '系统管理', NULL, '菜单设置', '/system/sysMenu', '打开页面', NULL, '2024-11-23 21:11:26', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', 'PC', NULL, 0);
INSERT INTO `sa_log` VALUES ('72FAE5362617400286776AECEE12200A', '功能页面', '{\"language\":[\"zh_CN\"],\"process\":[\"/doc/docSettingProcess\"],\"activity\":[\"/doc/docSettingProcess\"],\"tabId\":[\"383DFCD37CF142F8A22EE5BC517A3A1D\"]}', '/doc/docSettingProcess', '文档管理', '/doc/docSettingProcess', '文档配置', '/docManage/docSetting', '打开页面', NULL, '2024-11-23 21:09:55', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', 'PC', NULL, 0);
INSERT INTO `sa_log` VALUES ('A3A5FF505C8F47F5A3A72DA5464F07AA', '功能页面', '{\"language\":[\"zh_CN\"],\"process\":[\"/doc/docCenter/process\"],\"activity\":[\"/doc/docCenter/process\"],\"tabId\":[\"0B5307D27B7E41AA9D9D7552F4E97D61\"]}', '/doc/docCenter/process', '文档管理', '/doc/docCenter/process', '文档中心', '/docManage/docCenter', '打开页面', NULL, '2024-11-23 21:09:56', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', 'PC', NULL, 0);
INSERT INTO `sa_log` VALUES ('B3A2EF197A7242BE94E758BF21977B57', '功能页面', '{\"language\":[\"zh_CN\"],\"process\":[\"/SA/functionTree/process\"],\"activity\":[\"/SA/functionTree/process\"],\"tabId\":[\"sysmenus\"]}', '/SA/functionTree/process', '系统管理', '/SA/functionTree/process', '菜单设置', '/system/sysMenu', '打开页面', NULL, '2024-11-23 21:10:05', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', 'PC', NULL, 0);

-- ----------------------------
-- Table structure for sa_loginlog
-- ----------------------------
DROP TABLE IF EXISTS `sa_loginlog`;
CREATE TABLE `sa_loginlog`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `suserid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户id',
  `susername` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名称',
  `sloginip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录IP',
  `slogintime` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `sserviceip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '服务器IP',
  `sday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '星期几',
  `sdaynum` int(11) NULL DEFAULT NULL COMMENT '周几',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_loginlog
-- ----------------------------
INSERT INTO `sa_loginlog` VALUES ('9C58B2FC216E4FD9ACFFE722B791F30D', 'PSN01', 'system', '127.0.0.1', '2024-11-23 21:09:47', '·! @¹#y$¤%^¦&«*µ¸q¢«¥¤°¹{¥¬´ª²­m¨¬µ', '192.168.119.1', '星期六', 7, 0);

-- ----------------------------
-- Table structure for sa_mailset
-- ----------------------------
DROP TABLE IF EXISTS `sa_mailset`;
CREATE TABLE `sa_mailset`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `smail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `saccount` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `sname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发信名称',
  `stype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱类型',
  `ssendhost` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发件服务器',
  `ssendpost` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发件端口',
  `sisssl` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发件是否启用SSL',
  `srechost` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件服务器',
  `srecport` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件端口',
  `srecssl` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件是否启用SSL',
  `sispub` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否公用',
  `fcreatepsnfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '创建人FID',
  `fcreatepsnid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `fcreatepsnname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `fcreatedeptid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门ID',
  `fcreatedeptname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门名称',
  `fcreateognid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '机构ID',
  `fcreateognname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '机构名称',
  `fcreateorgid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组织ID',
  `fcreateorgname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组织名称',
  `fcreatetime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `version` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮箱接口设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_mailset
-- ----------------------------

-- ----------------------------
-- Table structure for sa_onlineinfo
-- ----------------------------
DROP TABLE IF EXISTS `sa_onlineinfo`;
CREATE TABLE `sa_onlineinfo`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `suserid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户id',
  `susername` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `suserfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '用户路径id',
  `suserfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '用户路径名称',
  `sloginip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录IP',
  `slogindate` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `ssessionid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户标志',
  `sserviceip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '服务器IP',
  `smachinecode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '机器码',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `sa_onlineinfo_sserviceip`(`sserviceip`) USING BTREE,
  INDEX `sa_onlineinfo_ssessionid`(`ssessionid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '在线用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_onlineinfo
-- ----------------------------
INSERT INTO `sa_onlineinfo` VALUES ('A517EC6DA22048379FBD43DEE323B167', 'PSN01', 'system', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '127.0.0.1', '2024-11-23 21:09:47', '65fe1f70-253b-4f85-aa53-be16f7133aa7', '192.168.119.1', '06D3C72DFBB4490B878CA394CDB9F8CD', 0);

-- ----------------------------
-- Table structure for sa_opagent
-- ----------------------------
DROP TABLE IF EXISTS `sa_opagent`;
CREATE TABLE `sa_opagent`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sorgfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织路径id',
  `sorgfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织路径名',
  `sagentid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '代理用户id',
  `svalidstate` int(11) NULL DEFAULT NULL COMMENT '状态',
  `sstarttime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `sfinishtime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `sprocess` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '流程id',
  `screatorid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人id',
  `screatorname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `screatetime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `scantranagent` int(11) NULL DEFAULT NULL COMMENT '是否可以再次代理',
  `version` int(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户代理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_opagent
-- ----------------------------

-- ----------------------------
-- Table structure for sa_opauthorize
-- ----------------------------
DROP TABLE IF EXISTS `sa_opauthorize`;
CREATE TABLE `sa_opauthorize`  (
  `sid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sorgid` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组织id',
  `sorgname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组织名称',
  `sorgfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '组织路径id',
  `sorgfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '组织路径名称',
  `sauthorizeroleid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '授权的角色id',
  `sdescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '描述',
  `screatorfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '创建人路径id',
  `screatorfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '创建人路径名称',
  `screatetime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `srolelevel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色级别',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `idx_opauth_roleid`(`sauthorizeroleid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '授权信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_opauthorize
-- ----------------------------
INSERT INTO `sa_opauthorize` VALUES ('614F99FC54CB4466BCBF70D43BB05279', '5979D9B4A264438C84054F540CB7F032', '测试机构', '/5979D9B4A264438C84054F540CB7F032.ogn', '/测试机构', 'RL02', '任务', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2023-03-24 15:47:48', NULL, 0);
INSERT INTO `sa_opauthorize` VALUES ('AHR01', 'PSN01@ORG01', '管理员', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'RL01', '超级管理员', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2009-11-03 00:00:00', '0', 0);

-- ----------------------------
-- Table structure for sa_opmanagement
-- ----------------------------
DROP TABLE IF EXISTS `sa_opmanagement`;
CREATE TABLE `sa_opmanagement`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sorgid` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织id',
  `sorgname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组织名称',
  `sorgfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组织路径id',
  `sorgfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '组织路径名称',
  `smanageorgid` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理的组织id',
  `smanageorgname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '管理的组织名称',
  `smanageorgfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理的组织路径id',
  `smanageorgfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '管理的组织路径名称',
  `smanagetypeid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理类型id',
  `screatorfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '创建人路径id',
  `screatorfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '创建人路径名称',
  `screatetime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `version` int(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_opmanagement
-- ----------------------------

-- ----------------------------
-- Table structure for sa_opmanagetype
-- ----------------------------
DROP TABLE IF EXISTS `sa_opmanagetype`;
CREATE TABLE `sa_opmanagetype`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `smanageorgkind` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `smanageorgkindname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sleadernumber` int(11) NULL DEFAULT NULL,
  `sissystem` int(11) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_opmanagetype
-- ----------------------------

-- ----------------------------
-- Table structure for sa_opmenutree
-- ----------------------------
DROP TABLE IF EXISTS `sa_opmenutree`;
CREATE TABLE `sa_opmenutree`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `label` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `layuiicon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '样式图标',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '路径',
  `process` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '流程id',
  `activity` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '环节id',
  `display` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '展示',
  `icon32` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '小图标',
  `icon64` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '大图标',
  `pid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父id',
  `sorts` int(11) NULL DEFAULT NULL COMMENT '排序',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编号',
  `i18n` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '多语言编号',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `idx_sa_function_tree_pid`(`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_opmenutree
-- ----------------------------
INSERT INTO `sa_opmenutree` VALUES ('0B5307D27B7E41AA9D9D7552F4E97D61', '文档中心', 'DatabaseOutlined', 'fa fa-reorder', '/docManage/docCenter', '/doc/docCenter/process', 'mainActivity', NULL, NULL, NULL, '7072717E0CB543A8876DA4B7282A07C6', 2, 'docCenter', 'docCenter', 0);
INSERT INTO `sa_opmenutree` VALUES ('0EAC50F0A3DF40A8AA949D1F1A9BEE81', '发帖', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/forum/BO_talkl.html', '/OA/forum/process', 'BO_talkl', NULL, NULL, NULL, '13E42CA7A0AD4F2888A40DEF05AA44CC', 2, 'bo_post', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('11C28B381745478282E0E391D61E2A53', '分类设置', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/forum/Bo_category.html', '/OA/forum/process', 'Bo_category', NULL, NULL, NULL, '3B35B11CF8D04C4AAAEF410B847D2252', 1, 'bo_category', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('13E42CA7A0AD4F2888A40DEF05AA44CC', '内部论坛', 'DatabaseOutlined', 'layui-icon layui-icon-app', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'forum', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('16C7EF0E65EA4683BFCAD11BB9B717CF', '基础列表', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/list/baseList', '', '', '', NULL, NULL, '6898A59107BC4E388A2D8F057AE4E857', 1, 'base-list', 'base-list', 0);
INSERT INTO `sa_opmenutree` VALUES ('1E9A00C2F9D4409D96597C40B9EA8571', '详情', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/result/info', '', '', '', NULL, NULL, 'CE4E91608F3E4AC4A0A2D206D6D65A8B', 4, 'result-info', 'result-info', 0);
INSERT INTO `sa_opmenutree` VALUES ('1F736601DB7E499A805ECF0A1D3BDFBC', '日常办公', 'DatabaseOutlined', 'layui-icon layui-icon-app', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'date-work', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('27BD1F45508B49F4B11918F91E14E316', '权限管理', 'DatabaseOutlined', 'fa fa-key', '/system/manageMeant', '/SA/manageMeantProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 5, 'manageMeant', 'manageMeant', 0);
INSERT INTO `sa_opmenutree` VALUES ('28DD3BE201134F3089924D050AED2D22', '警告', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/result/warning', '', '', '', NULL, NULL, 'CE4E91608F3E4AC4A0A2D206D6D65A8B', 3, 'result-warning', 'result-warning', 0);
INSERT INTO `sa_opmenutree` VALUES ('337D6618FBB64291A0EA7A577F144521', '500', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/error/500', '', '', '', 'null', 'null', '91AE4D6AA06446CC9543AD0D51A291F6', 3, 'error-500', 'error-500', 0);
INSERT INTO `sa_opmenutree` VALUES ('383DFCD37CF142F8A22EE5BC517A3A1D', '文档配置', 'DatabaseOutlined', 'fa fa-server', '/docManage/docSetting', '/doc/docSettingProcess', 'mainActivity', NULL, NULL, NULL, '7072717E0CB543A8876DA4B7282A07C6', 1, 'docSetting', 'docSetting', 0);
INSERT INTO `sa_opmenutree` VALUES ('3B35B11CF8D04C4AAAEF410B847D2252', '讨论区', 'DatabaseOutlined', 'layui-icon layui-icon-app', NULL, NULL, NULL, NULL, NULL, NULL, '13E42CA7A0AD4F2888A40DEF05AA44CC', 1, 'discussion-area', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('41103463A6744853BFE32F26BC3D7EA0', '表单页面', 'FormOutlined', 'layui-icon layui-icon-app', '/form', '', '', '', NULL, NULL, '', 2, 'form', 'form', 0);
INSERT INTO `sa_opmenutree` VALUES ('412181B528E545F0B8D9EE3CF312DF98', '流程设计', 'DatabaseOutlined', 'layui-icon layui-icon-slider', '/flowManager/flowDesign', '/flowDesign/process', 'mainActivity', NULL, NULL, NULL, 'AFDEF15E8D7B4EC89446C68CF73D5B0D', 9, 'flowDesigner', 'flowDesigner', 0);
INSERT INTO `sa_opmenutree` VALUES ('41663E4FCF5149358F30056A56A4797F', '失败', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/result/failure', '', '', '', NULL, NULL, 'CE4E91608F3E4AC4A0A2D206D6D65A8B', 2, 'result-failure', 'result-failure', 0);
INSERT INTO `sa_opmenutree` VALUES ('44DAA56DDDCB44339EE9718E79B35214', '图文列表', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/list/newsList', '', '', '', NULL, NULL, '6898A59107BC4E388A2D8F057AE4E857', 3, 'news-list', 'news-list', 0);
INSERT INTO `sa_opmenutree` VALUES ('45C85E85E41943B3981ACEFCDD27564E', '讨论区设置', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/forum/BO_bloglist.html', '/OA/forum/process', 'BO_bloglist', NULL, NULL, NULL, '3B35B11CF8D04C4AAAEF410B847D2252', 2, 'bo_dis_set', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('4C55668342EA451EA6B7F7D0581FD7FA', '服务器监控', 'DatabaseOutlined', 'layui-icon layui-icon-chart-screen', '/SA/cockpit/show.html', '/SA/cockpit', 'mainActivity', NULL, NULL, NULL, '5004DBF28EF840438B55BEF5294C7C01', 1, 'ServerMonitor', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('4D537DDA3E3B4CFEA192A981BDC5B266', '分析页', 'DashboardOutlined', 'layui-icon layui-icon-app', '/dashboard/console', NULL, NULL, NULL, NULL, NULL, '5C027D8A8B074441923D6C3D5530555C', 1, 'dashboard-console', 'console', 0);
INSERT INTO `sa_opmenutree` VALUES ('5004DBF28EF840438B55BEF5294C7C01', '系统工具', 'DatabaseOutlined', 'layui-icon layui-icon-util', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, 'systemTools', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('5316BC0BC6374BAD9E50E164C0D4192A', '系统日志', 'DatabaseOutlined', 'layui-icon layui-icon-log', '/SA/system/syslog/mainActivity.html', '/SA/sysLogProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 6, 'sysLog', 'sysLog', 1);
INSERT INTO `sa_opmenutree` VALUES ('5C027D8A8B074441923D6C3D5530555C', '工作空间', 'HomeOutlined', 'layui-icon layui-icon-app', '/dashboard', '', '', '', NULL, NULL, '', 1, 'dashboard', 'dashboard', 0);
INSERT INTO `sa_opmenutree` VALUES ('6276A3096D834B9BA39BC08E2507C550', '服务器信息', 'DatabaseOutlined', 'layui-icon layui-icon-engine', '/SA/services/servicesInfo.html', '/SA/services/servicesInfo', 'mainActivity', NULL, NULL, NULL, '5004DBF28EF840438B55BEF5294C7C01', 2, 'ServerInfo', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('636B998F3485463E94083AB2448E4232', '流程审批', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/demo/flow/mainActivity2.html', 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity4', 'hide', NULL, NULL, 'FB10A917C8A647D9B9099A1E4B35C310', NULL, 'bizActivity4', NULL, 2);
INSERT INTO `sa_opmenutree` VALUES ('64103C00B8AF45778B6F0B3FA022A17A', '讨论区管理', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/forum/BO_blogManage.html', '/OA/forum/process', 'BO_blogManage', NULL, NULL, NULL, '3B35B11CF8D04C4AAAEF410B847D2252', 3, 'bo_dis_manage', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('6898A59107BC4E388A2D8F057AE4E857', '列表页面', 'UnorderedListOutlined', 'layui-icon layui-icon-app', '/list', '', '', '', NULL, NULL, '', 3, 'list', 'list', 0);
INSERT INTO `sa_opmenutree` VALUES ('6E918A31278C475B823012B960C3AD44', '内部邮箱', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/email/mainActivity.html', '/OA/email', 'mainActivity', NULL, NULL, NULL, '1F736601DB7E499A805ECF0A1D3BDFBC', 1, 'org-email', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('7072717E0CB543A8876DA4B7282A07C6', '文档管理', 'ContainerOutlined', 'fa fa-gear', '/docManage', NULL, NULL, NULL, NULL, NULL, NULL, 97, 'docManage', 'docManage', 1);
INSERT INTO `sa_opmenutree` VALUES ('759D35AFC1EB438BB2B2E122F83CD763', '授权管理', 'DatabaseOutlined', 'layui-icon layui-icon-auz', '/system/authorManage', '/SA/role/authorManageProcess', 'mainActivity', '', 'null', 'null', 'sysfun', 4, 'authorManage', 'authorManage', 0);
INSERT INTO `sa_opmenutree` VALUES ('826434CF9E734ED9ABA235C2BFF696B0', '流程监控', 'DatabaseOutlined', 'fa fa-stack-overflow', '/SA/process/monitor/mainActivity.html', '/SA/process/monitor', 'mainActivity', NULL, NULL, NULL, 'AFDEF15E8D7B4EC89446C68CF73D5B0D', 2, 'processmonitor', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('89F94C93D75549DEBDF33190828721EE', '403', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/error/403', '', '', '', NULL, NULL, '91AE4D6AA06446CC9543AD0D51A291F6', 1, 'error-403', 'error-403', 0);
INSERT INTO `sa_opmenutree` VALUES ('8EB2FDB9C11D49E781B75374E5F48B49', '查询表格', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/list/tableList', '', '', '', NULL, NULL, '6898A59107BC4E388A2D8F057AE4E857', 4, 'table-list', 'table-list', 0);
INSERT INTO `sa_opmenutree` VALUES ('8EC0FF9DB10549B0898B8F7CD4E6C6F2', '回收站', 'DatabaseOutlined', 'layui-icon layui-icon-delete', '/system/recycle', '/SA/recycleProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 9, 'recycle', 'recycle', 0);
INSERT INTO `sa_opmenutree` VALUES ('91AE4D6AA06446CC9543AD0D51A291F6', '错误页面', 'StopOutlined', 'layui-icon layui-icon-app', '/error', '', '', '', NULL, NULL, '', 5, 'error', 'error', 0);
INSERT INTO `sa_opmenutree` VALUES ('9ECFAA70CC174D12A1E5FB25F681F89A', '通知公告', 'DatabaseOutlined', 'layui-icon layui-icon-app', NULL, NULL, NULL, NULL, NULL, NULL, '1F736601DB7E499A805ECF0A1D3BDFBC', 2, 'notes', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('A0446547A3684727A1DBD1A05E8A799C', '基础表单', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/form/baseForm', NULL, NULL, NULL, NULL, NULL, '41103463A6744853BFE32F26BC3D7EA0', 1, 'base-form', 'base-form', 0);
INSERT INTO `sa_opmenutree` VALUES ('A4A6236099464082BB1ED5270EB64804', '个人中心', 'DashboardOutlined', 'layui-icon layui-icon-app', '/account/center', NULL, NULL, 'hide', NULL, NULL, 'E316E4AC20544555840E4F25535CCC4D', 1, 'account-center', 'account-center', 0);
INSERT INTO `sa_opmenutree` VALUES ('AF66D9A7835145319EC0C358A9CDD5D9', '报表设计器', NULL, 'layui-icon layui-icon-app', '/reportManager/ureportDesigner', '/ureportDesigner/process', 'mainActivity', NULL, NULL, NULL, '5004DBF28EF840438B55BEF5294C7C01', 3, 'ureportDesigner', NULL, 3);
INSERT INTO `sa_opmenutree` VALUES ('AFDEF15E8D7B4EC89446C68CF73D5B0D', '流程管理', 'AntDesignOutlined', 'layui-icon layui-icon-app', '/flowManager', NULL, NULL, NULL, NULL, NULL, NULL, 98, 'flowManager', 'flowManager', 1);
INSERT INTO `sa_opmenutree` VALUES ('B7C66B18C7B14A7AB20E928867F0636A', '手写签名', 'DatabaseOutlined', 'fa fa-pencil-square-o', '/SA/handwrittenSignature/mainActivity.html', '/SA/handwrittenSignature', 'mainActivity', NULL, NULL, NULL, 'sysfun', 7, 'handwrittenSignature', NULL, 2);
INSERT INTO `sa_opmenutree` VALUES ('C5C5D87019BA413B8929A85FC362C9C3', 'DEMO', 'DatabaseOutlined', 'layui-icon layui-icon-app', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'demo', NULL, 2);
INSERT INTO `sa_opmenutree` VALUES ('C834A7AC780B464789B4B5B55D104B83', '流程审批2', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/demo/flow/mainActivity2.html', 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity6', 'hide', NULL, NULL, 'FB10A917C8A647D9B9099A1E4B35C310', NULL, 'bizActivity6', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('C8351E6F2E0E4E9986D7CC19DD01C459', '流程测试', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/demo/flow/mainActivity.html', 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity2', NULL, NULL, NULL, 'FB10A917C8A647D9B9099A1E4B35C310', NULL, 'bizActivity2', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('CE4E91608F3E4AC4A0A2D206D6D65A8B', '结果页面', 'TagOutlined', 'layui-icon layui-icon-app', '/result', '', '', '', NULL, NULL, '', 4, 'result-menu', 'result-menu', 0);
INSERT INTO `sa_opmenutree` VALUES ('D00BED3BCFC648C59F8A2EA716118717', '分步表单', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/form/stepForm', NULL, NULL, NULL, NULL, NULL, '41103463A6744853BFE32F26BC3D7EA0', 3, 'step-form', 'step-form', 0);
INSERT INTO `sa_opmenutree` VALUES ('D57EE339F5AE494FBCEC1E325B5E5FEE', '工作台', 'DashboardOutlined', 'layui-icon layui-icon-app', '/dashboard/workspace', NULL, NULL, NULL, NULL, NULL, '5C027D8A8B074441923D6C3D5530555C', 2, 'dashboard-workspace', 'workspace', 0);
INSERT INTO `sa_opmenutree` VALUES ('DFAC4983AE14411CAE7200A7B025713C', '404', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/error/404', '', '', '', NULL, NULL, '91AE4D6AA06446CC9543AD0D51A291F6', 2, 'error-404', 'error-404', 0);
INSERT INTO `sa_opmenutree` VALUES ('E316E4AC20544555840E4F25535CCC4D', 'account', 'DashboardOutlined', 'layui-icon layui-icon-app', '/account', NULL, NULL, 'hide', NULL, NULL, NULL, 0, 'account', 'account', 0);
INSERT INTO `sa_opmenutree` VALUES ('E54E71CA26184648A58865889B711943', '任务中心', 'DatabaseOutlined', 'fa fa-tasks', '/SA/task/taskCenter/mainActivity.html', '/SA/task/taskCenter', 'mainActivity', NULL, NULL, NULL, 'AFDEF15E8D7B4EC89446C68CF73D5B0D', 1, 'taskCenter', 'taskCenter', 1);
INSERT INTO `sa_opmenutree` VALUES ('E8883F6C63FC453CB25E161847559D53', '通知管理', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/notice/publicnotice/publicnoticepushlist.html', '/OA/notice/publicnotice/process', 'publicnoticepushlist', NULL, NULL, NULL, '9ECFAA70CC174D12A1E5FB25F681F89A', 2, 'note-manage', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('E8B707468AF14D099A19843EFCA597E8', '卡片列表', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/list/cardList', '', '', '', NULL, NULL, '6898A59107BC4E388A2D8F057AE4E857', 2, 'card-list', 'card-list', 0);
INSERT INTO `sa_opmenutree` VALUES ('E95861E3A7FB411AB9ECBFE19C555423', '通知列表', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/notice/publicnotice/looknoticepushlist.html', '/OA/notice/publicnotice/process', 'looknoticepushlist', NULL, NULL, NULL, '9ECFAA70CC174D12A1E5FB25F681F89A', 3, 'note-list', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('F1F34234AA12430BACF128E0689E2622', '高级表单', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/form/moreForm', NULL, NULL, NULL, NULL, NULL, '41103463A6744853BFE32F26BC3D7EA0', 2, 'more-form', 'more-form', 0);
INSERT INTO `sa_opmenutree` VALUES ('FA73F4BC3DB745B3B01413521D861E2B', '通知发布', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/notice/publicnotice/publicnoticeadd.html', '/OA/notice/publicnotice/process', 'publicnoticeadd', NULL, NULL, NULL, '9ECFAA70CC174D12A1E5FB25F681F89A', 1, 'notify', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('FB103B23EF0E4D698DDFCEF228A1EB7B', '成功', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/result/success', '', '', '', NULL, NULL, 'CE4E91608F3E4AC4A0A2D206D6D65A8B', 1, 'result-success', 'result-success', 0);
INSERT INTO `sa_opmenutree` VALUES ('FB10A917C8A647D9B9099A1E4B35C310', '流程', 'DatabaseOutlined', 'layui-icon layui-icon-app', NULL, NULL, NULL, NULL, NULL, NULL, 'C5C5D87019BA413B8929A85FC362C9C3', NULL, 'flow', NULL, 1);
INSERT INTO `sa_opmenutree` VALUES ('sysfun', '系统管理', 'SettingOutlined', 'layui-icon layui-icon-set', '/system', '', '', '', '', '', '', 100, 'system', 'system', 0);
INSERT INTO `sa_opmenutree` VALUES ('sysmenus', '菜单设置', 'DatabaseOutlined', 'fa fa-window-maximize', '/system/sysMenu', '/SA/functionTree/process', 'mainActivity', NULL, NULL, NULL, 'sysfun', 1, 'sysMenu', 'sysMenu', 0);
INSERT INTO `sa_opmenutree` VALUES ('sysognzation', '机构管理', 'DatabaseOutlined', 'fa fa-group', '/system/organization', '/SA/organization/organizationProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 2, 'organization', 'organization', 0);
INSERT INTO `sa_opmenutree` VALUES ('sysrolem', '角色管理', 'DatabaseOutlined', 'fa fa-cogs', '/system/roleManage', '/SA/role/roleProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 3, 'roleManage', 'roleManage', 0);

-- ----------------------------
-- Table structure for sa_oporg
-- ----------------------------
DROP TABLE IF EXISTS `sa_oporg`;
CREATE TABLE `sa_oporg`  (
  `sid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `scode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编号',
  `slongname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '长名称',
  `sfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '路径名',
  `sfcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '路径编号',
  `sfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '路径id',
  `sorgkindid` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构类型',
  `svalidstate` int(11) NOT NULL COMMENT '状态',
  `sparent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父id',
  `slevel` int(11) NULL DEFAULT NULL COMMENT '层级',
  `sphone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `sfax` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '传真',
  `saddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `szip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮编',
  `sdescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '备注',
  `spersonid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '人员id',
  `snodekind` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '节点id',
  `sshowname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '展示名称',
  `ssequence` int(11) NULL DEFAULT NULL COMMENT '排序',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `idx_oporg_code`(`scode`) USING BTREE,
  INDEX `idx_sa_oporg_sorgkindid`(`sorgkindid`) USING BTREE,
  INDEX `idx_sa_oporg_sparent`(`sparent`) USING BTREE,
  INDEX `idx_sa_oporg_spersonid`(`spersonid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '组织机构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_oporg
-- ----------------------------
INSERT INTO `sa_oporg` VALUES ('45BB9FCAF8394E43B45A55CF564F9CCD@775F53432CDC40A1A1F12BBEF4F93B74', '测试人员2', 'test2', NULL, '/测试机构/测试部门2/测试人员2', '/testogn/testdept2/test2', '/5979D9B4A264438C84054F540CB7F032.ogn/775F53432CDC40A1A1F12BBEF4F93B74.dpt/45BB9FCAF8394E43B45A55CF564F9CCD@775F53432CDC40A1A1F12BBEF4F93B74.psm', 'psm', 1, '775F53432CDC40A1A1F12BBEF4F93B74', 3, '', '', '', '', '', '45BB9FCAF8394E43B45A55CF564F9CCD', NULL, NULL, 1, NULL);
INSERT INTO `sa_oporg` VALUES ('490BA0D6B1FC4EFE962E376C76B09BBA', '测试部门1', 'testdept1', NULL, '/测试机构/测试部门1', '/testogn/testdept1', '/5979D9B4A264438C84054F540CB7F032.ogn/490BA0D6B1FC4EFE962E376C76B09BBA.dpt', 'dpt', 1, '5979D9B4A264438C84054F540CB7F032', 2, '', '', '', '', '', NULL, NULL, NULL, 1, NULL);
INSERT INTO `sa_oporg` VALUES ('5979D9B4A264438C84054F540CB7F032', '测试机构', 'testogn', NULL, '/测试机构', '/testogn', '/5979D9B4A264438C84054F540CB7F032.ogn', 'ogn', 1, NULL, 1, '', '', '', '', '', NULL, NULL, NULL, 1, NULL);
INSERT INTO `sa_oporg` VALUES ('775F53432CDC40A1A1F12BBEF4F93B74', '测试部门2', 'testdept2', NULL, '/测试机构/测试部门2', '/testogn/testdept2', '/5979D9B4A264438C84054F540CB7F032.ogn/775F53432CDC40A1A1F12BBEF4F93B74.dpt', 'dpt', 1, '5979D9B4A264438C84054F540CB7F032', 2, '', '', '', '', '', NULL, NULL, NULL, 2, NULL);
INSERT INTO `sa_oporg` VALUES ('DC349D31F5FE4113ABA2BBC06B1E42D7@490BA0D6B1FC4EFE962E376C76B09BBA', '测试人员1', 'test1', NULL, '/测试机构/测试部门1/测试人员1', '/testogn/testdept1/test1', '/5979D9B4A264438C84054F540CB7F032.ogn/490BA0D6B1FC4EFE962E376C76B09BBA.dpt/DC349D31F5FE4113ABA2BBC06B1E42D7@490BA0D6B1FC4EFE962E376C76B09BBA.psm', 'psm', 1, '490BA0D6B1FC4EFE962E376C76B09BBA', 3, '', '', '', '', '', 'DC349D31F5FE4113ABA2BBC06B1E42D7', NULL, NULL, 1, NULL);
INSERT INTO `sa_oporg` VALUES ('ORG01', '管理员', 'TULIN', '', '/管理员', '/TULIN', '/ORG01.ogn', 'ogn', 1, NULL, 1, '', '', '', '', '', '', '', '', 96, NULL);
INSERT INTO `sa_oporg` VALUES ('PSN01@ORG01', 'system', 'SYSTEM', '', '/管理员/system', '/TULIN/SYSTEM', '/ORG01.ogn/PSN01@ORG01.psm', 'psm', 1, 'ORG01', 2, '', '', '', '', '', 'PSN01', 'nkLeaf', '', 1, NULL);

-- ----------------------------
-- Table structure for sa_oppermission
-- ----------------------------
DROP TABLE IF EXISTS `sa_oppermission`;
CREATE TABLE `sa_oppermission`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `spermissionroleid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色id',
  `smenuid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单id',
  `sprocess` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程id',
  `sactivityfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '功能名称',
  `sactivity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '环节id',
  `sactionsnames` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '动作名',
  `sactions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '动作',
  `ssemanticdp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '扩展描述',
  `spermissionkind` int(11) NULL DEFAULT NULL COMMENT '授权类型id',
  `sdescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '备注描述',
  `ssequence` int(11) NULL DEFAULT NULL COMMENT '排序',
  `svalidstate` int(11) NOT NULL COMMENT '状态',
  `version` int(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `idx_opperm_activity`(`sactivity`) USING BTREE,
  INDEX `idx_opperm_process`(`sprocess`) USING BTREE,
  INDEX `idx_opperm_roleid`(`spermissionroleid`) USING BTREE,
  INDEX `idx_opperm_smenuid`(`smenuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_oppermission
-- ----------------------------
INSERT INTO `sa_oppermission` VALUES ('05E1122206E34FC796F0C38250D6CE81', 'RL01', '6276A3096D834B9BA39BC08E2507C550', '/SA/services/servicesInfo', '服务器信息', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('09CCE2452D844847BC69B4EE34C07CF2', 'RL01', 'sysrolem', '/SA/role/roleProcess', '角色管理', 'mainActivity', NULL, NULL, NULL, 0, '角色管理', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('15B57007135848A6BA9BE7C6B5E969F8', 'RL01', 'sysognzation', '/SA/organization/organizationProcess', '机构管理', 'mainActivity', NULL, NULL, NULL, 0, '机构管理', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('16E384E9A8C84A888FD9F4221412E078', 'RL01', 'sysmenus', '/SA/functionTree/process', '菜单设置', 'mainActivity', NULL, NULL, NULL, 0, '菜单设置', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('1A972C931F8742C58BE07A01D8E7C075', 'RL01', '826434CF9E734ED9ABA235C2BFF696B0', '/SA/process/monitor', '流程监控', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('1D61F2FA4A904BE6B8F360FD631AEB7B', 'RL01', '8EC0FF9DB10549B0898B8F7CD4E6C6F2', '/SA/recycleProcess', '回收站', 'mainActivity', NULL, NULL, NULL, 0, '回收站', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('20BAF9C9D1CA4C759B1BBDA9C40ADFC2', 'RL01', '4C55668342EA451EA6B7F7D0581FD7FA', '/SA/cockpit', '服务器监控', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('25E76761EEFC4AED9357173FCB955189', 'RL01', '0B5307D27B7E41AA9D9D7552F4E97D61', '/doc/docCenter/process', '文档中心', 'mainActivity', NULL, NULL, NULL, 0, '文档中心', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('28DA9CC3C865433BB72FDFF4862D653C', 'RL01', 'FB10A917C8A647D9B9099A1E4B35C310', NULL, '流程', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('2BB27622E99C4E3899EB1D69E60807A4', 'RL01', '5316BC0BC6374BAD9E50E164C0D4192A', '/SA/sysLogProcess', '系统日志', 'mainActivity', NULL, NULL, NULL, 0, '系统日志', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('2D056D229C6247388B5F3DD7D3AA86B8', 'RL01', 'C8351E6F2E0E4E9986D7CC19DD01C459', 'EFB1385BEB1441BCA87404D318B7F9BC', '流程测试', 'bizActivity2', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('32229A11012040E3BD7AF8012A7B8B7C', 'RL01', '759D35AFC1EB438BB2B2E122F83CD763', '/SA/role/authorManageProcess', '授权管理', 'mainActivity', NULL, NULL, NULL, 0, '授权管理', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('35938A2ED52F49308C0CABBFE1AD91FF', 'RL01', '636B998F3485463E94083AB2448E4232', 'EFB1385BEB1441BCA87404D318B7F9BC', '流程审批', 'bizActivity4', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('39CB395DF4124458AF9E2D16BEBFC671', 'RL01', 'C5C5D87019BA413B8929A85FC362C9C3', NULL, 'DEMO', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('3CC060C19A884E27AFBE7C177646DDE1', 'RL01', '5004DBF28EF840438B55BEF5294C7C01', NULL, '系统工具', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('46C80A03E26B4179BDDCDE81AD33BFDC', 'RL01', '45C85E85E41943B3981ACEFCDD27564E', '/OA/forum/process', '讨论区设置', 'BO_bloglist', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('4CA03F30040B42BC840BF1C6B11B28D9', 'RL01', '0EAC50F0A3DF40A8AA949D1F1A9BEE81', '/OA/forum/process', '发帖', 'BO_talkl', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('510978C776274507ABD4A89B10C45803', 'RL01', '1F736601DB7E499A805ECF0A1D3BDFBC', NULL, '日常办公', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('710970CC13B6491FB9013019C2616324', 'RL01', '383DFCD37CF142F8A22EE5BC517A3A1D', '/doc/docSettingProcess', '文档配置', 'mainActivity', NULL, NULL, NULL, 0, '文档配置', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('716F53800ADD4C009AB7F0082787A418', 'RL01', 'E95861E3A7FB411AB9ECBFE19C555423', '/OA/notice/publicnotice/process', '通知列表', 'looknoticepushlist', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('76C646D8DDE14CB29D47ECFABA7F04E3', 'RL01', 'sysfun', '', '系统管理', '', NULL, NULL, NULL, 0, '系统管理', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('8844382D546F42D78F83B0E85CE24818', 'RL01', '412181B528E545F0B8D9EE3CF312DF98', '/flowDesign/process', '流程设计', 'mainActivity', NULL, NULL, NULL, 0, '流程设计', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('8973A87FA6344748B8D2C4DF55440A88', 'RL01', 'AFDEF15E8D7B4EC89446C68CF73D5B0D', NULL, '流程管理', NULL, NULL, NULL, NULL, 0, '流程管理', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('9C71EFBECA784F61A3B4E255E72325A9', 'RL01', 'C834A7AC780B464789B4B5B55D104B83', 'EFB1385BEB1441BCA87404D318B7F9BC', '流程审批2', 'bizActivity6', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('9EBF63E02EEF4C4AB498836912EF3133', 'RL01', '6E918A31278C475B823012B960C3AD44', '/OA/email', '内部邮箱', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('A23832868F2E432B9C3861D49F60A4E9', 'RL01', '13E42CA7A0AD4F2888A40DEF05AA44CC', NULL, '内部论坛', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('B903B34C093F4AB9B84F7C20AFF58D64', 'RL01', 'AF66D9A7835145319EC0C358A9CDD5D9', '/ureportDesigner/process', '报表设计器', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('C192BFCE969B454AB64B79790B36A6F3', 'RL01', 'B7C66B18C7B14A7AB20E928867F0636A', '/SA/handwrittenSignature', '手写签名', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('C785D415CF8A453D97487FE54F658333', 'RL01', '6E918A31278C475B823012B960C3AD44', '/OA/email', '内部邮箱', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('CAC1325E02C94175A8AADE2985F8C4A6', 'RL01', '3B35B11CF8D04C4AAAEF410B847D2252', NULL, '讨论区', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('CBA1667533DC4C5E8B96C0BAA71732F9', 'RL01', '64103C00B8AF45778B6F0B3FA022A17A', '/OA/forum/process', '讨论区管理', 'BO_blogManage', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('CE01BD0E0646458DB5B027E87A463DA7', 'RL01', '27BD1F45508B49F4B11918F91E14E316', '/SA/manageMeantProcess', '权限管理', 'mainActivity', NULL, NULL, NULL, 0, '权限管理', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('D73A36F728194D1E96253B780970A1E9', 'RL01', 'FA73F4BC3DB745B3B01413521D861E2B', '/OA/notice/publicnotice/process', '通知发布', 'publicnoticeadd', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('E65482587B1F4D76B9CF1ED1EA7F8AE4', 'RL01', 'E8883F6C63FC453CB25E161847559D53', '/OA/notice/publicnotice/process', '通知管理', 'publicnoticepushlist', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('EB6FA085BE3B4A6A87958D1E315D818A', 'RL01', 'E54E71CA26184648A58865889B711943', '/SA/task/taskCenter', '任务中心', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('ED9348734D66443E9F97D39B63CC4AC1', 'RL01', '7072717E0CB543A8876DA4B7282A07C6', NULL, '文档管理', NULL, NULL, NULL, NULL, 0, '文档管理', 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('F487368123EA4C109350ED04EC3D0B98', 'RL01', '11C28B381745478282E0E391D61E2A53', '/OA/forum/process', '分类设置', 'Bo_category', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO `sa_oppermission` VALUES ('F7891CD2ABB84EC7A07764783C6CEED2', 'RL01', '9ECFAA70CC174D12A1E5FB25F681F89A', NULL, '通知公告', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);

-- ----------------------------
-- Table structure for sa_opperson
-- ----------------------------
DROP TABLE IF EXISTS `sa_opperson`;
CREATE TABLE `sa_opperson`  (
  `sid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `scode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `sidcard` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '身份证',
  `snumb` int(11) NOT NULL COMMENT '年龄',
  `sloginname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录名',
  `spassword` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `spasswordtimelimit` int(11) NULL DEFAULT NULL COMMENT '密码过期时限（天）',
  `spasswordmodifytime` datetime(0) NULL DEFAULT NULL COMMENT '密码修改时间',
  `smainorgid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属组织id',
  `ssafelevelid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '安全级别',
  `ssequence` int(11) NULL DEFAULT NULL COMMENT '排序',
  `svalidstate` int(11) NOT NULL COMMENT '状态',
  `sdescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '描述',
  `ssex` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `sbirthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sjoindate` datetime(0) NULL DEFAULT NULL COMMENT '参加工作时间',
  `shomeplace` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '住址',
  `sdegree` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学位',
  `sgraduateschool` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `sspeciality` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '专业',
  `sschoollength` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学制',
  `stitle` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '称呼',
  `smarriage` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婚否',
  `scardno` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '工号',
  `scardkind` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '工种',
  `sfamilyaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `szip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮编',
  `smsn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'MSN',
  `sqq` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ',
  `smail` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `smobilephone` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机',
  `sfamilyphone` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '家用电话',
  `sofficephone` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '办公电话',
  `sphoto` longblob NULL COMMENT '照片',
  `scountry` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国籍',
  `sprovince` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '省',
  `scity` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '市',
  `spositions` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '县区',
  `sschool` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学校',
  `sstudy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学习',
  `senglishname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '英文名',
  `fcasn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'UKey编号',
  `fsignm` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '签名信息',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `idx_opperson_scode`(`scode`) USING BTREE,
  INDEX `idx_opperson_smainorgid`(`smainorgid`) USING BTREE,
  INDEX `xmsgindexmessagesvalidstate`(`svalidstate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '人员信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_opperson
-- ----------------------------
INSERT INTO `sa_opperson` VALUES ('45BB9FCAF8394E43B45A55CF564F9CCD', '测试人员2', 'test2', NULL, 0, NULL, 'E10ADC3949BA59ABBE56E057F20F883E', 0, NULL, '775F53432CDC40A1A1F12BBEF4F93B74', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sa_opperson` VALUES ('DC349D31F5FE4113ABA2BBC06B1E42D7', '测试人员1', 'test1', NULL, 0, NULL, 'E10ADC3949BA59ABBE56E057F20F883E', 0, NULL, '490BA0D6B1FC4EFE962E376C76B09BBA', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sa_opperson` VALUES ('PSN01', 'system', 'SYSTEM', '', 1, '管理员', 'C4CA4238A0B923820DCC509A6F75849B', 120, '2013-10-20 00:00:00', 'ORG01', '', 1, 1, '', '男', '1976-12-03 00:00:00', '2006-06-06 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '14769660886', '', '', 0x34, NULL, '', '', '', '', '', '', '', '', NULL);

-- ----------------------------
-- Table structure for sa_opperson_deatail
-- ----------------------------
DROP TABLE IF EXISTS `sa_opperson_deatail`;
CREATE TABLE `sa_opperson_deatail`  (
  `sid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spersonid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stype` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `ssquns` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `scode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sremark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sclass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `supdatedate` datetime(0) NULL DEFAULT NULL,
  `supdatorid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supdatorname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_opperson_deatail
-- ----------------------------

-- ----------------------------
-- Table structure for sa_oprole
-- ----------------------------
DROP TABLE IF EXISTS `sa_oprole`;
CREATE TABLE `sa_oprole`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色名称',
  `scode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色编号',
  `scatalog` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色类型',
  `srolekind` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型id',
  `sparentrolesnames` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '父角色名称',
  `sdescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '角色描述',
  `ssequence` int(11) NULL DEFAULT NULL COMMENT '角色排序',
  `svalidstate` int(11) NULL DEFAULT NULL COMMENT '状态',
  `version` int(11) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `idx_oprole_code`(`scode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_oprole
-- ----------------------------
INSERT INTO `sa_oprole` VALUES ('RL01', '超级管理员', 'opm', '勿删-系统应用', 'fun', '', '', 1, 1, 4);
INSERT INTO `sa_oprole` VALUES ('RL02', '任务', 'task', '系统管理', 'fun', '', '', 2, 1, 2);
INSERT INTO `sa_oprole` VALUES ('RL02-doc', '文档', 'doc', '系统管理', 'fun', '', '', 3, 1, 2);

-- ----------------------------
-- Table structure for sa_oprolemanage
-- ----------------------------
DROP TABLE IF EXISTS `sa_oprolemanage`;
CREATE TABLE `sa_oprolemanage`  (
  `sid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorgid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sorgfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `spersonid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sroleid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `screatorid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `screatetime` datetime(0) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_oprolemanage
-- ----------------------------

-- ----------------------------
-- Table structure for sa_oprolemanagement
-- ----------------------------
DROP TABLE IF EXISTS `sa_oprolemanagement`;
CREATE TABLE `sa_oprolemanagement`  (
  `sid` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorgid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorgname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sorgfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorgfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sroleid` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `screatorfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `screatorfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `screatetime` datetime(0) NULL DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_oprolemanagement
-- ----------------------------

-- ----------------------------
-- Table structure for sa_psnmytask
-- ----------------------------
DROP TABLE IF EXISTS `sa_psnmytask`;
CREATE TABLE `sa_psnmytask`  (
  `sid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scaption` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `sstartdate` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `senddate` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `spriority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `scontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `sstatus` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  `saffairstype` int(11) NULL DEFAULT NULL COMMENT '事务类型',
  `scompleterate` int(11) NULL DEFAULT NULL COMMENT '完成率',
  `sstartdate_axis` int(11) NULL DEFAULT NULL COMMENT '开始时间轴',
  `ssenddate` int(11) NULL DEFAULT NULL COMMENT '结束时间轴',
  `swhouser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属用户',
  `ssenddate_axis` int(11) NULL DEFAULT NULL COMMENT '发布时间轴',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `sa_psntask_user`(`swhouser`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_psnmytask
-- ----------------------------

-- ----------------------------
-- Table structure for sa_psnschedule
-- ----------------------------
DROP TABLE IF EXISTS `sa_psnschedule`;
CREATE TABLE `sa_psnschedule`  (
  `sid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scaption` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `sstartdate` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `senddate` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `scontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `spriority` int(11) NULL DEFAULT NULL COMMENT '优先级别',
  `sstatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  `sstartdate_axis` int(11) NULL DEFAULT NULL COMMENT '开始时间轴',
  `ssenddate_axis` int(11) NULL DEFAULT NULL COMMENT '结束时间轴',
  `saffairstype` int(11) NULL DEFAULT NULL COMMENT '事务类型',
  `swhouser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所属用户',
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `sa_psnschedule_user`(`swhouser`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_psnschedule
-- ----------------------------

-- ----------------------------
-- Table structure for sa_task
-- ----------------------------
DROP TABLE IF EXISTS `sa_task`;
CREATE TABLE `sa_task`  (
  `sid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `sparentid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父id',
  `sname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务标题',
  `scontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '任务内容',
  `sremark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '任务备注',
  `sflowid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程id',
  `stypeid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型id',
  `stypename` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型名称',
  `sprocess` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程图',
  `sactivity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流程环节',
  `screatetime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `sdistributetime` datetime(0) NULL DEFAULT NULL COMMENT '分发时间',
  `slastmodifytime` datetime(0) NULL DEFAULT NULL COMMENT '最后编辑时间',
  `swarningtime` datetime(0) NULL DEFAULT NULL COMMENT '报警时间',
  `slimittime` datetime(0) NULL DEFAULT NULL COMMENT '最后期限',
  `sestarttime` datetime(0) NULL DEFAULT NULL COMMENT '执行开始时间',
  `sefinishtime` datetime(0) NULL DEFAULT NULL COMMENT '执行结束时间',
  `sastarttime` datetime(0) NULL DEFAULT NULL COMMENT '动作开始时间',
  `safinishtime` datetime(0) NULL DEFAULT NULL COMMENT '动作结束时间',
  `sexecutetime` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `scpersonid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交人id',
  `scpersonname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交人名称',
  `scdeptid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交人部门id',
  `scdeptname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交人部门名称',
  `scognid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交人单位id',
  `scognname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交人单位名称',
  `sepersonid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行人id',
  `sepersonname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行人名称',
  `sedeptid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行人部门id',
  `sedeptname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行人部门名称',
  `seognid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行人单位id',
  `seognname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行人单位名称',
  `slock` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务锁定',
  `sstatusid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态id',
  `sstatusname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态名称',
  `skindid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型id',
  `scurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交页面地址',
  `seurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行页面地址',
  `sexecutemode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行模式',
  `ssequence` int(11) NULL DEFAULT NULL COMMENT '排序',
  `scpersoncode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交人编号',
  `scposid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交人岗位id',
  `scposcode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交人岗位编号',
  `scposname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交人岗位名称',
  `scdeptcode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交人部门编号',
  `scogncode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交人单位编号',
  `scfid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '提交人路径id',
  `sepersoncode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行人编号',
  `seposid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行人岗位id',
  `seposcode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行人编号',
  `seposname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行人名称',
  `sedeptcode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行人部门编号',
  `seogncode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '执行人单位编号',
  `sefid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '执行人路径id',
  `sdata1` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '业务主键',
  `sdata2` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '业务子表id',
  `sdata3` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '业务从表id',
  `sdata4` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '业务外键',
  `scfname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '提交人路径名称',
  `sefname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '执行人路径名称',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `sa_flowid`(`sflowid`) USING BTREE,
  INDEX `sa_status`(`sstatusid`) USING BTREE,
  INDEX `sa_task_sdata_1`(`sdata1`) USING BTREE,
  INDEX `sa_task_sparentid`(`sparentid`) USING BTREE,
  INDEX `sa_task_sprocess`(`sprocess`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '流程管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_task
-- ----------------------------
INSERT INTO `sa_task` VALUES ('1752513F978846E7B328109C6AC5062A', '2D7C816D00794540828AB9418E6A7E01', '结束:测试流程', NULL, NULL, '64F722F0D4B743CFB3792C407744656C', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'Activity8', '2024-10-18 14:52:54', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-18 14:52:54', NULL, NULL, 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', '', '', 'ORG01', '管理员', NULL, 'tesFinished', '已完成', NULL, '/demo/flow/mainActivity2.html', NULL, NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', '69FB950E3D5045978EB3D0D042F0AEC2', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 0);
INSERT INTO `sa_task` VALUES ('2D7C816D00794540828AB9418E6A7E01', 'C028F91196C3483B8B2E822CF5267F2F', 'bizActivity6:测试流程', NULL, NULL, '64F722F0D4B743CFB3792C407744656C', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity6', '2024-03-06 12:52:28', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-06 12:52:28', '2024-10-18 14:52:54', '2024-10-18 14:52:54', 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', NULL, NULL, NULL, NULL, 'B0F68890FC4541E2BE6C2BCB618CC76B', 'tesFinished', '已完成', NULL, '/demo/flow/mainActivity2.html', '/demo/flow/mainActivity2.html', NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', NULL, NULL, NULL, NULL, NULL, '/ORG01.ogn/PSN01@ORG01.psm', '69FB950E3D5045978EB3D0D042F0AEC2', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 1);
INSERT INTO `sa_task` VALUES ('3F9021623C064E6C8707B9AC7E2E0E4C', 'AD370EC51EC54F91B6F29AAB29F11B71', 'bizActivity4:测试流程', NULL, NULL, '64F722F0D4B743CFB3792C407744656C', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity4', '2024-03-06 12:47:53', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-06 12:47:53', '2024-03-06 12:48:52', '2024-03-06 12:48:52', 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', NULL, NULL, NULL, NULL, NULL, 'tesFinished', '已完成', NULL, '/demo/flow/mainActivity.html', '/demo/flow/mainActivity2.html', NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', NULL, NULL, NULL, NULL, NULL, '/ORG01.ogn/PSN01@ORG01.psm', '69FB950E3D5045978EB3D0D042F0AEC2', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 1);
INSERT INTO `sa_task` VALUES ('48C357DFDC2B4D88A28D3F0F34A1420D', NULL, '测试流程', NULL, NULL, '48C357DFDC2B4D88A28D3F0F34A1420D', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', NULL, '2024-10-18 14:59:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', '', '', 'ORG01', '管理员', NULL, 'tesExecuting', '正在处理', NULL, NULL, NULL, NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'D9F40DD3A388405DBAB2F6C5E2393CEF', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 0);
INSERT INTO `sa_task` VALUES ('4D24D25F3B484616A13C8AFE65158300', '7392F8F988FB40A8B911C18F112565F5', 'bizActivity4:测试流程', NULL, NULL, '48C357DFDC2B4D88A28D3F0F34A1420D', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity4', '2024-10-18 14:59:11', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-18 14:59:11', NULL, NULL, 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', NULL, NULL, NULL, NULL, NULL, 'tesReady', '尚未处理', NULL, '/demo/flow/mainActivity.html', '/demo/flow/mainActivity2.html', NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', NULL, NULL, NULL, NULL, NULL, '/ORG01.ogn/PSN01@ORG01.psm', 'D9F40DD3A388405DBAB2F6C5E2393CEF', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 0);
INSERT INTO `sa_task` VALUES ('64F722F0D4B743CFB3792C407744656C', NULL, '测试流程', NULL, NULL, '64F722F0D4B743CFB3792C407744656C', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', NULL, '2024-03-06 12:47:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-18 14:52:57', 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', '', '', 'ORG01', '管理员', NULL, 'tesFinished', '已完成', NULL, NULL, NULL, NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', '69FB950E3D5045978EB3D0D042F0AEC2', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 1);
INSERT INTO `sa_task` VALUES ('7392F8F988FB40A8B911C18F112565F5', '48C357DFDC2B4D88A28D3F0F34A1420D', 'bizActivity2:测试流程', NULL, NULL, '48C357DFDC2B4D88A28D3F0F34A1420D', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity2', '2024-10-18 14:59:06', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-18 14:59:06', '2024-10-18 14:59:11', '2024-10-18 14:59:11', 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', '', '', 'ORG01', '管理员', NULL, 'tesFinished', '已完成', NULL, NULL, '/demo/flow/mainActivity.html', NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'D9F40DD3A388405DBAB2F6C5E2393CEF', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 1);
INSERT INTO `sa_task` VALUES ('AD370EC51EC54F91B6F29AAB29F11B71', '64F722F0D4B743CFB3792C407744656C', 'bizActivity2:测试流程', NULL, NULL, '64F722F0D4B743CFB3792C407744656C', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity2', '2024-03-06 12:47:50', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-06 12:47:50', '2024-03-06 12:47:53', '2024-03-06 12:47:53', 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', '', '', 'ORG01', '管理员', NULL, 'tesFinished', '已完成', NULL, NULL, '/demo/flow/mainActivity.html', NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', '69FB950E3D5045978EB3D0D042F0AEC2', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 1);
INSERT INTO `sa_task` VALUES ('C028F91196C3483B8B2E822CF5267F2F', '3F9021623C064E6C8707B9AC7E2E0E4C', 'bizActivity4:测试流程', NULL, NULL, '64F722F0D4B743CFB3792C407744656C', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity4', '2024-03-06 12:48:52', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-06 12:48:52', '2024-03-06 12:52:28', '2024-03-06 12:52:28', 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', NULL, NULL, NULL, NULL, 'E1E1113D288548B0A51F738C37F54EE7', 'tesFinished', '已完成', NULL, '/demo/flow/mainActivity2.html', '/demo/flow/mainActivity2.html', NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', NULL, NULL, NULL, NULL, NULL, '/ORG01.ogn/PSN01@ORG01.psm', '69FB950E3D5045978EB3D0D042F0AEC2', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 1);

-- ----------------------------
-- Table structure for sa_task_timelimit
-- ----------------------------
DROP TABLE IF EXISTS `sa_task_timelimit`;
CREATE TABLE `sa_task_timelimit`  (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sprocessid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sprocessname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sactivity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sactivityname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sdlimit` int(11) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sa_task_timelimit
-- ----------------------------

-- ----------------------------
-- View structure for sa_opoeg_view
-- ----------------------------
DROP VIEW IF EXISTS `sa_opoeg_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sa_opoeg_view` AS select `o`.`sid` AS `sid`,`o`.`sparent` AS `sparent`,`o`.`scode` AS `scode`,`o`.`sname` AS `sname`,ifnull(`o`.`sorgkindid`,'org') AS `sorgkindid`,`o`.`sfid` AS `sfid`,`o`.`svalidstate` AS `svalidstate`,`o`.`sfcode` AS `sfcode`,`o`.`sfname` AS `sfname`,`o`.`ssequence` AS `ssequence`,`o`.`sdescription` AS `sdescription`,`o`.`saddress` AS `saddress`,'' AS `smobilephone`,`o`.`version` AS `version` from `sa_oporg` `o` where ((`o`.`svalidstate` = 1) and (`o`.`sorgkindid` <> 'psm')) union all select `p`.`sid` AS `sid`,`t`.`sid` AS `sparent`,`p`.`scode` AS `scode`,`p`.`sname` AS `sname`,'psm' AS `sorgkindid`,concat(`t`.`sfid`,'/',`p`.`sid`) AS `sfid`,`t`.`svalidstate` AS `svalidstate`,concat(`t`.`sfcode`,'/',`p`.`scode`) AS `sfcode`,concat(`t`.`sfname`,'/',`p`.`sname`) AS `sfname`,(`t`.`slevel` + `p`.`ssequence`) AS `ssequence`,`t`.`sdescription` AS `sdescription`,`t`.`saddress` AS `saddress`,ifnull(`p`.`smobilephone`,'') AS `smobilephone`,`p`.`version` AS `version` from (`sa_opperson` `p` left join `sa_oporg` `t` on((`p`.`smainorgid` = `t`.`sid`))) where ((`p`.`smainorgid` is not null) and (`t`.`svalidstate` = 1) and (`p`.`svalidstate` = 1));

-- ----------------------------
-- View structure for sa_task_monitor
-- ----------------------------
DROP VIEW IF EXISTS `sa_task_monitor`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sa_task_monitor` AS select `t`.`sid` AS `sid`,`t`.`sparentid` AS `sparentid`,`t`.`sname` AS `sname`,`t`.`scontent` AS `scontent`,`t`.`sremark` AS `sremark`,`t`.`sflowid` AS `sflowid`,`t`.`stypeid` AS `stypeid`,`t`.`stypename` AS `stypename`,`t`.`sprocess` AS `sprocess`,`t`.`sactivity` AS `sactivity`,`t`.`screatetime` AS `screatetime`,`t`.`sdistributetime` AS `sdistributetime`,`t`.`slastmodifytime` AS `slastmodifytime`,`t`.`swarningtime` AS `swarningtime`,`t`.`slimittime` AS `slimittime`,`t`.`sestarttime` AS `sestarttime`,`t`.`sefinishtime` AS `sefinishtime`,`t`.`sastarttime` AS `sastarttime`,`t`.`safinishtime` AS `safinishtime`,`t`.`sexecutetime` AS `sexecutetime`,`t`.`scpersonid` AS `scpersonid`,`t`.`scpersonname` AS `scpersonname`,`t`.`scdeptid` AS `scdeptid`,`t`.`scdeptname` AS `scdeptname`,`t`.`scognid` AS `scognid`,`t`.`scognname` AS `scognname`,`t`.`sepersonid` AS `sepersonid`,`t`.`sepersonname` AS `sepersonname`,`t`.`sedeptid` AS `sedeptid`,`t`.`sedeptname` AS `sedeptname`,`t`.`seognid` AS `seognid`,`t`.`seognname` AS `seognname`,`t`.`slock` AS `slock`,`t`.`sstatusid` AS `sstatusid`,`t`.`sstatusname` AS `sstatusname`,`t`.`skindid` AS `skindid`,`t`.`scurl` AS `scurl`,`t`.`seurl` AS `seurl`,`t`.`sexecutemode` AS `sexecutemode`,`t`.`ssequence` AS `ssequence`,`t`.`scpersoncode` AS `scpersoncode`,`t`.`scposid` AS `scposid`,`t`.`scposcode` AS `scposcode`,`t`.`scposname` AS `scposname`,`t`.`scdeptcode` AS `scdeptcode`,`t`.`scogncode` AS `scogncode`,`t`.`scfid` AS `scfid`,`t`.`sepersoncode` AS `sepersoncode`,`t`.`seposid` AS `seposid`,`t`.`seposcode` AS `seposcode`,`t`.`seposname` AS `seposname`,`t`.`sedeptcode` AS `sedeptcode`,`t`.`seogncode` AS `seogncode`,`t`.`sefid` AS `sefid`,`t`.`sdata1` AS `sdata1`,`t`.`sdata2` AS `sdata2`,`t`.`sdata3` AS `sdata3`,`t`.`sdata4` AS `sdata4`,`t`.`scfname` AS `scfname`,`t`.`sefname` AS `sefname`,`t`.`version` AS `version`,`p`.`sname` AS `sflowname` from (`sa_task` `t` join `sa_task` `p`) where ((`t`.`sid` = `p`.`sparentid`) and (`t`.`sflowid` = `t`.`sid`));

SET FOREIGN_KEY_CHECKS = 1;
