------------------------------------------
-- Export file for user BBTY            --
-- Created by 翁仕达 on 2017/2/2, 12:12:04 --
------------------------------------------

set define off
spool bbty_table.log

prompt
prompt Creating table T_GOOD_INFO
prompt ==========================
prompt
create table BBTY.T_GOOD_INFO
(
  infoid      NUMBER(10) not null,
  typeid      NUMBER(10),
  infocode    VARCHAR2(20),
  infoname    VARCHAR2(20),
  marker      VARCHAR2(255),
  markaddress VARCHAR2(255),
  website     VARCHAR2(255),
  contact     VARCHAR2(255),
  fax         VARCHAR2(255),
  zipcode     VARCHAR2(255),
  status      VARCHAR2(1),
  remark      VARCHAR2(255)
)
tablespace BBTY
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table BBTY.T_GOOD_INFO
  is '商品信息表';
comment on column BBTY.T_GOOD_INFO.infoid
  is '商品主键';
comment on column BBTY.T_GOOD_INFO.typeid
  is '商品类别';
comment on column BBTY.T_GOOD_INFO.infocode
  is '商品编号';
comment on column BBTY.T_GOOD_INFO.infoname
  is '商品名称';
comment on column BBTY.T_GOOD_INFO.marker
  is '制造商';
comment on column BBTY.T_GOOD_INFO.markaddress
  is '地址';
comment on column BBTY.T_GOOD_INFO.website
  is '网站';
comment on column BBTY.T_GOOD_INFO.contact
  is '联系方式';
comment on column BBTY.T_GOOD_INFO.fax
  is '传真';
comment on column BBTY.T_GOOD_INFO.zipcode
  is '邮编';
comment on column BBTY.T_GOOD_INFO.status
  is '商品状态,0-停用，1-启用';
comment on column BBTY.T_GOOD_INFO.remark
  is '备注';
alter table BBTY.T_GOOD_INFO
  add constraint PK_GOOD_INFO primary key (INFOID)
  using index 
  tablespace BBTYIDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_GOOD_METER
prompt ===========================
prompt
create table BBTY.T_GOOD_METER
(
  meterid   NUMBER(10) not null,
  metername VARCHAR2(255),
  metercode VARCHAR2(20)
)
tablespace BBTY
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table BBTY.T_GOOD_METER
  is '商品计量单位配置表';
comment on column BBTY.T_GOOD_METER.meterid
  is '计量单位主键';
comment on column BBTY.T_GOOD_METER.metername
  is '计量单位名称';
comment on column BBTY.T_GOOD_METER.metercode
  is '计量单位编码';
alter table BBTY.T_GOOD_METER
  add constraint PK_GOOD_METER primary key (METERID)
  using index 
  tablespace BBTYIDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_GOOD_REP
prompt =========================
prompt
create table BBTY.T_GOOD_REP
(
  repid      NUMBER(10) not null,
  infoid     NUMBER(10),
  pici       NUMBER(10),
  cbp        NUMBER(10,2),
  pfp        NUMBER(10,2),
  sczdp      NUMBER(10,2),
  xsp        NUMBER(10,2),
  repnum     NUMBER(10),
  repdate    VARCHAR2(14),
  repuptdate VARCHAR2(14),
  repempid   NUMBER(10),
  meterid    NUMBER(10) not null
)
tablespace BBTY
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table BBTY.T_GOOD_REP
  is '商品库存表';
comment on column BBTY.T_GOOD_REP.repid
  is '库存主键';
comment on column BBTY.T_GOOD_REP.infoid
  is '商品主键';
comment on column BBTY.T_GOOD_REP.pici
  is '批次';
comment on column BBTY.T_GOOD_REP.cbp
  is '成本价格';
comment on column BBTY.T_GOOD_REP.pfp
  is '批发价格';
comment on column BBTY.T_GOOD_REP.sczdp
  is '市场指导价格';
comment on column BBTY.T_GOOD_REP.xsp
  is '销售价格';
comment on column BBTY.T_GOOD_REP.repnum
  is '商品库存数量';
comment on column BBTY.T_GOOD_REP.repdate
  is '入库时间';
comment on column BBTY.T_GOOD_REP.repuptdate
  is '库存最新修改时间';
comment on column BBTY.T_GOOD_REP.repempid
  is '入库员';
comment on column BBTY.T_GOOD_REP.meterid
  is '计量单位主键';

prompt
prompt Creating table T_GOOD_REP_WATER
prompt ===============================
prompt
create table BBTY.T_GOOD_REP_WATER
(
  waterid     NUMBER(10) not null,
  repid       NUMBER(10),
  pici        NUMBER(10),
  cbp         NUMBER(10,2),
  pfp         NUMBER(10,2),
  sczdp       NUMBER(10,2),
  xsp         NUMBER(10,2),
  repnum      NUMBER(10),
  watertype   VARCHAR2(1),
  repuptdate  VARCHAR2(14),
  repuptempid NUMBER(10),
  infoid      NUMBER(10),
  meterid     NUMBER(10) not null
)
tablespace BBTY
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table BBTY.T_GOOD_REP_WATER
  is '库存变动流水表';
comment on column BBTY.T_GOOD_REP_WATER.waterid
  is '流水主键';
comment on column BBTY.T_GOOD_REP_WATER.repid
  is '库存主键';
comment on column BBTY.T_GOOD_REP_WATER.pici
  is '批次';
comment on column BBTY.T_GOOD_REP_WATER.cbp
  is '成本价格';
comment on column BBTY.T_GOOD_REP_WATER.pfp
  is '批发价格';
comment on column BBTY.T_GOOD_REP_WATER.sczdp
  is '市场指导价格';
comment on column BBTY.T_GOOD_REP_WATER.xsp
  is '销售价格';
comment on column BBTY.T_GOOD_REP_WATER.repnum
  is '库存处理数量';
comment on column BBTY.T_GOOD_REP_WATER.watertype
  is '库存变更类型 0-入库新增,1-入库修改,2-入库删除,3-采购全部退货,4-采购部分退货';
comment on column BBTY.T_GOOD_REP_WATER.repuptdate
  is '库存修改时间 格式YYYYMMDDHHMMSS';
comment on column BBTY.T_GOOD_REP_WATER.repuptempid
  is '库存修改人员';
comment on column BBTY.T_GOOD_REP_WATER.infoid
  is '商品主键';
comment on column BBTY.T_GOOD_REP_WATER.meterid
  is '计量单位主键';

prompt
prompt Creating table T_GOOD_TYPE
prompt ==========================
prompt
create table BBTY.T_GOOD_TYPE
(
  typeid    NUMBER(10) not null,
  typecode  VARCHAR2(20),
  typename  VARCHAR2(50),
  partypeid NUMBER(10),
  status    VARCHAR2(1),
  remark    VARCHAR2(255),
  isleaf    VARCHAR2(1)
)
tablespace BBTY
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table BBTY.T_GOOD_TYPE
  is '商品类别表';
comment on column BBTY.T_GOOD_TYPE.typeid
  is '主键';
comment on column BBTY.T_GOOD_TYPE.typecode
  is '类别编码';
comment on column BBTY.T_GOOD_TYPE.typename
  is '类别名称';
comment on column BBTY.T_GOOD_TYPE.partypeid
  is '父类主键';
comment on column BBTY.T_GOOD_TYPE.status
  is '状态,0-停用,1-启用';
comment on column BBTY.T_GOOD_TYPE.remark
  is '备注';
comment on column BBTY.T_GOOD_TYPE.isleaf
  is '是否有子节点,1-是,0-否';
alter table BBTY.T_GOOD_TYPE
  add constraint PK_GOOD_TYPE primary key (TYPEID)
  using index 
  tablespace BBTYIDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_ROLE
prompt =====================
prompt
create table BBTY.T_ROLE
(
  roleid   VARCHAR2(30) not null,
  rolename VARCHAR2(255),
  status   VARCHAR2(1),
  remark   VARCHAR2(255)
)
tablespace BBTY
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table BBTY.T_ROLE
  is '角色表';
comment on column BBTY.T_ROLE.roleid
  is '角色ID';
comment on column BBTY.T_ROLE.rolename
  is '角色名称';
comment on column BBTY.T_ROLE.status
  is '角色状态,（0-停用，1-启用）';
comment on column BBTY.T_ROLE.remark
  is '角色备注';
alter table BBTY.T_ROLE
  add constraint PK_ROLE primary key (ROLEID)
  using index 
  tablespace BBTYIDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_USER
prompt =====================
prompt
create table BBTY.T_USER
(
  empid       NUMBER(10) not null,
  userid      VARCHAR2(30),
  username    VARCHAR2(50),
  gender      VARCHAR2(1),
  birthdate   VARCHAR2(8),
  mobileno    VARCHAR2(11),
  htel        VARCHAR2(12),
  haddress    VARCHAR2(200),
  createtime  VARCHAR2(14),
  lastupttime VARCHAR2(14),
  remark      VARCHAR2(255)
)
tablespace BBTY
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table BBTY.T_USER
  is '员工表';
comment on column BBTY.T_USER.empid
  is '员工号';
comment on column BBTY.T_USER.userid
  is '员工登录名';
comment on column BBTY.T_USER.username
  is '员工姓名';
comment on column BBTY.T_USER.gender
  is '性别,0-女,1-男,2-保密';
comment on column BBTY.T_USER.birthdate
  is '出生日期,格式YYYYMMDD';
comment on column BBTY.T_USER.mobileno
  is '手机号码,11位';
comment on column BBTY.T_USER.htel
  is '家庭电话,区号+号码';
comment on column BBTY.T_USER.haddress
  is '家庭地址';
comment on column BBTY.T_USER.createtime
  is '创建时间,格式YYYYMMDDHHMMSS';
comment on column BBTY.T_USER.lastupttime
  is '最近更新日期,格式YYYYMMDDHHMMSS';
comment on column BBTY.T_USER.remark
  is '员工备注';
alter table BBTY.T_USER
  add constraint PK_USER primary key (EMPID)
  using index 
  tablespace BBTYIDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_USER_OPER
prompt ==========================
prompt
create table BBTY.T_USER_OPER
(
  userid      VARCHAR2(30) not null,
  password    VARCHAR2(100) not null,
  status      VARCHAR2(1) not null,
  lastlogin   VARCHAR2(14),
  lastupttime VARCHAR2(14),
  uptempid    NUMBER(10)
)
tablespace BBTY
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table BBTY.T_USER_OPER
  is '操作员表';
comment on column BBTY.T_USER_OPER.userid
  is '员工登录名';
comment on column BBTY.T_USER_OPER.password
  is '密码';
comment on column BBTY.T_USER_OPER.status
  is '操作员状态,（0-停用，1-启用）';
comment on column BBTY.T_USER_OPER.lastlogin
  is '最近登录时间,格式YYYYMMDDHHMMSS';
comment on column BBTY.T_USER_OPER.lastupttime
  is '最近更新日期,格式YYYYMMDDHHMMSS';
comment on column BBTY.T_USER_OPER.uptempid
  is '修改人员';
alter table BBTY.T_USER_OPER
  add constraint PK_USER_OPER primary key (USERID)
  using index 
  tablespace BBTYIDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_USER_ROLE
prompt ==========================
prompt
create table BBTY.T_USER_ROLE
(
  empid  NUMBER(10) not null,
  roleid VARCHAR2(30) not null
)
tablespace BBTY
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table BBTY.T_USER_ROLE
  is '员工角色关系表';
comment on column BBTY.T_USER_ROLE.empid
  is '员工号';
comment on column BBTY.T_USER_ROLE.roleid
  is '角色ID';
alter table BBTY.T_USER_ROLE
  add constraint PK_USER_ROLE primary key (EMPID, ROLEID)
  using index 
  tablespace BBTYIDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence SEQ_T_GOOD_INFO
prompt =================================
prompt
create sequence BBTY.SEQ_T_GOOD_INFO
minvalue 1
maxvalue 9999999999999999999999999999
start with 81
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_GOOD_METER
prompt ==================================
prompt
create sequence BBTY.SEQ_T_GOOD_METER
minvalue 1
maxvalue 9999999999999999999999999999
start with 68
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_GOOD_REP
prompt ================================
prompt
create sequence BBTY.SEQ_T_GOOD_REP
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_GOOD_REP_WATER
prompt ======================================
prompt
create sequence BBTY.SEQ_T_GOOD_REP_WATER
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_GOOD_TYPE
prompt =================================
prompt
create sequence BBTY.SEQ_T_GOOD_TYPE
minvalue 1
maxvalue 9999999999999999999999999999
start with 64
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_USER
prompt ============================
prompt
create sequence BBTY.SEQ_T_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 72
increment by 1
cache 20;


spool off
