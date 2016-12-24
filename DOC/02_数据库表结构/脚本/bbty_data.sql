prompt PL/SQL Developer import file
prompt Created on 2016年12月24日 by 翁仕达
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
values ('admin', '超级管理员', '1', null);
insert into T_ROLE (roleid, rolename, status, remark)
values ('normal', '普通员工', '1', null);
insert into T_ROLE (roleid, rolename, status, remark)
values ('test01', '测试角色1号', '1', '测试用的');
insert into T_ROLE (roleid, rolename, status, remark)
values ('test02', '测试角色2号', '0', '停用了');
insert into T_ROLE (roleid, rolename, status, remark)
values ('test03', '测试角色3号', '0', '哈哈哈');
commit;
prompt 5 records loaded
prompt Loading T_USER...
prompt Table is empty
prompt Loading T_USER_OPER...
prompt Table is empty
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
