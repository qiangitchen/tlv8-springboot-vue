/*
 Navicat Premium Data Transfer

 Source Server         : PostgreSQL-local
 Source Server Type    : PostgreSQL
 Source Server Version : 100017
 Source Host           : localhost:5432
 Source Catalog        : tlv8-vue
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 100017
 File Encoding         : 65001

 Date: 23/11/2024 21:19:23
*/


-- ----------------------------
-- Table structure for bo_blog
-- ----------------------------
DROP TABLE IF EXISTS "public"."bo_blog";
CREATE TABLE "public"."bo_blog" (
  "fid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "entry_number" int4,
  "recent_number" int4,
  "recent_entry_number" int4,
  "status" int4,
  "comment_audit" varchar(100) COLLATE "pg_catalog"."default",
  "openscope" varchar(100) COLLATE "pg_catalog"."default",
  "setting" varchar(100) COLLATE "pg_catalog"."default",
  "blogcategory" varchar(100) COLLATE "pg_catalog"."default",
  "chairman" varchar(100) COLLATE "pg_catalog"."default",
  "chairman_id" varchar(100) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of bo_blog
-- ----------------------------
INSERT INTO "public"."bo_blog" VALUES ('F26E62B825374E1485D7CFB30DC88A26', '电动汽车的未来', '聊一聊电动汽车', 1, NULL, NULL, 0, '否', NULL, '允许匿名', '科技', 'system', 'PSN01', 1);

-- ----------------------------
-- Table structure for bo_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."bo_category";
CREATE TABLE "public"."bo_category" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "display_order" int4,
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "fmasterid" varchar(100) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of bo_category
-- ----------------------------
INSERT INTO "public"."bo_category" VALUES ('CAAC7ED134A000017E191C2ED3D07A30', '科技', 1, '科技频道，畅想未来！', NULL, 1);

-- ----------------------------
-- Table structure for bo_comment
-- ----------------------------
DROP TABLE IF EXISTS "public"."bo_comment";
CREATE TABLE "public"."bo_comment" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "author" varchar(100) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "content" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6),
  "entry_id" varchar(100) COLLATE "pg_catalog"."default",
  "entry_title" varchar(100) COLLATE "pg_catalog"."default",
  "ip" varchar(100) COLLATE "pg_catalog"."default",
  "status" int4,
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."bo_comment"."author" IS '回复人';
COMMENT ON COLUMN "public"."bo_comment"."email" IS '邮箱';
COMMENT ON COLUMN "public"."bo_comment"."content" IS '回复内容';
COMMENT ON COLUMN "public"."bo_comment"."created_time" IS '回复时间';
COMMENT ON COLUMN "public"."bo_comment"."entry_id" IS '帖子ID';
COMMENT ON COLUMN "public"."bo_comment"."entry_title" IS '帖子标题';
COMMENT ON COLUMN "public"."bo_comment"."ip" IS 'IP';
COMMENT ON COLUMN "public"."bo_comment"."status" IS '状态';

-- ----------------------------
-- Records of bo_comment
-- ----------------------------

-- ----------------------------
-- Table structure for bo_entry
-- ----------------------------
DROP TABLE IF EXISTS "public"."bo_entry";
CREATE TABLE "public"."bo_entry" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(100) COLLATE "pg_catalog"."default",
  "content" text COLLATE "pg_catalog"."default",
  "category_id" varchar(100) COLLATE "pg_catalog"."default",
  "category_name" varchar(100) COLLATE "pg_catalog"."default",
  "comment_hit" int4,
  "allow_comment" int4,
  "status" int4 DEFAULT 0,
  "created_time" timestamp(6),
  "updated_time" timestamp(6),
  "hits" int4,
  "bo_blogid" varchar(100) COLLATE "pg_catalog"."default",
  "accessories" varchar(1024) COLLATE "pg_catalog"."default",
  "fextend01" varchar(1024) COLLATE "pg_catalog"."default",
  "oneself" varchar(100) COLLATE "pg_catalog"."default",
  "creatorid" varchar(100) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of bo_entry
-- ----------------------------
INSERT INTO "public"."bo_entry" VALUES ('F07BE5C9C5E1465A86E2BBF87036C873', '小米汽车', '小米汽车定价', NULL, '科技', NULL, NULL, 0, '2024-03-21 13:50:26', NULL, NULL, NULL, NULL, NULL, 'system', 'PSN01', 1);

-- ----------------------------
-- Table structure for doc_admin
-- ----------------------------
DROP TABLE IF EXISTS "public"."doc_admin";
CREATE TABLE "public"."doc_admin" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fleve" int4,
  "fname" varchar(500) COLLATE "pg_catalog"."default",
  "version" int4
)
;

-- ----------------------------
-- Records of doc_admin
-- ----------------------------

-- ----------------------------
-- Table structure for doc_author
-- ----------------------------
DROP TABLE IF EXISTS "public"."doc_author";
CREATE TABLE "public"."doc_author" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fuserid" varchar(32) COLLATE "pg_catalog"."default",
  "famleve" int4,
  "version" int4
)
;

-- ----------------------------
-- Records of doc_author
-- ----------------------------

-- ----------------------------
-- Table structure for doc_docpath
-- ----------------------------
DROP TABLE IF EXISTS "public"."doc_docpath";
CREATE TABLE "public"."doc_docpath" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "ffileid" varchar(32) COLLATE "pg_catalog"."default",
  "ffilepath" varchar(200) COLLATE "pg_catalog"."default",
  "ffilesize" float8,
  "fversion" int4,
  "faddtime" timestamp(6),
  "version" int4
)
;

-- ----------------------------
-- Records of doc_docpath
-- ----------------------------
INSERT INTO "public"."doc_docpath" VALUES ('E9FDAADB5A7B4DC28E4C4A2250E13676', '47-root', '2024/03/04/10/19', 17774, 1, '2024-03-04 10:19:19.365', 0);
INSERT INTO "public"."doc_docpath" VALUES ('ACC642D7038B46A6A55791BD35411578', '48-root', '2024/03/04/11/26', 17774, 1, '2024-03-04 11:26:49.634', 0);
INSERT INTO "public"."doc_docpath" VALUES ('48914928D0FC46BA888B1CB89D4A9A76', '49-root', '2024/03/05/15/58', 24067, 1, '2024-03-05 15:58:25.366', 0);
INSERT INTO "public"."doc_docpath" VALUES ('2078071EC3C04F62B089F8EC65C2827C', '50-root', '2024/03/05/15/59', 24067, 1, '2024-03-05 15:59:31.697', 0);
INSERT INTO "public"."doc_docpath" VALUES ('F3FD1A3EDC4646DD8BEB80D7F2896C84', '51-root', '2024/03/06/10/26', 24067, 1, '2024-03-06 10:26:17.811', 0);
INSERT INTO "public"."doc_docpath" VALUES ('EA912F34899B493EB61BC9A3D174DC65', '52-root', '2024/03/06/10/27', 24067, 1, '2024-03-06 10:27:05.089', 0);
INSERT INTO "public"."doc_docpath" VALUES ('AC1105AE01194D3CA7460413A110B38D', '54-root', '2024/03/06/15/42', 457809, 1, '2024-03-06 15:42:14.284', 0);
INSERT INTO "public"."doc_docpath" VALUES ('C169EA1DB24745718AB19B4BA82AA87E', '55-root', '2024/03/06/15/42', 14349, 1, '2024-03-06 15:42:29.085', 0);
INSERT INTO "public"."doc_docpath" VALUES ('E6598947DF774C86866E6F4ACA6A02ED', '56-root', '2024/03/06/15/52', 14349, 1, '2024-03-06 15:52:34.913', 0);
INSERT INTO "public"."doc_docpath" VALUES ('CCB95DE53E954D7B98B32E9A5BEC85C5', '57-root', '2024/03/06/15/53', 12232, 1, '2024-03-06 15:53:13.444', 0);
INSERT INTO "public"."doc_docpath" VALUES ('75F6F4FFF7374071B7B03EB45A833EAF', '58-root', '2024/03/06/15/53', 12232, 1, '2024-03-06 15:53:46.604', 0);
INSERT INTO "public"."doc_docpath" VALUES ('A64B33C02A8E4FDBBD4CD8A619322DC2', '59-root', '2024/03/07/10/55', 12232, 1, '2024-03-07 10:55:21.453', 0);
INSERT INTO "public"."doc_docpath" VALUES ('9AADC6D9E9414E4AA4E9251DAADDC694', '60-root', '2024/03/07/10/57', 14349, 1, '2024-03-07 10:57:41.405', 0);
INSERT INTO "public"."doc_docpath" VALUES ('8CA84CDCA36B4C9595C71851298FEFB7', '61-root', '2024/03/07/11/00', 14349, 1, '2024-03-07 11:00:52.534', 0);
INSERT INTO "public"."doc_docpath" VALUES ('62B3BB4B6B0E408AB1E6427EE303DADF', '62-root', '2024/03/07/11/03', 14349, 1, '2024-03-07 11:03:12.423', 0);
INSERT INTO "public"."doc_docpath" VALUES ('A150B1A61FE94BADA58A84BEB1613067', '63-root', '2024/03/18/14/58', 24067, 1, '2024-03-18 14:58:31.087', 0);
INSERT INTO "public"."doc_docpath" VALUES ('501E207B576A4F738D029315C399142B', '64-root', '2024/03/20/14/36', 12232, 1, '2024-03-20 14:36:20.928', 0);
INSERT INTO "public"."doc_docpath" VALUES ('C9B260DAD7334E7DBC6E6BD7342E1DAA', '65-root', '2024/03/20/15/29', 24020, 1, '2024-03-20 15:29:36.207', 0);
INSERT INTO "public"."doc_docpath" VALUES ('94ADDDB6755844F4B56C35C31FC75200', '66-root', '2024/03/21/11/22', 24020, 1, '2024-03-21 11:22:04.195', 0);

-- ----------------------------
-- Table structure for doc_document
-- ----------------------------
DROP TABLE IF EXISTS "public"."doc_document";
CREATE TABLE "public"."doc_document" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fdocid" varchar(32) COLLATE "pg_catalog"."default",
  "fdocname" varchar(1000) COLLATE "pg_catalog"."default",
  "fextname" varchar(100) COLLATE "pg_catalog"."default",
  "fdocsize" float8,
  "fdoctype" varchar(100) COLLATE "pg_catalog"."default",
  "faddtime" timestamp(6),
  "fupdatetime" timestamp(6),
  "version" int4
)
;

-- ----------------------------
-- Records of doc_document
-- ----------------------------

-- ----------------------------
-- Table structure for doc_index
-- ----------------------------
DROP TABLE IF EXISTS "public"."doc_index";
CREATE TABLE "public"."doc_index" (
  "fmax" int8
)
;

-- ----------------------------
-- Records of doc_index
-- ----------------------------
INSERT INTO "public"."doc_index" VALUES (66);

-- ----------------------------
-- Table structure for doc_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."doc_log";
CREATE TABLE "public"."doc_log" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fuserid" varchar(32) COLLATE "pg_catalog"."default",
  "faddtime" timestamp(6),
  "faction" varchar(100) COLLATE "pg_catalog"."default",
  "fmessage" text COLLATE "pg_catalog"."default",
  "version" int4
)
;

-- ----------------------------
-- Records of doc_log
-- ----------------------------

-- ----------------------------
-- Table structure for doc_pathindex
-- ----------------------------
DROP TABLE IF EXISTS "public"."doc_pathindex";
CREATE TABLE "public"."doc_pathindex" (
  "fdocpath" varchar(200) COLLATE "pg_catalog"."default",
  "fmax" int4
)
;

-- ----------------------------
-- Records of doc_pathindex
-- ----------------------------

-- ----------------------------
-- Table structure for doc_result
-- ----------------------------
DROP TABLE IF EXISTS "public"."doc_result";
CREATE TABLE "public"."doc_result" (
  "resultid" varchar(500) COLLATE "pg_catalog"."default",
  "resultcontent" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of doc_result
-- ----------------------------

-- ----------------------------
-- Table structure for doc_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."doc_user";
CREATE TABLE "public"."doc_user" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "floginid" varchar(100) COLLATE "pg_catalog"."default",
  "fusername" varchar(100) COLLATE "pg_catalog"."default",
  "fenable" int4,
  "version" int4
)
;

-- ----------------------------
-- Records of doc_user
-- ----------------------------

-- ----------------------------
-- Table structure for im_fileinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."im_fileinfo";
CREATE TABLE "public"."im_fileinfo" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(1000) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "savetype" int4,
  "saveinfo" varchar(2048) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "fsize" text COLLATE "pg_catalog"."default",
  "folderid" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;

-- ----------------------------
-- Records of im_fileinfo
-- ----------------------------

-- ----------------------------
-- Table structure for im_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."im_group";
CREATE TABLE "public"."im_group" (
  "id" varchar(65) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(1000) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "head" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "creator" varchar(125) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;

-- ----------------------------
-- Records of im_group
-- ----------------------------

-- ----------------------------
-- Table structure for im_group_memli
-- ----------------------------
DROP TABLE IF EXISTS "public"."im_group_memli";
CREATE TABLE "public"."im_group_memli" (
  "id" varchar(65) COLLATE "pg_catalog"."default" NOT NULL,
  "groupid" varchar(65) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "userid" varchar(65) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;

-- ----------------------------
-- Records of im_group_memli
-- ----------------------------

-- ----------------------------
-- Table structure for im_header
-- ----------------------------
DROP TABLE IF EXISTS "public"."im_header";
CREATE TABLE "public"."im_header" (
  "userid" varchar(65) COLLATE "pg_catalog"."default" NOT NULL,
  "head" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;

-- ----------------------------
-- Records of im_header
-- ----------------------------

-- ----------------------------
-- Table structure for im_message
-- ----------------------------
DROP TABLE IF EXISTS "public"."im_message";
CREATE TABLE "public"."im_message" (
  "mid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "mcontenttype" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "mcontent" text COLLATE "pg_catalog"."default",
  "mfrom" varchar(65) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "mto" varchar(65) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "mstate" int4 DEFAULT 0,
  "isgroup" int4 DEFAULT 0,
  "msendtime" timestamp(6)
)
;

-- ----------------------------
-- Records of im_message
-- ----------------------------
INSERT INTO "public"."im_message" VALUES ('FF229591BE254B708B97463699D33088', 'content', '[{"text":"11"}]', 'PSN01', 'DC349D31F5FE4113ABA2BBC06B1E42D7', 1, 0, '2024-11-21 22:41:48.384');
INSERT INTO "public"."im_message" VALUES ('C47C108FEC7F49C29D991D3454D03E4B', 'content', '[{"text":"22"}]', 'DC349D31F5FE4113ABA2BBC06B1E42D7', 'PSN01', 0, 0, '2024-11-21 22:44:30.624');

-- ----------------------------
-- Table structure for im_message_memli
-- ----------------------------
DROP TABLE IF EXISTS "public"."im_message_memli";
CREATE TABLE "public"."im_message_memli" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "mid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "tid" varchar(65) COLLATE "pg_catalog"."default" NOT NULL,
  "state" int4 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Records of im_message_memli
-- ----------------------------

-- ----------------------------
-- Table structure for oa_adm_mygroupfrom
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_adm_mygroupfrom";
CREATE TABLE "public"."oa_adm_mygroupfrom" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fcreatorid" varchar(100) COLLATE "pg_catalog"."default",
  "fcreator" varchar(100) COLLATE "pg_catalog"."default",
  "fcreatedeptid" varchar(100) COLLATE "pg_catalog"."default",
  "fcreatedept" varchar(100) COLLATE "pg_catalog"."default",
  "fcreatedate" timestamp(0),
  "foutkey" varchar(32) COLLATE "pg_catalog"."default",
  "fpersonid" varchar(32) COLLATE "pg_catalog"."default",
  "fpersonname" varchar(200) COLLATE "pg_catalog"."default",
  "version" int4
)
;
COMMENT ON COLUMN "public"."oa_adm_mygroupfrom"."fcreatorid" IS '创建人ID';
COMMENT ON COLUMN "public"."oa_adm_mygroupfrom"."fcreator" IS '创建人';
COMMENT ON COLUMN "public"."oa_adm_mygroupfrom"."fcreatedeptid" IS '创建部门ID';
COMMENT ON COLUMN "public"."oa_adm_mygroupfrom"."fcreatedept" IS '创建部门';
COMMENT ON COLUMN "public"."oa_adm_mygroupfrom"."fcreatedate" IS '创建时间';
COMMENT ON COLUMN "public"."oa_adm_mygroupfrom"."foutkey" IS '群组ID';
COMMENT ON COLUMN "public"."oa_adm_mygroupfrom"."fpersonid" IS '成员ID';
COMMENT ON COLUMN "public"."oa_adm_mygroupfrom"."fpersonname" IS '成员名称';

-- ----------------------------
-- Records of oa_adm_mygroupfrom
-- ----------------------------
INSERT INTO "public"."oa_adm_mygroupfrom" VALUES ('CAABE4DB3FA00001168635101E7715CD', 'PSN01', 'system', NULL, NULL, '2024-03-19 15:26:34', '7D03AA29686542A2AAAFA06FB123EF14', 'DC349D31F5FE4113ABA2BBC06B1E42D7', '测试人员1', 1);
INSERT INTO "public"."oa_adm_mygroupfrom" VALUES ('CAABE4DB3A20000175A7106216C010BD', 'PSN01', 'system', NULL, NULL, '2024-03-19 15:26:34', '7D03AA29686542A2AAAFA06FB123EF14', '45BB9FCAF8394E43B45A55CF564F9CCD', '测试人员2', 1);

-- ----------------------------
-- Table structure for oa_adm_mygroupmain
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_adm_mygroupmain";
CREATE TABLE "public"."oa_adm_mygroupmain" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fcreatorid" varchar(100) COLLATE "pg_catalog"."default",
  "fcreator" varchar(100) COLLATE "pg_catalog"."default",
  "fcreatedeptid" varchar(100) COLLATE "pg_catalog"."default",
  "fcreatedept" varchar(100) COLLATE "pg_catalog"."default",
  "fcreatedate" timestamp(0),
  "fgroupname" varchar(200) COLLATE "pg_catalog"."default",
  "version" int4
)
;
COMMENT ON COLUMN "public"."oa_adm_mygroupmain"."fcreatorid" IS '创建人员ID';
COMMENT ON COLUMN "public"."oa_adm_mygroupmain"."fcreator" IS '创建人';
COMMENT ON COLUMN "public"."oa_adm_mygroupmain"."fcreatedeptid" IS '创建人部门ID';
COMMENT ON COLUMN "public"."oa_adm_mygroupmain"."fcreatedept" IS '创建部门';
COMMENT ON COLUMN "public"."oa_adm_mygroupmain"."fcreatedate" IS '创建时间';
COMMENT ON COLUMN "public"."oa_adm_mygroupmain"."fgroupname" IS '群组名称';

-- ----------------------------
-- Records of oa_adm_mygroupmain
-- ----------------------------
INSERT INTO "public"."oa_adm_mygroupmain" VALUES ('7D03AA29686542A2AAAFA06FB123EF14', 'PSN01', 'system', NULL, NULL, '2024-03-19 15:26:19', '测试群组', 1);

-- ----------------------------
-- Table structure for oa_em_receiveemail
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_em_receiveemail";
CREATE TABLE "public"."oa_em_receiveemail" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "femailname" varchar(200) COLLATE "pg_catalog"."default",
  "ftext" text COLLATE "pg_catalog"."default",
  "ffjid" varchar(4000) COLLATE "pg_catalog"."default",
  "fsendpername" varchar(100) COLLATE "pg_catalog"."default",
  "fsendperid" varchar(100) COLLATE "pg_catalog"."default",
  "freplystate" varchar(100) COLLATE "pg_catalog"."default",
  "fqurey" varchar(100) COLLATE "pg_catalog"."default",
  "fconsignee" varchar(100) COLLATE "pg_catalog"."default",
  "fconsigneeid" varchar(100) COLLATE "pg_catalog"."default",
  "fconsigneecode" varchar(100) COLLATE "pg_catalog"."default",
  "fsendtime" timestamp(6),
  "fsendpercode" varchar(100) COLLATE "pg_catalog"."default",
  "fsendogn" varchar(100) COLLATE "pg_catalog"."default",
  "fsenddept" varchar(100) COLLATE "pg_catalog"."default",
  "fcollect" varchar(10) COLLATE "pg_catalog"."default" DEFAULT '0'::character varying,
  "version" int4
)
;
COMMENT ON COLUMN "public"."oa_em_receiveemail"."femailname" IS '邮件标题';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."ftext" IS '邮件内容';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."ffjid" IS '附件';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."fsendpername" IS '发送名称';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."fsendperid" IS '发送人ID';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."freplystate" IS '接收状态';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."fqurey" IS '查看状态';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."fconsignee" IS '收件人';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."fconsigneeid" IS '收件人ID';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."fconsigneecode" IS '收件人编码';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."fsendtime" IS '发送时间';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."fsendpercode" IS '发送人编码';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."fsendogn" IS '发送机构';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."fsenddept" IS '发送部门';
COMMENT ON COLUMN "public"."oa_em_receiveemail"."fcollect" IS 'COLLECT';
COMMENT ON TABLE "public"."oa_em_receiveemail" IS '收件箱';

-- ----------------------------
-- Records of oa_em_receiveemail
-- ----------------------------

-- ----------------------------
-- Table structure for oa_em_sendemail
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_em_sendemail";
CREATE TABLE "public"."oa_em_sendemail" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "femailname" varchar(200) COLLATE "pg_catalog"."default",
  "fconsignee" text COLLATE "pg_catalog"."default",
  "ftext" text COLLATE "pg_catalog"."default",
  "fstate" varchar(100) COLLATE "pg_catalog"."default",
  "fconsigneeid" text COLLATE "pg_catalog"."default",
  "fconsigneecode" text COLLATE "pg_catalog"."default",
  "ffjid" varchar(4000) COLLATE "pg_catalog"."default",
  "fsendpername" varchar(100) COLLATE "pg_catalog"."default",
  "fsendperid" varchar(100) COLLATE "pg_catalog"."default",
  "fcreattime" timestamp(6),
  "fsendtime" timestamp(6),
  "fsendpercode" varchar(100) COLLATE "pg_catalog"."default",
  "fsendogn" varchar(100) COLLATE "pg_catalog"."default",
  "fsenddept" varchar(100) COLLATE "pg_catalog"."default",
  "fcollect" varchar(10) COLLATE "pg_catalog"."default" DEFAULT '0'::character varying,
  "version" int4
)
;
COMMENT ON COLUMN "public"."oa_em_sendemail"."femailname" IS '邮件标题';
COMMENT ON COLUMN "public"."oa_em_sendemail"."fconsignee" IS '收件人';
COMMENT ON COLUMN "public"."oa_em_sendemail"."ftext" IS '邮件内容';
COMMENT ON COLUMN "public"."oa_em_sendemail"."fstate" IS '发送状态';
COMMENT ON COLUMN "public"."oa_em_sendemail"."fconsigneeid" IS '收件人ID';
COMMENT ON COLUMN "public"."oa_em_sendemail"."fconsigneecode" IS '收件人编码';
COMMENT ON COLUMN "public"."oa_em_sendemail"."ffjid" IS '附件';
COMMENT ON COLUMN "public"."oa_em_sendemail"."fsendpername" IS '发件人';
COMMENT ON COLUMN "public"."oa_em_sendemail"."fsendperid" IS '发件人ID';
COMMENT ON COLUMN "public"."oa_em_sendemail"."fcreattime" IS '创建时间';
COMMENT ON COLUMN "public"."oa_em_sendemail"."fsendtime" IS '发送时间';
COMMENT ON COLUMN "public"."oa_em_sendemail"."fsendpercode" IS '发件人编码';
COMMENT ON COLUMN "public"."oa_em_sendemail"."fsendogn" IS '发送机构';
COMMENT ON COLUMN "public"."oa_em_sendemail"."fsenddept" IS '发送部门';
COMMENT ON COLUMN "public"."oa_em_sendemail"."fcollect" IS 'COLLECT';
COMMENT ON TABLE "public"."oa_em_sendemail" IS '发件箱';

-- ----------------------------
-- Records of oa_em_sendemail
-- ----------------------------

-- ----------------------------
-- Table structure for oa_flowconclusion
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_flowconclusion";
CREATE TABLE "public"."oa_flowconclusion" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fconclusionname" varchar(4000) COLLATE "pg_catalog"."default",
  "forder" int4,
  "fcreatorid" varchar(100) COLLATE "pg_catalog"."default",
  "fcreator" varchar(100) COLLATE "pg_catalog"."default",
  "version" int4
)
;
COMMENT ON COLUMN "public"."oa_flowconclusion"."fconclusionname" IS '审批意见';
COMMENT ON COLUMN "public"."oa_flowconclusion"."forder" IS '排序';
COMMENT ON COLUMN "public"."oa_flowconclusion"."fcreatorid" IS '创建人ID';
COMMENT ON COLUMN "public"."oa_flowconclusion"."fcreator" IS '创建人';
COMMENT ON TABLE "public"."oa_flowconclusion" IS '常用审批意见';

-- ----------------------------
-- Records of oa_flowconclusion
-- ----------------------------
INSERT INTO "public"."oa_flowconclusion" VALUES ('78BB6847EF4249DCB144580BDF869911', '同意', 1, 'PSN01', 'system', 1);
INSERT INTO "public"."oa_flowconclusion" VALUES ('BCF65903FC704F18BC9E8B322DFFC088', '已阅', 2, 'PSN01', 'system', 1);

-- ----------------------------
-- Table structure for oa_flowrecord
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_flowrecord";
CREATE TABLE "public"."oa_flowrecord" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fnodename" varchar(100) COLLATE "pg_catalog"."default",
  "fagreetext" varchar(4000) COLLATE "pg_catalog"."default",
  "fcreatepername" varchar(100) COLLATE "pg_catalog"."default",
  "fcreatedeptname" varchar(100) COLLATE "pg_catalog"."default",
  "fcreatetime" timestamp(6),
  "fbillid" varchar(32) COLLATE "pg_catalog"."default",
  "fcreatedeptid" varchar(100) COLLATE "pg_catalog"."default",
  "fcreateperid" varchar(100) COLLATE "pg_catalog"."default",
  "fnodeid" varchar(100) COLLATE "pg_catalog"."default",
  "fopviewid" varchar(100) COLLATE "pg_catalog"."default",
  "ftaskid" varchar(100) COLLATE "pg_catalog"."default",
  "fflowid" varchar(100) COLLATE "pg_catalog"."default",
  "fsign" text COLLATE "pg_catalog"."default",
  "fremark" varchar(255) COLLATE "pg_catalog"."default",
  "version" int4
)
;
COMMENT ON COLUMN "public"."oa_flowrecord"."fnodename" IS '环节名称';
COMMENT ON COLUMN "public"."oa_flowrecord"."fagreetext" IS '审批意见';
COMMENT ON COLUMN "public"."oa_flowrecord"."fcreatepername" IS '审批人';
COMMENT ON COLUMN "public"."oa_flowrecord"."fcreatedeptname" IS '审批部门';
COMMENT ON COLUMN "public"."oa_flowrecord"."fcreatetime" IS '审批时间';
COMMENT ON COLUMN "public"."oa_flowrecord"."fbillid" IS '业务ID';
COMMENT ON COLUMN "public"."oa_flowrecord"."fcreatedeptid" IS '审批部门ID';
COMMENT ON COLUMN "public"."oa_flowrecord"."fcreateperid" IS '审批人ID';
COMMENT ON COLUMN "public"."oa_flowrecord"."fnodeid" IS '环节标识';
COMMENT ON COLUMN "public"."oa_flowrecord"."fopviewid" IS '显示位置div id';
COMMENT ON COLUMN "public"."oa_flowrecord"."ftaskid" IS '任务id';
COMMENT ON COLUMN "public"."oa_flowrecord"."fflowid" IS '流程id';
COMMENT ON COLUMN "public"."oa_flowrecord"."fsign" IS '签名';
COMMENT ON COLUMN "public"."oa_flowrecord"."fremark" IS '备注';
COMMENT ON TABLE "public"."oa_flowrecord" IS '审批记录';

-- ----------------------------
-- Records of oa_flowrecord
-- ----------------------------
INSERT INTO "public"."oa_flowrecord" VALUES ('B6DD63F558B7441E856FE958EDFF5E82', 'bizActivity4', '同意', 'system', '', '2024-03-04 09:55:23.434', '5DED8CED0A9F48C1818D116BBD21559E', '', 'PSN01', 'bizActivity4', 'opts', 'E985BA1782104968A2D0BFA804EFC699', '153636D70465410FA166097E6E74A7DC', '', '', 0);
INSERT INTO "public"."oa_flowrecord" VALUES ('5E0E8901C273493B9FE4E5E3B3DDBD3B', 'bizActivity6', '已阅', 'system', '', '2024-03-04 11:57:25.351', '5DED8CED0A9F48C1818D116BBD21559E', '', 'PSN01', 'bizActivity6', 'opts', '8975DE9A89884850B581077AB0AB3D32', '153636D70465410FA166097E6E74A7DC', '', '', 0);

-- ----------------------------
-- Table structure for oa_leave
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_leave";
CREATE TABLE "public"."oa_leave" (
  "fid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "fcreatorname" varchar(255) COLLATE "pg_catalog"."default",
  "fcreatorid" varchar(36) COLLATE "pg_catalog"."default",
  "fcreatorfid" varchar(500) COLLATE "pg_catalog"."default",
  "fcreatorfname" varchar(1000) COLLATE "pg_catalog"."default",
  "fcreatedate" timestamp(6),
  "fstartdate" date,
  "fenddate" date,
  "fday" int4,
  "fleavetype" varchar(255) COLLATE "pg_catalog"."default",
  "fstate" varchar(50) COLLATE "pg_catalog"."default",
  "freason" varchar(500) COLLATE "pg_catalog"."default",
  "version" int4
)
;

-- ----------------------------
-- Records of oa_leave
-- ----------------------------
INSERT INTO "public"."oa_leave" VALUES ('08002CF2B6994F5C957B14520C93E39E', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-01 11:15:14', NULL, NULL, NULL, '事假', NULL, NULL, 17);
INSERT INTO "public"."oa_leave" VALUES ('87658B0C52B3426685F4B75EFB41ACAC', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-01 14:12:24', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO "public"."oa_leave" VALUES ('771FB983112A4F4C8E68BBDCDFBFAFA1', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-01 14:25:44', NULL, NULL, NULL, '事假', NULL, NULL, 2);
INSERT INTO "public"."oa_leave" VALUES ('EC64552AC26F42A3AD8CE67C71213481', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-01 14:31:12', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO "public"."oa_leave" VALUES ('5DED8CED0A9F48C1818D116BBD21559E', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-01 14:36:48', NULL, NULL, NULL, '事假', NULL, NULL, 8);
INSERT INTO "public"."oa_leave" VALUES ('C4BDABFC0493439F86180500AA988D06', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-05 11:46:40', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO "public"."oa_leave" VALUES ('A77BB11A28BF4156A70746179CDB086E', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-06 12:27:31', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO "public"."oa_leave" VALUES ('76CD91F430294D35822ACA7533120427', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-06 12:37:58', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO "public"."oa_leave" VALUES ('165DF15A41044EAA85DF648F4C62D4D3', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-06 12:45:49', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO "public"."oa_leave" VALUES ('3A444A2B0A164B349FE0305B96B875FC', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-10-18 14:46:06', NULL, NULL, NULL, '事假', NULL, NULL, 1);
INSERT INTO "public"."oa_leave" VALUES ('69FB950E3D5045978EB3D0D042F0AEC2', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-06 12:47:47', NULL, NULL, NULL, '事假', NULL, NULL, 5);
INSERT INTO "public"."oa_leave" VALUES ('D9F40DD3A388405DBAB2F6C5E2393CEF', 'system', 'PSN01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-10-18 14:59:01', NULL, NULL, NULL, '事假', NULL, NULL, 1);

-- ----------------------------
-- Table structure for oa_news_column
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_news_column";
CREATE TABLE "public"."oa_news_column" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fcolumncode" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "fcolumnname" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "fcolumndescribes" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "fcolumnstate" varchar(50) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "version" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of oa_news_column
-- ----------------------------

-- ----------------------------
-- Table structure for oa_news_count
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_news_count";
CREATE TABLE "public"."oa_news_count" (
  "fid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "news_number" int4 DEFAULT 0,
  "news_person" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "news_personid" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "news_releaseid" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "yetperson" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "yetpersonid" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "version" int4
)
;

-- ----------------------------
-- Records of oa_news_count
-- ----------------------------

-- ----------------------------
-- Table structure for oa_news_open
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_news_open";
CREATE TABLE "public"."oa_news_open" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fopenid" varchar(100) COLLATE "pg_catalog"."default",
  "fopenname" varchar(255) COLLATE "pg_catalog"."default",
  "fnewsid" varchar(32) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of oa_news_open
-- ----------------------------

-- ----------------------------
-- Table structure for oa_news_release
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_news_release";
CREATE TABLE "public"."oa_news_release" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fnewstitle" varchar(200) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "freleasedepartment" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "fpeople" varchar(50) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ftime" timestamp(6),
  "fnewsnumber" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "freleaseconnext" text COLLATE "pg_catalog"."default",
  "fstate" varchar(20) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "fsettopwhether" varchar(10) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "fsettoptime" timestamp(6),
  "fsetendtime" timestamp(6),
  "faccessories" varchar(1024) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "fcolumnname" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sminipic" bytea,
  "ftype" varchar(100) COLLATE "pg_catalog"."default",
  "version" int4
)
;
COMMENT ON COLUMN "public"."oa_news_release"."fnewstitle" IS '新闻标题';
COMMENT ON COLUMN "public"."oa_news_release"."freleasedepartment" IS '发布部门';
COMMENT ON COLUMN "public"."oa_news_release"."fpeople" IS '发布人';
COMMENT ON COLUMN "public"."oa_news_release"."ftime" IS '发布时间';
COMMENT ON COLUMN "public"."oa_news_release"."fnewsnumber" IS '新闻编号';
COMMENT ON COLUMN "public"."oa_news_release"."freleaseconnext" IS '新闻内容';
COMMENT ON COLUMN "public"."oa_news_release"."fstate" IS '状态';
COMMENT ON COLUMN "public"."oa_news_release"."fsettopwhether" IS '置顶';
COMMENT ON COLUMN "public"."oa_news_release"."fsettoptime" IS '置顶开始时间';
COMMENT ON COLUMN "public"."oa_news_release"."fsetendtime" IS '置顶结束时间';
COMMENT ON COLUMN "public"."oa_news_release"."faccessories" IS '权限';
COMMENT ON COLUMN "public"."oa_news_release"."fcolumnname" IS '栏目名称';
COMMENT ON COLUMN "public"."oa_news_release"."sminipic" IS '缩略图';
COMMENT ON COLUMN "public"."oa_news_release"."ftype" IS '发布类型';

-- ----------------------------
-- Records of oa_news_release
-- ----------------------------

-- ----------------------------
-- Table structure for oa_notice_person
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_notice_person";
CREATE TABLE "public"."oa_notice_person" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fognid" varchar(64) COLLATE "pg_catalog"."default",
  "fognname" varchar(200) COLLATE "pg_catalog"."default",
  "forgid" varchar(64) COLLATE "pg_catalog"."default",
  "forgname" varchar(200) COLLATE "pg_catalog"."default",
  "fcreateid" varchar(64) COLLATE "pg_catalog"."default",
  "fcreatename" varchar(200) COLLATE "pg_catalog"."default",
  "fcreatedatetime" timestamp(6),
  "fpersonid" varchar(64) COLLATE "pg_catalog"."default",
  "fpersonname" varchar(200) COLLATE "pg_catalog"."default",
  "freaddate" timestamp(6),
  "fpersonfname" varchar(500) COLLATE "pg_catalog"."default",
  "fmainid" varchar(32) COLLATE "pg_catalog"."default",
  "fbrowse" varchar(5) COLLATE "pg_catalog"."default",
  "fdeptname" varchar(100) COLLATE "pg_catalog"."default",
  "fdeptid" varchar(100) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of oa_notice_person
-- ----------------------------
INSERT INTO "public"."oa_notice_person" VALUES ('F1572428C0A743759F5DCC3048DD99D8', 'ORG01', '管理员', 'ORG01', '管理员', 'PSN01', 'system', '2024-03-20 14:51:30.684', 'PSN01', 'system', '2024-03-20 14:51:30.684', '/管理员/system', 'CF2A44B39A4040DF850CC8CBF20D7565', '是', '', '', NULL);

-- ----------------------------
-- Table structure for oa_pulicnotice
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_pulicnotice";
CREATE TABLE "public"."oa_pulicnotice" (
  "fid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "fognid" varchar(64) COLLATE "pg_catalog"."default",
  "fognname" varchar(200) COLLATE "pg_catalog"."default",
  "forgid" varchar(64) COLLATE "pg_catalog"."default",
  "forgname" varchar(200) COLLATE "pg_catalog"."default",
  "fcreateid" varchar(64) COLLATE "pg_catalog"."default",
  "fcreatename" varchar(200) COLLATE "pg_catalog"."default",
  "fcreatedatetime" timestamp(0),
  "fpushdatetime" timestamp(0),
  "ftitle" varchar(200) COLLATE "pg_catalog"."default",
  "fcontent" text COLLATE "pg_catalog"."default",
  "fcreatedate" timestamp(0),
  "fpushid" varchar(64) COLLATE "pg_catalog"."default",
  "fpushname" varchar(200) COLLATE "pg_catalog"."default",
  "ftype" varchar(100) COLLATE "pg_catalog"."default",
  "fattfile" varchar(400) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."oa_pulicnotice"."fognid" IS '创建人机构ID';
COMMENT ON COLUMN "public"."oa_pulicnotice"."fognname" IS '创建人机构名称';
COMMENT ON COLUMN "public"."oa_pulicnotice"."forgid" IS '创建人组织ID';
COMMENT ON COLUMN "public"."oa_pulicnotice"."forgname" IS '创建人组织名称';
COMMENT ON COLUMN "public"."oa_pulicnotice"."fcreateid" IS '创建人ID';
COMMENT ON COLUMN "public"."oa_pulicnotice"."fcreatename" IS '创建人名称';
COMMENT ON COLUMN "public"."oa_pulicnotice"."fcreatedatetime" IS '创建时间';
COMMENT ON COLUMN "public"."oa_pulicnotice"."fpushdatetime" IS '发布时间';
COMMENT ON COLUMN "public"."oa_pulicnotice"."ftitle" IS '标题';
COMMENT ON COLUMN "public"."oa_pulicnotice"."fcontent" IS '内容';
COMMENT ON COLUMN "public"."oa_pulicnotice"."fcreatedate" IS '创建日期';
COMMENT ON COLUMN "public"."oa_pulicnotice"."fpushid" IS '发布ID';
COMMENT ON COLUMN "public"."oa_pulicnotice"."fpushname" IS '发布人';
COMMENT ON COLUMN "public"."oa_pulicnotice"."ftype" IS '发布类型';
COMMENT ON COLUMN "public"."oa_pulicnotice"."fattfile" IS '附件';

-- ----------------------------
-- Records of oa_pulicnotice
-- ----------------------------
INSERT INTO "public"."oa_pulicnotice" VALUES ('CF2A44B39A4040DF850CC8CBF20D7565', 'ORG01', '管理员', 'ORG01', '管理员', 'PSN01', 'system', '2024-03-20 14:43:01', '2024-03-20 14:50:56', '测试通知', '测试通知内容', '2024-03-20 14:43:01', 'PSN01', 'system', '限制发布', NULL, 2);

-- ----------------------------
-- Table structure for oa_re_dayreport
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_re_dayreport";
CREATE TABLE "public"."oa_re_dayreport" (
  "fid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "ftitle" varchar(1024) COLLATE "pg_catalog"."default",
  "fcreateognid" varchar(64) COLLATE "pg_catalog"."default",
  "fcreateognname" varchar(200) COLLATE "pg_catalog"."default",
  "fcreatedeptid" varchar(64) COLLATE "pg_catalog"."default",
  "fcreatedeptname" varchar(200) COLLATE "pg_catalog"."default",
  "fcreateposid" varchar(64) COLLATE "pg_catalog"."default",
  "fcreateposname" varchar(200) COLLATE "pg_catalog"."default",
  "fcreatepersonid" varchar(64) COLLATE "pg_catalog"."default",
  "fcreatepersonname" varchar(200) COLLATE "pg_catalog"."default",
  "fcreatepersonfid" varchar(1024) COLLATE "pg_catalog"."default",
  "fcreatepersonfname" varchar(2048) COLLATE "pg_catalog"."default",
  "fcreatetime" timestamp(0),
  "fpushdatetime" timestamp(0),
  "ffile" varchar(1000) COLLATE "pg_catalog"."default",
  "fcontext" text COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."oa_re_dayreport"."ftitle" IS '标题';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fcreateognid" IS '创建人机构ID';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fcreateognname" IS '创建人机构名称';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fcreatedeptid" IS '创建人部门ID';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fcreatedeptname" IS '创建人部门名称';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fcreateposid" IS '创建人岗位ID';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fcreateposname" IS '创建人岗位名称';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fcreatepersonid" IS '创建人ID';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fcreatepersonname" IS '创建人名称';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fcreatepersonfid" IS '创建人全ID';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fcreatepersonfname" IS '创建人全名称';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fcreatetime" IS '创建时间';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fpushdatetime" IS '发布时间';
COMMENT ON COLUMN "public"."oa_re_dayreport"."ffile" IS '附件';
COMMENT ON COLUMN "public"."oa_re_dayreport"."fcontext" IS '内容';

-- ----------------------------
-- Records of oa_re_dayreport
-- ----------------------------
INSERT INTO "public"."oa_re_dayreport" VALUES ('CB1747678EB6447DA2820A8D8DAE81AC', '测试个人日志', 'ORG01', '管理员', 'ORG01', '管理员', NULL, NULL, 'PSN01', 'system', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2024-03-19 15:33:44', NULL, NULL, '测试的内容', 2);

-- ----------------------------
-- Table structure for sa_doclog
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_doclog";
CREATE TABLE "public"."sa_doclog" (
  "sid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "spersonname" varchar(64) COLLATE "pg_catalog"."default",
  "saccesstype" varchar(16) COLLATE "pg_catalog"."default",
  "sdocid" varchar(64) COLLATE "pg_catalog"."default",
  "stime" timestamp(6),
  "sdeptname" varchar(64) COLLATE "pg_catalog"."default",
  "spersonfid" varchar(512) COLLATE "pg_catalog"."default",
  "sdocversionid" int4,
  "sdocname" varchar(128) COLLATE "pg_catalog"."default",
  "ssize" float8,
  "version" int4
)
;
COMMENT ON COLUMN "public"."sa_doclog"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_doclog"."spersonname" IS '姓名';
COMMENT ON COLUMN "public"."sa_doclog"."saccesstype" IS '权限类型';
COMMENT ON COLUMN "public"."sa_doclog"."sdocid" IS '文档ID';
COMMENT ON COLUMN "public"."sa_doclog"."stime" IS '操作时间';
COMMENT ON COLUMN "public"."sa_doclog"."sdeptname" IS '部门';
COMMENT ON COLUMN "public"."sa_doclog"."spersonfid" IS '人员ID路径';
COMMENT ON COLUMN "public"."sa_doclog"."sdocversionid" IS '文档版本';
COMMENT ON COLUMN "public"."sa_doclog"."sdocname" IS '文档名称';
COMMENT ON COLUMN "public"."sa_doclog"."ssize" IS '文档大小';
COMMENT ON COLUMN "public"."sa_doclog"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_doclog" IS '文档日志';

-- ----------------------------
-- Records of sa_doclog
-- ----------------------------

-- ----------------------------
-- Table structure for sa_docnamespace
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_docnamespace";
CREATE TABLE "public"."sa_docnamespace" (
  "sid" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "sdisplayname" varchar(256) COLLATE "pg_catalog"."default",
  "shost" varchar(128) COLLATE "pg_catalog"."default",
  "sport" int4,
  "surl" varchar(128) COLLATE "pg_catalog"."default",
  "sflag" int4,
  "shtths" varchar(64) COLLATE "pg_catalog"."default" DEFAULT 'false'::character varying,
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_docnamespace"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_docnamespace"."sdisplayname" IS '显示名称';
COMMENT ON COLUMN "public"."sa_docnamespace"."shost" IS '主机地址';
COMMENT ON COLUMN "public"."sa_docnamespace"."sport" IS '服务端口';
COMMENT ON COLUMN "public"."sa_docnamespace"."surl" IS '访问地址';
COMMENT ON COLUMN "public"."sa_docnamespace"."sflag" IS '使用状态';
COMMENT ON COLUMN "public"."sa_docnamespace"."shtths" IS '是否HTTPS';
COMMENT ON COLUMN "public"."sa_docnamespace"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_docnamespace" IS '文档配置';

-- ----------------------------
-- Records of sa_docnamespace
-- ----------------------------
INSERT INTO "public"."sa_docnamespace" VALUES ('defaultDocNameSpace', '文档中心', '127.0.0.1', 8085, 'http://127.0.0.1:8085/DocServer', 1, 'false', 5);

-- ----------------------------
-- Table structure for sa_docnode
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_docnode";
CREATE TABLE "public"."sa_docnode" (
  "sid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "sparentid" varchar(36) COLLATE "pg_catalog"."default",
  "sdocname" varchar(2500) COLLATE "pg_catalog"."default",
  "ssequence" varchar(128) COLLATE "pg_catalog"."default",
  "ssize" float8,
  "skind" varchar(128) COLLATE "pg_catalog"."default",
  "sdocpath" varchar(2048) COLLATE "pg_catalog"."default",
  "sdocdisplaypath" varchar(2048) COLLATE "pg_catalog"."default",
  "screatorfid" varchar(2048) COLLATE "pg_catalog"."default",
  "screatorname" varchar(64) COLLATE "pg_catalog"."default",
  "screatordeptname" varchar(64) COLLATE "pg_catalog"."default",
  "screatetime" timestamp(6) DEFAULT now(),
  "seditorfid" varchar(2048) COLLATE "pg_catalog"."default",
  "seditorname" varchar(64) COLLATE "pg_catalog"."default",
  "seditordeptname" varchar(64) COLLATE "pg_catalog"."default",
  "slastwriterfid" varchar(2048) COLLATE "pg_catalog"."default",
  "slastwritername" varchar(64) COLLATE "pg_catalog"."default",
  "slastwriterdeptname" varchar(64) COLLATE "pg_catalog"."default",
  "slastwritetime" timestamp(6) DEFAULT now(),
  "sfileid" varchar(128) COLLATE "pg_catalog"."default",
  "sdescription" text COLLATE "pg_catalog"."default",
  "sdocliveversionid" int4,
  "sclassification" varchar(128) COLLATE "pg_catalog"."default",
  "skeywords" varchar(256) COLLATE "pg_catalog"."default",
  "sdocserialnumber" varchar(128) COLLATE "pg_catalog"."default",
  "snamespace" varchar(256) COLLATE "pg_catalog"."default",
  "scachename" varchar(100) COLLATE "pg_catalog"."default",
  "srevisioncachename" varchar(100) COLLATE "pg_catalog"."default",
  "sflag" int4 DEFAULT 1,
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_docnode"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_docnode"."sparentid" IS '父id';
COMMENT ON COLUMN "public"."sa_docnode"."sdocname" IS '名称';
COMMENT ON COLUMN "public"."sa_docnode"."ssequence" IS '排序';
COMMENT ON COLUMN "public"."sa_docnode"."ssize" IS '文件大小';
COMMENT ON COLUMN "public"."sa_docnode"."skind" IS '类型';
COMMENT ON COLUMN "public"."sa_docnode"."sdocpath" IS '文件id路径';
COMMENT ON COLUMN "public"."sa_docnode"."sdocdisplaypath" IS '文件路径名称';
COMMENT ON COLUMN "public"."sa_docnode"."screatorfid" IS '创建人全id';
COMMENT ON COLUMN "public"."sa_docnode"."screatorname" IS '创建人名称';
COMMENT ON COLUMN "public"."sa_docnode"."screatordeptname" IS '创建部门';
COMMENT ON COLUMN "public"."sa_docnode"."screatetime" IS '创建时间';
COMMENT ON COLUMN "public"."sa_docnode"."seditorfid" IS '编辑人全id';
COMMENT ON COLUMN "public"."sa_docnode"."seditorname" IS '编辑人名称';
COMMENT ON COLUMN "public"."sa_docnode"."seditordeptname" IS '编辑部门';
COMMENT ON COLUMN "public"."sa_docnode"."slastwriterfid" IS '最后修改人全id';
COMMENT ON COLUMN "public"."sa_docnode"."slastwritername" IS '最后修改人名称';
COMMENT ON COLUMN "public"."sa_docnode"."slastwriterdeptname" IS '最后修改部门';
COMMENT ON COLUMN "public"."sa_docnode"."slastwritetime" IS '最后修改时间';
COMMENT ON COLUMN "public"."sa_docnode"."sfileid" IS '文件id';
COMMENT ON COLUMN "public"."sa_docnode"."sdescription" IS '描述';
COMMENT ON COLUMN "public"."sa_docnode"."sdocliveversionid" IS '文件版本号';
COMMENT ON COLUMN "public"."sa_docnode"."sclassification" IS '分类';
COMMENT ON COLUMN "public"."sa_docnode"."skeywords" IS '关键字';
COMMENT ON COLUMN "public"."sa_docnode"."sdocserialnumber" IS '文档序列';
COMMENT ON COLUMN "public"."sa_docnode"."snamespace" IS '文档空间';
COMMENT ON COLUMN "public"."sa_docnode"."scachename" IS '缓存名称';
COMMENT ON COLUMN "public"."sa_docnode"."srevisioncachename" IS '编辑缓存';
COMMENT ON COLUMN "public"."sa_docnode"."sflag" IS '状态';
COMMENT ON COLUMN "public"."sa_docnode"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_docnode" IS '文档信息';

-- ----------------------------
-- Records of sa_docnode
-- ----------------------------
INSERT INTO "public"."sa_docnode" VALUES ('root', NULL, '文档中心', '', NULL, 'dir', '/root', '/文档中心', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', NULL, '', '', '', 'defaultDocNameSpace', '', '', 1, NULL);

-- ----------------------------
-- Table structure for sa_flowdrawlg
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_flowdrawlg";
CREATE TABLE "public"."sa_flowdrawlg" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "sprocessid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "sprocessname" varchar(100) COLLATE "pg_catalog"."default",
  "sdrawlg" text COLLATE "pg_catalog"."default",
  "sprocessacty" text COLLATE "pg_catalog"."default",
  "screatorid" varchar(100) COLLATE "pg_catalog"."default",
  "screatorname" varchar(100) COLLATE "pg_catalog"."default",
  "supdatorid" varchar(100) COLLATE "pg_catalog"."default",
  "supdatorname" varchar(100) COLLATE "pg_catalog"."default",
  "screatetime" timestamp(6) DEFAULT now(),
  "supdatetime" timestamp(6) DEFAULT now(),
  "fenabled" int4,
  "sfolderid" varchar(32) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_flowdrawlg"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."sprocessid" IS '流程图id';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."sprocessname" IS '流程图名称';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."sdrawlg" IS '流程图文本';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."sprocessacty" IS '流程图JSON';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."screatorid" IS '创建人id';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."screatorname" IS '创建人名称';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."supdatorid" IS '修改人id';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."supdatorname" IS '修改人名称';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."screatetime" IS '创建时间';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."supdatetime" IS '更新时间';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."fenabled" IS '状态';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."sfolderid" IS '目录id';
COMMENT ON COLUMN "public"."sa_flowdrawlg"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_flowdrawlg" IS '流程图';

-- ----------------------------
-- Records of sa_flowdrawlg
-- ----------------------------
INSERT INTO "public"."sa_flowdrawlg" VALUES ('8729A781E09B42F283EFEE0FB2F7EF68', 'EFB1385BEB1441BCA87404D318B7F9BC', '测试流程', '<v:line title="New Line" style="position: absolute; z-index: 1; cursor: pointer; display: none;"><v:stroke></v:stroke></v:line><div id="bizActivity" title="New bizActivity" style="border: 1px solid blue; position: absolute; left: 300px; top: 80px; width: 100px; height: 40px; cursor: default; z-index: 100; display: none;"><v:stroke></v:stroke></div><div id="Activity1" title="开始" style="position: absolute; left: 300px; top: 80px; width: 40px; height: 40px; cursor: pointer; z-index: 1;"><svg id="SvgjsSvg1000" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><ellipse id="SvgjsEllipse1006" rx="20" ry="20" cx="20" cy="20" stroke="#33cc00" stroke-width="1" fill="#33cc00"></ellipse><defs id="SvgjsDefs1001"></defs></svg><v:shadow></v:shadow><div style="position: inherit; left: 2px; top: 12px; z-index: 1; width: 100%; height: 100%; text-align: center; color: blue; font-size: 9pt;">开始</div></div><div id="bizActivity2" title="bizActivity2" style="border: 1px solid blue; position: absolute; left: 270px; top: 140px; width: 100px; height: 40px; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;"><div id="bizActivity2_Label" style="width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;">bizActivity2</div></div><div id="bizActivity4" title="bizActivity4" style="border: 1px solid blue; position: absolute; left: 270px; top: 200px; width: 100px; height: 40px; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;"><div id="bizActivity4_Label" style="width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;">bizActivity4</div></div><div id="bizActivity6" title="bizActivity6" style="border: 1px solid green; position: absolute; left: 270px; top: 260px; width: 100px; height: 40px; z-index: 99999; background: rgb(255, 255, 255); box-shadow: green 5px 5px 5px;"><div id="bizActivity6_Label" style="width: 100%; height: 100%; margin-top: 6px; text-align: center; color: green; font-size: 10pt; line-height: 25px;">bizActivity6</div></div><div id="Activity8" title="结束" style="position: absolute; left: 300px; top: 320px; width: 40px; height: 40px; cursor: pointer; z-index: 1;"><svg id="SvgjsSvg1007" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><ellipse id="SvgjsEllipse1009" rx="20" ry="20" cx="20" cy="20" stroke="red" stroke-width="1" fill="red"></ellipse><defs id="SvgjsDefs1008"></defs></svg><v:shadow></v:shadow><div style="position: inherit; left: 2px; top: 12px; z-index: 1; width: 100%; height: 100%; text-align: center; color: blue; font-size: 9pt;">结束</div></div><div id="line_3" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;"><svg id="SvgjsSvg1010" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><polyline id="SvgjsPolyline1012" points="320,90 320,102" stroke="blue" stroke-width="1" fill="none" marker-end="url(#idArrow)"></polyline><defs id="SvgjsDefs1011"></defs></svg></div><div id="line_5" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;"><svg id="SvgjsSvg1013" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><polyline id="SvgjsPolyline1015" points="320,150 320,162" stroke="blue" stroke-width="1" fill="none" marker-end="url(#idArrow)"></polyline><defs id="SvgjsDefs1014"></defs></svg></div><div id="line_7" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;"><svg id="SvgjsSvg1016" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><polyline id="SvgjsPolyline1018" points="320,210 320,222" stroke="blue" stroke-width="1" fill="none" marker-end="url(#idArrow)"></polyline><defs id="SvgjsDefs1017"></defs></svg></div><div id="line_9" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;"><svg id="SvgjsSvg1019" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><polyline id="SvgjsPolyline1021" points="320,270 320,282" stroke="blue" stroke-width="1" fill="none" marker-end="url(#idArrow)"></polyline><defs id="SvgjsDefs1020"></defs></svg></div><div id="EFB1385BEB1441BCA87404D318B7F9BC" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;"><svg id="SvgjsSvg1022" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><defs id="SvgjsDefs1023"></defs></svg><svg id="SvgjsSvg1024" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><defs id="SvgjsDefs1025"></defs></svg><svg id="SvgjsSvg1026" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><defs id="SvgjsDefs1027"></defs></svg><svg id="SvgjsSvg1028" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><defs id="SvgjsDefs1029"></defs></svg><svg id="SvgjsSvg1030" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><defs id="SvgjsDefs1031"></defs></svg><svg id="SvgjsSvg1032" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><defs id="SvgjsDefs1033"></defs></svg><svg id="SvgjsSvg1034" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><defs id="SvgjsDefs1035"></defs></svg><svg id="SvgjsSvg1036" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><defs id="SvgjsDefs1037"></defs></svg><svg id="SvgjsSvg1038" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><defs id="SvgjsDefs1039"></defs></svg><svg id="SvgjsSvg1040" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><defs id="SvgjsDefs1041"></defs></svg><svg id="SvgjsSvg1042" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><defs id="SvgjsDefs1043"></defs></svg><svg id="SvgjsSvg1044" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><defs id="SvgjsDefs1045"></defs></svg></div><div id="EFB1385BEB1441BCA87404D318B7F9BC" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;"></div><div id="EFB1385BEB1441BCA87404D318B7F9BC" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;"></div><div id="EFB1385BEB1441BCA87404D318B7F9BC" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;"></div><div id="EFB1385BEB1441BCA87404D318B7F9BC" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;"></div><div id="EFB1385BEB1441BCA87404D318B7F9BC" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;"></div><div id="EFB1385BEB1441BCA87404D318B7F9BC" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;"></div><div id="EFB1385BEB1441BCA87404D318B7F9BC" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;"></div><div id="EFB1385BEB1441BCA87404D318B7F9BC" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;"></div><div id="EFB1385BEB1441BCA87404D318B7F9BC" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;"></div><div id="EFB1385BEB1441BCA87404D318B7F9BC" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;"></div><div id="EFB1385BEB1441BCA87404D318B7F9BC" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px;"></div>', '{"id":"EFB1385BEB1441BCA87404D318B7F9BC","name":"测试流程","count":9,"nodes":[{"id":"Activity1","name":"开始","type":"start","shape":"oval","number":1,"left":300,"top":80,"width":40,"height":40,"property":null},{"id":"bizActivity2","name":"bizActivity2","type":"node","shape":"rect","number":2,"left":270,"top":140,"width":100,"height":40,"property":[{"id":"n_p_id","text":"input","value":"bizActivity2"},{"id":"n_p_name","text":"input","value":"bizActivity2"},{"id":"n_p_exepage","text":"input","value":"\/demo\/flow\/mainActivity.html"},{"id":"n_p_label","text":"input","value":""},{"id":"n_p_desc","text":"textarea","value":""},{"id":"n_p_group","text":"input","value":""},{"id":"n_p_roleID","text":"input","value":""},{"id":"n_p_role","text":"input","value":""},{"id":"n_r_grab","text":"select","value":""},{"id":"n_r_grabway","text":"select","value":""},{"id":"n_t_queryt","text":"select","value":""},{"id":"n_p_back","text":"input","value":""},{"id":"n_p_note","text":"input","value":""},{"id":"n_r_transe","text":"input","value":""},{"id":"n_p_in","text":"input","value":""},{"id":"n_p_time","text":"input","value":""},{"id":"n_p_timetype","text":"input","value":""},{"id":"n_p_call1","text":"input","value":""},{"id":"n_p_call2","text":"input","value":""},{"id":"n_p_call3","text":"input","value":""},{"id":"n_p_call4","text":"input","value":""},{"id":"n_p_call5","text":"input","value":""}]},{"id":"bizActivity4","name":"bizActivity4","type":"node","shape":"rect","number":4,"left":270,"top":200,"width":100,"height":40,"property":[{"id":"n_p_id","text":"input","value":"bizActivity4"},{"id":"n_p_name","text":"input","value":"bizActivity4"},{"id":"n_p_exepage","text":"input","value":"\/demo\/flow\/mainActivity2.html"},{"id":"n_p_label","text":"input","value":""},{"id":"n_p_desc","text":"textarea","value":""},{"id":"n_p_group","text":"input","value":""},{"id":"n_p_roleID","text":"input","value":""},{"id":"n_p_role","text":"input","value":""},{"id":"n_r_grab","text":"select","value":""},{"id":"n_r_grabway","text":"select","value":""},{"id":"n_t_queryt","text":"select","value":""},{"id":"n_p_back","text":"input","value":""},{"id":"n_p_note","text":"input","value":""},{"id":"n_r_transe","text":"input","value":""},{"id":"n_p_in","text":"input","value":""},{"id":"n_p_time","text":"input","value":""},{"id":"n_p_timetype","text":"input","value":""},{"id":"n_p_call1","text":"input","value":""},{"id":"n_p_call2","text":"input","value":""},{"id":"n_p_call3","text":"input","value":""},{"id":"n_p_call4","text":"input","value":""},{"id":"n_p_call5","text":"input","value":""}]},{"id":"bizActivity6","name":"bizActivity6","type":"node","shape":"rect","number":6,"left":270,"top":260,"width":100,"height":40,"property":[{"id":"n_p_id","text":"input","value":"bizActivity6"},{"id":"n_p_name","text":"input","value":"bizActivity6"},{"id":"n_p_exepage","text":"input","value":"\/demo\/flow\/mainActivity2.html"},{"id":"n_p_label","text":"input","value":""},{"id":"n_p_desc","text":"textarea","value":""},{"id":"n_p_group","text":"input","value":""},{"id":"n_p_roleID","text":"input","value":""},{"id":"n_p_role","text":"input","value":""},{"id":"n_r_grab","text":"select","value":""},{"id":"n_r_grabway","text":"select","value":""},{"id":"n_t_queryt","text":"select","value":""},{"id":"n_p_back","text":"input","value":""},{"id":"n_p_note","text":"input","value":""},{"id":"n_r_transe","text":"input","value":""},{"id":"n_p_in","text":"input","value":""},{"id":"n_p_time","text":"input","value":""},{"id":"n_p_timetype","text":"input","value":""},{"id":"n_p_call1","text":"input","value":""},{"id":"n_p_call2","text":"input","value":""},{"id":"n_p_call3","text":"input","value":""},{"id":"n_p_call4","text":"input","value":""},{"id":"n_p_call5","text":"input","value":""}]},{"id":"Activity8","name":"结束","type":"end","shape":"oval","number":8,"left":300,"top":320,"width":40,"height":40,"property":null}],"lines":[{"id":"line_3","name":"line_3","type":"line","shape":"line","number":3,"from":"Activity1","to":"bizActivity2","fromx":320,"fromy":120,"tox":320,"toy":140,"spwidth":0,"spheight":0,"polydot":[],"property":null},{"id":"line_5","name":"line_5","type":"line","shape":"line","number":5,"from":"bizActivity2","to":"bizActivity4","fromx":320,"fromy":180,"tox":320,"toy":200,"spwidth":0,"spheight":0,"polydot":[],"property":null},{"id":"line_7","name":"line_7","type":"line","shape":"line","number":7,"from":"bizActivity4","to":"bizActivity6","fromx":320,"fromy":240,"tox":320,"toy":260,"spwidth":0,"spheight":0,"polydot":[],"property":null},{"id":"line_9","name":"line_9","type":"line","shape":"line","number":9,"from":"bizActivity6","to":"Activity8","fromx":320,"fromy":300,"tox":320,"toy":320,"spwidth":0,"spheight":0,"polydot":[],"property":null}]}', NULL, NULL, NULL, NULL, '2024-01-12 18:05:57.134', '2024-01-12 18:05:57.134', 1, 'F92A0C6C8F2F4B5AB30ED547B38F48B0', 0);
INSERT INTO "public"."sa_flowdrawlg" VALUES ('CAA7A851D81000012321190013501BC9', 'CAA7A851D83000013D93140DD05F1084', 'test1', '<v:line title="New Line" style="position: absolute; z-index: 1; cursor: pointer; display: none;"><v:stroke></v:stroke></v:line><div id="bizActivity" title="New bizActivity" style="border: 1px solid blue; position: absolute; left: 300px; top: 80px; width: 100px; height: 40px; cursor: default; z-index: 100; display: none;"><v:stroke></v:stroke></div><div id="Activity1" title="开始" style="position: absolute; left: 300px; top: 80px; width: 40px; height: 40px; cursor: pointer; z-index: 1; border: 0px none;"><svg id="SvgjsSvg1000" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><ellipse id="SvgjsEllipse1006" rx="20" ry="20" cx="20" cy="20" stroke="#33cc00" stroke-width="1" fill="#33cc00"></ellipse><defs id="SvgjsDefs1001"></defs></svg><v:shadow></v:shadow><div style="position: inherit; left: 2px; top: 12px; z-index: 1; width: 100%; height: 100%; text-align: center; color: blue; font-size: 9pt;">开始</div></div><div id="bizActivity2" title="bizActivity2" style="border: 1px solid blue; position: absolute; left: 270px; top: 140px; width: 100px; height: 40px; cursor: default; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;"><div id="bizActivity_Label" style="width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;">bizActivity2</div></div><div id="line_3" title="line_3" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;"><svg id="SvgjsSvg1007" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><polyline id="SvgjsPolyline1009" points="320,90 320,102" stroke="blue" stroke-width="1" fill="none" marker-end="url(#idArrow)"></polyline><defs id="SvgjsDefs1008"></defs></svg></div><div id="bizActivity4" title="bizActivity4" style="border: 1px solid blue; position: absolute; left: 270px; top: 200px; width: 100px; height: 40px; cursor: default; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;"><div id="bizActivity_Label" style="width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;">bizActivity4</div></div><div id="line_5" title="line_5" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;"><svg id="SvgjsSvg1010" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><polyline id="SvgjsPolyline1012" points="320,150 320,162" stroke="blue" stroke-width="1" fill="none" marker-end="url(#idArrow)"></polyline><defs id="SvgjsDefs1011"></defs></svg></div><div id="bizActivity6" title="bizActivity6" style="border: 1px solid blue; position: absolute; left: 270px; top: 260px; width: 100px; height: 40px; cursor: default; z-index: 1; background: rgb(255, 255, 255); box-shadow: rgb(179, 179, 179) 5px 5px 5px;"><div id="bizActivity_Label" style="width: 100%; height: 100%; margin-top: 6px; text-align: center; color: blue; font-size: 10pt; line-height: 25px;">bizActivity6</div></div><div id="line_7" title="line_7" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;"><svg id="SvgjsSvg1013" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><polyline id="SvgjsPolyline1015" points="320,210 320,222" stroke="blue" stroke-width="1" fill="none" marker-end="url(#idArrow)"></polyline><defs id="SvgjsDefs1014"></defs></svg></div><div id="Activity8" title="结束" style="position: absolute; left: 300px; top: 320px; width: 40px; height: 40px; cursor: pointer; z-index: 1; border: 1px dashed green;"><svg id="SvgjsSvg1016" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><ellipse id="SvgjsEllipse1018" rx="20" ry="20" cx="20" cy="20" stroke="red" stroke-width="1" fill="red"></ellipse><defs id="SvgjsDefs1017"></defs></svg><v:shadow></v:shadow><div style="position: inherit; left: 2px; top: 12px; z-index: 1; width: 100%; height: 100%; text-align: center; color: green; font-size: 9pt;">结束</div></div><div id="line_9" title="line_9" style="left: 0px; top: 0px; width: 100%; height: 100%; margin-top: 30px; position: absolute; z-index: 1; cursor: pointer;"><svg id="SvgjsSvg1019" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink"><polyline id="SvgjsPolyline1021" points="320,270 320,282" stroke="blue" stroke-width="1" fill="none" marker-end="url(#idArrow)"></polyline><defs id="SvgjsDefs1020"></defs></svg></div>', '{"id":"CAA7A851D83000013D93140DD05F1084","name":"test1","count":9,"nodes":[{"id":"Activity1","name":"开始","type":"start","shape":"oval","number":1,"left":300,"top":80,"width":40,"height":40,"property":null},{"id":"bizActivity2","name":"bizActivity2","type":"node","shape":"rect","number":2,"left":270,"top":140,"width":100,"height":40,"property":null},{"id":"bizActivity4","name":"bizActivity4","type":"node","shape":"rect","number":4,"left":270,"top":200,"width":100,"height":40,"property":null},{"id":"bizActivity6","name":"bizActivity6","type":"node","shape":"rect","number":6,"left":270,"top":260,"width":100,"height":40,"property":null},{"id":"Activity8","name":"结束","type":"end","shape":"oval","number":8,"left":300,"top":320,"width":40,"height":40,"property":null}],"lines":[{"id":"line_3","name":"line_3","type":"line","shape":"line","number":3,"from":"Activity1","to":"bizActivity2","fromx":320,"fromy":120,"tox":320,"toy":140,"spwidth":0,"spheight":0,"polydot":[],"property":null},{"id":"line_5","name":"line_5","type":"line","shape":"line","number":5,"from":"bizActivity2","to":"bizActivity4","fromx":320,"fromy":180,"tox":320,"toy":200,"spwidth":0,"spheight":0,"polydot":[],"property":null},{"id":"line_7","name":"line_7","type":"line","shape":"line","number":7,"from":"bizActivity4","to":"bizActivity6","fromx":320,"fromy":240,"tox":320,"toy":260,"spwidth":0,"spheight":0,"polydot":[],"property":null},{"id":"line_9","name":"line_9","type":"line","shape":"line","number":9,"from":"bizActivity6","to":"Activity8","fromx":320,"fromy":300,"tox":320,"toy":320,"spwidth":0,"spheight":0,"polydot":[],"property":null}]}', NULL, NULL, NULL, NULL, '2024-03-06 11:33:03.929', '2024-03-06 11:33:03.929', 1, 'F92A0C6C8F2F4B5AB30ED547B38F48B0', 2);

-- ----------------------------
-- Table structure for sa_flowfolder
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_flowfolder";
CREATE TABLE "public"."sa_flowfolder" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "sprocessid" varchar(100) COLLATE "pg_catalog"."default",
  "sprocessname" varchar(100) COLLATE "pg_catalog"."default",
  "scode" varchar(100) COLLATE "pg_catalog"."default",
  "sname" varchar(100) COLLATE "pg_catalog"."default",
  "sparent" varchar(32) COLLATE "pg_catalog"."default",
  "sidpath" varchar(4000) COLLATE "pg_catalog"."default",
  "snamepath" varchar(4000) COLLATE "pg_catalog"."default",
  "scodepath" varchar(4000) COLLATE "pg_catalog"."default",
  "version" int4 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_flowfolder"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_flowfolder"."sprocessid" IS '流程图id';
COMMENT ON COLUMN "public"."sa_flowfolder"."sprocessname" IS '流程图名称';
COMMENT ON COLUMN "public"."sa_flowfolder"."scode" IS '目录编号';
COMMENT ON COLUMN "public"."sa_flowfolder"."sname" IS '目录名称';
COMMENT ON COLUMN "public"."sa_flowfolder"."sparent" IS '父id';
COMMENT ON COLUMN "public"."sa_flowfolder"."sidpath" IS 'id路径';
COMMENT ON COLUMN "public"."sa_flowfolder"."snamepath" IS '路径名称';
COMMENT ON COLUMN "public"."sa_flowfolder"."scodepath" IS '编号路径';
COMMENT ON COLUMN "public"."sa_flowfolder"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_flowfolder" IS '流程目录';

-- ----------------------------
-- Records of sa_flowfolder
-- ----------------------------
INSERT INTO "public"."sa_flowfolder" VALUES ('F92A0C6C8F2F4B5AB30ED547B38F48B0', NULL, NULL, 'root', '流程图', NULL, '/F92A0C6C8F2F4B5AB30ED547B38F48B0', '/流程图', '/root', 0);

-- ----------------------------
-- Table structure for sa_handwr_signature
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_handwr_signature";
CREATE TABLE "public"."sa_handwr_signature" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "spersonid" varchar(36) COLLATE "pg_catalog"."default",
  "spersonname" varchar(100) COLLATE "pg_catalog"."default",
  "screaterid" varchar(36) COLLATE "pg_catalog"."default",
  "screatername" varchar(100) COLLATE "pg_catalog"."default",
  "screatetime" timestamp(6),
  "shspic" bytea,
  "version" int4
)
;
COMMENT ON COLUMN "public"."sa_handwr_signature"."spersonid" IS '人员id';
COMMENT ON COLUMN "public"."sa_handwr_signature"."spersonname" IS '姓名';
COMMENT ON COLUMN "public"."sa_handwr_signature"."screaterid" IS '创建人id';
COMMENT ON COLUMN "public"."sa_handwr_signature"."screatername" IS '创建人';
COMMENT ON COLUMN "public"."sa_handwr_signature"."screatetime" IS '创建时间';
COMMENT ON COLUMN "public"."sa_handwr_signature"."shspic" IS '签名图片';
COMMENT ON TABLE "public"."sa_handwr_signature" IS '手写签名';

-- ----------------------------
-- Records of sa_handwr_signature
-- ----------------------------
INSERT INTO "public"."sa_handwr_signature" VALUES ('PSN01', 'PSN01', 'system', 'PSN01', 'system', '2024-03-04 11:29:34', E'\\211PNG\\015\\012\\032\\012\\000\\000\\000\\015IHDR\\000\\000\\001,\\000\\000\\000d\\010\\006\\000\\000\\000<\\001\\015\\300\\000\\000\\000\\011pHYs\\000\\000\\013\\023\\000\\000\\013\\023\\001\\000\\232\\234\\030\\000\\000\\012MiCCPPhotoshop ICC profile\\000\\000x\\332\\235SwX\\223\\367\\026>\\337\\367e\\017VB\\330\\360\\261\\227l\\201\\000"#\\254\\010\\310\\020Y\\242\\020\\222\\000a\\204\\020\\022@\\305\\205\\210\\012V\\024\\025\\021\\234HU\\304\\202\\325\\012H\\235\\210\\342\\240(\\270gA\\212\\210Z\\213U\\\\8\\356\\037\\334\\247\\265}z\\357\\355\\355\\373\\327\\373\\274\\347\\234\\347\\374\\316y\\317\\017\\200\\021\\022&\\221\\346\\242j\\0009R\\205<:\\330\\037\\217OH\\304\\311\\275\\200\\002\\025H\\340\\004 \\020\\346\\313\\302g\\005\\305\\000\\000\\360\\003yx~t\\260?\\374\\001\\257o\\000\\002\\000p\\325.$\\022\\307\\341\\377\\203\\272P&W\\000 \\221\\000\\340"\\022\\347\\013\\001\\220R\\000\\310.T\\310\\024\\000\\310\\030\\000\\260S\\263d\\012\\000\\224\\000\\000ly|B"\\000\\252\\015\\000\\354\\364I>\\005\\000\\330\\251\\223\\334\\027\\000\\330\\242\\034\\251\\010\\000\\215\\001\\000\\231(G$\\002@\\273\\000`U\\201R,\\002\\300\\302\\000\\240\\254@".\\004\\300\\256\\001\\200Y\\2662G\\002\\200\\275\\005\\000v\\216X\\220\\017@`\\000\\200\\231B,\\314\\000 8\\002\\000C\\036\\023\\315\\003 L\\003\\2400\\322\\277\\340\\251_p\\205\\270H\\001\\000\\300\\313\\225\\315\\227K\\3223\\024\\270\\225\\320\\032w\\362\\360\\340\\342!\\342\\302l\\261Ba\\027)\\020f\\011\\344"\\234\\227\\233#\\023H\\347\\003L\\316\\014\\000\\000\\032\\371\\321\\301\\3768?\\220\\347\\346\\344\\341\\346f\\347l\\357\\364\\305\\242\\376k\\360o">!\\361\\337\\376\\274\\214\\002\\004\\000\\020N\\317\\357\\332_\\345\\345\\326\\003p\\307\\001\\260u\\277k\\251[\\000\\332V\\000h\\337\\371]3\\333\\011\\240Z\\012\\320z\\371\\213y8\\374@\\036\\236\\241P\\310<\\035\\034\\012\\013\\013\\355%b\\241\\2750\\343\\213>\\3773\\341o\\340\\213~\\366\\374@\\036\\376\\333z\\360\\000q\\232@\\231\\255\\300\\243\\203\\375qanv\\256R\\216\\347\\313\\004B1n\\367\\347#\\376\\307\\205\\177\\375\\216)\\321\\3424\\261\\\\,\\025\\212\\361X\\211\\270P"M\\307y\\271R\\221D!\\311\\225\\342\\022\\351\\1772\\361\\037\\226\\375\\011\\223w\\015\\000\\254\\206O\\300N\\266\\007\\265\\313l\\300~\\356\\001\\002\\213\\016X\\322v\\000@~\\363-\\214\\032\\013\\221\\000\\020g42y\\367\\000\\000\\223\\277\\371\\217@+\\001\\000\\315\\227\\244\\343\\000\\000\\274\\350\\030\\\\\\250\\224\\027L\\306\\010\\000\\000D\\240\\201*\\260A\\007\\014\\301\\024\\254\\300\\016\\234\\301\\035\\274\\300\\027\\002a\\006D@\\014$\\300<\\020B\\006\\344\\200\\034\\012\\241\\030\\226A\\031T\\300:\\330\\004\\265\\260\\003\\032\\240\\021\\232\\341\\020\\264\\30118\\015\\347\\340\\022\\\\\\201\\353p\\027\\006`\\030\\236\\302\\030\\274\\206\\011\\004A\\310\\010\\023a!:\\210\\021b\\216\\330"\\316\\010\\027\\231\\216\\004"aH4\\222\\200\\244 \\351\\210\\024Q"\\305\\310r\\244\\002\\251Bj\\221]H#\\362-r\\0249\\215\\\\@\\372\\220\\333\\310 2\\212\\374\\212\\274G1\\224\\201\\262Q\\003\\324\\002u@\\271\\250\\037\\032\\212\\306\\240s\\321t4\\017]\\200\\226\\242k\\321\\032\\264\\036=\\200\\266\\242\\247\\321K\\350ut\\000}\\212\\216c\\200\\3211\\016f\\214\\331a\\\\\\214\\207E`\\211X\\032&\\307\\026c\\345X5V\\2175c\\035X7v\\025\\033\\300\\236a\\357\\010$\\002\\213\\200\\023\\354\\010^\\204\\020\\302l\\202\\220\\220GXLXC\\250%\\354#\\264\\022\\272\\010W\\011\\203\\2041\\302''"\\223\\250O\\264%z\\022\\371\\304xb:\\261\\220XF\\254&\\356!\\036!\\236%^''\\016\\023_\\223H$\\016\\311\\222\\344N\\012!%\\2202I\\013IkH\\333H-\\244S\\244>\\322\\020i\\234L&\\353\\220m\\311\\336\\344\\010\\262\\200\\254 \\227\\221\\267\\220\\017\\220O\\222\\373\\311\\303\\344\\267\\024:\\305\\210\\342L\\011\\242$R\\244\\224\\022J5e?\\345\\004\\245\\2372B\\231\\240\\252Q\\315\\251\\236\\324\\010\\252\\210:\\237ZIm\\240vP/S\\207\\251\\0234u\\232%\\315\\233\\026C\\313\\244-\\243\\325\\320\\232igi\\367h/\\351t\\272\\011\\335\\203\\036E\\227\\320\\227\\322k\\350\\007\\351\\347\\351\\203\\364w\\014\\015\\206\\015\\203\\307Hb(\\031k\\031{\\031\\247\\030\\267\\031/\\231L\\246\\005\\323\\227\\231\\310T0\\3272\\033\\231g\\230\\017\\230oUX*\\366*|\\025\\221\\312\\022\\225:\\225V\\225~\\225\\347\\252TUsU?\\325y\\252\\013T\\253U\\017\\253^V}\\246FU\\263P\\343\\251\\011\\324\\026\\253\\325\\251\\035U\\273\\2516\\256\\316RwR\\217P\\317Q_\\243\\276_\\375\\202\\372c\\015\\262\\206\\205F\\240\\206H\\243Tc\\267\\306\\031\\215!\\026\\3062e\\361XB\\326rV\\003\\353,k\\230Mb[\\262\\371\\354Lv\\005\\373\\033v/{LSCs\\252f\\254f\\221f\\235\\346q\\315\\001\\016\\306\\261\\340\\3609\\331\\234J\\316!\\316\\015\\316{-\\003-?-\\261\\326j\\255f\\255~\\2557\\332z\\332\\276\\332b\\355r\\355\\026\\355\\353\\332\\357up\\235@\\235,\\235\\365:m:\\367u\\011\\2726\\272Q\\272\\205\\272\\333u\\317\\352>\\323c\\353y\\351\\011\\365\\312\\365\\016\\351\\335\\321G\\365m\\364\\243\\365\\027\\352\\357\\326\\357\\321\\037704\\0106\\220\\031l18c\\360\\314\\220c\\350k\\230i\\270\\321\\360\\204\\341\\250\\021\\313h\\272\\221\\304h\\243\\321I\\243''\\270&\\356\\207g\\3435x\\027>f\\254o\\034b\\2544\\336e\\334k<abi2\\333\\244\\304\\244\\305\\344\\276)\\315\\224k\\232f\\272\\321\\264\\323t\\314\\314\\310,\\334\\254\\330\\254\\311\\354\\2169\\325\\234k\\236a\\276\\331\\274\\333\\374\\215\\205\\245E\\234\\305J\\2136\\213\\307\\226\\332\\226|\\313\\005\\226M\\226\\367\\254\\230V>VyV\\365V\\327\\254I\\326\\\\\\353,\\353m\\326WlP\\033W\\233\\014\\233:\\233\\313\\266\\250\\255\\233\\255\\304v\\233m\\337\\024\\342\\024\\217)\\322)\\365Sn\\3321\\354\\374\\354\\012\\354\\232\\354\\006\\3559\\366a\\366%\\366m\\366\\317\\035\\314\\034\\022\\035\\326;t;|rtu\\314vlp\\274\\353\\244\\3414\\303\\251\\304\\251\\303\\351Wg\\033g\\241s\\235\\3635\\027\\246K\\220\\313\\022\\227v\\227\\027Sm\\247\\212\\247n\\237z\\313\\225\\345\\032\\356\\272\\322\\265\\323\\365\\243\\233\\273\\233\\334\\255\\331m\\324\\335\\314=\\305}\\253\\373M.\\233\\033\\311]\\303=\\357A\\364\\360\\367X\\342q\\314\\343\\235\\247\\233\\247\\302\\363\\220\\347/^v^Y^\\373\\275\\036O\\263\\234&\\236\\3260m\\310\\333\\304[\\340\\275\\313{`:>=e\\372\\316\\351\\003>\\306>\\002\\237z\\237\\207\\276\\246\\276"\\337=\\276#~\\326~\\231~\\007\\374\\236\\373;\\372\\313\\375\\217\\370\\277\\341y\\362\\026\\361N\\005`\\001\\301\\001\\345\\001\\275\\201\\032\\201\\263\\003k\\003\\037\\004\\231\\004\\245\\0075\\005\\215\\005\\273\\006/\\014>\\025B\\014\\011\\015Y\\037r\\223o\\300\\027\\362\\033\\371c3\\334g,\\232\\321\\025\\312\\010\\235\\025Z\\033\\3720\\314&L\\036\\326\\021\\216\\206\\317\\010\\337\\020~o\\246\\371L\\351\\314\\266\\010\\210\\340Gl\\210\\270\\037i\\031\\231\\027\\371}\\024)*2\\252.\\352Q\\264Stqt\\367,\\326\\254\\344Y\\373g\\275\\216\\361\\217\\251\\214\\271;\\333j\\266rvg\\254jlRlc\\354\\233\\270\\200\\270\\252\\270\\201x\\207\\370E\\361\\227\\022t\\023$\\011\\355\\211\\344\\304\\330\\304=\\211\\343s\\002\\347l\\2323\\234\\344\\232T\\226tc\\256\\345\\334\\242\\271\\027\\346\\351\\316\\313\\236w<Y5Y\\220|8\\205\\230\\022\\227\\262?\\345\\203 BP/\\030O\\345\\247nM\\035\\023\\362\\204\\233\\205OE\\276\\242\\215\\242Q\\261\\267\\270J<\\222\\346\\235V\\225\\3668\\335;}C\\372h\\206OFu\\3063\\011OR+y\\221\\031\\222\\271#\\363MVD\\326\\336\\254\\317\\331q\\331-9\\224\\234\\224\\234\\243R\\015i\\226\\264+\\3270\\267(\\267Of++\\223\\015\\344y\\346m\\312\\033\\223\\207\\312\\367\\344#\\371s\\363\\333\\025l\\205L\\321\\243\\264R\\256P\\016\\026L/\\250+x[\\030[x\\270H\\275HZ\\3243\\337f\\376\\352\\371#\\013\\202\\026|\\275\\220\\260P\\270\\260\\263\\330\\270xY\\361\\340"\\277E\\273\\026#\\213S\\027w.1]R\\272dxi\\360\\322}\\313h\\313\\262\\226\\375P\\342XRU\\362jy\\334\\362\\216R\\203\\322\\245\\245C+\\202W4\\225\\251\\224\\311\\313n\\256\\364Z\\271c\\025a\\225dU\\357j\\227\\325[V\\177*\\027\\225_\\254p\\254\\250\\256\\370\\260F\\270\\346\\342WN_\\325|\\365ym\\332\\332\\336J\\267\\312\\355\\353H\\353\\244\\353n\\254\\367Y\\277\\257J\\275jA\\325\\320\\206\\360\\015\\255\\033\\361\\215\\345\\033_mJ\\336t\\241zj\\365\\216\\315\\264\\315\\312\\315\\0035a5\\355[\\314\\266\\254\\333\\362\\2416\\243\\366z\\235\\177]\\313V\\375\\255\\253\\267\\276\\331&\\332\\326\\277\\335w{\\363\\016\\203\\035\\025;\\336\\357\\224\\354\\274\\265+xWk\\275E}\\365n\\322\\356\\202\\335\\217\\032b\\033\\272\\277\\346~\\335\\270GwO\\305\\236\\217{\\245{\\007\\366E\\357\\353jtol\\334\\257\\277\\277\\262\\011mR6\\215\\036H:p\\345\\233\\200o\\332\\233\\355\\232w\\265pZ*\\016\\302A\\345\\301''\\337\\246|{\\343P\\350\\241\\316\\303\\334\\303\\315\\337\\231\\177\\267\\365\\010\\353Hy+\\322:\\277u\\254-\\243m\\240=\\241\\275\\357\\350\\214\\243\\235\\035^\\035G\\276\\267\\377~\\3571\\343cu\\3075\\217W\\236\\240\\235(=\\361\\371\\344\\202\\223\\343\\247d\\247\\236\\235N?=\\324\\231\\334y\\367L\\374\\231k]Q]\\275gC\\317\\236?\\027t\\356L\\267_\\367\\311\\363\\336\\347\\217]\\360\\274p\\364"\\367b\\333%\\267K\\255=\\256=G~p\\375\\341H\\257[o\\353e\\367\\313\\355W<\\256t\\364M\\353;\\321\\357\\323\\177\\372j\\300\\325s\\327\\370\\327.]\\237y\\275\\357\\306\\354\\033\\267n&\\335\\034\\270%\\272\\365\\370v\\366\\355\\027w\\012\\356L\\334]z\\217x\\257\\374\\276\\332\\375\\352\\007\\372\\017\\352\\177\\264\\376\\261e\\300m\\340\\370`\\300`\\317\\303Y\\017\\357\\016\\011\\207\\236\\376\\224\\377\\323\\207\\341\\322G\\314G\\325#F#\\215\\217\\235\\037\\037\\033\\015\\032\\275\\362d\\316\\223\\341\\247\\262\\247\\023\\317\\312~V\\377y\\353s\\253\\347\\337\\375\\342\\373K\\317X\\374\\330\\360\\013\\371\\213\\317\\277\\256y\\251\\363r\\357\\253\\251\\257:\\307#\\307\\037\\274\\316y=\\361\\246\\374\\255\\316\\333}\\357\\270\\357\\272\\337\\307\\275\\037\\231(\\374@\\376P\\363\\321\\372c\\307\\247\\320O\\367>\\347|\\376\\374/\\367\\204\\363\\373%\\322\\2373\\000\\000\\000 cHRM\\000\\000z%\\000\\000\\200\\203\\000\\000\\371\\377\\000\\000\\200\\351\\000\\000u0\\000\\000\\352`\\000\\000:\\230\\000\\000\\027o\\222_\\305F\\000\\000:\\233IDATx\\332\\354}gw\\333\\330\\226l\\201I\\022\\025m\\331rh\\273\\323\\355;3\\357\\377\\377\\2327\\251\\263\\223dYV\\244H\\002\\230\\017\\332\\325(\\024\\017H*\\330\\362u\\003kqQ\\226)\\022\\004\\316\\331\\273v\\325\\016YY\\226h\\217\\366h\\217\\366\\370W8:\\355%h\\217\\366h\\217\\326`\\265G{\\264G{\\264\\006\\253=\\332\\243=Z\\203\\325\\036\\355\\321\\036\\355\\321\\032\\254\\366h\\217\\366h\\217\\2739z\\355%h\\217\\373>\\262,\\233\\373\\337\\366\\314\\243\\214\\307\\334\\243U\\301[\\203\\325\\036\\355\\361Y\\354\\230D\\001\\231<J{,m\\274\\332\\2435X\\355\\321\\036\\237\\312Xu\\344\\271\\033\\317\\0351N\\005\\200<\\236\\0131\\\\\\355\\321\\032\\254\\366h\\217\\317j\\254h\\250z\\000\\372\\000\\006\\361\\334\\025c5\\216\\3074\\0364\\\\\\255\\321j\\015\\326''X\\225-o\\321\\036\\315\\306\\252\\033\\006j\\025\\300:\\200a<\\372q\\377\\307\\000\\316\\343q\\001`\\004`\\322\\206\\206\\255\\301\\272/C\\325\\362\\026\\177\\357P\\260\\017`\\015\\300\\006\\200\\207\\000\\036\\000\\330\\011\\003\\2060R\\307\\000\\016\\001|\\230\\263F\\332\\2435X\\237t\\261v\\345Y\\177.\\344\\321\\362\\026_7\\272\\352E\\010\\270\\016`\\027\\300s\\000/\\001<\\006\\260\\025\\257=\\001\\360\\026\\300\\037a\\340\\362\\010\\013\\3136,l\\015\\326\\347@V\\035Y\\254\\312Y\\364P\\021\\255y\\300\\376Q\\313[|\\265\\007\\011\\366\\025\\000\\233\\000\\366\\000\\374\\000\\340''\\000/\\002i\\001\\300\\021\\200_c}LcM\\220\\317\\352\\264(\\2535X\\237c\\221\\366c\\241\\256\\306b]\\017\\303E\\2045\\006p\\006\\340\\364k\\341-\\026\\030qE\\035z\\224\\313 \\313\\262,\\227y\\377e\\303\\363R\\302.\\\\''$\\277\\006\\237\\250\\374\\325\\020\\3006\\200\\247\\000\\276\\005\\360\\017\\000\\337\\213\\301\\372\\020kc\\022h\\353c<_\\304\\371\\266N\\2545X\\237,\\014 \\252Z\\017C\\265\\023\\274\\305V\\374\\233\\013\\3604\\026\\352\\373x.\\277b\\336Be\\375L\\214\\006d3\\336\\305\\246L\\211\\033\\031f\\323\\012Jy\\315\\324\\316\\003\\267\\271\\376bT\\371\\271\\375xl\\306:\\330\\013\\303\\265\\027k\\242\\214\\377\\277\\214u\\360\\006W\\\\\\327\\252\\374\\276=Z\\203\\365I\\220\\025\\215\\325Fx\\317G\\2618\\237\\304\\002\\335\\016O:\\305\\025\\301\\372*\\376\\235\\305\\357\\362\\257,,\\244\\201P\\324\\331\\025cA\\016/\\227\\357\\2374\\026K\\210\\033)\\303\\244\\237\\335\\215\\327v\\345oJ\\371\\\\\\017\\313q\\007\\367\\200kb\\005W\\244\\373v8\\260\\355\\3707\\317e%\\034\\334v<6\\343w\\335\\006T\\332\\036\\255\\301\\272U\\350\\243y6\\353a\\254\\366\\000|\\027\\320\\377\\005\\200g\\261X\\373\\001\\375\\017ba\\226\\022\\0362,\\374\\032x\\013''\\235W\\0045\\014\\004\\335\\214\\343{_\\306s~M\\203\\335\\265\\353\\317\\207~6\\015\\345@\\014\\032\\342\\263\\306\\361\\331\\227\\306\\035\\335\\326q\\250\\361\\\\\\211\\260p#\\236\\007f\\02031jC\\241\\016:\\206F\\277\\304\\020\\337\\237\\257\\205R\\377\\356);\\275{\\332\\230\\364\\342ka\\224\\236\\206\\241\\372''\\200\\037\\303`\\355F\\0100\\210\\215\\262\\023\\177O9\\373 6\\226\\206N\\377\\312w\\223\\006d\\325\\302\\343\\215\\330\\234j\\250?\\306u\\310\\302p\\214\\227@8z\\335i\\230V\\343y(\\237\\275\\032\\237GCIc@\\321\\343<\\302\\363\\343\\340\\215NqC>q\\216#\\353\\312\\271\\255\\010\\342c\\342hJ\\234\\241\\301\\302\\347DXK\\362\\204\\231qt0G\\240!\\276f\\362\\317\\334\\323y\\237\\267\\310\\230]\\203\\323\\274U\\036\\344\\2478\\370\\335z\\367\\2709Wb3\\356\\002\\370\\006W\\304\\352?\\303p=\\021\\230\\337\\227\\233y\\030\\233x\\030\\377\\327\\303\\327\\321qB\\363\\2176p%\\341?\\216\\353\\3608\\276o\\206+R\\371=\\200w\\301\\335t\\302ph\\2508\\317\\030r\\243\\257\\241\\02266\\344\\347\\241\\030\\255\\365\\270\\306\\014\\301\\2130L''q\\037\\366\\343<:w\\314''\\252Q\\355\\011\\332\\353\\330Fr\\003\\334\\231\\263\\321\\356\\373\\276v\\355\\\\\\273\\206(sA\\320\\271<\\012\\013\\271?\\307\\276\\204\\201\\0004\\334\\333b\\011c\\347H\\262\\264\\237\\257M#\\364\\356qc\\256Z(\\370c\\030\\253\\347\\301K\\364\\015\\342w\\315\\233~M\\007\\257\\011\\325\\261''a\\300\\177\\214\\320x;^w\\206\\253\\374\\243_\\342\\365\\272\\310/\\023!\\231g\\216\\017\\205\\373y\\030\\316\\342Q8\\201M\\011\\301V\\303\\2501$%gx\\031\\006\\362]\\234C/>sr\\007|\\242\\256\\015U\\2145\\265\\245H\\\\7_\\3745\\244}K\\245\\3646a\\230^\\367\\276\\030\\377U\\371\\035\\317\\275#\\341\\376DP\\363D\\256\\355\\215\\205\\226%CU7\\254\\312i\\026fD\\363\\004\\342\\352$xXO\\004W\\324\\230\\213\\341[\\232\\003\\355}\\001\\233\\3639\\256\\244\\353\\357\\302xm\\312B-\\345\\246]\\240*\\305\\030\\333\\346\\370W\\346\\257ta\\257\\007\\242\\372\\036\\300\\177\\304\\3439*\\265\\3644\\014\\3260\\376\\206!\\342\\030u\\022>\\025^\\255\\205\\203\\330\\015\\203\\3704\\214\\341^\\374~K\\214\\324\\212\\204[}\\341\\257&q\\016\\273q\\177\\030"\\236\\305&[\\232Ol\\330Dj\\264\\006r\\016\\356\\361!\\310\\244\\274\\006\\032iJ\\021\\271\\313pP\\271H-/\\332\\220P\\177]\\234o)\\334\\340H\\326\\271>\\306\\306\\025\\226\\363\\316\\347\\232\\006V\\015\\324@\\214kO\\234\\025\\305\\226Q\\342\\\\r\\271?]\\341C\\373\\202\\354\\225\\003U\\301lj\\206\\260l\\272\\177\\374n\\275{0V\\232\\030\\310\\260\\347y\\374\\274\\03578C\\275"\\377\\014W\\311\\202Li`\\316\\315\\364\\023z\\235\\317\\345\\221;\\211p\\360%\\252\\334\\243\\307aH\\262@B\\353\\361\\372q\\\\\\213\\217q}.\\022p\\2349M\\30302O\\203\\037|\\031\\327\\\\\\257\\373Z"\\004\\353\\013\\232\\245q\\270\\214{\\304\\264\\202\\203x\\364n\\301''\\252W\\036\\010\\231\\276*\\033\\333C\\014.\\362\\351\\202u\\2205\\2048\\300\\247I\\213\\361\\360~+\\034\\302\\343\\270\\007\\312\\315\\2523\\030\\307\\272>\\216\\265\\316\\374\\262\\017\\361\\273\\013A^\\371\\2420q\\311\\365\\335\\025\\243\\262&\\264\\300\\266\\361\\207D}\\247\\3618\\013C\\2524DO(\\234\\025\\241\\0364\\004\\236\\212\\221\\032\\013\\367y)\\300d.Wv\\037!!\\011\\337\\315\\270\\221O",\\3316dEcu\\036\\206\\3525\\256\\322\\032\\336\\004\\207r.H\\353S\\235\\253{\\345\\033\\305\\335K.\\360\\001\\252\\364\\216g\\361\\330\\025o\\314\\320a''\\014\\315Q\\\\\\2237a0\\316$|\\310d\\001m\\304\\365}\\036\\006\\360\\373@\\263\\317\\345\\272\\017-\\324\\356\\2301-$\\334Z\\215\\317\\331\\0214\\354\\351\\0277\\271\\006T\\376T!\\\\\\217\\367\\357&\\010\\352\\211 \\022*\\227\\271\\205(^\\342\\245\\347\\327\\024\\342\\334\\306\\331e\\302\\317\\256G\\330\\375$\\356%\\225\\357\\324Z/\\343\\273\\234\\213\\221:\\020\\236\\360@\\356\\361y\\274\\3666$x&\\016\\206\\016b''\\014\\351.\\252\\372M\\246\\222L\\343\\263\\311\\237\\036\\306y^\\310\\272`\\356\\334\\246p\\244\\032\\376r\\035]\\012R?\\017\\303|"\\310r"\\350\\353^\\015\\226z}\\362\\023\\333r\\241\\224/!7s\\021_\\354\\020\\300\\237\\270\\252\\035{\\0277\\364\\314\\342\\373\\362\\216\\317\\2633G%\\231\\213\\352n\\000\\315\\265\\340w\\333B\\264\\256\\205\\216+\\250\\262\\300\\237\\306k\\207b4\\246\\362~\\353q}\\237\\005\\037\\366S \\267\\027\\261q6\\214''rc]\\030i\\252<\\321R\\341\\325\\222\\236^\\321\\334\\232 \\223\\015\\361\\362Z\\242\\305\\264\\2123A\\036S1\\352D.+\\202\\320\\234\\013S\\216h\\202\\353\\247\\2074}\\017\\257\\203\\374>\\256\\375\\267\\342\\2046m\\255\\227\\2028\\250\\002\\277\\217\\360\\377U\\254\\375U\\0239\\334@/kP!\\206|(Ff/\\214\\3537\\3613\\327GW\\320\\037\\317\\345U<\\316\\343\\363\\007\\302Ik\\261\\372\\320\\220Z\\036\\337q$h\\362}\\030\\346\\303p\\302g\\306\\307\\226\\367\\211\\260\\350\\365\\210&\\350Euc\\226\\2620/\\3028\\275\\006\\360{\\\\\\254\\267\\361E/o\\023\\022.0T\\035S\\246<D\\315\\233.\\350-y\\254\\001\\352j]7\\021\\306t\\0059m\\307\\363\\232\\211\\024\\344\\2556Q\\225\\267\\374\\204+\\025\\366\\333X\\214\\233\\250\\347Y\\221\\024\\365\\316\\007\\205)W\\243\\270''\\014[F\\202t\\347\\205W)\\365\\010\\250+\\230CA\\231\\233\\306gv\\304\\210Nds3\\255BC\\233\\216\\021\\367L\\221\\350\\2123$?\\304\\277W\\243W\\334pm35d\\007U\\252\\316\\177\\204\\223x)\\327}U\\014\\217\\222\\332$\\336\\317%\\362`\\325\\307\\212\\204\\306\\205\\334\\253\\351\\222\\347\\253\\234\\246*\\305\\217\\304P}\\027\\353\\343\\251 ,\\346A\\236\\240J\\346&''\\372!>\\233B\\316cy<@\\2454w\\305\\231\\222\\013#\\020y\\027\\373\\372\\317x\\355\\276\\254\\367\\311}\\032\\254T\\257\\243UC\\007H,J\\226_0\\034\\374\\0207\\364\\362\\216\\274\\242\\237\\233\\346\\370\\364\\214g\\230\\232\\232\\2237y\\271\\033\\034]!\\232\\007\\211\\020&Kl\\014n\\360\\236\\274\\007C\\356a,\\366g\\270* &''\\266\\207z\\262\\245\\243F5<\\252@R%\\374\\030\\016\\344\\267XlG\\341X&\\015\\367"K(G\\231!\\307\\201\\030\\340\\207\\361\\330\\221\\265\\241\\006\\273\\020\\262\\377\\\\B\\207nl@\\210\\341W\\222{(\\337w\\024\\337\\343 ^{l\\3379\\273&b\\324{\\262\\025\\033\\366E\\\\\\363\\237\\002a\\355%\\034Qa\\206\\270\\024\\003\\260%\\374\\327\\246\\254\\307\\216q\\273\\371\\022\\234\\241\\222\\342\\253\\302S=\\022\\321\\213t\\001\\303V56E|\\326\\206\\030\\253\\31508y\\234\\347^\\374-\\215\\025\\301H\\327(\\206\\011\\352\\371|o\\3048\\016\\014\\331\\317\\200\\202\\3730X\\212&\\024\\262wL\\376\\314ea\\275\\217\\213\\303D\\305\\3139\\033\\344\\266J\\335\\252\\020\\325\\314\\367\\352\\010\\342S\\025g4/D\\\\24\\324\\215X\\210\\027\\\\6\\204\\034\\240\\236\\223\\326\\027\\216\\360ax\\313\\227\\341A\\011\\363\\373\\206f\\225\\010U\\303|)\\316\\201j\\340a,\\262_"D?4\\203\\2252T\\232\\177\\3245\\345\\217\\233\\210\\202\\003\\205\\200\\207\\302\\337u\\355\\\\\\307\\250''\\3142\\034!7\\263a\\241\\365\\266(\\240E\\254\\243\\375@\\355}\\334>5\\243#Nb\\007U\\252\\316wq\\355\\237\\306y\\364\\022H33\\336\\260+\\327k\\305\\320a)\\337}\\212\\005\\345Y\\011d\\265\\026\\017\\0120DU\\337K\\310\\372P\\316\\265+\\006R+"\\210\\362\\217\\342\\377\\267$\\244\\334A=\\207\\257c\\327I\\305\\222\\221p\\241\\334gSYKS\\271\\347\\367J\\272w\\215\\020\\315$\\014\\354\\010r\\271\\214\\315p&\\352\\304\\370\\016\\221\\225\\336P.\\220-T\\005\\330\\017\\3053\\223(\\374(\\244\\343\\211\\220\\276\\323\\233\\212\\212v\\016\\372\\2732\\301\\025e\\206\\246\\372F\\226\\227\\250\\244\\364\\307\\261\\010\\237\\304w\\331@\\275\\314E\\303\\220S1\\302\\347f\\230\\317\\344\\036\\020\\306\\277\\215\\307G!K\\365\\236d\\206\\370V\\304;\\017d\\003\\014\\344\\27234yj\\304tGB\\271\\\\\\026u7\\276\\347\\2630N}1P\\017\\204#\\325\\022\\237R\\370\\230\\201l\\234\\221\\321\\0147\\011\\005\\231C\\367\\255\\030\\253\\307\\026E\\024\\262\\031!k\\276c\\206l`\\216\\234\\204\\365HB\\2523\\243E\\3129k\\2339x\\217\\342\\032\\277\\014C\\365\\203\\360Vjl2\\243!\\020\\357\\361\\010U^\\344^<o\\033o\\325\\027#\\351H\\262''\\3476L(\\321#\\001\\006c\\217b\\356\\003a\\025r\\021\\273\\242\\224xW\\202\\322\\224 ]P\\223O$C\\017\\205\\244~)\\033\\241\\027\\027\\357(\\320\\005\\037\\3312d\\374\\002\\244\\245\\206ij\\033>\\233c\\340\\324\\001\\364QOG`\\210\\265#R\\372\\206\\205a\\205\\250?\\314^?\\210\\237\\217dC\\234\\211:\\305\\327RjgJ\\305\\3106Nf\\\\\\311\\206\\240\\236M\\011\\215\\006b\\3046$\\224z\\032\\347>\\300l\\267\\010\\336/\\242\\252<\\276_&\\206o[\\236\\311\\221*\\007t\\036\\277\\343=e\\272\\214#\\240e\\312b4Mg7\\326\\314\\267\\361=\\2364\\020\\354\\232\\216\\241\\340\\241o\\206\\213\\327\\220\\327\\206"\\324Q \\304SA\\\\Y\\203\\301\\352\\213j\\371D\\014\\025)\\202\\347\\202\\252V\\005}\\273:\\316kN\\303\\322\\215\\317\\345Z\\333\\264k\\214\\206g_\\273\\033\\342<G\\242\\032\\036\\013\\365\\362\\027\\222\\274\\257ZB\\030A\\333\\261\\215Z\\232''\\232\\030gt\\327)\\005\\232\\270\\371 n*\\353\\032\\037\\241j[\\362\\336\\210G''AobHy=&\\013T\\271\\246\\363.1\\233,\\272*\\012\\341\\266\\205VH\\204\\334$>\\177C\\325v\\370D\\020\\327\\2058\\015\\375\\367\\245\\241\\222\\302P\\207nd\\346\\3341\\017i]\\014\\226\\212\\010\\273\\022\\272\\016\\014\\201k\\012\\310N|\\336\\266\\204,\\314%\\332\\220\\360\\247o\\036\\277\\023\\277\\277\\014\\204\\270)\\257S\\241e\\231\\373\\250F\\231a\\021\\363\\334\\236\\240\\336eB\\235\\304\\245!\\210\\314B|\\015\\307\\324\\001=\\216{\\263\\027?\\037\\305\\375\\353$P\\241\\267nz\\030H\\352G\\000\\377\\026\\317\\317\\005y\\257\\230\\360U$\\326U)\\250\\226\\016\\226i(=\\24334]\\244H\\204\\277|\\277\\276\\030\\255\\0131\\306\\207\\202\\372\\377B\\357\\367\\025\\022b\\031I\\034\\351\\336Ow\\331>$\\303l\\037\\361\\007BT\\3773\\026\\006\\0235w\\005\\366\\366\\214{\\312\\023\\206\\007\\213R\\037\\022!a\\271\\300he\\211\\177\\347\\346\\231{\\302\\331\\014\\205O\\320\\0059\\025\\025\\366\\017\\000\\377\\035\\006\\353\\225\\310\\313\\027\\230\\355\\364\\252\\034\\3274\\241\\230v,\\255\\342Al\\014r:\\3449\\326\\304\\350\\257\\010\\007\\264f\\204o''\\261~\\326%D\\311e\\341{\\342\\242\\267\\312\\361k\\255!uJ\\340X\\306\\331y\\032\\303\\0131\\314\\353\\250\\347\\267i\\202\\350Q<.\\343}6\\004\\251l\\010\\232Q\\376\\2119u\\217\\342\\375_\\305\\357/\\022\\334\\233\\206\\202;qn?\\204\\261b\\007W=Gw\\014\\271\\205\\275\\251\\367-\\2053\\365\\021l\\205\\000\\2152aD\\3259\\350\\336#\\267\\266/\\216\\223H\\353\\263sX*\\307\\002\\263\\375\\213<\\363X\\377\\257@\\272\\363\\345]\\245[h\\242%\\211S\\312\\312Y\\\\4\\225\\310\\265\\2278\\011\\340\\022K\\364\\250J\\204\\206e\\342\\032\\244 5\\220N^U\\364\\240\\365\\226\\312\\025\\351\\337h\\347\\005"\\254W\\270j;L%\\366BH\\355\\251-D-\\207\\201\\335/M]\\241R\\371"6\\311O\\261q\\210\\236\\372\\306gz\\316T\\326\\020\\342\\270\\341\\322\\026\\333\\312\\235!\\201\\332U\\241\\232W\\352\\265H\\035T\\307\\260)\\202\\001\\313\\235\\266\\004!\\372g\\037\\004\\242e\\010\\336\\025\\221\\344\\231\\354\\221UsDk\\362:\\015\\255{\\011\\203\\313{@\\222\\375%\\252\\232\\335\\357P\\317\\337\\353\\0300\\340\\372\\320k\\256\\242\\200''\\347zB\\356$\\301Ei\\332\\211\\242_}_6C\\340\\336{+\\242N\\027@q\\037!ai<J\\023\\342\\311l3w\\261\\240\\327\\321-{\\005e\\246\\320xU\\375\\212\\251]j\\250\\024}\\3447 \\3413[\\004\\035,\\356BQ\\332\\265\\231\\332\\265\\351\\232w/\\023\\206\\221\\312\\3471\\252\\354\\352CTynn|\\027u\\031\\365\\231\\202kFD\\377\\020\\213q`\\3373\\225\\366\\320$6x\\311\\220;\\036E?\\271\\031\\351\\261\\240J\\246\\311\\320h\\370\\367]\\264\\230\\324 0\\224ew\\015\\317\\233\\312\\205/\\244\\261\\372\\237@\\266\\307\\361~;a\\330\\013Yo}\\314\\366/\\323\\304\\332\\365\\006\\343\\256B\\000\\253I\\210r\\237\\211\\002\\353\\306f*\\310\\233\\310hh\\016Q\\201F)\\277\\323\\232H\\266\\037z\\037\\016Q\\325\\334]\\001\\001\\232q\\317\\363\\245A~$H\\374\\257<\\256\\373\\3548\\332\\224hX\\032\\021\\331\\023\\357\\333\\224\\201~[\\003Z\\210g\\030\\013WC\\242\\177\\305\\344x\\012\\002\\227\\242\\246y3\\273\\205$|Cx\\2412~6\\207\\363\\312\\204\\273(,<,-<-\\315\\020\\244\\220\\353T\\276\\023\\2777p\\263\\344\\330T\\232\\310\\003T9E\\336\\306\\304\\015\\3162\\241Xf\\216\\317G\\302\\345\\306\\201\\262P\\234y}?\\007\\242\\334\\217\\315\\245e!\\327\\271_\\374n\\217\\2042X3.\\207\\255y\\216\\343\\263\\177\\215\\020\\374WT9`\\017\\342\\232\\0239n\\241\\236\\233\\344CZV-lV5QCUvD\\241\\022\\310\\234\\247\\236\\251\\363SQ\\344YE\\242\\274T\\257\\201O\\324uD\\004y\\210\\253\\\\\\275\\327a\\264N%\\354\\375&>\\253k\\350_\\005\\206\\035T))\\014\\217\\317\\001d\\367\\301ai\\330\\344\\325\\365e\\003\\027\\262b\\220\\277\\221\\027\\272&\\312\\322\\317\\343f\\325\\322\\210]\\263\\360\\2327\\364@\\376F\\007z\\216\\305P\\\\G\\036\\357\\011''\\320Esm^a\\327\\261\\260\\337)\\232\\3101\\233\\205\\256\\006\\253o\\013\\337KXn\\323=\\024\\206\\236R(\\017\\011\\331\\273\\234s\\217S\\275\\224\\\\}\\316\\305\\360049\\027\\336\\210\\002\\303\\257\\270\\312\\303z\\035\\367\\373:\\225\\023]\\023\\025\\330{~\\027\\365\\234"\\335\\310DW\\257q\\225\\303\\306\\317?\\213\\327\\261\\250\\3741\\352\\305\\375SQ\\356\\024a\\016,"\\310l\\343\\273r\\251\\306\\252c\\316\\232\\327\\211\\212)\\025\\272mA>h\\340\\264t\\335M\\3038\\261\\375\\320/\\361}\\217Q\\225\\224]\\012q?\\264k\\3251\\001f\\023\\365\\336w\\237\\325`\\251\\201*LY*\\354b\\250:\\262*\\217e\\303\\245\\353\\032,\\236\\317y\\334\\264\\267\\2502p\\207fD`\\312\\213\\267\\002Q\\345\\314\\271\\236&\\376L\\211\\314\\201\\335\\304\\024\\327\\245\\347\\354\\033\\264\\264\\215zi\\341Nar\\267\\346-y\\216\\324\\364\\006FK\\357\\363X\\244x\\226\\363\\014\\204\\333q\\025p\\036z\\366N\\234\\205\\205\\252\\271\\021\\275L\\303`\\032\\300!\\252"z\\336\\337w\\361;\\226\\030-*\\202\\326\\034\\2515!\\264\\211\\254\\230\\032\\240\\335Q\\231?\\305>bZb\\366\\036\\325\\244\\037v\\343\\360\\2746$x\\335\\216\\031N\\230\\223gh\\2453\\022\\036\\313\\371u\\032P\\321~\\234\\333\\261\\254\\365mC\\260Yb-\\226B\\221\\320)\\374\\034a\\357\\353\\270\\276\\003Tm\\211X\\015\\260c*\\252\\2125\\033v=3\\000\\235\\373Jk\\320\\002\\326\\246\\260\\245/\\013C\\033\\313\\015bq\\335\\025\\371\\256\\027\\233\\231\\334\\\\X[\\250\\227\\261\\254%\\214\\326\\236(?gf\\270\\026\\266\\001\\261\\360iE\\214Fw\\001\\302\\320\\332>m\\340\\247a\\235\\346P\\215\\005\\251:a\\274+\\217c\\3243\\327\\363\\033:\\200\\2619\\200\\337\\342{]\\212\\0328\\300l)T\\267Ah(\\214\\037\\324~L\\032\\316_\\210\\230p,\\250\\341\\275\\361tT\\240N\\260\\270r\\302\\313\\213\\372"(\\354\\312\\363\\206\\361N\\245\\204\\203\\0247\\230\\303w(Hj\\025\\365*\\003w.>\\005\\335S\\015\\234\\333\\243jI!\\200ym\\353\\011\\345\\225\\011\\321o\\005\\365\\235\\242J\\270\\235\\316\\341\\240}\\017\\361{\\362;\\276\\016\\0038\\222\\010b+\\020\\337\\221\\030\\321B\\214\\274\\362Yk\\262N\\006\\000.>7\\302*eaMP\\317\\355\\311\\005\\326k\\350\\265%\\217uA\\037\\235y|\\3035BCE+\\027\\250\\246\\012o\\212\\324<\\304l_&\\236\\337\\266\\360#\\334(: cQw\\207\\256y\\025\\235\\307\\330Yp\\035/\\304P\\371\\3771\\004\\372 \\3473D=Q\\267\\207z\\373\\231\\367\\302\\3079\\027\\207ybG\\\\\\3672\\241\\210\\035\\005\\271La\\340=\\252D\\3055\\324\\023K\\207\\250\\327\\031\\246\\014\\3409\\352\\311\\252#\\021\\017.\\205\\360=\\222\\307G\\371Yg[j.T\\261@H\\350\\232\\222\\37406\\334S\\011\\267\\264\\3661\\027t\\305\\026I\\373\\261\\266>\\210\\260\\301\\215?\\300lK\\234N\\203\\310Q\\232Ac4R\\012o\\245U\\003:\\201J\\023q\\271\\346\\031\\252\\376o\\334\\253R\\302\\3242a\\250\\312\\304\\232\\314%\\364\\3468\\276CIK\\350\\333\\3758\\027G\\261btG\\027\\263\\303\\224;\\367\\021\\022\\346\\246\\230h\\177\\237\\211\\251G=\\213g\\031\\3232\\033w\\212\\273K"U\\205\\20323cg\\242\\201U\\343\\322T\\265y \\260\\237\\213\\221\\233j^\\277u\\335\\004Z\\373\\346rv\\212\\307\\232\\212\\301?\\023''\\320\\021\\244q,F\\3531\\252l\\367\\216\\361\\005,\\327\\370(\\222\\277\\032\\254\\271\\271eFJ\\353\\265d\\250AT}&\\352\\017CQ\\362?\\260\\005\\232YH\\245\\331\\370\\207F\\224\\217\\345Z\\234\\310\\367\\370h\\310w$\\350q\\214\\345j\\007]@\\330\\026E\\357\\205\\204\\\\\\232)\\3363\\344\\247a\\351\\307\\3707\\257)\\321\\232v$\\035\\032)\\356\\217\\302\\316[\\011y\\34621\\215\\341\\205\\250\\202Z\\3337\\021!\\200\\021\\005\\023\\207\\021\\337''Op\\212\\216\\260\\012\\213Rh\\260N\\345>\\320`\\255\\311\\272Pg\\353)KJ\\364\\367%\\354\\375\\354\\244\\273\\3663Rk|&\\244cO \\356@\\274\\031\\027:C\\303\\011\\346\\324}]\\023i\\251\\027\\247\\307z\\213z\\325\\277\\366\\353Z7$H\\243\\365\\\\\\026\\346\\321\\202p\\243\\203z\\241\\356\\246\\250h+hN\\260-\\215\\243\\031\\211\\0226\\025o}\\201zGP\\226\\211\\014\\022\\351\\032\\354\\257u&\\213)\\027\\016\\353\\334\\274\\355\\262\\252\\353H\\320\\306\\205\\204\\207l!\\3638\\014e&\\010\\323\\011^r\\213\\373\\262\\251\\230\\237\\343\\015\\374.\\205\\273;\\267\\177O,\\314]\\246\\227x\\206\\331Z\\301\\307\\222"\\360\\243\\240\\230\\315\\004RH\\241\\335\\023\\331\\250,\\031\\332A\\225\\203\\265\\213z\\2372\\317U\\364n\\235\\231\\204\\202l''\\364]\\244\\220\\374\\020\\347\\272#!\\267vk=\\027t\\365k\\\\\\327\\263x\\277\\021\\3529\\223h@Xz^D\\270ZZ35c\\253}\\353\\035%\\226&\\324t]\\221\\274\\217\\220075\\216\\020\\361\\002\\263y%\\332\\015\\361qx\\342\\003\\324;6\\314U\\263\\256\\321\\012\\2714\\364\\3277Y~]84\\357.1\\020\\244\\362\\024\\365V\\316gbH&\\306!\\015\\215\\034e\\2504X\\342<G\\266a\\325C1D=FU\\244\\254\\245"=\\0236\\330\\300MS\\032\\274T\\010f\\304\\226\\271\\226\\356\\014H\\276oI\\250\\260\\022\\237\\355\\204wi\\010e?\\210\\334\\377\\302U\\016\\325{9_\\355.\\241M\\371\\264\\327\\375\\262F*e\\260\\224\\263z\\021\\206\\352\\037a\\030\\236\\206\\221\\031\\332\\332\\325s\\242\\360@\\303\\011T\\371M\\212\\210\\330\\225\\364a\\342\\375\\034\\311\\\\\\212\\330\\302u\\312\\367\\371w\\\\Ui|\\203\\252/\\325\\300\\020\\032[\\005\\355\\243j\\214y\\030\\353\\346\\001\\352]Z;\\011\\025\\267LpX:\\002\\356\\334\\356i&\\367\\323\\251\\222\\324\\036\\326,\\370\\277\\356\\327\\347FX\\271 \\201K\\343\\032NP%\\334yO\\362\\235\\330p\\357P\\345\\315\\260o\\221rEM\\362zS\\206|j\\361r\\201\\237\\240>\\300aM\\224!\\315$\\357\\012R!\\241HE\\354XT\\240Sy\\357\\025y=\\263\\220\\237Kh1\\230\\243\\204*\\237\\243\\241N!\\020^\\011P\\266\\203\\331\\223\\305\\253\\345\\021=\\011\\001\\236\\242\\236\\364Jt\\261\\037?\\363\\273,\\222\\3775\\275B\\015\\326H\\026l&a\\207\\363E\\252\\376\\215\\204W|\\025\\233\\353wAXS1\\002\\271\\251\\31771Rn\\254\\264\\261\\342\\243\\270W\\377\\017\\365\\254}W\\222KC\\035\\352\\\\W\\303 \\021a1\\034\\377A\\336\\363!\\3529X\\245\\245i\\234HH\\305\\367\\334\\211\\277\\375\\3670\\246\\337\\242\\236q\\3375\\365\\366\\314TS\\206\\253l\\177\\255\\367?5B\\315\\025Bu\\222#\\331\\347\\323\\004\\217\\233\\252\\224(\\220.\\270V\\303\\231\\335W\\246\\273\\022\\262\\224\\233Yy\\356\\245;\\014Y\\366\\204g\\031\\313\\373\\365%\\215\\000F\\334\\227\\366\\345\\013\\333\\370\\205\\375\\254\\027\\216\\013\\343\\275\\021\\303\\033\\230\\2356\\254\\252\\341N\\234''=M.Hq$!\\033\\2734\\262y\\032\\027\\330\\006\\346\\217\\\\\\317-]`\\234P\\226\\246\\002\\317\\367Q5\\202S\\245h\\023\\365q\\364\\014MrS\\247zb`O$d\\\\T\\214^&\\322\\016rQ\\204\\306r-\\274\\233B\\327TA\\336\\007\\246#\\354c6\\033\\277@\\272k\\306mr\\311|\\240\\304n\\334\\247oQu\\020\\355c\\266\\022#u\\337X\\260=A5\\306n=\\234\\304s\\011\\337\\366\\204\\017\\363k\\301\\304\\327\\017B\\245\\224b\\370^\\012\\372\\343\\373\\364\\354\\2744\\315B\\257)3\\376W\\344\\036\\015\\344\\373e\\013T\\366s\\011\\005\\225\\227.\\022\\000"\\305\\207u\\015\\321w\\023\\350\\353^JsTA\\342B<\\210\\033\\360\\310\\2400Q e\\332\\027\\0065W$\\207\\346R~\\237\\312~\\006fKL\\274\\210W\\2753Q\\312\\021\\252\\334(\\355\\004\\271\\202\\331\\316\\240\\003\\3419\\216E\\316\\035\\212W\\314d\\261\\356\\032\\337\\360\\020\\263\\255\\221S\\374\\320\\010\\365\\366\\276<\\377\\314\\344\\352\\363\\270\\256oE\\270\\320bh\\345H|\\034|O\\3709*\\246\\207"*h\\352\\306\\274\\316\\253E\\342;t\\345\\2720\\233y\\315\\020\\212\\206.G\\202\\026\\217\\004Y6\\365\\202\\272\\313ZS\\235\\243\\271\\205\\372\\240\\206!f\\313\\305\\262\\304F\\344\\324\\242i\\374})\\337\\235E\\323\\234\\252\\303\\265\\3257\\032\\205\\0049\\207S0|\\203\\204\\253\\337\\210\\020\\260\\201z[\\033u\\314\\014\\263u\\250\\304\\021\\252\\354v\\035\\365\\325\\265\\024\\2332\\201\\202\\247",\\034%\\234\\211\\237\\203\\226@e\\211\\375\\352\\245j\\367\\232\\207\\245\\275\\200\\224\\030\\336\\307l\\035\\026O\\224\\220\\227hB\\221\\327\\221I\\244\\005\\352\\231\\317\\031f\\333\\266\\350d\\016-\\301\\031\\241\\336yr,j\\223\\312\\331$\\307\\311\\007i\\010\\307,\\370oQ\\025\\254>\\022\\262U\\021\\026\\211\\372\\227\\342\\021W0\\177\\300\\003\\015\\321\\261\\310\\363y\\203S Wx \\342\\201\\022\\272\\231qZt\\016:\\335\\210\\011\\262\\017Q\\345\\021\\251\\341\\240`2\\306\\374\\356\\227^\\314>\\264s\\032\\032i=\\305l\\345\\301\\251\\250\\201\\032n\\334IN\\036\\005\\032\\341==,\\\\\\025.\\263\\227\\010\\221R\\010\\215M\\357\\012Y\\303\\332\\366E\\007\\261h+dO\\310<\\025\\276\\351U\\334S\\206\\204\\003T3''\\037J\\004\\3405\\271\\020\\216\\3634\\336C\\015\\214\\016\\362\\350\\031\\352M}\\277\\302\\034\\350GKYp\\203\\225*\\351\\361f\\234\\352\\200\\272\\356\\364\\356\\253\\226P\\211\\367\\017q#^\\213\\022\\310\\205Q\\032$/d\\303\\223(>\\026\\244\\341s\\315\\312D8\\230\\033\\037p,d\\260&YN\\204\\0379\\215\\233\\367\\036W\\211p\\234\\016\\262)\\210H\\011\\370M\\371\\334\\315\\340\\246.$l\\325\\201\\013l\\007\\274-\\036;k\\330\\344\\023\\223\\356O\\015z;W\\243\\311\\233\\253\\302\\3011\\304\\353\\032\\001\\3375BXC\\241\\207a\\254v\\303p\\275\\223\\005\\177"aj\\336\\240\\336ff\\010\\211\\334\\230\\217\\245\\355`rC\\025G"`\\244\\206\\306\\226\\2675R\\013\\302\\3322\\201\\014\\362\\004\\342\\360:O\\355\\226\\240\\311\\241\\020\\224\\273&!q\\337\\020[\\216z\\037\\375_\\303`\\275A\\325K\\277/\\217!\\322my\\234\\037\\314\\305I\\237\\212\\210\\005\\343mW\\022!%\\022\\321\\012\\357\\023\\327\\344\\231E+\\276\\236\\221P\\004U%D\\302\\320\\336[H\\250\\244\\333\\205x\\2167\\250\\367\\362\\036\\310\\005\\344\\346\\3314)~O6m*\\257\\306\\371\\254R.\\344H6\\363\\201\\020\\372,\\325hRT6Q\\225c\\370\\000R\\0351E/\\265\\211\\372\\334<\\376\\037\\027\\0047n\\277a\\22192\\0355H\\344e\\303f\\343\\242<D\\225K\\266b(v\\007\\263\\375\\243T\\316g\\352\\005''\\254p\\036\\342k\\271fG\\361z\\015\\317SeW]9\\217T=Ya\\302\\001y\\221c1\\214\\237\\312@5\\031\\253)\\352Y\\364\\227"\\3724\\3613ZfB\\244\\012Y\\003\\336\\337\\276\\213\\331\\346w\\034V\\373\\016WI\\235\\377\\213\\253\\372\\274}\\241\\034\\326Q50\\\\T\\332\\244\\243\\3224\\275h"\\357\\241U\\027\\253\\015\\353R\\243\\025\\336''\\016\\365=A\\275\\022\\301Qh\\252M\\224\\202\\212\\254!L\\304}\\221\\356H(\\013T+vD\\311\\242wW\\317\\277"(\\206\\034\\320H6\\255{\\335\\024\\267\\221\\331\\315b\\005\\375/\\250\\367\\262\\326\\360q"F\\353\\275\\241\\301\\015\\314\\266\\206\\325\\012\\364\\365\\204"\\002\\371\\036]\\324\\023f\\347q\\005Z\\240z \\213\\266)\\325 \\227\\305\\360\\021\\365\\204\\321\\236qe\\014q\\275\\355G_\\302a\\206\\035L1\\331\\013\\304I\\303\\265/\\206\\345\\022\\263\\315\\333\\274\\013\\346*f\\007\\261jz\\311\\245(O\\247r/\\222\\337\\367\\226\\355\\205\\232\\014\\226&\\351\\236\\311\\306\\324d\\347y\\2355\\272b\\244S]<=\\243]?\\357\\010\\325\\204\\242\\377F\\325\\222\\346]\\\\cO9IE\\026z.y\\002\\305*z\\324bj\\242\\336\\336\\034\\302\\334+D\\216-d\\237\\3275\\327o\\3264A\\337t\\276\\224\\220\\020\\202\\\\\\316\\344\\3060yR\\033\\223\\365L\\261\\321.\\225>\\000\\323U\\300N\\203\\\\\\0121\\230\\307\\022\\367\\373H/}\\177\\235~\\313\\026\\030\\333\\242\\350\\250\\221\\202\\234{\\2360T\\276h;\\015\\0208\\225\\312\\300\\022\\217\\017\\015\\344s\\223\\310\\3014\\207\\256\\031#?''-}\\322\\366"D\\203\\353\\342X\\036\\013\\277\\365&\\256\\307\\037\\361\\276:\\031X[''wlS\\270p\\221%h\\2033\\314\\026\\225\\227\\237\\311\\261\\362\\332\\221\\244f\\311\\311\\261 \\376\\336\\202\\324\\210\\314PD\\327\\326\\250\\256\\311\\251\\210%DV?\\243jG\\303\\321j#T\\303Q\\306\\250\\2676jR\\365:\\211\\264\\223\\002\\365\\321f\\231!\\354y\\250-\\227k\\363Q8\\3061f\\353hS\\215)\\313\\304}Ou\\012\\351|V\\203%\\265fM!\\013\\313.\\376\\224\\020AGAi\\326\\257*X\\003S\\3074\\014\\004\\232\\333\\226\\350,\\267\\035QTx>>6{"\\374\\030\\213X7Q\\037\\366\\311\\351!\\0031\\004\\205\\375\\2345\\030\\257\\246\\001\\002\\2720\\350q\\225\\370>\\301r-Q\\012\\341(t\\000HG\\026\\354XT\\2545C`\\335\\204\\241\\031\\212\\321\\336\\025\\205k-\\356c/6\\035$\\205A;\\242\\256%\\220\\236\\206\\014\\232\\321=\\022n\\261\\274e\\250w]\\247\\352\\035\\015\\336\\205Q~\\214\\3728\\254\\324}K\\335\\337\\314\\024\\262\\302x\\245sq\\340\\277J\\030\\310Lt\\226\\2750aT\\347\\035\\\\\\032\\237\\331\\235\\2434k\\332\\210\\267\\246\\351\\032*F\\003\\007\\245t\\311\\261 \\376\\002\\351l\\370\\322\\020SSg\\341,a\\364\\357\\035aA.X\\017\\365\\326#\\253\\266\\241vP\\015\\311\\364\\346o)\\350\\330i \\334\\201z_\\255\\022\\263\\035D\\031r\\021!\\350"P\\357\\367\\032\\365\\256\\003<\\227M\\203\\371\\305\\034n\\312[t\\244\\244q\\355\\277\\376.>\\227R\\264\\326\\244-2XD\\013g\\2507\\376\\323\\316\\251\\227\\306#v1;\\001\\273/F\\231\\250k[T.\\355_\\344\\371QZ\\3124@\\275a\\241+Dn\\260<c}\\341q\\215*\\207EFk,\\304\\362\\237\\250*\\023vP\\215\\201\\353\\317\\011\\233\\274\\367[a{@\\371:6\\030\\374#\\220\\325o\\270J\\224\\335G}h-C\\270\\322\\010\\356rN\\210Z&\\326\\204\\013\\010\\023\\331C\\336k-K\\360\\320\\227\\346P&\\230Mq\\361a3\\376\\276EB\\311\\364\\201 \\367\\226\\326\\220\\272\\210\\243\\204''W\\317\\377<~\\336\\300l\\005\\267\\033\\205\\254ANO\\301\\317\\256H\\373\\017c3\\263\\277\\371kSI\\224\\250<\\211\\327)B\\340\\015\\334C\\275\\256\\254c*\\213\\337\\224\\224\\272\\244h\\203\\306\\3520<\\354k\\324\\263\\375\\307X\\256\\010\\\\\\247\\032\\237\\240>\\321D\\307\\207S\\304x \\327{5\\021\\272*\\377\\266&\\341\\342P\\320\\252\\246:\\214\\215\\324]\\025\\203\\225\\012\\213\\225\\307R"\\377\\256\\247&a\\001\\267R\\232\\022F\\364\\363:\\004\\210\\007\\206\\252\\035\\305\\250\\332\\254\\367`*\\277\\327\\220\\223b\\006\\323\\027\\336\\212\\032;2\\203\\300\\353Z\\230!\\233\\227V\\342\\347\\227J\\270\\365\\262\\246\\302\\300\\215\\206\\224\\232bs\\206t\\271\\\\f\\210\\265c\\002\\004\\0224\\211\\322*\\177\\205\\246\\237\\315`5\\204\\205\\352mFfUu#\\261%\\310\\003\\361\\342\\003\\314N\\223.\\226PI:\\011\\024\\243%@\\314\\263\\332J\\020\\323\\232\\245\\357e\\030\\023!\\037uj\\361 \\001q\\3250y\\037\\371\\014\\263\\275\\224N\\005]\\275\\025t5\\272&\\237S\\310\\002\\207l\\034\\235\\007\\307\\372N\\326\\264\\355\\240\\352V10\\022\\266\\213zz\\004Q\\223\\346\\201i\\027\\011\\225\\373\\007\\250O5N\\221\\271\\227\\011\\257\\335\\271#C\\225\\3523\\345B\\215\\267\\313\\341\\034\\303CQG\\265\\250\\274c\\302\\201\\242\\017M\\362U\\252\\341B\\256\\375\\001\\252L\\376\\375\\270\\347\\0241\\3161\\233\\240[Zt\\341\\263!\\375;\\027\\246B\\346\\015\\337\\227b\\330\\010\\263\\375\\352\\274\\253\\355\\271\\360W\\227H\\267#\\362\\001&\\227\\250w\\302u\\256\\252k\\316\\355\\257\\226;_\\002\\302r/\\257\\341\\300X\\324\\007\\316\\004d\\201\\360\\020\\351BdX,\\254\\350\\245\\217\\331\\026\\304\\272\\211\\250\\206i"c\\206\\364\\020\\314\\363\\204a9F\\225\\000\\273)hC\\3137t\\243\\36314\\343\\347\\274\\006+\\352\\331\\251\\362\\310H\\326\\353"Zm\\235<\\225\\215C\\025L;<<\\022~j\\323\\244nM9\\321V\\275\\232\\343\\306\\374\\251\\034\\365\\341\\012\\253\\230\\235\\354\\254!\\212\\366\\314\\277\\304\\354H\\261\\333\\032\\252\\216=\\232Z\\267(\\002\\031\\211H\\364\\036\\263\\235F\\262\\204\\012\\376Q\\256\\347GK%\\030\\011bg\\322%\\353P?\\212\\032\\3314\\355\\\\\\015c\\3128u\\027\\254\\201\\334\\214\\\\n\\210\\226$\\372\\024\\263i\\027S!\\333?\\012\\272j\\012\\3313\\273\\267\\323\\004b.M\\360\\351\\243>F\\254\\363\\245\\030,\\030\\274-D59\\021\\242\\233}\\263wD\\206\\327\\260\\2020\\322\\343\\356\\276\\031$&\\306\\025\\026\\226)JH\\225%\\300\\014\\211\\336hf\\355\\277\\025\\243\\272.\\\\\\217\\022\\316,\\313`?\\250\\225\\004z \\232;\\026e\\220\\334\\225n\\342\\342\\206\\016b\\222X\\250\\347r\\275\\367\\203\\247\\321\\026\\273z\\355W\\214\\177\\352\\011\\207\\267''\\347} \\341\\353\\004\\365\\361\\364\\003\\324k2\\263\\006\\203\\345\\265\\222\\345-\\214\\225\\016\\316\\355[H\\257-\\226\\247\\306\\355\\224\\011\\305\\225\\310b\\232\\020x\\264\\265\\014\\373M\\261-\\262\\216\\234\\037[\\024\\341\\355\\266\\3639\\206:\\023\\001)\\225\\363\\324\\264\\317JS\\0073\\371y"\\024\\004\\357\\335\\266\\355\\261\\334\\304\\262\\217\\250W<\\314\\373\\314K\\324;\\304\\322h\\366M)\\034\\240\\336e\\270\\367\\331\\015V\\242\\364!e\\010\\2347\\270\\220\\370\\376u\\204k\\332\\314O\\363xR<\\0267\\307&\\252:\\277\\035\\331(\\256\\326\\370M/\\023j\\211\\306\\372\\247\\230m\\206\\266%\\027{\\025\\3656\\300\\254\\037{\\212\\252\\367\\223#>^\\013z\\2607B\\274j\\013\\343\\362\\006!x\\352z\\027\\262\\330.P\\325\\3551\\241\\227\\206\\213\\305\\271\\217Q\\245\\237h)\\211\\266\\253y\\202z\\255\\3321\\3529`\\275\\304\\367v\\204ria\\354\\274\\220\\177Yc\\245\\355w\\371\\334\\267\\260^{\\341O\\014ui\\302\\363\\211\\204N^4\\256\\374*\\205\\032\\346\\254\\235\\032I=\\021\\303\\254eG\\305\\034N\\312\\311i`\\271\\016\\261\\236f\\202\\204\\223<\\021\\007y \\352w&\\252\\357GY\\037\\\\\\227\\343\\005\\237\\251\\364\\311\\010\\365y\\2360\\025[k\\032\\007_ZH\\350\\312!\\004A\\2501`\\016\\324\\232,8\\205\\214=\\324k\\220\\264T\\206\\335\\036\\330y\\241h0N\\005\\346Onq\\022[\\241\\365y\\234\\323\\241!5\\3625\\234\\260\\322\\215\\363\\341\\346\\361\\304S\\237\\264\\242\\003\\023\\316Q\\357\\324x[T\\253\\350@\\215\\257\\206>\\254\\365<\\300Uq-\\371\\230Ga\\200\\201\\372\\200\\323!\\252\\314x&\\227R\\216\\357\\3115\\351\\331\\202\\316d\\223*)\\355\\374\\314\\302t\\206\\206\\321\\\\\\014E\\231K\\246H\\275\\024.\\217)#\\256\\234ym\\337\\211\\250\\311c\\343\\3432Cq:\\003\\222\\325\\024\\232\\222\\220c\\266%\\316"~\\262l0@\\313L \\342wq\\302\\335\\333\\022\\375\\206\\252T\\213%g''\\250\\022Z_\\311\\367\\231''\\214\\3708\\261K3X\\205\\011NZ\\277\\371W\\317\\377/\\321`\\001\\263\\311\\240\\332\\034\\354\\010U\\342(7\\311\\212\\2453(\\301\\273\\205z\\361\\351\\245y\\335\\3226\\215\\362g\\2239\\352\\221{\\245BR\\003\\024=hmV\\211\\252\\014\\207\\033g\\315\\020\\342\\024\\365\\352\\367\\267\\022J\\234\\240\\336k\\350\\256$\\375"\\001\\333G\\242\\000\\261\\365\\363\\211\\240\\203)\\352\\271Y>u\\231"\\306\\003\\221\\377\\307\\362\\377^7\\2265\\220\\264S4weX\\026])''\\302\\316\\006\\032\\356n\\304k\\211,\\206q\\315s\\314Ny\\362:T\\206\\206\\332tO\\211c\\226^QA\\315d\\263\\2365\\204\\272\\313:"\\027\\204\\\\\\025\\357,PA3\\273\\256S!\\322\\367q\\225\\373\\305\\352\\207\\323pB\\210\\357\\373\\007\\200\\377\\014\\243u`\\210\\261\\3513\\0131\\222c\\343Q]\\360\\350\\242\\336s\\356\\363\\207\\204K\\206\\206n\\221\\013!l\\031\\262h7\\302\\014\\263\\023\\177i\\274V\\305\\200\\354\\242\\312]\\321\\015\\246|\\0037\\251\\023\\275\\363:\\020@\\3706\\355\\252\\250\\010\\257\\020O\\273iJ\\344\\212q(\\005\\352\\3030\\376D\\225(z*\\341\\307My\\034$\\304\\210\\224\\354=\\025"\\3253\\226\\007\\226\\306\\240\\344\\271\\026\\250\\257\\013\\227\\267j)\\014\\035C\\303\\251\\002[\\225\\310o\\323\\221A=6\\333\\010\\377\\200\\252\\305\\361N\\274\\356\\003\\252L\\375\\334P~n\\352\\230\\027f\\217\\204\\213\\351\\030\\332dU\\300k\\341P\\317P\\237\\321y\\023c\\354\\335\\017J\\314\\357\\311\\205\\004\\317\\006\\314vO`\\222\\362\\357\\361\\373\\013T\\255\\255\\021\\353\\220\\251\\027\\177\\242\\032W6]\\340\\024s\\003\\004\\227\\250\\017Q\\001\\352\\325\\020\\032\\241|\\366\\026\\3117\\015Y|\\026\\337D\\026\\371\\010\\3654\\010\\365(\\204\\341\\314\\011b\\350\\265\\206zS2\\315\\211q\\362sQ\\223:$\\274[)DhW\\210}\\206I\\254\\305\\323"\\357,!\\025\\223\\037`\\242\\350G\\324\\307o-c\\210\\234\\223K%\\333\\246\\336\\007\\230-\\317\\230\\012\\372\\232\\030\\012\\365\\271y\\352\\035W\\032\\304\\221nB&Ou\\234\\234\\342\\032\\275\\256\\346Lif\\353\\234\\355@U\\337\\003\\3707\\\\\\365#S\\2035\\024cM\\225\\263\\217\\372\\234I\\225\\363\\251\\026\\036\\213\\003*\\305Y\\021ir\\302\\316;A\\253\\035qr\\270\\205\\003*\\033P\\352\\242\\265\\352\\031\\346\\232\\367\\247\\016\\3754\\014\\323\\232\\0300\\322\\005\\207\\342\\344\\347\\225M\\271#R\\225;5\\346O\\213\\303\\377ju\\363\\245\\033,$\\274A\\206\\346\\346\\370JDj\\337%\\362V[\\015R\\272.\\302c#E\\363k\\022\\275\\016\\271u:0{n?A\\225\\337\\344\\223\\226U\\012\\377\\003U\\342\\340)\\232{\\255\\273L\\217D\\270\\245\\012Y\\007\\363\\373\\034\\351kil\\327\\205\\227R\\321\\243ga\\205\\252\\265]CP9f[\\250\\224\\211\\020\\335\\363\\214R*\\330M\\320\\025\\347\\003<\\011\\001\\341E \\254MY+\\023Tu|o\\343\\376\\261:`"\\367\\350B\\356\\323[\\\\\\345\\255\\355\\310\\347hY\\331\\226\\210\\020\\373\\242\\254\\235\\013\\302\\312\\0336\\367"\\343\\223\\0339?O\\234\\360|\\250\\302xcu\\266g\\002\\020NPo\\331\\254-\\2729.-_\\300\\253\\252c\\312Q/\\007K\\241\\314\\314\\210\\367\\373\\317t_24\\234\\347!\\346\\305\\366\\314ub\\227\\001\\252\\213\\033\\206j\\224#;\\021\\257\\352}\\246\\256\\333\\017\\274/\\334\\325\\203\\330\\030\\337\\306\\363\\023\\324\\347\\304A\\026\\002\\211v\\355\\202\\240\\312\\340<\\303\\242Y\\301]\\343S\\370Y*\\345{f}\\206z\\201\\356\\232\\020\\237\\014a\\311\\373<\\025\\243\\273\\202\\331\\266\\324^F\\223\\213A-\\022^\\336\\373!\\245\\306[\\335\\024\\205d\\306\\253\\355\\242\\352\\266\\241\\210{\\015U\\272\\011y\\247\\025\\314\\326:N\\205@g}\\341;T\\023oR\\003kw\\302\\250i\\307PM]H9\\230\\262\\341Z8zTg\\227''\\020/\\014u\\353\\264\\360\\324\\304\\355\\034\\263i\\034\\352\\344sS8\\227\\251g-\\215\\223\\324a!E\\342;y2\\362\\027\\253\\022\\336\\366\\340\\205\\325T\\006J\\361;\\250\\217\\022W\\210\\312<*\\366v\\272\\300\\202Qbs\\016\\225\\317\\037\\210B\\371\\022\\365\\032\\264\\276\\031\\315\\013\\361\\356o\\214\\273ri_\\373\\2153\\364Z1\\325q\\025\\365\\0261\\232\\270\\3513\\337\\234?\\310d3o\\240\\352\\244\\261+\\034\\334\\266\\211\\006\\256rz!\\2717\\301\\353\\030\\307\\201\\304\\246m\\012y\\226\\025\\0322\\324\\373;\\321 m\\011\\022*\\023a\\234\\266W\\351$\\220\\337\\205(\\212\\354\\213\\256\\035s\\265\\353\\305\\252\\210?\\317\\303\\0211\\221\\364L8T-O\\3130\\333<\\320\\235gi\\302\\317\\264\\301x8\\255\\242eo\\251A\\035\\332=\\202b\\222\\227\\214\\245\\036\\313\\200\\015-\\271\\2720#\\353\\224F\\017\\365\\371\\204\\335/\\302`\\2514}\\313\\202UmA\\303\\234\\253oP\\365\\314\\336\\222\\205\\344\\312\\210*>''\\250\\217d\\272\\316\\371\\252\\261\\332\\022c\\305\\021N\\217\\304Xy"\\036\\363\\270\\376\\214pp\\037\\325\\320\\015\\235f\\243\\274\\314\\232 \\203-1"\\272\\351\\006b\\2504\\303\\276k\\241\\2416\\202\\353\\011w\\300\\220pSHt\\276w\\037\\2639d:\\350\\340P\\020\\342\\245\\275>%\\337\\373\\230\\366\\3162\\334\\325\\202p\\260k\\306J\\221vO\\270F\\015\\231;\\011\\244\\243\\306\\241\\203\\252\\263\\202\\032\\254\\035\\324[#A\\356\\223\\016S!\\367u\\216\\252\\010\\037\\206\\200\\201\\372\\314\\311I"\\204\\232H4p\\201z\\347]7VZ\\000\\177\\211\\331\\2264)\\345\\270Hp\\2447A\\277\\245E\\022\\347\\022N^&\\220a\\307\\356\\307\\027S\\374\\334h\\014\\226\\364\\2400\\213\\314\\205I\\316\\210\\203.wQe\\236k\\242\\235Nl&T?I,\\216e\\317\\205(\\206c\\241\\236E(\\370\\235\\204\\202\\2512\\216S\\011\\005\\177\\217\\015\\360\\001\\263\\343\\350=\\001r]B\\234''\\250z\\303\\223c\\032\\240\\336\\031A\\213\\216\\373\\306wiy\\220z\\267\\025\\324\\223,W0;\\263\\316\\347Nj\\377\\250#T\\355\\215\\335\\243\\273\\004\\337\\261\\320\\3446\\255\\220\\225G\\032\\012Jd;\\352\\001fk;\\313\\004\\327\\0034w*P\\224\\305j\\000m9\\244F\\213\\\\&K\\236\\336\\310Z+$\\374^3\\203\\345\\331\\3570D\\304\\211:''Bg\\344\\230M{\\240s>\\225(b\\274\\200#[\\246\\363\\303\\262T\\216f\\270k\\277~&\\337\\3661;\\245\\247\\326\\226\\347\\306\\006\\353\\216Zw\\\\\\313`-a\\254\\006\\262(\\236\\205\\261\\372&~~`$7\\004\\356\\262\\364\\207\\006\\313\\211\\304\\353l\\220\\256 \\274GB\\356>I\\234\\203&\\210\\262e\\315\\357\\270J\\306{''Ho\\332`\\260\\224D\\376!\\014#''\\375n\\010\\252\\032\\210\\34220\\256\\013\\011\\357\\331\\261\\020Q\\013Q\\201\\3311d\\231\\205\\031G\\261\\031\\331\\365\\342HD\\014W\\205\\200t7\\213\\024r\\256\\205\\205K s\\255\\021\\335\\024.s3!xh\\302\\252\\252\\240Mu|\\251{\\307\\011\\345\\017Q\\237Z\\303\\260\\234H\\230\\323\\243\\367\\005a\\025\\242$\\253\\332HE\\356C\\254M\\355\\204\\253\\202\\021\\015''\\011\\375M\\013\\357\\265w\\025\\235\\310\\242d\\317\\233\\032\\247y\\3573\\025"\\237\\347\\373A\\366F_\\316\\227\\350\\361\\257\\320\\361S!\\254\\224\\264^~"\\303\\250\\305\\304\\274\\341\\034%\\376\\003\\252\\2114J\\266\\027\\302]\\361\\302i\\213\\337S\\314\\231p<\\207+\\241\\261\\3320c\\305\\220t\\210\\331QV\\\\D,\\277!\\272rT\\342\\004\\365\\300\\010\\375\\037p%\\323\\277@}TT\\027\\351\\016\\242\\256\\252\\2527\\355`6M\\244\\233 p\\013\\333\\354\\224\\372\\337\\242\\352\\224\\311\\202\\355\\023\\324g\\317u\\022\\341\\007\\346 \\232\\353\\256#\\345>8uiOT\\316a\\202HfXE\\2258\\325\\316E\\321_\\206z\\317\\3747\\202\\236\\266Q\\237N\\304\\365\\241\\\\\\340\\323\\270\\307t 4f\\217b\\015\\345\\250\\246w\\377a\\216!\\027\\004\\246#\\300\\376\\210\\277_\\023\\264\\317T\\004\\016Q\\371\\023U''\\010MM\\371$\\000D\\366\\213\\322\\005z\\315\\224\\256\\341\\353\\330\\033\\354H\\324\\310q\\357\\023\\030\\252\\354\\232J\\307m\\220\\233\\252\\011CT\\271./p\\225g\\3030l\\313\\026O.a\\030\\215\\325\\333x>1\\365\\242\\274\\306\\271\\364Q/K!w\\265g^]\\025\\030\\266=\\346T\\343\\327r\\036\\027\\211\\220T\\021\\326P\\310\\334\\227a\\264\\236\\312bM\\325\\351\\245\\3127:\\306W\\244r\\270\\274c\\205\\317u\\324\\031\\210\\277\\243\\336\\203\\234\\010k\\210\\346\\336\\347\\251u3\\257m\\356"d\\245\\016\\344!\\252\\3747v\\236\\030\\030\\322\\325\\201\\035:\\256j\\336:\\320\\241\\266G\\250\\372Y=Ip\\246\\220(\\200\\250\\370C\\030\\033\\242\\261\\275pn\\317b\\275\\024\\361\\236\\277\\241J\\253\\030\\241\\336rGC\\323W\\250\\272\\204\\024\\261\\3219\\266\\3554\\316\\355\\377\\307}y\\213\\372\\020\\223\\317q\\370\\3706"S\\336\\017\\235\\333\\370\\036W\\235VY\\372s\\006`\\332\\373\\004\\206\\312\\363|\\200\\331\\266\\254\\371-/\\222W\\335o\\212\\007\\375\\036W\\223o\\277\\017\\203A\\356\\312s\\257FB\\230\\322P\\220 \\326\\321\\357\\327Q''\\327\\304\\200\\220?\\333C:\\347\\312\\215\\325o\\250\\362\\256\\350U\\232\\006\\224zX\\310\\036\\363\\344gz\\250''qz\\253\\235\\246^\\333H \\343\\0249\\256I\\243\\332\\341\\341\\255pp\\277\\242\\232\\237w\\216\\331Z\\271&c\\225ZW)\\345p\\221s\\323!\\260$\\273\\367,\\\\s\\343{.B\\301G\\324\\023"\\233\\326k\\216\\372P`\\2468<\\2250G\\313\\221t\\354\\375\\363\\370{\\3469=\\215\\260\\376\\211\\031\\254\\276\\030\\305#T\\275\\371Y]\\301\\220p_B\\252\\323\\270\\037j\\260^\\305}\\371%\\376\\357T8\\254\\362\\226\\264\\314u\\214\\226\\316Ed\\3243\\211\\353\\276\\025\\257\\371\\030\\353\\350\\347\\270\\236\\247\\000.{wh\\2544\\273Y''\\307\\252\\2622\\306l%z\\201\\371e\\027>\\307\\014f\\254\\206Bdr\\344\\367?P\\215\\022\\327\\021Z\\205\\021\\355T\\344~\\2630lrM\\203Jb\\232J\\3203T\\023x\\011\\3575s\\330\\271\\236?\\342\\034\\376D\\225\\2373\\306\\342\\022\\234\\262!\\005 ex\\012C\\023%f\\2231\\213\\006eL\\357\\0259\\205sA#lE\\362Z\\214\\026\\373\\217\\037\\213\\252\\246\\035''=\\303\\272i\\312Qjp\\301\\262|\\346P\\324\\342T\\250\\326\\025\\244\\313DPM\\354<\\233''\\274\\240\\336WJ''\\032\\261\\366s\\017U\\276\\235+\\310\\333\\261>\\030\\256\\255\\3069>\\013''\\273&\\352\\341\\211\\235\\273*\\255\\244.\\250Xvd\\303\\377&\\250\\366L\\304\\201}A\\275\\313\\344P\\335Y\\204\\210z{&\\236/E\\003\\266\\035/Q\\015|\\321\\310\\347\\326\\006+\\325\\266\\203\\315\\357t\\336\\234.t\\355\\321M%\\256#\\234\\200\\267t)\\033<\\361\\252\\334x*q\\337\\003\\370)\\236\\237\\010o\\2457wb\\212\\034\\215\\325\\001\\352\\203:\\2275X:%w''\\026\\333\\236\\240\\253mQ\\214\\234;;\\020\\203\\305\\334\\034\\015\\005\\36397^[\\235\\234\\0101\\273\\222\\010\\011\\275\\300[\\011\\333\\242A\\021*Po\\015=\\226{x,\\336\\376=\\352\\0358\\017\\343\\231\\\\\\340\\245(`9\\322\\255v3\\273\\236)C</\\327''3\\221`ETA\\032\\253''\\250\\022;\\373\\011\\341\\205\\367\\203\\305\\346\\207\\346\\274\\026e\\233\\263`\\234\\337\\237\\375\\304\\036\\242\\352\\275\\246\\355\\245\\267Pe\\376\\217Q\\315\\332\\334F\\275\\276\\224\\206W''N{\\377\\370\\\\\\326T.\\347\\261!\\344\\275\\216L;\\223pw\\212\\273m;\\275lX\\010T}\\267\\246\\202\\010S\\347\\373W\\267\\326\\273@X\\236w\\244\\311\\205\\233\\250j\\372(a\\236\\240\\236\\34741"\\034&\\261k\\277*\\355\\316\\300\\274 B\\353o\\003]\\275\\020i_\\345a\\3551E\\362\\361\\347\\200\\235\\257\\227\\344,\\346\\021\\376\\374\\356$\\332\\331bx(\\036QCAv''\\345\\220\\201\\267\\250''\\254\\026s<\\224\\243\\002\\222\\255k\\261\\370\\267\\215\\243Q\\224\\253\\275\\257\\274+\\206\\266xQ\\202W\\373D1_\\215\\306\\212s\\372|\\362\\257\\016\\217\\325qkZ{X\\313\\261\\021\\024\\335\\305l\\026\\277w5\\365n\\017\\035S\\343\\210\\272\\237\\306\\275`\\027\\330T\\036\\336\\010\\3652\\233C1\\266\\323%\\326\\202*\\206\\254T8\\210\\353\\243b\\313@\\004\\223\\\\\\356\\323T8\\31151\\352>\\270\\302''\\013\\251\\321\\327\\272<\\032\\200\\276\\245Gh\\333\\3511\\356\\246E\\321M\\221V.\\216\\231 B[\\016i\\372\\003K\\322n\\245\\022\\352"a\\\\\\376@\\024\\272\\347\\202.\\246\\302\\0150\\233\\374\\034\\365\\366\\257\\356\\3313Y\\324\\205\\300\\343\\025Ar\\017\\215h\\377\\006U\\217&\\277\\361\\271\\300f\\016N\\375=6:\\271\\253\\353\\364\\231\\312\\344|6\\004\\351\\275\\024t\\265\\205z\\031\\220\\032\\254}Ql\\336\\242j\\207{\\261\\204G\\367\\321S\\257P\\025\\350R"\\366\\344\\324\\322\\344\\372\\221,\\332Ib\\023xou\\366\\212:C=\\301\\366T<\\266.\\256\\211\\205z\\003\\013S\\275&\\264\\260\\315\\250e\\031\\332Jz$\\353ES\\035\\264\\267\\330F\\\\\\377\\227\\261\\026_\\240\\312\\217\\322M\\221\\013\\237\\302p\\351\\300\\3220\\362%\\015\\0267\\336\\261\\210\\017oQ\\317\\275\\323\\260\\234\\353\\242\\217z\\363\\303\\2769k\\337\\270yC\\010M\\224\\244\\373\\251k\\252oa\\206-\\307\\375\\034\\336z\\232\\010\\325\\253%r{\\224w\\201\\260\\272\\250''J~\\007\\340?\\342\\371Q\\374\\337X\\302\\026\\306\\317''\\250\\247\\346\\353\\027\\351&\\214\\227\\026C\\016\\205hg\\2238Eu\\336HM\\313^\\376D5\\353M\\307''\\215\\027\\300c''\\177y.\\254U|&\\252\\240\\346\\\\\\015dA\\351D_N\\300y\\203zr\\345"\\203\\351\\023w\\217\\343}\\210b\\337\\242\\312v\\327\\256\\252:_qd\\033\\300\\221Vf$\\271\\366\\371\\346P\\214\\013ARc\\341\\345\\274''\\272\\237w\\226\\340\\326\\234\\223\\323\\320\\216i\\000\\027\\361\\0327XZ ;\\264\\373\\3614\\350\\201\\347F\\200g\\011\\002\\370\\275\\204\\2657\\341w\\370^l|\\310p_\\311\\367\\236)\\264\\003\\023H|6\\201\\032\\324S\\3333E\\203\\000\\340\\353G\\235\\277\\227\\340\\334\\347\\341\\303\\\\\\233\\206\\202\\324\\214\\363] \\254\\256l\\334]!\\276\\177\\212\\177\\367P\\357\\204\\360T\\342\\350KS)R\\362}a\\241''!\\377:\\252\\016\\002\\233\\250:\\221j\\026\\266"\\204#T\\303)\\377+\\014\\326k\\221L\\307s\\024\\271\\314<\\226\\032\\316\\007\\202\\360\\276C\\325\\215\\201\\234CG 9\\0157\\207q\\376\\216\\252\\246l\\264\\244z\\352\\310\\347\\3048\\214\\327b\\264\\007\\302C)\\331?\\301\\354`\\207\\224\\301\\362\\2111S{\\366j\\200y\\003\\010\\232\\026\\254\\027\\375N\\305XqM=\\215\\327l\\310yk\\031\\326\\000\\365\\302\\345\\207\\341\\304\\236\\242\\252#\\245\\370\\242!\\211\\207\\203l\\375\\342Y\\371\\313r3\\332\\330\\357\\015\\252>X\\212x\\265\\226\\265\\234\\243\\342NQ\\257\\3028\\224}3\\235sne"b\\301\\027b\\244\\232(\\216\\254a\\255\\314(\\330w\\245\\022\\366\\305\\033\\262L\\204\\003\\013\\270a\\206"\\277\\2170\\333/\\033\\230m\\355Z&\\274O\\027\\365b\\326\\025\\011\\033\\274pT\\221\\325\\2530R\\034\\371\\375ZB\\323\\361\\034\\271=\\225\\355\\315\\315\\244\\255\\227\\177\\014\\203\\365TB\\200\\322`\\257\\266<~#j\\222\\222\\323\\313zs\\310\\367+$\\034Q\\316\\254+|\\215\\267\\236\\326\\220\\003\\250W\\356{\\316\\234\\207\\021>&j\\331~aH\\210\\011)\\204\\305\\224\\204\\335p\\004\\210kz*\\034\\030\\027\\366\\2528\\260-\\324\\273\\234\\356\\240J\\022UeP{\\2233\\034|''\\252\\346_\\234\\311\\015\\011e\\346\\244\\275\\221sY\\223\\020}\\305"\\000\\237O\\231\\213\\223e_4\\355\\211\\266\\2141\\375b\\214\\323\\222\\363\\005\\226:\\357\\273"\\335\\025mi\\241mj\\224\\326\\232\\205!E\\203T\\277\\2107\\323A\\006\\035\\314N]\\321\\360\\353U\\204\\201\\232\\314\\310\\304\\271Q\\203"\\247\\355~W\\344\\334W\\005\\331\\355\\240*\\256\\376Q\\270\\022\\345\\217\\264{''\\211v\\226\\254\\354\\243\\336\\2552\\277\\246w\\312\\315\\2500LSc\\245\\244\\255O"\\316\\015\\201u1;v\\251L\\020\\300\\327\\235^\\223\\252\\321\\323\\341\\242\\2059&E\\354e\\\\\\353c\\271N\\205\\254_m7=\\024G\\302\\337\\3651;OQ\\245u\\336\\223}T}\\347/q\\263\\256\\256J&3C}S\\324:"\\336MS\\002\\235\\303\\033ID\\360{B\\224\\271\\351\\264\\244\\177\\371\\343.\\014\\226\\327a\\215Q\\257\\004\\357\\033\\362\\351\\241\\236\\217S$\\340`j\\304|''\\021\\353v\\315\\310i\\213b"\\253\\327\\201\\254\\376\\023\\325\\350o\\226%\\2347(r\\212\\344Ve\\023\\250\\327~`\\341\\340sT\\011\\177\\332ZD\\013N\\031\\012r\\242\\257\\206\\0377\\205\\323\\352\\331\\273\\361^\\363*\\015\\200\\346\\234'' \\335\\235 \\011\\317o\\270F|\\304\\223;(U\\235\\231\\022p!\\216e\\202\\331j~%\\346\\371s\\317\\014\\267\\327\\014Ra\\325i\\3324Xs\\311\\3669}\\334\\264M\\014\\363\\236\\376\\220\\360\\234!\\357\\036\\252^[=\\343r\\246"\\014\\375\\034N\\226k\\366\\004\\267\\033\\357\\366\\2676X\\352\\331u\\334\\366\\221@k\\345p\\320 a#\\241\\0265u\\231,\\347\\374\\254\\003$\\270Xh\\254\\376''\\020\\326oB\\262_\\314A5\\232\\256\\3000W9\\221]TY\\345,vUu\\322\\247\\361\\252\\361d\\032\\303;AW\\267\\221\\227\\013#U;\\015\\210\\265\\274\\016\\364\\376\\204\\234\\005\\325M\\326\\207M0\\333\\013I\\307\\201\\321a\\024&\\3168\\217\\352c\\303:\\211u\\244\\306J\\313\\241\\376D\\275,kzK\\343\\254}\\321\\265\\272\\201\\263\\037\\217\\202\\333Z\\027\\365Ps\\217\\016b\\215\\374\\022\\353\\366\\017\\324''\\323$\\317\\357\\023g\\250\\337:,\\374\\022\\020Vi\\213\\220\\322\\360+T\\222>\\314pu\\261\\2702\\177Y\\202.7\\005l\\204\\372\\014C\\226!\\374\\0327\\235<\\200&\\315\\245B\\334\\216\\221\\352\\317Cm\\372\\036U\\366:\\241\\276\\206"J\\370\\3539\\221C\\373\\015U\\217v\\2068Ky\\363krD_\\314\\021(\\304\\273Wj>\\027{\\241\\353`\\020E\\343y\\254\\243\\262\\001\\011\\3520\\213,\\201\\304\\275\\323%\\235\\331\\253@0\\244\\010\\016Po\\224X.\\263\\011\\033\\270\\231B\\220\\356\\241\\011\\036\\024]\\036\\243Rs\\201z\\022\\360>f;w|D\\275o\\372\\337\\362\\270+\\204\\305\\220\\207i\\003\\353\\262\\310\\306\\230\\235\\024\\234%\\214V\\212pW#\\346M\\306\\012Sz\\330\\017\\210\\236\\363wQ\\342\\230\\336\\357\\303%R\\306R{\\200\\257\\007z\\372\\006\\300?\\343\\361L8\\022\\242\\000m\\004\\247\\327gl\\306\\352\\227\\370Y''\\340\\374\\035\\026_i\\224\\001+\\015\\230\\247D\\203\\245\\305\\321\\231!$_\\023\\256 ;B\\365)7)\\344\\375\\277\\361x\\203z\\033\\352\\342\\226\\010\\206\\347Ku\\\\U?%\\343\\267\\205>\\230\\212\\301b\\256\\342\\001\\252\\376l>\\001\\2735X\\267\\010G\\306\\002\\263\\373B\\336\\022\\026\\263B\\236\\3454\\231\\240-\\257\\314O\\2055\\031f\\033\\226i\\245<k\\332X|\\372:\\0364\\016:\\304a\\212\\371\\343\\210\\224lg\\373\\226''\\301S\\2610u\\305\\370\\021\\337\\\\\\332\\362\\343m\\030\\253\\237\\305x\\222\\273\\372\\234u\\\\_\\302\\2415dL\\234e5\\000\\327B\\037\\351z\\306\\246ZB\\317\\351\\322!\\007\\332O\\211\\311\\256\\332\\306G\\3537OQo%sWFZ\\313\\254F\\202\\240\\326\\305\\261wQ\\237\\011\\310bj\\326k^\\374\\015\\327\\312''#\\335\\013\\271\\031\\231\\305\\353,0~\\024\\033\\2373\\3314\\2613E\\234\\243\\201\\364-\\014\\325q\\001\\034\\213W\\332\\027\\357\\364\\001\\365\\366\\274\\313\\220\\225\\236\\030\\312\\211\\315\\332\\374\\255\\213t\\363~^\\017\\315\\305\\241''\\377\\005U\\331\\307R\\013\\360K\\346$nH\\272O-\\354\\371\\035U2''\\215\\374\\272\\221\\346\\231Q\\011\\272N\\012\\273\\356*\\372\\\\\\312\\306?\\2225\\361F\\034\\332>fS\\031\\256e\\024\\226\\220\\354\\013\\324+\\012.P\\237h\\234*\\212\\277\\024c\\353\\271rh\\015\\326\\355\\027\\243\\307\\325Z\\347\\366N\\020\\326\\006fG\\263\\3238xW\\201\\016f%_m\\266O#t*\\006\\353\\243\\360"\\364T\\012\\363\\257\\313\\357dK\\376\\237\\312\\365\\354\\017\\257y_?\\013\\261{\\3727\\345"4,<\\0274\\316\\372BR\\012;\\250z\\306\\017P\\257''l*\\214\\327\\251\\333\\244\\007R5\\217\\357Po\\333\\314u\\262\\320X\\335\\320y\\350\\371MPWH\\317\\215w\\323\\353\\343yn\\013\\215\\350W\\344\\334>\\271\\301rRU''\\246\\220\\000\\177\\203*yO\\247\\305\\364\\204XE\\374\\276@\\272\\251\\034P\\257+"\\302\\342\\002\\245\\352t&\\0137\\277\\201\\327\\324|\\241\\261y\\351\\017\\250O\\240\\341#7R\\365-*u\\362\\177\\202\\364\\177\\207\\252\\374\\346\\357*Kk\\276\\230\\346\\3151\\333\\3745\\252DKo\\361\\354\\015\\011!\\367U{s\\235\\232\\261\\242##\\027\\304\\207\\226\\033\\335d\\224\\333M\\370^\\215\\020:h\\356\\314{\\223\\261\\365\\255\\301\\272Ah\\3507e$\\350\\207a\\340j\\302k\\026\\266\\371\\275`\\263\\203\\331\\244G\\032Ef\\005k\\311\\310\\030\\263uH\\327YX>\\335\\227<\\324 >K''\\256\\224f\\240\\017Q\\265\\255\\371o\\\\\\021\\377:Pb!G\\362\\025{\\313R\\370\\303s\\324\\007p\\034\\307uc\\330M\\203\\245\\241\\223\\226\\264d\\250\\347u1%@\\013\\264\\311m2\\215\\202\\016n\\214\\372\\010\\372[]\\360k\\316\\327\\314\\315\\020es\\326a{|B\\203\\345Hk\\212\\372l:\\345$\\264\\261_\\267\\001F+O\\241\\010\\313\\313]\\012\\3146\\004\\274M\\274\\357\\350\\212\\006\\250\\037\\337\\347}l*M\\325\\270\\024\\343v \\034\\311\\237\\302\\223\\234\\341\\032\\222\\371W~\\320!\\250\\312{\\202*=\\204H| \\216Ag(f\\266\\006\\224\\323\\274\\020\\004\\245h{b\\210;o2\\0147u\\030\\327\\374\\273[\\315:h\\015\\326\\335\\303\\337\\014\\365\\324\\003\\2351\\347\\363\\346<\\245Ao\\2447\\367\\363:\\264"\\361\\363]p-\\0141\\216P\\311\\316''\\270R\\265\\264)\\2377\\033\\243*y(\\341H\\253\\362\\244\\257\\26164\\324\\016\\246tn\\003\\341\\271\\006\\362\\267}\\371;-\\365!\\342\\326\\276\\347:\\264\\301G\\263\\267Gk\\260\\222\\036\\304\\2071b\\016\\034v\\303\\3451\\276\\277\\367\\215\\015@\\303\\230(U\\264Fb$)\\307o\\211\\367\\327Q]\\312\\245i+\\220\\245\\363g\\376.\\304\\251\\335C\\355:{\\211\\331\\222\\032\\025gR\\003*J3\\\\\\216\\272K\\\\\\277\\366\\261=\\276\\320#\\373\\233m\\222\\232\\201Zb\\202\\263\\326\\2651\\305A\\007\\221\\352\\206\\231X\\010<A\\275\\314c\\251\\314\\351\\257\\361:/\\3632C\\336n\\234\\2246\\350bv\\010\\253\\347\\350\\335\\011\\342\\376\\273\\356\\215\\326`\\375kn,\\3354:\\005Y\\275\\277\\207\\246\\023\\244{L\\375m\\221\\325\\015\\007\\356.B\\343\\237\\004q\\267\\006\\2535X_\\303\\306R\\303\\345\\035!\\275I\\332\\274\\0110\\355\\306h\\217\\366\\270\\345\\321k/\\301R\\\\\\213\\367 O\\225\\023\\271\\267o\\217\\366h\\217\\026a\\265G{\\264\\307\\337\\365\\350\\264\\227\\240=\\332\\243=Z\\203\\325\\036\\355\\321\\036\\355\\321\\032\\254\\366h\\217\\366h\\015V{\\264G{\\264Gk\\260\\332\\243=\\332\\243=\\356\\346\\370\\277\\001\\000y\\311@\\023\\335X\\314\\215\\000\\000\\000\\000IEND\\256B`\\202', 2);

-- ----------------------------
-- Table structure for sa_kvsequence
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_kvsequence";
CREATE TABLE "public"."sa_kvsequence" (
  "k" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "v" int4 NOT NULL
)
;
COMMENT ON TABLE "public"."sa_kvsequence" IS '自动单号索引';

-- ----------------------------
-- Records of sa_kvsequence
-- ----------------------------

-- ----------------------------
-- Table structure for sa_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_log";
CREATE TABLE "public"."sa_log" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "stypename" varchar(100) COLLATE "pg_catalog"."default",
  "sdescription" text COLLATE "pg_catalog"."default",
  "sprocess" varchar(2048) COLLATE "pg_catalog"."default",
  "sprocessname" varchar(2048) COLLATE "pg_catalog"."default",
  "sactivity" varchar(100) COLLATE "pg_catalog"."default",
  "sactivityname" varchar(2048) COLLATE "pg_catalog"."default",
  "saction" varchar(100) COLLATE "pg_catalog"."default",
  "sactionname" varchar(2048) COLLATE "pg_catalog"."default",
  "sstatusname" varchar(64) COLLATE "pg_catalog"."default",
  "screatetime" timestamp(6) DEFAULT now(),
  "screatorfid" varchar(2048) COLLATE "pg_catalog"."default",
  "screatorfname" varchar(2048) COLLATE "pg_catalog"."default",
  "screatorpersonid" varchar(36) COLLATE "pg_catalog"."default",
  "screatorpersonname" varchar(255) COLLATE "pg_catalog"."default",
  "screatorposid" varchar(36) COLLATE "pg_catalog"."default",
  "screatorposname" varchar(255) COLLATE "pg_catalog"."default",
  "screatordeptid" varchar(36) COLLATE "pg_catalog"."default",
  "screatordeptname" varchar(255) COLLATE "pg_catalog"."default",
  "screatorognid" varchar(36) COLLATE "pg_catalog"."default",
  "screatorognname" varchar(255) COLLATE "pg_catalog"."default",
  "sip" varchar(32) COLLATE "pg_catalog"."default",
  "sdevicetype" varchar(100) COLLATE "pg_catalog"."default",
  "soperatingsystem" varchar(100) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_log"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_log"."stypename" IS '类型名称';
COMMENT ON COLUMN "public"."sa_log"."sdescription" IS '描述';
COMMENT ON COLUMN "public"."sa_log"."sprocess" IS 'Process';
COMMENT ON COLUMN "public"."sa_log"."sprocessname" IS '模块名称';
COMMENT ON COLUMN "public"."sa_log"."sactivity" IS '功能';
COMMENT ON COLUMN "public"."sa_log"."sactivityname" IS '功能名称';
COMMENT ON COLUMN "public"."sa_log"."saction" IS '动作';
COMMENT ON COLUMN "public"."sa_log"."sactionname" IS '动作名称';
COMMENT ON COLUMN "public"."sa_log"."sstatusname" IS '状态名称';
COMMENT ON COLUMN "public"."sa_log"."screatetime" IS '创建时间';
COMMENT ON COLUMN "public"."sa_log"."screatorfid" IS '创建人全id';
COMMENT ON COLUMN "public"."sa_log"."screatorfname" IS '创建人全名称';
COMMENT ON COLUMN "public"."sa_log"."screatorpersonid" IS '创建人id';
COMMENT ON COLUMN "public"."sa_log"."screatorpersonname" IS '创建人名称';
COMMENT ON COLUMN "public"."sa_log"."screatorposid" IS '创建人岗位id';
COMMENT ON COLUMN "public"."sa_log"."screatorposname" IS '创建人岗位';
COMMENT ON COLUMN "public"."sa_log"."screatordeptid" IS '创建人部门id';
COMMENT ON COLUMN "public"."sa_log"."screatordeptname" IS '创建人部门';
COMMENT ON COLUMN "public"."sa_log"."screatorognid" IS '创建人机构id';
COMMENT ON COLUMN "public"."sa_log"."screatorognname" IS ' 创建人机构';
COMMENT ON COLUMN "public"."sa_log"."sip" IS '客户端IP';
COMMENT ON COLUMN "public"."sa_log"."sdevicetype" IS '终端类型';
COMMENT ON COLUMN "public"."sa_log"."soperatingsystem" IS '操作系统';
COMMENT ON COLUMN "public"."sa_log"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_log" IS '系统日志';

-- ----------------------------
-- Records of sa_log
-- ----------------------------
INSERT INTO "public"."sa_log" VALUES ('72FAE5362617400286776AECEE12200A', '功能页面', '{"language":["zh_CN"],"process":["/doc/docSettingProcess"],"activity":["/doc/docSettingProcess"],"tabId":["383DFCD37CF142F8A22EE5BC517A3A1D"]}', '/doc/docSettingProcess', '文档管理', '/doc/docSettingProcess', '文档配置', '/docManage/docSetting', '打开页面', NULL, '2024-11-23 21:09:55.201', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', 'PC', NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A3A5FF505C8F47F5A3A72DA5464F07AA', '功能页面', '{"language":["zh_CN"],"process":["/doc/docCenter/process"],"activity":["/doc/docCenter/process"],"tabId":["0B5307D27B7E41AA9D9D7552F4E97D61"]}', '/doc/docCenter/process', '文档管理', '/doc/docCenter/process', '文档中心', '/docManage/docCenter', '打开页面', NULL, '2024-11-23 21:09:56.255', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', 'PC', NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B3A2EF197A7242BE94E758BF21977B57', '功能页面', '{"language":["zh_CN"],"process":["/SA/functionTree/process"],"activity":["/SA/functionTree/process"],"tabId":["sysmenus"]}', '/SA/functionTree/process', '系统管理', '/SA/functionTree/process', '菜单设置', '/system/sysMenu', '打开页面', NULL, '2024-11-23 21:10:04.741', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', 'PC', NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0BA37DA16343453582F8328DC2E71A06', '功能页面', '{"language":["zh_CN"],"tabId":["7667776866354B469085E9BD7A1146C2"]}', NULL, '系统管理', NULL, '菜单设置', '/system/sysMenu', '打开页面', NULL, '2024-11-23 21:11:26.344', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', 'PC', NULL, 0);

-- ----------------------------
-- Table structure for sa_loginlog
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_loginlog";
CREATE TABLE "public"."sa_loginlog" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "suserid" varchar(36) COLLATE "pg_catalog"."default",
  "susername" varchar(100) COLLATE "pg_catalog"."default",
  "sloginip" varchar(100) COLLATE "pg_catalog"."default",
  "slogintime" timestamp(6),
  "password" varchar(100) COLLATE "pg_catalog"."default",
  "sserviceip" varchar(100) COLLATE "pg_catalog"."default",
  "sday" varchar(100) COLLATE "pg_catalog"."default",
  "sdaynum" int4,
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_loginlog"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_loginlog"."suserid" IS '用户id';
COMMENT ON COLUMN "public"."sa_loginlog"."susername" IS '用户名称';
COMMENT ON COLUMN "public"."sa_loginlog"."sloginip" IS '登录IP';
COMMENT ON COLUMN "public"."sa_loginlog"."slogintime" IS '登录时间';
COMMENT ON COLUMN "public"."sa_loginlog"."password" IS '密码';
COMMENT ON COLUMN "public"."sa_loginlog"."sserviceip" IS '服务器IP';
COMMENT ON COLUMN "public"."sa_loginlog"."sday" IS '星期几';
COMMENT ON COLUMN "public"."sa_loginlog"."sdaynum" IS '周几';
COMMENT ON COLUMN "public"."sa_loginlog"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_loginlog" IS '登录日志';

-- ----------------------------
-- Records of sa_loginlog
-- ----------------------------
INSERT INTO "public"."sa_loginlog" VALUES ('9C58B2FC216E4FD9ACFFE722B791F30D', 'PSN01', 'system', '127.0.0.1', '2024-11-23 21:09:47.494', '·! @¹#y$¤%^¦&«*µ¸q¢«¥¤°¹{¥¬´ª²­m¨¬µ', '192.168.119.1', '星期六', 7, 0);

-- ----------------------------
-- Table structure for sa_mailset
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_mailset";
CREATE TABLE "public"."sa_mailset" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "smail" varchar(100) COLLATE "pg_catalog"."default",
  "saccount" varchar(100) COLLATE "pg_catalog"."default",
  "sname" varchar(200) COLLATE "pg_catalog"."default",
  "stype" varchar(20) COLLATE "pg_catalog"."default",
  "ssendhost" varchar(100) COLLATE "pg_catalog"."default",
  "ssendpost" varchar(10) COLLATE "pg_catalog"."default",
  "sisssl" varchar(10) COLLATE "pg_catalog"."default",
  "srechost" varchar(100) COLLATE "pg_catalog"."default",
  "srecport" varchar(20) COLLATE "pg_catalog"."default",
  "srecssl" varchar(10) COLLATE "pg_catalog"."default",
  "sispub" varchar(10) COLLATE "pg_catalog"."default",
  "fcreatepsnfid" varchar(2048) COLLATE "pg_catalog"."default",
  "fcreatepsnid" varchar(36) COLLATE "pg_catalog"."default",
  "fcreatepsnname" varchar(100) COLLATE "pg_catalog"."default",
  "fcreatedeptid" varchar(36) COLLATE "pg_catalog"."default",
  "fcreatedeptname" varchar(200) COLLATE "pg_catalog"."default",
  "fcreateognid" varchar(36) COLLATE "pg_catalog"."default",
  "fcreateognname" varchar(200) COLLATE "pg_catalog"."default",
  "fcreateorgid" varchar(36) COLLATE "pg_catalog"."default",
  "fcreateorgname" varchar(200) COLLATE "pg_catalog"."default",
  "fcreatetime" timestamp(6),
  "version" int4
)
;
COMMENT ON COLUMN "public"."sa_mailset"."smail" IS '邮箱地址';
COMMENT ON COLUMN "public"."sa_mailset"."saccount" IS '密码';
COMMENT ON COLUMN "public"."sa_mailset"."sname" IS '发信名称';
COMMENT ON COLUMN "public"."sa_mailset"."stype" IS '邮箱类型';
COMMENT ON COLUMN "public"."sa_mailset"."ssendhost" IS '发件服务器';
COMMENT ON COLUMN "public"."sa_mailset"."ssendpost" IS '发件端口';
COMMENT ON COLUMN "public"."sa_mailset"."sisssl" IS '发件是否启用SSL';
COMMENT ON COLUMN "public"."sa_mailset"."srechost" IS '收件服务器';
COMMENT ON COLUMN "public"."sa_mailset"."srecport" IS '收件端口';
COMMENT ON COLUMN "public"."sa_mailset"."srecssl" IS '收件是否启用SSL';
COMMENT ON COLUMN "public"."sa_mailset"."sispub" IS '是否公用';
COMMENT ON COLUMN "public"."sa_mailset"."fcreatepsnfid" IS '创建人FID';
COMMENT ON COLUMN "public"."sa_mailset"."fcreatepsnid" IS '创建人ID';
COMMENT ON COLUMN "public"."sa_mailset"."fcreatepsnname" IS '创建人名称';
COMMENT ON COLUMN "public"."sa_mailset"."fcreatedeptid" IS '部门ID';
COMMENT ON COLUMN "public"."sa_mailset"."fcreatedeptname" IS '部门名称';
COMMENT ON COLUMN "public"."sa_mailset"."fcreateognid" IS '机构ID';
COMMENT ON COLUMN "public"."sa_mailset"."fcreateognname" IS '机构名称';
COMMENT ON COLUMN "public"."sa_mailset"."fcreateorgid" IS '组织ID';
COMMENT ON COLUMN "public"."sa_mailset"."fcreateorgname" IS '组织名称';
COMMENT ON COLUMN "public"."sa_mailset"."fcreatetime" IS '创建时间';
COMMENT ON TABLE "public"."sa_mailset" IS '邮箱接口设置';

-- ----------------------------
-- Records of sa_mailset
-- ----------------------------

-- ----------------------------
-- Table structure for sa_onlineinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_onlineinfo";
CREATE TABLE "public"."sa_onlineinfo" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "suserid" varchar(36) COLLATE "pg_catalog"."default",
  "susername" varchar(100) COLLATE "pg_catalog"."default",
  "suserfid" varchar(1024) COLLATE "pg_catalog"."default",
  "suserfname" varchar(1024) COLLATE "pg_catalog"."default",
  "sloginip" varchar(100) COLLATE "pg_catalog"."default",
  "slogindate" timestamp(6),
  "ssessionid" varchar(100) COLLATE "pg_catalog"."default",
  "sserviceip" varchar(100) COLLATE "pg_catalog"."default",
  "smachinecode" varchar(100) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_onlineinfo"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_onlineinfo"."suserid" IS '用户id';
COMMENT ON COLUMN "public"."sa_onlineinfo"."susername" IS '用户名';
COMMENT ON COLUMN "public"."sa_onlineinfo"."suserfid" IS '用户路径id';
COMMENT ON COLUMN "public"."sa_onlineinfo"."suserfname" IS '用户路径名称';
COMMENT ON COLUMN "public"."sa_onlineinfo"."sloginip" IS '登录IP';
COMMENT ON COLUMN "public"."sa_onlineinfo"."slogindate" IS '登录时间';
COMMENT ON COLUMN "public"."sa_onlineinfo"."ssessionid" IS '用户标志';
COMMENT ON COLUMN "public"."sa_onlineinfo"."sserviceip" IS '服务器IP';
COMMENT ON COLUMN "public"."sa_onlineinfo"."smachinecode" IS '机器码';
COMMENT ON COLUMN "public"."sa_onlineinfo"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_onlineinfo" IS '在线用户';

-- ----------------------------
-- Records of sa_onlineinfo
-- ----------------------------
INSERT INTO "public"."sa_onlineinfo" VALUES ('A517EC6DA22048379FBD43DEE323B167', 'PSN01', 'system', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '127.0.0.1', '2024-11-23 21:09:47.398', '65fe1f70-253b-4f85-aa53-be16f7133aa7', '192.168.119.1', '06D3C72DFBB4490B878CA394CDB9F8CD', 0);

-- ----------------------------
-- Table structure for sa_opagent
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_opagent";
CREATE TABLE "public"."sa_opagent" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "sorgfid" varchar(2048) COLLATE "pg_catalog"."default" NOT NULL,
  "sorgfname" varchar(2048) COLLATE "pg_catalog"."default" NOT NULL,
  "sagentid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "svalidstate" int4 DEFAULT 1,
  "sstarttime" timestamp(6),
  "sfinishtime" timestamp(6),
  "sprocess" text COLLATE "pg_catalog"."default",
  "screatorid" varchar(32) COLLATE "pg_catalog"."default",
  "screatorname" varchar(64) COLLATE "pg_catalog"."default",
  "screatetime" timestamp(6),
  "scantranagent" int4 DEFAULT 0,
  "version" int4 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_opagent"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_opagent"."sorgfid" IS '组织路径id';
COMMENT ON COLUMN "public"."sa_opagent"."sorgfname" IS '组织路径名';
COMMENT ON COLUMN "public"."sa_opagent"."sagentid" IS '代理用户id';
COMMENT ON COLUMN "public"."sa_opagent"."svalidstate" IS '状态';
COMMENT ON COLUMN "public"."sa_opagent"."sstarttime" IS '开始时间';
COMMENT ON COLUMN "public"."sa_opagent"."sfinishtime" IS '结束时间';
COMMENT ON COLUMN "public"."sa_opagent"."sprocess" IS '流程id';
COMMENT ON COLUMN "public"."sa_opagent"."screatorid" IS '创建人id';
COMMENT ON COLUMN "public"."sa_opagent"."screatorname" IS '创建人';
COMMENT ON COLUMN "public"."sa_opagent"."screatetime" IS '创建时间';
COMMENT ON COLUMN "public"."sa_opagent"."scantranagent" IS '是否可以再次代理';
COMMENT ON COLUMN "public"."sa_opagent"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_opagent" IS '用户代理';

-- ----------------------------
-- Records of sa_opagent
-- ----------------------------

-- ----------------------------
-- Table structure for sa_opauthorize
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_opauthorize";
CREATE TABLE "public"."sa_opauthorize" (
  "sid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "sorgid" varchar(65) COLLATE "pg_catalog"."default",
  "sorgname" varchar(255) COLLATE "pg_catalog"."default",
  "sorgfid" varchar(2048) COLLATE "pg_catalog"."default",
  "sorgfname" varchar(2048) COLLATE "pg_catalog"."default",
  "sauthorizeroleid" varchar(32) COLLATE "pg_catalog"."default",
  "sdescription" varchar(1024) COLLATE "pg_catalog"."default",
  "screatorfid" varchar(2048) COLLATE "pg_catalog"."default",
  "screatorfname" varchar(2048) COLLATE "pg_catalog"."default",
  "screatetime" timestamp(6),
  "srolelevel" varchar(100) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_opauthorize"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_opauthorize"."sorgid" IS '组织id';
COMMENT ON COLUMN "public"."sa_opauthorize"."sorgname" IS '组织名称';
COMMENT ON COLUMN "public"."sa_opauthorize"."sorgfid" IS '组织路径id';
COMMENT ON COLUMN "public"."sa_opauthorize"."sorgfname" IS '组织路径名称';
COMMENT ON COLUMN "public"."sa_opauthorize"."sauthorizeroleid" IS '授权的角色id';
COMMENT ON COLUMN "public"."sa_opauthorize"."sdescription" IS '描述';
COMMENT ON COLUMN "public"."sa_opauthorize"."screatorfid" IS '创建人路径id';
COMMENT ON COLUMN "public"."sa_opauthorize"."screatorfname" IS '创建人路径名称';
COMMENT ON COLUMN "public"."sa_opauthorize"."screatetime" IS '创建时间';
COMMENT ON COLUMN "public"."sa_opauthorize"."srolelevel" IS '角色级别';
COMMENT ON COLUMN "public"."sa_opauthorize"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_opauthorize" IS '授权信息';

-- ----------------------------
-- Records of sa_opauthorize
-- ----------------------------
INSERT INTO "public"."sa_opauthorize" VALUES ('AHR01', 'PSN01@ORG01', '管理员', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'RL01', '超级管理员', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2009-11-03 00:00:00', '0', 0);
INSERT INTO "public"."sa_opauthorize" VALUES ('614F99FC54CB4466BCBF70D43BB05279', '5979D9B4A264438C84054F540CB7F032', '测试机构', '/5979D9B4A264438C84054F540CB7F032.ogn', '/测试机构', 'RL02', '任务', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2023-03-24 15:47:48.199', NULL, 0);

-- ----------------------------
-- Table structure for sa_opmanagement
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_opmanagement";
CREATE TABLE "public"."sa_opmanagement" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "sorgid" varchar(65) COLLATE "pg_catalog"."default" NOT NULL,
  "sorgname" varchar(255) COLLATE "pg_catalog"."default",
  "sorgfid" varchar(2048) COLLATE "pg_catalog"."default" NOT NULL,
  "sorgfname" varchar(2048) COLLATE "pg_catalog"."default",
  "smanageorgid" varchar(65) COLLATE "pg_catalog"."default" NOT NULL,
  "smanageorgname" varchar(255) COLLATE "pg_catalog"."default",
  "smanageorgfid" varchar(2048) COLLATE "pg_catalog"."default" NOT NULL,
  "smanageorgfname" varchar(2048) COLLATE "pg_catalog"."default",
  "smanagetypeid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "screatorfid" varchar(2048) COLLATE "pg_catalog"."default",
  "screatorfname" varchar(2048) COLLATE "pg_catalog"."default",
  "screatetime" timestamp(6),
  "version" int4 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_opmanagement"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_opmanagement"."sorgid" IS '组织id';
COMMENT ON COLUMN "public"."sa_opmanagement"."sorgname" IS '组织名称';
COMMENT ON COLUMN "public"."sa_opmanagement"."sorgfid" IS '组织路径id';
COMMENT ON COLUMN "public"."sa_opmanagement"."sorgfname" IS '组织路径名称';
COMMENT ON COLUMN "public"."sa_opmanagement"."smanageorgid" IS '管理的组织id';
COMMENT ON COLUMN "public"."sa_opmanagement"."smanageorgname" IS '管理的组织名称';
COMMENT ON COLUMN "public"."sa_opmanagement"."smanageorgfid" IS '管理的组织路径id';
COMMENT ON COLUMN "public"."sa_opmanagement"."smanageorgfname" IS '管理的组织路径名称';
COMMENT ON COLUMN "public"."sa_opmanagement"."smanagetypeid" IS '管理类型id';
COMMENT ON COLUMN "public"."sa_opmanagement"."screatorfid" IS '创建人路径id';
COMMENT ON COLUMN "public"."sa_opmanagement"."screatorfname" IS '创建人路径名称';
COMMENT ON COLUMN "public"."sa_opmanagement"."screatetime" IS '创建时间';
COMMENT ON COLUMN "public"."sa_opmanagement"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_opmanagement" IS '管理权限';

-- ----------------------------
-- Records of sa_opmanagement
-- ----------------------------

-- ----------------------------
-- Table structure for sa_opmanagetype
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_opmanagetype";
CREATE TABLE "public"."sa_opmanagetype" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "sname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scode" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "smanageorgkind" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "smanageorgkindname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sleadernumber" int4,
  "sissystem" int4,
  "version" int4 NOT NULL
)
;

-- ----------------------------
-- Records of sa_opmanagetype
-- ----------------------------

-- ----------------------------
-- Table structure for sa_opmenutree
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_opmenutree";
CREATE TABLE "public"."sa_opmenutree" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "label" varchar(200) COLLATE "pg_catalog"."default",
  "icon" varchar(100) COLLATE "pg_catalog"."default",
  "layuiicon" varchar(100) COLLATE "pg_catalog"."default",
  "url" varchar(1024) COLLATE "pg_catalog"."default",
  "process" varchar(1024) COLLATE "pg_catalog"."default",
  "activity" varchar(100) COLLATE "pg_catalog"."default",
  "display" varchar(100) COLLATE "pg_catalog"."default",
  "icon32" varchar(100) COLLATE "pg_catalog"."default",
  "icon64" varchar(100) COLLATE "pg_catalog"."default",
  "pid" varchar(32) COLLATE "pg_catalog"."default",
  "sorts" int4 DEFAULT 1,
  "code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "i18n" varchar(100) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_opmenutree"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_opmenutree"."label" IS '名称';
COMMENT ON COLUMN "public"."sa_opmenutree"."icon" IS '图标';
COMMENT ON COLUMN "public"."sa_opmenutree"."layuiicon" IS '样式图标';
COMMENT ON COLUMN "public"."sa_opmenutree"."url" IS '路径';
COMMENT ON COLUMN "public"."sa_opmenutree"."process" IS '流程id';
COMMENT ON COLUMN "public"."sa_opmenutree"."activity" IS '环节id';
COMMENT ON COLUMN "public"."sa_opmenutree"."display" IS '展示';
COMMENT ON COLUMN "public"."sa_opmenutree"."icon32" IS '小图标';
COMMENT ON COLUMN "public"."sa_opmenutree"."icon64" IS '大图标';
COMMENT ON COLUMN "public"."sa_opmenutree"."pid" IS '父id';
COMMENT ON COLUMN "public"."sa_opmenutree"."sorts" IS '排序';
COMMENT ON COLUMN "public"."sa_opmenutree"."code" IS '编号';
COMMENT ON COLUMN "public"."sa_opmenutree"."i18n" IS '多语言编号';
COMMENT ON COLUMN "public"."sa_opmenutree"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_opmenutree" IS '菜单信息';

-- ----------------------------
-- Records of sa_opmenutree
-- ----------------------------
INSERT INTO "public"."sa_opmenutree" VALUES ('E316E4AC20544555840E4F25535CCC4D', 'account', 'DashboardOutlined', 'layui-icon layui-icon-app', '/account', NULL, NULL, 'hide', NULL, NULL, NULL, 0, 'account', 'account', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('5C027D8A8B074441923D6C3D5530555C', '工作空间', 'HomeOutlined', 'layui-icon layui-icon-app', '/dashboard', '', '', '', NULL, NULL, '', 1, 'dashboard', 'dashboard', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('A4A6236099464082BB1ED5270EB64804', '个人中心', 'DashboardOutlined', 'layui-icon layui-icon-app', '/account/center', NULL, NULL, 'hide', NULL, NULL, 'E316E4AC20544555840E4F25535CCC4D', 1, 'account-center', 'account-center', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('4D537DDA3E3B4CFEA192A981BDC5B266', '分析页', 'DashboardOutlined', 'layui-icon layui-icon-app', '/dashboard/console', NULL, NULL, NULL, NULL, NULL, '5C027D8A8B074441923D6C3D5530555C', 1, 'dashboard-console', 'console', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('D57EE339F5AE494FBCEC1E325B5E5FEE', '工作台', 'DashboardOutlined', 'layui-icon layui-icon-app', '/dashboard/workspace', NULL, NULL, NULL, NULL, NULL, '5C027D8A8B074441923D6C3D5530555C', 2, 'dashboard-workspace', 'workspace', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('A0446547A3684727A1DBD1A05E8A799C', '基础表单', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/form/baseForm', NULL, NULL, NULL, NULL, NULL, '41103463A6744853BFE32F26BC3D7EA0', 1, 'base-form', 'base-form', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('F1F34234AA12430BACF128E0689E2622', '高级表单', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/form/moreForm', NULL, NULL, NULL, NULL, NULL, '41103463A6744853BFE32F26BC3D7EA0', 2, 'more-form', 'more-form', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('D00BED3BCFC648C59F8A2EA716118717', '分步表单', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/form/stepForm', NULL, NULL, NULL, NULL, NULL, '41103463A6744853BFE32F26BC3D7EA0', 3, 'step-form', 'step-form', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('DFAC4983AE14411CAE7200A7B025713C', '404', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/error/404', '', '', '', NULL, NULL, '91AE4D6AA06446CC9543AD0D51A291F6', 2, 'error-404', 'error-404', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('337D6618FBB64291A0EA7A577F144521', '500', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/error/500', '', '', '', 'null', 'null', '91AE4D6AA06446CC9543AD0D51A291F6', 3, 'error-500', 'error-500', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('41103463A6744853BFE32F26BC3D7EA0', '表单页面', 'FormOutlined', 'layui-icon layui-icon-app', '/form', '', '', '', NULL, NULL, '', 2, 'form', 'form', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('6898A59107BC4E388A2D8F057AE4E857', '列表页面', 'UnorderedListOutlined', 'layui-icon layui-icon-app', '/list', '', '', '', NULL, NULL, '', 3, 'list', 'list', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('16C7EF0E65EA4683BFCAD11BB9B717CF', '基础列表', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/list/baseList', '', '', '', NULL, NULL, '6898A59107BC4E388A2D8F057AE4E857', 1, 'base-list', 'base-list', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('E8B707468AF14D099A19843EFCA597E8', '卡片列表', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/list/cardList', '', '', '', NULL, NULL, '6898A59107BC4E388A2D8F057AE4E857', 2, 'card-list', 'card-list', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('44DAA56DDDCB44339EE9718E79B35214', '图文列表', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/list/newsList', '', '', '', NULL, NULL, '6898A59107BC4E388A2D8F057AE4E857', 3, 'news-list', 'news-list', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('8EB2FDB9C11D49E781B75374E5F48B49', '查询表格', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/list/tableList', '', '', '', NULL, NULL, '6898A59107BC4E388A2D8F057AE4E857', 4, 'table-list', 'table-list', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('CE4E91608F3E4AC4A0A2D206D6D65A8B', '结果页面', 'TagOutlined', 'layui-icon layui-icon-app', '/result', '', '', '', NULL, NULL, '', 4, 'result-menu', 'result-menu', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('FB103B23EF0E4D698DDFCEF228A1EB7B', '成功', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/result/success', '', '', '', NULL, NULL, 'CE4E91608F3E4AC4A0A2D206D6D65A8B', 1, 'result-success', 'result-success', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('41663E4FCF5149358F30056A56A4797F', '失败', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/result/failure', '', '', '', NULL, NULL, 'CE4E91608F3E4AC4A0A2D206D6D65A8B', 2, 'result-failure', 'result-failure', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('28DD3BE201134F3089924D050AED2D22', '警告', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/result/warning', '', '', '', NULL, NULL, 'CE4E91608F3E4AC4A0A2D206D6D65A8B', 3, 'result-warning', 'result-warning', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('1E9A00C2F9D4409D96597C40B9EA8571', '详情', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/result/info', '', '', '', NULL, NULL, 'CE4E91608F3E4AC4A0A2D206D6D65A8B', 4, 'result-info', 'result-info', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('91AE4D6AA06446CC9543AD0D51A291F6', '错误页面', 'StopOutlined', 'layui-icon layui-icon-app', '/error', '', '', '', NULL, NULL, '', 5, 'error', 'error', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('89F94C93D75549DEBDF33190828721EE', '403', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/error/403', '', '', '', NULL, NULL, '91AE4D6AA06446CC9543AD0D51A291F6', 1, 'error-403', 'error-403', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('FB10A917C8A647D9B9099A1E4B35C310', '流程', 'DatabaseOutlined', 'layui-icon layui-icon-app', NULL, NULL, NULL, NULL, NULL, NULL, 'C5C5D87019BA413B8929A85FC362C9C3', NULL, 'flow', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('C8351E6F2E0E4E9986D7CC19DD01C459', '流程测试', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/demo/flow/mainActivity.html', 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity2', NULL, NULL, NULL, 'FB10A917C8A647D9B9099A1E4B35C310', NULL, 'bizActivity2', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('636B998F3485463E94083AB2448E4232', '流程审批', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/demo/flow/mainActivity2.html', 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity4', 'hide', NULL, NULL, 'FB10A917C8A647D9B9099A1E4B35C310', NULL, 'bizActivity4', NULL, 2);
INSERT INTO "public"."sa_opmenutree" VALUES ('C5C5D87019BA413B8929A85FC362C9C3', 'DEMO', 'DatabaseOutlined', 'layui-icon layui-icon-app', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'demo', NULL, 2);
INSERT INTO "public"."sa_opmenutree" VALUES ('C834A7AC780B464789B4B5B55D104B83', '流程审批2', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/demo/flow/mainActivity2.html', 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity6', 'hide', NULL, NULL, 'FB10A917C8A647D9B9099A1E4B35C310', NULL, 'bizActivity6', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('1F736601DB7E499A805ECF0A1D3BDFBC', '日常办公', 'DatabaseOutlined', 'layui-icon layui-icon-app', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'date-work', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('6E918A31278C475B823012B960C3AD44', '内部邮箱', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/email/mainActivity.html', '/OA/email', 'mainActivity', NULL, NULL, NULL, '1F736601DB7E499A805ECF0A1D3BDFBC', 1, 'org-email', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('9ECFAA70CC174D12A1E5FB25F681F89A', '通知公告', 'DatabaseOutlined', 'layui-icon layui-icon-app', NULL, NULL, NULL, NULL, NULL, NULL, '1F736601DB7E499A805ECF0A1D3BDFBC', 2, 'notes', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('FA73F4BC3DB745B3B01413521D861E2B', '通知发布', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/notice/publicnotice/publicnoticeadd.html', '/OA/notice/publicnotice/process', 'publicnoticeadd', NULL, NULL, NULL, '9ECFAA70CC174D12A1E5FB25F681F89A', 1, 'notify', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('E8883F6C63FC453CB25E161847559D53', '通知管理', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/notice/publicnotice/publicnoticepushlist.html', '/OA/notice/publicnotice/process', 'publicnoticepushlist', NULL, NULL, NULL, '9ECFAA70CC174D12A1E5FB25F681F89A', 2, 'note-manage', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('E95861E3A7FB411AB9ECBFE19C555423', '通知列表', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/notice/publicnotice/looknoticepushlist.html', '/OA/notice/publicnotice/process', 'looknoticepushlist', NULL, NULL, NULL, '9ECFAA70CC174D12A1E5FB25F681F89A', 3, 'note-list', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('13E42CA7A0AD4F2888A40DEF05AA44CC', '内部论坛', 'DatabaseOutlined', 'layui-icon layui-icon-app', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'forum', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('3B35B11CF8D04C4AAAEF410B847D2252', '讨论区', 'DatabaseOutlined', 'layui-icon layui-icon-app', NULL, NULL, NULL, NULL, NULL, NULL, '13E42CA7A0AD4F2888A40DEF05AA44CC', 1, 'discussion-area', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('11C28B381745478282E0E391D61E2A53', '分类设置', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/forum/Bo_category.html', '/OA/forum/process', 'Bo_category', NULL, NULL, NULL, '3B35B11CF8D04C4AAAEF410B847D2252', 1, 'bo_category', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('45C85E85E41943B3981ACEFCDD27564E', '讨论区设置', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/forum/BO_bloglist.html', '/OA/forum/process', 'BO_bloglist', NULL, NULL, NULL, '3B35B11CF8D04C4AAAEF410B847D2252', 2, 'bo_dis_set', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('64103C00B8AF45778B6F0B3FA022A17A', '讨论区管理', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/forum/BO_blogManage.html', '/OA/forum/process', 'BO_blogManage', NULL, NULL, NULL, '3B35B11CF8D04C4AAAEF410B847D2252', 3, 'bo_dis_manage', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('0EAC50F0A3DF40A8AA949D1F1A9BEE81', '发帖', 'DatabaseOutlined', 'layui-icon layui-icon-app', '/OA/forum/BO_talkl.html', '/OA/forum/process', 'BO_talkl', NULL, NULL, NULL, '13E42CA7A0AD4F2888A40DEF05AA44CC', 2, 'bo_post', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('sysmenus', '菜单设置', 'DatabaseOutlined', 'fa fa-window-maximize', '/system/sysMenu', '/SA/functionTree/process', 'mainActivity', NULL, NULL, NULL, 'sysfun', 1, 'sysMenu', 'sysMenu', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('sysognzation', '机构管理', 'DatabaseOutlined', 'fa fa-group', '/system/organization', '/SA/organization/organizationProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 2, 'organization', 'organization', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('759D35AFC1EB438BB2B2E122F83CD763', '授权管理', 'DatabaseOutlined', 'layui-icon layui-icon-auz', '/system/authorManage', '/SA/role/authorManageProcess', 'mainActivity', '', 'null', 'null', 'sysfun', 4, 'authorManage', 'authorManage', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('sysfun', '系统管理', 'SettingOutlined', 'layui-icon layui-icon-set', '/system', '', '', '', '', '', '', 100, 'system', 'system', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('sysrolem', '角色管理', 'DatabaseOutlined', 'fa fa-cogs', '/system/roleManage', '/SA/role/roleProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 3, 'roleManage', 'roleManage', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('5004DBF28EF840438B55BEF5294C7C01', '系统工具', 'DatabaseOutlined', 'layui-icon layui-icon-util', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, 'systemTools', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('4C55668342EA451EA6B7F7D0581FD7FA', '服务器监控', 'DatabaseOutlined', 'layui-icon layui-icon-chart-screen', '/SA/cockpit/show.html', '/SA/cockpit', 'mainActivity', NULL, NULL, NULL, '5004DBF28EF840438B55BEF5294C7C01', 1, 'ServerMonitor', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('6276A3096D834B9BA39BC08E2507C550', '服务器信息', 'DatabaseOutlined', 'layui-icon layui-icon-engine', '/SA/services/servicesInfo.html', '/SA/services/servicesInfo', 'mainActivity', NULL, NULL, NULL, '5004DBF28EF840438B55BEF5294C7C01', 2, 'ServerInfo', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('E54E71CA26184648A58865889B711943', '任务中心', 'DatabaseOutlined', 'fa fa-tasks', '/SA/task/taskCenter/mainActivity.html', '/SA/task/taskCenter', 'mainActivity', NULL, NULL, NULL, 'AFDEF15E8D7B4EC89446C68CF73D5B0D', 1, 'taskCenter', 'taskCenter', 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('826434CF9E734ED9ABA235C2BFF696B0', '流程监控', 'DatabaseOutlined', 'fa fa-stack-overflow', '/SA/process/monitor/mainActivity.html', '/SA/process/monitor', 'mainActivity', NULL, NULL, NULL, 'AFDEF15E8D7B4EC89446C68CF73D5B0D', 2, 'processmonitor', NULL, 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('AFDEF15E8D7B4EC89446C68CF73D5B0D', '流程管理', 'AntDesignOutlined', 'layui-icon layui-icon-app', '/flowManager', NULL, NULL, NULL, NULL, NULL, NULL, 98, 'flowManager', 'flowManager', 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('412181B528E545F0B8D9EE3CF312DF98', '流程设计', 'DatabaseOutlined', 'layui-icon layui-icon-slider', '/flowManager/flowDesign', '/flowDesign/process', 'mainActivity', NULL, NULL, NULL, 'AFDEF15E8D7B4EC89446C68CF73D5B0D', 9, 'flowDesigner', 'flowDesigner', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('383DFCD37CF142F8A22EE5BC517A3A1D', '文档配置', 'DatabaseOutlined', 'fa fa-server', '/docManage/docSetting', '/doc/docSettingProcess', 'mainActivity', NULL, NULL, NULL, '7072717E0CB543A8876DA4B7282A07C6', 1, 'docSetting', 'docSetting', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('0B5307D27B7E41AA9D9D7552F4E97D61', '文档中心', 'DatabaseOutlined', 'fa fa-reorder', '/docManage/docCenter', '/doc/docCenter/process', 'mainActivity', NULL, NULL, NULL, '7072717E0CB543A8876DA4B7282A07C6', 2, 'docCenter', 'docCenter', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('7072717E0CB543A8876DA4B7282A07C6', '文档管理', 'ContainerOutlined', 'fa fa-gear', '/docManage', NULL, NULL, NULL, NULL, NULL, NULL, 97, 'docManage', 'docManage', 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('27BD1F45508B49F4B11918F91E14E316', '权限管理', 'DatabaseOutlined', 'fa fa-key', '/system/manageMeant', '/SA/manageMeantProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 5, 'manageMeant', 'manageMeant', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('5316BC0BC6374BAD9E50E164C0D4192A', '系统日志', 'DatabaseOutlined', 'layui-icon layui-icon-log', '/SA/system/syslog/mainActivity.html', '/SA/sysLogProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 6, 'sysLog', 'sysLog', 1);
INSERT INTO "public"."sa_opmenutree" VALUES ('B7C66B18C7B14A7AB20E928867F0636A', '手写签名', 'DatabaseOutlined', 'fa fa-pencil-square-o', '/SA/handwrittenSignature/mainActivity.html', '/SA/handwrittenSignature', 'mainActivity', NULL, NULL, NULL, 'sysfun', 7, 'handwrittenSignature', NULL, 2);
INSERT INTO "public"."sa_opmenutree" VALUES ('8EC0FF9DB10549B0898B8F7CD4E6C6F2', '回收站', 'DatabaseOutlined', 'layui-icon layui-icon-delete', '/system/recycle', '/SA/recycleProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 9, 'recycle', 'recycle', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('AF66D9A7835145319EC0C358A9CDD5D9', '报表设计器', NULL, 'layui-icon layui-icon-app', '/reportManager/ureportDesigner', '/ureportDesigner/process', 'mainActivity', NULL, NULL, NULL, '5004DBF28EF840438B55BEF5294C7C01', 3, 'ureportDesigner', NULL, 3);

-- ----------------------------
-- Table structure for sa_oporg
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_oporg";
CREATE TABLE "public"."sa_oporg" (
  "sid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "sname" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "scode" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "slongname" varchar(255) COLLATE "pg_catalog"."default",
  "sfname" varchar(1024) COLLATE "pg_catalog"."default",
  "sfcode" varchar(2048) COLLATE "pg_catalog"."default",
  "sfid" varchar(1024) COLLATE "pg_catalog"."default" NOT NULL,
  "sorgkindid" varchar(5) COLLATE "pg_catalog"."default" NOT NULL,
  "svalidstate" int4 NOT NULL DEFAULT 1,
  "sparent" varchar(100) COLLATE "pg_catalog"."default",
  "slevel" int4 DEFAULT 1,
  "sphone" varchar(64) COLLATE "pg_catalog"."default",
  "sfax" varchar(64) COLLATE "pg_catalog"."default",
  "saddress" varchar(255) COLLATE "pg_catalog"."default",
  "szip" varchar(16) COLLATE "pg_catalog"."default",
  "sdescription" varchar(1024) COLLATE "pg_catalog"."default",
  "spersonid" varchar(32) COLLATE "pg_catalog"."default",
  "snodekind" varchar(32) COLLATE "pg_catalog"."default",
  "sshowname" varchar(100) COLLATE "pg_catalog"."default",
  "ssequence" int4 DEFAULT 1,
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_oporg"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_oporg"."sname" IS '名称';
COMMENT ON COLUMN "public"."sa_oporg"."scode" IS '编号';
COMMENT ON COLUMN "public"."sa_oporg"."slongname" IS '长名称';
COMMENT ON COLUMN "public"."sa_oporg"."sfname" IS '路径名';
COMMENT ON COLUMN "public"."sa_oporg"."sfcode" IS '路径编号';
COMMENT ON COLUMN "public"."sa_oporg"."sfid" IS '路径id';
COMMENT ON COLUMN "public"."sa_oporg"."sorgkindid" IS '机构类型';
COMMENT ON COLUMN "public"."sa_oporg"."svalidstate" IS '状态';
COMMENT ON COLUMN "public"."sa_oporg"."sparent" IS '父id';
COMMENT ON COLUMN "public"."sa_oporg"."slevel" IS '层级';
COMMENT ON COLUMN "public"."sa_oporg"."sphone" IS '电话';
COMMENT ON COLUMN "public"."sa_oporg"."sfax" IS '传真';
COMMENT ON COLUMN "public"."sa_oporg"."saddress" IS '地址';
COMMENT ON COLUMN "public"."sa_oporg"."szip" IS '邮编';
COMMENT ON COLUMN "public"."sa_oporg"."sdescription" IS '备注';
COMMENT ON COLUMN "public"."sa_oporg"."spersonid" IS '人员id';
COMMENT ON COLUMN "public"."sa_oporg"."snodekind" IS '节点id';
COMMENT ON COLUMN "public"."sa_oporg"."sshowname" IS '展示名称';
COMMENT ON COLUMN "public"."sa_oporg"."ssequence" IS '排序';
COMMENT ON COLUMN "public"."sa_oporg"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_oporg" IS '组织机构';

-- ----------------------------
-- Records of sa_oporg
-- ----------------------------
INSERT INTO "public"."sa_oporg" VALUES ('PSN01@ORG01', 'system', 'SYSTEM', '', '/管理员/system', '/TULIN/SYSTEM', '/ORG01.ogn/PSN01@ORG01.psm', 'psm', 1, 'ORG01', 2, '', '', '', '', '', 'PSN01', 'nkLeaf', '', 1, NULL);
INSERT INTO "public"."sa_oporg" VALUES ('ORG01', '管理员', 'TULIN', '', '/管理员', '/TULIN', '/ORG01.ogn', 'ogn', 1, NULL, 1, '', '', '', '', '', '', '', '', 96, NULL);
INSERT INTO "public"."sa_oporg" VALUES ('5979D9B4A264438C84054F540CB7F032', '测试机构', 'testogn', NULL, '/测试机构', '/testogn', '/5979D9B4A264438C84054F540CB7F032.ogn', 'ogn', 1, NULL, 1, '', '', '', '', '', NULL, NULL, NULL, 1, NULL);
INSERT INTO "public"."sa_oporg" VALUES ('45BB9FCAF8394E43B45A55CF564F9CCD@775F53432CDC40A1A1F12BBEF4F93B74', '测试人员2', 'test2', NULL, '/测试机构/测试部门2/测试人员2', '/testogn/testdept2/test2', '/5979D9B4A264438C84054F540CB7F032.ogn/775F53432CDC40A1A1F12BBEF4F93B74.dpt/45BB9FCAF8394E43B45A55CF564F9CCD@775F53432CDC40A1A1F12BBEF4F93B74.psm', 'psm', 1, '775F53432CDC40A1A1F12BBEF4F93B74', 3, '', '', '', '', '', '45BB9FCAF8394E43B45A55CF564F9CCD', NULL, NULL, 1, NULL);
INSERT INTO "public"."sa_oporg" VALUES ('DC349D31F5FE4113ABA2BBC06B1E42D7@490BA0D6B1FC4EFE962E376C76B09BBA', '测试人员1', 'test1', NULL, '/测试机构/测试部门1/测试人员1', '/testogn/testdept1/test1', '/5979D9B4A264438C84054F540CB7F032.ogn/490BA0D6B1FC4EFE962E376C76B09BBA.dpt/DC349D31F5FE4113ABA2BBC06B1E42D7@490BA0D6B1FC4EFE962E376C76B09BBA.psm', 'psm', 1, '490BA0D6B1FC4EFE962E376C76B09BBA', 3, '', '', '', '', '', 'DC349D31F5FE4113ABA2BBC06B1E42D7', NULL, NULL, 1, NULL);
INSERT INTO "public"."sa_oporg" VALUES ('490BA0D6B1FC4EFE962E376C76B09BBA', '测试部门1', 'testdept1', NULL, '/测试机构/测试部门1', '/testogn/testdept1', '/5979D9B4A264438C84054F540CB7F032.ogn/490BA0D6B1FC4EFE962E376C76B09BBA.dpt', 'dpt', 1, '5979D9B4A264438C84054F540CB7F032', 2, '', '', '', '', '', NULL, NULL, NULL, 1, NULL);
INSERT INTO "public"."sa_oporg" VALUES ('775F53432CDC40A1A1F12BBEF4F93B74', '测试部门2', 'testdept2', NULL, '/测试机构/测试部门2', '/testogn/testdept2', '/5979D9B4A264438C84054F540CB7F032.ogn/775F53432CDC40A1A1F12BBEF4F93B74.dpt', 'dpt', 1, '5979D9B4A264438C84054F540CB7F032', 2, '', '', '', '', '', NULL, NULL, NULL, 2, NULL);

-- ----------------------------
-- Table structure for sa_oppermission
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_oppermission";
CREATE TABLE "public"."sa_oppermission" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "spermissionroleid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "smenuid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "sprocess" varchar(1024) COLLATE "pg_catalog"."default",
  "sactivityfname" varchar(1024) COLLATE "pg_catalog"."default",
  "sactivity" varchar(1024) COLLATE "pg_catalog"."default",
  "sactionsnames" text COLLATE "pg_catalog"."default",
  "sactions" text COLLATE "pg_catalog"."default",
  "ssemanticdp" varchar(2048) COLLATE "pg_catalog"."default",
  "spermissionkind" int4,
  "sdescription" varchar(1024) COLLATE "pg_catalog"."default",
  "ssequence" int4 DEFAULT 1,
  "svalidstate" int4 NOT NULL DEFAULT 1,
  "version" int4 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_oppermission"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_oppermission"."spermissionroleid" IS '角色id';
COMMENT ON COLUMN "public"."sa_oppermission"."smenuid" IS '菜单id';
COMMENT ON COLUMN "public"."sa_oppermission"."sprocess" IS '流程id';
COMMENT ON COLUMN "public"."sa_oppermission"."sactivityfname" IS '功能名称';
COMMENT ON COLUMN "public"."sa_oppermission"."sactivity" IS '环节id';
COMMENT ON COLUMN "public"."sa_oppermission"."sactionsnames" IS '动作名';
COMMENT ON COLUMN "public"."sa_oppermission"."sactions" IS '动作';
COMMENT ON COLUMN "public"."sa_oppermission"."ssemanticdp" IS '扩展描述';
COMMENT ON COLUMN "public"."sa_oppermission"."spermissionkind" IS '授权类型id';
COMMENT ON COLUMN "public"."sa_oppermission"."sdescription" IS '备注描述';
COMMENT ON COLUMN "public"."sa_oppermission"."ssequence" IS '排序';
COMMENT ON COLUMN "public"."sa_oppermission"."svalidstate" IS '状态';
COMMENT ON COLUMN "public"."sa_oppermission"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_oppermission" IS '角色权限';

-- ----------------------------
-- Records of sa_oppermission
-- ----------------------------
INSERT INTO "public"."sa_oppermission" VALUES ('76C646D8DDE14CB29D47ECFABA7F04E3', 'RL01', 'sysfun', '', '系统管理', '', NULL, NULL, NULL, 0, '系统管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('16E384E9A8C84A888FD9F4221412E078', 'RL01', 'sysmenus', '/SA/functionTree/process', '菜单设置', 'mainActivity', NULL, NULL, NULL, 0, '菜单设置', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('15B57007135848A6BA9BE7C6B5E969F8', 'RL01', 'sysognzation', '/SA/organization/organizationProcess', '机构管理', 'mainActivity', NULL, NULL, NULL, 0, '机构管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('09CCE2452D844847BC69B4EE34C07CF2', 'RL01', 'sysrolem', '/SA/role/roleProcess', '角色管理', 'mainActivity', NULL, NULL, NULL, 0, '角色管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('32229A11012040E3BD7AF8012A7B8B7C', 'RL01', '759D35AFC1EB438BB2B2E122F83CD763', '/SA/role/authorManageProcess', '授权管理', 'mainActivity', NULL, NULL, NULL, 0, '授权管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('CE01BD0E0646458DB5B027E87A463DA7', 'RL01', '27BD1F45508B49F4B11918F91E14E316', '/SA/manageMeantProcess', '权限管理', 'mainActivity', NULL, NULL, NULL, 0, '权限管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('710970CC13B6491FB9013019C2616324', 'RL01', '383DFCD37CF142F8A22EE5BC517A3A1D', '/doc/docSettingProcess', '文档配置', 'mainActivity', NULL, NULL, NULL, 0, '文档配置', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('8844382D546F42D78F83B0E85CE24818', 'RL01', '412181B528E545F0B8D9EE3CF312DF98', '/flowDesign/process', '流程设计', 'mainActivity', NULL, NULL, NULL, 0, '流程设计', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('8973A87FA6344748B8D2C4DF55440A88', 'RL01', 'AFDEF15E8D7B4EC89446C68CF73D5B0D', NULL, '流程管理', NULL, NULL, NULL, NULL, 0, '流程管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('25E76761EEFC4AED9357173FCB955189', 'RL01', '0B5307D27B7E41AA9D9D7552F4E97D61', '/doc/docCenter/process', '文档中心', 'mainActivity', NULL, NULL, NULL, 0, '文档中心', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('ED9348734D66443E9F97D39B63CC4AC1', 'RL01', '7072717E0CB543A8876DA4B7282A07C6', NULL, '文档管理', NULL, NULL, NULL, NULL, 0, '文档管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('1D61F2FA4A904BE6B8F360FD631AEB7B', 'RL01', '8EC0FF9DB10549B0898B8F7CD4E6C6F2', '/SA/recycleProcess', '回收站', 'mainActivity', NULL, NULL, NULL, 0, '回收站', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('2BB27622E99C4E3899EB1D69E60807A4', 'RL01', '5316BC0BC6374BAD9E50E164C0D4192A', '/SA/sysLogProcess', '系统日志', 'mainActivity', NULL, NULL, NULL, 0, '系统日志', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('35938A2ED52F49308C0CABBFE1AD91FF', 'RL01', '636B998F3485463E94083AB2448E4232', 'EFB1385BEB1441BCA87404D318B7F9BC', '流程审批', 'bizActivity4', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('28DA9CC3C865433BB72FDFF4862D653C', 'RL01', 'FB10A917C8A647D9B9099A1E4B35C310', NULL, '流程', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('39CB395DF4124458AF9E2D16BEBFC671', 'RL01', 'C5C5D87019BA413B8929A85FC362C9C3', NULL, 'DEMO', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('2D056D229C6247388B5F3DD7D3AA86B8', 'RL01', 'C8351E6F2E0E4E9986D7CC19DD01C459', 'EFB1385BEB1441BCA87404D318B7F9BC', '流程测试', 'bizActivity2', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('9C71EFBECA784F61A3B4E255E72325A9', 'RL01', 'C834A7AC780B464789B4B5B55D104B83', 'EFB1385BEB1441BCA87404D318B7F9BC', '流程审批2', 'bizActivity6', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('EB6FA085BE3B4A6A87958D1E315D818A', 'RL01', 'E54E71CA26184648A58865889B711943', '/SA/task/taskCenter', '任务中心', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('C192BFCE969B454AB64B79790B36A6F3', 'RL01', 'B7C66B18C7B14A7AB20E928867F0636A', '/SA/handwrittenSignature', '手写签名', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('1A972C931F8742C58BE07A01D8E7C075', 'RL01', '826434CF9E734ED9ABA235C2BFF696B0', '/SA/process/monitor', '流程监控', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('3CC060C19A884E27AFBE7C177646DDE1', 'RL01', '5004DBF28EF840438B55BEF5294C7C01', NULL, '系统工具', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('20BAF9C9D1CA4C759B1BBDA9C40ADFC2', 'RL01', '4C55668342EA451EA6B7F7D0581FD7FA', '/SA/cockpit', '服务器监控', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('05E1122206E34FC796F0C38250D6CE81', 'RL01', '6276A3096D834B9BA39BC08E2507C550', '/SA/services/servicesInfo', '服务器信息', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('9EBF63E02EEF4C4AB498836912EF3133', 'RL01', '6E918A31278C475B823012B960C3AD44', '/OA/email', '内部邮箱', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('510978C776274507ABD4A89B10C45803', 'RL01', '1F736601DB7E499A805ECF0A1D3BDFBC', NULL, '日常办公', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('C785D415CF8A453D97487FE54F658333', 'RL01', '6E918A31278C475B823012B960C3AD44', '/OA/email', '内部邮箱', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('F7891CD2ABB84EC7A07764783C6CEED2', 'RL01', '9ECFAA70CC174D12A1E5FB25F681F89A', NULL, '通知公告', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('E65482587B1F4D76B9CF1ED1EA7F8AE4', 'RL01', 'E8883F6C63FC453CB25E161847559D53', '/OA/notice/publicnotice/process', '通知管理', 'publicnoticepushlist', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('D73A36F728194D1E96253B780970A1E9', 'RL01', 'FA73F4BC3DB745B3B01413521D861E2B', '/OA/notice/publicnotice/process', '通知发布', 'publicnoticeadd', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('716F53800ADD4C009AB7F0082787A418', 'RL01', 'E95861E3A7FB411AB9ECBFE19C555423', '/OA/notice/publicnotice/process', '通知列表', 'looknoticepushlist', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('A23832868F2E432B9C3861D49F60A4E9', 'RL01', '13E42CA7A0AD4F2888A40DEF05AA44CC', NULL, '内部论坛', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('CAC1325E02C94175A8AADE2985F8C4A6', 'RL01', '3B35B11CF8D04C4AAAEF410B847D2252', NULL, '讨论区', NULL, NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('46C80A03E26B4179BDDCDE81AD33BFDC', 'RL01', '45C85E85E41943B3981ACEFCDD27564E', '/OA/forum/process', '讨论区设置', 'BO_bloglist', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('CBA1667533DC4C5E8B96C0BAA71732F9', 'RL01', '64103C00B8AF45778B6F0B3FA022A17A', '/OA/forum/process', '讨论区管理', 'BO_blogManage', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('4CA03F30040B42BC840BF1C6B11B28D9', 'RL01', '0EAC50F0A3DF40A8AA949D1F1A9BEE81', '/OA/forum/process', '发帖', 'BO_talkl', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('F487368123EA4C109350ED04EC3D0B98', 'RL01', '11C28B381745478282E0E391D61E2A53', '/OA/forum/process', '分类设置', 'Bo_category', NULL, NULL, NULL, 0, NULL, 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('B903B34C093F4AB9B84F7C20AFF58D64', 'RL01', 'AF66D9A7835145319EC0C358A9CDD5D9', '/ureportDesigner/process', '报表设计器', 'mainActivity', NULL, NULL, NULL, 0, NULL, 1, 1, 0);

-- ----------------------------
-- Table structure for sa_opperson
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_opperson";
CREATE TABLE "public"."sa_opperson" (
  "sid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "sname" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "scode" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "sidcard" varchar(36) COLLATE "pg_catalog"."default",
  "snumb" int4 NOT NULL DEFAULT 0,
  "sloginname" varchar(64) COLLATE "pg_catalog"."default",
  "spassword" varchar(64) COLLATE "pg_catalog"."default",
  "spasswordtimelimit" int4,
  "spasswordmodifytime" timestamp(6),
  "smainorgid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "ssafelevelid" varchar(36) COLLATE "pg_catalog"."default",
  "ssequence" int4,
  "svalidstate" int4 NOT NULL DEFAULT 1,
  "sdescription" varchar(2048) COLLATE "pg_catalog"."default",
  "ssex" varchar(8) COLLATE "pg_catalog"."default",
  "sbirthday" timestamp(6),
  "sjoindate" timestamp(6),
  "shomeplace" varchar(64) COLLATE "pg_catalog"."default",
  "sdegree" varchar(16) COLLATE "pg_catalog"."default",
  "sgraduateschool" varchar(128) COLLATE "pg_catalog"."default",
  "sspeciality" varchar(128) COLLATE "pg_catalog"."default",
  "sschoollength" varchar(16) COLLATE "pg_catalog"."default",
  "stitle" varchar(64) COLLATE "pg_catalog"."default",
  "smarriage" varchar(16) COLLATE "pg_catalog"."default",
  "scardno" varchar(36) COLLATE "pg_catalog"."default",
  "scardkind" varchar(64) COLLATE "pg_catalog"."default",
  "sfamilyaddress" varchar(255) COLLATE "pg_catalog"."default",
  "szip" varchar(16) COLLATE "pg_catalog"."default",
  "smsn" varchar(64) COLLATE "pg_catalog"."default",
  "sqq" varchar(36) COLLATE "pg_catalog"."default",
  "smail" varchar(64) COLLATE "pg_catalog"."default",
  "smobilephone" varchar(36) COLLATE "pg_catalog"."default",
  "sfamilyphone" varchar(36) COLLATE "pg_catalog"."default",
  "sofficephone" varchar(36) COLLATE "pg_catalog"."default",
  "sphoto" bytea,
  "scountry" varchar(64) COLLATE "pg_catalog"."default",
  "sprovince" varchar(64) COLLATE "pg_catalog"."default",
  "scity" varchar(64) COLLATE "pg_catalog"."default",
  "spositions" varchar(64) COLLATE "pg_catalog"."default",
  "sschool" varchar(64) COLLATE "pg_catalog"."default",
  "sstudy" varchar(64) COLLATE "pg_catalog"."default",
  "senglishname" varchar(128) COLLATE "pg_catalog"."default",
  "fcasn" varchar(100) COLLATE "pg_catalog"."default",
  "fsignm" varchar(100) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_opperson"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_opperson"."sname" IS '姓名';
COMMENT ON COLUMN "public"."sa_opperson"."scode" IS '账号';
COMMENT ON COLUMN "public"."sa_opperson"."sidcard" IS '身份证';
COMMENT ON COLUMN "public"."sa_opperson"."snumb" IS '年龄';
COMMENT ON COLUMN "public"."sa_opperson"."sloginname" IS '登录名';
COMMENT ON COLUMN "public"."sa_opperson"."spassword" IS '密码';
COMMENT ON COLUMN "public"."sa_opperson"."spasswordtimelimit" IS '密码过期时限（天）';
COMMENT ON COLUMN "public"."sa_opperson"."spasswordmodifytime" IS '密码修改时间';
COMMENT ON COLUMN "public"."sa_opperson"."smainorgid" IS '所属组织id';
COMMENT ON COLUMN "public"."sa_opperson"."ssafelevelid" IS '安全级别';
COMMENT ON COLUMN "public"."sa_opperson"."ssequence" IS '排序';
COMMENT ON COLUMN "public"."sa_opperson"."svalidstate" IS '状态';
COMMENT ON COLUMN "public"."sa_opperson"."sdescription" IS '描述';
COMMENT ON COLUMN "public"."sa_opperson"."ssex" IS '性别';
COMMENT ON COLUMN "public"."sa_opperson"."sbirthday" IS '生日';
COMMENT ON COLUMN "public"."sa_opperson"."sjoindate" IS '参加工作时间';
COMMENT ON COLUMN "public"."sa_opperson"."shomeplace" IS '住址';
COMMENT ON COLUMN "public"."sa_opperson"."sdegree" IS '学位';
COMMENT ON COLUMN "public"."sa_opperson"."sgraduateschool" IS '毕业学校';
COMMENT ON COLUMN "public"."sa_opperson"."sspeciality" IS '专业';
COMMENT ON COLUMN "public"."sa_opperson"."sschoollength" IS '学制';
COMMENT ON COLUMN "public"."sa_opperson"."stitle" IS '称呼';
COMMENT ON COLUMN "public"."sa_opperson"."smarriage" IS '婚否';
COMMENT ON COLUMN "public"."sa_opperson"."scardno" IS '工号';
COMMENT ON COLUMN "public"."sa_opperson"."scardkind" IS '工种';
COMMENT ON COLUMN "public"."sa_opperson"."sfamilyaddress" IS '家庭住址';
COMMENT ON COLUMN "public"."sa_opperson"."szip" IS '邮编';
COMMENT ON COLUMN "public"."sa_opperson"."smsn" IS 'MSN';
COMMENT ON COLUMN "public"."sa_opperson"."sqq" IS 'QQ';
COMMENT ON COLUMN "public"."sa_opperson"."smail" IS '邮箱';
COMMENT ON COLUMN "public"."sa_opperson"."smobilephone" IS '手机';
COMMENT ON COLUMN "public"."sa_opperson"."sfamilyphone" IS '家用电话';
COMMENT ON COLUMN "public"."sa_opperson"."sofficephone" IS '办公电话';
COMMENT ON COLUMN "public"."sa_opperson"."sphoto" IS '照片';
COMMENT ON COLUMN "public"."sa_opperson"."scountry" IS '国籍';
COMMENT ON COLUMN "public"."sa_opperson"."sprovince" IS '省';
COMMENT ON COLUMN "public"."sa_opperson"."scity" IS '市';
COMMENT ON COLUMN "public"."sa_opperson"."spositions" IS '县区';
COMMENT ON COLUMN "public"."sa_opperson"."sschool" IS '学校';
COMMENT ON COLUMN "public"."sa_opperson"."sstudy" IS '学习';
COMMENT ON COLUMN "public"."sa_opperson"."senglishname" IS '英文名';
COMMENT ON COLUMN "public"."sa_opperson"."fcasn" IS 'UKey编号';
COMMENT ON COLUMN "public"."sa_opperson"."fsignm" IS '签名信息';
COMMENT ON COLUMN "public"."sa_opperson"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_opperson" IS '人员信息';

-- ----------------------------
-- Records of sa_opperson
-- ----------------------------
INSERT INTO "public"."sa_opperson" VALUES ('PSN01', 'system', 'SYSTEM', '', 1, '管理员', 'C4CA4238A0B923820DCC509A6F75849B', 120, '2013-10-20 00:00:00', 'ORG01', '', 1, 1, '', '男', '1976-12-03 00:00:00', '2006-06-06 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '14769660886', '', '', E'4', NULL, '', '', '', '', '', '', '', '', NULL);
INSERT INTO "public"."sa_opperson" VALUES ('DC349D31F5FE4113ABA2BBC06B1E42D7', '测试人员1', 'test1', NULL, 0, NULL, 'E10ADC3949BA59ABBE56E057F20F883E', 0, NULL, '490BA0D6B1FC4EFE962E376C76B09BBA', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO "public"."sa_opperson" VALUES ('45BB9FCAF8394E43B45A55CF564F9CCD', '测试人员2', 'test2', NULL, 0, NULL, 'E10ADC3949BA59ABBE56E057F20F883E', 0, NULL, '775F53432CDC40A1A1F12BBEF4F93B74', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for sa_opperson_deatail
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_opperson_deatail";
CREATE TABLE "public"."sa_opperson_deatail" (
  "sid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "spersonid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "stype" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ssquns" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scode" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sname" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sremark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sclass" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "supdatedate" timestamp(6),
  "supdatorid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "supdatorname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "version" int4
)
;

-- ----------------------------
-- Records of sa_opperson_deatail
-- ----------------------------

-- ----------------------------
-- Table structure for sa_oprole
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_oprole";
CREATE TABLE "public"."sa_oprole" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "sname" varchar(255) COLLATE "pg_catalog"."default",
  "scode" varchar(32) COLLATE "pg_catalog"."default",
  "scatalog" varchar(128) COLLATE "pg_catalog"."default",
  "srolekind" varchar(32) COLLATE "pg_catalog"."default",
  "sparentrolesnames" varchar(512) COLLATE "pg_catalog"."default",
  "sdescription" varchar(1024) COLLATE "pg_catalog"."default",
  "ssequence" int4,
  "svalidstate" int4 DEFAULT 1,
  "version" int4 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_oprole"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_oprole"."sname" IS '角色名称';
COMMENT ON COLUMN "public"."sa_oprole"."scode" IS '角色编号';
COMMENT ON COLUMN "public"."sa_oprole"."scatalog" IS '角色类型';
COMMENT ON COLUMN "public"."sa_oprole"."srolekind" IS '类型id';
COMMENT ON COLUMN "public"."sa_oprole"."sparentrolesnames" IS '父角色名称';
COMMENT ON COLUMN "public"."sa_oprole"."sdescription" IS '角色描述';
COMMENT ON COLUMN "public"."sa_oprole"."ssequence" IS '角色排序';
COMMENT ON COLUMN "public"."sa_oprole"."svalidstate" IS '状态';
COMMENT ON COLUMN "public"."sa_oprole"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_oprole" IS '角色信息';

-- ----------------------------
-- Records of sa_oprole
-- ----------------------------
INSERT INTO "public"."sa_oprole" VALUES ('RL01', '超级管理员', 'opm', '勿删-系统应用', 'fun', '', '', 1, 1, 4);
INSERT INTO "public"."sa_oprole" VALUES ('RL02', '任务', 'task', '系统管理', 'fun', '', '', 2, 1, 2);
INSERT INTO "public"."sa_oprole" VALUES ('RL02-doc', '文档', 'doc', '系统管理', 'fun', '', '', 3, 1, 2);

-- ----------------------------
-- Table structure for sa_oprolemanage
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_oprolemanage";
CREATE TABLE "public"."sa_oprolemanage" (
  "sid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "sorgid" varchar(36) COLLATE "pg_catalog"."default",
  "sorgfid" varchar(360) COLLATE "pg_catalog"."default",
  "spersonid" varchar(36) COLLATE "pg_catalog"."default",
  "sroleid" varchar(36) COLLATE "pg_catalog"."default",
  "screatorid" varchar(36) COLLATE "pg_catalog"."default",
  "screatetime" timestamp(6),
  "version" int4
)
;

-- ----------------------------
-- Records of sa_oprolemanage
-- ----------------------------

-- ----------------------------
-- Table structure for sa_oprolemanagement
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_oprolemanagement";
CREATE TABLE "public"."sa_oprolemanagement" (
  "sid" varchar(35) COLLATE "pg_catalog"."default" NOT NULL,
  "sorgid" varchar(80) COLLATE "pg_catalog"."default" NOT NULL,
  "sorgname" varchar(255) COLLATE "pg_catalog"."default",
  "sorgfid" varchar(2048) COLLATE "pg_catalog"."default" NOT NULL,
  "sorgfname" varchar(2048) COLLATE "pg_catalog"."default",
  "sroleid" varchar(35) COLLATE "pg_catalog"."default" NOT NULL,
  "screatorfid" varchar(2048) COLLATE "pg_catalog"."default",
  "screatorfname" varchar(2048) COLLATE "pg_catalog"."default",
  "screatetime" timestamp(6),
  "version" int4 NOT NULL
)
;

-- ----------------------------
-- Records of sa_oprolemanagement
-- ----------------------------

-- ----------------------------
-- Table structure for sa_psnmytask
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_psnmytask";
CREATE TABLE "public"."sa_psnmytask" (
  "sid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "scaption" varchar(100) COLLATE "pg_catalog"."default",
  "sstartdate" timestamp(0),
  "senddate" timestamp(0),
  "spriority" int4,
  "scontent" varchar(1000) COLLATE "pg_catalog"."default",
  "sstatus" varchar(30) COLLATE "pg_catalog"."default",
  "saffairstype" int4,
  "scompleterate" int4,
  "sstartdate_axis" int4,
  "ssenddate" int4,
  "swhouser" varchar(100) COLLATE "pg_catalog"."default",
  "ssenddate_axis" int4,
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_psnmytask"."scaption" IS '标题';
COMMENT ON COLUMN "public"."sa_psnmytask"."sstartdate" IS '开始时间';
COMMENT ON COLUMN "public"."sa_psnmytask"."senddate" IS '结束时间';
COMMENT ON COLUMN "public"."sa_psnmytask"."spriority" IS '优先级';
COMMENT ON COLUMN "public"."sa_psnmytask"."scontent" IS '内容';
COMMENT ON COLUMN "public"."sa_psnmytask"."sstatus" IS '状态';
COMMENT ON COLUMN "public"."sa_psnmytask"."saffairstype" IS '事务类型';
COMMENT ON COLUMN "public"."sa_psnmytask"."scompleterate" IS '完成率';
COMMENT ON COLUMN "public"."sa_psnmytask"."sstartdate_axis" IS '开始时间轴';
COMMENT ON COLUMN "public"."sa_psnmytask"."ssenddate" IS '结束时间轴';
COMMENT ON COLUMN "public"."sa_psnmytask"."swhouser" IS '所属用户';
COMMENT ON COLUMN "public"."sa_psnmytask"."ssenddate_axis" IS '发布时间轴';

-- ----------------------------
-- Records of sa_psnmytask
-- ----------------------------

-- ----------------------------
-- Table structure for sa_psnschedule
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_psnschedule";
CREATE TABLE "public"."sa_psnschedule" (
  "sid" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "scaption" varchar(100) COLLATE "pg_catalog"."default",
  "sstartdate" timestamp(0),
  "senddate" timestamp(0),
  "scontent" varchar(4000) COLLATE "pg_catalog"."default",
  "spriority" int4,
  "sstatus" varchar(50) COLLATE "pg_catalog"."default",
  "sstartdate_axis" int4,
  "ssenddate_axis" int4,
  "saffairstype" int4,
  "swhouser" varchar(100) COLLATE "pg_catalog"."default",
  "version" int4
)
;
COMMENT ON COLUMN "public"."sa_psnschedule"."scaption" IS '标题';
COMMENT ON COLUMN "public"."sa_psnschedule"."sstartdate" IS '开始时间';
COMMENT ON COLUMN "public"."sa_psnschedule"."senddate" IS '结束时间';
COMMENT ON COLUMN "public"."sa_psnschedule"."scontent" IS '内容';
COMMENT ON COLUMN "public"."sa_psnschedule"."spriority" IS '优先级别';
COMMENT ON COLUMN "public"."sa_psnschedule"."sstatus" IS '状态';
COMMENT ON COLUMN "public"."sa_psnschedule"."sstartdate_axis" IS '开始时间轴';
COMMENT ON COLUMN "public"."sa_psnschedule"."ssenddate_axis" IS '结束时间轴';
COMMENT ON COLUMN "public"."sa_psnschedule"."saffairstype" IS '事务类型';
COMMENT ON COLUMN "public"."sa_psnschedule"."swhouser" IS '所属用户';

-- ----------------------------
-- Records of sa_psnschedule
-- ----------------------------

-- ----------------------------
-- Table structure for sa_task
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_task";
CREATE TABLE "public"."sa_task" (
  "sid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "sparentid" varchar(36) COLLATE "pg_catalog"."default",
  "sname" varchar(255) COLLATE "pg_catalog"."default",
  "scontent" text COLLATE "pg_catalog"."default",
  "sremark" text COLLATE "pg_catalog"."default",
  "sflowid" varchar(36) COLLATE "pg_catalog"."default",
  "stypeid" varchar(36) COLLATE "pg_catalog"."default",
  "stypename" varchar(64) COLLATE "pg_catalog"."default",
  "sprocess" varchar(255) COLLATE "pg_catalog"."default",
  "sactivity" varchar(255) COLLATE "pg_catalog"."default",
  "screatetime" timestamp(6) DEFAULT now(),
  "sdistributetime" timestamp(6),
  "slastmodifytime" timestamp(6) DEFAULT now(),
  "swarningtime" timestamp(6),
  "slimittime" timestamp(6),
  "sestarttime" timestamp(6),
  "sefinishtime" timestamp(6),
  "sastarttime" timestamp(6),
  "safinishtime" timestamp(6),
  "sexecutetime" timestamp(6),
  "scpersonid" varchar(36) COLLATE "pg_catalog"."default",
  "scpersonname" varchar(255) COLLATE "pg_catalog"."default",
  "scdeptid" varchar(36) COLLATE "pg_catalog"."default",
  "scdeptname" varchar(255) COLLATE "pg_catalog"."default",
  "scognid" varchar(36) COLLATE "pg_catalog"."default",
  "scognname" varchar(255) COLLATE "pg_catalog"."default",
  "sepersonid" varchar(36) COLLATE "pg_catalog"."default",
  "sepersonname" varchar(255) COLLATE "pg_catalog"."default",
  "sedeptid" varchar(36) COLLATE "pg_catalog"."default",
  "sedeptname" varchar(255) COLLATE "pg_catalog"."default",
  "seognid" varchar(36) COLLATE "pg_catalog"."default",
  "seognname" varchar(255) COLLATE "pg_catalog"."default",
  "slock" varchar(36) COLLATE "pg_catalog"."default",
  "sstatusid" varchar(36) COLLATE "pg_catalog"."default",
  "sstatusname" varchar(64) COLLATE "pg_catalog"."default",
  "skindid" varchar(36) COLLATE "pg_catalog"."default",
  "scurl" varchar(255) COLLATE "pg_catalog"."default",
  "seurl" varchar(255) COLLATE "pg_catalog"."default",
  "sexecutemode" varchar(32) COLLATE "pg_catalog"."default",
  "ssequence" int4 DEFAULT 1,
  "scpersoncode" varchar(64) COLLATE "pg_catalog"."default",
  "scposid" varchar(36) COLLATE "pg_catalog"."default",
  "scposcode" varchar(64) COLLATE "pg_catalog"."default",
  "scposname" varchar(255) COLLATE "pg_catalog"."default",
  "scdeptcode" varchar(64) COLLATE "pg_catalog"."default",
  "scogncode" varchar(64) COLLATE "pg_catalog"."default",
  "scfid" varchar(1024) COLLATE "pg_catalog"."default",
  "sepersoncode" varchar(64) COLLATE "pg_catalog"."default",
  "seposid" varchar(36) COLLATE "pg_catalog"."default",
  "seposcode" varchar(64) COLLATE "pg_catalog"."default",
  "seposname" varchar(255) COLLATE "pg_catalog"."default",
  "sedeptcode" varchar(64) COLLATE "pg_catalog"."default",
  "seogncode" varchar(64) COLLATE "pg_catalog"."default",
  "sefid" varchar(1024) COLLATE "pg_catalog"."default",
  "sdata1" varchar(128) COLLATE "pg_catalog"."default",
  "sdata2" varchar(128) COLLATE "pg_catalog"."default",
  "sdata3" varchar(128) COLLATE "pg_catalog"."default",
  "sdata4" varchar(128) COLLATE "pg_catalog"."default",
  "scfname" varchar(1024) COLLATE "pg_catalog"."default",
  "sefname" varchar(1024) COLLATE "pg_catalog"."default",
  "version" int4 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."sa_task"."sid" IS '主键';
COMMENT ON COLUMN "public"."sa_task"."sparentid" IS '父id';
COMMENT ON COLUMN "public"."sa_task"."sname" IS '任务标题';
COMMENT ON COLUMN "public"."sa_task"."scontent" IS '任务内容';
COMMENT ON COLUMN "public"."sa_task"."sremark" IS '任务备注';
COMMENT ON COLUMN "public"."sa_task"."sflowid" IS '流程id';
COMMENT ON COLUMN "public"."sa_task"."stypeid" IS '类型id';
COMMENT ON COLUMN "public"."sa_task"."stypename" IS '类型名称';
COMMENT ON COLUMN "public"."sa_task"."sprocess" IS '流程图';
COMMENT ON COLUMN "public"."sa_task"."sactivity" IS '流程环节';
COMMENT ON COLUMN "public"."sa_task"."screatetime" IS '创建时间';
COMMENT ON COLUMN "public"."sa_task"."sdistributetime" IS '分发时间';
COMMENT ON COLUMN "public"."sa_task"."slastmodifytime" IS '最后编辑时间';
COMMENT ON COLUMN "public"."sa_task"."swarningtime" IS '报警时间';
COMMENT ON COLUMN "public"."sa_task"."slimittime" IS '最后期限';
COMMENT ON COLUMN "public"."sa_task"."sestarttime" IS '执行开始时间';
COMMENT ON COLUMN "public"."sa_task"."sefinishtime" IS '执行结束时间';
COMMENT ON COLUMN "public"."sa_task"."sastarttime" IS '动作开始时间';
COMMENT ON COLUMN "public"."sa_task"."safinishtime" IS '动作结束时间';
COMMENT ON COLUMN "public"."sa_task"."sexecutetime" IS '处理时间';
COMMENT ON COLUMN "public"."sa_task"."scpersonid" IS '提交人id';
COMMENT ON COLUMN "public"."sa_task"."scpersonname" IS '提交人名称';
COMMENT ON COLUMN "public"."sa_task"."scdeptid" IS '提交人部门id';
COMMENT ON COLUMN "public"."sa_task"."scdeptname" IS '提交人部门名称';
COMMENT ON COLUMN "public"."sa_task"."scognid" IS '提交人单位id';
COMMENT ON COLUMN "public"."sa_task"."scognname" IS '提交人单位名称';
COMMENT ON COLUMN "public"."sa_task"."sepersonid" IS '执行人id';
COMMENT ON COLUMN "public"."sa_task"."sepersonname" IS '执行人名称';
COMMENT ON COLUMN "public"."sa_task"."sedeptid" IS '执行人部门id';
COMMENT ON COLUMN "public"."sa_task"."sedeptname" IS '执行人部门名称';
COMMENT ON COLUMN "public"."sa_task"."seognid" IS '执行人单位id';
COMMENT ON COLUMN "public"."sa_task"."seognname" IS '执行人单位名称';
COMMENT ON COLUMN "public"."sa_task"."slock" IS '任务锁定';
COMMENT ON COLUMN "public"."sa_task"."sstatusid" IS '状态id';
COMMENT ON COLUMN "public"."sa_task"."sstatusname" IS '状态名称';
COMMENT ON COLUMN "public"."sa_task"."skindid" IS '类型id';
COMMENT ON COLUMN "public"."sa_task"."scurl" IS '提交页面地址';
COMMENT ON COLUMN "public"."sa_task"."seurl" IS '执行页面地址';
COMMENT ON COLUMN "public"."sa_task"."sexecutemode" IS '执行模式';
COMMENT ON COLUMN "public"."sa_task"."ssequence" IS '排序';
COMMENT ON COLUMN "public"."sa_task"."scpersoncode" IS '提交人编号';
COMMENT ON COLUMN "public"."sa_task"."scposid" IS '提交人岗位id';
COMMENT ON COLUMN "public"."sa_task"."scposcode" IS '提交人岗位编号';
COMMENT ON COLUMN "public"."sa_task"."scposname" IS '提交人岗位名称';
COMMENT ON COLUMN "public"."sa_task"."scdeptcode" IS '提交人部门编号';
COMMENT ON COLUMN "public"."sa_task"."scogncode" IS '提交人单位编号';
COMMENT ON COLUMN "public"."sa_task"."scfid" IS '提交人路径id';
COMMENT ON COLUMN "public"."sa_task"."sepersoncode" IS '执行人编号';
COMMENT ON COLUMN "public"."sa_task"."seposid" IS '执行人岗位id';
COMMENT ON COLUMN "public"."sa_task"."seposcode" IS '执行人编号';
COMMENT ON COLUMN "public"."sa_task"."seposname" IS '执行人名称';
COMMENT ON COLUMN "public"."sa_task"."sedeptcode" IS '执行人部门编号';
COMMENT ON COLUMN "public"."sa_task"."seogncode" IS '执行人单位编号';
COMMENT ON COLUMN "public"."sa_task"."sefid" IS '执行人路径id';
COMMENT ON COLUMN "public"."sa_task"."sdata1" IS '业务主键';
COMMENT ON COLUMN "public"."sa_task"."sdata2" IS '业务子表id';
COMMENT ON COLUMN "public"."sa_task"."sdata3" IS '业务从表id';
COMMENT ON COLUMN "public"."sa_task"."sdata4" IS '业务外键';
COMMENT ON COLUMN "public"."sa_task"."scfname" IS '提交人路径名称';
COMMENT ON COLUMN "public"."sa_task"."sefname" IS '执行人路径名称';
COMMENT ON COLUMN "public"."sa_task"."version" IS '版本号';
COMMENT ON TABLE "public"."sa_task" IS '流程管理';

-- ----------------------------
-- Records of sa_task
-- ----------------------------
INSERT INTO "public"."sa_task" VALUES ('C028F91196C3483B8B2E822CF5267F2F', '3F9021623C064E6C8707B9AC7E2E0E4C', 'bizActivity4:测试流程', NULL, NULL, '64F722F0D4B743CFB3792C407744656C', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity4', '2024-03-06 12:48:52.013', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-06 12:48:52.013', '2024-03-06 12:52:28.092', '2024-03-06 12:52:28.092', 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', NULL, NULL, NULL, NULL, 'E1E1113D288548B0A51F738C37F54EE7', 'tesFinished', '已完成', NULL, '/demo/flow/mainActivity2.html', '/demo/flow/mainActivity2.html', NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', NULL, NULL, NULL, NULL, NULL, '/ORG01.ogn/PSN01@ORG01.psm', '69FB950E3D5045978EB3D0D042F0AEC2', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 1);
INSERT INTO "public"."sa_task" VALUES ('3F9021623C064E6C8707B9AC7E2E0E4C', 'AD370EC51EC54F91B6F29AAB29F11B71', 'bizActivity4:测试流程', NULL, NULL, '64F722F0D4B743CFB3792C407744656C', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity4', '2024-03-06 12:47:52.83', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-06 12:47:52.83', '2024-03-06 12:48:52.045', '2024-03-06 12:48:52.045', 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', NULL, NULL, NULL, NULL, NULL, 'tesFinished', '已完成', NULL, '/demo/flow/mainActivity.html', '/demo/flow/mainActivity2.html', NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', NULL, NULL, NULL, NULL, NULL, '/ORG01.ogn/PSN01@ORG01.psm', '69FB950E3D5045978EB3D0D042F0AEC2', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 1);
INSERT INTO "public"."sa_task" VALUES ('AD370EC51EC54F91B6F29AAB29F11B71', '64F722F0D4B743CFB3792C407744656C', 'bizActivity2:测试流程', NULL, NULL, '64F722F0D4B743CFB3792C407744656C', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity2', '2024-03-06 12:47:49.63', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-06 12:47:49.63', '2024-03-06 12:47:52.86', '2024-03-06 12:47:52.86', 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', '', '', 'ORG01', '管理员', NULL, 'tesFinished', '已完成', NULL, NULL, '/demo/flow/mainActivity.html', NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', '69FB950E3D5045978EB3D0D042F0AEC2', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 1);
INSERT INTO "public"."sa_task" VALUES ('1752513F978846E7B328109C6AC5062A', '2D7C816D00794540828AB9418E6A7E01', '结束:测试流程', NULL, NULL, '64F722F0D4B743CFB3792C407744656C', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'Activity8', '2024-10-18 14:52:54.268', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-18 14:52:54.268', NULL, NULL, 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', '', '', 'ORG01', '管理员', NULL, 'tesFinished', '已完成', NULL, '/demo/flow/mainActivity2.html', NULL, NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', '69FB950E3D5045978EB3D0D042F0AEC2', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 0);
INSERT INTO "public"."sa_task" VALUES ('2D7C816D00794540828AB9418E6A7E01', 'C028F91196C3483B8B2E822CF5267F2F', 'bizActivity6:测试流程', NULL, NULL, '64F722F0D4B743CFB3792C407744656C', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity6', '2024-03-06 12:52:28.059', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-06 12:52:28.059', '2024-10-18 14:52:54.362', '2024-10-18 14:52:54.362', 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', NULL, NULL, NULL, NULL, 'B0F68890FC4541E2BE6C2BCB618CC76B', 'tesFinished', '已完成', NULL, '/demo/flow/mainActivity2.html', '/demo/flow/mainActivity2.html', NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', NULL, NULL, NULL, NULL, NULL, '/ORG01.ogn/PSN01@ORG01.psm', '69FB950E3D5045978EB3D0D042F0AEC2', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 1);
INSERT INTO "public"."sa_task" VALUES ('64F722F0D4B743CFB3792C407744656C', NULL, '测试流程', NULL, NULL, '64F722F0D4B743CFB3792C407744656C', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', NULL, '2024-03-06 12:47:49.451', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-18 14:52:57.058643', 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', '', '', 'ORG01', '管理员', NULL, 'tesFinished', '已完成', NULL, NULL, NULL, NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', '69FB950E3D5045978EB3D0D042F0AEC2', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 1);
INSERT INTO "public"."sa_task" VALUES ('48C357DFDC2B4D88A28D3F0F34A1420D', NULL, '测试流程', NULL, NULL, '48C357DFDC2B4D88A28D3F0F34A1420D', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', NULL, '2024-10-18 14:59:05.04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', '', '', 'ORG01', '管理员', NULL, 'tesExecuting', '正在处理', NULL, NULL, NULL, NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'D9F40DD3A388405DBAB2F6C5E2393CEF', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 0);
INSERT INTO "public"."sa_task" VALUES ('4D24D25F3B484616A13C8AFE65158300', '7392F8F988FB40A8B911C18F112565F5', 'bizActivity4:测试流程', NULL, NULL, '48C357DFDC2B4D88A28D3F0F34A1420D', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity4', '2024-10-18 14:59:10.53', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-18 14:59:10.53', NULL, NULL, 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', NULL, NULL, NULL, NULL, NULL, 'tesReady', '尚未处理', NULL, '/demo/flow/mainActivity.html', '/demo/flow/mainActivity2.html', NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', NULL, NULL, NULL, NULL, NULL, '/ORG01.ogn/PSN01@ORG01.psm', 'D9F40DD3A388405DBAB2F6C5E2393CEF', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 0);
INSERT INTO "public"."sa_task" VALUES ('7392F8F988FB40A8B911C18F112565F5', '48C357DFDC2B4D88A28D3F0F34A1420D', 'bizActivity2:测试流程', NULL, NULL, '48C357DFDC2B4D88A28D3F0F34A1420D', NULL, NULL, 'EFB1385BEB1441BCA87404D318B7F9BC', 'bizActivity2', '2024-10-18 14:59:05.555', NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-18 14:59:05.555', '2024-10-18 14:59:10.62', '2024-10-18 14:59:10.62', 'PSN01', 'system', '', '', 'ORG01', '管理员', 'PSN01', 'system', '', '', 'ORG01', '管理员', NULL, 'tesFinished', '已完成', NULL, NULL, '/demo/flow/mainActivity.html', NULL, NULL, 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'SYSTEM', '', '', '', '', 'TULIN', '/ORG01.ogn/PSN01@ORG01.psm', 'D9F40DD3A388405DBAB2F6C5E2393CEF', NULL, NULL, NULL, '/管理员/system', '/管理员/system', 1);

-- ----------------------------
-- Table structure for sa_task_timelimit
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_task_timelimit";
CREATE TABLE "public"."sa_task_timelimit" (
  "sid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "sprocessid" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sprocessname" varchar(512) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sactivity" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sactivityname" varchar(512) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sdlimit" int4,
  "version" int4
)
;

-- ----------------------------
-- Records of sa_task_timelimit
-- ----------------------------

-- ----------------------------
-- View structure for sa_oporg_view
-- ----------------------------
DROP VIEW IF EXISTS "public"."sa_oporg_view";
CREATE VIEW "public"."sa_oporg_view" AS  SELECT o.sid,
    o.sparent,
    o.scode,
    o.sname,
    COALESCE(o.sorgkindid, 'org'::character varying) AS sorgkindid,
    o.sfid,
    o.svalidstate,
    o.sfcode,
    o.sfname,
    o.ssequence,
    o.sdescription,
    o.saddress,
    ''::character varying AS smobilephone,
    o.version
   FROM sa_oporg o
  WHERE ((o.svalidstate = 1) AND ((o.sorgkindid)::text <> 'psm'::text))
UNION ALL
 SELECT p.sid,
    t.sid AS sparent,
    p.scode,
    p.sname,
    'psm'::character varying AS sorgkindid,
    concat(t.sfid, '/', p.sid) AS sfid,
    t.svalidstate,
    concat(t.sfcode, '/', p.scode) AS sfcode,
    concat(t.sfname, '/', p.sname) AS sfname,
    (t.slevel + p.ssequence) AS ssequence,
    t.sdescription,
    t.saddress,
    COALESCE(p.smobilephone, ''::character varying) AS smobilephone,
    p.version
   FROM (sa_opperson p
     LEFT JOIN sa_oporg t ON (((p.smainorgid)::text = (t.sid)::text)))
  WHERE ((p.smainorgid IS NOT NULL) AND (t.svalidstate = 1) AND (p.svalidstate = 1));

-- ----------------------------
-- View structure for sa_task_monitor
-- ----------------------------
DROP VIEW IF EXISTS "public"."sa_task_monitor";
CREATE VIEW "public"."sa_task_monitor" AS  SELECT t.sid,
    t.sparentid,
    t.sname,
    t.scontent,
    t.sremark,
    t.sflowid,
    t.stypeid,
    t.stypename,
    t.sprocess,
    t.sactivity,
    t.screatetime,
    t.sdistributetime,
    t.slastmodifytime,
    t.swarningtime,
    t.slimittime,
    t.sestarttime,
    t.sefinishtime,
    t.sastarttime,
    t.safinishtime,
    t.sexecutetime,
    t.scpersonid,
    t.scpersonname,
    t.scdeptid,
    t.scdeptname,
    t.scognid,
    t.scognname,
    t.sepersonid,
    t.sepersonname,
    t.sedeptid,
    t.sedeptname,
    t.seognid,
    t.seognname,
    t.slock,
    t.sstatusid,
    t.sstatusname,
    t.skindid,
    t.scurl,
    t.seurl,
    t.sexecutemode,
    t.ssequence,
    t.scpersoncode,
    t.scposid,
    t.scposcode,
    t.scposname,
    t.scdeptcode,
    t.scogncode,
    t.scfid,
    t.sepersoncode,
    t.seposid,
    t.seposcode,
    t.seposname,
    t.sedeptcode,
    t.seogncode,
    t.sefid,
    t.sdata1,
    t.sdata2,
    t.sdata3,
    t.sdata4,
    t.scfname,
    t.sefname,
    t.version,
    p.sname AS sflowname
   FROM sa_task t,
    sa_task p
  WHERE (((t.sid)::text = (p.sparentid)::text) AND ((t.sflowid)::text = (t.sid)::text));

-- ----------------------------
-- Primary Key structure for table bo_blog
-- ----------------------------
ALTER TABLE "public"."bo_blog" ADD CONSTRAINT "bo_blog_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table bo_category
-- ----------------------------
ALTER TABLE "public"."bo_category" ADD CONSTRAINT "bo_category_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Indexes structure for table bo_comment
-- ----------------------------
CREATE INDEX "bo_com_ENTRY_ID" ON "public"."bo_comment" USING btree (
  "entry_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table bo_comment
-- ----------------------------
ALTER TABLE "public"."bo_comment" ADD CONSTRAINT "bo_comment_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table bo_entry
-- ----------------------------
CREATE INDEX "bo_entry_creatorid" ON "public"."bo_entry" USING btree (
  "creatorid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table bo_entry
-- ----------------------------
ALTER TABLE "public"."bo_entry" ADD CONSTRAINT "bo_entry_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table doc_admin
-- ----------------------------
ALTER TABLE "public"."doc_admin" ADD CONSTRAINT "doc_admin_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table doc_author
-- ----------------------------
ALTER TABLE "public"."doc_author" ADD CONSTRAINT "doc_author_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Uniques structure for table doc_docpath
-- ----------------------------
ALTER TABLE "public"."doc_docpath" ADD CONSTRAINT "doc_docpath_ffileid_key" UNIQUE ("ffileid");

-- ----------------------------
-- Primary Key structure for table doc_docpath
-- ----------------------------
ALTER TABLE "public"."doc_docpath" ADD CONSTRAINT "doc_docpath_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Uniques structure for table doc_document
-- ----------------------------
ALTER TABLE "public"."doc_document" ADD CONSTRAINT "doc_document_fdocid_key" UNIQUE ("fdocid");

-- ----------------------------
-- Primary Key structure for table doc_document
-- ----------------------------
ALTER TABLE "public"."doc_document" ADD CONSTRAINT "doc_document_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table doc_log
-- ----------------------------
ALTER TABLE "public"."doc_log" ADD CONSTRAINT "doc_log_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table doc_user
-- ----------------------------
ALTER TABLE "public"."doc_user" ADD CONSTRAINT "doc_user_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table im_fileinfo
-- ----------------------------
ALTER TABLE "public"."im_fileinfo" ADD CONSTRAINT "im_fileinfo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table im_group
-- ----------------------------
CREATE INDEX "im_group_creator" ON "public"."im_group" USING btree (
  "creator" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table im_group
-- ----------------------------
ALTER TABLE "public"."im_group" ADD CONSTRAINT "im_group_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table im_group_memli
-- ----------------------------
CREATE INDEX "im_group_memli_userid" ON "public"."im_group_memli" USING btree (
  "userid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "im_groupm_groupid" ON "public"."im_group_memli" USING btree (
  "groupid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table im_group_memli
-- ----------------------------
ALTER TABLE "public"."im_group_memli" ADD CONSTRAINT "im_group_memli_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table im_header
-- ----------------------------
ALTER TABLE "public"."im_header" ADD CONSTRAINT "im_header_pkey" PRIMARY KEY ("userid");

-- ----------------------------
-- Indexes structure for table im_message
-- ----------------------------
CREATE INDEX "im_message_from" ON "public"."im_message" USING btree (
  "mfrom" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "im_message_state" ON "public"."im_message" USING btree (
  "mstate" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "im_message_to" ON "public"."im_message" USING btree (
  "mto" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table im_message
-- ----------------------------
ALTER TABLE "public"."im_message" ADD CONSTRAINT "im_message_pkey" PRIMARY KEY ("mid");

-- ----------------------------
-- Indexes structure for table im_message_memli
-- ----------------------------
CREATE INDEX "im_message_memli_mid" ON "public"."im_message_memli" USING btree (
  "mid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "im_message_memli_tid" ON "public"."im_message_memli" USING btree (
  "tid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table im_message_memli
-- ----------------------------
ALTER TABLE "public"."im_message_memli" ADD CONSTRAINT "im_message_memli_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table oa_adm_mygroupfrom
-- ----------------------------
CREATE INDEX "oa_mygroupde_foutkey" ON "public"."oa_adm_mygroupfrom" USING btree (
  "foutkey" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table oa_adm_mygroupfrom
-- ----------------------------
ALTER TABLE "public"."oa_adm_mygroupfrom" ADD CONSTRAINT "oa_adm_mygroupfrom_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Indexes structure for table oa_adm_mygroupmain
-- ----------------------------
CREATE INDEX "oa_mygroup_psnid" ON "public"."oa_adm_mygroupmain" USING btree (
  "fcreatorid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table oa_adm_mygroupmain
-- ----------------------------
ALTER TABLE "public"."oa_adm_mygroupmain" ADD CONSTRAINT "oa_adm_mygroupmain_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table oa_em_receiveemail
-- ----------------------------
ALTER TABLE "public"."oa_em_receiveemail" ADD CONSTRAINT "oa_em_receiveemail_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table oa_em_sendemail
-- ----------------------------
ALTER TABLE "public"."oa_em_sendemail" ADD CONSTRAINT "oa_em_sendemail_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table oa_flowconclusion
-- ----------------------------
ALTER TABLE "public"."oa_flowconclusion" ADD CONSTRAINT "oa_flowconclusion_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table oa_flowrecord
-- ----------------------------
ALTER TABLE "public"."oa_flowrecord" ADD CONSTRAINT "oa_flowrecord_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table oa_leave
-- ----------------------------
ALTER TABLE "public"."oa_leave" ADD CONSTRAINT "oa_leave_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table oa_news_column
-- ----------------------------
ALTER TABLE "public"."oa_news_column" ADD CONSTRAINT "oa_news_column_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table oa_news_count
-- ----------------------------
ALTER TABLE "public"."oa_news_count" ADD CONSTRAINT "oa_news_count_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Indexes structure for table oa_news_open
-- ----------------------------
CREATE INDEX "oa_new_open_nid" ON "public"."oa_news_open" USING btree (
  "fnewsid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table oa_news_open
-- ----------------------------
ALTER TABLE "public"."oa_news_open" ADD CONSTRAINT "oa_news_open_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table oa_news_release
-- ----------------------------
ALTER TABLE "public"."oa_news_release" ADD CONSTRAINT "oa_news_release_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Indexes structure for table oa_notice_person
-- ----------------------------
CREATE INDEX "oa_nperson_fmainid" ON "public"."oa_notice_person" USING btree (
  "fmainid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table oa_notice_person
-- ----------------------------
ALTER TABLE "public"."oa_notice_person" ADD CONSTRAINT "oa_notice_person_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Indexes structure for table oa_pulicnotice
-- ----------------------------
CREATE INDEX "oa_notes_fcreateid" ON "public"."oa_pulicnotice" USING btree (
  "fcreateid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table oa_pulicnotice
-- ----------------------------
ALTER TABLE "public"."oa_pulicnotice" ADD CONSTRAINT "oa_pulicnotice_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table oa_re_dayreport
-- ----------------------------
ALTER TABLE "public"."oa_re_dayreport" ADD CONSTRAINT "oa_re_dayreport_pkey" PRIMARY KEY ("fid");

-- ----------------------------
-- Primary Key structure for table sa_doclog
-- ----------------------------
ALTER TABLE "public"."sa_doclog" ADD CONSTRAINT "sa_doclog_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Primary Key structure for table sa_docnamespace
-- ----------------------------
ALTER TABLE "public"."sa_docnamespace" ADD CONSTRAINT "sa_docnamespace_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_docnode
-- ----------------------------
CREATE INDEX "idx_sa_docnode" ON "public"."sa_docnode" USING btree (
  "sparentid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sa_docnode_path" ON "public"."sa_docnode" USING btree (
  "sdocpath" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sa_docnode_sfileid" ON "public"."sa_docnode" USING btree (
  "sfileid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "inx_sa_donnode_skind" ON "public"."sa_docnode" USING btree (
  "skind" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_docnode
-- ----------------------------
ALTER TABLE "public"."sa_docnode" ADD CONSTRAINT "sa_docnode_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_flowdrawlg
-- ----------------------------
CREATE INDEX "idx_sa_flowdrawlg_sprocessid" ON "public"."sa_flowdrawlg" USING btree (
  "sprocessid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_flowdrawlg
-- ----------------------------
ALTER TABLE "public"."sa_flowdrawlg" ADD CONSTRAINT "sa_flowdrawlg_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_flowfolder
-- ----------------------------
CREATE INDEX "idx_sa_flwfolder_sparent" ON "public"."sa_flowfolder" USING btree (
  "sparent" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_flowfolder
-- ----------------------------
ALTER TABLE "public"."sa_flowfolder" ADD CONSTRAINT "sa_flowfolder_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Primary Key structure for table sa_handwr_signature
-- ----------------------------
ALTER TABLE "public"."sa_handwr_signature" ADD CONSTRAINT "sa_handwr_signature_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Primary Key structure for table sa_kvsequence
-- ----------------------------
ALTER TABLE "public"."sa_kvsequence" ADD CONSTRAINT "sa_kvsequence_pkey" PRIMARY KEY ("k");

-- ----------------------------
-- Primary Key structure for table sa_log
-- ----------------------------
ALTER TABLE "public"."sa_log" ADD CONSTRAINT "sa_log_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Primary Key structure for table sa_loginlog
-- ----------------------------
ALTER TABLE "public"."sa_loginlog" ADD CONSTRAINT "sa_loginlog_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_onlineinfo
-- ----------------------------
CREATE INDEX "sa_onlineinfo_sserviceip" ON "public"."sa_onlineinfo" USING btree (
  "sserviceip" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "sa_onlineinfo_ssessionid" ON "public"."sa_onlineinfo" USING btree (
  "ssessionid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_onlineinfo
-- ----------------------------
ALTER TABLE "public"."sa_onlineinfo" ADD CONSTRAINT "sa_onlineinfo_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Primary Key structure for table sa_opagent
-- ----------------------------
ALTER TABLE "public"."sa_opagent" ADD CONSTRAINT "sa_opagent_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_opauthorize
-- ----------------------------
CREATE INDEX "idx_opauth_roleid" ON "public"."sa_opauthorize" USING btree (
  "sauthorizeroleid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_opauthorize
-- ----------------------------
ALTER TABLE "public"."sa_opauthorize" ADD CONSTRAINT "sa_opauthorize_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Primary Key structure for table sa_opmanagement
-- ----------------------------
ALTER TABLE "public"."sa_opmanagement" ADD CONSTRAINT "sa_opmanagement_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Primary Key structure for table sa_opmanagetype
-- ----------------------------
ALTER TABLE "public"."sa_opmanagetype" ADD CONSTRAINT "sa_opmanagetype_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_opmenutree
-- ----------------------------
CREATE INDEX "idx_sa_function_tree_pid" ON "public"."sa_opmenutree" USING btree (
  "pid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_opmenutree
-- ----------------------------
ALTER TABLE "public"."sa_opmenutree" ADD CONSTRAINT "sa_function_tree_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_oporg
-- ----------------------------
CREATE INDEX "idx_oporg_code" ON "public"."sa_oporg" USING btree (
  "scode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sa_oporg_sfid" ON "public"."sa_oporg" USING btree (
  "sfid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sa_oporg_sorgkindid" ON "public"."sa_oporg" USING btree (
  "sorgkindid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sa_oporg_sparent" ON "public"."sa_oporg" USING btree (
  "sparent" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sa_oporg_spersonid" ON "public"."sa_oporg" USING btree (
  "spersonid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_oporg
-- ----------------------------
ALTER TABLE "public"."sa_oporg" ADD CONSTRAINT "sa_oporg_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_oppermission
-- ----------------------------
CREATE INDEX "idx_opperm_activity" ON "public"."sa_oppermission" USING btree (
  "sactivity" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_opperm_process" ON "public"."sa_oppermission" USING btree (
  "sprocess" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_opperm_roleid" ON "public"."sa_oppermission" USING btree (
  "spermissionroleid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_opperm_smenuid" ON "public"."sa_oppermission" USING btree (
  "smenuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_oppermission
-- ----------------------------
ALTER TABLE "public"."sa_oppermission" ADD CONSTRAINT "sa_oppermission_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_opperson
-- ----------------------------
CREATE INDEX "idx_opperson_scode" ON "public"."sa_opperson" USING btree (
  "scode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_opperson_smainorgid" ON "public"."sa_opperson" USING btree (
  "smainorgid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "xmsgindexmessagesvalidstate" ON "public"."sa_opperson" USING btree (
  "svalidstate" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_opperson
-- ----------------------------
ALTER TABLE "public"."sa_opperson" ADD CONSTRAINT "sa_opperson_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Primary Key structure for table sa_opperson_deatail
-- ----------------------------
ALTER TABLE "public"."sa_opperson_deatail" ADD CONSTRAINT "sa_opperson_deatail_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_oprole
-- ----------------------------
CREATE INDEX "idx_oprole_code" ON "public"."sa_oprole" USING btree (
  "scode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_oprole
-- ----------------------------
ALTER TABLE "public"."sa_oprole" ADD CONSTRAINT "sa_oprole_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Primary Key structure for table sa_oprolemanage
-- ----------------------------
ALTER TABLE "public"."sa_oprolemanage" ADD CONSTRAINT "sa_oprolemanage_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Primary Key structure for table sa_oprolemanagement
-- ----------------------------
ALTER TABLE "public"."sa_oprolemanagement" ADD CONSTRAINT "sa_oprolemanagement_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_psnmytask
-- ----------------------------
CREATE INDEX "sa_psntask_user" ON "public"."sa_psnmytask" USING btree (
  "swhouser" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_psnmytask
-- ----------------------------
ALTER TABLE "public"."sa_psnmytask" ADD CONSTRAINT "sa_psnmytask_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_psnschedule
-- ----------------------------
CREATE INDEX "sa_psnschedule_user" ON "public"."sa_psnschedule" USING btree (
  "swhouser" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_psnschedule
-- ----------------------------
ALTER TABLE "public"."sa_psnschedule" ADD CONSTRAINT "sa_psnschedule_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Indexes structure for table sa_task
-- ----------------------------
CREATE INDEX "sa_flowid" ON "public"."sa_task" USING btree (
  "sflowid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "sa_status" ON "public"."sa_task" USING btree (
  "sstatusid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "sa_task_sdata_1" ON "public"."sa_task" USING btree (
  "sdata1" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "sa_task_sparentid" ON "public"."sa_task" USING btree (
  "sparentid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "sa_task_sprocess" ON "public"."sa_task" USING btree (
  "sprocess" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sa_task
-- ----------------------------
ALTER TABLE "public"."sa_task" ADD CONSTRAINT "sa_task_pkey" PRIMARY KEY ("sid");

-- ----------------------------
-- Primary Key structure for table sa_task_timelimit
-- ----------------------------
ALTER TABLE "public"."sa_task_timelimit" ADD CONSTRAINT "sa_task_timelimit_pkey" PRIMARY KEY ("sid");
