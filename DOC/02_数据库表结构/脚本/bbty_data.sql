prompt PL/SQL Developer import file
prompt Created on 2016��12��25�� by wsdstar
set feedback off
set define off
prompt Disabling triggers for T_ROLE...
alter table T_ROLE disable all triggers;
prompt Disabling triggers for T_USER...
alter table T_USER disable all triggers;
prompt Disabling triggers for T_USER_OPER...
alter table T_USER_OPER disable all triggers;
prompt Disabling triggers for T_USER_ROLE...
alter table T_USER_ROLE disable all triggers;
prompt Deleting T_USER_ROLE...
delete from T_USER_ROLE;
commit;
prompt Deleting T_USER_OPER...
delete from T_USER_OPER;
commit;
prompt Deleting T_USER...
delete from T_USER;
commit;
prompt Deleting T_ROLE...
delete from T_ROLE;
commit;
prompt Loading T_ROLE...
insert into T_ROLE (roleid, rolename, status, remark)
values ('admin', '��������Ա', '1', null);
insert into T_ROLE (roleid, rolename, status, remark)
values ('normal', '��ͨԱ��', '1', null);
insert into T_ROLE (roleid, rolename, status, remark)
values ('test01', '���Խ�ɫ1��', '0', '�����õ�');
insert into T_ROLE (roleid, rolename, status, remark)
values ('test02', '���Խ�ɫ2��', '0', 'ͣ����');
insert into T_ROLE (roleid, rolename, status, remark)
values ('test03', '���Խ�ɫ3��', '0', '������');
commit;
prompt 5 records loaded
prompt Loading T_USER...
insert into T_USER (empid, userid, username, gender, birthdate, mobileno, htel, haddress, createtime, lastupttime, remark)
values (1, 'wsd', null, '1', null, null, null, null, null, null, null);
commit;
prompt 1 records loaded
prompt Loading T_USER_OPER...
insert into T_USER_OPER (userid, password, status, lastlogin, lastupttime, uptempid)
values ('wsd', '111', '1', null, null, null);
commit;
prompt 1 records loaded
prompt Loading T_USER_ROLE...
insert into T_USER_ROLE (empid, roleid)
values (1, 'admin');
insert into T_USER_ROLE (empid, roleid)
values (1, 'normal');
insert into T_USER_ROLE (empid, roleid)
values (2, 'admin');
commit;
prompt 3 records loaded
prompt Enabling triggers for T_ROLE...
alter table T_ROLE enable all triggers;
prompt Enabling triggers for T_USER...
alter table T_USER enable all triggers;
prompt Enabling triggers for T_USER_OPER...
alter table T_USER_OPER enable all triggers;
prompt Enabling triggers for T_USER_ROLE...
alter table T_USER_ROLE enable all triggers;
set feedback on
set define on
prompt Done.
