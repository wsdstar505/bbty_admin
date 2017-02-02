------------------------------------------
-- Export file for user BBTY            --
-- Created by ���˴� on 2017/2/2, 12:12:04 --
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
  is '��Ʒ��Ϣ��';
comment on column BBTY.T_GOOD_INFO.infoid
  is '��Ʒ����';
comment on column BBTY.T_GOOD_INFO.typeid
  is '��Ʒ���';
comment on column BBTY.T_GOOD_INFO.infocode
  is '��Ʒ���';
comment on column BBTY.T_GOOD_INFO.infoname
  is '��Ʒ����';
comment on column BBTY.T_GOOD_INFO.marker
  is '������';
comment on column BBTY.T_GOOD_INFO.markaddress
  is '��ַ';
comment on column BBTY.T_GOOD_INFO.website
  is '��վ';
comment on column BBTY.T_GOOD_INFO.contact
  is '��ϵ��ʽ';
comment on column BBTY.T_GOOD_INFO.fax
  is '����';
comment on column BBTY.T_GOOD_INFO.zipcode
  is '�ʱ�';
comment on column BBTY.T_GOOD_INFO.status
  is '��Ʒ״̬,0-ͣ�ã�1-����';
comment on column BBTY.T_GOOD_INFO.remark
  is '��ע';
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
  is '��Ʒ������λ���ñ�';
comment on column BBTY.T_GOOD_METER.meterid
  is '������λ����';
comment on column BBTY.T_GOOD_METER.metername
  is '������λ����';
comment on column BBTY.T_GOOD_METER.metercode
  is '������λ����';
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
  is '��Ʒ����';
comment on column BBTY.T_GOOD_REP.repid
  is '�������';
comment on column BBTY.T_GOOD_REP.infoid
  is '��Ʒ����';
comment on column BBTY.T_GOOD_REP.pici
  is '����';
comment on column BBTY.T_GOOD_REP.cbp
  is '�ɱ��۸�';
comment on column BBTY.T_GOOD_REP.pfp
  is '�����۸�';
comment on column BBTY.T_GOOD_REP.sczdp
  is '�г�ָ���۸�';
comment on column BBTY.T_GOOD_REP.xsp
  is '���ۼ۸�';
comment on column BBTY.T_GOOD_REP.repnum
  is '��Ʒ�������';
comment on column BBTY.T_GOOD_REP.repdate
  is '���ʱ��';
comment on column BBTY.T_GOOD_REP.repuptdate
  is '��������޸�ʱ��';
comment on column BBTY.T_GOOD_REP.repempid
  is '���Ա';
comment on column BBTY.T_GOOD_REP.meterid
  is '������λ����';

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
  is '���䶯��ˮ��';
comment on column BBTY.T_GOOD_REP_WATER.waterid
  is '��ˮ����';
comment on column BBTY.T_GOOD_REP_WATER.repid
  is '�������';
comment on column BBTY.T_GOOD_REP_WATER.pici
  is '����';
comment on column BBTY.T_GOOD_REP_WATER.cbp
  is '�ɱ��۸�';
comment on column BBTY.T_GOOD_REP_WATER.pfp
  is '�����۸�';
comment on column BBTY.T_GOOD_REP_WATER.sczdp
  is '�г�ָ���۸�';
comment on column BBTY.T_GOOD_REP_WATER.xsp
  is '���ۼ۸�';
comment on column BBTY.T_GOOD_REP_WATER.repnum
  is '��洦������';
comment on column BBTY.T_GOOD_REP_WATER.watertype
  is '��������� 0-�������,1-����޸�,2-���ɾ��,3-�ɹ�ȫ���˻�,4-�ɹ������˻�';
comment on column BBTY.T_GOOD_REP_WATER.repuptdate
  is '����޸�ʱ�� ��ʽYYYYMMDDHHMMSS';
comment on column BBTY.T_GOOD_REP_WATER.repuptempid
  is '����޸���Ա';
comment on column BBTY.T_GOOD_REP_WATER.infoid
  is '��Ʒ����';
comment on column BBTY.T_GOOD_REP_WATER.meterid
  is '������λ����';

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
  is '��Ʒ����';
comment on column BBTY.T_GOOD_TYPE.typeid
  is '����';
comment on column BBTY.T_GOOD_TYPE.typecode
  is '������';
comment on column BBTY.T_GOOD_TYPE.typename
  is '�������';
comment on column BBTY.T_GOOD_TYPE.partypeid
  is '��������';
comment on column BBTY.T_GOOD_TYPE.status
  is '״̬,0-ͣ��,1-����';
comment on column BBTY.T_GOOD_TYPE.remark
  is '��ע';
comment on column BBTY.T_GOOD_TYPE.isleaf
  is '�Ƿ����ӽڵ�,1-��,0-��';
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
