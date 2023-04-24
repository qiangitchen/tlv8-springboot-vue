/*
 Navicat Premium Data Transfer

 Source Server         : 开发云postgresql
 Source Server Type    : PostgreSQL
 Source Server Version : 100017
 Source Host           : dev.tlv8.com:5432
 Source Catalog        : tlv8-vue
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 100017
 File Encoding         : 65001

 Date: 24/04/2023 12:29:54
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
INSERT INTO "public"."doc_index" VALUES (46);

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
INSERT INTO "public"."sa_opmenutree" VALUES ('AFDEF15E8D7B4EC89446C68CF73D5B0D', '流程管理', 'AntDesignOutlined', 'AntDesignOutlined', '/flowManager', NULL, NULL, NULL, NULL, NULL, NULL, 99, 'flowManager', 'flowManager', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('412181B528E545F0B8D9EE3CF312DF98', '流程设计', NULL, NULL, '/flowManager/flowDesign', '/flowDesign/process', 'mainActivity', NULL, NULL, NULL, 'AFDEF15E8D7B4EC89446C68CF73D5B0D', 9, 'flowDesigner', 'flowDesigner', 0);
INSERT INTO "public"."sa_opmenutree" VALUES ('0B5307D27B7E41AA9D9D7552F4E97D61', '文档中心', NULL, NULL, '/docManage/docCenter', '/doc/docCenter/process', 'mainActivity', NULL, NULL, NULL, '7072717E0CB543A8876DA4B7282A07C6', 2, 'docCenter', 'docCenter', 0);

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
INSERT INTO "public"."sa_oppermission" VALUES ('6D015AC0DA394999B84B02C08AC5A793', 'RL01', 'A4A6236099464082BB1ED5270EB64804', NULL, '个人中心', NULL, NULL, NULL, NULL, 0, '个人中心', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('B026D4417B0D4ABD85674DC44DA23D24', 'RL01', '5C027D8A8B074441923D6C3D5530555C', '', '工作空间', '', NULL, NULL, NULL, 0, '工作空间', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('14A8F9AA09384CEB9B72ECF88EE6CB9A', 'RL01', '4D537DDA3E3B4CFEA192A981BDC5B266', NULL, '分析页', NULL, NULL, NULL, NULL, 0, '分析页', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('8B08E09980B34F0F8AC37864A0605478', 'RL01', 'D57EE339F5AE494FBCEC1E325B5E5FEE', NULL, '工作台', NULL, NULL, NULL, NULL, 0, '工作台', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('A823E42657A24BDEBEE22FC769A9B624', 'RL01', '41103463A6744853BFE32F26BC3D7EA0', '', '表单页面', '', NULL, NULL, NULL, 0, '表单页面', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('2FCD2116292C4ED48FCB0A058A512C85', 'RL01', 'A0446547A3684727A1DBD1A05E8A799C', NULL, '基础表单', NULL, NULL, NULL, NULL, 0, '基础表单', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('76C646D8DDE14CB29D47ECFABA7F04E3', 'RL01', 'sysfun', '', '系统管理', '', NULL, NULL, NULL, 0, '系统管理', 1, 1, 0);
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
INSERT INTO "public"."sa_oppermission" VALUES ('274FEF3977E94D1EA0E7F4D09603C84F', 'RL01', '28DD3BE201134F3089924D050AED2D22', '', '警告', '', NULL, NULL, NULL, 0, '警告', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('8844382D546F42D78F83B0E85CE24818', 'RL01', '412181B528E545F0B8D9EE3CF312DF98', '/flowDesign/process', '流程设计', 'mainActivity', NULL, NULL, NULL, 0, '流程设计', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('8973A87FA6344748B8D2C4DF55440A88', 'RL01', 'AFDEF15E8D7B4EC89446C68CF73D5B0D', NULL, '流程管理', NULL, NULL, NULL, NULL, 0, '流程管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('25E76761EEFC4AED9357173FCB955189', 'RL01', '0B5307D27B7E41AA9D9D7552F4E97D61', '/doc/docCenter/process', '文档中心', 'mainActivity', NULL, NULL, NULL, 0, '文档中心', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('ED9348734D66443E9F97D39B63CC4AC1', 'RL01', '7072717E0CB543A8876DA4B7282A07C6', NULL, '文档管理', NULL, NULL, NULL, NULL, 0, '文档管理', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('C125D8F974C24679AE3EF0FA01BB554B', 'RL01', '1E9A00C2F9D4409D96597C40B9EA8571', '', '详情', '', NULL, NULL, NULL, 0, '详情', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('3A9A0AC071BB4C318171DEA98F522D05', 'RL01', '91AE4D6AA06446CC9543AD0D51A291F6', '', '错误页面', '', NULL, NULL, NULL, 0, '错误页面', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('F12D89C435B940C6AD1EB52D15925B6A', 'RL01', '89F94C93D75549DEBDF33190828721EE', '', '403', '', NULL, NULL, NULL, 0, '403', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('611E0CF5BF9A4B4CABF3F4E9D1EED049', 'RL01', 'DFAC4983AE14411CAE7200A7B025713C', '', '404', '', NULL, NULL, NULL, 0, '404', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('76E793E81E55458AA6859CEDC931C377', 'RL01', '41663E4FCF5149358F30056A56A4797F', '', '失败', '', NULL, NULL, NULL, 0, '失败', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('1D61F2FA4A904BE6B8F360FD631AEB7B', 'RL01', '8EC0FF9DB10549B0898B8F7CD4E6C6F2', '/SA/recycleProcess', '回收站', 'mainActivity', NULL, NULL, NULL, 0, '回收站', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('2BB27622E99C4E3899EB1D69E60807A4', 'RL01', '5316BC0BC6374BAD9E50E164C0D4192A', '/SA/sysLogProcess', '系统日志', 'mainActivity', NULL, NULL, NULL, 0, '系统日志', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('F352FB8AF5B5478788A2AA26F7C84849', 'RL01', 'F1F34234AA12430BACF128E0689E2622', NULL, '高级表单', NULL, NULL, NULL, NULL, 0, '高级表单', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('619E3A3326A1437ABC1A8E00EC4C9674', 'RL01', 'E8B707468AF14D099A19843EFCA597E8', '', '卡片列表', '', NULL, NULL, NULL, 0, '卡片列表', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('0AD70B6BBF5B4C15B3BAAEEC5D329532', 'RL01', '44DAA56DDDCB44339EE9718E79B35214', '', '图文列表', '', NULL, NULL, NULL, 0, '图文列表', 1, 1, 0);
INSERT INTO "public"."sa_oppermission" VALUES ('48A345AC10F0485684949374AD7EADE5', 'RL01', '8EB2FDB9C11D49E781B75374E5F48B49', '', '查询表格', '', NULL, NULL, NULL, 0, '查询表格', 1, 1, 0);

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
-- Primary Key structure for table oa_leave
-- ----------------------------
ALTER TABLE "public"."oa_leave" ADD CONSTRAINT "oa_leave_pkey" PRIMARY KEY ("fid");

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
