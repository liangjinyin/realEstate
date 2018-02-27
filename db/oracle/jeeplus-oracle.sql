prompt PL/SQL Developer import file
prompt Created on 2016年3月15日 by Administrator
set feedback off
set define off
prompt Creating FORM_LEAVE...
create table FORM_LEAVE
(
  ID          VARCHAR2(64) not null,
  USER_ID     VARCHAR2(64),
  OFFICE_ID   VARCHAR2(64),
  AREA_ID     VARCHAR2(64),
  BEGIN_DATE  DATE,
  END_DATE    DATE,
  CREATE_BY   VARCHAR2(64),
  CREATE_DATE DATE,
  UPDATE_BY   VARCHAR2(64),
  UPDATE_DATE DATE,
  REMARKS     NVARCHAR2(255),
  DEL_FLAG    VARCHAR2(64)
)
;
comment on table FORM_LEAVE
  is '请假表单';
comment on column FORM_LEAVE.ID
  is '主键';
comment on column FORM_LEAVE.USER_ID
  is '员工';
comment on column FORM_LEAVE.OFFICE_ID
  is '归属部门';
comment on column FORM_LEAVE.AREA_ID
  is '归属区域';
comment on column FORM_LEAVE.BEGIN_DATE
  is '请假开始日期';
comment on column FORM_LEAVE.END_DATE
  is '请假结束日期';
comment on column FORM_LEAVE.CREATE_BY
  is '创建者';
comment on column FORM_LEAVE.CREATE_DATE
  is '创建时间';
comment on column FORM_LEAVE.UPDATE_BY
  is '更新者';
comment on column FORM_LEAVE.UPDATE_DATE
  is '更新时间';
comment on column FORM_LEAVE.REMARKS
  is '备注信息';
comment on column FORM_LEAVE.DEL_FLAG
  is '逻辑删除标记（0：显示；1：隐藏）';
alter table FORM_LEAVE
  add constraint PK_FORM_LEAVE_ID primary key (ID);

prompt Creating GEN_SCHEME...
create table GEN_SCHEME
(
  ID                   VARCHAR2(64) not null,
  NAME                 VARCHAR2(200),
  CATEGORY             VARCHAR2(2000),
  PACKAGE_NAME         VARCHAR2(500),
  MODULE_NAME          VARCHAR2(30),
  SUB_MODULE_NAME      VARCHAR2(30),
  FUNCTION_NAME        VARCHAR2(500),
  FUNCTION_NAME_SIMPLE VARCHAR2(100),
  FUNCTION_AUTHOR      VARCHAR2(100),
  GEN_TABLE_ID         VARCHAR2(200),
  CREATE_BY            VARCHAR2(64),
  CREATE_DATE          DATE,
  UPDATE_BY            VARCHAR2(64),
  UPDATE_DATE          DATE,
  REMARKS              VARCHAR2(255),
  DEL_FLAG             CHAR(1) default '0' not null
)
;
alter table GEN_SCHEME
  add primary key (ID);
create index GEN_SCHEME_DEL_FLAG on GEN_SCHEME (DEL_FLAG);

prompt Creating GEN_TABLE...
create table GEN_TABLE
(
  ID              VARCHAR2(64) not null,
  NAME            VARCHAR2(200),
  COMMENTS        VARCHAR2(500),
  CLASS_NAME      VARCHAR2(100),
  PARENT_TABLE    VARCHAR2(200),
  PARENT_TABLE_FK VARCHAR2(100),
  CREATE_BY       VARCHAR2(64),
  CREATE_DATE     DATE,
  UPDATE_BY       VARCHAR2(64),
  UPDATE_DATE     DATE,
  REMARKS         VARCHAR2(255),
  DEL_FLAG        CHAR(1) default '0',
  ISSYNC          VARCHAR2(45),
  TABLE_TYPE      VARCHAR2(45)
)
;
alter table GEN_TABLE
  add primary key (ID);
create index GEN_TABLE_DEL_FLAG on GEN_TABLE (DEL_FLAG);
create index GEN_TABLE_NAME on GEN_TABLE (NAME);

prompt Creating GEN_TABLE_COLUMN...
create table GEN_TABLE_COLUMN
(
  ID           VARCHAR2(64) not null,
  GEN_TABLE_ID VARCHAR2(64),
  NAME         VARCHAR2(200),
  COMMENTS     VARCHAR2(500),
  JDBC_TYPE    VARCHAR2(100),
  JAVA_TYPE    VARCHAR2(500),
  JAVA_FIELD   VARCHAR2(200),
  IS_PK        CHAR(1),
  IS_NULL      CHAR(1),
  IS_INSERT    CHAR(1),
  IS_EDIT      CHAR(1),
  IS_LIST      CHAR(1),
  IS_QUERY     CHAR(1),
  QUERY_TYPE   VARCHAR2(200),
  SHOW_TYPE    VARCHAR2(200),
  DICT_TYPE    VARCHAR2(200),
  SETTINGS     VARCHAR2(2000),
  SORT         NUMBER(10),
  CREATE_BY    VARCHAR2(64),
  CREATE_DATE  DATE,
  UPDATE_BY    VARCHAR2(64),
  UPDATE_DATE  DATE,
  REMARKS      VARCHAR2(255),
  DEL_FLAG     CHAR(1) default '0' not null,
  IS_FORM      CHAR(1)
)
;
alter table GEN_TABLE_COLUMN
  add primary key (ID);
create index GEN_TABLE_COLUMN_DEL_FLAG on GEN_TABLE_COLUMN (DEL_FLAG);
create index GEN_TABLE_COLUMN_NAME on GEN_TABLE_COLUMN (NAME);
create index GEN_TABLE_COLUMN_SORT on GEN_TABLE_COLUMN (SORT);
create index GEN_TABLE_COLUMN_TABLE_ID on GEN_TABLE_COLUMN (GEN_TABLE_ID);

prompt Creating GEN_TEMPLATE...
create table GEN_TEMPLATE
(
  ID          VARCHAR2(64) not null,
  NAME        VARCHAR2(200),
  CATEGORY    VARCHAR2(2000),
  FILE_PATH   VARCHAR2(500),
  FILE_NAME   VARCHAR2(200),
  CONTENT     VARCHAR2(2000),
  CREATE_BY   VARCHAR2(64),
  CREATE_DATE DATE,
  UPDATE_BY   VARCHAR2(64),
  UPDATE_DATE DATE,
  REMARKS     VARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
;
alter table GEN_TEMPLATE
  add primary key (ID);
create index GEN_TEMPLATE_DEL_FALG on GEN_TEMPLATE (DEL_FLAG);

prompt Creating IIM_CHAT_HISTORY...
create table IIM_CHAT_HISTORY
(
  ID          VARCHAR2(64) not null,
  USERID1     VARCHAR2(64),
  USERID2     VARCHAR2(64),
  MSG         VARCHAR2(1024),
  STATUS      VARCHAR2(45),
  CREATE_DATE DATE
)
;
alter table IIM_CHAT_HISTORY
  add primary key (ID);

prompt Creating IIM_MAIL...
create table IIM_MAIL
(
  ID       VARCHAR2(64) not null,
  TITLE    VARCHAR2(128),
  OVERVIEW VARCHAR2(128),
  CONTENT  VARCHAR2(2000)
)
;
alter table IIM_MAIL
  add primary key (ID);

prompt Creating IIM_MAIL_BOX...
create table IIM_MAIL_BOX
(
  ID         VARCHAR2(64) not null,
  READSTATUS VARCHAR2(45),
  SENDERID   VARCHAR2(64),
  RECEIVERID VARCHAR2(2000),
  SENDTIME   DATE,
  MAILID     VARCHAR2(64)
)
;
alter table IIM_MAIL_BOX
  add primary key (ID);

prompt Creating IIM_MAIL_COMPOSE...
create table IIM_MAIL_COMPOSE
(
  ID         VARCHAR2(64) not null,
  STATUS     VARCHAR2(45),
  READSTATUS VARCHAR2(45),
  SENDERID   VARCHAR2(64),
  RECEIVERID VARCHAR2(2000),
  SENDTIME   DATE,
  MAILID     VARCHAR2(64)
)
;
alter table IIM_MAIL_COMPOSE
  add primary key (ID);

prompt Creating MONITOR...
create table MONITOR
(
  ID      VARCHAR2(64) not null,
  CPU     VARCHAR2(64),
  JVM     VARCHAR2(64),
  RAM     VARCHAR2(64),
  TOEMAIL VARCHAR2(64)
)
;
comment on column MONITOR.ID
  is '主键';
comment on column MONITOR.CPU
  is 'cpu使用率';
comment on column MONITOR.JVM
  is 'jvm使用率';
comment on column MONITOR.RAM
  is '内存使用率';
comment on column MONITOR.TOEMAIL
  is '警告通知邮件';
alter table MONITOR
  add constraint SYS023466 primary key (ID);

prompt Creating OA_NOTIFY...
create table OA_NOTIFY
(
  ID          VARCHAR2(64) not null,
  TYPE        CHAR(1),
  TITLE       VARCHAR2(200),
  CONTENT     VARCHAR2(2000),
  FILES       VARCHAR2(2000),
  STATUS      CHAR(1),
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE DATE not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE DATE not null,
  REMARKS     VARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
;
alter table OA_NOTIFY
  add primary key (ID);
create index OA_NOTIFY_DEL_FLAG on OA_NOTIFY (DEL_FLAG);

prompt Creating OA_NOTIFY_RECORD...
create table OA_NOTIFY_RECORD
(
  ID           VARCHAR2(64) not null,
  OA_NOTIFY_ID VARCHAR2(64),
  USER_ID      VARCHAR2(64),
  READ_FLAG    CHAR(1) default '0',
  READ_DATE    DATE
)
;
alter table OA_NOTIFY_RECORD
  add primary key (ID);
create index OA_NOTIFY_RECORD_NOTIFY_ID on OA_NOTIFY_RECORD (OA_NOTIFY_ID);
create index OA_NOTIFY_RECORD_READ_FLAG on OA_NOTIFY_RECORD (READ_FLAG);
create index OA_NOTIFY_RECORD_USER_ID on OA_NOTIFY_RECORD (USER_ID);

prompt Creating SYSTEMCONFIG...
create table SYSTEMCONFIG
(
  ID           VARCHAR2(64) not null,
  SMTP         VARCHAR2(64),
  PORT         VARCHAR2(64),
  MAILNAME     VARCHAR2(64),
  MAILPASSWORD VARCHAR2(64),
  SMSNAME      VARCHAR2(64),
  SMSPASSWORD  VARCHAR2(64)
)
;
comment on column SYSTEMCONFIG.ID
  is '主键';
comment on column SYSTEMCONFIG.SMTP
  is '邮箱服务器地址';
comment on column SYSTEMCONFIG.PORT
  is '邮箱服务器端口';
comment on column SYSTEMCONFIG.MAILNAME
  is '系统邮箱地址';
comment on column SYSTEMCONFIG.MAILPASSWORD
  is '系统邮箱密码';
comment on column SYSTEMCONFIG.SMSNAME
  is '短信用户名';
comment on column SYSTEMCONFIG.SMSPASSWORD
  is '短信密码';
alter table SYSTEMCONFIG
  add primary key (ID);

prompt Creating SYS_AREA...
create table SYS_AREA
(
  ID          VARCHAR2(64) not null,
  PARENT_ID   VARCHAR2(64) not null,
  PARENT_IDS  VARCHAR2(2000) not null,
  NAME        VARCHAR2(100) not null,
  SORT        NUMBER(10) not null,
  CODE        VARCHAR2(100),
  TYPE        CHAR(1),
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE DATE not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE DATE not null,
  REMARKS     VARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
;
alter table SYS_AREA
  add primary key (ID);
create index SYS_AREA_DEL_FLAG on SYS_AREA (DEL_FLAG);
create index SYS_AREA_PARENT_ID on SYS_AREA (PARENT_ID);

prompt Creating SYS_DICT...
create table SYS_DICT
(
  ID          VARCHAR2(64) not null,
  VALUE       VARCHAR2(100) not null,
  LABEL       VARCHAR2(100) not null,
  TYPE        VARCHAR2(100) not null,
  DESCRIPTION VARCHAR2(100) not null,
  SORT        NUMBER(10) not null,
  PARENT_ID   VARCHAR2(64) default '0',
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE DATE not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE DATE not null,
  REMARKS     VARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
;
alter table SYS_DICT
  add primary key (ID);
create index SYS_DICT_DEL_FLAG on SYS_DICT (DEL_FLAG);
create index SYS_DICT_LABEL on SYS_DICT (LABEL);
create index SYS_DICT_VALUE on SYS_DICT (VALUE);

prompt Creating SYS_LOG...
create table SYS_LOG
(
  ID          VARCHAR2(64) not null,
  TYPE        CHAR(1) default '1',
  TITLE       VARCHAR2(255) default '',
  CREATE_BY   VARCHAR2(64),
  CREATE_DATE DATE,
  REMOTE_ADDR VARCHAR2(255),
  USER_AGENT  VARCHAR2(255),
  REQUEST_URI VARCHAR2(255),
  METHOD      VARCHAR2(5),
  PARAMS      VARCHAR2(2000),
  EXCEPTION   VARCHAR2(2000)
)
;
alter table SYS_LOG
  add primary key (ID);
create index SYS_LOG_CREATE_BY on SYS_LOG (CREATE_BY);
create index SYS_LOG_CREATE_DATE on SYS_LOG (CREATE_DATE);
create index SYS_LOG_REQUEST_URI on SYS_LOG (REQUEST_URI);
create index SYS_LOG_TYPE on SYS_LOG (TYPE);

prompt Creating SYS_MDICT...
create table SYS_MDICT
(
  ID          VARCHAR2(64) not null,
  PARENT_ID   VARCHAR2(64) not null,
  PARENT_IDS  VARCHAR2(2000) not null,
  NAME        VARCHAR2(100) not null,
  SORT        NUMBER(10) not null,
  DESCRIPTION VARCHAR2(100),
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE DATE not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE DATE not null,
  REMARKS     VARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
;
alter table SYS_MDICT
  add primary key (ID);
create index SYS_MDICT_DEL_FLAG on SYS_MDICT (DEL_FLAG);
create index SYS_MDICT_PARENT_ID on SYS_MDICT (PARENT_ID);

prompt Creating SYS_MENU...
create table SYS_MENU
(
  ID          VARCHAR2(64) not null,
  PARENT_ID   VARCHAR2(64) not null,
  PARENT_IDS  VARCHAR2(2000) not null,
  NAME        VARCHAR2(100) not null,
  SORT        NUMBER(10) not null,
  HREF        VARCHAR2(2000),
  TARGET      VARCHAR2(20),
  ICON        VARCHAR2(100),
  IS_SHOW     CHAR(1) not null,
  PERMISSION  VARCHAR2(200),
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE DATE not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE DATE not null,
  REMARKS     VARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
;
alter table SYS_MENU
  add primary key (ID);
create index SYS_MENU_DEL_FLAG on SYS_MENU (DEL_FLAG);
create index SYS_MENU_PARENT_ID on SYS_MENU (PARENT_ID);

prompt Creating SYS_OFFICE...
create table SYS_OFFICE
(
  ID             VARCHAR2(64) not null,
  PARENT_ID      VARCHAR2(64) not null,
  PARENT_IDS     VARCHAR2(2000) not null,
  NAME           VARCHAR2(100) not null,
  SORT           NUMBER(10) not null,
  AREA_ID        VARCHAR2(64) not null,
  CODE           VARCHAR2(100),
  TYPE           CHAR(1) not null,
  GRADE          CHAR(1) not null,
  ADDRESS        VARCHAR2(255),
  ZIP_CODE       VARCHAR2(100),
  MASTER         VARCHAR2(100),
  PHONE          VARCHAR2(200),
  FAX            VARCHAR2(200),
  EMAIL          VARCHAR2(200),
  USEABLE        VARCHAR2(64),
  PRIMARY_PERSON VARCHAR2(64),
  DEPUTY_PERSON  VARCHAR2(64),
  CREATE_BY      VARCHAR2(64) not null,
  CREATE_DATE    DATE not null,
  UPDATE_BY      VARCHAR2(64) not null,
  UPDATE_DATE    DATE not null,
  REMARKS        VARCHAR2(255),
  DEL_FLAG       CHAR(1) default '0' not null
)
;
alter table SYS_OFFICE
  add primary key (ID);
create index SYS_OFFICE_DEL_FLAG on SYS_OFFICE (DEL_FLAG);
create index SYS_OFFICE_PARENT_ID on SYS_OFFICE (PARENT_ID);
create index SYS_OFFICE_TYPE on SYS_OFFICE (TYPE);

prompt Creating SYS_ROLE...
create table SYS_ROLE
(
  ID          VARCHAR2(64) not null,
  OFFICE_ID   VARCHAR2(64),
  NAME        VARCHAR2(100) not null,
  ENNAME      VARCHAR2(255),
  ROLE_TYPE   VARCHAR2(255),
  DATA_SCOPE  CHAR(1),
  IS_SYS      VARCHAR2(64),
  USEABLE     VARCHAR2(64),
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE DATE not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE DATE not null,
  REMARKS     VARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
;
alter table SYS_ROLE
  add primary key (ID);
create index SYS_ROLE_DEL_FLAG on SYS_ROLE (DEL_FLAG);
create index SYS_ROLE_ENNAME on SYS_ROLE (ENNAME);

prompt Creating SYS_ROLE_MENU...
create table SYS_ROLE_MENU
(
  ROLE_ID VARCHAR2(64) not null,
  MENU_ID VARCHAR2(64) not null
)
;
alter table SYS_ROLE_MENU
  add primary key (ROLE_ID, MENU_ID);

prompt Creating SYS_ROLE_OFFICE...
create table SYS_ROLE_OFFICE
(
  ROLE_ID   VARCHAR2(64) not null,
  OFFICE_ID VARCHAR2(64) not null
)
;
alter table SYS_ROLE_OFFICE
  add primary key (ROLE_ID, OFFICE_ID);

prompt Creating SYS_USER...
create table SYS_USER
(
  ID          VARCHAR2(64) not null,
  COMPANY_ID  VARCHAR2(64),
  OFFICE_ID   VARCHAR2(64),
  LOGIN_NAME  VARCHAR2(100),
  PASSWORD    VARCHAR2(100),
  NO          VARCHAR2(100),
  NAME        VARCHAR2(100),
  EMAIL       VARCHAR2(200),
  PHONE       VARCHAR2(200),
  MOBILE      VARCHAR2(200),
  USER_TYPE   CHAR(1),
  PHOTO       VARCHAR2(1000),
  LOGIN_IP    VARCHAR2(100),
  LOGIN_DATE  DATE,
  LOGIN_FLAG  VARCHAR2(64),
  CREATE_BY   VARCHAR2(64),
  CREATE_DATE DATE,
  UPDATE_BY   VARCHAR2(64),
  UPDATE_DATE DATE,
  REMARKS     VARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0',
  QRCODE      VARCHAR2(1000)
)
;
alter table SYS_USER
  add primary key (ID);
create index SYS_USER_COMPANY_ID on SYS_USER (COMPANY_ID);
create index SYS_USER_DEL_FLAG on SYS_USER (DEL_FLAG);
create index SYS_USER_LOGIN_NAME on SYS_USER (LOGIN_NAME);
create index SYS_USER_OFFICE_ID on SYS_USER (OFFICE_ID);
create index SYS_USER_UPDATE_DATE on SYS_USER (UPDATE_DATE);

prompt Creating SYS_USER_FRIEND...
create table SYS_USER_FRIEND
(
  ID       VARCHAR2(64) not null,
  USERID   VARCHAR2(64) not null,
  FRIENDID VARCHAR2(64) not null
)
;
alter table SYS_USER_FRIEND
  add primary key (ID);

prompt Creating SYS_USER_ROLE...
create table SYS_USER_ROLE
(
  USER_ID VARCHAR2(64) not null,
  ROLE_ID VARCHAR2(64) not null
)
;
alter table SYS_USER_ROLE
  add primary key (USER_ID, ROLE_ID);

prompt Creating TB_PHONETYPE...
create table TB_PHONETYPE
(
  ID          VARCHAR2(64) not null,
  CREATE_BY   VARCHAR2(64),
  CREATE_DATE DATE,
  UPDATE_BY   VARCHAR2(64),
  UPDATE_DATE DATE,
  REMARKS     VARCHAR2(500),
  DEL_FLAG    VARCHAR2(64),
  PARENT_ID   VARCHAR2(64),
  PARENT_IDS  VARCHAR2(64),
  NAME        VARCHAR2(300),
  SORT        VARCHAR2(64)
)
;
comment on table TB_PHONETYPE
  is '手机品牌和机型';
comment on column TB_PHONETYPE.ID
  is '主键';
comment on column TB_PHONETYPE.CREATE_BY
  is '创建者';
comment on column TB_PHONETYPE.CREATE_DATE
  is '创建时间';
comment on column TB_PHONETYPE.UPDATE_BY
  is '更新者';
comment on column TB_PHONETYPE.UPDATE_DATE
  is '更新时间';
comment on column TB_PHONETYPE.REMARKS
  is '备注信息';
comment on column TB_PHONETYPE.DEL_FLAG
  is '逻辑删除标记（0：显示；1：隐藏）';
comment on column TB_PHONETYPE.PARENT_ID
  is '父级编号';
comment on column TB_PHONETYPE.PARENT_IDS
  is '所有父级编号';
comment on column TB_PHONETYPE.NAME
  is '名称';
comment on column TB_PHONETYPE.SORT
  is '排序';
alter table TB_PHONETYPE
  add constraint PK_TB_PHONETYPE_ID primary key (ID);

prompt Creating TEST_DATA...
create table TEST_DATA
(
  ID          VARCHAR2(64) not null,
  USER_ID     VARCHAR2(64),
  OFFICE_ID   VARCHAR2(64),
  AREA_ID     VARCHAR2(64),
  NAME        VARCHAR2(100),
  SEX         CHAR(1),
  IN_DATE     DATE,
  CREATE_BY   VARCHAR2(64) not null,
  CREATE_DATE DATE not null,
  UPDATE_BY   VARCHAR2(64) not null,
  UPDATE_DATE DATE not null,
  REMARKS     VARCHAR2(255),
  DEL_FLAG    CHAR(1) default '0' not null
)
;
alter table TEST_DATA
  add primary key (ID);
create index TEST_DATA_DEL_FLAG on TEST_DATA (DEL_FLAG);

prompt Creating TEST_DATA_CHILD...
create table TEST_DATA_CHILD
(
  ID                VARCHAR2(64) default '' not null,
  start             VARCHAR2(64),
  END               VARCHAR2(64),
  PRICE             BINARY_DOUBLE,
  TEST_DATA_MAIN_ID VARCHAR2(64),
  CREATE_BY         VARCHAR2(64),
  CREATE_DATE       DATE,
  UPDATE_BY         VARCHAR2(64),
  UPDATE_DATE       DATE,
  REMARKS           VARCHAR2(255),
  DEL_FLAG          CHAR(1)
)
;
alter table TEST_DATA_CHILD
  add primary key (ID);

prompt Creating TEST_DATA_CHILD2...
create table TEST_DATA_CHILD2
(
  ID             VARCHAR2(64) default '' not null,
  start          VARCHAR2(64),
  END            VARCHAR2(64),
  PRICE          BINARY_DOUBLE,
  TEST_DATA_MAIN VARCHAR2(64),
  CREATE_BY      VARCHAR2(64),
  CREATE_DATE    DATE,
  UPDATE_BY      VARCHAR2(64),
  UPDATE_DATE    DATE,
  REMARKS        VARCHAR2(255),
  DEL_FLAG       VARCHAR2(64)
)
;
alter table TEST_DATA_CHILD2
  add primary key (ID);

prompt Creating TEST_DATA_CHILD3...
create table TEST_DATA_CHILD3
(
  ID             VARCHAR2(64) default '' not null,
  start          VARCHAR2(64),
  END            VARCHAR2(64),
  PRICE          BINARY_DOUBLE,
  TEST_DATA_MAIN VARCHAR2(64),
  CREATE_BY      VARCHAR2(64),
  CREATE_DATE    DATE,
  UPDATE_BY      VARCHAR2(64),
  UPDATE_DATE    DATE,
  REMARKS        VARCHAR2(255),
  DEL_FLAG       VARCHAR2(64)
)
;
alter table TEST_DATA_CHILD3
  add primary key (ID);

prompt Creating TEST_DATA_MAIN...
create table TEST_DATA_MAIN
(
  ID          VARCHAR2(64) default '' not null,
  USER_ID     VARCHAR2(64),
  OFFICE_ID   VARCHAR2(64),
  AREA_ID     VARCHAR2(64),
  NAME        VARCHAR2(100),
  SEX         CHAR(1),
  IN_DATE     DATE,
  CREATE_BY   VARCHAR2(64),
  CREATE_DATE DATE,
  UPDATE_BY   VARCHAR2(64),
  UPDATE_DATE DATE,
  REMARKS     VARCHAR2(255),
  DEL_FLAG    CHAR(1)
)
;
alter table TEST_DATA_MAIN
  add primary key (ID);

prompt Creating TEST_INTERFACE...
create table TEST_INTERFACE
(
  ID         VARCHAR2(64) default '' not null,
  TYPE       VARCHAR2(16),
  URL        VARCHAR2(256),
  BODY       VARCHAR2(2048),
  SUCCESSMSG VARCHAR2(512),
  ERRORMSG   VARCHAR2(512),
  DEL_FLAG   CHAR(1) default '0',
  NAME       VARCHAR2(1024),
  comment    NVARCHAR2(512)
)
;
alter table TEST_INTERFACE
  add primary key (ID);

prompt Creating TEST_TREE...
create table TEST_TREE
(
  ID          VARCHAR2(64) not null,
  NAME        VARCHAR2(100),
  SORT        NUMBER(10),
  PARENT_ID   VARCHAR2(64),
  PARENT_IDS  VARCHAR2(2000),
  CREATE_BY   VARCHAR2(64),
  CREATE_DATE DATE,
  UPDATE_BY   VARCHAR2(64),
  UPDATE_DATE DATE,
  REMARKS     VARCHAR2(255),
  DEL_FLAG    VARCHAR2(64)
)
;
comment on table TEST_TREE
  is '组织机构';
comment on column TEST_TREE.ID
  is '主键';
comment on column TEST_TREE.NAME
  is '名称';
comment on column TEST_TREE.SORT
  is '排序';
comment on column TEST_TREE.PARENT_ID
  is '父级编号';
comment on column TEST_TREE.PARENT_IDS
  is '所有父级编号';
comment on column TEST_TREE.CREATE_BY
  is '创建者';
comment on column TEST_TREE.CREATE_DATE
  is '创建时间';
comment on column TEST_TREE.UPDATE_BY
  is '更新者';
comment on column TEST_TREE.UPDATE_DATE
  is '更新时间';
comment on column TEST_TREE.REMARKS
  is '备注信息';
comment on column TEST_TREE.DEL_FLAG
  is '逻辑删除标记（0：显示；1：隐藏）';
alter table TEST_TREE
  add constraint PK_TEST_TREE_ID primary key (ID);

prompt Loading FORM_LEAVE...
prompt Table is empty
prompt Loading GEN_SCHEME...
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('000fbb2eef694532ab9df8c83632cba6', null, 'curd', 'com.thinkgem.jeesite.modules', 'test', 'test', 'test', 'test', 'test', '19-2月 -16', '8b454376c0434e2792a1dc57edf80dbd', to_date('19-02-2016 15:35:43', 'dd-mm-yyyy hh24:mi:ss'), '8b454376c0434e2792a1dc57edf80dbd', to_date('19-02-2016 15:35:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2917758f13eb4984934b2cbc9f94dc81', null, 'curd_many', 'com.thinkgem.jeesite', 'test', null, 'test', 'test', 'test', '73326f175c2d4a63b2d89820a79ba2eb', '8b454376c0434e2792a1dc57edf80dbd', to_date('19-02-2016 15:35:51', 'dd-mm-yyyy hh24:mi:ss'), '8b454376c0434e2792a1dc57edf80dbd', to_date('19-02-2016 15:35:51', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35ba95c3d13c47fcb70b92247d38ca7a', null, 'curd', 'com.jeeplus.modules', 'test', 'one', '员工请假', '请假单', 'liugf', '0a8f05eb973b4942af37c45109bd2502', '1', to_date('19-02-2016 15:35:52', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 15:35:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('505b3e23c7234df79c14c0dce24af75a', null, 'curd', 'com.thinkgem.jeesite.modules', 'test', 'test', 'test', 'test', 'test', '7612365ac0c645008661aaf479c45b82', '8b454376c0434e2792a1dc57edf80dbd', to_date('19-02-2016 15:35:52', 'dd-mm-yyyy hh24:mi:ss'), '8b454376c0434e2792a1dc57edf80dbd', to_date('19-02-2016 15:35:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('a93238d2954a4da0a0a7a3c551803913', null, 'curd_many', 'com.jeeplus.modules', 'test', 'onetomany', '票务代理', '票务代理', 'liugf', 'e08d6fbc393047748a2d45c98be42676', '8b454376c0434e2792a1dc57edf80dbd', to_date('19-02-2016 15:35:52', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 15:35:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('11c16185e21a473b8dd961dfcddaa4c5', null, 'treeTable', 'com.jeeplus.modules', 'test', 'tree', '组织机构', '机构', 'liugf', 'bae082dbd74a4ca381c0ad24c886f991', '1', to_date('19-02-2016 15:40:38', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 15:40:38', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
commit;
prompt 6 records loaded
prompt Loading GEN_TABLE...
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('52191d01f0b3420f8446d7c9f6ba07d1', 'tb_phonetype', '手机品牌和机型', 'PHONETREE', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:51:09', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '1', '3');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('54baa0ad690f46f78bd4373c15810eeb', 'gen_scheme', 'gen_scheme', 'GenScheme', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('83003e2d787b48989420248039f2827f', 'gen_table', 'gen_table', 'GenTable', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('958d7094cff641469c74392b44b2912e', 'gen_table_column', 'gen_table_column', 'GenTableColumn', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('210a79c07c8341e997c1845ee7c7a8bb', 'gen_template', 'gen_template', 'GenTemplate', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('6a7937d0475641b4b703363b43f4f56a', 'iim_chat_history', 'iim_chat_history', 'IimChatHistory', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('9b406ab5d386448b8a70951a18adc3c9', 'sys_dict', 'sys_dict', 'SysDict', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('22b609c736c14145ba1b6b1e33137f08', 'iim_mail_compose', 'iim_mail_compose', 'IimMailCompose', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('eac70f6c40464231aa4693c0973c3174', 'oa_notify', 'oa_notify', 'OaNotify', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('c88f13b4fdc5408d8788e585ca1aea30', 'sys_area', 'sys_area', 'SysArea', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:23', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:23', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('8d09bc1835fe4deebe8a0674ce80580f', 'sys_log', 'sys_log', 'SysLog', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('cc49581ff1ff4e27bff698dc29e515d2', 'sys_mdict', 'sys_mdict', 'SysMdict', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('0a8f05eb973b4942af37c45109bd2502', 'form_leave', '请假表单', 'FormLeave', null, null, '1', to_date('19-02-2016 15:50:23', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '1', '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('3f7c20cfa7b840dc854d9ea27f4de539', 'test_data_child3', '汽车票', 'TestDataChild3', 'test_data_main', 'test_data_main', '1', to_date('19-02-2016 15:50:23', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('19-02-2016 15:50:23', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '1', '2');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('73326f175c2d4a63b2d89820a79ba2eb', 'test_data_child', '火车票', 'TestDataChild', 'test_data_main', 'test_data_main_id', '8b454376c0434e2792a1dc57edf80dbd', to_date('19-02-2016 15:50:23', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('19-02-2016 15:50:23', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '1', '2');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('90d8fc88828d47a99fcbfeaa4f95f0db', 'test_data_child2', '飞机票', 'TestDataChild2', 'test_data_main', 'test_data_main', '1', to_date('19-02-2016 15:50:23', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('19-02-2016 15:50:23', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '1', '2');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('bae082dbd74a4ca381c0ad24c886f991', 'test_tree', '组织机构', 'TestTree', null, null, '1', to_date('19-02-2016 15:50:23', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 15:50:23', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '1', '3');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('e08d6fbc393047748a2d45c98be42676', 'test_data_main', '票务代理', 'TestDataMain', null, null, '8b454376c0434e2792a1dc57edf80dbd', to_date('19-02-2016 15:50:23', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('19-02-2016 15:50:23', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '1', '1');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('a0fdd4095f4447c5907b66207935abad', 'iim_mail', 'iim_mail', 'IimMail', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:11', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('b2589002245d4118b8dfe3ee7b9b4f0b', 'iim_mail_box', 'iim_mail_box', 'IimMailBox', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('725b762d1c35408e9c7d9a4715059e3b', 'oa_notify_record', 'oa_notify_record', 'OaNotifyRecord', null, null, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, ISSYNC, TABLE_TYPE)
values ('2285cafd9ca54c238fd14eca7114b84a', 'tt', 'tt', 'tt', null, 'tt', '1', to_date('13-03-2016 20:16:01', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '1', '0');
commit;
prompt 22 records loaded
prompt Loading GEN_TABLE_COLUMN...
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('003ab0ebe5464d8790f0408d429d40f1', '90d8fc88828d47a99fcbfeaa4f95f0db', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 8, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('09cb8ea0deef4cea992ffc3c9df9f367', '73326f175c2d4a63b2d89820a79ba2eb', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 10, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('1011c770c2f24be5bfca9dbe8e726425', '3f7c20cfa7b840dc854d9ea27f4de539', 'remarks', '备注信息', 'nvarchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 9, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('1c71b699a7ec44bbad511b26d5c7f68e', 'e08d6fbc393047748a2d45c98be42676', 'area_id', '归属区域', 'varchar(64)', 'String', 'area.id|name', '0', '0', '1', '1', '1', '0', '=', 'areaselect', null, null, 3, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('243dcf560cc8494ea5d3589dbd8dd419', '90d8fc88828d47a99fcbfeaa4f95f0db', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 9, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('2f43d76913894a8f8857781653c33513', '90d8fc88828d47a99fcbfeaa4f95f0db', 'del_flag', '逻辑删除标记（0：显示；1：隐藏）', 'varchar(64)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 10, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('2fba393e90f141929358489afdf606f0', '3f7c20cfa7b840dc854d9ea27f4de539', 'start', '出发地', 'varchar(64)', 'com.jeeplus.modules.sys.entity.Area', 'start.id|name', '0', '0', '1', '1', '1', '1', '=', 'areaselect', null, null, 1, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('32736b7bcd1849449adb1f8d2391ea71', '3f7c20cfa7b840dc854d9ea27f4de539', 'end', '目的地', 'varchar(64)', 'com.jeeplus.modules.sys.entity.Area', 'end.id|name', '0', '0', '1', '1', '1', '1', '=', 'areaselect', null, null, 2, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('32e7a91170174e0489e07160e9336a7f', '73326f175c2d4a63b2d89820a79ba2eb', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 8, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('351be6aa79f24f518495b2f6254469ec', 'bae082dbd74a4ca381c0ad24c886f991', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 5, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('446d75320b0149ac9116e3c4bc49373d', 'e08d6fbc393047748a2d45c98be42676', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '0', '1', '1', '1', '1', '=', 'radiobox', 'sex', null, 5, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('452017126afc4913901691b0e9b2af76', 'e08d6fbc393047748a2d45c98be42676', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '1', '=', 'dateselect', null, null, 10, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('4614ca3ba9674782b302f1fbdc1823a8', 'e08d6fbc393047748a2d45c98be42676', 'id', '编号', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 0, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('4da93c0ef6214333893626080767675b', '90d8fc88828d47a99fcbfeaa4f95f0db', 'end', '目的地', 'varchar(64)', 'com.jeeplus.modules.sys.entity.Area', 'end.id|name', '0', '0', '1', '1', '1', '1', '=', 'areaselect', null, null, 2, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('5684e03a47794a9cae471a33c213e253', '73326f175c2d4a63b2d89820a79ba2eb', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 9, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('5bea03e629224711b83d7c9778c427c8', 'e08d6fbc393047748a2d45c98be42676', 'in_date', '加入日期', 'date', 'java.util.Date', 'inDate', '0', '0', '1', '1', '1', '1', 'between', 'dateselect', null, null, 6, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('5e9e23d21e5c4c9f8e66f13fccc94b00', 'bae082dbd74a4ca381c0ad24c886f991', 'del_flag', '逻辑删除标记（0：显示；1：隐藏）', 'varchar(64)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 10, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('61776ea2d3624f258d0a8a0016ed9c67', 'e08d6fbc393047748a2d45c98be42676', 'office_id', '归属部门', 'varchar(64)', 'String', 'office.id|name', '0', '0', '1', '1', '1', '0', '=', 'officeselect', null, null, 2, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('61b9e66dd1474136ba1cfdc527b0d5a1', 'bae082dbd74a4ca381c0ad24c886f991', 'sort', '排序', 'decimal(10,0)', 'Integer', 'sort', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 2, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('65162403a536499d813f4743f299bb08', 'bae082dbd74a4ca381c0ad24c886f991', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, 1, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('6c38b582eca04a64aca77285054f50a2', '73326f175c2d4a63b2d89820a79ba2eb', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 5, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('79a58b85ed514b3db213549105c9e0cc', '3f7c20cfa7b840dc854d9ea27f4de539', 'del_flag', '逻辑删除标记（0：显示；1：隐藏）', 'varchar(64)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 10, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('7b2eddb13f244912a616d0e5d8cf2cd7', 'bae082dbd74a4ca381c0ad24c886f991', 'parent_ids', '所有父级编号', 'varchar(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, 4, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('81df389f3d9b49d08046a6e129900391', '3f7c20cfa7b840dc854d9ea27f4de539', 'id', '主键', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 0, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('843f4843ba544122a47b22249e03525c', '73326f175c2d4a63b2d89820a79ba2eb', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 7, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('872a30c2256742c0acd76c5fb3c83e21', '90d8fc88828d47a99fcbfeaa4f95f0db', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 6, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('884b8d5814ef4010a8c712402dda8d4c', 'bae082dbd74a4ca381c0ad24c886f991', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 9, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('8d33bbcd4fe24e3092f8a29d4e947d35', '3f7c20cfa7b840dc854d9ea27f4de539', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 5, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('979d48a6e2e948ccb3ad904a754ef010', 'bae082dbd74a4ca381c0ad24c886f991', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '0', '0', '=', 'dateselect', null, null, 8, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('9805aafd37774f61aaec3882e1020290', '90d8fc88828d47a99fcbfeaa4f95f0db', 'id', '主键', 'varchar(64)', 'String', 'id', '1', '0', '0', '0', '0', '0', '=', 'input', null, null, 0, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('9b6e8501885545aea6e8d0b98d88e9ae', '3f7c20cfa7b840dc854d9ea27f4de539', 'test_data_main', '外键', 'varchar(64)', 'String', 'testDataMain.id', '0', '0', '1', '1', '1', '0', '=', 'input', null, null, 4, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('aa63196cc78045b0a6f7a990230b8314', 'bae082dbd74a4ca381c0ad24c886f991', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 6, '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:09', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('aaaa154a4fd242c58f86b59bd24fe37f', '3f7c20cfa7b840dc854d9ea27f4de539', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 7, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('ae9d99791a9146fd9504a4900c13f340', 'e08d6fbc393047748a2d45c98be42676', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 8, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b6a63ce00cfe4c57a44f6419877150eb', '73326f175c2d4a63b2d89820a79ba2eb', 'id', '编号', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 0, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b81b7e8858364107a7ece5c86568a8ed', '73326f175c2d4a63b2d89820a79ba2eb', 'end', '目的地', 'varchar(64)', 'com.jeeplus.modules.sys.entity.Area', 'end.id|name', '0', '0', '1', '1', '1', '1', '=', 'areaselect', null, null, 2, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('bfcac8702ffc459d915f431d3afd6849', 'e08d6fbc393047748a2d45c98be42676', 'user_id', '归属用户', 'varchar(64)', 'String', 'user.id|name', '0', '0', '1', '1', '0', '0', '=', 'userselect', null, null, 1, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('c0dde941dfdf47188d116adc3a5276e0', '90d8fc88828d47a99fcbfeaa4f95f0db', 'start', '出发地', 'varchar(64)', 'com.jeeplus.modules.sys.entity.Area', 'start.id|name', '0', '0', '1', '1', '1', '1', '=', 'areaselect', null, null, 1, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('c3cd63f920f044b78d539f652116ad5a', '90d8fc88828d47a99fcbfeaa4f95f0db', 'price', '代理价格', 'double', 'Double', 'price', '0', '1', '1', '1', '1', '0', '=', 'input', null, null, 3, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('c607efb3cb5b4f98bcea2bd5a99dbba0', '90d8fc88828d47a99fcbfeaa4f95f0db', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 5, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('ccc6f2da2b9d4aee93d15d81fe1e55b5', '73326f175c2d4a63b2d89820a79ba2eb', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 6, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('cfba463bdfaa4a4dbe6df26262f7a9f4', 'e08d6fbc393047748a2d45c98be42676', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 12, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('d2ecc47b6e1843fd83abccdb439d7337', '3f7c20cfa7b840dc854d9ea27f4de539', 'price', '代理价格', 'double', 'Double', 'price', '0', '1', '1', '1', '1', '0', '=', 'input', null, null, 3, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('d7de5681415940178d026805e4dae92c', 'bae082dbd74a4ca381c0ad24c886f991', 'parent_id', '父级编号', 'varchar(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, 3, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('da69bd8504ee4bab99b65666ddcedb6a', 'e08d6fbc393047748a2d45c98be42676', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 9, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('de010858cbf341199bc0378e9fb67eae', '73326f175c2d4a63b2d89820a79ba2eb', 'price', '代理价格', 'double', 'Double', 'price', '0', '0', '1', '1', '1', '0', '=', 'input', null, null, 3, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('e1e77f23d114457fbee57f2669af7877', '90d8fc88828d47a99fcbfeaa4f95f0db', 'test_data_main', '外键', 'varchar(64)', 'String', 'testDataMain.id', '0', '0', '1', '1', '1', '0', '=', 'input', null, null, 4, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('e1f4b6dd969b44008b74de69105b7f82', 'e08d6fbc393047748a2d45c98be42676', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, 4, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('e72843f6c5834fce925e0bf6f43a2df2', 'bae082dbd74a4ca381c0ad24c886f991', 'id', '主键', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 0, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('e84ca91bb5534cdb99689edb401f1901', '73326f175c2d4a63b2d89820a79ba2eb', 'test_data_main_id', '业务主表ID', 'varchar(64)', 'String', 'testDataMain.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 4, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('ea3b35f3ea754847be0cf12c14edcb3d', 'e08d6fbc393047748a2d45c98be42676', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 11, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('ea6ab02268704e86ba9154d5f2937b2c', '3f7c20cfa7b840dc854d9ea27f4de539', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '0', '0', '=', 'dateselect', null, null, 8, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('ecd85c32fd5441d390eb5f40c7d3592a', '73326f175c2d4a63b2d89820a79ba2eb', 'start', '出发地', 'varchar(64)', 'com.jeeplus.modules.sys.entity.Area', 'start.id|name', '0', '0', '1', '1', '1', '1', '=', 'areaselect', null, null, 1, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('ed31a959dd644f598f5a7c9f4211ada1', '90d8fc88828d47a99fcbfeaa4f95f0db', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 7, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('ee3b7c3f41914068ad94f12c4ac09ac0', 'e08d6fbc393047748a2d45c98be42676', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 7, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('f292942aa43e44c58486a9de5c380c48', '3f7c20cfa7b840dc854d9ea27f4de539', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 6, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('f91b8587c39d41d98339d9f5ce2d51bc', 'bae082dbd74a4ca381c0ad24c886f991', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 7, '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b7803272f91745b28e08f2265c93e910', '958d7094cff641469c74392b44b2912e', 'update_by', 'update_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'updateBy.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 210, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('1bafaf55611547fba1219f5091c9b72e', '958d7094cff641469c74392b44b2912e', 'update_date', 'update_date', 'date(7)', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '=', 'dateselect', null, null, 220, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('1d63a0e5ee014607aac529df1cb2c795', '958d7094cff641469c74392b44b2912e', 'remarks', 'remarks', 'varchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 230, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('33598da759bc43a99cf7ffda04f67650', '958d7094cff641469c74392b44b2912e', 'del_flag', 'del_flag', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 240, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('2bfb3a1b20024438bb3028625145deb0', '210a79c07c8341e997c1845ee7c7a8bb', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('cb4a577c84434dc6bc880bc1a9cfacb0', '210a79c07c8341e997c1845ee7c7a8bb', 'name', 'name', 'varchar2(200)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('4b89280fcea943329e6daa01e7ef6bb8', '210a79c07c8341e997c1845ee7c7a8bb', 'category', 'category', 'varchar2(2000)', 'String', 'category', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('511b865189c448f891434a061db6ef89', '210a79c07c8341e997c1845ee7c7a8bb', 'file_path', 'file_path', 'varchar2(500)', 'String', 'filePath', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('bb3b3bce89654398a5c4533d11c13e01', '210a79c07c8341e997c1845ee7c7a8bb', 'file_name', 'file_name', 'varchar2(200)', 'String', 'fileName', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('e3668a7b7c144fecbc12837caace73d4', '210a79c07c8341e997c1845ee7c7a8bb', 'content', 'content', 'varchar2(2000)', 'String', 'content', '0', '1', '1', '1', '0', '0', '=', 'textarea', null, null, 60, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('3638357703684180abdc6588314d6902', '210a79c07c8341e997c1845ee7c7a8bb', 'create_by', 'create_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'createBy.id', '0', '1', '1', '0', '0', '0', '=', 'input', null, null, 70, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b426138971794a45a30fb8b6777edae9', '210a79c07c8341e997c1845ee7c7a8bb', 'create_date', 'create_date', 'date(7)', 'java.util.Date', 'createDate', '0', '1', '1', '0', '0', '0', '=', 'dateselect', null, null, 80, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('6e4d1d8162e448dcbd798096364665fc', '210a79c07c8341e997c1845ee7c7a8bb', 'update_by', 'update_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'updateBy.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 90, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('0f0c1c88a1f14c5688bd8a7ecfa55dea', '210a79c07c8341e997c1845ee7c7a8bb', 'update_date', 'update_date', 'date(7)', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '=', 'dateselect', null, null, 100, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('3c7e25407a2a413abf551c72016f55f3', '210a79c07c8341e997c1845ee7c7a8bb', 'remarks', 'remarks', 'varchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 110, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b9cf16d80ae742079a6f65e313ecd794', '210a79c07c8341e997c1845ee7c7a8bb', 'del_flag', 'del_flag', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 120, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('2af5a6e298134042a9e39336fe8e9af4', '6a7937d0475641b4b703363b43f4f56a', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('e8acd2c24da14ca6aca67e3cc61c6d91', '6a7937d0475641b4b703363b43f4f56a', 'userid1', 'userid1', 'varchar2(64)', 'String', 'userid1', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('2f131658bce54421b88af1a97c690ab4', '6a7937d0475641b4b703363b43f4f56a', 'userid2', 'userid2', 'varchar2(64)', 'String', 'userid2', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('1e9db67da6054ac18e151960d4c02e46', '6a7937d0475641b4b703363b43f4f56a', 'msg', 'msg', 'varchar2(1024)', 'String', 'msg', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('5386b0e262c946b5955d90bf7f5062b5', '6a7937d0475641b4b703363b43f4f56a', 'status', 'status', 'varchar2(45)', 'String', 'status', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('20f9c0962d064465a882793644576d14', '6a7937d0475641b4b703363b43f4f56a', 'create_date', 'create_date', 'date(7)', 'java.util.Date', 'createDate', '0', '1', '1', '0', '0', '0', '=', 'dateselect', null, null, 60, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('f6d262725fbb4196af07cbea411891af', 'a0fdd4095f4447c5907b66207935abad', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:11', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('1a85c64e06c5438abcfb23bb759fbe45', 'a0fdd4095f4447c5907b66207935abad', 'title', 'title', 'varchar2(128)', 'String', 'title', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:11', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('7ab67c89c21f41e3ab4f7f9d16aab2a4', 'a0fdd4095f4447c5907b66207935abad', 'overview', 'overview', 'varchar2(128)', 'String', 'overview', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:11', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b328e06cca714a278feb194d578622b5', 'a0fdd4095f4447c5907b66207935abad', 'content', 'content', 'varchar2(2000)', 'String', 'content', '0', '1', '1', '1', '0', '0', '=', 'textarea', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:11', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:11', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b340a3b975a94bd0b1d775963859b61b', 'b2589002245d4118b8dfe3ee7b9b4f0b', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('d21b53e4494a4010bef2daaf69646059', 'b2589002245d4118b8dfe3ee7b9b4f0b', 'readstatus', 'readstatus', 'varchar2(45)', 'String', 'readstatus', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('4fec88c7cbab45ff838a21760a7e2c62', 'b2589002245d4118b8dfe3ee7b9b4f0b', 'senderid', 'senderid', 'varchar2(64)', 'String', 'senderid', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('47de468132204f0facb79f1a6cbc05c0', 'b2589002245d4118b8dfe3ee7b9b4f0b', 'receiverid', 'receiverid', 'varchar2(2000)', 'String', 'receiverid', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('f88868e8d27746078db5e51f8875bd1c', 'b2589002245d4118b8dfe3ee7b9b4f0b', 'sendtime', 'sendtime', 'date(7)', 'java.util.Date', 'sendtime', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('0ddd4615df794a75a5ae206ebe7d0bbc', 'b2589002245d4118b8dfe3ee7b9b4f0b', 'mailid', 'mailid', 'varchar2(64)', 'String', 'mailid', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 60, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('99e7ed5d958e4b1686f4039e2d69f16b', '22b609c736c14145ba1b6b1e33137f08', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('f9dd0ca92d3d4d72ac0fb2ebfc4f3a1b', '22b609c736c14145ba1b6b1e33137f08', 'status', 'status', 'varchar2(45)', 'String', 'status', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('1562b56101f44fb1ad5a772dcbbb27f8', '22b609c736c14145ba1b6b1e33137f08', 'readstatus', 'readstatus', 'varchar2(45)', 'String', 'readstatus', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('51cbf7cb2c7d4cf7a344953d76ccf3a5', '22b609c736c14145ba1b6b1e33137f08', 'senderid', 'senderid', 'varchar2(64)', 'String', 'senderid', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('1da19c2fca7c45019519179c452c3d92', '22b609c736c14145ba1b6b1e33137f08', 'receiverid', 'receiverid', 'varchar2(2000)', 'String', 'receiverid', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('db5ffee9cabd43ec8fce4c618d366f78', '22b609c736c14145ba1b6b1e33137f08', 'sendtime', 'sendtime', 'date(7)', 'java.util.Date', 'sendtime', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 60, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('9b5a4fa50ad84d24a1df8d44d035de46', '22b609c736c14145ba1b6b1e33137f08', 'mailid', 'mailid', 'varchar2(64)', 'String', 'mailid', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 70, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('236340e8bc6a4755a77956dde5b819d4', 'eac70f6c40464231aa4693c0973c3174', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('510f80d84e544338b0077ad994336e5a', 'eac70f6c40464231aa4693c0973c3174', 'type', 'type', 'char(1)', 'String', 'type', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('45de4e9d881a4732986486d493290d1e', '54baa0ad690f46f78bd4373c15810eeb', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('8bdc3f7def6141e6af0313ce68a39ca7', '54baa0ad690f46f78bd4373c15810eeb', 'name', 'name', 'varchar2(200)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
commit;
prompt 100 records committed...
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('45491d75624b4f6a9e1d1cbfc61872cf', '54baa0ad690f46f78bd4373c15810eeb', 'category', 'category', 'varchar2(2000)', 'String', 'category', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('781551306c27476f99e7c1b8b93f9f3e', '54baa0ad690f46f78bd4373c15810eeb', 'package_name', 'package_name', 'varchar2(500)', 'String', 'packageName', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('80369d25d7364b1481d0930e242ec6a2', '54baa0ad690f46f78bd4373c15810eeb', 'module_name', 'module_name', 'varchar2(30)', 'String', 'moduleName', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('ec5b5b98d36f40b7b9d216494e762fe4', '54baa0ad690f46f78bd4373c15810eeb', 'sub_module_name', 'sub_module_name', 'varchar2(30)', 'String', 'subModuleName', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 60, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('e06d10ceae5045fda81898853c4591d5', '54baa0ad690f46f78bd4373c15810eeb', 'function_name', 'function_name', 'varchar2(500)', 'String', 'functionName', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 70, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('9c74fad350cb4663a1276eed4cb0d36c', '54baa0ad690f46f78bd4373c15810eeb', 'function_name_simple', 'function_name_simple', 'varchar2(100)', 'String', 'functionNameSimple', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 80, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('3619156a4eb5499086bdb0d38f56f617', '54baa0ad690f46f78bd4373c15810eeb', 'function_author', 'function_author', 'varchar2(100)', 'String', 'functionAuthor', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 90, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('ed24828ad12b4ea8be8168e27fc0a4c6', '54baa0ad690f46f78bd4373c15810eeb', 'gen_table_id', 'gen_table_id', 'varchar2(200)', 'String', 'genTableId', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 100, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('414a782a066b4920923a1d584212cd43', '54baa0ad690f46f78bd4373c15810eeb', 'create_by', 'create_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'createBy.id', '0', '1', '1', '0', '0', '0', '=', 'input', null, null, 110, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('03126597dafe4fc88c16dccfcd218ecc', '54baa0ad690f46f78bd4373c15810eeb', 'create_date', 'create_date', 'date(7)', 'java.util.Date', 'createDate', '0', '1', '1', '0', '0', '0', '=', 'dateselect', null, null, 120, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('af78ab53bc464b61842f300b3ed73b0a', '54baa0ad690f46f78bd4373c15810eeb', 'update_by', 'update_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'updateBy.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 130, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('55040e816d5f45e38303531470f47c5d', '54baa0ad690f46f78bd4373c15810eeb', 'update_date', 'update_date', 'date(7)', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '=', 'dateselect', null, null, 140, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('3a4d9bcbada140ccb6a2d010cf582898', '54baa0ad690f46f78bd4373c15810eeb', 'remarks', 'remarks', 'varchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 150, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('c1a4cbff715c47c382f94fcb320185a1', '54baa0ad690f46f78bd4373c15810eeb', 'del_flag', 'del_flag', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 160, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('f3a3644fa1cb44e0be6f4546306485cc', '83003e2d787b48989420248039f2827f', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('562917575aaa479c85f26273203de001', '83003e2d787b48989420248039f2827f', 'name', 'name', 'varchar2(200)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('0d737642158e44afa96aa0820c2f1d99', '83003e2d787b48989420248039f2827f', 'comments', 'comments', 'varchar2(500)', 'String', 'comments', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('9db3e7bd9b2b4698989d20dbc39adaeb', '83003e2d787b48989420248039f2827f', 'class_name', 'class_name', 'varchar2(100)', 'String', 'className', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('1a4e91c1761745ffb4d7a2b896b5c877', '83003e2d787b48989420248039f2827f', 'parent_table', 'parent_table', 'varchar2(200)', 'String', 'parentTable', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('a985230aca6940a79136c228aebdc436', '83003e2d787b48989420248039f2827f', 'parent_table_fk', 'parent_table_fk', 'varchar2(100)', 'String', 'parentTableFk', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 60, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('4a8367c32eda499088f4fdf420a9adb1', '83003e2d787b48989420248039f2827f', 'create_by', 'create_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'createBy.id', '0', '1', '1', '0', '0', '0', '=', 'input', null, null, 70, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('009c2e392b284809b723a764d184811f', '83003e2d787b48989420248039f2827f', 'create_date', 'create_date', 'date(7)', 'java.util.Date', 'createDate', '0', '1', '1', '0', '0', '0', '=', 'dateselect', null, null, 80, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('4f102cd96dc14ec2b8ee9abdae55e319', '83003e2d787b48989420248039f2827f', 'update_by', 'update_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'updateBy.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 90, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('4b57f218879c4aa999721a46f97c623d', '83003e2d787b48989420248039f2827f', 'update_date', 'update_date', 'date(7)', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '=', 'dateselect', null, null, 100, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b164c08a4ba1417fb3bc99d9ea4c1928', '83003e2d787b48989420248039f2827f', 'remarks', 'remarks', 'varchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 110, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('99859b12d09a4fccb4fd7e8ffa1d3b57', '83003e2d787b48989420248039f2827f', 'del_flag', 'del_flag', 'char(1)', 'String', 'delFlag', '0', '1', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 120, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('e57030eaca8f4540b4f587eba531a7cf', '83003e2d787b48989420248039f2827f', 'issync', 'issync', 'varchar2(45)', 'String', 'issync', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 130, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('7c98b5ab2e914d2e877868dbf792f8fa', '83003e2d787b48989420248039f2827f', 'table_type', 'table_type', 'varchar2(45)', 'String', 'tableType', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 140, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('9d62238b8ed74addb2f9a1fdd078e6cc', '958d7094cff641469c74392b44b2912e', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('ba5ae8290d38459e891f2aa922963e5f', '958d7094cff641469c74392b44b2912e', 'gen_table_id', 'gen_table_id', 'varchar2(64)', 'String', 'genTableId', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('9f22e0fa0ddb4aa2bf1e97aafb64689a', '958d7094cff641469c74392b44b2912e', 'name', 'name', 'varchar2(200)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('dfc34d45560346029969aa40ab6a2eab', '958d7094cff641469c74392b44b2912e', 'comments', 'comments', 'varchar2(500)', 'String', 'comments', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('9c8c0163634e435d9f35c76ab5e7bc02', '958d7094cff641469c74392b44b2912e', 'jdbc_type', 'jdbc_type', 'varchar2(100)', 'String', 'jdbcType', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('f6fba2ccb05a4504a4c9dcd692665ff4', '958d7094cff641469c74392b44b2912e', 'java_type', 'java_type', 'varchar2(500)', 'String', 'javaType', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 60, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b5a98072e83b42408b72045a9e4f65be', '958d7094cff641469c74392b44b2912e', 'java_field', 'java_field', 'varchar2(200)', 'String', 'javaField', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 70, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('90e34b5814ee4f8281442acf1a6fd8b2', '958d7094cff641469c74392b44b2912e', 'is_pk', 'is_pk', 'char(1)', 'String', 'isPk', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 80, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('2e27b1c5a3e145e88c1b8497063710d1', '958d7094cff641469c74392b44b2912e', 'is_null', 'is_null', 'char(1)', 'String', 'isNull', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 90, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('d5022da40e1f4385aba641bf2ac9e3c5', '958d7094cff641469c74392b44b2912e', 'is_insert', 'is_insert', 'char(1)', 'String', 'isInsert', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 100, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('874db5c5efbe43788b03a3d3273b84ec', '958d7094cff641469c74392b44b2912e', 'is_edit', 'is_edit', 'char(1)', 'String', 'isEdit', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 110, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('8c718a3377a5416faf0fbcce9e5ed184', '958d7094cff641469c74392b44b2912e', 'is_list', 'is_list', 'char(1)', 'String', 'isList', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 120, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('cb4594cad6574cefa57e562c8bd006e8', '958d7094cff641469c74392b44b2912e', 'is_query', 'is_query', 'char(1)', 'String', 'isQuery', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 130, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('2f9addd88b804db29a49b10853768c4f', '958d7094cff641469c74392b44b2912e', 'query_type', 'query_type', 'varchar2(200)', 'String', 'queryType', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 140, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('f79a70b5bbd741fabadcedf3759f8509', '958d7094cff641469c74392b44b2912e', 'show_type', 'show_type', 'varchar2(200)', 'String', 'showType', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 150, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('265fb6c4347b4ea6b116d1b11e3984fd', '958d7094cff641469c74392b44b2912e', 'dict_type', 'dict_type', 'varchar2(200)', 'String', 'dictType', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 160, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('3e9a8ca684c540f9a9e89d52c0653ac5', '958d7094cff641469c74392b44b2912e', 'settings', 'settings', 'varchar2(2000)', 'String', 'settings', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 170, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('cb89ea4678954f2a83ab57b79c056790', '958d7094cff641469c74392b44b2912e', 'sort', 'sort', 'number(10)', 'Integer', 'sort', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 180, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('94dd4d7e9ef446a49d85b61d57ef3bcf', '958d7094cff641469c74392b44b2912e', 'create_by', 'create_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'createBy.id', '0', '1', '1', '0', '0', '0', '=', 'input', null, null, 190, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('4963d379dccc43478a153f79219fd1d3', '958d7094cff641469c74392b44b2912e', 'create_date', 'create_date', 'date(7)', 'java.util.Date', 'createDate', '0', '1', '1', '0', '0', '0', '=', 'dateselect', null, null, 200, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('2ccdd1c3523045ba8e1ee7532ba3196e', '0a8f05eb973b4942af37c45109bd2502', 'id', '主键', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 0, '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('3f5b8a447bdf43a6984ef14cd5bc0596', '0a8f05eb973b4942af37c45109bd2502', 'user_id', '员工', 'varchar(64)', 'com.jeeplus.modules.sys.entity.User', 'user.id|name', '0', '0', '1', '1', '1', '1', '=', 'userselect', null, null, 1, '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('e4f41a2be5e943c9a33866cf21bfb026', '0a8f05eb973b4942af37c45109bd2502', 'office_id', '归属部门', 'varchar(64)', 'com.jeeplus.modules.sys.entity.Office', 'office.id|name', '0', '0', '1', '1', '1', '0', '=', 'officeselect', null, null, 2, '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('377bf7016ae24ecba8a5e91c4e607f29', '0a8f05eb973b4942af37c45109bd2502', 'area_id', '归属区域', 'varchar(64)', 'com.jeeplus.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '1', '0', '=', 'areaselect', null, null, 3, '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('3c63421acae84dc9921bea3889a7c77d', '0a8f05eb973b4942af37c45109bd2502', 'begin_date', '请假开始日期', 'datetime', 'java.util.Date', 'beginDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 4, '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('fc846de689464e1dba24aa087eb26f1e', '0a8f05eb973b4942af37c45109bd2502', 'end_date', '请假结束日期', 'datetime', 'java.util.Date', 'endDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 5, '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('df694ae9ae0f4c45a22306c4a7cbf22b', '0a8f05eb973b4942af37c45109bd2502', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 6, '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('0e80aedf007a4e4c89893ae22a29bfe4', '0a8f05eb973b4942af37c45109bd2502', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 7, '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('02b22b42cf364b1fa3f00d16ea7cb0f5', '0a8f05eb973b4942af37c45109bd2502', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 8, '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('3c3961bc7d884b23bce1deea25f5a415', '0a8f05eb973b4942af37c45109bd2502', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '0', '0', '=', 'dateselect', null, null, 9, '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('42029c7724ed4db5ba08624efa7beb37', '0a8f05eb973b4942af37c45109bd2502', 'remarks', '备注信息', 'nvarchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 10, '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('2ed36547d3e54da496b196f8f685e2d8', '0a8f05eb973b4942af37c45109bd2502', 'del_flag', '逻辑删除标记（0：显示；1：隐藏）', 'varchar(64)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 11, '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:41:53', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b999544d230d40daae8b6e0fdb11adfb', '725b762d1c35408e9c7d9a4715059e3b', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('5577fcaa21144a86a75260a13602beb3', '725b762d1c35408e9c7d9a4715059e3b', 'oa_notify_id', 'oa_notify_id', 'varchar2(64)', 'String', 'oaNotifyId', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('4a0e47c880074627b0400d119132fce8', '725b762d1c35408e9c7d9a4715059e3b', 'user_id', 'user_id', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '0', '0', '=', 'userselect', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('869097db7e394a249b36bf727daa9977', '725b762d1c35408e9c7d9a4715059e3b', 'read_flag', 'read_flag', 'char(1)', 'String', 'readFlag', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b996327de0164567bcd58808aef055a7', '725b762d1c35408e9c7d9a4715059e3b', 'read_date', 'read_date', 'date(7)', 'java.util.Date', 'readDate', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('119a046f52104219b15398cd30671690', '9b406ab5d386448b8a70951a18adc3c9', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('f38ad853bd6c4cc4b410c31ad0319d0b', '9b406ab5d386448b8a70951a18adc3c9', 'value', 'value', 'varchar2(100)', 'String', 'value', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('8785a51ca6ea44c488eed53b44543f14', '9b406ab5d386448b8a70951a18adc3c9', 'label', 'label', 'varchar2(100)', 'String', 'label', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('1e0684d43b5347b987ebc8fc0974f6dc', '9b406ab5d386448b8a70951a18adc3c9', 'type', 'type', 'varchar2(100)', 'String', 'type', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('8112051b56f14849b5c584f77f9b5afa', '9b406ab5d386448b8a70951a18adc3c9', 'description', 'description', 'varchar2(100)', 'String', 'description', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('c1d67faafd164b0499ab79e7340b20f6', '9b406ab5d386448b8a70951a18adc3c9', 'sort', 'sort', 'number(10)', 'Integer', 'sort', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 60, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('76fe1f47c1514b6db9520c82a6d3c3c0', '9b406ab5d386448b8a70951a18adc3c9', 'parent_id', 'parent_id', 'varchar2(64)', 'This', 'parent.id|name', '0', '1', '1', '1', '0', '0', '=', 'treeselect', null, null, 70, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('74661552687949f39c3cfb13c176c2ef', '9b406ab5d386448b8a70951a18adc3c9', 'create_by', 'create_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 80, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('ba54b621e234476a9993a8e7a5eebc4e', '9b406ab5d386448b8a70951a18adc3c9', 'create_date', 'create_date', 'date(7)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 90, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('7d5a3b1f65524fc6981fe6e6879c0253', '9b406ab5d386448b8a70951a18adc3c9', 'update_by', 'update_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 100, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('d42502176ee54bc2afd459b044e38efc', '9b406ab5d386448b8a70951a18adc3c9', 'update_date', 'update_date', 'date(7)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 110, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('8c260ed48d5e4703b927e1f4b2d4e27b', '9b406ab5d386448b8a70951a18adc3c9', 'remarks', 'remarks', 'varchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 120, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('d52519bf78b7448193ca823924424156', '9b406ab5d386448b8a70951a18adc3c9', 'del_flag', 'del_flag', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 130, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('75ee89cd9211466daa910428bfe5df35', 'eac70f6c40464231aa4693c0973c3174', 'title', 'title', 'varchar2(200)', 'String', 'title', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('45de21c7e42d4b9f8521b069a77b9edd', 'eac70f6c40464231aa4693c0973c3174', 'content', 'content', 'varchar2(2000)', 'String', 'content', '0', '1', '1', '1', '0', '0', '=', 'textarea', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('3b7d34e0d0094d03baf9a05e1150f683', 'eac70f6c40464231aa4693c0973c3174', 'files', 'files', 'varchar2(2000)', 'String', 'files', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('5aa94933acdf4baea95b67ddd4d802c4', 'eac70f6c40464231aa4693c0973c3174', 'status', 'status', 'char(1)', 'String', 'status', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 60, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('396605d8737c404992bd9b16b29e9f5a', 'eac70f6c40464231aa4693c0973c3174', 'create_by', 'create_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 70, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('fcb236c836da4c5bb38824298a1b28c2', 'eac70f6c40464231aa4693c0973c3174', 'create_date', 'create_date', 'date(7)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 80, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('1df0e49925fb49c783c4549be821f266', 'eac70f6c40464231aa4693c0973c3174', 'update_by', 'update_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 90, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('e1c601e9d64844e6b8b899a4f1f8f603', 'eac70f6c40464231aa4693c0973c3174', 'update_date', 'update_date', 'date(7)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 100, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('acc44e3038d941a8952f11e3f1cef88b', 'eac70f6c40464231aa4693c0973c3174', 'remarks', 'remarks', 'varchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 110, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('c6c92bba926c4887a8fc2a11e56fe366', 'eac70f6c40464231aa4693c0973c3174', 'del_flag', 'del_flag', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 120, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('16bb4c4725a340ae8e0005e39238cdd3', 'c88f13b4fdc5408d8788e585ca1aea30', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:23', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:23', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('9597e080b5f9407cb3a259d659ccd041', 'c88f13b4fdc5408d8788e585ca1aea30', 'parent_id', 'parent_id', 'varchar2(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('85d999fcb05643b7b6046cf56633e44b', 'c88f13b4fdc5408d8788e585ca1aea30', 'parent_ids', 'parent_ids', 'varchar2(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('0b38c4e08b3646d5b5c3773b3a6d21ef', 'c88f13b4fdc5408d8788e585ca1aea30', 'name', 'name', 'varchar2(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('f590975c8bde4f148e7e6fb03ff504a2', 'c88f13b4fdc5408d8788e585ca1aea30', 'sort', 'sort', 'number(10)', 'Integer', 'sort', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('d07a9d10ab9841f79c0c2b90cba8c3a6', 'c88f13b4fdc5408d8788e585ca1aea30', 'code', 'code', 'varchar2(100)', 'String', 'code', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 60, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('3244607dfc2649a8ab0dbae48d0689b0', 'c88f13b4fdc5408d8788e585ca1aea30', 'type', 'type', 'char(1)', 'String', 'type', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 70, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('93a27b567f4547c2a4859b57a4a9904d', 'c88f13b4fdc5408d8788e585ca1aea30', 'create_by', 'create_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 80, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('0ba2caa044b7434eb1beee13d15c3736', 'c88f13b4fdc5408d8788e585ca1aea30', 'create_date', 'create_date', 'date(7)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 90, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('473cd01486ae4592bedc59bf94660853', 'c88f13b4fdc5408d8788e585ca1aea30', 'update_by', 'update_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 100, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('21f857e7ab8e4a3681e74212aedff5dc', 'c88f13b4fdc5408d8788e585ca1aea30', 'update_date', 'update_date', 'date(7)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 110, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('2172199f5ee6483c9f3f8b5823819d03', 'c88f13b4fdc5408d8788e585ca1aea30', 'remarks', 'remarks', 'varchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 120, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
commit;
prompt 200 records committed...
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('5a8af875091240b4bae8408dcfae3707', 'c88f13b4fdc5408d8788e585ca1aea30', 'del_flag', 'del_flag', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 130, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('fd8b4e5681a84a9eb90eb1283bab3b93', '8d09bc1835fe4deebe8a0674ce80580f', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('a44dcb6acb5b44c78a49de08ed5c9445', '8d09bc1835fe4deebe8a0674ce80580f', 'type', 'type', 'char(1)', 'String', 'type', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('423664a7cae147e595e99e0b5700a939', '8d09bc1835fe4deebe8a0674ce80580f', 'title', 'title', 'varchar2(255)', 'String', 'title', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('45573c75c8b547788893509d6958203f', '8d09bc1835fe4deebe8a0674ce80580f', 'create_by', 'create_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'createBy.id', '0', '1', '1', '0', '0', '0', '=', 'input', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('26dab057827d4b86b7004c61d36b025c', '8d09bc1835fe4deebe8a0674ce80580f', 'create_date', 'create_date', 'date(7)', 'java.util.Date', 'createDate', '0', '1', '1', '0', '0', '0', '=', 'dateselect', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('6474f125eece4cfc945e75302bcb6e81', '8d09bc1835fe4deebe8a0674ce80580f', 'remote_addr', 'remote_addr', 'varchar2(255)', 'String', 'remoteAddr', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 60, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('cfd9a3688f6c40878671dfddd880c0a9', '8d09bc1835fe4deebe8a0674ce80580f', 'user_agent', 'user_agent', 'varchar2(255)', 'String', 'userAgent', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 70, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('9a92b6439cea4815a85eac1b2f70a499', '8d09bc1835fe4deebe8a0674ce80580f', 'request_uri', 'request_uri', 'varchar2(255)', 'String', 'requestUri', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 80, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('0695bbd18ce2491ba0453300f9a24925', '8d09bc1835fe4deebe8a0674ce80580f', 'method', 'method', 'varchar2(5)', 'String', 'method', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 90, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('e2791f7b25c14b0ba7afa6271fa46af9', '8d09bc1835fe4deebe8a0674ce80580f', 'params', 'params', 'varchar2(2000)', 'String', 'params', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 100, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('d75d90db4c184c1d92590fd426c7499c', '8d09bc1835fe4deebe8a0674ce80580f', 'exception', 'exception', 'varchar2(2000)', 'String', 'exception', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 110, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('5b47fcdef4bd4db78bcf787783603c7e', 'cc49581ff1ff4e27bff698dc29e515d2', 'id', 'id', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 10, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('9239f2fb8e944b9685054b62300218b9', 'cc49581ff1ff4e27bff698dc29e515d2', 'parent_id', 'parent_id', 'varchar2(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, 20, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('60121a4407f0410dabd64f831955f046', 'cc49581ff1ff4e27bff698dc29e515d2', 'parent_ids', 'parent_ids', 'varchar2(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, 30, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('a123e90515e94c43835f2441248abbd5', 'cc49581ff1ff4e27bff698dc29e515d2', 'name', 'name', 'varchar2(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, 40, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('df977bf2bac04e39a67561875375f16d', 'cc49581ff1ff4e27bff698dc29e515d2', 'sort', 'sort', 'number(10)', 'Integer', 'sort', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 50, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('7055d37905d24827af270c9ecdde0925', 'cc49581ff1ff4e27bff698dc29e515d2', 'description', 'description', 'varchar2(100)', 'String', 'description', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 60, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('8d6352a6361d4ccb918e8272306d86ef', 'cc49581ff1ff4e27bff698dc29e515d2', 'create_by', 'create_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 70, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('446ffbbdf7fe42869fe3c449235523eb', 'cc49581ff1ff4e27bff698dc29e515d2', 'create_date', 'create_date', 'date(7)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 80, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('e413d71ce7c44f69bfc8658e464cf736', 'cc49581ff1ff4e27bff698dc29e515d2', 'update_by', 'update_by', 'varchar2(64)', 'com.jeeplus.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 90, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('658a99bbe48d4db7aecb28053b6111b0', 'cc49581ff1ff4e27bff698dc29e515d2', 'update_date', 'update_date', 'date(7)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 100, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('67198c4ae9a04d03a3f90b8cac633850', 'cc49581ff1ff4e27bff698dc29e515d2', 'remarks', 'remarks', 'varchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 110, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('fd64cdb77a464c6f967b7d86800f801b', 'cc49581ff1ff4e27bff698dc29e515d2', 'del_flag', 'del_flag', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 120, 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null);
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('4228a650b62d421391ffad05505be47d', '2285cafd9ca54c238fd14eca7114b84a', 'id', '主键1', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 0, '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b1926815024b4554b54d6e64deccf5cc', '2285cafd9ca54c238fd14eca7114b84a', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('96e85932bbc7490da667ec04e02749ef', '2285cafd9ca54c238fd14eca7114b84a', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 2, '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('011babfd36a74c8eb8ef3f6dc47ed14c', '2285cafd9ca54c238fd14eca7114b84a', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 3, '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('c50b30cdf0f94b7aa50bfa63dd6830e7', '2285cafd9ca54c238fd14eca7114b84a', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '0', '0', '=', 'dateselect', null, null, 4, '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('b876c50224ae4516a5a3ae7861958a41', '2285cafd9ca54c238fd14eca7114b84a', 'remarks', '备注信息', 'nvarchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 5, '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '1');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('d687c126af8a434b8a77638d3b0c21ee', '2285cafd9ca54c238fd14eca7114b84a', 'del_flag', '逻辑删除标记（0：显示；1：隐藏）', 'varchar(64)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 6, '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:30:26', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('65de9f10f7bc4c3a8cc0ba081caca21a', '52191d01f0b3420f8446d7c9f6ba07d1', 'id', '主键', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 0, '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('5e10731f87094d0e8c1811ca000f0851', '52191d01f0b3420f8446d7c9f6ba07d1', 'create_by', '创建者', 'varchar2(64)', 'String', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('7064418c4a57450988a72055a642771f', '52191d01f0b3420f8446d7c9f6ba07d1', 'create_date', '创建时间', 'date', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 2, '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('345d18f22d044edaa81e7e23b36e5a52', '52191d01f0b3420f8446d7c9f6ba07d1', 'update_by', '更新者', 'varchar2(64)', 'String', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 3, '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('74ffa2852eea4ad7b4286bf9c97c6b26', '52191d01f0b3420f8446d7c9f6ba07d1', 'update_date', '更新时间', 'date', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '0', '0', '=', 'dateselect', null, null, 4, '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('5ee063d8d4914651a766d8299e2839d5', '52191d01f0b3420f8446d7c9f6ba07d1', 'remarks', '备注信息', 'varchar2(500)', 'String', 'remarks', '0', '1', '1', '1', '0', '0', '=', 'textarea', null, null, 5, '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('957bdfbd4244400b947985fbd5ac129a', '52191d01f0b3420f8446d7c9f6ba07d1', 'del_flag', '逻辑删除标记（0：显示；1：隐藏）', 'varchar2(64)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 6, '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('08efa75ed6d64cde93cf3826918bfc86', '52191d01f0b3420f8446d7c9f6ba07d1', 'parent_id', '父级编号', 'varchar2(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, 7, '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('7f5aa06c700c4218b8ee91f476f62e72', '52191d01f0b3420f8446d7c9f6ba07d1', 'parent_ids', '所有父级编号', 'varchar2(64)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, 8, '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('74f7b7475f3944a38fe94fc340955d72', '52191d01f0b3420f8446d7c9f6ba07d1', 'name', '名称', 'varchar2(300)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'treeselect', null, null, 9, '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, IS_FORM)
values ('edaf989ffc4245f0a2411f1abc7fea8b', '52191d01f0b3420f8446d7c9f6ba07d1', 'sort', '排序', 'varchar(64)', 'Integer', 'sort', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 10, '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:41:19', 'dd-mm-yyyy hh24:mi:ss'), null, '0', '0');
commit;
prompt 242 records loaded
prompt Loading GEN_TEMPLATE...
insert into GEN_TEMPLATE (ID, NAME, CATEGORY, FILE_PATH, FILE_NAME, CONTENT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0', '0', ',,', null, null, null, null, null, '1', to_date('14-03-2016 20:41:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
commit;
prompt 1 records loaded
prompt Loading IIM_CHAT_HISTORY...
insert into IIM_CHAT_HISTORY (ID, USERID1, USERID2, MSG, STATUS, CREATE_DATE)
values ('1cbb3b7c34f8435f9a20d59a810d4e34', 'admin', 'dzq', 'rrr', '0', to_date('19-02-2016 16:20:43', 'dd-mm-yyyy hh24:mi:ss'));
insert into IIM_CHAT_HISTORY (ID, USERID1, USERID2, MSG, STATUS, CREATE_DATE)
values ('1f314293b1654406b621a7cd7e3a2cf7', 'admin', 'ym', 'www\n', '1', to_date('19-02-2016 16:20:43', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 2 records loaded
prompt Loading IIM_MAIL...
prompt Table is empty
prompt Loading IIM_MAIL_BOX...
prompt Table is empty
prompt Loading IIM_MAIL_COMPOSE...
prompt Table is empty
prompt Loading MONITOR...
insert into MONITOR (ID, CPU, JVM, RAM, TOEMAIL)
values ('1', '99', '99', '99', '117575171@qq.com');
commit;
prompt 1 records loaded
prompt Loading OA_NOTIFY...
prompt Table is empty
prompt Loading OA_NOTIFY_RECORD...
prompt Table is empty
prompt Loading SYSTEMCONFIG...
insert into SYSTEMCONFIG (ID, SMTP, PORT, MAILNAME, MAILPASSWORD, SMSNAME, SMSPASSWORD)
values ('1', 'smtp.qq.com', '25', 'xxxxx@com', 'test', 'xxxx', 'xxx');
commit;
prompt 1 records loaded
prompt Loading SYS_AREA...
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '0', '0,', '中国', 10, '100000', '1', '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('17e8e72326574a0ea94b15d6eeddbb6d', '364a832bee8a42afa333e338813330de', '0,1,c11497c3311a4be29253f29bd59ab485,364a832bee8a42afa333e338813330de,', '软件大道', 30, null, '4', '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19298dc65ecd45cc803a6da294d1ff60', '1', '0,1,', '新疆', 30, null, '2', '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('364a832bee8a42afa333e338813330de', 'c11497c3311a4be29253f29bd59ab485', '0,1,c11497c3311a4be29253f29bd59ab485,', '南京', 30, null, '3', '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('90ecd439eb3845db97a627d9242145e8', '1', '0,1,', '上海', 30, null, '2', '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('c11497c3311a4be29253f29bd59ab485', '1', '0,1,', '江苏', 30, null, '2', '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e418dc99691d4e29961d53ca218ece8b', '1', '0,1,', '福建', 30, '0100', '2', '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_AREA (ID, PARENT_ID, PARENT_IDS, NAME, SORT, CODE, TYPE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ee38f91df4444529b00f093be5a07b7a', 'e418dc99691d4e29961d53ca218ece8b', '0,1,e418dc99691d4e29961d53ca218ece8b,', '福州', 30, '0200', '1', '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 16:55:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
commit;
prompt 8 records loaded
prompt Loading SYS_DICT...
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0\0\0', 40, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('96', '1', '男', 'sex', '性别', 10, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('97', '2', '女', 'sex', '性别', 20, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', 30, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', 40, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('bde6043665ef4571b85d0edab667cd15', '3', '树结构表', 'table_type', '表类型', 40, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cc94b0c5df554a46894991210a5fc486', '2', '附表', 'table_type', '表类型', 30, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0a22f3278a624882a822e0820f27efcb', '1', '主表', 'table_type', '表类型', 20, '0', '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '0', '正常', 'del_flag', '删除标记', 10, '0', '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('10', 'yellow', '黄色', 'color', '颜色值', 40, '0', '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型', 50, '0', '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型', 60, '0', '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型', 70, '0', '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型', 80, '0', '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', 90, '0', '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('105', '1', '会议通知', 'oa_notify_type', '通知通告类型', 10, '0', '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('106', '2', '放假通知', 'oa_notify_type', '通知通告类型', 20, '0', '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('107', '3', '部门通告', 'oa_notify_type', '通知通告类型', 30, '0', '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:33', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', 10, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('109', '1', '发布', 'oa_notify_status', '通知通告状态', 20, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('11', 'orange', '橙色', 'color', '颜色值', 50, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('110', '0', '未读', 'oa_notify_read', '通知通告状态', 10, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('111', '1', '已读', 'oa_notify_read', '通知通告状态', 20, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12', 'default', '默认主题', 'theme', '主题方案', 10, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', 20, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('14', 'readable', '橙色主题', 'theme', '主题方案', 30, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('17', '1', '国家', 'sys_area_type', '区域类型', 10, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', 20, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19', '3', '地市', 'sys_area_type', '区域类型', 30, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1c0ac576c33d41fcb4c16602bf4fad5d', 'post', 'post', 'interface_type', '接口类型', 20, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2', '1', '删除', 'del_flag', '删除标记', 20, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('20', '4', '区县', 'sys_area_type', '区域类型', 40, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21', '1', '公司', 'sys_office_type', '机构类型', 60, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('22', '2', '部门', 'sys_office_type', '机构类型', 70, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('221a918bd1e149239a17ab0fdeaf5ecd', 'get', 'get', 'interface_type', '接口类型', 10, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('23', '3', '小组', 'sys_office_type', '机构类型', 80, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('24', '4', '其它', 'sys_office_type', '机构类型', 90, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', 30, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', 40, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', 50, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('28', '1', '一级', 'sys_office_grade', '机构等级', 10, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('29', '2', '二级', 'sys_office_grade', '机构等级', 20, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3', '1', '显示', 'show_hide', '显示/隐藏', 10, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('30', '3', '三级', 'sys_office_grade', '机构等级', 30, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('31', '4', '四级', 'sys_office_grade', '机构等级', 40, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('32', '1', '所有数据', 'sys_data_scope', '数据范围', 10, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', 20, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', 30, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', 40, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', 50, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', 90, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', 100, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('39', '1', '系统管理', 'sys_user_type', '用户类型', 10, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '0', '隐藏', 'show_hide', '显示/隐藏', 20, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('40', '2', '部门经理', 'sys_user_type', '用户类型', 20, '0', '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:34', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('41', '3', '普通用户', 'sys_user_type', '用户类型', 30, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('42', 'basic', '基础主题', 'cms_theme', '站点主题', 10, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', 20, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('44', 'red', '红色主题', 'cms_theme', '站点主题', 30, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('45', 'article', '文章模型', 'cms_module', '栏目模型', 10, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('46', 'picture', '图片模型', 'cms_module', '栏目模型', 20, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('47', 'download', '下载模型', 'cms_module', '栏目模型', 30, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('48', 'link', '链接模型', 'cms_module', '栏目模型', 40, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('49', 'special', '专题模型', 'cms_module', '栏目模型', 50, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '1', '是', 'yes_no', '是/否', 10, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', 10, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', 20, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', 30, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('53', '0', '发布', 'cms_del_flag', '内容状态', 10, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('54', '1', '删除', 'cms_del_flag', '内容状态', 20, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('55', '2', '审核', 'cms_del_flag', '内容状态', 15, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('56', '1', '首页焦点图', 'cms_posid', '推荐位', 10, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', 20, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('58', '1', '咨询', 'cms_guestbook', '留言板分类', 10, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('59', '2', '建议', 'cms_guestbook', '留言板分类', 20, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5b899603552c48519e7ba8eb9da0b41f', '0', '单表', 'table_type', '表类型', 10, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6', '0', '否', 'yes_no', '是/否', 20, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('60', '3', '投诉', 'cms_guestbook', '留言板分类', 30, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('61', '4', '其它', 'cms_guestbook', '留言板分类', 40, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('67', '1', '接入日志', 'sys_log_type', '日志类型', 30, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68', '2', '异常日志', 'sys_log_type', '日志类型', 40, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7', 'red', '红色', 'color', '颜色值', 10, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', 10, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', 20, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('75', 'tree', '树结构', 'gen_category', '代码生成分类', 30, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('76', '=', '=', 'gen_query_type', '查询方式', 10, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('77', '!=', '!=', 'gen_query_type', '查询方式', 20, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('78', 'a;', 'a;', 'gen_query_type', '查询方式', 30, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('79', 'a;', 'a;', 'gen_query_type', '查询方式', 40, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8', 'green', '绿色', 'color', '颜色值', 20, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('80', 'between', 'Between', 'gen_query_type', '查询方式', 50, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('81', 'like', 'Like', 'gen_query_type', '查询方式', 60, '0', '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:35', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', 70, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', 80, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', 10, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', 20, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', 30, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', 40, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', 50, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', 60, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
commit;
prompt 100 records committed...
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9', 'blue', '蓝色', 'color', '颜色值', 30, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', 70, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', 80, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', 90, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('93', 'String', 'String', 'gen_java_type', 'Java类型', 10, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
insert into SYS_DICT (ID, VALUE, LABEL, TYPE, DESCRIPTION, SORT, PARENT_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', 20, '0', '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 17:05:36', 'dd-mm-yyyy hh24:mi:ss'), null, '1');
commit;
prompt 106 records loaded
prompt Loading SYS_LOG...
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7fa1a26e25034b558eea095eba98f381', '1', 'ONLINE开发-表单配置', '1', to_date('20-02-2016 15:51:33', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ffa0409bcd4a4342a6f951f33025aeae', '1', '系统登录', '1', to_date('20-02-2016 16:25:19', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('179b74ac58be440ca3c603f4207a8543', '1', '接口测试-接口测试', '1', to_date('20-02-2016 16:25:29', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/tools/testInterface/test', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d7df6ad3474c4ad49f27c3d93edc38e7', '1', '系统登录', '1', to_date('21-02-2016 13:06:18', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d753675ca48a4667850e8e8975e73917', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('21-02-2016 13:06:44', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('68f8877cbe664761b9eec369623cc9bc', '1', '系统登录', '1', to_date('21-02-2016 13:56:17', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('065d1311c60d4624a12b0e768757ce03', '1', 'ONLINE开发-生成示例-组织结构(树结构)', '1', to_date('21-02-2016 15:44:06', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/test/tree/testTree', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('83732205041e4c4898aa9a7b7d2806b3', '1', '我的面板-个人信息', '1', to_date('21-02-2016 15:44:15', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/user/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('063e5d2a47fa43ca9b14c982b018f79e', '1', '在线办公-通告管理', '1', to_date('21-02-2016 15:44:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/oa/oaNotify', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('16fdddeb8bc84d47be5aaef58739db3f', '1', '日志查询-日志查询', '1', to_date('24-02-2016 01:03:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/sys/log', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1ffcfe9b6c26464992f40351274ce18e', '1', '系统设置-用户管理', '1', to_date('24-02-2016 01:03:35', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('88eaae7971ef478ab769f9d553d54af5', '1', '系统设置-角色管理', '1', to_date('24-02-2016 01:03:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/sys/role/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c9e03ab2b1784775a00e78e5a5720f0e', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('24-02-2016 02:14:10', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('2c7cd828cd99414c85190db4e93c1003', '1', 'ONLINE开发-表单配置', '1', to_date('25-02-2016 10:16:15', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('076336a7be7540aa92acdb918b573424', '1', 'ONLINE开发-生成示例-请假表单(单表）', '1', to_date('25-02-2016 10:16:24', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/one/formLeave', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6deae25711f24e1da853d21ce5df0ba6', '1', 'ONLINE开发-生成示例-组织结构(树结构)', '1', to_date('25-02-2016 10:22:04', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/tree/testTree', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ec2224a5207f438cba3bac40c7776b74', '1', '系统登录', '1', to_date('25-02-2016 10:28:01', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain/form', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('9ffc3facde7848b4b737ce9e298eb5a4', '1', '系统登录', '1', to_date('25-02-2016 11:07:52', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c27f0695810a45efad2067b564fb6a0f', '1', '系统登录', '1', to_date('25-02-2016 12:56:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5153b2a044af44b297f3aeb04ee01544', '1', 'ONLINE开发-表单配置', '1', to_date('25-02-2016 12:56:48', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a8394439abf04652ac7a09432510f625', '1', '系统登录', '1', to_date('25-02-2016 13:35:40', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ebb13215a9d844a6983bf386546c844d', '1', '系统登录', '1', to_date('25-02-2016 15:50:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a89d1c07c7dc4f8ba8fff3abea352b2b', '1', 'ONLINE开发-生成示例-组织结构(树结构)', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:15:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/tree/testTree', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('519bd32c737b4f1b8e3386461c20e5b9', '1', '系统登录', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:30:46', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/form', 'GET', 'id=bae082dbd74a4ca381c0ad24c886f991', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5081e7cd71684f159ce0df1c973b01ff', '1', '系统登录', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:45:46', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/form', 'GET', 'id=bae082dbd74a4ca381c0ad24c886f991', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0a4ad527da894dd684058b303c669224', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:53:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('168de52d103141cdaae3668fb6d7472f', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:26', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('fe856a23d08747be96567193ce417d77', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=gen_scheme', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('40d24d4d0dbe407988adb2313aae7911', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:54:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0a7638fd92184db68b256e5d744ef5ed', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:00', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'name=gen_table&id=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('55603607247648d2afea3a0ebc6b729c', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:10', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c9a012ee3b8648e5951b6f41a7b3b0d8', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:15', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=gen_table_column', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('96b49000bb5642df8fdff3d12a894e9b', '1', '系统登录', '1', to_date('20-02-2016 16:18:14', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('85fb5edc7332472daabd1f1c7c1cd83c', '1', 'ONLINE开发-生成示例-组织结构(树结构)', '1', to_date('20-02-2016 16:18:26', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/test/tree/testTree', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6a34cd7e6faa4e3d8b5c8faf476ae5c3', '1', 'ONLINE开发-生成示例-请假表单(单表）', '1', to_date('20-02-2016 16:18:28', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/test/one/formLeave', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('30cdbe90142e41e49b44155c17332d9e', '1', '我的面板-个人信息', '1', to_date('20-02-2016 16:18:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/sys/user/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a9b47785278f49bcbec14fd9960666aa', '1', '我的面板-常用联系人', '1', to_date('20-02-2016 16:18:52', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/iim/contact/myFriends', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5e488d13acf74f129f836e3bc76e964b', '1', '在线办公-通告管理', '1', to_date('20-02-2016 16:19:00', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/oa/oaNotify', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1d9ecf3dbfcb406fb5593d1aac1f721a', '1', '系统设置-机构管理', '1', to_date('20-02-2016 16:19:09', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/sys/office/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('786f3492dcc447d9962e0fde8ae34483', '1', '系统设置-角色管理', '1', to_date('20-02-2016 16:19:12', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/sys/role/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('160937291d104e88be708ae91fb5dc9e', '1', '系统设置-字典管理', '1', to_date('20-02-2016 16:19:19', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/sys/dict/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b80cb6b75953468ca7ecb5aee00fc450', '1', '接口测试-接口列表', '1', to_date('20-02-2016 16:19:57', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/tools/testInterface', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('90305bfda1b4408f8c471c84ced0c108', '1', '接口测试-接口列表', '1', to_date('20-02-2016 16:20:26', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/tools/testInterface', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6c58175e5b58449caaf7a1549acfb58b', '1', 'ONLINE开发-表单配置', '1', to_date('21-02-2016 13:06:35', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d7e1428176874637a9c8a1508bc1cc5d', '1', 'ONLINE开发-表单配置', '1', to_date('21-02-2016 15:12:59', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ef22af21607d4e198b64ce365c58ef11', '1', '系统登录', '1', to_date('21-02-2016 15:24:47', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/gen/genTable/form', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('484b2880a9c1418583748c9a92e546df', '1', '系统登录', '1', to_date('21-02-2016 15:28:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('91fe1712e13a4d73be2cb68e23fc60ba', '1', '系统登录', '1', to_date('23-02-2016 00:06:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('62f8c12e7dfe4dc4b88bb6a5dc775286', '1', '我的面板-个人信息', '1', to_date('23-02-2016 00:09:48', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/sys/user/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('991113f5aeb741a2be6e35b14841ffd4', '1', '系统设置-菜单管理', '1', to_date('23-02-2016 00:28:14', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a9891f95aa834543856569f2fa9d93be', '1', '系统登录', '1', to_date('23-02-2016 00:45:17', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ae6270baa0b148a886da99c136f78580', '1', '系统登录', '1', to_date('23-02-2016 01:36:40', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('fc4e58ade2974d97a66152dba5f16c05', '1', '系统登录', '1', to_date('23-02-2016 01:48:23', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('43c7c46619794061971543011b1d4795', '1', '系统登录', '1', to_date('23-02-2016 01:49:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c1e37865b494480284b0e8f8e52ddd55', '1', '系统设置-用户管理', '1', to_date('23-02-2016 01:49:16', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('eae8b6975975463b88bf43790c224624', '1', '系统设置-角色管理', '1', to_date('23-02-2016 01:52:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/role/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('67d92628de614a84bf7e656719daa520', '1', '系统设置-字典管理', '1', to_date('23-02-2016 01:52:17', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/dict/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0df6e0b57ceb4954ad7183731bcdd1a7', '1', '我的面板-通讯录', '1', to_date('23-02-2016 01:52:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/iim/contact/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1720117d8a9c460fa2094fa96d63ff72', '1', 'ONLINE开发-表单配置', '1', to_date('23-02-2016 01:53:35', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('2e5e218355b14d71b756b5ce67fe6c6a', '1', '系统登录', '1', to_date('23-02-2016 01:59:50', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/dict/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('10cf29116c8b4db9b418226947304759', '1', '系统设置-字典管理', '1', to_date('23-02-2016 01:59:50', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/dict/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('653bd2400dee4e30a05f413656236f14', '1', '系统设置-字典管理', '1', to_date('23-02-2016 02:00:09', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/dict/', 'POST', 'orderBy=&pageNo=0&description=物理类型&pageSize=10&type=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ac090a47d1df4cc79afdab8263038c1a', '1', '系统设置-字典管理', '1', to_date('23-02-2016 02:00:14', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/dict/', 'POST', 'orderBy=&pageNo=0&description=物理&pageSize=10&type=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3c6f94e106b947bd99aff64bfd264d97', '1', '系统设置-字典管理', '1', to_date('23-02-2016 02:00:21', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/dict/', 'POST', 'orderBy=&pageNo=0&description=类型&pageSize=10&type=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a94860c214ec4130ab6fd1f8618cdd4d', '1', '系统设置-字典管理', '1', to_date('23-02-2016 02:00:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/dict/', 'POST', 'orderBy=&pageSize=10&type=&pageNo=2&description=类型', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('86432f21d1f64f26bf52ee1d0dd0d658', '1', '系统设置-字典管理', '1', to_date('23-02-2016 02:00:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/dict/', 'POST', 'orderBy=&pageNo=3&description=类型&pageSize=10&type=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('cda1d1316db1407fbf7690ac49d0bdff', '1', '系统登录', '1', to_date('23-02-2016 02:07:31', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/gen/genTable/form', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7b347cfc54ae4ecda2bd3cf8e7efaca3', '1', '系统登录', '1', to_date('23-02-2016 13:38:04', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('8ffe18eff41149138b8a031fcc1428c5', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('24-02-2016 02:39:53', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6aba5faf9cb3441e820c05307220bd97', '1', '接口测试-接口列表', '1', to_date('20-02-2016 19:42:28', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/tools/testInterface', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c0ba9c44398f474eb616dfa4bbc86ef4', '1', 'ONLINE开发-表单配置', '1', to_date('21-02-2016 15:28:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('89a6689a5da64bf2b215ccf53712843e', '1', '系统登录', '1', to_date('21-02-2016 15:35:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('78915607b6a14ec0ba0aad3e0529a42c', '1', '系统登录', '1', to_date('22-02-2016 22:51:45', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('dc104f3fbd464790903c50bbd364b54c', '1', '系统登录', '1', to_date('22-02-2016 23:27:55', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ced61e45976f42d9b6b23c1f08a129b4', '1', '我的面板-通讯录', '1', to_date('23-02-2016 01:41:24', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/iim/contact/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ef3738666bee4dcf802067041a30206c', '1', '系统设置-用户管理', '1', to_date('23-02-2016 01:42:23', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7646c1120f95400bb9c59a328137bf0f', '1', '系统设置-用户管理', '1', to_date('23-02-2016 01:48:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '/BZDX/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('46bd52f2619746fe8fe4b52b239febb3', '1', '系统登录', '1', to_date('23-02-2016 01:52:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/role/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('2977c6ae33524245a16c445ad1366f3c', '1', '系统设置-机构管理', '1', to_date('23-02-2016 01:52:06', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/office/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d378367960914dee8730dda8dada7523', '1', '系统设置-菜单管理', '1', to_date('23-02-2016 01:52:09', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('36aa529764ec42db8f8fcb38b35dfa7c', '1', '系统设置-区域管理', '1', to_date('23-02-2016 01:52:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/area/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b5433d896cd14daf91d4850d02b53d72', '1', '日志查询-日志查询', '1', to_date('23-02-2016 01:52:21', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/log', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('cbbb06cb550f49a6af6f6d808dd4420f', '1', '系统登录', '1', to_date('24-02-2016 00:51:53', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('2d72358d8ffa4308816edb221e7b61d7', '1', '我的面板-个人信息', '1', to_date('24-02-2016 00:52:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/sys/user/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('49b417c984144cef9e3dfd29b352d5af', '1', '系统登录', '1', to_date('24-02-2016 01:02:46', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d69bbff7a10c4be4b793f417e94039d3', '1', 'ONLINE开发-表单配置', '1', to_date('24-02-2016 18:28:17', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1160c3c3923f485b8c72ab5258561293', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('24-02-2016 18:28:26', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4cec35f1c893408ea8b780f74190dcc4', '1', '系统登录', '1', to_date('25-02-2016 10:16:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7509f87622a64afc8f8e8e6f2d6de3b6', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('25-02-2016 10:16:21', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('216c3998fe7d47e7bf3331e69ae2269c', '1', 'ONLINE开发-生成示例-组织结构(树结构)', '1', to_date('25-02-2016 10:16:32', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/tree/testTree', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('8941dacd0d264cb1912416f09f932abd', '1', 'ONLINE开发-生成示例-请假表单(单表）', '1', to_date('25-02-2016 10:22:03', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/one/formLeave', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('369e2ea0a10a4ebf94ff97eb65accafe', '1', '系统登录', '1', to_date('25-02-2016 12:00:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('64a01610bd1148f79ce32f856247522b', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('25-02-2016 12:00:32', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('861a64d2b18947bf908109f1914c852b', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('25-02-2016 12:56:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b29332f1ea8d4c0da2f965d7db37c58d', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('25-02-2016 13:35:48', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6c3ac7409e7f4ba195ac1ae0996c2b0d', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('25-02-2016 15:50:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4e89b40b7efd4c4195e4839b479764fc', '1', '系统登录', '1', to_date('25-02-2016 16:18:50', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7e0ab7c36de9478d853fc320d16fa12b', '1', '系统登录', '1', to_date('25-02-2016 16:58:01', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7ecd209fe90849c0b89eda5d6b304809', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('25-02-2016 16:58:10', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('f8e78dc9b81f4b5b989d31e57d52cbc5', '1', 'ONLINE开发-生成示例-票务代理(一对多）', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 21:50:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
commit;
prompt 100 records committed...
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('8e9c2d9d1a6d4691b0a95ea24fbecf3e', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:29', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b6d095eb85ec470e8d545531421360a2', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:34', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'name=gen_template&id=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4e484df1091348f7920b4c150b75684e', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:43', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('cf15eb574991427bafc689f6bdeeb89f', '1', '系统登录', '1', to_date('20-02-2016 15:51:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d9362b14c53e4697a27b87c509b375c5', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('20-02-2016 15:51:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0e5e346aeaa5489caf74edc11ff6bee1', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('20-02-2016 16:18:24', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c8e1a7b03ca343108ec61a1c995d2124', '1', 'ONLINE开发-表单配置', '1', to_date('20-02-2016 16:18:34', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c055d4abc6b84ae2b4d76c1e0639d990', '1', '我的面板-通讯录', '1', to_date('20-02-2016 16:18:48', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/iim/contact/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('79b8bc68ce2e441082086193c70b96ff', '1', '在线办公-我的通告', '1', to_date('20-02-2016 16:18:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/oa/oaNotify/self', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('66c4d9ef7d5f49b1afab18fa2c0f5586', '1', '系统设置-用户管理', '1', to_date('20-02-2016 16:19:04', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5a3c430ebadc4311a11f3fa0d2343516', '1', '系统设置-菜单管理', '1', to_date('20-02-2016 16:19:07', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d674bf28307b4dff85dde86be46ea5dc', '1', '系统设置-区域管理', '1', to_date('20-02-2016 16:19:14', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/sys/area/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ae7e1bbfbafc4f4999209829be5aab54', '1', '日志查询-日志查询', '1', to_date('20-02-2016 16:19:24', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/sys/log', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ed1818ffbf5643e0b89ab4d597823ff1', '1', '接口测试-接口列表', '1', to_date('20-02-2016 16:25:26', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/tools/testInterface', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('43d9d6c3335f49f1bf903a56c135a339', '1', '二维码测试', '1', to_date('20-02-2016 16:25:33', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/tools/TwoDimensionCodeController', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('40b6a8c2d3d84886be9bb32887271ae5', '1', 'ONLINE开发-表单配置', '1', to_date('21-02-2016 13:47:36', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0fc379f7095b4b59a76602e1c95667a0', '1', '系统登录', '1', to_date('21-02-2016 15:12:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('976023fd901b4c1d846b9d57a6220158', '1', 'ONLINE开发-表单配置', '1', to_date('21-02-2016 15:36:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('8e7077b801a2437b94bdbfea3826dd03', '1', 'ONLINE开发-表单配置', '1', to_date('21-02-2016 15:42:36', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('587de4b47cd8404989ada5a47eadda3f', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('21-02-2016 15:44:03', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ef8e1f88d31a4d57961838265f89597b', '1', 'ONLINE开发-生成示例-请假表单(单表）', '1', to_date('21-02-2016 15:44:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/test/one/formLeave', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ed81eb24911c42c99d0ea1820d390fa7', '1', '在线办公-我的通告', '1', to_date('21-02-2016 15:44:20', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/oa/oaNotify/self', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('f5c80644503e4b7ca6eb536289f7e925', '1', '系统设置-机构管理', '1', to_date('21-02-2016 15:44:28', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/office/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3c8cbe89e4eb477aa59965ec866ca30c', '1', '系统设置-用户管理', '1', to_date('21-02-2016 15:46:30', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('9baa12081a4e4331adc3cba91d94de6c', '1', '系统设置-用户管理', '1', to_date('21-02-2016 15:47:04', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ca6b9234b7474fbcacc2716feab40938', '1', '二维码测试', '1', to_date('23-02-2016 00:12:00', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/tools/TwoDimensionCodeController', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ddf3bd8672784f4da316a41b0858a56a', '1', '系统登录', '1', to_date('23-02-2016 00:17:43', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('510e6051b8a64e79ab1ef19b489159e9', '1', '系统登录', '1', to_date('23-02-2016 00:18:15', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('33fe04f0f0b44f899630323659840aab', '1', 'ONLINE开发-表单配置', '1', to_date('23-02-2016 00:45:35', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('825869f5943f4a9cb3a7f3c14f015b4d', '1', '我的面板-个人信息', '1', to_date('23-02-2016 01:39:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/user/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0bbee0f884f547dfbef845c31ae655e3', '1', '系统设置-角色管理', '1', to_date('23-02-2016 01:42:15', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/role/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('dbda5e3001284e49b6615ceedb3fa746', '1', '系统设置-用户管理-删除', '1', to_date('23-02-2016 01:42:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/user/deleteAll', 'GET', 'ids=0e01985207154708a01e53ca07965665,1690569548d2400b893e4348b5445468,cb176ef0bce14c80ac5c2809861b560...', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('481392ba67f34925a932873deee03d42', '1', '系统登录', '1', to_date('23-02-2016 12:49:49', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('e05edcb8fb484dccbcb8a9c281428e80', '1', '系统设置-用户管理', '1', to_date('24-02-2016 00:52:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('648e69e2b372455890ed446a8d6f60e5', '1', 'ONLINE开发-表单配置', '1', to_date('24-02-2016 00:53:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3920b376b7d84665985f4ee7d390569f', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('24-02-2016 00:53:23', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('650f14cfda554c088124b4f11b68ccab', '1', '系统登录', '1', to_date('24-02-2016 02:14:01', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('29e80adf4e68424da65f57a03b32505c', '1', '系统登录', '1', to_date('24-02-2016 02:28:30', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain/form', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('93d8dc05f3054d7fad3ceef2e3d3462a', '1', '系统登录', '1', to_date('25-02-2016 12:18:17', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7c98a5926ff04e94a4e6513a2aa375d0', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('25-02-2016 12:18:28', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6719d32e9dc3466dbc990fa6c4dbe014', '1', '系统登录', '1', to_date('20-02-2016 19:42:11', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('88d029a548ca4cc78f6010552c75a0bc', '1', '系统登录', '1', to_date('21-02-2016 12:29:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a;JSESSIONID=ab8c7b18ad0f43b09e5193caa98baede', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c8aee41f61a54b04b19ae98a4a023f87', '1', 'ONLINE开发-表单配置', '1', to_date('21-02-2016 12:29:48', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('aeda89d5b8224923a1f941e868a5cd0a', '1', '系统登录', '1', to_date('21-02-2016 12:43:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a;JSESSIONID=ab8c7b18ad0f43b09e5193caa98baede', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3b7de152cc2f49269067d5546ebdd642', '1', '系统登录', '1', to_date('21-02-2016 13:46:23', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4d650f102eb444c29b8040d0f2aaaf59', '1', '我的面板-个人信息', '1', to_date('21-02-2016 13:46:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/user/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('76cfc1442855427282c5979700d000d9', '1', '系统登录', '1', to_date('21-02-2016 15:42:26', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d3d62d2ff0e04262974c74c62bea8a7e', '1', '系统登录', '1', to_date('22-02-2016 22:43:20', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b1e9458ae4224d8f9a9b8409e0df2431', '1', '系统登录', '1', to_date('22-02-2016 22:59:07', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('50eb70773a964efb86483e9be4611cb7', '1', '系统登录', '1', to_date('22-02-2016 23:01:33', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('27e570a52e66452796522f7344badef3', '1', '系统设置-用户管理', '1', to_date('22-02-2016 23:06:25', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('75fd1c0791e8496c9e3b47a47b871f2c', '1', 'ONLINE开发-表单配置', '1', to_date('23-02-2016 00:06:49', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3d476e2f43ac450381b1d152d817092f', '1', '在线办公-我的通告', '1', to_date('23-02-2016 00:09:59', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/oa/oaNotify/self', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3d4feb53058c458686207b97ffa7b51a', '1', '系统设置-菜单管理', '1', to_date('23-02-2016 00:10:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('21330191718e4c0eab63d1433279397a', '1', '系统登录', '1', to_date('23-02-2016 00:11:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5fd025e9a3644d1b9319180eeed2c928', '1', '系统登录', '1', to_date('23-02-2016 00:28:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('daea762a6c4f452aa471a38acfb1283c', '1', '系统登录', '1', to_date('23-02-2016 00:41:11', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('e32d2e8ca66645f2840a8ee4c8fcf8ee', '1', 'ONLINE开发-表单配置', '1', to_date('23-02-2016 12:50:01', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('506b9c96a96740b1b6560323575f04f1', '1', '系统登录', '1', to_date('23-02-2016 12:57:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:44.0) Gecko/20100101 Firefox/44.0', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('9e3a60f839f043308ab160f7634958c7', '1', '二维码测试', '1', to_date('24-02-2016 01:03:12', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/tools/TwoDimensionCodeController', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('359771410f1140c2844056294582bed5', '1', 'ONLINE开发-表单配置', '1', to_date('24-02-2016 01:03:30', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ba214b79a2de47eab3622118273e0885', '1', '系统设置-菜单管理', '1', to_date('24-02-2016 01:03:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b051a12ccb84474f98c5751448cba59b', '1', '系统设置-字典管理', '1', to_date('24-02-2016 01:03:44', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/sys/dict/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('79b460a327d44f90825c3ed33a9bce22', '1', '系统登录', '1', to_date('24-02-2016 02:38:50', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('9b1f89dbb2554006a9a94c499fd6e505', '1', '系统登录', '1', to_date('24-02-2016 18:28:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5cae81ab67aa49aab22c1d53358f894c', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('25-02-2016 11:12:12', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('bf5d7c62064248d5b11201ba2fe72ce8', '1', '系统登录', '1', to_date('25-02-2016 11:24:36', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain/form', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c6185c1679e04d0c885b737bc9d2d797', '1', '系统登录', '1', to_date('25-02-2016 12:46:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/tag/treeselect', 'GET', 'module=&isAll=&checked=&extId=&url=/sys/office/treeData?type=3', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0b88ea9f2fdf415ab2d831fde0881774', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('25-02-2016 16:18:59', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('2cbef52f77e847a78d750615c48379e9', '1', '系统登录', '1', to_date('25-02-2016 21:47:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5a34d7374811417db09eced65eef118b', '1', '系统设置-用户管理', '1', to_date('25-02-2016 21:47:18', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('9c79cdf9e525447c8db8d48e51b94827', '1', '系统登录', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 21:50:11', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c666c0d14c824b8cb8ecd96b92791abe', '1', '系统登录', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:11:00', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b59af0ddedb149d38b130e133324d31b', '1', 'ONLINE开发-生成示例-票务代理(一对多）', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:11:07', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('010e9b8100f44fe18d05fab4bcf81a91', '1', '系统登录', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:13:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('52837da6f8a74285b7ebf727402364df', '1', 'ONLINE开发-表单配置', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:14:28', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4ff74c013783452a9d38951177762d35', '1', '系统登录', '1', to_date('13-03-2016 23:19:54', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('07865a4324fe4943a6b880c2797de0db', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:19:58', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c47dfe21770949188492bd7eced2632e', '1', 'ONLINE开发-表单配置-导入', '1', to_date('13-03-2016 23:20:04', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('22d86debc0e84c3dbf4cd792e848e589', '1', 'ONLINE开发-表单配置-导入', '1', to_date('13-03-2016 23:20:07', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=xxx', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5367fd7a72c94be39228061c00a9a2c8', '1', 'ONLINE开发-表单配置-删除', '1', to_date('13-03-2016 23:20:11', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/deleteDb', 'GET', 'id=3a040abf2d894b08abf305893d94578a', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6db636334f594ce890ce3a119ec1221c', '1', '系统登录', '1', to_date('13-03-2016 23:21:15', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('26ee7ea1fb8344fb873f5c4981a23787', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:21:18', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1b407b57affb41abbde8c310e9422901', '1', 'ONLINE开发-表单配置-导入', '1', to_date('13-03-2016 23:21:25', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ece6a9c3563d4355b0df5ba7df1ace6e', '1', 'ONLINE开发-表单配置-导入', '1', to_date('13-03-2016 23:21:28', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=xxx', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b0c17755e79d4253b04761f05aa14e16', '1', 'ONLINE开发-表单配置-删除', '1', to_date('13-03-2016 23:21:32', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/deleteDb', 'GET', 'id=580e43301aad491785680523de0a0d63', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('40831f4533b047ca988ad806f4e0fe89', '1', '系统登录', '1', to_date('13-03-2016 23:22:30', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('f542981494194578a176c48434e362ed', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:22:34', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ff9965691af44259bae266d73daa83ea', '1', 'ONLINE开发-表单配置-导入', '1', to_date('13-03-2016 23:22:38', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d5afc74894dc41bebe1004db383496ba', '1', 'ONLINE开发-表单配置-导入', '1', to_date('13-03-2016 23:22:41', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=xxx', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3e80dad3675e4f8aa483c5115c5f8ad1', '1', 'ONLINE开发-表单配置-删除', '1', to_date('13-03-2016 23:22:48', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/deleteDb', 'GET', 'id=a27b01d6af9046378071fb079d010ad6', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ae6058d4dec942fb8ac1f61bc4f4c7a5', '1', '系统登录', '1', to_date('13-03-2016 23:25:54', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('f76f7aad7ed84859a7de0b7693dd9937', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:25:58', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('58a534f3f4ca4d418c8e68617335d136', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:26:05', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2285cafd9ca54c238fd14eca7114b84a', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('2e3c73e08d9a434ea3027aa3c145d354', '1', '系统登录', '1', to_date('13-03-2016 23:27:51', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b96dd45f22d642248b4312617ee1fd10', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:27:55', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('2a71bc8fbfb540e3937d60511f542354', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:28:00', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2285cafd9ca54c238fd14eca7114b84a', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c558a072ecb3451bb4477aff0eb023a2', '1', '系统登录', '1', to_date('13-03-2016 23:29:56', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d8f018456c814c16b360c300efa3508d', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:30:00', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('93f14631cbca466d94912503df185a02', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:30:05', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2285cafd9ca54c238fd14eca7114b84a', null);
commit;
prompt 200 records committed...
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c28afbd7470f453a9ed7f1894e2893b5', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:30:29', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2285cafd9ca54c238fd14eca7114b84a', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('baf5f13ef01b4c2f9f099b31f4fcbb36', '1', '系统登录', '1', to_date('13-03-2016 23:38:56', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a11717fd884b44c5ba92b9de0d044c55', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:39:00', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d0fc1c79b068467b97074cca7cb242b2', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:39:03', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('821c37439bd541219f2e78256cc14513', '1', '系统登录', '1', to_date('13-03-2016 23:40:32', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4b991934f9ad4f20923a09d7c16a533d', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:40:36', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b5f03de2bd044ddc9e05d5b37e9c2dfd', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:17:00', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('610c68696f0540fb9de8eb43ac6021dd', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:17:04', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('57c928baff7341ce881195d610e30048', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:18:21', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c8d7431f210448d0982682ed1059a6f2', '1', '系统登录', '1', to_date('13-03-2016 22:36:09', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b8b4af8379cf453d90c0bb721b5bb8c7', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:40:40', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('94fb08db0a2e434a903ad832c84f5f55', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:41:22', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=52191d01f0b3420f8446d7c9f6ba07d1', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0b23f16e691c4558a854af15d6f40411', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:43:09', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=52191d01f0b3420f8446d7c9f6ba07d1', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3e3013150739459e96422efc343d9dd8', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('13-03-2016 23:43:51', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5acf611c059a49f3ae9431b8a411c909', '1', 'ONLINE开发-生成示例-组织结构(树结构)', '1', to_date('13-03-2016 23:43:56', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/test/tree/testTree', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('710e46d20e934f73bd8c366c2b92ee4a', '1', 'ONLINE开发-生成示例-请假表单(单表）', '1', to_date('13-03-2016 23:44:06', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/test/one/formLeave', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a764f4790ff24fadb9f97d34dfa22290', '1', '系统设置-菜单管理', '1', to_date('13-03-2016 23:44:35', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4561475d5bd4430e82fd18d86622dbff', '1', '系统设置-菜单管理', '1', to_date('14-03-2016 19:48:23', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('115c6faa0abc4c44872126fbbf7f8287', '1', 'ONLINE开发-表单配置', '1', to_date('14-03-2016 19:48:44', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('69bd557e92434f5297cd7f836a364492', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('14-03-2016 19:48:48', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1a7898c5857743e8b4c7fdd8b8db3395', '1', 'ONLINE开发-生成示例-组织结构(树结构)', '1', to_date('14-03-2016 19:48:51', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/test/tree/testTree', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b2a8c8f69135424ab814e005ccb06446', '1', 'ONLINE开发-生成示例-请假表单(单表）', '1', to_date('14-03-2016 19:48:52', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/test/one/formLeave', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1dd98d7a93404f9c9d86af4cc92b7f88', '1', '系统设置-机构管理', '1', to_date('14-03-2016 19:59:02', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/office/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4e358d8b5c8143beb322b8c241a7e0bd', '1', '系统设置-用户管理', '1', to_date('14-03-2016 20:00:34', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('91c7449fa1a14bf3a67d7a451edc3c22', '1', '系统设置-菜单管理', '1', to_date('14-03-2016 20:00:36', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('fca042e6a6e94a0b8757808f43358d3a', '1', '在线办公-通告管理', '1', to_date('14-03-2016 20:00:46', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/oa/oaNotify', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ac9e426834164ee9ad316f35c84b9ca9', '1', '系统设置-用户管理', '1', to_date('14-03-2016 20:00:47', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('9153288aae7747f2be98c1e3621042d6', '1', '系统监控-日志查询', '1', to_date('14-03-2016 20:00:49', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/log', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('e1a0e3ca585f4f34ae4e7289c33b9e49', '1', '系统监控-系统监控管理', '1', to_date('14-03-2016 20:00:51', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/monitor/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('90417691427f4b21a5583f06ba5f2068', '1', '系统监控-系统监控管理', '1', to_date('14-03-2016 20:00:54', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/monitor/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('151d15a8e89040b290ed9e93da30e623', '1', '系统登录', '1', to_date('14-03-2016 20:02:18', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('782e87124a844cbda7cb5db6767df291', '1', '系统监控-日志查询', '1', to_date('14-03-2016 20:03:48', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/log', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a805c5d4658a4109a63f2a92f3da0678', '1', '系统监控-系统监控管理', '1', to_date('14-03-2016 20:03:50', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/monitor/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('9819187598fd4a75aa1eab474620d835', '1', '系统登录', '1', to_date('14-03-2016 20:04:31', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3a90de9ef23b4750b8b6223c3f1fa95f', '1', '系统监控-日志查询', '1', to_date('14-03-2016 20:04:36', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/log', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1998173380ce4c179593fa8e93a8efac', '1', '系统监控-系统监控管理', '1', to_date('14-03-2016 20:04:40', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/monitor/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b6cd4c3055914df79d016f681ca40f2f', '1', '系统登录', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:46', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=gen_table_column', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('e1671a5b827b4ba1bd786c84cf1d09e6', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:46', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=gen_table_column', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('72614251521e4d7c919b96e7f4925240', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('85f52fdc013c4c598fc1a75e88c82f5a', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:55', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'name=iim_chat_history&id=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('41d88fc1096b4cf3b6cec937741fe41b', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:55:59', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('166bfeba62ec4ce8a34cdc8044d8ac90', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:11', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'name=iim_mail&id=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a837fb496cb142cbb8ae24c9ced0428d', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:17', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('dd5010eda9ef4359bc361cc635a615dc', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:21', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=iim_mail_box', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('353ef18922534c93995ab54d3d5cc53c', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:32', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'name=iim_mail_compose&id=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7979e3dcf4f84bb1ac153d813d042c5e', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=iim_mail_compose', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('29bd20379a424373a3eb66dcabff5ba7', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:00', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=oa_notify', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b9e9e40c7957467fa91beca78ed9c596', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1d5269a67a724d54a1dee393f7685603', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:24', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'name=sys_area&id=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0672bc9b4b8f4518a9e0e171b66f8f35', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:26', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b0d09a135c984507a6400632b0b1e5a1', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ab624ed99d214933905bfddfa13c22db', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:36', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'name=sys_log&id=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d04d1149c56647e1982f716e7c62d533', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:52', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=sys_mdict', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('9bb23483b2514f678021ecaf89058149', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:25', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('edc1eb46dc9c4ef59489c0fa7d257c13', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('52b995aa16544a23b592bb8f5e8c651d', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:56:53', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('368be680aceb47a0a72e0d2111720895', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:16', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=oa_notify_record', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('e7f81cc234684ffcb525ef7a3ef75d64', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:19', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('13057cb4ce9b41af8bd183b5a40487ec', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:33', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=sys_area', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('419feaeb404a451182837acc421471f2', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'POST', 'name=sys_dict&id=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('fa0e25874c86411ca07384dae98fc881', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:57:45', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a82e911294a64c7c893169212875f1f0', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:48', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('12cdc87094464c7c94a0dd793c950d5f', '1', 'ONLINE开发-表单配置-导入', 'f6679e1c07b94e2f9b66d69b271e1bbe', to_date('25-02-2016 22:58:55', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', '/BZDX/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3d189ee1605e4b25894d165817157c8f', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 20:15:55', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('257e16ca56a14f7cad4f04be7d9e7fc0', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 20:16:19', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2285cafd9ca54c238fd14eca7114b84a', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('22778600b0a04e7d8231acc00c6d725d', '1', '系统登录', '1', to_date('13-03-2016 20:26:11', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b0a11bfc7e0d412da9f94cd17f0e8503', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 20:31:00', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ba5526b5f4334707a4ef82469e5c1e8d', '1', '系统登录', '1', to_date('13-03-2016 20:31:46', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ea1dc1d8bc564ea786a240b8c0c38b90', '1', '系统登录', '1', to_date('13-03-2016 21:25:18', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('91a6bf2f0a6b458dae3da18b5fe52927', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 21:25:27', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('81e2548b91284b0f8ac5ad96725f92fc', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 21:25:32', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('70bd978b31ce478ebeec64c17aeca1dc', '1', '系统登录', '1', to_date('13-03-2016 21:32:47', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3378453f9bd4419aae52a7ea7ef594a1', '1', '系统登录', '1', to_date('13-03-2016 23:34:16', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3bef342b446d4d1b99fbc9dce6f4afca', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:34:57', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('da091d7047a9409eba03230e28871b0f', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:35:01', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4ce0d5e08b394c32bd36eead0fc0f2c3', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:35:37', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=52191d01f0b3420f8446d7c9f6ba07d1', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5836f298f8934e229d748c11b76fdfe9', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:35:47', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2285cafd9ca54c238fd14eca7114b84a', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('06653574306d40179c1ccf6c97cb02d2', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:35:51', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=bae082dbd74a4ca381c0ad24c886f991', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7764cc37e0a44ea38cf097e89cb68c4f', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:40:46', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=52191d01f0b3420f8446d7c9f6ba07d1', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b62e7a065b654d3c8c9b9bed27e6c2eb', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:41:03', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=52191d01f0b3420f8446d7c9f6ba07d1', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('8040083e405f41f9bb124f145c784b4c', '1', '系统登录', '1', to_date('13-03-2016 23:43:00', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c332939ac7f34955b0bc69d73c04bed8', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:43:04', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('e2a5a1b6623b421f92ce71d307a66ade', '1', '系统登录', '1', to_date('13-03-2016 23:49:13', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1a2d397939914d8f9e26859a65c30846', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:49:18', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6e5e678d1b814cf5acd897e89bb92d8f', '1', '二维码测试', '1', to_date('13-03-2016 23:49:31', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/TwoDimensionCodeController', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ffa1de86b28b4792b92859efc9e74fe6', '1', '系统设置-菜单管理', '1', to_date('13-03-2016 23:49:35', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b1bdadcdc85c41a2afbfdb66788d1377', '1', '系统设置-菜单管理', '1', to_date('13-03-2016 23:51:24', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5c9201c93077489cb8289a47e7b83035', '1', '系统设置-菜单管理', '1', to_date('13-03-2016 23:53:27', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d02bcdb82aa74eaa90792799ebbdee63', '1', '系统设置-菜单管理', '1', to_date('13-03-2016 23:53:43', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('2b09be516174465eae163f45c922c0cb', '1', '系统设置-菜单管理', '1', to_date('13-03-2016 23:54:15', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('11c0bd1818fe4632834d3fffe3265041', '1', '系统设置-菜单管理', '1', to_date('13-03-2016 23:54:46', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('dc380225f76a43cf8243b913f1190d26', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 20:13:26', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('29e604dafbfd4d40bdac40b79eb442de', '1', '系统设置-菜单管理', '1', to_date('13-03-2016 23:55:18', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a04d32b57b5f4e029445fd83f00e5d5c', '1', '系统设置-菜单管理', '1', to_date('13-03-2016 23:55:58', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5c964d0b664844a09f6e0e3fde7cc3c3', '1', '系统设置-菜单管理', '1', to_date('13-03-2016 23:56:11', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('123575161c8d458ea3810d16bafc2077', '1', '系统设置-菜单管理', '1', to_date('13-03-2016 23:56:21', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d920fb10e702411e9ad178e26ff78bb9', '1', '系统登录', '1', to_date('13-03-2016 23:56:30', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('284fabce9f2147599cf9305434eeaeac', '1', '常用工具-外部邮件', '1', to_date('13-03-2016 23:56:33', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/email', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('39c28b9bd35144d0b70b926629b7cc50', '1', '常用工具-短信工具', '1', to_date('13-03-2016 23:56:34', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/sms', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('beb8770cf4524ff7924b1397e7ee5a67', '1', '常用工具-表单构建器', '1', to_date('13-03-2016 23:56:35', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/beautifyhtml', 'GET', null, null);
commit;
prompt 300 records committed...
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d544bedc763a4763850601a4e9d9b6c0', '1', '常用工具-接口测试-接口列表', '1', to_date('13-03-2016 23:56:37', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/testInterface', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4d555547e70c46c5be25c80e5587bc41', '1', '常用工具-接口测试-接口测试', '1', to_date('13-03-2016 23:56:37', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/testInterface/test', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('72285c11e4d8416e916ecc5865d9e486', '1', '常用工具-二维码测试', '1', to_date('13-03-2016 23:56:47', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/TwoDimensionCodeController', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('57492bec16ba4fa5b1651efbd3e9aac6', '1', '系统设置-菜单管理', '1', to_date('13-03-2016 23:57:50', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6492cd54c65949eeb1e474e9645c4e43', '1', '系统设置-用户管理', '1', to_date('13-03-2016 23:58:09', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c711944ab866490a81b44d085cd4c1c7', '1', '系统登录', '1', to_date('14-03-2016 19:47:09', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7f79f707fc074cc2b1756ac1ae7f5588', '1', '系统设置-菜单管理', '1', to_date('14-03-2016 19:48:07', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3a7b9202bd314d5f96964a86a354be31', '1', '系统登录', '1', to_date('14-03-2016 19:53:50', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('75e92c7f0545441087a7195ebe5dd7c3', '1', 'ONLINE开发-表单配置', '1', to_date('14-03-2016 19:54:02', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('36688287bf9f409aac2c5a3e5188e85e', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('14-03-2016 19:54:07', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('be536903c1dd4f2699bad816b3a0f818', '1', 'ONLINE开发-生成示例-请假表单(单表）', '1', to_date('14-03-2016 19:55:36', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/test/one/formLeave', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5f3e647136284c74908d518161d5ec51', '1', '我的面板-常用联系人', '1', to_date('14-03-2016 19:58:50', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/iim/contact/myFriends', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7149de49b3ee48f2a9fea09a848fb053', '1', '我的面板-通讯录', '1', to_date('14-03-2016 19:58:51', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/iim/contact/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5b60f88cff1d491fbcaefc34fed1b3c5', '1', '我的面板-个人信息', '1', to_date('14-03-2016 19:58:53', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/user/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('2180e68899524eb5b7aa8982e2752f84', '1', '在线办公-我的通告', '1', to_date('14-03-2016 19:58:58', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/oa/oaNotify/self', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a70a12e62841405094ad0feeb7ab9103', '1', '在线办公-通告管理', '1', to_date('14-03-2016 19:58:58', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/oa/oaNotify', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('05c4cc0e7c6544fb8b333c358c5c2a63', '1', '系统设置-用户管理', '1', to_date('14-03-2016 19:59:00', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('75dfc879e8364cf0b1e4a1254b126be5', '1', '系统设置-角色管理', '1', to_date('14-03-2016 19:59:03', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/role/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ce5972902b734b6fa05c1c482472086f', '1', '系统设置-区域管理', '1', to_date('14-03-2016 19:59:04', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/area/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('081691bbb95142a38879e3ffdf03c332', '1', '系统设置-字典管理', '1', to_date('14-03-2016 19:59:05', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/dict/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1db865f979ec44d89819ad744d48cbf2', '1', '系统监控-日志查询', '1', to_date('14-03-2016 19:59:08', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/log', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('f14dd720aaea4325a92bf711854eaebe', '1', '系统监控-系统监控管理', '1', to_date('14-03-2016 19:59:10', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/monitor/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('2334587443f54a5b88b35b1978fd8a9b', '1', '系统监控-系统监控管理', '1', to_date('14-03-2016 19:59:14', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/monitor/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6130959afbbf4cd9bd9abde92fcc39c1', '1', '系统登录', '1', to_date('13-03-2016 19:52:35', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d86d14311c474053b1e613de464067d5', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 19:52:39', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c4bafdff71854002bfcee2d865702b00', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 19:52:44', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('07aefdcf5f904281aae38bca820a298c', '1', '系统登录', '1', to_date('13-03-2016 20:13:21', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('f5d4b2ab13634a368d2942220c4628cf', '1', '系统登录', '1', to_date('13-03-2016 20:23:17', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('9cf533cc6a334964bbcb241327bf42e9', '1', '系统登录', '1', to_date('13-03-2016 20:30:23', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0399a27b9a044a868fe23e7bab4d4bbf', '1', '系统登录', '1', to_date('13-03-2016 22:06:07', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('dca1a6682091471080ec788000bf380b', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:06:19', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('821575cec57a4873bd95ea99bcea5dfc', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:06:25', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6f50638e34564deeac39b279f68d8da3', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:14:07', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a8958a4b7766484683be3f4bdf309300', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:14:11', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('12b1abc2c10743daab5522ade686f8b2', '1', '系统登录', '1', to_date('13-03-2016 22:23:54', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('91fac9270004403eaa24719f5e434517', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:24:10', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('85c96ee1e9624a41b33846c95f3e3bb3', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:24:31', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a419f6235d7446f2a62231516b68894c', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:29:34', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('34431b0294e74d26a434ced5e9e3f490', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:29:49', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7af43d6278184222a506307d7f635bd5', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:30:05', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4771eddebb954626acdce732be0151e6', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:30:19', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2c5238519f0f4c829f9cf9bb0c4d1019', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('243cb9d8b47345c2a84f5ee1b6de4ac3', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:32:07', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('927c6e5644884b678703b0c02af9c5b5', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:32:15', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2c5238519f0f4c829f9cf9bb0c4d1019', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0ef127793c464768a09418fdcf9b675b', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:36:13', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('fdef3746e3b3435ba0fd09879c02e416', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:36:19', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2c5238519f0f4c829f9cf9bb0c4d1019', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('56da999fd0944335bc498baaf57998b3', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:36:53', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2285cafd9ca54c238fd14eca7114b84a', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c7ba8a16c6e24b27b9857b91dc39f54c', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:38:09', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2c5238519f0f4c829f9cf9bb0c4d1019', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3554836099794e3f8d19680b5c5eb30b', '1', '系统登录', '1', to_date('13-03-2016 22:42:51', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('67f97222807a47f2abbb9251a07aba98', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:42:55', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('f7882bac00794f5db1dd7ed240783709', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:43:00', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2c5238519f0f4c829f9cf9bb0c4d1019', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('e206ad2a5a2e49c0937adc094d07d922', '1', '系统登录', '1', to_date('13-03-2016 22:43:36', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7c0963143dd94b6a8313c852506df4e9', '1', '系统登录', '1', to_date('13-03-2016 22:49:17', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('e57f8aa1c5aa4d48be94061b321dfde7', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:49:21', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('218be90b1ca74dbbbef390a74a24d563', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 20:32:31', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0491d043449f4762a88d1d5513a36be2', '1', '系统登录', '1', to_date('13-03-2016 20:32:40', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('74fe5afc8a0f46e9b6ca9da9dd5cb71e', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 20:33:15', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c24d816d59ac4155b02b8e8a37547152', '1', '系统登录', '1', to_date('13-03-2016 20:35:09', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7440428d8161470aa96ccf55b4f9fe83', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 20:35:30', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ed93046a9a9a448cb5998696f7ec58e3', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:02:45', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('09cbccffd9c8421cb625a7514bed3244', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:02:48', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0d57fcc8f22a43dfafeb693509defb4e', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:03:27', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('21bccca3358f4ce3ad66901be90c31e9', '1', '系统登录', '1', to_date('13-03-2016 22:11:05', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('40ad1f2f70054bfda062ebc2e825087c', '1', '系统登录', '1', to_date('13-03-2016 22:14:03', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b27cd34710054b7199eeff1063e1d041', '1', '系统登录', '1', to_date('13-03-2016 22:27:18', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('696aabfcffb44a06a3fb69d371c1e7fa', '1', '系统登录', '1', to_date('13-03-2016 22:32:04', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('837053a817c34f5783d5827a0a7c77e8', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:49:28', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2c5238519f0f4c829f9cf9bb0c4d1019', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4e87332c178943da859a24d39d5cc5d7', '1', '系统登录', '1', to_date('13-03-2016 23:02:43', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5eb2f66549f74b2cb64b9562d0ba0751', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:04:21', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('514ba50461e145d084a0e8e4ade5755d', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:04:26', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2c5238519f0f4c829f9cf9bb0c4d1019', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('64dae3e22e0c4991a0341bd66f79adfa', '1', '系统登录', '1', to_date('13-03-2016 23:05:55', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('e3bcadf4ed794f7ab32e1e5e4afde763', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:05:59', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c1266d236c82440faeee922ef950c3d2', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:06:05', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2c5238519f0f4c829f9cf9bb0c4d1019', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('72ff21bcabfb486e994dd3bc41e3f492', '1', 'ONLINE开发-表单配置-删除', '1', to_date('13-03-2016 23:08:25', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/deleteDb', 'GET', 'id=2c5238519f0f4c829f9cf9bb0c4d1019', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('90da59df76b241b79632ee9c1b65bb24', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:10:51', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ad6ee553ec144ee3856f36c6dedd0929', '1', 'ONLINE开发-表单配置-导入', '1', to_date('13-03-2016 23:11:08', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b498f75ae59945d9afc51b1d0fd50fe9', '1', 'ONLINE开发-表单配置-导入', '1', to_date('13-03-2016 23:11:11', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=xxx', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ebfc1880595d4ea48741b170d89f7590', '1', 'ONLINE开发-表单配置-删除', '1', to_date('13-03-2016 23:11:25', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/deleteDb', 'GET', 'id=d0d2b9990ebb408b8fb667a003386f54', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ed4a38ddfd4d4897a5184098f5989fd7', '1', '系统登录', '1', to_date('13-03-2016 23:13:26', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('8bd08839b37b4452a4fef91a4ff74937', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:13:30', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6ae8e2c089934dde91c060eb063bd5e2', '1', 'ONLINE开发-表单配置-导入', '1', to_date('13-03-2016 23:13:38', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('26c35edc4d8b44caa48d8e87470fe158', '1', 'ONLINE开发-表单配置-导入', '1', to_date('13-03-2016 23:13:42', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=xxx', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('e33f7af8b19b4274ad03f232448c3166', '1', 'ONLINE开发-表单配置-删除', '1', to_date('13-03-2016 23:13:45', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/deleteDb', 'GET', 'id=7e3988c35b1b4fe0b3f62b459aefed81', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('7e77267521c04b3fb988583bef679bf1', '1', '系统登录', '1', to_date('13-03-2016 23:15:01', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0ec53d0e323c4e8e9f0d1210e5b06839', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 20:27:54', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('472439e566f44b01bd9412df9f6ebe46', '1', '系统登录', '1', to_date('13-03-2016 21:20:04', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0e072a86edb149c0bd097bbc3f948e20', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 21:20:08', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1191cb6fc3984cdf8831572c2e488cc2', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 21:20:11', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4a8ab9326994475cbc58c99b5fbddc1a', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 21:20:20', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('006270bb7e9b4d0fa5ed96e61d0506e8', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 21:23:13', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('8cecbdd5f84d4dd3ac916766124c9d1a', '1', '系统登录', '1', to_date('13-03-2016 21:27:45', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ab9803fd9fcc4e0ca545ee6ee18b6860', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 21:27:53', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6d4cebd0272641fab4a101385058f7bc', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 21:33:10', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0047582b44e74298bf70cdfc78edabab', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 21:33:18', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1e7bdcd4b5a54ec488798bef65bd50b8', '1', '系统登录', '1', to_date('13-03-2016 22:02:41', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('aee5caa1a90547bba2a2eed57eedde1a', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:11:10', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4a74433e7dc44bacabfc47ef6946e4b8', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:11:13', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('8034dcf9a88e4425928cee347ab5e3b4', '1', '系统登录', '1', to_date('13-03-2016 22:16:51', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('58403f6b54d3483886443d17c51c38d9', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:18:18', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('f5021ecb6d154106bf8dc33786ada536', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:19:09', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a6a16f279b7349c28affba509a7eef48', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:20:04', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
commit;
prompt 400 records committed...
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a9f7f26420bb48bfb537f9b52df10600', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:27:22', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d86186b00fdd44cb858ecbe8dcbf64d2', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:27:25', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1bc262083e234fdb8b5ba08b2367dff8', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 22:43:39', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6ef91f19076f48d59d47a0e3e897a622', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 22:43:45', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2c5238519f0f4c829f9cf9bb0c4d1019', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('917fd13482164b58b3c205d320fa1295', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:02:47', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('91a343dbdde44e7cbf7b492febcc44a1', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:02:52', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2c5238519f0f4c829f9cf9bb0c4d1019', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('f98e07334e2d49a887d63964c4ecb570', '1', '系统登录', '1', to_date('13-03-2016 23:04:18', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4f43580e70154478aac16b1cf7bfef0b', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('13-03-2016 23:04:56', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=2c5238519f0f4c829f9cf9bb0c4d1019', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1f4ac58ef2484c2d8989962a3afb818c', '1', '系统登录', '1', to_date('13-03-2016 23:10:48', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('38e2347818284c6d83c0c09455d053cd', '1', 'ONLINE开发-表单配置', '1', to_date('13-03-2016 23:15:05', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('52307e7cadcf4857ac9e4f1f544a61f1', '1', 'ONLINE开发-表单配置-导入', '1', to_date('13-03-2016 23:15:11', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/importTableFromDB', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('6bf746aa3cf64285b9114683714d3950', '1', 'ONLINE开发-表单配置-导入', '1', to_date('13-03-2016 23:15:14', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/importTableFromDB', 'POST', 'id=&name=xxx', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c941af0260c14d529fd8dee31d622b3a', '1', 'ONLINE开发-表单配置-删除', '1', to_date('13-03-2016 23:15:17', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/deleteDb', 'GET', 'id=2e522b2e5ccc4f4486842bfe4aed2bb9', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5cb6ae69ad6947d38d5f6328fdf56636', '1', '系统设置-机构管理', '1', to_date('14-03-2016 20:43:03', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/office/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('f8c975c1a38f4b67afadf3f110856c77', '1', '系统设置-区域管理', '1', to_date('14-03-2016 20:43:03', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/area/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('fd9b6c3c15404c02ac9a5af6eef8d36d', '1', '系统设置-菜单管理', '1', to_date('14-03-2016 20:43:05', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/menu/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('bfaf98a421ae41eeb4854763682f00f2', '1', '系统设置-角色管理', '1', to_date('14-03-2016 20:43:07', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/role/', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3dc7dab85b9d4ab0a3e74fa0af1775ab', '1', '在线办公-我的通告', '1', to_date('14-03-2016 20:43:09', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/oa/oaNotify/self', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('38373f959ee84a30bf0b3f1628704565', '1', '系统监控-系统配置', '1', to_date('14-03-2016 20:43:34', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/systemConfig', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('e8aa84c6a3f3469e849f5dbf7819df48', '1', '系统监控-系统监控管理', '1', to_date('14-03-2016 20:43:35', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/monitor/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('23b2b8998f9946cfb1cf480102d06a52', '1', '系统监控-系统监控管理', '1', to_date('14-03-2016 20:10:58', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/monitor/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5215c9cfcb7245b3831d916eff512124', '1', '系统登录', '1', to_date('14-03-2016 20:11:23', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/systemConfig', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4936eefbc95b41158f891c5a8da91dd5', '1', '系统监控-系统配置', '1', to_date('14-03-2016 20:12:39', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/systemConfig', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('02cbbf7a1bcc4730b98b60daaa7eb20b', '1', '系统监控-系统监控管理', '1', to_date('14-03-2016 20:12:52', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/monitor/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c0c961aa64f14c3cb233fa6d8c74012c', '1', '常用工具-外部邮件', '1', to_date('14-03-2016 20:13:52', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/email', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('140e406406954bcf857b83e57e6caa30', '1', '常用工具-短信工具', '1', to_date('14-03-2016 20:13:53', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/sms', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0571c58217bf4018a39fdb0e1e7dbeee', '1', '常用工具-表单构建器', '1', to_date('14-03-2016 20:13:54', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/beautifyhtml', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0aee5caf3bc54974a660a0d0bdc7ba56', '1', '常用工具-接口测试-接口列表', '1', to_date('14-03-2016 20:13:56', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/testInterface', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('bd3aea433fec4f9197e1573e47ca9a94', '1', '常用工具-接口测试-接口列表', '1', to_date('14-03-2016 20:15:43', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/testInterface', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('df2f7ac671624c97b86f580dbf6455ac', '1', '系统登录', '1', to_date('14-03-2016 20:30:56', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('0999261e44ec4068ba8823afa9a5762b', '1', '常用工具-接口测试-接口列表', '1', to_date('14-03-2016 20:31:13', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/testInterface', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('c4da10f69a39422bb7b8f669467b84ed', '1', '常用工具-接口测试-接口测试', '1', to_date('14-03-2016 20:31:15', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/testInterface/test', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('5061e0a5add54cdc9849d0f1f4d0b0f3', '1', '常用工具-接口测试-接口测试', '1', to_date('14-03-2016 20:31:17', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/testInterface/test', 'GET', 'id=02c5ad21ab604baba5aaa9795815d769', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('09ddc604f70f4470b18ef7ccff5da27e', '1', '系统登录', '1', to_date('14-03-2016 20:41:30', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ea41614df03e41d29a16212259195dbb', '1', 'ONLINE开发-表单配置', '1', to_date('14-03-2016 20:41:35', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('e305f743f5fc4af8bce2644cd3858d59', '1', 'ONLINE开发-表单配置-同步数据库', '1', to_date('14-03-2016 20:41:57', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable/synchDb', 'GET', 'id=0a8f05eb973b4942af37c45109bd2502', null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('51f06d135202497cb214d59ee72f9899', '1', 'ONLINE开发-生成示例-票务代理(一对多）', '1', to_date('14-03-2016 20:41:59', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/test/onetomany/testDataMain', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('545892846e7b44b6bfe93b03e86938a4', '1', 'ONLINE开发-生成示例-请假表单(单表）', '1', to_date('14-03-2016 20:42:00', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/test/one/formLeave', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('1a69eac45b3443819e8a85e13db11731', '1', 'ONLINE开发-生成示例-组织结构(树结构)', '1', to_date('14-03-2016 20:42:03', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/test/tree/testTree', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('d661e656985240c4b9c638110f8e7d5f', '1', '我的面板-个人信息', '1', to_date('14-03-2016 20:42:12', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/user/info', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('a0328c8c5b4a4b909cf657e3016fb9b8', '1', '系统设置-用户管理', '1', to_date('14-03-2016 20:42:17', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/user/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('ba69edaf86e945f295607b26946046eb', '1', 'ONLINE开发-表单配置', '1', to_date('14-03-2016 20:54:59', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/gen/genTable', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('f5154493509d47d49cf8750bf87bbfbb', '1', '我的面板-常用联系人', '1', to_date('14-03-2016 20:55:00', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/iim/contact/myFriends', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('b79ee08bc04c4eba8b637a697a48065e', '1', '我的面板-通讯录', '1', to_date('14-03-2016 20:55:01', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/iim/contact/index', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('3137d06142ae4e8d867c3add9c266523', '1', '系统监控-日志查询', '1', to_date('14-03-2016 20:43:38', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/sys/log', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('647f468bdf97475180893b3dae0475e1', '1', '常用工具-表单构建器', '1', to_date('14-03-2016 20:43:40', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/beautifyhtml', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('2739d3f34c4541ec894a3ee7f3884121', '1', '常用工具-外部邮件', '1', to_date('14-03-2016 20:43:40', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a/tools/email', 'GET', null, null);
insert into SYS_LOG (ID, TYPE, TITLE, CREATE_BY, CREATE_DATE, REMOTE_ADDR, USER_AGENT, REQUEST_URI, METHOD, PARAMS, EXCEPTION)
values ('4c961a437bcd4d4a82ad687b56cc164a', '1', '系统登录', '1', to_date('14-03-2016 20:54:57', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '/jeeplus/a', 'GET', 'login=', null);
commit;
prompt 448 records loaded
prompt Loading SYS_MDICT...
prompt Table is empty
prompt Loading SYS_MENU...
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('94e39b4d5c294de1b08d0267845f79d0', '1', '0,1,', '常用工具', 15090, null, null, 'fa-anchor', '1', null, '1', to_date('13-03-2016 23:54:14', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 19:48:22', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('babf031ba02a423299b57e89eaea3a7b', '94e39b4d5c294de1b08d0267845f79d0', '0,1,94e39b4d5c294de1b08d0267845f79d0,', '表单构建器', 90, '/tools/beautifyhtml', null, null, '1', null, '1', to_date('13-03-2016 23:55:57', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:55:57', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('20', '3', '0,1,3,', '用户管理', 30, '/sys/user/index', null, 'icon-adjust', '1', 'sys:user:index', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21', '20', '0,1,3,20,', '查看', 30, null, null, null, '0', 'sys:user:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('22', '20', '0,1,3,20,', '修改', 40, null, null, null, '0', 'sys:user:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('247bcf278dfc40cca447f5c736c6d849', '55a33ae3ec2d466682ba2d701bea6fd0', '0,1,79,3c92c17886944d0687e73e286cada573,55a33ae3ec2d466682ba2d701bea6fd0,', '删除', 120, null, null, null, '0', 'test:one:formLeave:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('27', '1', '0,1,', '我的面板', 100, null, null, 'fa-columns', '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('28abe4b0cb3b4c8480f84c07a5dfaf06', '90', '0,1,62,90,', '增加', 60, null, null, null, '0', 'oa:oaNotify:add', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('29', '27', '0,1,27,', '个人信息', 30, '/sys/user/info', null, 'icon-adjust', '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2a0f940fbe304a05a6b4040ddf6df279', '20', '0,1,3,20,', '增加', 70, null, null, null, '0', 'sys:user:add', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3', '1', '0,1,', '系统设置', 500, null, null, 'fa-cog', '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3c1c639c76f14f6f9903b0143371ea09', '7', '0,1,3,7,', '添加', 70, null, null, null, '0', 'sys:role:add', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', 120, null, null, null, '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '3', '0,1,3,', '菜单管理', 30, '/sys/menu/', null, 'list-alt', '1', 'sys:menu:list', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', 30, null, null, null, '0', 'test:onetomany:testDataMain:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4d463414bc974236941a6a14dc53c73a', '94e39b4d5c294de1b08d0267845f79d0', '0,1,94e39b4d5c294de1b08d0267845f79d0,', '接口测试', 15030, null, null, 'fa-circle-o-notch', '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:56:10', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '4', '0,1,3,4,', '增加', 30, null, null, null, '0', 'sys:menu:add', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5239527958e94d418997b584b85d8b80', '14', '0,1,3,14,', '删除', 100, null, null, null, '0', 'sys:area:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('55a33ae3ec2d466682ba2d701bea6fd0', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '请假表单(单表）', 120, '/test/one/formLeave', null, null, '1', 'test:one:formLeave:list', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('56', '27', '0,1,27,', '文件管理', 90, '/../static/ckfinder/ckfinder.html', null, 'icon-zoom-out', '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('57', '56', '0,1,27,40,56,', '查看', 30, null, null, null, '0', 'cms:ckfinder:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('57f1f00d6cb14819bef388acd10e6f5a', '68', '0,1,67,68,', '删除', 60, null, null, null, '0', 'sys:log:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('58', '56', '0,1,27,40,56,', '上传', 40, null, null, null, '0', 'cms:ckfinder:upload', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('59', '56', '0,1,27,40,56,', '修改', 50, null, null, null, '0', 'cms:ckfinder:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('59f304d5312e4502930fef5dd8117b29', '55a33ae3ec2d466682ba2d701bea6fd0', '0,1,79,3c92c17886944d0687e73e286cada573,55a33ae3ec2d466682ba2d701bea6fd0,', '导入', 180, null, null, null, '0', 'test:one:formLeave:import', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6', '4', '0,1,3,4,', '修改', 40, null, null, null, '0', 'sys:menu:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('62', '1', '0,1,', '在线办公', 200, null, null, 'fa-desktop', '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6509eed6eb634030a46723a18814035c', '7', '0,1,3,7,', '分配用户', 100, null, null, null, '0', 'sys:role:assign', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('67', '1', '0,1,', '系统监控', 985, null, null, 'fa-sticky-note', '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:53:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68', '67', '0,1,67,', '日志查询', 30, '/sys/log', null, 'pencil', '1', 'sys:log:list', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6890f329854d41bd92d4857e18ce641d', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '导出', 150, null, null, null, '0', 'test:onetomany:testDataMain:export', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68f9151151174868ab436e11e03bf548', '4', '0,1,3,4,', '删除', 70, null, null, null, '0', 'sys:menu:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6c672b854d2b4821b89297640df5fc26', '82', '0,1,79,82,', '同步数据库', 180, null, null, null, '0', 'gen:genTable:synchDb', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6d3a6777693f47c98e9b3051cacbcfdb', '10', '0,1,3,10,', '增加', 70, null, null, null, '0', 'sys:dict:add', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7', '3', '0,1,3,', '角色管理', 50, '/sys/role/', null, 'lock', '1', 'sys:role:list', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('70de7eac2f3e4632b1b7aa3cd536b35a', '4d463414bc974236941a6a14dc53c73a', '0,1,94e39b4d5c294de1b08d0267845f79d0,4d463414bc974236941a6a14dc53c73a,', '接口测试', 200, '/tools/testInterface/test', null, null, '1', 'tools:testInterface:test', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('79', '1', '0,1,', 'ONLINE开发', 20, null, null, 'fa-codepen', '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('79f0ffa47dbe43ffa8824d97612d344f', '4', '0,1,3,4,', '保存排序', 100, null, null, null, '0', 'sys:menu:updateSort', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('79fca849d3da4a82a4ade3f6b9f45126', '20', '0,1,3,20,', '删除', 100, null, null, null, '0', 'sys:user:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7ec930fe50fb41d0a9c7aeaa01804d16', '4d463414bc974236941a6a14dc53c73a', '0,1,94e39b4d5c294de1b08d0267845f79d0,4d463414bc974236941a6a14dc53c73a,', '接口列表', 30, '/tools/testInterface', null, null, '1', 'tools:testInterface:list', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8', '7', '0,1,3,7,', '查看', 30, null, null, null, '0', 'sys:role:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('82', '79', '0,1,79,', '表单配置', 20, '/gen/genTable', null, null, '1', 'gen:genTable:list', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('84', '67', '0,1,67,', '连接池监视', 40, '/../druid', null, null, '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8815c9a95cf54b19a39b0ce0ff4c32f8', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '删除', 120, null, null, null, '0', 'test:onetomany:testDataMain:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('89', '62', '0,1,62,', '我的通告', 30, '/oa/oaNotify/self', null, null, '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8926112d6acd4a18b5e5dcf99a1f7ff3', '7ec930fe50fb41d0a9c7aeaa01804d16', '0,1,94e39b4d5c294de1b08d0267845f79d0,4d463414bc974236941a6a14dc53c73a,7ec930fe50fb41d0a9c7aeaa01804d16,', '删除', 150, null, null, null, '0', 'tools:testInterface:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8930e4aad1ba4a1c958d303968d8c442', '17', '0,1,3,17,', '删除', 100, null, null, null, '0', 'sys:office:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8ff255c054e5467aac19eb9d5abf8859', '55a33ae3ec2d466682ba2d701bea6fd0', '0,1,79,3c92c17886944d0687e73e286cada573,55a33ae3ec2d466682ba2d701bea6fd0,', '查看', 30, null, null, null, '0', 'test:one:formLeave:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9', '7', '0,1,3,7,', '修改', 40, null, null, null, '0', 'sys:role:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('90', '62', '0,1,62,', '通告管理', 50, '/oa/oaNotify', null, null, '1', 'oa:oaNotify:list', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('91aa429a6cdc4a9b954d84ff1456934b', '68', '0,1,67,68,', '查看', 30, null, null, null, '0', 'sys:log:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('95a6a82dc5fc4d07b46e5df57a0606a3', '27', '0,1,27,', '信箱', 10000, '/iim/mailBox/list?orderBy=sendtime desc', null, null, '1', 'iim:mail:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9bc1aa1053144a608b73f6fbd841d1c6', '10', '0,1,3,10,', '删除', 100, null, null, null, '0', 'sys:dict:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9fdf5971a9e64fac8bbffec2825a5f97', '27', '0,1,27,', '常用联系人', 180, '/iim/contact/myFriends', null, null, '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('a4c3dcee6cbc4fc6a0bf617d8619edf3', '17', '0,1,3,17,', '增加', 70, null, null, null, '0', 'sys:office:add', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('a4cfc713c3c04c32a274fb59c71e34ed', '7ec930fe50fb41d0a9c7aeaa01804d16', '0,1,94e39b4d5c294de1b08d0267845f79d0,4d463414bc974236941a6a14dc53c73a,7ec930fe50fb41d0a9c7aeaa01804d16,', '编辑', 90, null, null, null, '0', 'tools:testInterface:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('af0a174b4f424bc09a8cc0db83a64105', '27', '0,1,27,', '通讯录', 120, '/iim/contact/index', null, null, '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', 60, null, null, null, '0', 'test:tree:testTree:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '票务代理(一对多）', 60, '/test/onetomany/testDataMain', null, null, '1', 'test:onetomany:testDataMain:list', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('b9a776f5d7194406bb466388e3af9d08', '20', '0,1,3,20,', '导出', 160, null, null, null, '0', 'sys:user:export', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', 30, null, null, null, '0', 'test:tree:testTree:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('c3de25a76785419b8a6820db3935941d', '82', '0,1,79,82,', '导入', 150, null, null, null, '0', 'gen:genTable:importDb', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('c6e0080e06014abd9240f870aadf3200', '14', '0,1,3,14,', '增加', 70, null, null, null, '0', 'sys:area:add', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('c7fa36c7142f481397c2cc12e2bc828a', '90', '0,1,62,90,', '修改', 90, null, null, null, '0', 'oa:oaNotify:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('c824b5c244cc4098853671e75858ca55', '55a33ae3ec2d466682ba2d701bea6fd0', '0,1,79,3c92c17886944d0687e73e286cada573,55a33ae3ec2d466682ba2d701bea6fd0,', '编辑', 90, null, null, null, '0', 'test:one:formLeave:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cac8d5931531427ca0ba7e55927dcdf2', '55a33ae3ec2d466682ba2d701bea6fd0', '0,1,79,3c92c17886944d0687e73e286cada573,55a33ae3ec2d466682ba2d701bea6fd0,', '导出', 150, null, null, null, '0', 'test:one:formLeave:export', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', 60, null, null, null, '0', 'test:onetomany:testDataMain:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d3f1b6f292904ef5b95f7800cc777a48', '82', '0,1,79,82,', '查看', 30, null, null, null, '0', 'gen:genTable:view,gen:genTableColumn:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d64d25d7b3014f9ba7736867cb2ffc43', '82', '0,1,79,82,', '生成代码', 210, null, null, null, '0', 'gen:genTable:genCode', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d75f64438d994fc4830b1b3d138cde32', '82', '0,1,79,82,', '删除', 120, null, null, null, '0', 'gen:genTable:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d78a0f0a6c8c48699e5d081f64014b99', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '导入', 180, null, null, null, '0', 'test:onetomany:testDataMain:import', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('dae12251f0234673bd7b21fdd47a02b9', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '删除', 120, null, null, null, '0', 'test:tree:testTree:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('de7c50d276454f80881c41a096ecf55c', '7', '0,1,3,7,', '删除', 160, null, null, null, '0', 'sys:role:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e03f8b6a5e454addb04fc08033b6f60b', '82', '0,1,79,82,', '增加', 90, null, null, null, '0', 'gen:genTable:add', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e2efcf80fc3747329fe02d489dbfda95', '90', '0,1,62,90,', '删除', 120, null, null, null, '0', 'oa:oaNotify:del', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e4e64e24aa134deaa9d69c3b9495c997', '94e39b4d5c294de1b08d0267845f79d0', '0,1,94e39b4d5c294de1b08d0267845f79d0,', '二维码测试', 15060, '/tools/TwoDimensionCodeController', null, 'fa-qrcode', '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:56:21', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e824b7c20bb34c9ca9ad023e8873e67b', '82', '0,1,79,82,', '编辑', 60, null, null, null, '0', 'gen:genTable:edit,gen:genTableColumn:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ec7cf7a144a440cab217aabd4ffb7788', '4', '0,1,3,4,', '查看', 130, null, null, null, '0', 'sys:menu:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f34887a78fa245c1977603ca7dc98e11', '20', '0,1,3,20,', '导入', 130, null, null, null, '0', 'sys:user:import', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f5b2028cfad9470085c7c846de33193a', '90', '0,1,62,90,', '查看', 30, null, null, null, '0', 'oa:oaNotify:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f87f68e686974c12b4923a81df0dfa7c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '添加', 90, null, null, null, '0', 'test:tree:testTree:add', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f93f9a3a2226461dace3b8992cf055ba', '7', '0,1,3,7,', '权限设置', 130, null, null, null, '0', 'sys:role:auth', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f9fe62186f0a4d7eada6c6827de79b26', '7ec930fe50fb41d0a9c7aeaa01804d16', '0,1,94e39b4d5c294de1b08d0267845f79d0,4d463414bc974236941a6a14dc53c73a,7ec930fe50fb41d0a9c7aeaa01804d16,', '查看', 30, null, null, null, '0', 'tools:testInterface:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ff5af1be6f7544e2893b1c79dd6e0745', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '添加', 90, null, null, null, '0', 'test:onetomany:testDataMain:add', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0787b03f8a7d46d2b398ddcc23545d31', '7ec930fe50fb41d0a9c7aeaa01804d16', '0,1,94e39b4d5c294de1b08d0267845f79d0,4d463414bc974236941a6a14dc53c73a,7ec930fe50fb41d0a9c7aeaa01804d16,', '增加', 120, null, null, null, '0', 'tools:testInterface:add', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('07f90eb4ad5848cba282a2e19bbebf60', '55a33ae3ec2d466682ba2d701bea6fd0', '0,1,79,3c92c17886944d0687e73e286cada573,55a33ae3ec2d466682ba2d701bea6fd0,', '增加', 60, null, null, null, '0', 'test:one:formLeave:add', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '组织结构(树结构)', 90, '/test/tree/testTree', null, null, '1', 'test:tree:testTree:list', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '0', '0,', '功能菜单', 0, null, null, null, '1', null, '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('10', '3', '0,1,3,', '字典管理', 60, '/sys/dict/', null, 'th-list', '1', 'sys:dict:list', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('11', '10', '0,1,3,10,', '查看', 30, null, null, null, '0', 'sys:dict:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12', '10', '0,1,3,10,', '修改', 40, null, null, null, '0', 'sys:dict:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('14', '3', '0,1,3,', '区域管理', 50, '/sys/area/', null, 'th', '1', 'sys:area:list', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('15', '14', '0,1,3,14,', '查看', 30, null, null, null, '0', 'sys:area:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('16', '14', '0,1,3,14,', '修改', 40, null, null, null, '0', 'sys:area:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('17', '3', '0,1,3,', '机构管理', 40, '/sys/office/', null, 'th-large', '1', 'sys:office:index', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('18', '17', '0,1,3,17,', '查看', 30, null, null, null, '0', 'sys:office:view', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19', '17', '0,1,3,17,', '修改', 40, null, null, null, '0', 'sys:office:edit', '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:01:43', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('55d185bc749d40ed993729127d5ec33d', '67', '0,1,67,', '系统监控管理', 70, '/monitor/info', null, null, '1', null, '1', to_date('13-03-2016 23:51:23', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:51:23', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('17fccd658e2240d5a538fb2cbc117e99', '67', '0,1,67,', '系统配置', 100, '/sys/systemConfig', null, null, '1', 'sys:systemConfig:index', '1', to_date('13-03-2016 23:53:27', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:53:27', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('2d13dae90fe34d3ab020ddd80f59d599', '94e39b4d5c294de1b08d0267845f79d0', '0,1,94e39b4d5c294de1b08d0267845f79d0,', '外部邮件', 30, '/tools/email', null, null, '1', null, '1', to_date('13-03-2016 23:54:45', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:54:45', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
commit;
prompt 100 records committed...
insert into SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('62d2a029fb104fcabedf54433a4d542f', '94e39b4d5c294de1b08d0267845f79d0', '0,1,94e39b4d5c294de1b08d0267845f79d0,', '短信工具', 60, '/tools/sms', null, null, '1', null, '1', to_date('13-03-2016 23:55:17', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:55:17', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
commit;
prompt 101 records loaded
prompt Loading SYS_OFFICE...
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1', '0', '0,', '新疆巴州电信分公司', 10, '19298dc65ecd45cc803a6da294d1ff60', '200000007', '1', '1', null, null, null, null, null, null, '1', null, null, '1', to_date('19-02-2016 18:08:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('21-02-2016 15:46:12', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4', '1', '0,1,', '财务部', 30, '17e8e72326574a0ea94b15d6eeddbb6d', '100003', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_date('19-02-2016 18:08:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:08:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5', '1', '0,1,', '技术部', 40, '2', '100004', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_date('19-02-2016 18:08:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:08:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6a642e140e40496a8d467c646b8e935e', '1', '0,1,', '市场部', 30, '17e8e72326574a0ea94b15d6eeddbb6d', '1000', '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_date('19-02-2016 18:08:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:08:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_OFFICE (ID, PARENT_ID, PARENT_IDS, NAME, SORT, AREA_ID, CODE, TYPE, GRADE, ADDRESS, ZIP_CODE, MASTER, PHONE, FAX, EMAIL, USEABLE, PRIMARY_PERSON, DEPUTY_PERSON, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e0ef8af9cae6416f8bb359714a1b4244', '1', '0,1,', '行政部', 30, '4d8ec70b0e0c4c97af07b97c9a906c40', null, '2', '1', null, null, null, null, null, null, '1', null, null, '1', to_date('19-02-2016 18:08:36', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:08:36', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
commit;
prompt 5 records loaded
prompt Loading SYS_ROLE...
insert into SYS_ROLE (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '5', '管理员', 'system', 'security-role', '1', '1', '1', '1', to_date('19-02-2016 18:15:11', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:15:11', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_ROLE (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('91766cc228e34269a65f0564ba956bd7', '5', '一般用户', 'common', 'assignment', '8', '1', '1', '1', to_date('19-02-2016 18:15:11', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:15:11', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_ROLE (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('caacf61017114120bcf7bf1049b6d4c3', '5', '部门管理员', 'tech', 'assignment', '1', '0', '1', '1', to_date('19-02-2016 18:15:11', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:15:11', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
insert into SYS_ROLE (ID, OFFICE_ID, NAME, ENNAME, ROLE_TYPE, DATA_SCOPE, IS_SYS, USEABLE, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('dace0cab49a7428584eb57c163f45082', '1', '总公司管理员', 'zgly', 'security-role', '2', '1', '1', '1', to_date('19-02-2016 18:15:11', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('19-02-2016 18:15:11', 'dd-mm-yyyy hh24:mi:ss'), null, '0');
commit;
prompt 4 records loaded
prompt Loading SYS_ROLE_MENU...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'c2e4d9082a0b4386884a0b203afe2c5c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'c99753f4ad0a4a458337b255c3b49095');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'df7ce823c5b24ff9bada43d992f373e2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'e2565667b9a745eb870debfd0830c46f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'e3e131bb489f43dd865280e4f5932b6d');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'e4e64e24aa134deaa9d69c3b9495c997');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'ec7cf7a144a440cab217aabd4ffb7788');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'f34887a78fa245c1977603ca7dc98e11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'f9fe62186f0a4d7eada6c6827de79b26');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '0b2ebd4d639e4c2b83c2dd0764522f24');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '0ca004d6b1bf4bcab9670a5060d82a55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '2a0f940fbe304a05a6b4040ddf6df279');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '30');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '3945952858c54ff6b928265e76416aa2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '3c1c639c76f14f6f9903b0143371ea09');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '3c92c17886944d0687e73e286cada573');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '4855cf3b25c244fb8500a380db189d97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '485c63cf6af1448880bb35b7b3f2bb1b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '4d463414bc974236941a6a14dc53c73a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '54afcfd125024b6eaeab9c5c3cea0009');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '5dfd09e5790b41388b8691ea9993eba5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '63');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '64');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '65');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '6509eed6eb634030a46723a18814035c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '68f9151151174868ab436e11e03bf548');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '69');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '70');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '70de7eac2f3e4632b1b7aa3cd536b35a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '72');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '73');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '74');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '75');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '79f0ffa47dbe43ffa8824d97612d344f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '79fca849d3da4a82a4ade3f6b9f45126');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '7bd4484bd13c441395e44ab86772da00');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '7ec930fe50fb41d0a9c7aeaa01804d16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'c2e4d9082a0b4386884a0b203afe2c5c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'c3de25a76785419b8a6820db3935941d');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'c6e0080e06014abd9240f870aadf3200');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'c7fa36c7142f481397c2cc12e2bc828a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'c824b5c244cc4098853671e75858ca55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'cac8d5931531427ca0ba7e55927dcdf2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'd3f1b6f292904ef5b95f7800cc777a48');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'd64d25d7b3014f9ba7736867cb2ffc43');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'd75f64438d994fc4830b1b3d138cde32');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'd78a0f0a6c8c48699e5d081f64014b99');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'dae12251f0234673bd7b21fdd47a02b9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'de7c50d276454f80881c41a096ecf55c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'e03f8b6a5e454addb04fc08033b6f60b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'e2565667b9a745eb870debfd0830c46f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'e2efcf80fc3747329fe02d489dbfda95');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'e4e64e24aa134deaa9d69c3b9495c997');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'e824b7c20bb34c9ca9ad023e8873e67b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'ec7cf7a144a440cab217aabd4ffb7788');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'f34887a78fa245c1977603ca7dc98e11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'f5b2028cfad9470085c7c846de33193a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'f87f68e686974c12b4923a81df0dfa7c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'f93f9a3a2226461dace3b8992cf055ba');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'f9fe62186f0a4d7eada6c6827de79b26');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'ff5af1be6f7544e2893b1c79dd6e0745');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '0b2ebd4d639e4c2b83c2dd0764522f24');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '0ca004d6b1bf4bcab9670a5060d82a55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '0fde32c6c8204f92a6846714821491f7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '13');
commit;
prompt 100 records committed...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '1dc794e30998444489db19eec02915c3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '30');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '31');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '32');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '33');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '34');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '35');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '36');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '37');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '38');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '39');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '3c92c17886944d0687e73e286cada573');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '40');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '41');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '42');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '43');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '44');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '45');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '46');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '47');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '48');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '4855cf3b25c244fb8500a380db189d97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '49');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '50');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '51');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '52');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '53');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '54');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '60');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '61');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '63');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '64');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '65');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '69');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '6d7e99b2edf44c96b8bbb9c1ef6dfe66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '70');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '72');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '73');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '74');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '81');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '85');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '88');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', 'afab2db430e2457f9cf3a11feaa8b869');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', 'b1f6d1b86ba24365bae7fd86c5082317');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', 'ba8092291b40482db8fe7fc006ea3d76');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', 'c2e4d9082a0b4386884a0b203afe2c5c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', 'dcea8b88d08c4723878d372d2139448d');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2', 'df7ce823c5b24ff9bada43d992f373e2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '0b2ebd4d639e4c2b83c2dd0764522f24');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '0b2ebd4d639e4c2b83c2dd0764522f24');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '0ca004d6b1bf4bcab9670a5060d82a55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '29');
commit;
prompt 200 records committed...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '2a0f940fbe304a05a6b4040ddf6df279');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '30');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '3945952858c54ff6b928265e76416aa2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '3c92c17886944d0687e73e286cada573');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '4855cf3b25c244fb8500a380db189d97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '485c63cf6af1448880bb35b7b3f2bb1b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '4d463414bc974236941a6a14dc53c73a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '54afcfd125024b6eaeab9c5c3cea0009');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '5dfd09e5790b41388b8691ea9993eba5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '63');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '64');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '65');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '68f9151151174868ab436e11e03bf548');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '69');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '70');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '70de7eac2f3e4632b1b7aa3cd536b35a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '72');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '73');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '74');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '75');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '79f0ffa47dbe43ffa8824d97612d344f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '79fca849d3da4a82a4ade3f6b9f45126');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '7bd4484bd13c441395e44ab86772da00');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '7ec930fe50fb41d0a9c7aeaa01804d16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '81');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '83');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '86');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '87');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '88');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '8930e4aad1ba4a1c958d303968d8c442');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', '95a6a82dc5fc4d07b46e5df57a0606a3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'a4c3dcee6cbc4fc6a0bf617d8619edf3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'a4cfc713c3c04c32a274fb59c71e34ed');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'af0a174b4f424bc09a8cc0db83a64105');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'afab2db430e2457f9cf3a11feaa8b869');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'b1f6d1b86ba24365bae7fd86c5082317');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'b9a776f5d7194406bb466388e3af9d08');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'ba8092291b40482db8fe7fc006ea3d76');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'c2e4d9082a0b4386884a0b203afe2c5c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'c99753f4ad0a4a458337b255c3b49095');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'df7ce823c5b24ff9bada43d992f373e2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'e2565667b9a745eb870debfd0830c46f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'e3e131bb489f43dd865280e4f5932b6d');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'e4e64e24aa134deaa9d69c3b9495c997');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'ec7cf7a144a440cab217aabd4ffb7788');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'f34887a78fa245c1977603ca7dc98e11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('03fcd9c5c28948eb827fcd3b852494a6', 'f9fe62186f0a4d7eada6c6827de79b26');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '0ca004d6b1bf4bcab9670a5060d82a55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '13');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '30');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '31');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '32');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '33');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '34');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '35');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '36');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '37');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '38');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '39');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '3c92c17886944d0687e73e286cada573');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '40');
commit;
prompt 300 records committed...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '41');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '42');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '43');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '44');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '45');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '46');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '47');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '48');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '4855cf3b25c244fb8500a380db189d97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '49');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '50');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '51');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '52');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '53');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '54');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '60');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '61');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '63');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '64');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '65');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '69');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '6d7e99b2edf44c96b8bbb9c1ef6dfe66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '70');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '72');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '73');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '74');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '81');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '85');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '88');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', 'afab2db430e2457f9cf3a11feaa8b869');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', 'b1f6d1b86ba24365bae7fd86c5082317');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', 'ba8092291b40482db8fe7fc006ea3d76');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', 'c2e4d9082a0b4386884a0b203afe2c5c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', 'dcea8b88d08c4723878d372d2139448d');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('3', 'df7ce823c5b24ff9bada43d992f373e2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '0b2ebd4d639e4c2b83c2dd0764522f24');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '0ca004d6b1bf4bcab9670a5060d82a55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '2a0f940fbe304a05a6b4040ddf6df279');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '30');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '3c92c17886944d0687e73e286cada573');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '4855cf3b25c244fb8500a380db189d97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '4d463414bc974236941a6a14dc53c73a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '63');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '64');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '65');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '68f9151151174868ab436e11e03bf548');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '69');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '70');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '70de7eac2f3e4632b1b7aa3cd536b35a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '72');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '73');
commit;
prompt 400 records committed...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '74');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '75');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '79f0ffa47dbe43ffa8824d97612d344f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '79fca849d3da4a82a4ade3f6b9f45126');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '7ec930fe50fb41d0a9c7aeaa01804d16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '81');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '83');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '86');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '87');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '88');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '8930e4aad1ba4a1c958d303968d8c442');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', '95a6a82dc5fc4d07b46e5df57a0606a3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'a4c3dcee6cbc4fc6a0bf617d8619edf3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'a4cfc713c3c04c32a274fb59c71e34ed');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'af0a174b4f424bc09a8cc0db83a64105');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'afab2db430e2457f9cf3a11feaa8b869');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'b1f6d1b86ba24365bae7fd86c5082317');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'b9a776f5d7194406bb466388e3af9d08');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'ba8092291b40482db8fe7fc006ea3d76');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'c2e4d9082a0b4386884a0b203afe2c5c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'df7ce823c5b24ff9bada43d992f373e2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'e2565667b9a745eb870debfd0830c46f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'e4e64e24aa134deaa9d69c3b9495c997');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'ec7cf7a144a440cab217aabd4ffb7788');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'f34887a78fa245c1977603ca7dc98e11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('5', 'f9fe62186f0a4d7eada6c6827de79b26');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '0b2ebd4d639e4c2b83c2dd0764522f24');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '0ca004d6b1bf4bcab9670a5060d82a55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '2a0f940fbe304a05a6b4040ddf6df279');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '30');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '3945952858c54ff6b928265e76416aa2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '3c92c17886944d0687e73e286cada573');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '4855cf3b25c244fb8500a380db189d97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '485c63cf6af1448880bb35b7b3f2bb1b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '4d463414bc974236941a6a14dc53c73a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '54afcfd125024b6eaeab9c5c3cea0009');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '5dfd09e5790b41388b8691ea9993eba5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '63');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '64');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '65');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '68f9151151174868ab436e11e03bf548');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '69');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '70');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '70de7eac2f3e4632b1b7aa3cd536b35a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '72');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '73');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '74');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '75');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '79f0ffa47dbe43ffa8824d97612d344f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '79fca849d3da4a82a4ade3f6b9f45126');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '7bd4484bd13c441395e44ab86772da00');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '7ec930fe50fb41d0a9c7aeaa01804d16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '81');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '83');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '85');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '86');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '87');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '88');
commit;
prompt 500 records committed...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '8930e4aad1ba4a1c958d303968d8c442');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', '95a6a82dc5fc4d07b46e5df57a0606a3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'a4c3dcee6cbc4fc6a0bf617d8619edf3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'a4cfc713c3c04c32a274fb59c71e34ed');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'af0a174b4f424bc09a8cc0db83a64105');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'afab2db430e2457f9cf3a11feaa8b869');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'b1f6d1b86ba24365bae7fd86c5082317');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'b9a776f5d7194406bb466388e3af9d08');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('78cf5521ff9e43ed80266adeff67d5ed', 'ba8092291b40482db8fe7fc006ea3d76');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '0b2ebd4d639e4c2b83c2dd0764522f24');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '0ca004d6b1bf4bcab9670a5060d82a55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '0fde32c6c8204f92a6846714821491f7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '13');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '1dc794e30998444489db19eec02915c3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '30');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '31');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '32');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '33');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '34');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '35');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '36');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '37');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '38');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '39');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '3c92c17886944d0687e73e286cada573');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '40');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '41');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '42');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '43');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '44');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '45');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '46');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '47');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '48');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '4855cf3b25c244fb8500a380db189d97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '49');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '50');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '51');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '52');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '53');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '54');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '60');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '61');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '63');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '64');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '65');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '69');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '6d7e99b2edf44c96b8bbb9c1ef6dfe66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '70');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '72');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '73');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '74');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '81');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '872d2edc3b61405eb1448355e8f2c556');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '88');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', 'afab2db430e2457f9cf3a11feaa8b869');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', 'b1f6d1b86ba24365bae7fd86c5082317');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', 'ba8092291b40482db8fe7fc006ea3d76');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', 'c2e4d9082a0b4386884a0b203afe2c5c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
commit;
prompt 600 records committed...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', 'dcea8b88d08c4723878d372d2139448d');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1', 'df7ce823c5b24ff9bada43d992f373e2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '0787b03f8a7d46d2b398ddcc23545d31');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '07f90eb4ad5848cba282a2e19bbebf60');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '0ca004d6b1bf4bcab9670a5060d82a55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '20b1147d34e14580b88ed00dd5d3ef78');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '2209119856094953ba6ebc339b415887');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '247bcf278dfc40cca447f5c736c6d849');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '28abe4b0cb3b4c8480f84c07a5dfaf06');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '2a0f940fbe304a05a6b4040ddf6df279');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '2c6838e2f935453485342836efb63c1f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '3518c0cfa3b645b09a6fa979ac641f41');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '3c1c639c76f14f6f9903b0143371ea09');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '3c92c17886944d0687e73e286cada573');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '456fea6a94114987b3f4d5b973a4f46b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '4855cf3b25c244fb8500a380db189d97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '487af8d5d1034c9d852007f1b3a27342');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '4d463414bc974236941a6a14dc53c73a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '5239527958e94d418997b584b85d8b80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '55a33ae3ec2d466682ba2d701bea6fd0');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '57f1f00d6cb14819bef388acd10e6f5a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '59f304d5312e4502930fef5dd8117b29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '5b1ca1d4aa5b4a56a6682093fafda4f5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '5ca66750233b46699593dc083f87cd60');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '6509eed6eb634030a46723a18814035c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '6890f329854d41bd92d4857e18ce641d');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '68f9151151174868ab436e11e03bf548');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '6c672b854d2b4821b89297640df5fc26');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '6d3a6777693f47c98e9b3051cacbcfdb');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '70de7eac2f3e4632b1b7aa3cd536b35a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '70f867cb6f23489d8427e295e0e63a6f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '7402c1aad68f46d99f3a0868737ca582');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '79f0ffa47dbe43ffa8824d97612d344f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '79fca849d3da4a82a4ade3f6b9f45126');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '7ec930fe50fb41d0a9c7aeaa01804d16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '8211dbd824ca422fb5baf1bade46696b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '8815c9a95cf54b19a39b0ce0ff4c32f8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '8926112d6acd4a18b5e5dcf99a1f7ff3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '8930e4aad1ba4a1c958d303968d8c442');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '8f6d10c69f0247a0806f0f1db4caef16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '8ff255c054e5467aac19eb9d5abf8859');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '91aa429a6cdc4a9b954d84ff1456934b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '95a6a82dc5fc4d07b46e5df57a0606a3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '9bc1aa1053144a608b73f6fbd841d1c6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', '9fdf5971a9e64fac8bbffec2825a5f97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'a4c3dcee6cbc4fc6a0bf617d8619edf3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'a4cfc713c3c04c32a274fb59c71e34ed');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'ae4627d9a17c4593a171349a61ab6fcf');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'af0a174b4f424bc09a8cc0db83a64105');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'afab2db430e2457f9cf3a11feaa8b869');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'b051156518fd413794cf0316830aaf07');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'b1f6d1b86ba24365bae7fd86c5082317');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('1c54e003c1fc4dcd9b087ef8d48abac3', 'b9a776f5d7194406bb466388e3af9d08');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '0787b03f8a7d46d2b398ddcc23545d31');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '07f90eb4ad5848cba282a2e19bbebf60');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '0ca004d6b1bf4bcab9670a5060d82a55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '19');
commit;
prompt 700 records committed...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '20b1147d34e14580b88ed00dd5d3ef78');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '2209119856094953ba6ebc339b415887');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '247bcf278dfc40cca447f5c736c6d849');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '28abe4b0cb3b4c8480f84c07a5dfaf06');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '2a0f940fbe304a05a6b4040ddf6df279');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '2c6838e2f935453485342836efb63c1f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '3518c0cfa3b645b09a6fa979ac641f41');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '3c1c639c76f14f6f9903b0143371ea09');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '3c92c17886944d0687e73e286cada573');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '456fea6a94114987b3f4d5b973a4f46b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '4855cf3b25c244fb8500a380db189d97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '487af8d5d1034c9d852007f1b3a27342');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '4d463414bc974236941a6a14dc53c73a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '5239527958e94d418997b584b85d8b80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '55a33ae3ec2d466682ba2d701bea6fd0');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '57f1f00d6cb14819bef388acd10e6f5a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '59f304d5312e4502930fef5dd8117b29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '5b1ca1d4aa5b4a56a6682093fafda4f5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '5ca66750233b46699593dc083f87cd60');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '6509eed6eb634030a46723a18814035c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '6890f329854d41bd92d4857e18ce641d');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '68f9151151174868ab436e11e03bf548');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '6c672b854d2b4821b89297640df5fc26');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '6d3a6777693f47c98e9b3051cacbcfdb');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '70de7eac2f3e4632b1b7aa3cd536b35a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '70f867cb6f23489d8427e295e0e63a6f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '7402c1aad68f46d99f3a0868737ca582');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '79f0ffa47dbe43ffa8824d97612d344f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '79fca849d3da4a82a4ade3f6b9f45126');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '7ec930fe50fb41d0a9c7aeaa01804d16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '8211dbd824ca422fb5baf1bade46696b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '8815c9a95cf54b19a39b0ce0ff4c32f8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '8926112d6acd4a18b5e5dcf99a1f7ff3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '8930e4aad1ba4a1c958d303968d8c442');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '81');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '83');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '86');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '87');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '88');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '8930e4aad1ba4a1c958d303968d8c442');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', '95a6a82dc5fc4d07b46e5df57a0606a3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'a4c3dcee6cbc4fc6a0bf617d8619edf3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'a4cfc713c3c04c32a274fb59c71e34ed');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'af0a174b4f424bc09a8cc0db83a64105');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'afab2db430e2457f9cf3a11feaa8b869');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'b1f6d1b86ba24365bae7fd86c5082317');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'b9a776f5d7194406bb466388e3af9d08');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'ba8092291b40482db8fe7fc006ea3d76');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'c2e4d9082a0b4386884a0b203afe2c5c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'c99753f4ad0a4a458337b255c3b49095');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'df7ce823c5b24ff9bada43d992f373e2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'e2565667b9a745eb870debfd0830c46f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'e3e131bb489f43dd865280e4f5932b6d');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'e4e64e24aa134deaa9d69c3b9495c997');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'ec7cf7a144a440cab217aabd4ffb7788');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'f34887a78fa245c1977603ca7dc98e11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'f93f9a3a2226461dace3b8992cf055ba');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('91766cc228e34269a65f0564ba956bd7', 'f9fe62186f0a4d7eada6c6827de79b26');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '0b2ebd4d639e4c2b83c2dd0764522f24');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '0ca004d6b1bf4bcab9670a5060d82a55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '0fde32c6c8204f92a6846714821491f7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '13');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '17');
commit;
prompt 800 records committed...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '1dc794e30998444489db19eec02915c3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '30');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '31');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '32');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '33');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '34');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '35');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '36');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '37');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '38');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '39');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '3c92c17886944d0687e73e286cada573');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '40');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '41');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '42');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '43');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '44');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '45');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '46');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '47');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '48');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '4855cf3b25c244fb8500a380db189d97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '49');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '4d463414bc974236941a6a14dc53c73a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '50');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '51');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '52');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '53');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '54');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '5e72ae5a7d56478c8db2a7975883f367');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '60');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '61');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '63');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '64');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '65');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '69');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '6d7e99b2edf44c96b8bbb9c1ef6dfe66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '70');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '70de7eac2f3e4632b1b7aa3cd536b35a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '72');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '73');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '74');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '7ec930fe50fb41d0a9c7aeaa01804d16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '81');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '88');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', '95a6a82dc5fc4d07b46e5df57a0606a3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', 'a4cfc713c3c04c32a274fb59c71e34ed');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', 'af0a174b4f424bc09a8cc0db83a64105');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', 'afab2db430e2457f9cf3a11feaa8b869');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', 'b1f6d1b86ba24365bae7fd86c5082317');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', 'ba8092291b40482db8fe7fc006ea3d76');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', 'c2e4d9082a0b4386884a0b203afe2c5c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', 'dcea8b88d08c4723878d372d2139448d');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', 'df7ce823c5b24ff9bada43d992f373e2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('a74b7da6e0e0458298316798e89e70ea', 'f9fe62186f0a4d7eada6c6827de79b26');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '20');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '21');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '22');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '27');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '29');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '30');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '31');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '32');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '33');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '34');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '35');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '36');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '37');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '38');
commit;
prompt 900 records committed...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '39');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '3c92c17886944d0687e73e286cada573');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '4');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '40');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '41');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '42');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '43');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '44');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '45');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '46');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '47');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '48');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '4855cf3b25c244fb8500a380db189d97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '49');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '4d463414bc974236941a6a14dc53c73a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '5');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '50');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '51');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '52');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '53');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '54');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '56');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '57');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '58');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '59');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '60');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '61');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '62');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '63');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '64');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '65');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '67');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '68');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '69');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '6d7e99b2edf44c96b8bbb9c1ef6dfe66');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '70');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '72');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '73');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '74');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '79');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '8');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '80');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '81');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '82');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '84');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '88');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '89');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', 'af0a174b4f424bc09a8cc0db83a64105');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', 'afab2db430e2457f9cf3a11feaa8b869');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', 'b1f6d1b86ba24365bae7fd86c5082317');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', 'ba8092291b40482db8fe7fc006ea3d76');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', 'c2e4d9082a0b4386884a0b203afe2c5c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', 'dcea8b88d08c4723878d372d2139448d');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', 'df7ce823c5b24ff9bada43d992f373e2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '8f6d10c69f0247a0806f0f1db4caef16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '8ff255c054e5467aac19eb9d5abf8859');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '90');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '91aa429a6cdc4a9b954d84ff1456934b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '95a6a82dc5fc4d07b46e5df57a0606a3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '9bc1aa1053144a608b73f6fbd841d1c6');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', '9fdf5971a9e64fac8bbffec2825a5f97');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'a4c3dcee6cbc4fc6a0bf617d8619edf3');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'a4cfc713c3c04c32a274fb59c71e34ed');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'ae4627d9a17c4593a171349a61ab6fcf');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'af0a174b4f424bc09a8cc0db83a64105');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'afab2db430e2457f9cf3a11feaa8b869');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'b051156518fd413794cf0316830aaf07');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'b1f6d1b86ba24365bae7fd86c5082317');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'b9a776f5d7194406bb466388e3af9d08');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'c2e4d9082a0b4386884a0b203afe2c5c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'c3de25a76785419b8a6820db3935941d');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'c6e0080e06014abd9240f870aadf3200');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'c7fa36c7142f481397c2cc12e2bc828a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'c824b5c244cc4098853671e75858ca55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'cac8d5931531427ca0ba7e55927dcdf2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'd15ec45a4c5449c3bbd7a61d5f9dd1d2');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'd3f1b6f292904ef5b95f7800cc777a48');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'd64d25d7b3014f9ba7736867cb2ffc43');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'd75f64438d994fc4830b1b3d138cde32');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'd78a0f0a6c8c48699e5d081f64014b99');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'dae12251f0234673bd7b21fdd47a02b9');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'de7c50d276454f80881c41a096ecf55c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'e03f8b6a5e454addb04fc08033b6f60b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'e2565667b9a745eb870debfd0830c46f');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'e2efcf80fc3747329fe02d489dbfda95');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'e4e64e24aa134deaa9d69c3b9495c997');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'e824b7c20bb34c9ca9ad023e8873e67b');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'ec7cf7a144a440cab217aabd4ffb7788');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'f34887a78fa245c1977603ca7dc98e11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'f5b2028cfad9470085c7c846de33193a');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'f87f68e686974c12b4923a81df0dfa7c');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'f93f9a3a2226461dace3b8992cf055ba');
commit;
prompt 1000 records committed...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'f9fe62186f0a4d7eada6c6827de79b26');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('caacf61017114120bcf7bf1049b6d4c3', 'ff5af1be6f7544e2893b1c79dd6e0745');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '0b2ebd4d639e4c2b83c2dd0764522f24');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '0ca004d6b1bf4bcab9670a5060d82a55');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '0fde32c6c8204f92a6846714821491f7');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '1');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '10');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '11');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '12');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '13');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '14');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '15');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '16');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '17');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '18');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '19');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('f6d2f215ed734cc09273928acab6e136', '1dc794e30998444489db19eec02915c3');
commit;
prompt 1017 records loaded
prompt Loading SYS_ROLE_OFFICE...
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '10');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '11');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '12');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '13');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '14');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '15');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '16');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '17');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '18');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '19');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '20');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '21');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '22');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '23');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '24');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '25');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '26');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '7');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '8');
insert into SYS_ROLE_OFFICE (ROLE_ID, OFFICE_ID)
values ('7', '9');
commit;
prompt 20 records loaded
prompt Loading SYS_USER...
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, QRCODE)
values ('f6679e1c07b94e2f9b66d69b271e1bbe', '1', '5', 'test', '8375ad31c441100804affefac287c5b34f1a41f1e1e544bf0954ae1b', '20160225', 'test', null, null, null, '1', '/BZDX/userfiles/1/images/photo/2016/02/my.jpg', '127.0.0.1', to_date('25-02-2016 22:55:46', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', to_date('25-02-2016 21:49:41', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('14-03-2016 20:42:43', 'dd-mm-yyyy hh24:mi:ss'), '管理员', '0', '/jeeplus/userfiles/f6679e1c07b94e2f9b66d69b271e1bbe/qrcode/f6679e1c07b94e2f9b66d69b271e1bbe.png');
insert into SYS_USER (ID, COMPANY_ID, OFFICE_ID, LOGIN_NAME, PASSWORD, NO, NAME, EMAIL, PHONE, MOBILE, USER_TYPE, PHOTO, LOGIN_IP, LOGIN_DATE, LOGIN_FLAG, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG, QRCODE)
values ('1', '1', '5', 'admin', 'd6a33a2456338a88acec133487d38ccf163abb4575b368b074e327ee', '0001', 'admin', null, null, null, '1', '/BZDX/userfiles/1/images/my.jpg', '127.0.0.1', to_date('14-03-2016 20:54:57', 'dd-mm-yyyy hh24:mi:ss'), '1', '1', null, '1', to_date('14-03-2016 20:43:00', 'dd-mm-yyyy hh24:mi:ss'), '系统管理员', '0', '/jeeplus/userfiles/1/qrcode/1.png');
commit;
prompt 2 records loaded
prompt Loading SYS_USER_FRIEND...
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('0725eea71b504a188e24a66e58f65cf9', '8b454376c0434e2792a1dc57edf80dbd', 'cb359e3089224f97adae46cf03c0ed94');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('08cba404e7b24e42992a49999b4de91a', '45f8002c452d4a54a82f113379c7b853', '0e01985207154708a01e53ca07965665');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('0ed41b44291c487c925e58fa5a504664', '8b454376c0434e2792a1dc57edf80dbd', '42f5435f943a4e8cbcd86ec07b1d922a');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('1005559436d043c8a2209a746ac53bca', '8b454376c0434e2792a1dc57edf80dbd', '5ad0d1f9efdc44b481b02c26b67e832e');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('1379a552537645448db985c2fb1d3953', '1', '2e6214ad951548f09aa58c943a897240');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('1cdeea5042bb4a0cbba8902d9c0732c4', '8b454376c0434e2792a1dc57edf80dbd', 'd355e9e6b4ad48a59fa0a983e8b7b583');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('1cf35e13c27a4750803f73098b886553', '8b454376c0434e2792a1dc57edf80dbd', '95b3b09fa0b34ac6b95907237c744c55');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('2186c3bc23db4a009bdbd65b50bb8ef3', '8b454376c0434e2792a1dc57edf80dbd', '3f7ef2d4761f445e946413ab9bea23db');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('2852d80e36ec4c0193092d8093315a3c', '1', '0e01985207154708a01e53ca07965665');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('2a1eb5760e4548ecaee92f378a43fdce', '8b454376c0434e2792a1dc57edf80dbd', '6');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('2cbf8cc396044ca7a95282c6c9684516', '8b454376c0434e2792a1dc57edf80dbd', '4639f877ec7149258cadcf145b4182a7');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('2d5876dd4a174c139270ca7b4ee51b74', '45f8002c452d4a54a82f113379c7b853', '1690569548d2400b893e4348b5445468');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('410e5a8c33f4499faaf6c55674fb295b', '8b454376c0434e2792a1dc57edf80dbd', '8');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('598950c23ae147b7b360fb5b4311120a', '8b454376c0434e2792a1dc57edf80dbd', '19e655ebcd844747aa0e46efe9870169');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('6493d5c972934bb38fef91cc54e969d1', '8b454376c0434e2792a1dc57edf80dbd', 'f12330474f634e2897878e8f56a910ae');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('67f951fc7c8440a49a1af90f4aed5ac9', '1', '45f8002c452d4a54a82f113379c7b853');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('6df3fc9c46724da4a56c72ffb85b67b3', '8b454376c0434e2792a1dc57edf80dbd', 'dc9663e71aaa42f0a2634770896ec74c');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('734946756a6340aaad71cfa621d1a493', '8b454376c0434e2792a1dc57edf80dbd', '7');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('79a5ca003e6a4ef6bc1a43c4a085551f', '0e01985207154708a01e53ca07965665', '45f8002c452d4a54a82f113379c7b853');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('83f29f5ff3aa4fc2be00bfd45212fb2a', '8b454376c0434e2792a1dc57edf80dbd', '13');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('8a1b8abb1f134bd687b3368166546d6b', '8b454376c0434e2792a1dc57edf80dbd', '3');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('8c0edfb9670a426d9bfa9a951bda919f', '8b454376c0434e2792a1dc57edf80dbd', '6474fda3f35c4d1580b646a42f190cf7');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('8c2c5518bc1d4033a6090305d6fc3b16', '8b454376c0434e2792a1dc57edf80dbd', 'eca1a51b803449d59ce4e2a3b0f4f787');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('8f4c71c74c28416c85553c139764c7d1', '45f8002c452d4a54a82f113379c7b853', '45f8002c452d4a54a82f113379c7b853');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('9872f6791ad44a4eb036db1c4e72bf15', '1', '1690569548d2400b893e4348b5445468');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('a1e6bfbb44a14fb1be1d09c5615daa94', '1', '7e9cac2b269c4671a17c5121877b5ecd');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('b40660a8b3ac49d9a46b424ad64ba264', '8b454376c0434e2792a1dc57edf80dbd', 'bb81a0c098a444e69028380e80852d91');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('b73b147471c24ae8865b924d877b5512', '8b454376c0434e2792a1dc57edf80dbd', '5b61eb41f80f43c5b8e485866178f63d');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('ba870cd0d5d443c9a9e239c06d13b0d5', '8b454376c0434e2792a1dc57edf80dbd', '1');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('ba8f1dc4433d4c5b9259922f25b1234b', '8b454376c0434e2792a1dc57edf80dbd', '9');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('c84a1d30344f4833811356d9b2c3c50e', '8b454376c0434e2792a1dc57edf80dbd', 'da60c61cf2aa4cb2810c629c7045c538');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('cdf3216c5fa6472d9007d5dd6ccefc49', '45f8002c452d4a54a82f113379c7b853', '2e6214ad951548f09aa58c943a897240');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('ce37fa05072e45fcb82590420965f918', '8b454376c0434e2792a1dc57edf80dbd', 'd8de25a1f872404e82f669c04091685e');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('d45d0c14f1c8473d8ff9687784851519', '8b454376c0434e2792a1dc57edf80dbd', '5091ca619fbf49209bce020859103ba5');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('d96b32e6663a4d25b2de7496c4d7b6b8', '8b454376c0434e2792a1dc57edf80dbd', '4');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('d96f5fade2444ffbb819076d19bfc47c', '1', 'cb359e3089224f97adae46cf03c0ed94');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('dbaf20aefb9b45a2bafd91c0eeb43d8f', '8b454376c0434e2792a1dc57edf80dbd', '8b454376c0434e2792a1dc57edf80dbd');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('e8d118adbca24591bcee16a11b87c125', '8b454376c0434e2792a1dc57edf80dbd', 'd42378c9621b4551a0c4c63c82f0aa33');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('e9cc167bb4d440e19cda94d65866198e', '1', 'f12330474f634e2897878e8f56a910ae');
insert into SYS_USER_FRIEND (ID, USERID, FRIENDID)
values ('ed45cb60c47040ae8ad4b703cd282f4c', '1', 'dc9663e71aaa42f0a2634770896ec74c');
commit;
prompt 40 records loaded
prompt Loading SYS_USER_ROLE...
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('0e01985207154708a01e53ca07965665', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('0f7017853ec24648872e01fe9c930969', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('1', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('1', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('1', 'dace0cab49a7428584eb57c163f45082');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('10', 'f6d2f215ed734cc09273928acab6e136');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('11', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('12', 'f6d2f215ed734cc09273928acab6e136');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('13', '5');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('14', '6');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('1690569548d2400b893e4348b5445468', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('19e655ebcd844747aa0e46efe9870169', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('19e655ebcd844747aa0e46efe9870169', '5');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('19e655ebcd844747aa0e46efe9870169', '91766cc228e34269a65f0564ba956bd7');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('19e655ebcd844747aa0e46efe9870169', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('2', 'f6d2f215ed734cc09273928acab6e136');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('2e6214ad951548f09aa58c943a897240', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('2e6214ad951548f09aa58c943a897240', '91766cc228e34269a65f0564ba956bd7');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('3', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('3', 'f6d2f215ed734cc09273928acab6e136');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('3f7ef2d4761f445e946413ab9bea23db', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('4', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('42f5435f943a4e8cbcd86ec07b1d922a', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('45f8002c452d4a54a82f113379c7b853', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('45f8002c452d4a54a82f113379c7b853', '91766cc228e34269a65f0564ba956bd7');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('4639f877ec7149258cadcf145b4182a7', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('4639f877ec7149258cadcf145b4182a7', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('5', 'f6d2f215ed734cc09273928acab6e136');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('5091ca619fbf49209bce020859103ba5', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('5091ca619fbf49209bce020859103ba5', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('51938e17b432476bbe489a2c523183a4', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('5ad0d1f9efdc44b481b02c26b67e832e', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('5ad0d1f9efdc44b481b02c26b67e832e', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('5b61eb41f80f43c5b8e485866178f63d', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('6', 'f6d2f215ed734cc09273928acab6e136');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('6474fda3f35c4d1580b646a42f190cf7', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('6d69972a880f4228b88f28254c3e417e', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('7', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('7', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('7e9cac2b269c4671a17c5121877b5ecd', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('7e9cac2b269c4671a17c5121877b5ecd', '91766cc228e34269a65f0564ba956bd7');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('8', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('8b454376c0434e2792a1dc57edf80dbd', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('9', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('9', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('95b3b09fa0b34ac6b95907237c744c55', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('a68dfe143da9485b9b6c0335c3a70618', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('a68dfe143da9485b9b6c0335c3a70618', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('a91be50880744e4787a77e0f97f8dbb5', '03fcd9c5c28948eb827fcd3b852494a6');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('a91be50880744e4787a77e0f97f8dbb5', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('a91be50880744e4787a77e0f97f8dbb5', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('a91be50880744e4787a77e0f97f8dbb5', 'f6d2f215ed734cc09273928acab6e136');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('bb81a0c098a444e69028380e80852d91', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('bb81a0c098a444e69028380e80852d91', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('cb176ef0bce14c80ac5c2809861b560a', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('cb176ef0bce14c80ac5c2809861b560a', '91766cc228e34269a65f0564ba956bd7');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('cb359e3089224f97adae46cf03c0ed94', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('d355e9e6b4ad48a59fa0a983e8b7b583', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('d42378c9621b4551a0c4c63c82f0aa33', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('d42378c9621b4551a0c4c63c82f0aa33', '91766cc228e34269a65f0564ba956bd7');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('d42378c9621b4551a0c4c63c82f0aa33', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('d8de25a1f872404e82f669c04091685e', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('da60c61cf2aa4cb2810c629c7045c538', '91766cc228e34269a65f0564ba956bd7');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('dc9663e71aaa42f0a2634770896ec74c', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('dc9663e71aaa42f0a2634770896ec74c', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('eca1a51b803449d59ce4e2a3b0f4f787', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('eca1a51b803449d59ce4e2a3b0f4f787', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('eedf59cb73cd413cbb14c42c2f797482', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('ef40b2bbae144c05a5be85b48669eea2', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('ef40b2bbae144c05a5be85b48669eea2', '91766cc228e34269a65f0564ba956bd7');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('f12330474f634e2897878e8f56a910ae', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('f6679e1c07b94e2f9b66d69b271e1bbe', '1c54e003c1fc4dcd9b087ef8d48abac3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('f6679e1c07b94e2f9b66d69b271e1bbe', '91766cc228e34269a65f0564ba956bd7');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('f6679e1c07b94e2f9b66d69b271e1bbe', 'caacf61017114120bcf7bf1049b6d4c3');
insert into SYS_USER_ROLE (USER_ID, ROLE_ID)
values ('f6679e1c07b94e2f9b66d69b271e1bbe', 'dace0cab49a7428584eb57c163f45082');
commit;
prompt 75 records loaded
prompt Loading TB_PHONETYPE...
prompt Table is empty
prompt Loading TEST_DATA...
prompt Table is empty
prompt Loading TEST_DATA_CHILD...
prompt Table is empty
prompt Loading TEST_DATA_CHILD2...
prompt Table is empty
prompt Loading TEST_DATA_CHILD3...
prompt Table is empty
prompt Loading TEST_DATA_MAIN...
prompt Table is empty
prompt Loading TEST_INTERFACE...
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('02c5ad21ab604baba5aaa9795815d769', 'post', 'http://localhost:8080/jeeplus/a/sys/user/infoEdit;JSESSIONID=21a65e45a78f415c9c21f9376df9c1d3?__ajax=true&amp;mobileLogin=true', 'name=lily&amp;email=117575171@qq.com&amp;phone=025-83191633&amp;mobile=18951655371&amp;remarks=备注信息', null, null, '0', '完善用户信息', null);
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('0bd7170af4b94464ad3dbfa4d8d2dd5d', 'post', 'http://localhost:8080/jeeplus/a/iim/contact/addFriend;JSESSIONID=21a65e45a78f415c9c21f9376df9c1d3?__ajax', 'friendName=用户登录名', null, null, '0', '添加常用联系人', null);
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('35a8a587b68a4996b935ab7feefdcb13', 'post', 'http://localhost:8080/jeeplus/a/sys/register/registerUser', 'mobileLogin=true&amp;loginName=thinkgem1&amp;roleName=system&amp;password=fnst1234&amp;mobile=18951655371&amp;randomCode=1234', '{&quot;success&quot;:false,&quot;msg&quot;:&quot;手机验证码不正确!&quot;}', null, '0', '用户注册', null);
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('45fa62a43e0f4570890d701c59258217', 'post', 'http://localhost:8080/jeeplus/a/iim/contact/deleteFriend;JSESSIONID=21a65e45a78f415c9c21f9376df9c1d3?__ajax', 'friendName=用户登录名', null, null, '0', '删除常用联系人', null);
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('48418888f8d7469c8460e7ff48e33673', 'post', 'http://localhost:8080/jeeplus/a/login?__ajax', 'username=admin&amp;password=admin&amp;mobileLogin=true', '{&quot;username&quot;:&quot;thinkgem&quot;,&quot;name&quot;:&quot;admin&quot;,&quot;mobileLogin&quot;:true,&quot;JSESSIONID&quot;:&quot;bc2587ecbc9c454c923232cbdb69da2a&quot;,&quot;success&quot;:true,&quot;msg&quot;:&quot;登录成功!&quot;}', null, '0', '登录', null);
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('54cdba711dec4aadb80e8ecf7f450f4c', 'get', 'http://192.168.1.100:8080/HeartCare/a/sys/user/validateLoginName?loginName=thinkgem', null, 'true', 'false', '1', '用户名是否已经被注册', null);
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('5ed6916a54b94acd899373f7d5ec2912', 'post', 'http://localhost:8080/jeeplus/a/sys/user/imageUpload;JSESSIONID=21a65e45a78f415c9c21f9376df9c1d3?__ajax', 'file', null, null, '0', '上传头像', null);
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('64b77cbdf2044070ae6f6c09785754a4', 'get', 'http://192.168.1.100:8080/HeartCare/a/sys/user/validateMobile?mobile=18951655371', null, 'true', 'false', '1', '手机号是否已被注册', null);
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('9a8a0b374df24714a485d3b18c9ebc56', 'post', 'http://localhost:8080/HeartCare/a/login?__ajax', 'username=thinkgem&amp;password=admin&amp;clientLogin=true', null, null, '1', 'C#客户端登录', null);
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('a9d14c5d30be405fb34d64eb0c2c0818', 'get', 'http://localhost:8080/jeeplus/a/sys/user/resetPassword?mobile=18951655371', null, null, null, '0', '重置密码', null);
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('af79dec2a3134632a8b6f1b363c9aba9', 'get', 'http://localhost:8080/jeeplus/a/sys/user/infoData;JSESSIONID=21a65e45a78f415c9c21f9376df9c1d3?__ajax=true&amp;mobileLogin=true', null, null, '{&quot;error&quot;:&quot;0&quot;,&quot;msg&quot;:&quot;没有登录&quot;}', '0', '获取登录用户信息', null);
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('e94c27c961a44212b584dd04c6352adf', 'get', 'http://localhost:8080/jeeplus/a/sys/register/getRegisterCode?mobile=18951655371', null, null, '{&quot;success&quot;:false,&quot;msg&quot;:&quot;因未知原因导致短信发送失败，请联系管理员。&quot;}', '0', '短信接口', null);
insert into TEST_INTERFACE (ID, TYPE, URL, BODY, SUCCESSMSG, ERRORMSG, DEL_FLAG, NAME, comment)
values ('fcd8bddd2f2c4f5d9e333cb014f1938b', 'get', 'http://192.168.1.100:8080/HeartCare/a/logout;JSESSIONID=b6b486a8919e4fc196358e10b6a82a2b?__ajax=true', null, '1  {&quot;success&quot;:&quot;1&quot;,&quot;msg&quot;:&quot;退出成功&quot;}', null, '0', '退出', null);
commit;
prompt 13 records loaded
prompt Loading TEST_TREE...
insert into TEST_TREE (ID, NAME, SORT, PARENT_ID, PARENT_IDS, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('37258342457c4f969099df42d6fe945f', '22', 30, '0', '0,', '1', to_date('13-03-2016 23:44:04', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('13-03-2016 23:44:04', 'dd-mm-yyyy hh24:mi:ss'), '22', '0');
commit;
prompt 1 records loaded
set feedback on
set define on
prompt Done.
