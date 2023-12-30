use ai__arun;
show tables;
select *from arun_data;
insert into arun_data(s_no,name,phone_no,age,location) values (2,'raghul',9876543210,21,'trichy');
insert into arun_data(s_no,name,phone_no,age,location)  values(3,'abdul',9087654321,24,'trichy');
insert into arun_data(s_no,name,phone_no,age,location) values(4,'hari',9087654329,22,'trichy'), (5,'vinu',9087654320,24,'trichy');
alter table arun_data add column address varchar (200);
update arun_data set address ='3/4 thirupur,thirupur (po),kulathur (tk),pudukkttai 02' where s_no= 1;
delimiter //
create procedure a()
begin
select * from arun_data;
end
delimiter //

update arun_data set name =
case s_no
when 1 then 'pooja'
when 2 then 'roja'
when 3 then 'raja'
when 4 then 'gaaja'
when 5 then 'saroja'
end;

call a();

