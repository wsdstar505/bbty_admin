--------------------------------------------
-- Export file for user BBTY              --
-- Created by 翁仕达 on 2016/12/21, 18:20:56 --
--------------------------------------------

set define off
spool bbrun_table.log

prompt
prompt Creating table T_ROLE
prompt =====================
prompt
create table BBTY.T_ROLE
(
  roleid   VARCHAR2(30) not null,
  rolename VARCHAR2(255)
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

prompt
prompt Creating table T_USER
prompt =====================
prompt
create table BBTY.T_USER
(
  empid    NUMBER(10) not null,
  username VARCHAR2(50),
  password VARCHAR2(255)
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
comment on column BBTY.T_USER.username
  is '员工姓名';
comment on column BBTY.T_USER.password
  is '密码';

prompt
prompt Creating table T_USER_ROLE
prompt ==========================
prompt
create table BBTY.T_USER_ROLE
(
  empid  NUMBER(10),
  roleid VARCHAR2(30)
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
comment on table BBTY.T_USER_ROLE
  is '员工角色关系表';
comment on column BBTY.T_USER_ROLE.empid
  is '员工号';
comment on column BBTY.T_USER_ROLE.roleid
  is '角色ID';


spool off
