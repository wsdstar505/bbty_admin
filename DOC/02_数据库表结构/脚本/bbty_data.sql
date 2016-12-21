prompt PL/SQL Developer import file
prompt Created on 2016年12月21日 by 翁仕达
set feedback off
set define off
prompt Disabling triggers for T_ROLE...
alter table T_ROLE disable all triggers;
prompt Disabling triggers for T_USER...
alter table T_USER disable all triggers;
prompt Disabling triggers for T_USER_ROLE...
alter table T_USER_ROLE disable all triggers;
prompt Deleting T_USER_ROLE...
delete from T_USER_ROLE;
commit;
prompt Deleting T_USER...
delete from T_USER;
commit;
prompt Deleting T_ROLE...
delete from T_ROLE;
commit;
prompt Loading T_ROLE...
insert into T_ROLE (roleid, rolename)
values ('admin', '超级管理员');
insert into T_ROLE (roleid, rolename)
values ('normal', '普通员工');
insert into T_ROLE (roleid, rolename)
values ('admin1', 'sdfsdf');
insert into T_ROLE (roleid, rolename)
values ('admin2', 'fsfsdfsdfsd');
commit;
prompt 4 records loaded
prompt Loading T_USER...
insert into T_USER (empid, username, password)
values (1, 'wsd', '000000');
insert into T_USER (empid, username, password)
values (2, 'sysadmin', '000000');
commit;
prompt 2 records loaded
prompt Loading T_USER_ROLE...
insert into T_USER_ROLE (empid, roleid)
values (1, 'normal');
insert into T_USER_ROLE (empid, roleid)
values (2, 'admin');
insert into T_USER_ROLE (empid, roleid)
values (1, 'admin');
commit;
prompt 3 records loaded
prompt Enabling triggers for T_ROLE...
alter table T_ROLE enable all triggers;
prompt Enabling triggers for T_USER...
alter table T_USER enable all triggers;
prompt Enabling triggers for T_USER_ROLE...
alter table T_USER_ROLE enable all triggers;
set feedback on
set define on
prompt Done.
