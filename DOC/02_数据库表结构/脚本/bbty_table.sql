-------------------------------------------
-- Export file for user BBTY             --
-- Created by 翁仕达 on 2016/12/24, 9:11:09 --
-------------------------------------------

set define off
spool bbty_table.log

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
  lastlogin   VARCHAR2(14) not null,
  lastupttime VARCHAR2(14) not null,
  uptempid    NUMBER(10) not null,
  empid       NUMBER(10) not null
)
tablespace BBTY
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
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
comment on column BBTY.T_USER_OPER.empid
  is '员工号';
alter table BBTY.T_USER_OPER
  add constraint PK_USER_OPER primary key (USERID)
  using index 
  tablespace BBTYIDX
  pctfree 10
  initrans 2
  maxtrans 255;

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


spool off
