/*
 Navicat Premium Data Transfer

 Source Server         : 开发云postgre
 Source Server Type    : PostgreSQL
 Source Server Version : 100017
 Source Host           : dev.tlv8.com:5432
 Source Catalog        : tlv8-vue
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 100017
 File Encoding         : 65001

 Date: 11/04/2023 21:24:59
*/


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
INSERT INTO "public"."doc_docpath" VALUES ('8D7EAE972C494A9B9077AD5B8F2F1549', '2-root', '2023/03/13/21/03', 0, 1, '2023-03-13 21:03:28.747', 0);
INSERT INTO "public"."doc_docpath" VALUES ('830074751E704E71ADA75FA9447DE93D', '3-root', '2023/03/13/21/11', 0, 1, '2023-03-13 21:11:40.47', 0);
INSERT INTO "public"."doc_docpath" VALUES ('DF2162B688674B8494E23F053E364757', '4-root', '2023/03/13/21/12', 0, 1, '2023-03-13 21:12:04.898', 0);
INSERT INTO "public"."doc_docpath" VALUES ('A0EBE575F82C491FA9C2C6F3E73B6019', '31-root', '2023/03/13/21/19', 0, 1, '2023-03-13 21:19:36.915', 0);
INSERT INTO "public"."doc_docpath" VALUES ('A3490147DD97430789C53CA20B8159D4', '32-root', '2023/03/13/21/24', 0, 1, '2023-03-13 21:24:14.268', 0);

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
INSERT INTO "public"."doc_document" VALUES ('F5370F41BE3B49C097D15BD5B6C423D7', '2-root', NULL, NULL, 0, NULL, '2023-03-13 21:03:28.747', NULL, 0);
INSERT INTO "public"."doc_document" VALUES ('782272B41F8F47AA9ED52C481804D78D', '3-root', NULL, NULL, 0, NULL, '2023-03-13 21:11:40.47', NULL, 0);
INSERT INTO "public"."doc_document" VALUES ('A4D11E528D244C97A8DB0C4352167536', '4-root', NULL, NULL, 0, NULL, '2023-03-13 21:12:04.898', NULL, 0);
INSERT INTO "public"."doc_document" VALUES ('617CB7ACF98E47B4B6ADEC500BE4E623', '31-root', '测试文件.docx', '.docx', 0, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '2023-03-13 21:19:36.915', NULL, 0);
INSERT INTO "public"."doc_document" VALUES ('4F42E2AA0EE941E9BB222C481DE4E92D', '32-root', '测试文件.docx', '.docx', 0, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '2023-03-13 21:24:14.268', NULL, 0);

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
INSERT INTO "public"."doc_index" VALUES (42);

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
INSERT INTO "public"."sa_docnamespace" VALUES ('defaultDocNameSpace', '文档中心', '127.0.0.1', 8085, 'http://127.0.0.1:8085/DocServer', 1, 'false', 0);

-- ----------------------------
-- Table structure for sa_docnode
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_docnode";
CREATE TABLE "public"."sa_docnode" (
  "sid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "sparentid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sdocname" varchar(2500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ssequence" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ssize" float8,
  "skind" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sdocpath" text COLLATE "pg_catalog"."default",
  "sdocdisplaypath" text COLLATE "pg_catalog"."default",
  "screatorfid" varchar(2048) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "screatorname" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "screatordeptname" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "screatetime" timestamp(6),
  "seditorfid" varchar(2048) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "seditorname" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "seditordeptname" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "slastwriterfid" varchar(2048) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "slastwritername" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "slastwriterdeptname" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "slastwritetime" timestamp(6),
  "sfileid" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sdescription" text COLLATE "pg_catalog"."default",
  "sdocliveversionid" int4,
  "version" numeric(10) DEFAULT NULL::numeric,
  "sclassification" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "skeywords" varchar(256) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sdocserialnumber" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sfinishtime" timestamp(6),
  "snamespace" varchar(256) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scachename" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "srevisioncachename" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sflag" int4
)
;

-- ----------------------------
-- Records of sa_docnode
-- ----------------------------
INSERT INTO "public"."sa_docnode" VALUES ('root', NULL, '文档中心', '', NULL, 'dir', '/root', '/文档中心', '', '', '', NULL, '', '', '', '', '', '', NULL, '', '', NULL, 4, '', '', '', NULL, 'defaultDocNameSpace', '', '', 1);

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
INSERT INTO "public"."sa_flowdrawlg" VALUES ('DE471268CD2B4F79ADA659509F054E6C', '9ADA9F7C07B34B80A4EE62962F2A56FC', '审批流程', NULL, '{"id":"9ADA9F7C07B34B80A4EE62962F2A56FC","name":"审批流程","count":9,"nodes":[{"id":"Activity1","name":"开始","type":"start","shape":"oval","number":1,"left":300,"top":80,"width":40,"height":40,"property":null},{"id":"bizActivity2","name":"bizActivity2","type":"node","shape":"rect","number":2,"left":270,"top":140,"width":100,"height":40,"property":null},{"id":"bizActivity4","name":"bizActivity4","type":"node","shape":"rect","number":4,"left":270,"top":200,"width":100,"height":40,"property":null},{"id":"bizActivity6","name":"bizActivity6","type":"node","shape":"rect","number":6,"left":270,"top":260,"width":100,"height":40,"property":null},{"id":"Activity8","name":"结束","type":"end","shape":"oval","number":8,"left":300,"top":320,"width":40,"height":40,"property":null}],"lines":[{"id":"line_3","name":"line_3","type":"line","shape":"line","number":3,"from":"Activity1","to":"bizActivity2","fromx":320,"fromy":120,"tox":320,"toy":140,"spwidth":0,"spheight":0,"polydot":[],"property":null},{"id":"line_5","name":"line_5","type":"line","shape":"line","number":5,"from":"bizActivity2","to":"bizActivity4","fromx":320,"fromy":180,"tox":320,"toy":200,"spwidth":0,"spheight":0,"polydot":[],"property":null},{"id":"line_7","name":"line_7","type":"line","shape":"line","number":7,"from":"bizActivity4","to":"bizActivity6","fromx":320,"fromy":240,"tox":320,"toy":260,"spwidth":0,"spheight":0,"polydot":[],"property":null},{"id":"line_9","name":"line_9","type":"line","shape":"line","number":9,"from":"bizActivity6","to":"Activity8","fromx":320,"fromy":300,"tox":320,"toy":320,"spwidth":0,"spheight":0,"polydot":[],"property":null}]}', NULL, NULL, NULL, NULL, '2023-04-10 18:07:38.461582', '2023-04-10 18:07:38.461582', 1, '3B95F41FB4B34437920A9D7F7462C9B2', 0);

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
INSERT INTO "public"."sa_flowfolder" VALUES ('3B95F41FB4B34437920A9D7F7462C9B2', NULL, NULL, 'root', '根目录', NULL, '/3B95F41FB4B34437920A9D7F7462C9B2', '/根目录', '/root', 0);

-- ----------------------------
-- Table structure for sa_kvsequence
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_kvsequence";
CREATE TABLE "public"."sa_kvsequence" (
  "k" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "v" int4 NOT NULL
)
;

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
INSERT INTO "public"."sa_log" VALUES ('0B41BAE3E02C44E9A6C08A1F1491EE83', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:07:22.916', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2911F9FC6EA64E9CB6D280FC92F3A1EE', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:07:23.453', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4453855E35784A13A878261E17F5D44C', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:07:28.564', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AA1818FA5960425D99A33EBC84073B19', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:07:28.994', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('47301CCAB9F449519FFBF3EEEA746AA1', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:08:02.458', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E709AD8CD3364F7E8F6E8F35E9648ADB', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:08:02.892', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B9F97B15A57E4870B0DE4F2E976BDE03', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:09:34.883', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3BE01078200C4B60843385F89E07EB14', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:09:35.429', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('913A45915DB34803B4B60EA391741B73', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:10:04.042', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3E699447E4AB4A64A3B1A748F14C39AC', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:10:04.511', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F59CC9D12939442CB81D13D590091299', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:11:04.766', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D0D14B2376E545D599FBA4D5AF7B6148', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:11:05.293', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('51EC3FCB0B024BDC993E9EE6201DB178', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:11:14.542', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5D1FF99797FE4318A5B07758A29FF6DA', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:11:15.019', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B9F79EA3BA5A4C33ADB733157505E214', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:11:34.11', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A17C8E8658B24C52B09B778EB9002F07', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:11:34.589', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6A97BFBDA1A04D48A5B60B81BEC8A760', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:11:50.434', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('16B61DAD8FC345969FBA209F33DB917E', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:11:52.623', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F87EB2FA297C46F2885B21201229A8FB', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:14:30.171', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('26E2D282424B40DD8CF3A8E16363EB1B', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:14:30.704', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2CCE0BD75C184D268F837DD35E8A5378', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:15:40.604', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F12FF97596AB4B408EFA346A6CED393B', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:15:41.159', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F1D2D8D7AA8C4BB5BE9E1D8252B442E8', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:16:19.846', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1DCFF9C8A5AD4379821DEDDDD809178D', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:16:20.283', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('60D473240F674DDCBE266D2EBDFE6984', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:17:30.928', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C3397A310DC34E71B0A70E1B39F78B2A', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:17:31.46', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E35647751537467F97A3DB0E6E787013', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:22:14.024', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('32017F01E0B44F079AAD50368BF351E4', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:22:34.108', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5A0871AC216441E9B8BA8E72312CDF0F', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:23:01.928', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DC2930A31FD445CCB6707A0B342CB415', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:27:21.284', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8FEC636E537841D1B651A71EA6388E07', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:27:21.793', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('941E3FAD95C0460B888F29E68C97D986', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:28:23.918', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4DB2F1790609462785E084C660DA6DF9', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:28:24.431', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('31481BD3272F4F4FB86151CA38AC8C3B', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:29:40.971', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6133A048CAFF482CAE36DD2F4E6756B8', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:29:41.511', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0AD4FBB46D5E4048B693279F1C85F432', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:29:45.31', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6F0DBB4525374B6F9FD324000795572F', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:33:35.752', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6BB83F9141A64136A204BAEAB7CE0E20', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:33:36.315', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('16B790BF622C4D52BA500C825ED03576', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:33:39.47', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4F3819D170E7472C88EBF05F4574A13D', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:34:16.87', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3995F65B23424FE2A9B5CE81A989DF75', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:34:17.404', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D8707DA9E52A4CA1944DF80AC22A765E', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:34:20.352', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('234060A003554B70B269547F62CE2CF4', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:35:23.454', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E22CF68E84A5460AA355FE2C8E3DF0FD', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:35:23.984', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A3F7F4AA2EAC4277ABF7A2778FA12FAB', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:35:25.729', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('802A46CEDBA54F27A230508ECCCD595B', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:35:29.631', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B87C9DA460D64CD59E94182A295B1DB1', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:37:51.941', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3DA5E66E81ED4E27AC98C46E555A3E8B', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:37:52.446', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('42DB09A7D27E4D37A0056F67816489E8', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:37:54.292', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('84521E326FD04A9C9F3A9C6E9B0FE542', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:39:37.742', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CC4AAB2D038549DD86C69E0F5DC33E31', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:39:38.284', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EB79448500144BF9846C4C9107D7945C', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:39:40.887', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('76805AAA078C46B8B6A10F27C2600693', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:39:48.332', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8774F20D94554C0185A0D89BC48BE3A8', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:40:55.819', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2D84589FE22A478386B911D4846FCCD9', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:40:56.315', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('57745F6AF9DC42388D7CBEC39B299867', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:40:58.099', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2567F10707CA4FDA9E9420360F027D76', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:40:59.873', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4B5D996B9A1546C4A0AFCE10683DAB89', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:41:02.179', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1537507D485241B2BFBC96C1914B1918', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:41:03.278', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DB7A33E0A60648AA98E9C3BF7D2B5CEB', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:41:04.918', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AB4BAFE05BA940A0B513EF1D1BD1320B', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:41:05.915', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('337B249639E64034A2A2C93077C0191C', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:41:09.449', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4B10CB185BFE45F0A71939AAC1EF324A', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:41:11.228', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('70C2ED72527A4CDD8D316C1CC2423ECF', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:45:09.154', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('89B5BCB99CE7489C81020FA69F328465', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:45:09.681', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4C6DB824D9E043449720317E8E1FC93F', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:45:11.809', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('48CD93597D0C4A4F963239751C447F3B', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-01 20:45:50.058', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E73BF1A6B012402DAED7EB213CF45A49', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:45:50.496', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('98689A4243DB49E98DD97574A98D4015', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-01 20:45:52.364', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0D80D6F495E541ECA6AA4CC5D44BE388', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 10:43:27.45', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F2CF724817D14A25BA7C01871B015D03', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:43:35.749', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('292703DEA9BD49B9A8166DBA51D14836', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuData', NULL, NULL, '2023-04-02 10:43:43.575', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('91E16C4593444110813C89BCF718EF55', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 10:44:27.673', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EBD6872CF6CC46C9A661D5C205B69323', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:44:29.058', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('55ED39C771D24A6195F7A139D7551EA7', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuData', NULL, NULL, '2023-04-02 10:44:33.186', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E3D874998E2544F59FC98BE75896DFF0', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 10:44:40.496', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('047F5457FC184B9CB2FFF9E7D456C09C', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:44:41.628', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4B1F96202FD84EC8BB41B2FCCA6A459A', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuData', NULL, NULL, '2023-04-02 10:45:38.56', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C7777D37BDA5472588BC969BB3BB39FF', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 10:45:52.999', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('764EAFBDE0D74897A4243250F162499A', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:45:53.993', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('695BFA25000344EF8C2C661374F3A685', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuData', NULL, NULL, '2023-04-02 10:46:05.477', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4DDC6AEEDDCF4A0792D7EF4BC43192F7', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 10:46:39.361', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('233FB91BBFD1448FA526C12F7B0B5F55', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:46:40.231', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BDE3D419D96B4A97937F9E53E1C57967', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuData', NULL, NULL, '2023-04-02 10:46:52.185', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3C75556AB09E4A33BD89875F46C19E68', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 10:47:03.762', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('12C286C9BEB04CFA9245B2B945C7C90C', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:47:04.74', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FFC71554BAF44B8090A7BC16A8E0251A', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuData', NULL, NULL, '2023-04-02 10:47:12.829', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('ECC11103F3E94EEA84657A34153F2C92', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 10:47:25.316', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E16117F4415C4694BD8D79B4EF16241D', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:47:26.312', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F9AD418A7706420BAF09DD912ED2C95F', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 10:50:13.897', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0DEB0080A9044B59ABFB2CE6AAF130BF', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:50:14.45', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2E04870830424275B9E9A8C66DCE2199', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 10:50:54.98', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('27FB2037A87348FA9A7B8DB194E66320', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:50:55.481', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4AF47B3B251345DEBDF639B86D6CD661', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:51:06.966', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2747C82F30E14B73B1A0FC6BF0B2036E', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 10:51:06.966', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3661BB7928454E70954301ED0E79F297', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Role/getPermissionsByRoleID', NULL, NULL, '2023-04-02 10:51:08.87', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CA722721FAF54874A45191C2B2BCFB13', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Role/savePermissions', NULL, NULL, '2023-04-02 10:51:13.677', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EFC6A60FF85C4E20AAA3A1B1DFB321E1', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 10:51:20.65', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C91A9382F9944726B724D8A2DFBAECBB', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:51:21.167', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F2EA33AD6D0F4EC394766EC34A88E70E', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 10:51:21.167', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('533940F2EA494DB488672758F5691C2D', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 10:51:31.552', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('54EC0E0193274DE3B2D060025C44C830', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 10:52:09.253', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('52B313BC95BC44A0BACE4E0657A320F3', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:52:12.894', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4C289CB9624B43EC9D56B356C440B713', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 10:52:24.38', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('916CE28465244A92A1A2FFC004216E0C', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:52:24.938', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1FF94988F8E54A90934BAD4B327C7FA8', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 10:53:06.053', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('48554284411E40029A3D559DC0E06147', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:53:06.694', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('46C40DC570684C3193E591C12B082A99', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 10:53:31.225', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('50B4B5E11C644CBF9F5725CEA6F4DAFA', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 10:53:31.689', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('356CC2138C3C42E7967F2027A4A057A0', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 10:53:36.9', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F7FCF90BBAA54F8296AA628D49B6E4F0', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 10:53:39.943', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('107E1A8BE4C94FD398EC167F722A8AFC', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 10:53:40.398', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2442E0B01DD2434FBDFFBE8765E7F16D', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 10:54:32.659', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('493E95AB920C4E6C8E87231EF2F52B74', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 10:54:33.128', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('244042C42145432F924063E431A75C66', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 10:54:36.031', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('188DA2B419D3451D976861475750999D', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 10:54:38.6', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C7518F222C144CAE8F2AFB79BFE7EF41', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 10:54:53.426', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('539F022559FF4CA7BFFA02213CE39806', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 10:56:20.352', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5DD2E529A0074469B933E2DD0D00F3DC', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 10:56:20.922', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1F6FA6CE64724889B68081D25684FD8A', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 10:56:22.08', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E0BF19A2FAFD4AADB9DB2DAE86222F3A', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 10:56:26.439', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E1CABD34723543988BB5690F404884EA', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 10:56:28.12', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BFE13DD3273E44C29F09252DD0500CCC', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:04:05.181', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B07322E761DE40D9BD5155180189FFC9', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:04:05.753', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('24DA057346E44C7691369BB89CA894E0', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:04:07.31', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AB19D1C1E5184051BB10A721DA767AAF', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 11:04:09.226', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A8B059B25EFC4F60A345C14C61A45614', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:04:24.719', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2E2619784A044261B5217F52DA92766B', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:04:33.186', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4D85D3DE30624CC8858410243D763BF6', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:04:33.67', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('015FFD5FD77142B389C69AEFD483BB81', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:04:35.691', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6C1354FC9F4C4B939EAA0FCE64DEF4D3', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 11:04:36.896', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('81C0A1D706BF4F298C047C44654152B3', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:07:46.6', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FBD8705F75F644388798B50DA80415C1', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:07:47.175', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('571E358B32C74E559CFD9BB7E33610E6', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:07:48.468', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CFB5729FBC9D4645B84EF2A51132940A', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 11:07:50.326', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('84E84A7A451145A78262A40BD57435B2', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:09:04.771', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B1668B5DC4DF49BB8BEF511B0CFAFCCA', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:09:05.317', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B48405BE0A104E498C405058C4ECE27C', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:09:07.323', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FC4427A55FE04DB486B8DB2A3BCD0D49', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 11:09:09.355', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('717A130848F44273999F65882C8056F5', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:16:10.142', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E705C680B12044E5BEC6667EB13AC5A1', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:16:10.686', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DE2ACA3E620643149B213C0016F8746A', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:16:12.231', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8775551B1F8E40AFBBD0DF4BFBD269F3', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 11:16:13.504', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B2ADECD237AC4C08AC895BDFE63ED8F8', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:16:14.302', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E805926C7B8C4BDDB31A51188EBACFD6', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:16:45.416', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('52716D07A2DB4C3B86CEDB2848FB7D8F', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:16:45.908', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E55BAFBFFD364B33BE58F9381D9E20A3', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:16:47.06', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A0E2E9958CC944ED85D63D41F53458C6', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 11:16:48.512', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7514F735AE404AD8B8C9BD9A7FEB9C85', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:16:49.074', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5F069F51805D4F6987B69A1301DE056F', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:17:54.588', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6E959A0872A149378A1CE8AD7F55B329', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:17:55.127', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4A6FD31CCBE441629D8ADD95FB1A7374', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:18:51.356', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D4F7DCAAD01C427DBA619899367DA0D6', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:18:51.848', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A159ED79C2A040128FB3AB3A38FDFBF3', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:20:31.759', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B8F22E26FD3642C9ABA7ABD6C463F606', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:20:32.293', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6C4532DCCAA945D5A46C4948D56A4AC3', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 11:20:34.178', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BBD0157DB48541CEA0CB2FCA42C0C594', NULL, NULL, NULL, NULL, NULL, NULL, '/system/org/orgList', NULL, NULL, '2023-04-02 11:20:42.808', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3BEC06A271F743BAB5D6E914F4C686F2', NULL, NULL, NULL, NULL, NULL, NULL, '/system/org/orgTree', NULL, NULL, '2023-04-02 11:20:42.808', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('08BA9AE688A84116835FD4CA537C1802', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:21:41.526', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0F32CE2C264E40DA98F0B5A1148D056A', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:21:42.014', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('457D160F84BE4C14A9298D03E313292E', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:21:56.185', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D7D07334AD8D419688FB06506257BD9B', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:21:56.671', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('497C40FCC4684EFB8A73B1C6CB7C6F01', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:26:19.828', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FD42B369ACCF41369135A324441FFDDC', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:26:20.367', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6B6C473BD4824927A5033667D1658644', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:26:31.132', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7C7C137D5C44466EA24E0314AB673C4B', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:26:31.618', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3E8FED3181E2401184662C41FC9FB4C6', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:27:28.111', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2FA91825DF1C4E0296BA8DF7B6FFBC42', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:27:28.599', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('017F02E5BAE944ADA60D560877E02FB7', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:30:31.847', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A5E8031CB8DB439CBC579C35754F2412', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:30:32.36', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('84D2BA84C31C470484A6EA16CEE82DB1', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:32:21.795', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9B6406C8B7CC46529113649F57D65746', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:32:22.327', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8992B41B09274B69BD8419E5BAAE740E', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:36:02.797', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('40BB0F3931D14BD99E35C74AE104E71A', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:36:03.335', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FCEA35BFB87A40DE9EC5CB4A07A81EB9', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:41:43.926', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D065BEDA50A74BEDA1BAB6AEBAB1FD5B', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:41:44.478', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F645A875490E454C8987A099B0595D03', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:41:46.246', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('239DEE1DABCA4B0681A4430B62ACDB3F', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:42:41.181', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('70D90F251E3A47ABB1DEDE7FD37D508C', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:42:41.686', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B8B2A1CF18524FF388289DBF7BDDB1B1', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:42:44.236', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9A04D0A24BBC4790837E5B82F8CEED45', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:43:37.55', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2784AD05F0964171A74E59CBCF0BEFAB', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:43:38.054', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3B2414082EC94F388DD5C4095B829260', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:43:39.57', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('567FDC170964418985699233A2639AC9', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:43:56.794', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1EF652162FF3433098EB7D2A124679E3', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 11:44:04.06', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2AF45612CD7C4C5BB5970C8D268820B8', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:44:04.647', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CE07B4094D184ED3B07F73123F296B92', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:44:16.744', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('73DDAD7C99DF49B88CBFEED5592E6714', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:44:17.238', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7717C5337928464DABBD8021536AF574', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:44:19.25', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CE2D73622FA1416E9BA30C15611DFDF4', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:44:46.494', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('29988B3FD06A4C3599046A5FB454D83F', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:44:46.995', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B152E2767B5F412B8180528E5324513E', NULL, NULL, NULL, NULL, NULL, NULL, '/DocServer', NULL, NULL, '2023-04-02 11:44:48.562', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7528EF2DF62C4F20BCEB1F2239867DB5', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:45:17.65', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9EC1693FA54543C9BD6A1DE1CA80AE85', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 11:45:25.149', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('38066337DF134955879327F828F65C10', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:45:25.732', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('59417AD8B8E6454B8391789C67C7AEB5', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:45:27.816', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3F851CF07CD64C3B9C8EEBA0DA8AA9D0', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:45:30.414', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5939A54841874C96B8457472BD915CAC', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 11:45:36.497', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3467BB862980470CA05ADF122F57A615', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:45:37.061', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A44A149A183748599983396808141217', NULL, NULL, NULL, NULL, NULL, NULL, '/DocServer', NULL, NULL, '2023-04-02 11:45:39.232', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D2EC6746AFA84984A1868AE5414E3446', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:46:48.121', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EC298A0680AC4C32949344AE5EFB3C71', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:46:51.997', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D44FD82F6B8440A4B24A74ED6EA4BBA0', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:48:39.372', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AA0305E84A864156A53BBB148754342A', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:48:39.881', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8BFA034860194514BDF45BAFBECDF477', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:48:43.969', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('521D3DFBF6AC4CDAA0487C48F2094662', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:48:49.776', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('581F593E90994EDDB8E43F1E8205E726', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:49:52.387', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A5B73BB5D8C04EA480C7C1E8B0607002', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryDataList', NULL, NULL, '2023-04-02 11:49:52.914', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('806FE09721E64479BF88B619D6EB3ED1', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:49:54.215', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5C212D7C9CA944B4A90F8B6396719C00', NULL, NULL, NULL, NULL, NULL, NULL, '/common/queryData', NULL, NULL, '2023-04-02 11:50:00.623', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A98CC95602AF4577962AA02D5AA7B573', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 11:50:30.893', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B10867618308481B9FD955B6A9AB49D3', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuData', NULL, NULL, '2023-04-02 11:52:59', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('888863CE0647478BA09380A7A0474214', NULL, NULL, NULL, NULL, NULL, NULL, '/common/saveData', NULL, NULL, '2023-04-02 11:53:18.267', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E781C048E6674179A9AB70EFBFB7CDB3', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 11:53:19.924', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A861632A07714CF0B6C8D72BE210CC77', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-02 11:53:24.364', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0A97BF143471465C8CC47E6E802F3F06', NULL, NULL, NULL, NULL, NULL, NULL, '/system/Menu/loadMenuTree', NULL, NULL, '2023-04-02 11:53:24.841', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AE228351F1CB4E608249A5F4B79A89BB', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-10 21:48:14.458', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E405B9921A02451F8D053D798D4ACA3D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/test/svg.js', NULL, NULL, '2023-04-10 21:48:16.837', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2BD85704E1D34E7E80E7472E43EC51E5', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:48:38.207', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1F776DE5061845A7A597556BE331AC12', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:48:38.207', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9987C2BAC78541AE8B5DE99CBDCB044E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:48:38.206', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4DCD9EEA432142A09C9D023A38B2FD42', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:48:38.211', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('80096F327CB0423EA2E22400E5E3D8FE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:48:38.211', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E9F3B5AD4F124BDB848A2DF1518DFE1A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:48:38.365', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8D98124EF5CE4013BB20B62FD11FE546', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:48:38.211', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('32ABF759711A4B47B6E62C9C36A1F7BA', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:48:38.421', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1F932A4FD87946EDB43FBC61CEA5229C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 21:48:38.58', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8090E132F24B4198BD941633945E2CD3', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:48:38.476', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('507A6082E1414A82A1A9A5449ECA4D52', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 21:48:38.686', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('20545D7B392641059991F1AA0F9C1F94', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 21:48:38.789', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A3E53F8BA6A7450498D59BE2B4462066', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 21:48:38.771', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D31B16E631A9424982613123010661CB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 21:48:38.825', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3E88E0ADD7634B2DA3C5C3B280FA027D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 21:48:38.881', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1685D71DC92D41EFA1B1F89D22806272', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:48:38.986', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('34C2EF4436EE4550A81DFDAACC0DA115', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 21:48:38.893', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3251F3D618054AC0A3380C61FB6F3405', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:48:38.934', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C20CC123B45040B082900D393FA71820', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:48:38.996', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('859E611CF4B74B0C9EABD3E1EF7B99E2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:48:39.091', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9AD5FFC88FF14D049597EF51D5593EC6', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:48:39.103', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9B00C18E8B774BB883D470D92361C541', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 21:48:39.177', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6077CBC288564AA7B3D75FC22A7E4BAC', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 21:48:39.194', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('631463BD8A7F465A936E52D036A4575B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 21:48:39.206', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9A35C1B92FCE43ED9E4354DF4CAB5903', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:48:39.345', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8BC77B2EB3C04908AB347D619589046E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:48:39.322', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('071CE13E547349C9943C4B4AA350516A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 21:48:39.419', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EFAC2A07F66347A5820D4FEA3EC62302', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 21:48:39.548', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('467BFD965CEF42A2A9B6D851433F7917', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 21:48:39.778', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A0006E22C8C145E39453A2113A1E0B61', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 21:48:39.889', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('19C9CD10DD6942A9A10AD8A00B57ED53', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:48:39.329', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FB79A3F6DCF045B692E03D53C3A3A4BD', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 21:48:39.419', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F96332525A1A4446AAA79A165CE42276', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 21:48:39.548', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7DFA61F8020042968C5D4CF1AAB27E30', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 21:48:39.595', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CD3562AC4810444CACD696BC5D296A2C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 21:48:39.575', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('861EA5FB99104018B8E96D4C7B48B07A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 21:48:39.735', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6672DFD55215452C8CCED7872DAC0BD3', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 21:48:39.718', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('965928BE7D01446289714ECE8E64DF33', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 21:48:39.784', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C6DCB441D5FD4760B0AED7DC361A345F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 21:48:39.849', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6B521ED9A32C4E6BAE90D3FEE31314F9', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 21:48:39.946', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BC7A0EE4676E4A169C7D98E0908307BB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 21:48:39.962', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A6F58A42B37C431897DDC5F522D64ED3', NULL, NULL, NULL, NULL, NULL, NULL, '/tlv8/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:48:40.246', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('934EE243CF8140F4833C84BE92177974', NULL, NULL, NULL, NULL, NULL, NULL, '/tlv8/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:48:40.469', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0F714B24080749E595B6E5EAEA40C011', NULL, NULL, NULL, NULL, NULL, NULL, '/tlv8/WriteSystemLogAction', NULL, NULL, '2023-04-10 21:48:40.675', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D183062B31454CDDA180C38C98197AB6', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 21:48:39.419', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BC683B48E9284006A423D780D2B8624B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 21:48:39.529', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('27DCE9679EE140E89520C4406B70ADD0', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 21:48:39.645', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B21DAD87009B4561B3F66B45DB54D538', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 21:48:39.758', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('01007688F81245EB9EBC1626BB74E901', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 21:48:39.927', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('52F8BDE98C3A415CB2C03EEC2B959315', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 21:48:39.989', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6C9197F6CEFF41A394440E3B01E14950', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 21:48:40.05', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B829926951DB42A1B40F7CD442B80980', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:48:40.213', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('134435EDF4744B0288D76B9937B9F1CA', NULL, NULL, NULL, NULL, NULL, NULL, '/tlv8/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 21:48:44.019', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0547D7DA25EA4C66B447B15EA3C8193C', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:48:53.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7355FDE5828B4C21ABB6E9DF20AA0449', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:48:53.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('882EF1D5860745BD9D1D37CC759F5C0F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:48:53.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6387F931794D47159FCC1F95CD42D419', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:48:53.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1BFAED15CC034051BB0E04D105A75C70', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:48:53.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('60B8860903BC49C28398400596D97ACE', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:48:53.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2F1F90357B94453EA7FABFF638E42127', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:48:53.654', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6E83F939BCDB407F8053632951557523', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:48:53.71', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('ED96BA5351A8417CA978221403794631', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:48:53.705', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('11C215D6060549729AEB8760DDA4E578', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:48:53.71', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9D5B20930A5E4A15A0247D71B9EB56A8', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:48:53.71', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('377210EE183D4D9ABE411D9600725EDD', NULL, NULL, NULL, NULL, NULL, NULL, '/tlv8/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 21:48:58.371', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2ABA0564F6004FCC91D7DEADDD8A3464', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:51:59.052', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('297147C4B65F43FEB9F5B0C507D29C69', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:51:59.058', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('018C11E3213C4E83B4A1587ED869EA50', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:51:59.055', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('852248B4E626427E8C266C16EDC1F378', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:51:59.059', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1023EE9AA0EF4CDD9FE7FB8FF2724011', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:51:59.058', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E2DE6F6EB0AB43DE8A60B26F2461D534', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:51:59.059', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CA0144CB1DCA440184D08517C2A6FCE1', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:51:59.255', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('67692D41F5D947BFAB24007EB0A0AF59', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:51:59.307', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2AE5ED10A8BB454996CDFAAA8EA59830', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 21:51:59.317', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3A14B7A1F40D4682BB1E885E50D67053', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:51:59.316', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('808D57B2BA464E14A9D2F65F58CBC80D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 21:51:59.317', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C6493F50162A42FF898A4600C256AAEF', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 21:51:59.364', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F45E399CEADB400CAD0F402140A54396', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 21:51:59.459', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('946D05A4B5804D90903E7531FC0F82A7', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 21:51:59.517', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3F6B3709563C4203A2A9FEBF5B0529E8', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:51:59.521', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('192E8A5D7BA9462E99B6FBEAA805EE20', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 21:51:59.52', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5D536CEC333C4D1589A6403C2E65A727', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 21:51:59.521', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0E0CAE1310224CF59E2351DFF070AA33', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:51:59.569', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3E4E3C00131D47078F9FAFF23900BF38', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:51:59.721', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('67143FC2BD5A44C08048C1205D629158', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:51:59.948', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2FE8CA1E32614B86AE5308D3239428FB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 21:52:00.15', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('081F083685DC4440896F23D431F7CAFF', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 21:52:00.358', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FA49115E3DB6432FAA80A86ACEFB96D1', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 21:52:00.549', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1D37DA75FC434012B53E43CD0F716A4A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:52:05.606', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('58612CC221824B66A8E0D3E6396D372D', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/jTree/tree.main.js', NULL, NULL, '2023-04-10 21:52:05.809', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('249A8CEA67204A078EA7233B7D08678C', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:52:06.058', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('ECCA9EC6F7CA48B192C335FBB8A6DAC9', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:52:06.22', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7A0F4B71952E42049101EE1CA4BCA10A', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:52:07.255', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('11FC13267F804F78AB9F7C58FE32E404', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:52:09.366', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BBA70362146C4A34A40A6F522F3942E8', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 21:52:09.614', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6D46831DE95E488987740DDC5F896EF9', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 21:52:09.779', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B753798420AE4B89BC0E0B18D6A3FE04', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 21:52:10.034', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C362F32C0DA7472E9D3D735D52538C07', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:52:10.232', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DB56576F133A4A81BECD0226B5B6B5A5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 21:52:10.533', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8CFF6D8D04CC4363918E2E2B652E6935', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 21:52:10.641', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6A87D62982D241DA9A27DD6179C1E5CF', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 21:52:10.85', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('37580B0742C349E39185792C4BDEBD4D', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:52:15.96', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D48D92B5E0074D4A8D6EB683DC9A1527', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.exedit-3.1.js', NULL, NULL, '2023-04-10 21:52:16.12', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D316FD662B294165973AA1EEB0C3E347', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 21:52:16.41', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4CBE5CEF0BF6424E95C48DDCF44D5C78', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:52:16.54', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DE156C0ECAAC48BAAED805D7D64C2830', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:51:59.673', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B11D479DDA21422EB64E90408EE2EE39', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 21:51:59.778', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('82702960871D4A619CDEBF0897DE5027', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 21:51:59.936', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8AA387C8C6DE4E0793E4CF1770B13105', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 21:52:00.187', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4AAB137115E94DF1A6EE93C405DC1091', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 21:52:00.342', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B8B9E593501A4A6EAA04F445A484F563', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 21:52:00.559', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CE19DAF79CD447DAAA8662B0AE6927FD', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:52:05.605', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('312C8E1C61F34235BE7F0158121389DC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:52:05.852', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4473E87D24524A04B1E9DE7A549F17DF', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:52:06.002', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FC90E0251E0A46AC89C07667D3E48A84', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:52:06.261', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('03CE4A0EC8ED40CB9A8A465BED690B67', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/search.gif', NULL, NULL, '2023-04-10 21:52:07.247', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D83165BA6AAC4BD38AB7A38CAD94FA77', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:52:09.366', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EB990769BE5A47139B3250D3C5D91EAB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 21:52:09.614', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('66A1320EAECB4187B77AA95BE7DA69DB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 21:52:09.818', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B56AD4F2C8824FB08DFF31622CDB81AD', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 21:52:10.026', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5CB05289995548AD9E36DCD26F44E560', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:52:10.241', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3726CEA5978242DF97AF44729AB071B2', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 21:52:10.439', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0B3F6D01F900420E906D5700710D9345', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 21:52:10.643', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('31BDF03AD3FD40A8ABD25001E425E3F0', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 21:52:10.885', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('12F4ABCD1E124209B91A5EB68E2E05A1', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 21:52:15.92', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D7F05CCE5C7044BAA960C81E001F6AC0', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/grid.main.js', NULL, NULL, '2023-04-10 21:52:16.169', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('00CD2EC76B9D45F8B95AD97D896974EE', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:52:16.375', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7B586595B925437D9C7A264767B59C5B', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:52:16.582', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6740A77A138E4EA497E77C0ECDA22676', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:51:59.722', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CC7B0E1F31544A5A9A53B3598DA0369B', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 21:51:59.986', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('52B6290ADD064D8D9404B8CDE5021A2B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 21:52:00.137', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8F233392215940769568AF57E9B27E50', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 21:52:00.402', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('268BA503DEC440A08F78E1DC61851D82', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 21:52:00.511', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('96F4CDB758BE4C23B23103B8BBB4A944', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.core-3.1.js', NULL, NULL, '2023-04-10 21:52:05.615', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('46067070CE6E45EE822D3B43B02AD6C7', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.exedit-3.1.js', NULL, NULL, '2023-04-10 21:52:05.804', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('87448FE788944A6E92B774739C6FC1F1', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:52:09.414', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A5671EACA4E44B909C921BD98E7BDFB0', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:52:09.573', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C3C4CD9F7787479E96DE4BC91B0924D8', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:52:09.827', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3CEE0DC91596455084761BBA89C40992', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:52:10.02', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('ADA09C0AC3A5407F83423F7A28F05509', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 21:52:10.241', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('57FECAB1211F44DA827D2233F41EF2F4', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 21:52:10.48', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('22AD18A784CA4D069AEB22D8B9FA4025', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 21:52:10.639', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('878053FA2B364ACABB4D2AB85FF809F2', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 21:52:10.894', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('620BDEB58E3B412B86D2C70A3620991E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:52:15.92', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DD07A0D56BD74040853A175A6175A08F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:52:16.21', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2E93F838E7294FBA9D2F8CF8657A6530', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/process-select.js', NULL, NULL, '2023-04-10 21:52:16.362', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('50B369DE77E44D329BBDA0F1D424A673', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:52:16.582', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D9FBD3E3132340029EAE3779009CF15D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 21:51:59.728', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('09EC966E54D641DF9D5E1A676968495C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:51:59.948', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('81996E3164834E4F854CB385DC8CD90E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 21:52:00.154', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0CEF05EC8D6A4D68A307AA830C1FC712', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 21:52:00.354', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F944EAC3EC904E11B644724CD517956D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 21:52:00.554', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('40AB1B8CA8EE491395F83DC0506660A0', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 21:52:05.605', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3E15DFF0DF24469DABB1AA0E36A82C52', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/grid.main.js', NULL, NULL, '2023-04-10 21:52:05.816', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AE8276E413A9478281949ABEBB97ACE9', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:52:06.05', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F2865A741EA2412CB036D07CCE462195', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:52:06.251', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D350CFF5C1014E7299758253DFFB7993', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:52:09.366', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('60DAED4D57364274AF4BBFBA47849ECF', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 21:52:09.622', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('76BFF03CA4214C84A26B749AF438ECBB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 21:52:09.774', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BC241673B7C944D8974E1170A1D36CFD', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 21:52:10.034', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1EC8398D6CF949C88F943C1ABCABC545', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:52:10.234', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7C36B806492445A6885CE0D6DD63E1F1', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 21:52:10.439', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3A482030D3B643528087A1C12614A5D2', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 21:52:10.684', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('428370D44B1742EA8D4AE079EC93DC0D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 21:52:10.846', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('256B7128153E44E5A39FB6BB1BF61F0E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:52:15.92', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7B9F27B0659745E2B156B2DE9CE18D9D', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/jTree/tree.main.js', NULL, NULL, '2023-04-10 21:52:16.162', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AB7877E398D543D2810393858DEDE653', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:52:16.409', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3410A12230F04CD9B69962651274F033', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:52:16.561', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CCB476236D4844F1BCA4C29B21786709', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 21:51:59.728', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('59B5D0A69E394A95B59DFE0A4F845D89', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:51:59.946', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3AA124BAAAA547C4A1C353203062ACF2', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 21:52:00.154', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F7C2114136BD4E86AB94F004E46921BC', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 21:52:00.342', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A74335A2D8F647EBB4DE32EE316FD1BF', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 21:52:00.593', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4EBF2004682A4B80A8A2729C17B211D2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:52:05.605', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BD913EB97F25471786C8C6E081B745D8', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:52:05.809', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F3F54B2E843E4AEDAE25E8A97C5BC825', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 21:52:06.061', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CA050D62CF794E449BCB93544E9922CC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:52:06.213', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D8F2C808850644AD8C00C8D6AEF851CB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:52:09.366', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('76BD286D75BC4E3994F429BC061FD0DE', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:52:09.566', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DF2E24D482294278882C7353A038DE99', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 21:52:09.825', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5C0358319F234126A02B8D4BF7F11868', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:52:09.979', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('591B9F8D8FAD480EB06F72ED9399EE97', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 21:52:10.241', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9DA7F565AE6446949AC4D05A102D26E2', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 21:52:10.435', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5298289D1CB745ABBFE6F265342827BE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.core-3.1.js', NULL, NULL, '2023-04-10 21:52:15.96', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0F123D00DBD2406D9F4C716CE80BC6C7', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:52:16.12', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4C05AC834DF04BC786C36BD6ACB4DDEF', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/search.gif', NULL, NULL, '2023-04-10 21:52:16.621', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D6F58D41277449C498065F1D3E323E46', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:52:17.589', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A7CACA4161F441179C8AA0AA4AABF952', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/WdatePicker.js', NULL, NULL, '2023-04-10 21:52:24.452', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9400E547CAEF47D5904960AA8CDA1CE1', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 21:51:59.986', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7DB007866123401487B7567527C7CD41', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 21:52:00.186', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F5AF41B8107348B4BFDBFD57F3B45A70', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 21:52:00.358', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F6CBCC937F11436EA699DC033AE0E56A', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 21:52:00.604', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2745DB9C23864EE8BF98F7AAA31FCE48', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:52:00.812', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('93C844894262406E8B9A64D03368AB87', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 21:52:05.404', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B35F5422F00B41E7B8853C3FB9779F67', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:52:05.605', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4F09E94AB4F646688288CC8FD3D1F508', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:52:05.851', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E1E1FD5CC58C454CAC74E6D563508BDC', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/process-select.js', NULL, NULL, '2023-04-10 21:52:06.013', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0E7718BBDD7240D6B320C0FFB358163C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:52:06.251', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('289B8259996841739FC62DB26785C0CD', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:52:09.414', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('67B92C0671FA4BFEBAFE58DBD4BA6ED5', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:52:09.573', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C260822D46824DBAA810043B4FEC42E7', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:52:09.822', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('231B20B410404FA89160CFBC4727FBBD', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:52:10.023', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6D79A754752C4AF2A889D224E44CF8A6', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 21:52:10.241', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3C465336F0264F91BDF1A570DDBE99E9', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 21:52:10.443', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('25D3465250964953964183F1F405D91F', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 21:52:10.643', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BC326AEB7A4246FB89183067B92818F0', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 21:52:10.741', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A1841F6C598945298F0BC17BEC2DCBB5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 21:52:10.846', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('20E135E67F014F1F97F8F3F0AC497D9A', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 21:52:10.945', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CB3980C9553147E98F9386EE2B787A9D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:52:11.15', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('624B0A94CB6F4C8C98E4E9332D30F8AB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 21:52:15.717', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C4463E3397884ECB898515D264271507', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:52:15.92', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8833334A7AC24617B40888386D5E30BB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:52:16.174', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2CFE7E3433F3442CA976AFB61C90C1A3', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:52:16.326', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FB5F7DA9E56D4A95AF170769CA16D33B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:52:16.621', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('96FDBE67DECF48E2AE54CC136E717B94', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/fonts/glyphicons-halflings-regular.woff2', NULL, NULL, '2023-04-10 21:52:24.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E662D157B2284CD0BFD2C4B4384C2992', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/skin/WdatePicker.css', NULL, NULL, '2023-04-10 21:52:24.664', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5480A62041B343D6A017C569C62AB409', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/getUserMenusArray', NULL, NULL, '2023-04-10 21:53:01.544', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EF23D07F0C894AAAB77DC3AE6E0DF258', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:53:15.358', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7D3EA7C94B6440CFA18EEB403E1E0BA8', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:53:15.363', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6CD0DEA2529F42458E9D60EF2735E9FC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:53:15.359', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('69660DB6FF8E4710BCCC91547482C694', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:53:15.361', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('26991189F4B34722BBBB38601FC45296', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:53:15.363', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C94465F7CFBD4F5698F7158FD043B772', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:53:15.363', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B01E8E4059B7461993510D42DF04C525', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:53:15.557', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0AA945B83AD041ECAF80FDE0DFB978A7', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:53:15.565', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A8E6E80833314363BE1800B5B49B0790', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 21:53:15.573', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('97805262790543D99A5A84606CE08A35', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 21:53:15.573', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AEB934CF0D384894B241DDB105D6FE4D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 21:53:15.78', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A143293EC7A04F93989530DB4AB95017', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:53:15.98', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('371CB0BD65744BEBA13C29EFE1E32867', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 21:53:16.221', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DE0A8AA027BB4447AFB8EC7637A6036B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 21:53:16.406', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EB05CFDFDD654553B5214EA779A11E02', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 21:53:16.634', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B106C175EA544D79920377CCC0A159CB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 21:53:16.813', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('55836453E0084DB1BFEDA94D4B6E04E2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:53:24.708', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2AEBFDB774EA4BCDBBC74B4BFC3702EF', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:53:24.916', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('729BD2DC378C4E288BBC6203112A54B0', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:55:18.678', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9A3B1168D4E14CD580BA1000C90FB26E', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:55:18.931', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('99F7D6C194BF4787980E3C1A431EBB7A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 21:55:19.139', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FD7AE3BB58F146F8ACA379B21D7E80EE', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 21:55:19.389', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('38DDC9C8DB324FF0912D85BF9F667A6D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:55:19.557', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('608D5EC896814297AD9A07BFBCE75422', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 21:55:19.804', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A96353ED5A0442AB9CA5E88D5E0AF69A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 21:55:19.96', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5F9811D49FCE400DAE8D1365D24FEEF2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 21:55:20.25', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('03E083DB035E4E4DBC0F7AF339D525DD', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:55:20.452', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('25F27F11A7E4495985F8ED5D0AFF28B0', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 21:55:28.665', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('967FC25626614A36B876F8675CC26DE0', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:55:28.867', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E4A624CE0B29446C893D4D6A612C9ED8', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/grid.main.js', NULL, NULL, '2023-04-10 21:55:29.073', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3958403CB1664538A11F1ECED6F0C3B2', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 21:55:29.305', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CE5450C4B6EF479F8C097F3B9C203996', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:55:29.496', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('77CBC1899A8C4BE19CD120A785C4A646', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:55:37.897', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A9EAF470C67A4060BE379AAA8E99F07B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:55:38.143', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A9AE8EF6930D4EB0A4251AEADD759DBB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:55:38.31', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7228E9D7D2F84E7CBD437983B6517AA8', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:55:38.548', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('02D48C0CF4BE45B6A0B24A03EE291A70', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:55:41.726', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9C91B1D864B84B96B7E0C6EB0E387287', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 21:55:41.938', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6FB1117F5D2740A7B2F92C330389FDDA', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 21:55:42.138', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2E0B4F7D3EA04558851F7DCA57468706', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 21:55:42.345', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5BCA0DD4964F4C93B14B2D03F637645B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:55:42.567', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BC0864BB9DBB4909BAE75409C8EC41FE', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 21:55:42.832', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('523EB30CEC654F4EBC90944A15937B39', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 21:55:42.972', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1CD8E832F9F846408EB62B08DD8D7296', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 21:55:43.232', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('68103009B8054C278CCBCDFEDDA2D860', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 21:53:15.573', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('633F80B627D347DABB3A233D91E32FCA', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 21:53:15.773', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F7A30AFBC3BD454CB2214282AA13C7C4', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 21:53:15.984', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A06D1BA3542142C5BDB6B4A9F25A9CAF', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:53:16.202', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CF0D75DACF3B4956A5080198FD8EBDCC', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 21:53:16.423', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('09967B1193EC4179B7200C343064800F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 21:53:16.624', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('889A3EC8673F4091BD3378110512307C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 21:53:16.842', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('682D7563F76B4ADD943BE0617CDB266A', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:53:17.055', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6A937B7D70924372AC339A0556C2A210', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:53:24.703', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D6876A2661BA48F8A826F662836C1D84', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:53:24.912', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3E776F29D00E4E5D8D8EF418F2C5D267', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:55:18.68', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('597322ACAF344BDCA5C84810D9D00CAB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 21:55:18.931', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('72CEB756C4764C47943CB11DE566222B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 21:55:19.139', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C0C4247ED38B4B8C961086A9F893BFF9', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 21:55:19.345', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9DB351B5EC5146848675B57C774D6131', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 21:55:19.596', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C3BC37D5FFCC4E25A988D903121C38B5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 21:55:19.763', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F661C6FC7FFE4C9A8E3FCC2AF6B852E6', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 21:55:20.007', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F21D2522A562481C9F0CB7FE54FCD759', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 21:55:20.168', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DECA8D05FD1C4F54BA53EE839026A7BC', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:55:28.868', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A98BC55AE7F9443DAE3C3BD49EAD2464', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:55:29.07', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C862492C810A4287AA91E0F0EFEC5D58', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:55:37.897', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8508DF3850BD4516BBB9965954C5EF1F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:55:38.101', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AA32F29A58D740CBAE0D6354D8412821', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:55:38.346', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0304844565384954886632746BFA12CD', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:55:38.516', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('49A6D5ECB40E4E96A22DA609E3FA119F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:55:41.726', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D07497F689844D7E8D84FACC42D0040D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:55:41.925', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('64FF06F144724931941AC784762A2624', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:55:42.169', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0DD247C103AE43789328814D75D52B26', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:55:42.338', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7D35E380D40C48DBB3AC20FCA71EA5C9', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 21:55:42.633', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1B4D244E43D1415C96FDA99DE185043A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 21:55:42.763', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0726C4FE7F9644DA85711B1F56D5C274', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 21:55:43.042', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('60EAF843BF574F439C8150603A2FB5A3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 21:55:43.172', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F4E7D47F06C84A2AA3CDCEF85529F95C', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:53:15.573', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4F4DA7D3427747FFA4E63E1263EBF6FF', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 21:53:15.768', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('386E8873BFB942A388FC7EF2D33AE3F5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 21:53:16.015', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1F6FF1B9809E4894834ABA0B288A4F94', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:53:16.196', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('08FF178301A0409B997CDE84E8FE1AB0', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 21:53:16.427', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9140369512F647459B72AD9DC3EFAB4E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 21:53:16.602', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C482E6385E43481EA29154452CAA68C5', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 21:53:16.846', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6C9D847D923249C186FE1D17C6779907', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:53:24.706', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('288605A38FBF4722AAF8FEFAC80D40A9', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:53:24.912', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('602617C3C11E40EEB1E31B2FEE1A1556', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:55:18.682', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2190CAA415424EC682BDABCAF1D46F21', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 21:55:18.937', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('22EFF4BD41AD47648CBA1E4C8DA74BA5', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:55:19.17', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A496E7EAFAAE4CDAB7C478FAEA0F08FB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:55:19.344', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9E9E729BECD5499A98772D061BA55EFB', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 21:55:19.596', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A5ADD0E73CE8400BAFE14BF547FB00E0', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 21:55:19.763', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F08DB3271D844EBF90D79B92C48551A3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 21:55:20.008', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6944472093754839BC1D63AD78D87A8F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 21:55:20.207', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D23072D2A4EA45118DF9A97A7D58DB0C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:55:28.868', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3C207ECD85514E4D91A50DB922977A81', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:55:29.103', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FF0BB27CCA4243A89AAF09C27D0A75C7', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/process-select.js', NULL, NULL, '2023-04-10 21:55:29.284', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9B89B79E77844CC58E3559EDBCEF4168', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:55:29.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FE17D325ABA14D6CBE8DF596F8EDAAFD', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:55:37.897', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6B61550F2F254E788F61A215B3953E17', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:55:38.104', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('33606734407C436885C38115CDFC0122', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:55:38.353', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('76A272D60FBD44C08B89CDD96ECAD897', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:55:38.514', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('11F7AA09EABC4DC2A5CC84F898CF1133', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:55:41.726', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('98B09A8D2972485E9801726406B78C4A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 21:55:41.972', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D34DBD962652478AB6E769A95B5163C8', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 21:55:42.135', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('47ACAD0F842C40A5BE2764AF527D2D74', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 21:55:42.372', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8B040210F0A74D48889E584F23102784', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:55:42.563', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('029198DE7E5F449784CC66295EEA4E5F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 21:55:42.834', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('54D793223626476D82A18F20323A88B6', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 21:55:42.972', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('008D014572BE45BE8F1B185379C4441B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 21:55:43.241', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('23E046B59E194DA7A9B82D59D6BE619C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 21:53:15.775', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A393A1F6C60D43A9AB8805260634105B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 21:53:15.996', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2BAB2B6C344C4531B0EA31714B091DAD', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:53:16.2', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7ECFC230EF50454A858CF8805266CFB1', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 21:53:16.427', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('610721D0CC4E4346A8C7CB5A21BBCDD7', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 21:53:16.613', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3317F9B8DA3A4C48989B6BC6E005EA61', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 21:53:16.844', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4983D66D86C54ABD83D06700AB53F4EB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:53:24.706', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8EFD9980F8574EDF889FEFD3E126E87B', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:55:18.682', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D43D0685B9B944408809E811FD76DB58', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 21:55:18.971', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0F813A33EA9B45EFBDBE536A9E345B77', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 21:55:19.139', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0A73E234952B4654B44750E2F0988B31', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 21:55:19.392', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('00E6793324904D43A3CD1860775FABA3', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:55:19.56', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B6DAC354E1BF44EBB65494A6D579FCB8', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 21:55:19.801', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F5834E5B96E7439D81371ECCAAD7441E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 21:55:19.969', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E05A06AC6E4D44109AF3039243257234', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 21:55:20.217', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('618121B1A25E48B3A1AA239ECF8299D5', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:55:28.868', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F6294F5DC2954CB4B895E2672454C9E4', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:55:29.109', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('75220F73886A4D41AFA1E56AA3ECA8B1', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:55:29.284', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A97BBB1A5D814E3A83FE8BDE5A0C6A41', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:55:29.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('62DF40C2505F4123B47E0BA6E9D8B01E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:55:37.897', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9C5F217DF2BF422D88178C6867E597BF', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:55:38.104', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('69E0CA65119C44D7AC579F13E1E73A4E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:55:38.358', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C015C26B52B246EBBE6BA454DB620BF7', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:55:38.514', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1AF43A21D4604C0CB62680A883213C7B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:55:41.726', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4E32F6FCD3B44731BB0EDA42BABB123C', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:55:41.925', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('59E85D4C6A4C4D68B4D7E8F1093343C0', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:55:42.217', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7B0B9A6DA27343ADAF837173A88D879D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:55:42.338', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C5C9985F5C8144028F806702EBF002C6', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 21:55:42.633', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2AF173CBF53843DE9564B0784ECC757B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 21:55:42.769', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9D73562743A04D27A8DDFB0124871415', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 21:55:43.034', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('821B4BE507D94D439A6DB49B01BBF375', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 21:55:43.172', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AA947CF151494F50B93988736172D567', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:53:15.787', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('651B4F74AEDF4F3E95D0A890FEB4CDA4', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:53:15.98', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D89C7F91A12840CDB48ED48310490D13', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 21:53:16.221', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('31D013E6B72148A9844E718E0C8A59C4', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 21:53:16.404', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C12B3B2206CA47F38253EC3D5950290F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 21:53:16.634', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D18CD943CAE44CCF872C490153F3FF75', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 21:53:16.828', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('28E632192A9B4D668DC0D116E4E12B8D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:53:24.708', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('68627A22D5B044C8AC839CD9BD0F68A8', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:53:24.909', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('04E67269F4004BCE95F6B4EFA8DC8F1B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:55:18.682', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('81EA1E55A4A1484183668823533AB0F3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:55:18.93', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2C0D4E08B4A7453483C64AA6CD452570', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:55:19.177', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('796FD602141B42A9AF597429D03A8B84', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:55:19.336', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('791820009FE1495F81EA0FB032C2FCFC', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 21:55:19.596', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('06669C68131F4E5EBB749077B6A882F6', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 21:55:19.756', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AEFFD54DB5E246959C8F1BF8636E5615', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 21:55:20.016', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D81B19F450A04A0DA11C4759C25631BF', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 21:55:20.16', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7E25C87F314049CFBCC334A109EBA0B2', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.core-3.1.js', NULL, NULL, '2023-04-10 21:55:28.903', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A78E539F26DB48F3B3A56F4C5564A76F', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.exedit-3.1.js', NULL, NULL, '2023-04-10 21:55:29.07', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5756EEC14DFF4FC48B03EC7CBBF059ED', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:55:29.289', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B3ECA6B1826D44B2AA992332B13476F9', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:55:29.5', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('62A6218D0B614DD48EB45C11FD85E2B7', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/search.gif', NULL, NULL, '2023-04-10 21:55:30.524', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9349D94FF4D64516AD12F5A8B51CDD70', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/fonts/glyphicons-halflings-regular.woff2', NULL, NULL, '2023-04-10 21:55:37.397', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0A773BD36E0349ECA4E5B9E0724AD277', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/skin/WdatePicker.css', NULL, NULL, '2023-04-10 21:55:37.587', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4CFCBBAE825A4897A73F039D3992E5CE', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:55:37.897', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('920C97B86F8546B7AA4D33F37CA55397', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 21:55:38.151', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CF6884DA3E7447A39CF80C87F57AB9F9', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 21:55:38.306', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('324D7D58581145D7B10043769C03206C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:55:38.55', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1E0BCEAAE7B041E68DAE92761CF6200C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:55:41.723', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E8C12E777A7F4D47A2ED2330C99D667F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 21:55:41.987', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C21797ADF36E427DBFA9ADEB20FB1398', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 21:55:42.132', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A9B92A7D6C6D44C99D7AAC691028E8F8', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 21:55:42.425', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3B4C8ABA7B684A1B96A8D7C315DD1112', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:55:42.559', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('587B616A79E04FC2874F38C0F62A659C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 21:55:42.839', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('11539919BA2F45A285B20C2C2DD6A7E5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 21:55:42.969', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B0F0A19BFC7942AA90B0B1DD3CB62B8C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 21:55:43.246', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C1477DF9A37D4171B96C49CF2551A083', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:55:43.458', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A641C37493FF49848777BB7B10C8BA26', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:53:15.807', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2DDD4A8EC45840E3AF2647598A97B8FE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:53:15.969', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A24CAD919F484001A8D1B8EF7CBEC97E', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 21:53:16.221', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FB26125F620540E8BD5245AA320035C4', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 21:53:16.394', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5AF52A13FFEA4DC4AFE75F12FD37A524', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 21:53:16.636', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('273517B648564C8FAA48E10FB3945533', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 21:53:16.803', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A1D28350E03142A48EAE70E1FEFC2D5E', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:53:24.708', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C0D607C3658A4A2A8A73CC1534BE280A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:53:24.91', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5F30813FEF4245A9A7B16A01DAE4549F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:55:18.68', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A6424FCF6EDF443D9B4662156D69517A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:55:18.93', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('483D96F4778C4454A1C0FDE325D593DF', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 21:55:19.139', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F5DE5BA450BF49BA818FDE2E56B1308F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:55:19.345', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('61708F846E4A42D5B4B0AED76829C668', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:55:19.56', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D58CB94A5CFA4E89BD9155E56955148E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 21:55:19.798', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2D0961E04D304D458BCBF00FF376D453', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 21:55:20.001', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6D458A4D9B794C6B8C8726BC35999F47', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 21:55:20.207', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2D2F3C01D34844B496BF6178C042CD49', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 21:55:28.868', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A7BD36DEA1E844E8A1DE85DE2EEB0789', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/jTree/tree.main.js', NULL, NULL, '2023-04-10 21:55:29.071', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A04E21B9367F43C6A3890EDFFFDF4AB0', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:55:29.289', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('314E55F411194A6EB6E194AB185C0F4A', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:55:29.497', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EE0EDFBDE72E491F96AEC30D4D3120B6', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:55:30.528', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('351C051A8C6C4A32A1D6FB7CE8826930', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/WdatePicker.js', NULL, NULL, '2023-04-10 21:55:37.381', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BCEEC56FD258442FAADC036895ABF8EB', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:55:37.897', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C9958FC0D2C74D32917284B5F4871973', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:55:38.143', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B7FAF69D7BB0409DB183E4CDBCE65D65', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/skin/WdatePicker.css', NULL, NULL, '2023-04-10 21:55:38.306', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EA63815C6FF846F39E7BFD64711E8E01', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:55:41.767', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A1735633E6184C30B132AAB5F89BCF93', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:55:41.925', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EDE27622A5C04FF4BC275F3A16B0A604', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 21:55:42.138', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7485431B79314E77817087EC2B5C1B75', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:55:42.34', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('15B9B11B6AFB4724A1F492E7943B5568', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 21:55:42.633', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('63739C73B98D421A9D3A305D10A7C47B', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 21:55:42.763', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F723485BA45742A4B7A0A9F4163757FC', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 21:55:43.038', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('49AE5990A3C344C5B34F893C47194505', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 21:55:43.174', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('030E7569A17E46CEAAC40386B190593F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 21:55:48.028', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('65105B128A7741ECA453D28AF8E1B396', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:55:48.237', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8961AED513984AD5AB6E42608A780EFD', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:55:48.237', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C1F016707A1049309AE42EAF27186D20', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:55:48.239', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('27ED3A92C7A74468A33897CFA9286139', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.core-3.1.js', NULL, NULL, '2023-04-10 21:55:48.239', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2E63AD8070AC44EB817BF7D4916D5D04', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 21:55:48.239', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A49A050519D84D06990875C23B0D8E7F', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:55:48.239', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8C04AC826A35474FB25D20FCD8CD72C5', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.exedit-3.1.js', NULL, NULL, '2023-04-10 21:55:48.446', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('ACC0E75CE3A345EAB58BFF3A7D8FF0A2', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/jTree/tree.main.js', NULL, NULL, '2023-04-10 21:55:48.45', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C09CF0907B4C4DF3B2C344C67E2C096C', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:55:48.665', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C6CDE47A264542B0A5C1BA85C2ABFBB1', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:55:48.867', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9FC1F5338E24440BBD922E23EE114CB5', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/search.gif', NULL, NULL, '2023-04-10 21:55:48.887', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D18A23DE81964E4FB486EBE35AA971E0', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:55:49.924', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DCDBEB733E00493ABCEA9B696379C01D', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/WdatePicker.js', NULL, NULL, '2023-04-10 21:55:56.769', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8392585AFD384669AED1AC9AF74DFD45', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:57:27.296', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1F4FC0F42E6F4873BCEE5B5DCB538C09', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:57:27.298', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('36E57934E5044F3499214B71980FEEF3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:57:27.552', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7CB76B054E9843A1B656098ED8EFADFB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 21:57:27.597', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0A89105E6C984308B37A2E8F41710543', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 21:57:27.755', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1A765705F4DD40C6B219FE150F8B4E1A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 21:57:27.762', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E741C1DB4EF94364A9C1D996482B3083', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:57:27.967', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EECD748530ED44D880E1B6AD6A125861', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 21:57:27.998', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3D494E3BC65E4D65954517114F6E7C33', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:57:28.183', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('93299992A5144C6BA34A13007DB4B8EC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:57:28.206', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6BDA64EB76074638A88461A8A245E419', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 21:57:28.385', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('42EB38B5A42946EE9F3FA621B96CBEA0', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 21:57:28.412', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AFB45CCAA8BE4C5784C02E8865DAE3DF', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 21:57:28.586', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CC4CCD5307864C73BA591D416DB3F6EE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 21:57:28.592', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A260D712C21C465885B52DA3AD8A49A2', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 21:57:28.796', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3DC2E97D544F4E3E9BA36D4B9929DADA', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 21:57:28.811', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CD1FA72C9BEC48ED90E92845EC7B1E25', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 21:57:28.992', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2CB4ED05916F45CDA5DC38AC7E4309CE', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 21:57:29', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9944E34EF7C44E5CA82DEFF51EA84447', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 21:57:29.211', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9AE27F4F379C495C978B9C60A294D1FB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 21:57:29.206', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('89F267BF5A8C47A698080D147E5FD361', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 21:57:29.393', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5D166D78993E4F11AF57670F06A417AC', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 21:57:29.411', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('920228832C8740D8BADF42A3F7F265F3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 21:57:29.609', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('30F50D33B6E0486CB2E76E5642C7B40F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 21:57:29.615', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('144373E239F240FB9B7C35DFBD5F27B1', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:57:29.827', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F80877F71F7D4C5C977718DDEE43CB8C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:57:29.825', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1CA1E38D9CF8479A80415D0E23DB9A83', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:57:30.032', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8B90499D1FAC4E949A9BD23F5E006F96', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/WriteSystemLogAction', NULL, NULL, '2023-04-10 21:57:30.238', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('406A42E2A569466397881368A7567CD6', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:57:30.949', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F3BA64A2AB8B4661846327A112588505', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:55:48.45', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('76272D77540A4F0481A366A56DD194BC', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 21:55:48.686', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CFE423D8876047B8A3FE38F0BE9A5BA2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:55:48.862', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('92A3CFC2A82F437691D8D757A513167A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:57:27.3', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('481B68344C1C44F98F6D3B2A6C5A246F', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:57:27.552', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E443B790E30A4028A9820F271FB245E4', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:57:27.795', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5EBA020C299544B9BEB15B30E148253D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:57:27.954', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CFF9C3D854A341428549C39C492FE6BC', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:57:30.949', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('563EB01E8CA144B191F8314E806A60DA', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:57:31.151', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9100D50D91FD48F9B1F43EF6A0ACE998', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 21:57:31.36', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C5A8DAC441204B8B80086EB466013890', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:57:31.562', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3A8CA50D39304061BDA9B7DA7E671BFD', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:57:31.785', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E40BE3CD123E45A786B0562D59B66E99', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 21:57:31.981', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9E4B3A3343354CE4B8BC37454F6AA577', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 21:57:32.195', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('92D89C62A41B445692301368E9739CD2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 21:57:32.384', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0EA60F85B3304E0884B2AC362A292CB9', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:57:35.341', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2FA9D94B6B6A46E28E7FBB4792E2C8FD', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:57:35.54', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A0FC1075124346E6816F8BF8A712E4FB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:57:35.75', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('22044E2C446641FEB1228BE966AF7BAC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:57:35.945', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B6C3D468964943589D27FE796375D31B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 21:57:36.202', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('06E76ABCF7A54EC7A029CA74ACA97FF2', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 21:57:36.36', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('471DCE6DCFB04CD1A00F8A761E2A5099', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 21:57:36.609', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('803C3262888C4D0DBAAF4D12540AE493', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 21:57:36.759', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FEAECBAF37CB4FEAA7169B7FAB5116AD', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.core-3.1.js', NULL, NULL, '2023-04-10 21:57:38.846', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('493687929F27489B83C66342F0FD759D', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:57:39.045', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('27CCB67C0F0C4914AD85A8AC563A2900', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 21:57:39.268', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4D0A18EA761048B5BAA4F8662899F042', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:57:39.472', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('73B48288FAB242129F206CC56CBFC750', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/search.gif', NULL, NULL, '2023-04-10 21:57:39.5', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('564C8160A60F448C9D815C5685838D48', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/img/loading.gif', NULL, NULL, '2023-04-10 21:57:39.706', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7E7BF843A5FB476BA2E16FF92F969E92', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/WdatePicker.js', NULL, NULL, '2023-04-10 21:57:40.382', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1BAAE1E1E8C548BA9D76E495E30D9082', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/grid.main.js', NULL, NULL, '2023-04-10 21:55:48.45', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C83BFC1968A5420BA8CB455021528C2B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:55:48.663', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('097AD99992E544A89580AC1E25049FBD', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:55:48.869', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B810665552694E639FA2AEDB284E5873', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:57:27.3', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('27D31109D3FB4D9BB0FFE54AC7234E7B', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:57:27.552', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5BE3F4C72D764DE4937C94078AA3DAF7', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 21:57:27.76', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B39038AA699246D4A93B6E475890F14B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 21:57:27.967', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2D7787D333BC44D984997721C277CC10', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:57:30.949', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('94B9C7ABBE3A4D18928D7DE6FF3AF9B4', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:57:31.149', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BD9CBF2A294E49878A0ECB348FA8FEDE', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:57:31.365', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('07599BFB902D4738B8433773DDA3D983', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:57:31.555', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8C3D275E1EBA4FC2BC7B81836E8CE0D3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 21:57:31.814', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AF3958FDE62F4DC0BC98868810F47161', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 21:57:31.971', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CF2DAC63CAA541C6A11F55ED0C1DAD6F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 21:57:32.218', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E7AC8353541441CE887D888C4EE14A9B', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 21:57:32.374', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DEE0B9B1C4074D418818F5117B2C0C34', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:57:35.341', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B0D9144360734301AEF9E56930066D74', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:57:35.538', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1835626F7EE34848B2440AEE6B7120F2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:57:35.75', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A37819058F2C46879B090FC581810E77', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:57:35.945', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C54EF33BD302437C85FF62045E416F68', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:57:36.173', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A97EBF72DA8A485C92CAE141433AFAEB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 21:57:36.366', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('09C482C6229F43AAB7177E651E13C28F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 21:57:36.601', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('675BD120D40144068DD3A8365489AB22', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 21:57:36.768', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1E094DFBA1B74CCA814667AB9AE0EBD5', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:57:38.846', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E68743ACA7814FD9BC0576AC5B1C9EAD', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.exedit-3.1.js', NULL, NULL, '2023-04-10 21:57:39.043', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D5BEE652465E4BACB6827BD758C05728', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/TreeSelectAction', NULL, NULL, '2023-04-10 21:57:39.499', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F38E8DB62E2C4D6B879EA458A4FF6651', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:57:39.72', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7D4EBCFE196941DDA7614104B7B7CF1E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:57:39.959', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A32B192EEFEA4C02884E309D115D2C0B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:57:40.166', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1ACF493E5D284FC7A4805313B542F1C3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/WriteSystemLogAction', NULL, NULL, '2023-04-10 21:57:40.372', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C702E3A4481F4E399F15114D89076C67', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:55:48.486', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C0C4E151DAD84E78B374F5F2113D6574', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/process-select.js', NULL, NULL, '2023-04-10 21:55:48.658', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('54E60FA53388420D97D1159F746304EC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:55:48.874', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D6B8457A35364EF9A786C57F6507DF54', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:57:27.3', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4A74D5D3BBC94D4586805BC5269E8BE3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 21:57:27.558', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('188AF19924A341D2AB41CD54CEAF7F8A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 21:57:27.76', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('66FC43289FEF40ED91E51EEC157F65C9', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 21:57:27.996', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('49B20A75B3BC418B8A431984CC478C49', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:57:28.187', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5E1585EDED85475EA62F66AA399B4214', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 21:57:28.386', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B2C75665088949F583C2AB72A8A2DAA2', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 21:57:28.611', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5D8F0D3985DD4A52B0976141F0F0D381', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 21:57:28.79', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2B2D1C08A796447F9E5DE46B030D22CD', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 21:57:29.013', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('58B83B410B2E496CBC6CAAADF40D9A11', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 21:57:29.192', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('50E4BEE8C00A48AFB2B2FA3ADD5316DD', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 21:57:29.415', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('90ECAAD8E51447E1A9E7B2A1A7E3537B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 21:57:29.601', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0650EEDF7B044BC5A50A257800DC1594', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:57:30.949', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('88BADFCF17394566BB4C12B8F4770B72', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:57:31.153', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D021F298A64C416A8D9BA645B06DA64C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:57:31.362', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2B0FFCC25249458F8648F9AEA44FE13B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:57:31.562', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AEF5BB5C686A4A24B510A4CDC3FB4BB3', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 21:57:31.79', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F028CF3F37864680939A2D20CA80710B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 21:57:31.985', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E0160648337347E49DD98531A0D7A224', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 21:57:32.187', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B4F50C8AE2E84E46A5835AD3304A7A9F', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 21:57:32.39', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4E03F92CF9A346BA9B578B08F3CADFF0', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:57:35.341', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CB1894E9E0A84FBEAACFA9BC47C71A56', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 21:57:35.548', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('70ACAD2D16D5408B9525E44BC071C0AB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 21:57:35.744', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('076E606903444FC78AA73B8813FF6C15', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 21:57:35.957', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A9E2146F4263429E9F990A8133D76B36', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 21:57:36.161', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EE716FC97AE242259C70A65F19E89CC0', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 21:57:36.405', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1EA35D41CC5C4F3BA927F98A1BDEC209', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 21:57:36.567', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2AD124C389CF404799F0C699BBEEF70C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 21:57:36.805', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F3DD6A411FF4444A981ABC69C39E1347', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:57:37.018', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7E5E3ED7F47F4936BE23BCE9E3663FC9', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:57:37.222', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4C7386FF310040E49CA0CB40036378E5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/WriteSystemLogAction', NULL, NULL, '2023-04-10 21:57:37.424', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B37B5D539E8749BA8E1C5F2DABD0D84B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 21:57:38.641', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('781B47A0D0A04489AE569909CB8AFC03', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:57:38.844', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9B47CF008CAE41AFBF598BD27F48659D', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/grid.main.js', NULL, NULL, '2023-04-10 21:57:39.051', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A841BD6A981A47858B8D8628F1B59AD6', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:57:39.261', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('110DDF5656EC44588688D82FC6881232', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:55:48.45', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0E9E2EC270AA402BB6C0F18681069452', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:55:48.646', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0456A442572E4B5F851D64EC74D2918B', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:55:48.874', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5AE3BF739AD34A49864D15BB2886F940', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/fonts/glyphicons-halflings-regular.woff2', NULL, NULL, '2023-04-10 21:55:56.779', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('55AC8FF89F5C4B7783CA61CD935E34D1', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/skin/WdatePicker.css', NULL, NULL, '2023-04-10 21:55:56.972', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('94E4CE54D3EA4A6798A65EC863132AC1', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:57:27.296', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('ADEEE694861E4835ABDD3963BD036AAA', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 21:57:27.554', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E58F1C847B074D0FA8DB0A1807349289', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:57:27.762', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('59A859F4DD5B451880BDC1FB92AE0497', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:57:27.96', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('68232269B4EC41D6B948E79118A6F9D2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:57:30.949', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('91462479328D4727B9F555721C358C7C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 21:57:31.157', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C7D01464AE404632972B61814F245BCB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 21:57:31.356', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('27725CB866C24992B55E3C7238291D2E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 21:57:31.571', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C847F99CF1794D6D94907383E6793F0C', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 21:57:31.772', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E35BFC9E903544DAB375D9B8C5C55CC2', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 21:57:32.016', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C9212A906D5E4FFA938D90B44AB9E227', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 21:57:32.175', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E1483BCEBEAD43EDB1F8422FA9DB3C27', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 21:57:32.421', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8CE910D9E1404B76991C83793FF836C1', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:57:32.627', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('26FA0C6D036C403390501158494D67FE', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:57:35.339', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A9977D2F33424327A7015F1D880D9BED', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 21:57:35.548', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('427240DFA04C4AD2801FBDA35A6A606F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 21:57:35.742', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('84DBD8E3484A4BAC9C29938B3726444E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 21:57:35.952', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('62115C31CF694F63BD2C93604EFAB54B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:57:36.167', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BBF6D43CE523425691C515113D27243D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 21:57:36.38', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5093071641B4459D9BC67271FEC3878C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 21:57:36.58', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('883C2249DF16445AAF0C6DDF5DE54F96', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 21:57:36.788', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B4DB0B7E11AA45FCB77579E750A36334', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:57:38.844', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CCA5C34E186348A4890B316E35B4CEC0', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:57:39.053', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BC9797FBBD004929A5503B5953515F74', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:57:39.251', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('32E86B707CC944F2AB94DE668E8CAEAA', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:57:39.481', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7E9B91CD1E1D47BFB7B37834FA6FD4DA', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:57:30.947', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3C47B4A6AE2B48729AB015833F33EB68', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 21:57:31.155', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F456958DBD97413CA11BF542C5AD4A65', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 21:57:31.355', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A182827A957B4F27A4C3B23715B9B080', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 21:57:31.567', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('89C1D32D386447539543C462B6514E1D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:57:31.777', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('ADE75953C783444CBB2C7541F0CC1B5B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 21:57:31.989', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7958B42236F241AA8A52C5046F7587D9', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 21:57:32.183', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('458F1483EB824A4880BAC2846C489151', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 21:57:32.39', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('96EE0F128561435FA7525F758192F0C0', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:57:32.629', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6B3D87E196294711B043F65D4F0B10F1', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:57:32.838', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D1DDC8E4520749698413B7F0E65E2946', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/WriteSystemLogAction', NULL, NULL, '2023-04-10 21:57:33.046', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('98914A67B2234F18BEF34A2254812570', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:57:35.339', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A95930C65F174B77BA934A0C4319B21D', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:57:35.54', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('255CFC65D16F4F0B8B39BF584E69DC1B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 21:57:35.748', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('ABF7766BE76643BBB25E9C36CBA35879', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:57:35.942', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1B0E2C898A0E41FCA0764A37574AEBE3', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:57:36.171', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8036AAEC2007489E8174A01BACF4F98A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 21:57:36.377', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E940748BC5B74787BCD42DE758B2F9D6', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 21:57:36.582', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BE5D1624FBEA4375961ED9171090FAD3', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 21:57:36.782', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E6A8E0269E4340E095C4B5D349B7C863', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 21:57:38.846', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D73752F32E754F68A7ADD1EF2AD637B1', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/jTree/tree.main.js', NULL, NULL, '2023-04-10 21:57:39.045', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7C4E902082724377942482AEF702BE5F', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:57:39.263', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1A33475D45584E2D83F44D35F9C2E66A', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:57:39.478', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('25565F292B984D40B29C3BB663FC93AB', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/enable.png', NULL, NULL, '2023-04-10 21:57:40.385', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('70258AB17A5D484EBCFB7B292329A16F', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/skin/WdatePicker.css', NULL, NULL, '2023-04-10 21:57:40.588', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('39A0BDD85D1B41008BBB2CE9BBED85B0', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 21:57:31.157', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B94E48768187415CB5EC5B93FFD1A4B7', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 21:57:31.358', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EEE5551082494B53BC9A4AA93EDCBCAC', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 21:57:31.567', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('26B694B5D11F4B3185828CCAD51EC039', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:57:31.783', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4856EBD1414945EA858D6AD75B602E6D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 21:57:31.987', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2126A38DC0A546A7AB41177D992BF3F6', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 21:57:32.185', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AFA3985879F64E429165276F2959AD34', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 21:57:32.397', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0A7C56943B0549AEA888943F4016D114', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:57:35.339', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EB6ABD6094444D168834725DD0F88ED5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 21:57:35.548', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F85F2B2315A74C7E94184A0B3A2094CF', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 21:57:35.744', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D3360E6704F548A0AD85D4D3E7E55970', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 21:57:35.957', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2EAFA2BD69BF452B8A651EF24ADB932A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 21:57:36.161', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('19BDDC85441B4B9BB8C4947A7FD09558', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 21:57:36.408', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('56ADC3D915AE4807833A5884B469F3C5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 21:57:36.561', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A1B551E974DD4BEBB67D2E2B34118321', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 21:57:36.811', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DF2630F0664548D59D81817D2FA8AFE5', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:57:37.016', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E8FD00455AC84C2AB5B2C7C2272E74B1', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:57:38.844', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AE0679D4444149E6BE9A77BE273A9CA9', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:57:39.053', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EC6BD18019934FCE8208B12B28FA0344', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/process-select.js', NULL, NULL, '2023-04-10 21:57:39.253', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EBA87504397640A0901E685936E522E0', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:57:39.481', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B13CA52FF80346A382E5915B2F3ED398', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/fonts/glyphicons-halflings-regular.woff2', NULL, NULL, '2023-04-10 21:57:40.385', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AE0EF31BD23F433591FBFE1EA6701224', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:57:39.48', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('17999E0B6C7B4B4EBE1D25D0ED514564', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:59:01.808', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FAB8634A1A8543DAB74C07830CD928EF', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:59:01.806', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F87E13FF203148F79F7032896B31F94F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:59:01.8', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('157EA88AF6F54BC6A6AF58D71A5BE60D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:59:01.806', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('57A33687FCCD447DB6B16679C2EE640E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:59:01.808', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6755F13A8258455380CDAF105171BCF5', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:59:01.808', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B9741A1DD628435F8A4CBB722C43FED8', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:59:02.011', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8616B7B23533419B855CFE45E17EA4C8', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 21:59:02.065', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F6EB714AF858464B89451077319B794C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 21:59:02.072', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('14B18E30D3894274A930DAFAAB762CA9', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:59:02.063', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6DE6674BFE0C4FE2A9B6F859C4D5276B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 21:59:02.063', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3838835E77824CC7B49926F247D65C26', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:59:02.063', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0BAAD7E6F35943DE820FE477422317C7', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 21:59:02.216', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('32EFD24E26CD4F038CF77E5FD532FF03', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 21:59:02.272', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CABF577C6EC8444C929013F0D1304FFB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:59:02.272', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0B563DF0968E48949F9A47AFA3695BF3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 21:59:02.272', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2C130CF128CF481B95C9C17CADABC2C4', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:59:02.272', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4EB15A2B0FE144A598F3A5EC0B7353D4', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 21:59:02.272', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('74D8E34451964C1A87BA0AB5A99B72C7', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 21:59:02.481', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9C50012249B8403486BA46AC20752E19', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:59:02.43', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AA49F7DF15034084B2ED04C25139EE56', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:59:02.43', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('862AB3E7E6664BDCB5894CA6272C93E8', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 21:59:02.481', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('26397CE6AA4D488C946E58A2F3798FE8', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:59:02.479', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('942704448C8C4EA0A2F10507121A956F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 21:59:02.485', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4DBB46B448FE42958BB7ABD9B21E6C0E', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 21:59:02.7', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F513C68F40E544749B4946597D9112E8', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 21:59:02.69', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('115CD8B52909464D833E4003E5312079', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:59:02.696', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2B2396818571413A943CEAA9B2850784', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:59:02.692', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('37BC4127F6604A9087C0E295D85378D9', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:59:02.698', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7E3F00BC3C4C47879F54F4FBEE32074C', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 21:59:02.7', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('82507CEE880A4C459F289B9F428415E6', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 21:59:02.851', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A60FE97BAF4C4359AEBF60305F9D5611', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 21:59:02.897', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1372A8E398BA43CDB0E568DCC88C579C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 21:59:02.906', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F7CBF47C195B4211A785B864CD2B5EDF', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 21:59:02.9', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C4AF79463F08438589A4BB5EEF2F24C8', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 21:59:02.902', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('231A497B77914A2F9325ADCAE89DE639', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 21:59:02.906', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1B3D591F4F404086A3290AF4E07A91EC', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 21:59:03.061', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('05CBDC2B911D442BBA5D97C59F3D39D6', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 21:59:03.106', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('467FF17EDAA1405C96BFA92A16A06C1F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 21:59:03.106', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C46ACA30D6324F71A4E9FAD94DB237B5', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 21:59:03.321', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A93807CFA9A54EFBBBC8C4B4476FA747', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:59:03.537', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CD76D873CC2B4C1AAA5DD2C172FFA365', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:59:05.678', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8927FF44EDFB430EA3CC9BA14DE04F6A', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:59:05.935', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AD88E782C0DC4C6BB989E940CB14DEAC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:59:06.095', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BFB24239687948C0874745BCD98A5F0A', NULL, NULL, NULL, NULL, NULL, NULL, '/TreeSelectAction', NULL, NULL, '2023-04-10 21:59:06.315', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('80F099AC39F7446D963C0BFC3135224E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:59:10.24', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1514C668FFB24BF7986B69D2E056C7DB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:59:10.452', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BCB61D29B57B4F44AF4DEBE3928AB537', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:59:10.66', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('966ADA1FF32642B688B95CEBC62FBD0C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:59:10.862', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A54E67683D9E4F79827638EEF621D2B8', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:59:12.416', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4A31738571FD4F2AB1C71ED19CFA9313', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:59:12.624', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('98FD086C4AAA41A9B9B4254295D58003', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:59:12.863', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E1C95FCE330B4A6F8DBCF8379AD2A9C0', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:59:13.035', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9573AAB53EC24A9D8A1CF5B589611ABF', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 21:59:13.296', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3E64B64546844DF29CFD8ED2DF900A19', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 21:59:13.463', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C97EEC4563C34E4DA1B1F6A1D0084C4C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 21:59:13.745', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6D3EDFB7C26D4E9AA3E7BAECF88D300B', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 21:59:13.912', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2B798132D72D4A4FB47266A1D377B234', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.core-3.1.js', NULL, NULL, '2023-04-10 21:59:15.75', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5092E17E244F411BA1402762C83BDFCB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:59:16.01', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E96A6E6CE2C14C23AA2B11549ACE8CAC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:59:16.151', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('603BD9AB70FA41A59A96D385E4852BA6', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:59:16.403', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('ED9398F999204FACBC09251F0EE13500', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:59:16.599', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EB7A1AA6728C429CB6357FAA9B729BBD', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/enable.png', NULL, NULL, '2023-04-10 21:59:17.338', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C4A217D10200425AA90E2345C3CF9595', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 21:59:03.102', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('15836118A8F1435E9CD4E76E35F2B783', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 21:59:03.31', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('84E5F6FC20C7439EAC4207B79D1AFFCE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 21:59:05.682', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A7FCF7203A9642B4B1D77D5486F5CADB', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/grid.main.js', NULL, NULL, '2023-04-10 21:59:05.889', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3334EF82B5DF4DC9968DC6E06B5E79DC', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 21:59:06.114', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('81C42DF7570B48409565781C798EE6F2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:59:06.303', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6482876174734D0C88FCFC709F2CA0F5', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:59:10.241', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('19EB9A9F8AA548B0A90194FD38B0F638', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:59:10.447', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('57F346C821C3447D9C64CB8DA53E5CCF', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:59:10.656', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('406B5268D309401599F060B0D836FEC5', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:59:10.896', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D5BF946EC39D4E1B8BD997CFFB719DD8', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:59:12.409', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('37C89E4D20DC4572AB22FE4A8FE90014', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 21:59:12.624', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5DA7828DA72A4B88ADC2D9D784CFE2F3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 21:59:12.817', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('761E82022173452E95630FB227107E8E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 21:59:13.082', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F76CEC8D7A1543F6B2E8C803A539F42B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:59:13.261', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9420AF2D42B9431E97146AAA46B020E3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 21:59:13.544', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7A72EB8DBDF944B19217015C1FE35734', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 21:59:13.658', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E665EA416FF74775BF862C533BDC8300', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 21:59:13.955', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('457F550A108B4486990A533948FC5FDF', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:59:14.174', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A325BBC456E54FBCA555DD0D74D0F5A6', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:59:14.472', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3641A87B2E4E41C493A1842972E18C47', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 21:59:15.538', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C0E9121C431C46F1823DF3DBBB89A0ED', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:59:15.745', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E426EA2B629041038445C18F0A47EDDE', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:59:15.96', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9A8039C42D554FC19680C35C44477939', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/process-select.js', NULL, NULL, '2023-04-10 21:59:16.155', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7ADC86C2C8F54616BABB8F143E5A4786', NULL, NULL, NULL, NULL, NULL, NULL, '/TreeSelectAction', NULL, NULL, '2023-04-10 21:59:16.373', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CBC46EBAFE3C4140A39CE72FADD63349', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 21:59:03.108', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3F78DF3608704F8FB906D3FE0B69A395', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 21:59:03.3', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0810A6A0E21E4E749C2C03FF2767762A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.core-3.1.js', NULL, NULL, '2023-04-10 21:59:05.682', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('340123B6C883441F9977701EDD6C9ECE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/jTree/tree.main.js', NULL, NULL, '2023-04-10 21:59:05.887', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DF3DB0DAC2AA47F39FB7392D65B828C8', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:59:06.108', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('316D4072534448718BEAF097FA5AD313', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:59:06.309', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E75BB07F561E4077AC99FCCA331D5629', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:59:06.521', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EF524FE885724417B2B367BC7E1EE91A', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:59:06.731', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('931A55164C1A4582A5416589DA62C0D4', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:59:06.985', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6AB682D839E24209B89BEBA0F0B78114', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/WdatePicker.js', NULL, NULL, '2023-04-10 21:59:07.242', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B0E8277E287543B699CBE19B89D2A39B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:59:10.239', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('770E3087A99F4718AE76B4AC42F581AB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:59:10.438', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5859CD05D6CF40C18A105DA9DEA00D45', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:59:10.691', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6327C247B45E44E7B64089CAB031A5CB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:59:10.848', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('50F46F554129401A92D9435D5772BBE5', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:59:12.416', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8471FE80133D4547A2AE6C8417AAE4D3', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:59:12.622', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7C5928BD91504BE6938A6236EF0686DC', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 21:59:12.827', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4DDD6B4E74CD4317BA402FAEF4995548', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 21:59:13.038', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CDBE7EAA45494F1A8EEE4A86C3090A83', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 21:59:13.294', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4955334670324F1AAA63EBB5E7685C8B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 21:59:13.499', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1A3127CD636C4B21856A5102555BBA8C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 21:59:13.707', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('464FE26E1A744377A8756801BADCCB9C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 21:59:13.912', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AB22FD8A284E4B20918D63BE1B8D3A7F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:59:15.75', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F3628D1309D64AC49DD49C55CE771508', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/jTree/tree.main.js', NULL, NULL, '2023-04-10 21:59:15.952', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EBDB5C4EBDD0464AA6B3C0E70DCF3FDE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 21:59:16.198', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('453793A085C64B8BA2677052B76BBB56', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:59:16.357', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9A7798C22EF24884AB8D19FE2DFDBB6D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 21:59:03.113', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6EA1E9300B1441BF818FAF26F3DCBB9C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 21:59:03.269', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AF1D5AFE6A6449338CC50B08E97E0857', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:59:05.682', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('598CD58A00DD4AA3ADF31FBB80D561C7', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.exedit-3.1.js', NULL, NULL, '2023-04-10 21:59:05.877', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CCB7D68BB0EF4D47BDB0687C8C029359', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 21:59:06.317', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9A57DDA9FAEF4DB3804AC6185AD4D984', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/img/loading.gif', NULL, NULL, '2023-04-10 21:59:06.514', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DF24ED92FD2E4EF2A07E05C220C1353C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/fonts/glyphicons-halflings-regular.woff2', NULL, NULL, '2023-04-10 21:59:07.257', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C85C0ACB11774AAFBB10152111041E31', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/skin/WdatePicker.css', NULL, NULL, '2023-04-10 21:59:07.45', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A92DE4A08F9C46CAA3A6B8AFB8DF5790', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:59:10.235', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('85795F27B99D4D838323997EAB7C5713', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 21:59:10.452', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('80E7A2F3B189412DB06CC4B6C76C4A72', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 21:59:10.642', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1514A157BFB544068EDFF0A0F7048A2E', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:59:12.416', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F0CAA15A1FE74D6FB8EACE6362D8A8FF', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 21:59:12.624', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6D6820BFA24841B48F4D1AA5C8070C09', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 21:59:12.825', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5E8FDDBFDE73438588AF3F6167FFCCF5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 21:59:13.07', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E0695FFFDBE1426FAADD9EEC6710A07F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:59:13.259', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C98184699DAD479CB96F6A2E2571C4DF', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 21:59:13.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3DC97434DD8E466F86B0CC79F87A0009', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 21:59:13.704', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C7462F0BB816469D8D43751991C650B4', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 21:59:13.955', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('50438EF160F24BD6BF2E7A079F49F6C2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:59:14.172', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C72D3C29A32143E697810437AA109F14', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:59:15.748', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1AD33C6F83954EC3AE871DD1ED6CE6A1', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:59:15.952', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('882D3DD972124DFF83578A73B8DFF8BF', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:59:16.17', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C196D32F3C87416FAD3DDABAA336E9A0', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:59:16.362', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('48A2DBEC64164CCFA28730807F74FB8E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 21:59:03.308', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6333333EE7154A90A2CE75499B83503D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 21:59:05.682', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('725D77AC92284EE18D10D932E1F3F6B4', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 21:59:05.889', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7089FEE88A8B4B9E9D6CBB90022FF186', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 21:59:06.108', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('77D3418F8F7044A0AD106BA789CE3403', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:59:06.303', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('171F78FED537486EAF64F84EDE799F3C', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:59:10.241', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('46B8E2D869AE40A79B2E3BEEBB721329', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:59:10.447', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1610C8B3A624419A859CAFDFA6D4E54D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:59:10.656', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5DACC299E98243EB92802C3D540899CA', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 21:59:10.864', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('008D21D4C2304E2DBA5C66421144BB79', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 21:59:12.414', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D335177D73064116955DBD2A50E5C04E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 21:59:12.624', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8F27B636737F4DA2A0359B817F663609', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 21:59:12.827', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AC118749AA304A27801D9A93906287A2', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 21:59:13.038', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('94B30BD88F344B0A8D9D06FAD75A7F7D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:59:13.261', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BCAD1932BA1F49339F00C485B408ABDE', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 21:59:13.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CBD23D2DFCAE4438A4A45BAA26170880', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 21:59:13.707', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8322B62ED228404D940D72A34BD892CF', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 21:59:13.951', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('77570B4D89EF4DD3B03C6381C64C79E0', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 21:59:15.75', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9F8F410022F34AC9835703CEC391CB32', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/grid.main.js', NULL, NULL, '2023-04-10 21:59:15.96', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('14A9CDB84BEC47059EFFFA1B8B67A240', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:59:16.17', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('19B4CD3295B54B6F9854D1A82EFE96AF', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 21:59:16.373', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2EC32F5DF6EB4C8DB950CC5FFDC3FFF3', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:59:16.61', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A5BCE0C2DEAA48EF84A76BC93654BA5E', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:59:16.815', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('29E02E3042664449B2A1C0B2B16BD611', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:59:17.073', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2DE7CDB776DC472DA6C5C6AA470E0972', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/WdatePicker.js', NULL, NULL, '2023-04-10 21:59:17.326', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7EFF462F785B4C038E02C7EAE1BF4160', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 21:59:03.323', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E9A35A10FA5945F98B381EE30D8DAD7F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 21:59:03.535', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D3C84C3E61BC46B09F1E95A43A3E3FE9', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 21:59:03.789', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D97DFD95ECCD469E8E2ABF7B73880CC8', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 21:59:05.466', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2F45961DE3D946679CFC33989F3B771D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 21:59:05.678', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D763224F1D9641F08F18F2AAC8024179', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 21:59:05.885', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BC14D0F2901E447F8ABA412E17F44C7A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/process-select.js', NULL, NULL, '2023-04-10 21:59:06.101', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('78C6EB9ED62F45CFB8A9E554B3FCF321', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 21:59:06.313', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('00668D0E70994369BDFC8AC37169F13A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/search.gif', NULL, NULL, '2023-04-10 21:59:06.514', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2A414CE5428F440DBEF541866A799713', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/enable.png', NULL, NULL, '2023-04-10 21:59:07.255', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AA924622FC6440A4BF25F7690A3279E1', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:59:10.239', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EE59E200B985491E9BE649A7DDF10C2C', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:59:10.443', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('43F84745972E4D469F44D8B7EF4B296C', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/skin/WdatePicker.css', NULL, NULL, '2023-04-10 21:59:10.651', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CB36BD45032841E58362E83E9CCC0473', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 21:59:10.864', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0D77085B143648E193FD0988D7E00113', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 21:59:12.414', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2CDC12B054F74A54951F076829A1C6B4', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 21:59:12.612', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1941D6F954E64516BED4211BB00E434E', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 21:59:12.875', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('128EE8364979409C8F4775AB58D8E2D8', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 21:59:13.022', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1E4F782068A845BDAC05C63472898DB3', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 21:59:13.306', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2DD92C40FCF341468423FEB82476D615', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 21:59:13.463', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('378BE24D1AF54F24B9E015475EB02C72', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 21:59:13.745', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('69BCD0D3EE26469F9308A20D7CF9F122', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 21:59:13.86', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3AC27A21F60847259D3D9F654D39153B', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 21:59:15.75', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('943A3062FBC74D35A8D9317E6A4EA303', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.exedit-3.1.js', NULL, NULL, '2023-04-10 21:59:15.943', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B936C1F159E241F08FE8B3BB94CEEAEE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/search.gif', NULL, NULL, '2023-04-10 21:59:16.404', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('09609E888FC34A5C8E8699B17B421B6D', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/img/loading.gif', NULL, NULL, '2023-04-10 21:59:16.563', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CF0E98D202AD45359E0D8127C545B2A7', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/fonts/glyphicons-halflings-regular.woff2', NULL, NULL, '2023-04-10 21:59:17.374', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FA5F8CDB4DF04114B1FCA8133C8A97FE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/skin/WdatePicker.css', NULL, NULL, '2023-04-10 21:59:17.53', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('139062FB60874E499DBD6327F3F6AA29', NULL, NULL, NULL, NULL, NULL, NULL, '/getGridAction', NULL, NULL, '2023-04-10 21:59:23.673', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8DB85B2FF31F489BB89BAB15F18C3C19', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 22:00:13.613', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('924883EF56014CCEA4A1B54D9051151F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 22:00:13.609', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F24423F2ED7A4092807D12107849AD4B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 22:00:13.618', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6D8EAEB068854255A44EBEEF2098DEBD', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 22:00:13.616', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B543978BCA0747F4BAAF582573DF2C16', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 22:00:13.616', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('647C6AC4B2CC42F7A3B305ED7DA15CE2', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 22:00:13.618', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9D3D8AC89E144877B8D90C88749E7CA1', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 22:00:13.811', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('626864068119462088F5F413E5F5B139', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 22:00:13.819', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B0B987C9FEBD4C519C865B0127D7A547', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 22:00:13.817', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8236D1717311439DB71AAF8FAA4CB4B2', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 22:00:13.823', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1F12492D34704FE598D9EA818CFAA646', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 22:00:14.027', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('279B87387A974EEBA4BD1A66ABD59E0A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 22:00:14.244', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5F255D25E0E64F2290D3A9C714AEECA7', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 22:00:14.461', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('26E1B7421BE84A448F80FB13EC34A6E5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 22:00:14.677', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C741F426533C41319592BA13F2171CA5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 22:00:14.862', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0421E35F4EDC4D6F9D81F0A71D475E4B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 22:00:15.087', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2EEA271B19464FF8AC05E6355DEC74AE', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:00:15.304', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4F6686A6B3CE4CD4B4EB1C49FADF1859', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 22:00:17.532', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('854F5150376A4484B1625A30FAD2FAA7', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/grid.main.js', NULL, NULL, '2023-04-10 22:00:17.738', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('988785CEC4474549A411955DC99FE24F', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 22:00:17.95', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AFE8D54137214CDEAB8C76ED801C8C15', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 22:00:18.14', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('68CE0381FC8A4ADFA6B25F172E7F110E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 22:00:29.785', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('17DCBAAA104A46F89F2B9844378FD540', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/jTree/tree.main.js', NULL, NULL, '2023-04-10 22:00:29.992', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('50A081EDB461437C8B6767332AE508FA', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 22:00:30.207', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7B8B57D711E5470198DEE416FE1F26D8', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 22:00:30.419', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('19482717183D425790239E4CA3BCA035', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/search.gif', NULL, NULL, '2023-04-10 22:00:30.615', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('ABD207A1C7A84076A3B72EDBAE7B11D3', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/enable.png', NULL, NULL, '2023-04-10 22:00:31.378', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FAB6BCF7D4044F76BF45E98E1D17196E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 22:05:45.249', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('10D778EC78084A62969535909266E616', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 22:05:45.506', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('98455DBC5ABD4E3D8F0AB87DB5BDB8D1', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 22:05:45.715', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FFA4660E08BF443F8034A0D24E83D714', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 22:05:45.93', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('463DED3C200E4E2A9C1939B793B7DB37', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 22:05:46.17', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('62817177549A4A4D9A93C4ED73C339BA', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 22:05:46.353', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4B9BA1F1638B4754BD2450294ECDCABA', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 22:05:46.62', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0F6CE929737A4D6C9E648C42353F740B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 22:05:46.767', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('308FF45E7FD0473582E314E20A68B89F', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.core-3.1.js', NULL, NULL, '2023-04-10 22:05:49.079', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('29717F9DDBCA41CFB6784F1BADC47A00', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.exedit-3.1.js', NULL, NULL, '2023-04-10 22:05:49.272', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('58B0CFBEC84E4108A674DFE7A658E8C0', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 22:05:49.73', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('645AC276DE3144C3B7D810E01E933F1A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/search.gif', NULL, NULL, '2023-04-10 22:05:49.93', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E8E9B985414A493488854BDBD939CA62', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/enable.png', NULL, NULL, '2023-04-10 22:05:50.721', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('646EB9C82B224763A3BCEC02BAD43ACE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/skin/WdatePicker.css', NULL, NULL, '2023-04-10 22:05:50.918', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1B1C6FE089334E18B30A27F7B1AFD08B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 22:00:13.827', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5DCB6E93AC634E5D931464870CFA24C5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 22:00:14.025', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('48C5B16473A043398E506FFBFEE2093D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 22:00:14.242', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('03C57209368B4D4EBDC9BC50900D5BE5', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 22:00:14.459', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DB022D21E8C94F87822DCC3C3E5E46E7', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 22:00:14.677', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D8637B9F51EB47049E253AD42B3E017E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 22:00:14.854', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5FA362FA1A2444ED872974FF5590857F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 22:00:15.092', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('11E6D1ABF5C24FAEA3D46EEB61E32037', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 22:00:15.304', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EA0FD1CCCA304E4E9DDFE99CCD0496D9', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:00:15.557', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('63D6D571AB3541EC9F74360F2309E6C2', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 22:00:17.314', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A83B633531F14F95AF214E2B61C5B716', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 22:00:17.53', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6208BDEE718740D685AE23590AD63061', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 22:00:17.742', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('93194743B6524DDBBB7AF45B920A6194', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/process-select.js', NULL, NULL, '2023-04-10 22:00:17.942', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('110FC6EC93514CB48A6972DC4F84931D', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 22:00:18.156', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('44F7236B892B43968156DF2B34F95464', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/img/loading.gif', NULL, NULL, '2023-04-10 22:00:18.354', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D7EFF9E68F8F486F9F7FA636056D93EE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/enable.png', NULL, NULL, '2023-04-10 22:00:19.107', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('901B9F50808C4CD2A4D15DCEAE143712', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/skin/WdatePicker.css', NULL, NULL, '2023-04-10 22:00:19.303', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2A3B979385BC4F7BB32BA358AEA8B470', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 22:00:29.57', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1845E9939C2244E8B081E6930B7F64AC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 22:00:29.781', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7CD9ED1C05964513A5626EF1996171FC', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/grid.main.js', NULL, NULL, '2023-04-10 22:00:29.992', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('540B6B95D6B24ADB9D85BF334B25CBA2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 22:00:30.207', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B4F2D424AABF4F6C81320F03B6A65B9A', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 22:00:30.409', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D9E264B6D4CC47C4AB341A1E54503690', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 22:05:45.25', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('56B8F937500A4C93BB51FF3B07373575', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 22:05:45.504', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8DDA4E0B6FC54A139A6C7507E2BB4009', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 22:05:45.745', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('56BD528EEA514430BD14E72D36751252', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 22:05:45.914', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('64B91AB083FB4ACCA4ACABAC047722FF', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 22:05:46.177', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2D6D0AABDB4744C0BD7C4ABD2C4ABD65', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 22:05:46.353', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4C219F07E7794614B9F08B07602825E7', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 22:05:46.608', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('088D034F5C5F4FA19AF6475BA4C9312C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 22:05:46.781', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('72BD02426E794C2C9C03EFD5B5FDF9C3', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 22:05:49.079', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('210BDCDD84164B03AD7FB627AA6E2B68', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 22:05:49.278', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9E38C885A3D94CA5AC9BA5DFB9F670CB', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 22:05:49.521', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3C36EDF21789439D984C840D70BFDA35', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 22:05:49.681', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7507C63F5EA343FCA2CE6CC0A4BB6CE7', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 22:00:13.862', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EB84799C22B240D88BB201EDC05D5DD7', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 22:00:14.017', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DF3DDF4E8067401FB6D4E3F1E5B5C6A0', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 22:00:14.258', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E8B8CE91D2084F2885E73D1E48C3E34B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 22:00:14.455', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('013BA10BF2984870B78A648F229D06A5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 22:00:14.679', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0ACE8B7619134C78B955CA4524F843CF', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 22:00:14.881', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AF9C3776A07C42A6A4CD3406AE467659', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 22:00:15.075', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2944DD8B1D3D4D77A0FC64902F9A3E4B', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 22:00:17.534', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C366EC5F81E344C7B5A04F0550BAA3B7', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 22:00:17.778', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('61D0F3E3AD954A708D5563B48E3A0BF3', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 22:00:17.929', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('06F219527ADC4793B8585AC151CE91C7', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/search.gif', NULL, NULL, '2023-04-10 22:00:18.158', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AC63FAE4430B4C0792D69353CBD93D47', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 22:00:29.785', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('777DDC0FE6E0416A8DB9E091E8FD6A03', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 22:00:29.994', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CB85E6EC3AB349D8B9023D1E766D8D90', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 22:00:30.195', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('41F2E62B2B9F4DC285E2719785A58221', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 22:00:30.419', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('72A501D8AC5049C788B2EA6B5B60B803', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 22:05:45.25', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4504D4421C7F499E9C2A0D07EE3CB920', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 22:05:45.542', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AAC4D9B5800C49F6A45F89BAD08506FD', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 22:05:45.688', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0DF34030BE6243C288F8CACB4204941D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 22:05:45.962', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A6ECDDD2D18D47649E466B8C43592783', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 22:05:46.155', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('52D9F3CE84D04327B87FC416D91C8637', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 22:05:46.384', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B625AE36B5F74BD39143C7FCF03A5DB1', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 22:05:46.587', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('82072E0F3A1449D08BA0072F93A8D5C5', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 22:05:46.815', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('55654E603CAF42B7B600F9E9CD0427A8', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 22:05:49.079', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DCF02A6992C54AD4B9F4F463FA8D5768', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 22:05:49.327', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('61DE70E5D7CF4131A3CD6AC968D8E08C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 22:05:49.477', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6A9FE1FA9DAB49699E434CABEF30E6F9', NULL, NULL, NULL, NULL, NULL, NULL, '/TreeSelectAction', NULL, NULL, '2023-04-10 22:05:49.729', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DD37F4D64869432CA1FB893619831083', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/img/loading.gif', NULL, NULL, '2023-04-10 22:05:49.93', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EA7AA79E77EA4C0DA7FD2CC569750080', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/fonts/glyphicons-halflings-regular.woff2', NULL, NULL, '2023-04-10 22:05:50.759', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1ACE82E34A494BBBBE956E8E77BBF24E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 22:00:14.032', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DB7CDD660AA542ACBAEC85DF4B18F0DF', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 22:00:14.235', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AC099CCF90524EF798649937675252AD', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 22:00:14.47', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5B7EEC4D9B9F4565ACBB1DD3C5AC365F', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 22:00:14.671', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FCE69366B71B4544AB1658F19B95CD12', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 22:00:14.87', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F68727E34B7D4355BA66AE0D89774A77', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 22:00:15.077', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D4D1ABFD2E624299B208D71EBBF0D2B6', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 22:00:17.534', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('091C041C8BE14804B2A38DD1B0F78E8C', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/jTree/tree.main.js', NULL, NULL, '2023-04-10 22:00:17.738', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5E44526107794D258A8627D5A8296974', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 22:00:17.95', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9568D0C3FD3D499FA8FFE289CE588DB9', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 22:00:18.148', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D0F5CBC375A5423581E1B5394820BDFE', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 22:00:18.371', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4AFEF4CD5E8440979165990628AEF155', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:00:18.583', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('235B3B5DD4B74BBBB48AF42668896F67', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:00:18.843', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('902F4F77B1E8431199620F46A337CA19', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/WdatePicker.js', NULL, NULL, '2023-04-10 22:00:19.098', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('423D8888D0CB439FBE82DF30611D0B5C', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.core-3.1.js', NULL, NULL, '2023-04-10 22:00:29.785', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F4C9DAACA5A844BE93A606575BF4602A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.exedit-3.1.js', NULL, NULL, '2023-04-10 22:00:29.982', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F6A90BF3DF3F4A3485744F9C12EFF279', NULL, NULL, NULL, NULL, NULL, NULL, '/TreeSelectAction', NULL, NULL, '2023-04-10 22:00:30.432', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D20F2BBF315E4338B37019E378D8E0F0', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/img/loading.gif', NULL, NULL, '2023-04-10 22:00:30.605', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F384124B6C624D36B4C9A09D071A510C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/fonts/glyphicons-halflings-regular.woff2', NULL, NULL, '2023-04-10 22:00:31.382', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0D96E907B7D945508C6CC49379F6C787', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/skin/WdatePicker.css', NULL, NULL, '2023-04-10 22:00:31.577', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3B623EF8B5544C80905ACCF49AEBE7EC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 22:05:45.242', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6DFC890FADD2480A8D572C163C99871B', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 22:05:45.535', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EA803FDFCF3E45119FD090B7B0330EF5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 22:05:45.708', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F0B5FD2DDE764BF3A7C0D719F4BF5290', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 22:05:45.954', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('388B08913C9B4096BA224EAB00602658', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 22:05:46.146', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('544A87E36E6347369049F938A1DBA370', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 22:05:46.401', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CE17786D24A44C5CA823B4D872B0247A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 22:05:46.562', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('13177D851F874D8199CFAD86F23B509B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 22:05:46.822', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2E48AA1E7EF5495F8CCFF9DF6DFE17D6', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 22:05:47.035', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6BC82AEEF92A4511866E5D0BD0CFEAC3', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 22:05:49.078', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CDA9A606EDA24C2F868FB7ADA1E868AE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/grid.main.js', NULL, NULL, '2023-04-10 22:05:49.291', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3A5F8D06970D456B96D54902398CF6FF', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 22:05:49.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B435D29A1AF54EB381AA9F0033CFC288', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 22:05:49.701', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1C99B4767AD2467A827D3E1BC9FB1E62', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 22:00:14.038', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3BBAC8F3BDA245CCBC9274472AE2ABE6', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 22:00:14.228', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C09F6CE0EFFD45EB8348D08D0A96635B', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 22:00:14.472', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B1EA3B4644BB47939E0D670A8F917B89', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 22:00:14.662', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3E21D74F1E954888B8BA4B3BC976EEEB', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 22:00:14.881', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('269C4AB50B554847ACA177EB274877F5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 22:00:15.065', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B3DCE3E63A054032AC22036B3C3190F3', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.core-3.1.js', NULL, NULL, '2023-04-10 22:00:17.534', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('773809D44B0B4A6BB401E59033829CBE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.exedit-3.1.js', NULL, NULL, '2023-04-10 22:00:17.727', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('06672FD8C922419A92AFEA7519DD5B19', NULL, NULL, NULL, NULL, NULL, NULL, '/TreeSelectAction', NULL, NULL, '2023-04-10 22:00:18.158', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B7E1DA41497149E29998F94C22AA6A11', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 22:00:18.354', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E33A632EEB1A46DF83525BA1ADBCD89D', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/fonts/glyphicons-halflings-regular.woff2', NULL, NULL, '2023-04-10 22:00:19.112', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AE0C1A05F3D94C6CB80E9F49362250B1', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 22:00:29.785', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F810755E8BA54A2A88F123D9688B1F5C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 22:00:29.994', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('37A6008B4351488DB3F847C76B9FD448', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 22:00:30.243', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('154207BCC88F4191A5393A2CCD7A8167', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 22:00:30.403', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('88FCCEAE746042F7A2C608B03E32B68C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 22:05:45.25', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('38DB9D14465A4ECFA90D930A98ADDEE0', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 22:05:45.488', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('567BA7E0D04A4A5AB1AC9A2A4C052A1A', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 22:05:45.754', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C03F18B904704F0FB905DF015B433A33', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 22:05:45.883', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9FBE9A75FDF0402C9F6AE13524F53B5F', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 22:05:46.177', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('09CD8EF0250945BE866A1392A9DE6A1E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 22:05:46.384', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('30BF817DCAA6419DA403C7E6B19F1B0A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 22:05:46.579', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F645618C9C374A8EBDC0466C7D4C6B3A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 22:05:46.821', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AFCB77DD602E4CB694BBC9BA767AC36F', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:05:47.058', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('61C1B4870AE24DC39BE568FF7770BF33', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:05:47.339', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FE66FCA5833B401C819122186658C9AA', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 22:05:48.869', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('62B30179849D4E1D9B659B362512A839', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 22:05:49.075', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3A8B18AE08F54B8A988D5E6DCB800418', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/jTree/tree.main.js', NULL, NULL, '2023-04-10 22:05:49.291', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('24FB1FBCE1A14307BF3BC1BAD4C1D3F6', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 22:05:49.501', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('89F6BA0FC3CE44CBA114E36A4272733E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 22:05:49.705', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5FB925CE1D9C4A518B013A56A2B35D98', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 22:00:14.056', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A0F5E10DF01549A8B3C663605F105868', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 22:00:14.209', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C8EF5C6B6C1D417D956B042C227CB27A', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 22:00:14.472', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B064F0CE74364D88A5A5EB332C3A693A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 22:00:14.647', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D495A39C474344DC9B659BA7CBDD82DF', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 22:00:14.887', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BBF92AA669C944A7ABE5B606BA1B1E05', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 22:00:15.061', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5192F7767D2D45CD84140D3A28C5DD76', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 22:00:17.534', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BECD2542EAE8499BB5F2002463F2D779', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 22:00:17.734', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5752677E7E1242DD93B4B3163ACFD044', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 22:00:17.956', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('26060BE03FFF47FDBE2869140E09B0AE', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 22:00:18.136', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('935A56CD6FF54E78B30DD2B7721D168E', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 22:00:29.785', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CA5DBAE3BC0249A1BF17E41079C26199', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 22:00:29.99', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2C908AC47CA245FE88B656A910D88C24', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/process-select.js', NULL, NULL, '2023-04-10 22:00:30.206', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EEF83D267B4844E59C45F8C8AC206AF0', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 22:00:30.413', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6DC409562EC548B9A104FDB31F7212EC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 22:00:30.646', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4E466F41D7BA40E49FBD6E7C8F300FA4', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:00:30.853', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('49ED756EDC1345D3841F3A314E1D352F', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:00:31.112', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('76A065011CFC4251937E7C87582BEAB3', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/WdatePicker.js', NULL, NULL, '2023-04-10 22:00:31.37', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('98DA2F5EDCA54B78943DA242D66763A2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 22:05:45.25', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2D423E53F14840FEA203E4D94C73638C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 22:05:45.506', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1DEA4F1C030F4CCD9EBA0FD8D819F672', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 22:05:45.715', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FE184A2E21B049B3B33AB9F41DB7006A', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 22:05:45.925', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A1C633DB07B640B99D7FBBB7BEF66690', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 22:05:46.177', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0ECA3EF9647C4DA08249BF1440582AC1', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 22:05:46.382', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('61CD4E395CCB415883358073F4E25D7C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 22:05:46.587', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A9E9B34502FE47B4BA27CEFE944EBC7D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 22:05:46.781', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7DD7C5B51D6E427C84C6107ECF1175C4', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 22:05:49.079', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('08A94E170CA141C2923826DB4FCFEE5F', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 22:05:49.291', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6D8EB932F9FA4D6598B0C8366831B063', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/process-select.js', NULL, NULL, '2023-04-10 22:05:49.495', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D4822D455C31426D8996D8E94DFCB9D8', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 22:05:49.705', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('360CC06BC6E74F31B12A291F57E9F195', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 22:05:49.942', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EB0DF302AB8F40A8B2E01E69ECB6B3A4', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:05:50.187', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DCA8CD25DA9C4E7497B4068AF82A27BE', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:05:50.446', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F9742E91D5B54378A2ECD072A07744E0', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/WdatePicker.js', NULL, NULL, '2023-04-10 22:05:50.71', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A6899F73E408464E802F5F0C3A2AFCC5', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 22:07:12.826', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AF041B955D154FAD9CD6E0B839D886EB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 22:07:12.824', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9CCCD6C8B3384989BCED5964DD844414', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 22:07:12.828', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AD60F5B302A648FE940D64E7B17FEBC8', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/justified.css', NULL, NULL, '2023-04-10 22:07:12.826', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5CDDF6CE58FC411FA239F4E81A6C67B2', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 22:07:12.828', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('884646942CD349B688D51A4A2AC517CE', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 22:07:12.828', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8821B255D52949A3964DD08D9B6A2CF6', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/css/main.dwr.css', NULL, NULL, '2023-04-10 22:07:13.065', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E50A32F3F009458287A39E782C438F5D', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 22:07:13.081', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0985F0D8A94B4262BF78420C1AA5CC38', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/vml.js', NULL, NULL, '2023-04-10 22:07:13.285', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DACC1A4D027C4744B25C2AC05BF45975', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 22:07:13.307', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E4E68BB5197140729693C7388FB182E4', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 22:07:13.463', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8DC808BB75E04C8A9CF275186A14BBC4', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 22:07:13.493', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('29CAF123836647B4BB63806C2D17BB18', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 22:07:13.721', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5951FA5BE78A49C7BE26EC8F6DF68D35', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/save_edit.gif', NULL, NULL, '2023-04-10 22:07:13.722', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CEA659F1435346E69EF7224F2D9A5B80', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/fork.png', NULL, NULL, '2023-04-10 22:07:13.906', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5A4BDB98ADC0457787756AF194B06D48', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/biz.png', NULL, NULL, '2023-04-10 22:07:13.921', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('8C615F2BB7DB4EF4977107985AB08F80', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/grid.gif', NULL, NULL, '2023-04-10 22:07:14.132', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BDC067539BF34F94A719D602AF1FFD95', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/edit/delete_obj.gif', NULL, NULL, '2023-04-10 22:07:14.148', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('104204B4B0B641A786A710CA31890204', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/up.png', NULL, NULL, '2023-04-10 22:07:14.303', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0B9340022206467C803BB43DC97A2BDB', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/blank.gif', NULL, NULL, '2023-04-10 22:07:14.333', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2339C662C65745189FA89F52ED009340', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:07:14.579', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9E36FF96B2C44F8AA11CEAFB0FF337EC', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:07:14.859', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D0F7A76552BF4DF4AE863A87645A9CAA', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/dialog/process-select.html', NULL, NULL, '2023-04-10 22:07:16.121', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7751970F3D27447DABF3677E4C8563ED', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/easyui.css', NULL, NULL, '2023-04-10 22:07:16.332', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5B99D15D6D59405BB3492109858049DD', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.core-3.1.js', NULL, NULL, '2023-04-10 22:07:16.335', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9876ADC211B74BBA83A962228A21FA67', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.ztree.exedit-3.1.js', NULL, NULL, '2023-04-10 22:07:16.529', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('924493A5912C43219C5AFDA8D778A79E', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/comon.main.js', NULL, NULL, '2023-04-10 22:07:16.537', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2DB5BC6375154D5EA1E921393C65E210', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/common.css', NULL, NULL, '2023-04-10 22:07:16.752', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('49D417EE945B4531BF6E4BB1B93D185C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 22:07:16.942', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9122A49CEBFD42C6A94D11A264BAB985', NULL, NULL, NULL, NULL, NULL, NULL, '/TreeSelectAction', NULL, NULL, '2023-04-10 22:07:16.962', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('128AEB97222F40B98E8A529F21060486', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/search.gif', NULL, NULL, '2023-04-10 22:07:17.171', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AA23BA2721994CC5878E1F00C15E73FF', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/enable.png', NULL, NULL, '2023-04-10 22:07:17.902', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('41AD107B676B4DD9A0D67D2A052B43D3', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/skin/WdatePicker.css', NULL, NULL, '2023-04-10 22:07:18.1', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('EE35648BB4244B05A135C5C2DD0373E6', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 22:07:13.077', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6C1841BDE9F84899A2EEC1F486C73DC6', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 22:07:13.307', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B0C1F256A4DB4873A6D5CD3712592D60', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/operationhistory.js', NULL, NULL, '2023-04-10 22:07:13.493', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('51070E78B69649E083F8503CB6427DD2', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/toolbar/flw/group.gif', NULL, NULL, '2023-04-10 22:07:13.722', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AA9BD5188CC247B497C55A2E26DD2933', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/end.png', NULL, NULL, '2023-04-10 22:07:13.923', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('AB6A354DDC804292AEFB3B3C8D53E15E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/transition.png', NULL, NULL, '2023-04-10 22:07:14.131', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3DF238C8C4B0442DABD534EACE28B836', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/right.png', NULL, NULL, '2023-04-10 22:07:14.331', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0F426EBA253E4CBE9013593367910537', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/zTreeStyle.css', NULL, NULL, '2023-04-10 22:07:16.335', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('187BB51C42084C0EB46B3D1F5C1CDA74', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/jTree/tree.main.js', NULL, NULL, '2023-04-10 22:07:16.537', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1843F461CE7B49F9B344AB36066E06C7', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/grid.main.css', NULL, NULL, '2023-04-10 22:07:16.78', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('315C083C20D042E5A55060506474B310', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 22:07:16.94', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5B9006F6E69F43CE8CD8A729F3C5FC90', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/dojo.js', NULL, NULL, '2023-04-10 22:07:13.082', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DEC9676CCDE54663B355D17A2AA55959', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/svg.js', NULL, NULL, '2023-04-10 22:07:13.288', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('4F255BCE5BF74E0E8C97494A9098F1AC', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/flow_design.js', NULL, NULL, '2023-04-10 22:07:13.512', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('C41E2230688C4355A4AE3372C975D58E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/layer.css', NULL, NULL, '2023-04-10 22:07:13.715', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F6D0821A9117435BBA2AC16020D3486C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/select.gif', NULL, NULL, '2023-04-10 22:07:13.93', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('47601AAAD6964AF980ED58AEE76DEEF3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/down.png', NULL, NULL, '2023-04-10 22:07:14.13', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('DD8FEA4EE4234488BDE63B134236640D', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/drop-add.gif', NULL, NULL, '2023-04-10 22:07:14.339', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0E9A9B1C962442C1BCF0CD09FB9F71EC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/icon.css', NULL, NULL, '2023-04-10 22:07:16.335', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('CC8FDB7F3CFE42A984E4EC0DD0AD9F0B', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/jquery.easyui.min.js', NULL, NULL, '2023-04-10 22:07:16.569', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('3775341BB94449BFA1A6F20F5706F9F1', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/process-select.js', NULL, NULL, '2023-04-10 22:07:16.752', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('736630052CB648919E11F8314A5E0BD9', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/toolbar.main.css', NULL, NULL, '2023-04-10 22:07:16.957', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('A123478D1ABA4F79AC3E62D98915EFC7', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 22:07:17.179', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6C5E668CB41346F5B67EC13CAEACC281', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:07:17.383', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('B9F9EE28448947D69D61C36B146FDE14', NULL, NULL, NULL, NULL, NULL, NULL, '/system/User/initPortalInfo', NULL, NULL, '2023-04-10 22:07:17.638', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5FA0EE6D62A14D289978BDCEDEBC81EE', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/My97DatePicker/WdatePicker.js', NULL, NULL, '2023-04-10 22:07:17.893', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7CAD376ABB6F473DA3FD53A88525AAE3', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/_base.js', NULL, NULL, '2023-04-10 22:07:13.082', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('9B42C868BB4844B399CC769AC650D06E', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/graphic.js', NULL, NULL, '2023-04-10 22:07:13.288', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('521E6C4F03DD4AB5B3C13813ED8C26DA', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 22:07:13.493', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2251F5ADDFB4474EAEC1D0949B7E7D29', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/image/tree/folder.gif', NULL, NULL, '2023-04-10 22:07:13.722', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('53F08D6892464DCFAB151CB3652BF44C', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/start.png', NULL, NULL, '2023-04-10 22:07:13.93', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6DD28B7079E64B64B10EB79F99C905B9', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/images/bg.jpg', NULL, NULL, '2023-04-10 22:07:14.126', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('6F9BFFC9B43B403F8B188C766EC7C402', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/layout_arrows.png', NULL, NULL, '2023-04-10 22:07:14.335', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BB018194FD7C462E9245CE4DE5C3B5A6', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/jquery/jquery.min.js', NULL, NULL, '2023-04-10 22:07:16.335', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('297E5763300B418EB128D4DD29CFE1FC', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/js/grid.main.js', NULL, NULL, '2023-04-10 22:07:16.537', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('FE4695B796314E09A1DEFF8BC4A7D871', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/css/bootstrap.min.css', NULL, NULL, '2023-04-10 22:07:16.752', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D4626023EBA54ED9B05C3B98FD38FD59', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/code.css', NULL, NULL, '2023-04-10 22:07:16.955', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('79B56BD8753F42A5BCD8559B3509ED3E', NULL, NULL, NULL, NULL, NULL, NULL, '/comon/css/zTreeStyle/img/loading.gif', NULL, NULL, '2023-04-10 22:07:17.171', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0DD8C9E24F6C472E886DD2BA5C36A4AC', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/fonts/glyphicons-halflings-regular.woff2', NULL, NULL, '2023-04-10 22:07:17.904', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('1E0E79FBADAD47E1BC6E192FA4D988B5', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/shape.js', NULL, NULL, '2023-04-10 22:07:13.113', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('7AA29D8D7DE84538BC63B8CD998DE197', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/res/js/path.js', NULL, NULL, '2023-04-10 22:07:13.27', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D27BD41599AA4B5DB36423B6783B0431', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/js/main.dwr.js', NULL, NULL, '2023-04-10 22:07:13.523', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('D8993E3E000F4B6AB7F897D70FD2E5F1', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/laydate/default/laydate.css', NULL, NULL, '2023-04-10 22:07:13.712', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('2CE28217C3C6429AB582734F5CA15E19', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/left.png', NULL, NULL, '2023-04-10 22:07:13.93', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('0FEA97589CAE40F7B2313E98396B9E5A', NULL, NULL, NULL, NULL, NULL, NULL, '/flw/dwr/process_icons/forward.gif', NULL, NULL, '2023-04-10 22:07:14.11', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('F9950AB0D90F4F59A7BE7A0AF2E05A40', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/themes/default/images/panel_tools.png', NULL, NULL, '2023-04-10 22:07:14.355', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('10B354F4A7634536827DADDE006E645C', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/modules/layer/default/loading-2.gif', NULL, NULL, '2023-04-10 22:07:14.556', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('E2783F0EAEEA47108548E2AF91BE645E', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/css/layui.css', NULL, NULL, '2023-04-10 22:07:16.332', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('BA60AB9326774A7CA832DE04711A6FF2', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/jquery-easyui/locale/easyui-lang-zh_CN.js', NULL, NULL, '2023-04-10 22:07:16.587', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('5680061D8F5145AC8748BD256B38DDB7', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/layui/layui.js', NULL, NULL, '2023-04-10 22:07:16.737', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);
INSERT INTO "public"."sa_log" VALUES ('05ACA81311FA44B5A031F46622A3D0A3', NULL, NULL, NULL, NULL, NULL, NULL, '/resources/bootstrap/js/bootstrap.min.js', NULL, NULL, '2023-04-10 22:07:16.957', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'PSN01', 'system', '', '', '', '', 'ORG01', '管理员', '127.0.0.1', NULL, NULL, 0);

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
INSERT INTO "public"."sa_loginlog" VALUES ('0385ADC1A8974FB288ED0597C948B285', 'PSN01', 'system', '127.0.0.1', '2023-03-07 14:45:29.616', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('912195FBC97540F88285F7080AF8BB62', 'PSN01', 'system', '127.0.0.1', '2023-03-07 16:48:59.182', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('B313A2F4624B413D86A1874B511EE322', 'PSN01', 'system', '127.0.0.1', '2023-03-07 16:49:09.474', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('05E56A21254B4C1390FF9D5207296400', 'PSN01', 'system', '127.0.0.1', '2023-03-07 16:49:57.899', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('DE69B8B2DB1E44668F87AE5DF43BD3B4', 'PSN01', 'system', '127.0.0.1', '2023-03-07 16:53:21.111', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('B0826EAB7FD5446582131B97E57867F2', 'PSN01', 'system', '127.0.0.1', '2023-03-07 16:57:25.413', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('0282504A3B354B1AAA259D65FA1CF80C', 'PSN01', 'system', '127.0.0.1', '2023-03-07 17:26:50.225', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('A7E043857CE747F6B75328ED59D839F8', 'PSN01', 'system', '127.0.0.1', '2023-03-07 17:34:26.037', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('CFA6BA636E8C4393B291DD6B6F88D67C', 'PSN01', 'system', '127.0.0.1', '2023-03-07 17:40:36.8', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('9A3CC7F1C6ED400EACF4B5B9401254F6', 'PSN01', 'system', '127.0.0.1', '2023-03-07 17:43:59.595', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('A143BCCC7E92437FAF430436A3F78FAC', 'PSN01', 'system', '127.0.0.1', '2023-03-07 17:45:49.496', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('083B7A84659B4235A7805FF094CF2BE3', 'PSN01', 'system', '127.0.0.1', '2023-03-07 17:52:04.008', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('BE9CD38AC0424252A4C8DA8424FF6AC2', 'PSN01', 'system', '127.0.0.1', '2023-03-07 20:19:23.496', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.101.6', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('F001E2280E4C448794F12D183F716FB7', 'PSN01', 'system', '127.0.0.1', '2023-03-08 16:16:38.532', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期三', 4, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('DA209D62D20949F5B606DBD5CD97C90D', 'PSN01', 'system', '127.0.0.1', '2023-03-08 17:54:06.974', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期三', 4, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('6DE2534D61344CA1A6FCA083BFD2E3FD', 'PSN01', 'system', '127.0.0.1', '2023-03-09 10:22:52.2', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期四', 5, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('14C1D8843A544E15899C921D0729B77A', 'PSN01', 'system', '127.0.0.1', '2023-03-09 11:19:46.843', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期四', 5, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('FECAE15A4E7E47E3AA644FAF88943E3A', 'PSN01', 'system', '127.0.0.1', '2023-03-09 21:05:41.911', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.101.6', '星期四', 5, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('E5694AA1FEBA4DCBA39A009CAE18C45F', 'PSN01', 'system', '127.0.0.1', '2023-03-10 09:46:28.915', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.3.10', '星期五', 6, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('884D2F0637FD4899B2331F2BDBCA4D27', 'PSN01', 'system', '127.0.0.1', '2023-03-14 16:01:49.119', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.12.1', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('C1E3551971254813A08367454FD37D06', 'PSN01', 'system', '127.0.0.1', '2023-03-14 18:08:36.214', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.12.1', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('81A9D316DE9E438B8FB5AF13F3F81467', 'PSN01', 'system', '127.0.0.1', '2023-03-14 18:13:34.382', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.12.1', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('9EDFB38239254366A2548EABC05A52E9', 'DC349D31F5FE4113ABA2BBC06B1E42D7', 'test1', '127.0.0.1', '2023-03-14 18:14:30.986', 'Ù!@¦#$Ô%Ä^¦&¬*¨¥Ø¥ÔÕÖÑ«nÕ¨ªÚ¦¨¦Ø', '192.168.12.1', '星期二', 3, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('DCD071801BFF48669B08AEDEF04C38FE', 'PSN01', 'system', '127.0.0.1', '2023-03-15 14:30:33.266', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.12.1', '星期三', 4, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('7A3BAA3B18FD453397E04E3256E04574', 'PSN01', 'system', '127.0.0.1', '2023-03-20 15:23:38.436', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.12.1', '星期一', 2, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('0EAE3A2A557F4F9A9E329B46D38F2EBF', 'PSN01', 'system', '127.0.0.1', '2023-03-24 14:52:53.742', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.12.1', '星期五', 6, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('30AE40C869A74B288C1E430259C0B2AD', 'PSN01', 'system', '127.0.0.1', '2023-03-30 22:36:32.05', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.101.6', '星期四', 5, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('DED382FA20324E90860C578AF8BBB2A0', 'PSN01', 'system', '127.0.0.1', '2023-04-01 19:12:57.944', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.101.6', '星期六', 7, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('8CB284645D5C4AE2AEF0DC95E2ADE2AC', 'PSN01', 'system', '127.0.0.1', '2023-04-02 10:43:27.327', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.101.6', '星期日', 1, 0);
INSERT INTO "public"."sa_loginlog" VALUES ('97731128B0CD48C3AB5D399E44CF9B63', 'PSN01', 'system', '127.0.0.1', '2023-04-10 21:48:14.334', '×! @Ù#$¤%^¦&«*ÕØq¢«¥¤ÐÙ¥¬ÔªÒ­m¨¬Õ', '192.168.101.6', '星期一', 2, 0);

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
INSERT INTO "public"."sa_onlineinfo" VALUES ('B35CCBEDAE13477DBA67E3CA17C290DA', 'PSN01', 'system', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '127.0.0.1', '2023-04-10 21:48:14.275', '4f3ebd24-9278-410c-8eb0-e884f6a49529', '192.168.101.6', '7369E45CC1A1BB8F1D245F1CA205F549', 0);

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
INSERT INTO "public"."sa_opmanagement" VALUES ('8F337CFD667F446CBAAAB451C3695C17', 'PSN01@ORG01', 'system', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '5979D9B4A264438C84054F540CB7F032', '测试机构', '/5979D9B4A264438C84054F540CB7F032.ogn', '/测试机构', 'systemManagement', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2023-03-24 17:46:32.36', 0);
INSERT INTO "public"."sa_opmanagement" VALUES ('4A4DF0AAAC874104B72D7FC3E2B29600', 'PSN01@ORG01', 'system', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'ORG01', '管理员', '/ORG01.ogn', '/管理员', 'systemManagement', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2023-03-24 17:46:35.458', 0);

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
INSERT INTO "public"."sa_opmenutree" VALUES ('E316E4AC20544555840E4F25535CCC4D', 'account', 'DashboardOutlined', 'DashboardOutlined', '/account', NULL, NULL, 'hide', NULL, NULL, NULL, 0, 'account', 'account', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('A4A6236099464082BB1ED5270EB64804', '个人中心', 'DashboardOutlined', 'DashboardOutlined', '/account/center', NULL, NULL, 'hide', NULL, NULL, 'E316E4AC20544555840E4F25535CCC4D', 1, 'account-center', 'account-center', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('4D537DDA3E3B4CFEA192A981BDC5B266', '分析页', 'DashboardOutlined', 'DashboardOutlined', '/dashboard/console', NULL, NULL, NULL, NULL, NULL, '5C027D8A8B074441923D6C3D5530555C', 1, 'dashboard-console', 'console', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('D57EE339F5AE494FBCEC1E325B5E5FEE', '工作台', 'DashboardOutlined', 'DashboardOutlined', '/dashboard/workspace', NULL, NULL, NULL, NULL, NULL, '5C027D8A8B074441923D6C3D5530555C', 2, 'dashboard-workspace', 'workspace', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('A0446547A3684727A1DBD1A05E8A799C', '基础表单', 'DatabaseOutlined', 'DatabaseOutlined', '/form/baseForm', NULL, NULL, NULL, NULL, NULL, '41103463A6744853BFE32F26BC3D7EA0', 1, 'base-form', 'base-form', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('F1F34234AA12430BACF128E0689E2622', '高级表单', 'DatabaseOutlined', 'DatabaseOutlined', '/form/moreForm', NULL, NULL, NULL, NULL, NULL, '41103463A6744853BFE32F26BC3D7EA0', 2, 'more-form', 'more-form', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('D00BED3BCFC648C59F8A2EA716118717', '分步表单', 'DatabaseOutlined', 'DatabaseOutlined', '/form/stepForm', NULL, NULL, NULL, NULL, NULL, '41103463A6744853BFE32F26BC3D7EA0', 3, 'step-form', 'step-form', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('DFAC4983AE14411CAE7200A7B025713C', '404', 'DatabaseOutlined', 'DatabaseOutlined', '/error/404', '', '', '', NULL, NULL, '91AE4D6AA06446CC9543AD0D51A291F6', 2, 'error-404', 'error-404', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('337D6618FBB64291A0EA7A577F144521', '500', 'DatabaseOutlined', 'DatabaseOutlined', '/error/500', '', '', '', 'null', 'null', '91AE4D6AA06446CC9543AD0D51A291F6', 3, 'error-500', 'error-500', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('759D35AFC1EB438BB2B2E122F83CD763', '授权管理', 'DatabaseOutlined', 'DatabaseOutlined', '/system/authorManage', '/SA/role/authorManageProcess', 'mainActivity', '', 'null', 'null', 'sysfun', 4, 'authorManage', 'authorManage', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('sysmenus', '菜单设置', 'DatabaseOutlined', 'DatabaseOutlined', '/system/sysMenu', '/SA/functionTree/process', 'mainActivity', NULL, NULL, NULL, 'sysfun', 1, 'sysMenu', 'sysMenu', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('5C027D8A8B074441923D6C3D5530555C', '工作空间', 'HomeOutlined', 'HomeOutlined', '/dashboard', '', '', '', NULL, NULL, '', 1, 'dashboard', 'dashboard', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('sysognzation', '机构管理', 'DatabaseOutlined', 'DatabaseOutlined', '/system/organization', '/SA/organization/organizationProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 2, 'organization', 'organization', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('sysrolem', '角色管理', 'DatabaseOutlined', 'DatabaseOutlined', '/system/roleManage', '/SA/role/roleProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 3, 'roleManage', 'roleManage', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('41103463A6744853BFE32F26BC3D7EA0', '表单页面', 'FormOutlined', 'FormOutlined', '/form', '', '', '', NULL, NULL, '', 2, 'form', 'form', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('6898A59107BC4E388A2D8F057AE4E857', '列表页面', 'UnorderedListOutlined', 'UnorderedListOutlined', '/list', '', '', '', NULL, NULL, '', 3, 'list', 'list', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('sysfun', '系统管理', 'SettingOutlined', 'SettingOutlined', '/system', '', '', '', '', '', '', 100, 'system', 'system', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('16C7EF0E65EA4683BFCAD11BB9B717CF', '基础列表', 'DatabaseOutlined', 'DatabaseOutlined', '/list/baseList', '', '', '', NULL, NULL, '6898A59107BC4E388A2D8F057AE4E857', 1, 'base-list', 'base-list', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('E8B707468AF14D099A19843EFCA597E8', '卡片列表', 'DatabaseOutlined', 'DatabaseOutlined', '/list/cardList', '', '', '', NULL, NULL, '6898A59107BC4E388A2D8F057AE4E857', 2, 'card-list', 'card-list', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('44DAA56DDDCB44339EE9718E79B35214', '图文列表', 'DatabaseOutlined', 'DatabaseOutlined', '/list/newsList', '', '', '', NULL, NULL, '6898A59107BC4E388A2D8F057AE4E857', 3, 'news-list', 'news-list', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('8EB2FDB9C11D49E781B75374E5F48B49', '查询表格', 'DatabaseOutlined', 'DatabaseOutlined', '/list/tableList', '', '', '', NULL, NULL, '6898A59107BC4E388A2D8F057AE4E857', 4, 'table-list', 'table-list', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('CE4E91608F3E4AC4A0A2D206D6D65A8B', '结果页面', 'TagOutlined', 'TagOutlined', '/result', '', '', '', NULL, NULL, '', 4, 'result-menu', 'result-menu', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('FB103B23EF0E4D698DDFCEF228A1EB7B', '成功', 'DatabaseOutlined', 'DatabaseOutlined', '/result/success', '', '', '', NULL, NULL, 'CE4E91608F3E4AC4A0A2D206D6D65A8B', 1, 'result-success', 'result-success', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('41663E4FCF5149358F30056A56A4797F', '失败', 'DatabaseOutlined', 'DatabaseOutlined', '/result/failure', '', '', '', NULL, NULL, 'CE4E91608F3E4AC4A0A2D206D6D65A8B', 2, 'result-failure', 'result-failure', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('28DD3BE201134F3089924D050AED2D22', '警告', 'DatabaseOutlined', 'DatabaseOutlined', '/result/warning', '', '', '', NULL, NULL, 'CE4E91608F3E4AC4A0A2D206D6D65A8B', 3, 'result-warning', 'result-warning', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('1E9A00C2F9D4409D96597C40B9EA8571', '详情', 'DatabaseOutlined', 'DatabaseOutlined', '/result/info', '', '', '', NULL, NULL, 'CE4E91608F3E4AC4A0A2D206D6D65A8B', 4, 'result-info', 'result-info', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('91AE4D6AA06446CC9543AD0D51A291F6', '错误页面', 'StopOutlined', 'StopOutlined', '/error', '', '', '', NULL, NULL, '', 5, 'error', 'error', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('89F94C93D75549DEBDF33190828721EE', '403', 'DatabaseOutlined', 'DatabaseOutlined', '/error/403', '', '', '', NULL, NULL, '91AE4D6AA06446CC9543AD0D51A291F6', 1, 'error-403', 'error-403', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('27BD1F45508B49F4B11918F91E14E316', '权限管理', 'DatabaseOutlined', 'DatabaseOutlined', '/system/manageMeant', '/SA/manageMeantProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 5, 'manageMeant', 'manageMeant', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('8EC0FF9DB10549B0898B8F7CD4E6C6F2', '回收站', 'DatabaseOutlined', 'DatabaseOutlined', '/system/recycle', '/SA/recycleProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 9, 'recycle', 'recycle', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('5316BC0BC6374BAD9E50E164C0D4192A', '系统日志', 'DatabaseOutlined', 'DatabaseOutlined', '/SA/log/sysLog', '/SA/sysLogProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 6, 'sysLog', 'sysLog', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('383DFCD37CF142F8A22EE5BC517A3A1D', '文档配置', NULL, NULL, '/docManage/docSetting', '/doc/docSettingProcess', 'mainActivity', NULL, NULL, NULL, '7072717E0CB543A8876DA4B7282A07C6', 1, 'docSetting', 'docSetting', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('7072717E0CB543A8876DA4B7282A07C6', '文档管理', 'ContainerOutlined', 'ContainerOutlined', '/docManage', NULL, NULL, NULL, NULL, NULL, NULL, 6, 'docManage', 'docManage', 0);

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
INSERT INTO "public"."sa_oppermission" VALUES ('C125D8F974C24679AE3EF0FA01BB554B', 'RL01', '1E9A00C2F9D4409D96597C40B9EA8571', '', '详情', '', NULL, NULL, NULL, 0, '详情', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('3A9A0AC071BB4C318171DEA98F522D05', 'RL01', '91AE4D6AA06446CC9543AD0D51A291F6', '', '错误页面', '', NULL, NULL, NULL, 0, '错误页面', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('F12D89C435B940C6AD1EB52D15925B6A', 'RL01', '89F94C93D75549DEBDF33190828721EE', '', '403', '', NULL, NULL, NULL, 0, '403', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('611E0CF5BF9A4B4CABF3F4E9D1EED049', 'RL01', 'DFAC4983AE14411CAE7200A7B025713C', '', '404', '', NULL, NULL, NULL, 0, '404', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('76E793E81E55458AA6859CEDC931C377', 'RL01', '41663E4FCF5149358F30056A56A4797F', '', '失败', '', NULL, NULL, NULL, 0, '失败', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('1D61F2FA4A904BE6B8F360FD631AEB7B', 'RL01', '8EC0FF9DB10549B0898B8F7CD4E6C6F2', '/SA/recycleProcess', '回收站', 'mainActivity', NULL, NULL, NULL, 0, '回收站', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('2BB27622E99C4E3899EB1D69E60807A4', 'RL01', '5316BC0BC6374BAD9E50E164C0D4192A', '/SA/sysLogProcess', '系统日志', 'mainActivity', NULL, NULL, NULL, 0, '系统日志', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('6D015AC0DA394999B84B02C08AC5A793', 'RL01', 'A4A6236099464082BB1ED5270EB64804', NULL, '个人中心', NULL, NULL, NULL, NULL, 0, '个人中心', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('B026D4417B0D4ABD85674DC44DA23D24', 'RL01', '5C027D8A8B074441923D6C3D5530555C', '', '工作空间', '', NULL, NULL, NULL, 0, '工作空间', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('14A8F9AA09384CEB9B72ECF88EE6CB9A', 'RL01', '4D537DDA3E3B4CFEA192A981BDC5B266', NULL, '分析页', NULL, NULL, NULL, NULL, 0, '分析页', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('8B08E09980B34F0F8AC37864A0605478', 'RL01', 'D57EE339F5AE494FBCEC1E325B5E5FEE', NULL, '工作台', NULL, NULL, NULL, NULL, 0, '工作台', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('A823E42657A24BDEBEE22FC769A9B624', 'RL01', '41103463A6744853BFE32F26BC3D7EA0', '', '表单页面', '', NULL, NULL, NULL, 0, '表单页面', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('2FCD2116292C4ED48FCB0A058A512C85', 'RL01', 'A0446547A3684727A1DBD1A05E8A799C', NULL, '基础表单', NULL, NULL, NULL, NULL, 0, '基础表单', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('76C646D8DDE14CB29D47ECFABA7F04E3', 'RL01', 'sysfun', '', '系统管理', '', NULL, NULL, NULL, 0, '系统管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('F352FB8AF5B5478788A2AA26F7C84849', 'RL01', 'F1F34234AA12430BACF128E0689E2622', NULL, '高级表单', NULL, NULL, NULL, NULL, 0, '高级表单', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('619E3A3326A1437ABC1A8E00EC4C9674', 'RL01', 'E8B707468AF14D099A19843EFCA597E8', '', '卡片列表', '', NULL, NULL, NULL, 0, '卡片列表', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('0AD70B6BBF5B4C15B3BAAEEC5D329532', 'RL01', '44DAA56DDDCB44339EE9718E79B35214', '', '图文列表', '', NULL, NULL, NULL, 0, '图文列表', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('48A345AC10F0485684949374AD7EADE5', 'RL01', '8EB2FDB9C11D49E781B75374E5F48B49', '', '查询表格', '', NULL, NULL, NULL, 0, '查询表格', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('09EE542F0C6C4D9B8007F7F5496DD637', 'RL01', 'CE4E91608F3E4AC4A0A2D206D6D65A8B', '', '结果页面', '', NULL, NULL, NULL, 0, '结果页面', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('AFA6FD70DA1B475D926DCF2F2E671CF0', 'RL01', 'FB103B23EF0E4D698DDFCEF228A1EB7B', '', '成功', '', NULL, NULL, NULL, 0, '成功', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('F93F1B21AD184A97AE7D749A29185A4F', 'RL01', '16C7EF0E65EA4683BFCAD11BB9B717CF', '', '基础列表', '', NULL, NULL, NULL, 0, '基础列表', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('589B90ED7B4843BD9CD2FD1EE444EB78', 'RL01', '337D6618FBB64291A0EA7A577F144521', '', '500', '', NULL, NULL, NULL, 0, '500', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('16E384E9A8C84A888FD9F4221412E078', 'RL01', 'sysmenus', '/SA/functionTree/process', '菜单设置', 'mainActivity', NULL, NULL, NULL, 0, '菜单设置', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('15B57007135848A6BA9BE7C6B5E969F8', 'RL01', 'sysognzation', '/SA/organization/organizationProcess', '机构管理', 'mainActivity', NULL, NULL, NULL, 0, '机构管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('09CCE2452D844847BC69B4EE34C07CF2', 'RL01', 'sysrolem', '/SA/role/roleProcess', '角色管理', 'mainActivity', NULL, NULL, NULL, 0, '角色管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('32229A11012040E3BD7AF8012A7B8B7C', 'RL01', '759D35AFC1EB438BB2B2E122F83CD763', '/SA/role/authorManageProcess', '授权管理', 'mainActivity', NULL, NULL, NULL, 0, '授权管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('CE01BD0E0646458DB5B027E87A463DA7', 'RL01', '27BD1F45508B49F4B11918F91E14E316', '/SA/manageMeantProcess', '权限管理', 'mainActivity', NULL, NULL, NULL, 0, '权限管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('8B8876D645D04759AB01F5FFAB9BB33D', 'RL01', 'E316E4AC20544555840E4F25535CCC4D', NULL, 'account', NULL, NULL, NULL, NULL, 0, 'account', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('D5662F301B7A4310A15CCCF234D8C594', 'RL01', 'D00BED3BCFC648C59F8A2EA716118717', NULL, '分步表单', NULL, NULL, NULL, NULL, 0, '分步表单', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('77C940C8C1044EB9B7279C4C738E270B', 'RL01', '6898A59107BC4E388A2D8F057AE4E857', '', '列表页面', '', NULL, NULL, NULL, 0, '列表页面', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('710970CC13B6491FB9013019C2616324', 'RL01', '383DFCD37CF142F8A22EE5BC517A3A1D', '/doc/docSettingProcess', '文档配置', 'mainActivity', NULL, NULL, NULL, 0, '文档配置', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('ED9348734D66443E9F97D39B63CC4AC1', 'RL01', '7072717E0CB543A8876DA4B7282A07C6', NULL, '文档管理', NULL, NULL, NULL, NULL, 0, '文档管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('274FEF3977E94D1EA0E7F4D09603C84F', 'RL01', '28DD3BE201134F3089924D050AED2D22', '', '警告', '', NULL, NULL, NULL, 0, '警告', 1, 1, 0);

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
-- Table structure for sa_task
-- ----------------------------
DROP TABLE IF EXISTS "public"."sa_task";
CREATE TABLE "public"."sa_task" (
  "sid" varchar(36) COLLATE "pg_catalog"."default" NOT NULL,
  "sparentid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scontent" text COLLATE "pg_catalog"."default",
  "sremark" text COLLATE "pg_catalog"."default",
  "sflowid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "stypeid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "stypename" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "simportanceid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "simportancename" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "semergencyid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "semergencyname" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sprocess" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sactivity" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "screatetime" timestamp(6),
  "sdistributetime" timestamp(6),
  "slastmodifytime" timestamp(6),
  "swarningtime" timestamp(6),
  "slimittime" timestamp(6),
  "sestarttime" timestamp(6),
  "sefinishtime" timestamp(6),
  "sastarttime" timestamp(6),
  "safinishtime" timestamp(6),
  "sexecutetime" timestamp(6),
  "scpersonid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scpersonname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scdeptid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scdeptname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scognid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scognname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sepersonid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sepersonname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sedeptid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sedeptname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "seognid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "seognname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scustomerid" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scustomername" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sprojectid" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sprojectname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "splanid" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "splanname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "svariable" text COLLATE "pg_catalog"."default",
  "sfake" varchar(8) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sactive" varchar(8) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "slock" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sstatusid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sstatusname" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "version" int4,
  "saiid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scatalogid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "skindid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "saiactive" varchar(8) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "saistatusid" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "saistatusname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ssourceid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scurl" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "seurl" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sexecutemode" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sexecutemode2" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "spreemptmode" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ssequence" int4,
  "scpersoncode" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scposid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scposcode" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scposname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scdeptcode" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scogncode" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scfid" varchar(1024) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sepersoncode" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "seposid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "seposcode" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "seposname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sedeptcode" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "seogncode" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sefid" varchar(1024) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sexecutornames" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sresponsible" varchar(8) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "scustomercode" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sprojectcode" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "splancode" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sdata1" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sdata2" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sdata3" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sdata4" varchar(128) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sworktime" int4,
  "scfname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sefname" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "shints" varchar(1024) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sshortcut" varchar(1024) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sfrontid" varchar(36) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sfmakername" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;

-- ----------------------------
-- Records of sa_task
-- ----------------------------

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
CREATE UNIQUE INDEX "idx_sa_flowdrawlg_sprocessid" ON "public"."sa_flowdrawlg" USING btree (
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
