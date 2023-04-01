CREATE TABLE doc_admin
(
    fid     VARCHAR(32) NOT NULL,
    fleve   int,
    fname   VARCHAR(500),
    version int
);
alter table doc_admin
    add primary key (fid);

CREATE TABLE doc_author
(
    fid     VARCHAR(32) NOT NULL,
    fuserid VARCHAR(32),
    famleve int,
    version int
);
alter table doc_author
    add primary key (FID);

CREATE TABLE doc_docpath
(
    fid       VARCHAR(32) NOT NULL,
    ffileid   VARCHAR(32),
    ffilepath VARCHAR(200),
    ffilesize FLOAT,
    fversion  int,
    faddtime  timestamp,
    version   int
);
alter table doc_docpath
    add primary key (fid);
alter table doc_docpath
    add unique (ffileid);

CREATE TABLE doc_document
(
    fid         VARCHAR(32) NOT NULL,
    fdocid      VARCHAR(32),
    fdocname    VARCHAR(1000),
    fextname    VARCHAR(100),
    fdocsize    FLOAT,
    fdoctype    VARCHAR(100),
    faddtime    timestamp,
    fupdatetime timestamp,
    version     int
);
alter table doc_document
    add primary key (fid);
alter table doc_document
    add unique (fdocid);

CREATE TABLE doc_index
(
    fmax bigint
);

CREATE TABLE doc_log
(
    fid      VARCHAR(32) NOT NULL,
    fuserid  VARCHAR(32),
    faddtime timestamp,
    faction  VARCHAR(100),
    fmessage text,
    version  int
);

alter table doc_log
    add primary key (fid);

CREATE TABLE doc_pathindex
(
    fdocpath VARCHAR(200),
    fmax     int
);


CREATE TABLE doc_result
(
    resultid      VARCHAR(500),
    resultcontent text
);

CREATE TABLE doc_user
(
    fid       VARCHAR(32) NOT NULL,
    floginid  VARCHAR(100),
    fusername VARCHAR(100),
    fenable   int,
    version   int
);
alter table doc_user
    add primary key (fid);


CREATE TABLE sa_onlineinfo
(
    sid          varchar(32) NOT NULL,
    suserid      varchar(36)   DEFAULT NULL,
    susername    varchar(100)  DEFAULT NULL,
    suserfid     varchar(1024) DEFAULT NULL,
    suserfname   varchar(1024) DEFAULT NULL,
    sloginip     varchar(100)  DEFAULT NULL,
    slogindate   timestamp     DEFAULT NULL,
    ssessionid   varchar(100)  DEFAULT NULL,
    sserviceip   varchar(100)  DEFAULT NULL,
    version      int           DEFAULT NULL,
    smachinecode varchar(100)  DEFAULT NULL,
    PRIMARY KEY (sid)
);
CREATE INDEX sa_onlineinfo_ssessionid on sa_onlineinfo (ssessionid);
CREATE INDEX sa_onlineinfo_sserviceip on sa_onlineinfo (sserviceip);

CREATE TABLE sa_opperson
(
    sid                 varchar(36) NOT NULL,
    sname               varchar(64) NOT NULL,
    scode               varchar(64) NOT NULL,
    sidcard             varchar(36)   DEFAULT NULL,
    snumb               int         NOT NULL,
    sloginname          varchar(64)   DEFAULT NULL,
    spassword           varchar(64)   DEFAULT NULL,
    spasswordtimelimit  int           DEFAULT NULL,
    spasswordmodifytime timestamp     DEFAULT NULL,
    smainorgid          varchar(36) NOT NULL,
    ssafelevelid        varchar(36)   DEFAULT NULL,
    ssequence           int           DEFAULT NULL,
    svalidstate         int           DEFAULT NULL,
    sdescription        varchar(2048) DEFAULT NULL,
    ssex                varchar(8)    DEFAULT NULL,
    sbirthday           timestamp     DEFAULT NULL,
    sjoindate           timestamp     DEFAULT NULL,
    shomeplace          varchar(64)   DEFAULT NULL,
    sdegree             varchar(16)   DEFAULT NULL,
    sgraduateschool     varchar(128)  DEFAULT NULL,
    sspeciality         varchar(128)  DEFAULT NULL,
    sschoollength       varchar(16)   DEFAULT NULL,
    stitle              varchar(64)   DEFAULT NULL,
    smarriage           varchar(16)   DEFAULT NULL,
    scardno             varchar(36)   DEFAULT NULL,
    scardkind           varchar(64)   DEFAULT NULL,
    sfamilyaddress      varchar(255)  DEFAULT NULL,
    szip                varchar(16)   DEFAULT NULL,
    smsn                varchar(64)   DEFAULT NULL,
    sqq                 varchar(36)   DEFAULT NULL,
    smail               varchar(64)   DEFAULT NULL,
    smobilephone        varchar(36)   DEFAULT NULL,
    sfamilyphone        varchar(36)   DEFAULT NULL,
    sofficephone        varchar(36)   DEFAULT NULL,
    sphoto              bytea,
    scountry            varchar(64)   DEFAULT NULL,
    sprovince           varchar(64)   DEFAULT NULL,
    scity               varchar(64)   DEFAULT NULL,
    spositions          varchar(64)   DEFAULT NULL,
    sschool             varchar(64)   DEFAULT NULL,
    sstudy              varchar(64)   DEFAULT NULL,
    senglishname        varchar(128)  DEFAULT NULL,
    fcasn               varchar(100)  DEFAULT NULL,
    fsignm              varchar(100)  DEFAULT NULL,
    version             int           DEFAULT NULL,
    PRIMARY KEY (sid)
);
CREATE INDEX idx_opperson_scode on sa_opperson (scode);
CREATE INDEX idx_opperson_smainorgid on sa_opperson (smainorgid);
CREATE INDEX xmsgindexmessagesvalidstate on sa_opperson (svalidstate);

CREATE TABLE sa_opperson_deatail
(
    sid          varchar(36) NOT NULL,
    spersonid    varchar(36)  DEFAULT NULL,
    stype        varchar(500) DEFAULT NULL,
    ssquns       varchar(500) DEFAULT NULL,
    scode        varchar(500) DEFAULT NULL,
    sname        varchar(500) DEFAULT NULL,
    sremark      varchar(500) DEFAULT NULL,
    sclass       varchar(500) DEFAULT NULL,
    supdatedate  timestamp NULL DEFAULT NULL,
    supdatorid   varchar(36)  DEFAULT NULL,
    supdatorname varchar(255) DEFAULT NULL,
    version      int          DEFAULT NULL,
    PRIMARY KEY (sid)
);

CREATE TABLE sa_oporg
(
    sid          varchar(100)  NOT NULL,
    sname        varchar(128)  NOT NULL,
    scode        varchar(64)   NOT NULL,
    slongname    varchar(255)  DEFAULT NULL,
    sfname       varchar(1024) DEFAULT NULL,
    sfcode       varchar(2048) DEFAULT NULL,
    sfid         varchar(1024) NOT NULL,
    sorgkindid   varchar(5)    NOT NULL,
    svalidstate  int           DEFAULT NULL,
    sparent      varchar(100)  DEFAULT NULL,
    slevel       int           DEFAULT NULL,
    sphone       varchar(64)   DEFAULT NULL,
    sfax         varchar(64)   DEFAULT NULL,
    saddress     varchar(255)  DEFAULT NULL,
    szip         varchar(16)   DEFAULT NULL,
    sdescription varchar(1024) DEFAULT NULL,
    spersonid    varchar(32)   DEFAULT NULL,
    snodekind    varchar(32)   DEFAULT NULL,
    version      int           NOT NULL,
    sshowname    varchar(100)  DEFAULT NULL,
    ssequence    int           DEFAULT 1,
    PRIMARY KEY (sid)
);
CREATE INDEX idx_sa_oporg_sfid on sa_oporg (sfid);
CREATE INDEX idx_oporg_code on sa_oporg (scode);
CREATE INDEX idx_sa_oporg_sorgkindid on sa_oporg (sorgkindid);
CREATE INDEX idx_sa_oporg_sparent on sa_oporg (sparent);
CREATE INDEX idx_sa_oporg_spersonid on sa_oporg (spersonid);

CREATE TABLE sa_oprole
(
    sid               varchar(32) NOT NULL,
    sname             varchar(255),
    scode             varchar(32),
    scatalog          varchar(128),
    srolekind         varchar(32),
    sparentrolesnames varchar(512),
    sdescription      varchar(1024),
    ssequence         int,
    svalidstate       int,
    version           int         NOT NULL,
    PRIMARY KEY (sid)
);
CREATE INDEX idx_oprole_code on sa_oprole (scode);

CREATE TABLE sa_oppermission
(
    sid               varchar(32) NOT NULL,
    spermissionroleid varchar(32) NOT NULL,
    smenuid           varchar(32) NOT NULL,
    sprocess          varchar(1024) DEFAULT NULL,
    sactivityfname    varchar(1024) DEFAULT NULL,
    sactivity         varchar(1024) DEFAULT NULL,
    sactionsnames     text,
    sactions          text,
    ssemanticdp       varchar(2048) DEFAULT NULL,
    spermissionkind   int           DEFAULT NULL,
    sdescription      varchar(1024) DEFAULT NULL,
    ssequence         int           DEFAULT NULL,
    svalidstate       int           DEFAULT NULL,
    version           int         NOT NULL,
    PRIMARY KEY (sid)
);
CREATE INDEX idx_opperm_roleid on sa_oppermission (spermissionroleid);
CREATE INDEX idx_opperm_smenuid on sa_oppermission (smenuid);
CREATE INDEX idx_opperm_activity on sa_oppermission (sactivity);
CREATE INDEX idx_opperm_process on sa_oppermission (sprocess);

CREATE TABLE sa_opauthorize
(
    sid              varchar(100) NOT NULL,
    sorgid           varchar(65)   DEFAULT NULL,
    sorgname         varchar(255)  DEFAULT NULL,
    sorgfid          varchar(2048) DEFAULT NULL,
    sorgfname        varchar(2048) DEFAULT NULL,
    sauthorizeroleid varchar(32)   DEFAULT NULL,
    sdescription     varchar(1024) DEFAULT NULL,
    screatorfid      varchar(2048) DEFAULT NULL,
    screatorfname    varchar(2048) DEFAULT NULL,
    screatetime      timestamp     DEFAULT NULL,
    srolelevel       varchar(100)  DEFAULT NULL,
    version          int           DEFAULT NULL,
    PRIMARY KEY (sid)
);
CREATE INDEX idx_opauth_roleid on sa_opauthorize (sauthorizeroleid);

CREATE TABLE sa_loginlog
(
    sid        varchar(32) NOT NULL,
    suserid    varchar(36)  DEFAULT NULL,
    susername  varchar(100) DEFAULT NULL,
    sloginip   varchar(100) DEFAULT NULL,
    slogintime timestamp    DEFAULT NULL,
    password   varchar(100) DEFAULT NULL,
    sserviceip varchar(100) DEFAULT NULL,
    sday       varchar(100) DEFAULT NULL,
    sdaynum    int          DEFAULT NULL,
    version    int          DEFAULT NULL,
    PRIMARY KEY (sid)
);

CREATE TABLE sa_opagent
(
    sid           varchar(32)   NOT NULL,
    sorgfid       varchar(2048) NOT NULL,
    sorgfname     varchar(2048) NOT NULL,
    sagentid      varchar(32)   NOT NULL,
    svalidstate   int         DEFAULT NULL,
    sstarttime    timestamp   DEFAULT NULL,
    sfinishtime   timestamp   DEFAULT NULL,
    sprocess      text,
    screatorid    varchar(32) DEFAULT NULL,
    screatorname  varchar(64) DEFAULT NULL,
    screatetime   timestamp   DEFAULT NULL,
    scantranagent int         DEFAULT NULL,
    version       int           NOT NULL,
    PRIMARY KEY (sid)
);

CREATE TABLE sa_opmanagement
(
    sid             varchar(32)   NOT NULL,
    sorgid          varchar(65)   NOT NULL,
    sorgname        varchar(255)  DEFAULT NULL,
    sorgfid         varchar(2048) NOT NULL,
    sorgfname       varchar(2048) DEFAULT NULL,
    smanageorgid    varchar(65)   NOT NULL,
    smanageorgname  varchar(255)  DEFAULT NULL,
    smanageorgfid   varchar(2048) NOT NULL,
    smanageorgfname varchar(2048) DEFAULT NULL,
    smanagetypeid   varchar(32)   NOT NULL,
    screatorfid     varchar(2048) DEFAULT NULL,
    screatorfname   varchar(2048) DEFAULT NULL,
    screatetime     timestamp     DEFAULT NULL,
    version         int           NOT NULL,
    PRIMARY KEY (sid)
);

CREATE TABLE sa_opmanagetype
(
    sid                varchar(32) NOT NULL,
    sname              varchar(255) DEFAULT NULL,
    scode              varchar(32)  DEFAULT NULL,
    smanageorgkind     varchar(64)  DEFAULT NULL,
    smanageorgkindname varchar(255) DEFAULT NULL,
    sleadernumber      int          DEFAULT NULL,
    sissystem          int          DEFAULT NULL,
    version            int         NOT NULL,
    PRIMARY KEY (sid)
);

CREATE TABLE sa_opmenutree
(
    sid       varchar(32) NOT NULL,
    label     varchar(200)  DEFAULT NULL,
    icon      varchar(100)  DEFAULT NULL,
    layuiIcon varchar(100)  DEFAULT NULL,
    url       varchar(1024) DEFAULT NULL,
    process   varchar(1024) DEFAULT NULL,
    activity  varchar(100)  DEFAULT NULL,
    display   varchar(100)  DEFAULT NULL,
    icon32    varchar(100)  DEFAULT NULL,
    icon64    varchar(100)  DEFAULT NULL,
    pid       varchar(32)   DEFAULT NULL,
    sorts     int           DEFAULT NULL,
    code      varchar(100),
    i18n      varchar(100),
    version   int NULL DEFAULT 0,
    PRIMARY KEY (sid)
);
CREATE INDEX idx_sa_opmenutree_pid on sa_opmenutree (pid);

CREATE TABLE sa_log
(
    sid                varchar(32) NOT NULL,
    stypename          varchar(100)   DEFAULT NULL,
    sdescription       text,
    sprocess           varchar(2048)  DEFAULT NULL,
    sprocessname       varchar(2048)  DEFAULT NULL,
    sactivity          varchar(100)   DEFAULT NULL,
    sactivityname      varchar(2048)  DEFAULT NULL,
    saction            varchar(100)   DEFAULT NULL,
    sactionname        varchar(2048)  DEFAULT NULL,
    sstatusname        varchar(64)    DEFAULT NULL,
    screatetime        timestamp NULL DEFAULT NULL,
    screatorfid        varchar(2048)  DEFAULT NULL,
    screatorfname      varchar(2048)  DEFAULT NULL,
    screatorpersonid   varchar(36)    DEFAULT NULL,
    screatorpersonname varchar(255)   DEFAULT NULL,
    screatorposid      varchar(36)    DEFAULT NULL,
    screatorposname    varchar(255)   DEFAULT NULL,
    screatordeptid     varchar(36)    DEFAULT NULL,
    screatordeptname   varchar(255)   DEFAULT NULL,
    screatorognid      varchar(36)    DEFAULT NULL,
    screatorognname    varchar(255)   DEFAULT NULL,
    sip                varchar(32)    DEFAULT NULL,
    sdevicetype        varchar(100)   DEFAULT NULL,
    soperatingsystem   varchar(100)   DEFAULT NULL,
    version            decimal(10, 0) DEFAULT NULL,
    PRIMARY KEY (sid)
);

CREATE TABLE sa_docnamespace
(
    sid          varchar(128) NOT NULL,
    sdisplayname varchar(256) DEFAULT NULL,
    shost        varchar(128) DEFAULT NULL,
    sport        int          DEFAULT NULL,
    surl         varchar(128) DEFAULT NULL,
    sflag        int          DEFAULT NULL,
    shtths       varchar(64)  DEFAULT NULL,
    version      int          DEFAULT NULL,
    PRIMARY KEY (sid)
);

CREATE TABLE sa_docnode
(
    sid                 varchar(36) NOT NULL,
    sparentid           varchar(36)    DEFAULT NULL,
    sdocname            varchar(2500)  DEFAULT NULL,
    ssequence           varchar(128)   DEFAULT NULL,
    ssize               float          DEFAULT NULL,
    skind               varchar(128)   DEFAULT NULL,
    sdocpath            text           DEFAULT NULL,
    sdocdisplaypath     text,
    screatorfid         varchar(2048)  DEFAULT NULL,
    screatorname        varchar(64)    DEFAULT NULL,
    screatordeptname    varchar(64)    DEFAULT NULL,
    screatetime         timestamp      DEFAULT NULL,
    seditorfid          varchar(2048)  DEFAULT NULL,
    seditorname         varchar(64)    DEFAULT NULL,
    seditordeptname     varchar(64)    DEFAULT NULL,
    slastwriterfid      varchar(2048)  DEFAULT NULL,
    slastwritername     varchar(64)    DEFAULT NULL,
    slastwriterdeptname varchar(64)    DEFAULT NULL,
    slastwritetime      timestamp      DEFAULT NULL,
    sfileid             varchar(128)   DEFAULT NULL,
    sdescription        text,
    sdocliveversionid   int            DEFAULT NULL,
    version             decimal(10, 0) DEFAULT NULL,
    sclassification     varchar(128)   DEFAULT NULL,
    skeywords           varchar(256)   DEFAULT NULL,
    sdocserialnumber    varchar(128)   DEFAULT NULL,
    sfinishtime         timestamp      DEFAULT NULL,
    snamespace          varchar(256)   DEFAULT NULL,
    scachename          varchar(100)   DEFAULT NULL,
    srevisioncachename  varchar(100)   DEFAULT NULL,
    sflag               int            DEFAULT NULL,
    PRIMARY KEY (sid)
);
CREATE INDEX idx_sa_docnode on sa_docnode (sparentid);
CREATE INDEX inx_sa_donnode_skind on sa_docnode (skind);
CREATE INDEX idx_sa_docnode_sfileid on sa_docnode (sfileid);

CREATE TABLE sa_flowfolder
(
    sid          varchar(32) NOT NULL,
    sprocessid   varchar(100)         DEFAULT NULL,
    sprocessname varchar(100)         DEFAULT NULL,
    scode        varchar(100)         DEFAULT NULL,
    sname        varchar(100)         DEFAULT NULL,
    sparent      varchar(32)          DEFAULT NULL,
    sidpath      varchar(4000)        DEFAULT NULL,
    snamepath    varchar(4000)        DEFAULT NULL,
    scodepath    varchar(4000)        DEFAULT NULL,
    version      int         NOT NULL DEFAULT '0',
    PRIMARY KEY (sid)
);
CREATE INDEX idx_sa_flwfolder_sparent on sa_flowfolder (sparent);

CREATE TABLE sa_flowdrawlg
(
    sid          varchar(32)  NOT NULL,
    sprocessid   varchar(100) NOT NULL,
    sprocessname varchar(100),
    sdrawlg      text,
    sprocessacty text,
    screatorid   varchar(100),
    screatorname varchar(100),
    supdatorid   varchar(100),
    supdatorname varchar(100),
    screatetime  timestamp,
    supdatetime  timestamp,
    fenabled     int,
    sfolderid    varchar(32),
    version      int DEFAULT 0,
    PRIMARY KEY (sid)
);
CREATE INDEX idx_sa_flowdrawlg_sprocessid on sa_flowdrawlg (sprocessid);

CREATE TABLE sa_kvsequence
(
    k varchar(200) NOT NULL,
    v int          NOT NULL,
    PRIMARY KEY (k)
);


INSERT INTO sa_oporg
VALUES ('ORG01', '管理员', 'TULIN', '', '/管理员', '/TULIN', '/ORG01.ogn', 'ogn', '1', null, '1', '', '', '', '', '', '', '',
        '16', '', '96');
INSERT INTO sa_oporg
VALUES ('PSN01@ORG01', 'system', 'SYSTEM', '', '/管理员/system', '/TULIN/SYSTEM', '/ORG01.ogn/PSN01@ORG01.psm', 'psm', '1',
        'ORG01', '2', '', '', '', '', '', 'PSN01', 'nkLeaf', '15', '', '1');
INSERT INTO sa_opperson
VALUES ('PSN01', 'system', 'SYSTEM', '', '1', '管理员', 'C4CA4238A0B923820DCC509A6F75849B', '120', '2013-10-20', 'ORG01',
        '', '1', '1', '', '男', '1976-12-03', '2006-06-06', '', '', '', '', '', '', '', '', '', '', '', '', '', '',
        '14769660886', '', '', '4', null, '', '', '', '', '', '', '', '', null);
INSERT INTO sa_opauthorize
VALUES ('AHR01', 'PSN01@ORG01', '管理员', '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', 'RL01', '超级管理员',
        '/ORG01.ogn/PSN01@ORG01.psm', '/管理员/system', '2009/11/3', 0, '0');

INSERT INTO sa_opmenutree
VALUES ('sysfun', '系统管理', 'SettingOutlined', 'SettingOutlined', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'system',
        0);
INSERT INTO sa_opmenutree
VALUES ('sysmenus', '菜单设置', 'DatabaseOutlined', 'DatabaseOutlined', '/system/sysMenu', '/SA/functionTree/process',
        'mainActivity', NULL, NULL, NULL, 'sysfun', 1, 'sysMenu', 0);
INSERT INTO sa_opmenutree
VALUES ('sysognzation', '机构管理', 'DatabaseOutlined', 'DatabaseOutlined', '/system/organization',
        '/SA/organization/organizationProcess', 'mainActivity', NULL, NULL, NULL, 'sysfun', 3, 'organization', 0);
INSERT INTO sa_opmenutree
VALUES ('sysrolem', '角色管理', 'DatabaseOutlined', 'DatabaseOutlined', '/system/roleManage', '/SA/role/roleProcess',
        'mainActivity', NULL, NULL, NULL, 'sysfun', 4, 'roleManage', 0);

INSERT INTO sa_oprole
VALUES ('RL01', '超级管理员', 'opm', '勿删-系统应用', 'fun', '', '', '1', '1', '4');
INSERT INTO sa_oprole
VALUES ('RL02', '任务', 'task', '系统管理', 'fun', '', '', '2', '1', '2');
INSERT INTO sa_oprole
VALUES ('RL02-doc', '文档', 'doc', '系统管理', 'fun', '', '', '3', '1', '2');

INSERT INTO sa_docnamespace
VALUES ('defaultDocNameSpace', '文档中心', '127.0.0.1', 8080, 'http://127.0.0.1:8080/DocServer', 1, 'false', 0);
INSERT INTO sa_docnode
VALUES ('root', null, '文档中心', '', null, 'dir', '/root', '/文档中心', '', '', '', null, '', '', '', '', '', '', null, '', '',
        null, '4', '', '', '', null, 'defaultDocNameSpace', '', '', '1');
