-------------------------------------------
-- Export file for user BBTY             --
-- Created by ���˴� on 2016/12/24, 9:11:09 --
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
  is '��ɫ��';
comment on column BBTY.T_ROLE.roleid
  is '��ɫID';
comment on column BBTY.T_ROLE.rolename
  is '��ɫ����';
comment on column BBTY.T_ROLE.status
  is '��ɫ״̬,��0-ͣ�ã�1-���ã�';
comment on column BBTY.T_ROLE.remark
  is '��ɫ��ע';
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
  is 'Ա����';
comment on column BBTY.T_USER.empid
  is 'Ա����';
comment on column BBTY.T_USER.userid
  is 'Ա����¼��';
comment on column BBTY.T_USER.username
  is 'Ա������';
comment on column BBTY.T_USER.gender
  is '�Ա�,0-Ů,1-��,2-����';
comment on column BBTY.T_USER.birthdate
  is '��������,��ʽYYYYMMDD';
comment on column BBTY.T_USER.mobileno
  is '�ֻ�����,11λ';
comment on column BBTY.T_USER.htel
  is '��ͥ�绰,����+����';
comment on column BBTY.T_USER.haddress
  is '��ͥ��ַ';
comment on column BBTY.T_USER.createtime
  is '����ʱ��,��ʽYYYYMMDDHHMMSS';
comment on column BBTY.T_USER.lastupttime
  is '�����������,��ʽYYYYMMDDHHMMSS';
comment on column BBTY.T_USER.remark
  is 'Ա����ע';
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
  is '����Ա��';
comment on column BBTY.T_USER_OPER.userid
  is 'Ա����¼��';
comment on column BBTY.T_USER_OPER.password
  is '����';
comment on column BBTY.T_USER_OPER.status
  is '����Ա״̬,��0-ͣ�ã�1-���ã�';
comment on column BBTY.T_USER_OPER.lastlogin
  is '�����¼ʱ��,��ʽYYYYMMDDHHMMSS';
comment on column BBTY.T_USER_OPER.lastupttime
  is '�����������,��ʽYYYYMMDDHHMMSS';
comment on column BBTY.T_USER_OPER.uptempid
  is '�޸���Ա';
comment on column BBTY.T_USER_OPER.empid
  is 'Ա����';
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
  is 'Ա����ɫ��ϵ��';
comment on column BBTY.T_USER_ROLE.empid
  is 'Ա����';
comment on column BBTY.T_USER_ROLE.roleid
  is '��ɫID';
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
