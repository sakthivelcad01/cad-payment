create database cad_payment;

use cad_payment;

drop table TC_User_Reg;
create table payment_User_Reg(
sno int not null,
first_name varchar(250),
mid_name varchar(250),
last_name varchar(250),
email varchar(250),
Phone_number long not null,
Address varchar(250),
country varchar(250) default 'India',
User_id int Primary Key,
Password varchar(250) default 'Password@123',
Confirm_password varchar(250) default 'Password@123'
);
select * from payment_User_Reg;

INSERT INTO payment_User_Reg(SNO,USER_ID,first_name,mid_name,last_name,Phone_number,ADDRESS,EMAIL)VALUES
(1,1001,'AARIF',NULL,'S',9025171297,'MADURAI','aarif01cad@gmail.com'),
(2,1002,'RAHMAN','A','ABDUL',9042116396,'TRICHY ','abdulrahmancad01@gmail.com'),
(3,1003,'ABINAYA',NULL,'J',8124568273,'SRIRANGAM','abinayakumarcad01@gmail.com'),
(4,1004,'AHAMED',NULL,'J',9659021407,'TRICHY','ahamedcad01@gmail.com'),
(5,1005,'ALEXANDAR',NULL,'A ',9360415014,'KEERANUR','alexandaracad01@gmail.com'),
(6,1006,'ANAND',NULL,'R',8489903993,'TRICHY','anandravichandrancad01@gmail.com'),
(7,1007,'ANJUKA',NULL,'P',6379944693,'TRICHY','anjukapugaz02@gmail.com'),
(8,1008,'ARAVIND',NULL,'K',8778624466,'TRICHY','aravind2k23cad01@gmail.com'),
(9,1009,'BASHEER','M','AHAMED',9514690405,'TRICHY','basheercad01@gmail.com'),
(10,1010,'CHANDRAN',NULL,'P',9361313775,'KARUR','chandrancad01@gmail.com'),
(11,1011,'DANIELRAJ',NULL,'A',9092838116,'THANJAVUR','danielrajcad01@gmail.com'),
(12,1012,'DINESH',NULL,'T',9629724889,'TRICHY','tdineshcad01@gmail.com'),
(13,1013,'VASANTHAN','DOMENIG','A',8220904749,'TRICHY','vasanthcad01@gmail.com'),
(14,1014,'GOPAL',NULL,'S',9361448297,'KARUR','gopalcad01@gmail.com'),
(15,1015,'HARSH',NULL,'A',9025664587,'TRICHY','harshcad01@gmail.com'),
(16,1016,'JAYAPRAVIN',NULL,'D',7094937902,'TRICHY','jayapravincad01@gmail.com'),
(17,1017,'JEMIMAH',NULL,'J',9489189043,'TRICHY','jemimahcad01@gmail.com'),
(18,1018,'MANIMOHANA',NULL,'S',9994987424,'TRICHY','Mohanacad01@gmail.com'),
(19,1019,'KIRUTHIGA',NULL,'R',7339220870,'TRICHY','kiruthigarcad01@gmail.com'),
(20,1020,'NANCY',NULL,'A',8428267221,'PUDUKKOTTAI','nancyacad01@gmail.com'),
(21,1021,'NATRAYAN',NULL,'M',8825684098,'TRICHY','natrayancad01@gmail.com'), 
(22,1022,'PAVITHRA',NULL,'K',9025862493,'TRICHY','pavithracad01@gmail.com'),
(23,1023,'PRABHAHARN',NULL,'M',9043792705,'TRICHY','prabhaharncad01@gmail.com'),
(24,1024,'RAMKI',NULL,'S',6383693933,'TRICHY','ramkisridharcad01@gmail.com'),
(25,1025,'SABIBULLA','AFRIDI','SAHITH',9042314497,'TRICHY','sahithcad01@gmail.com'),
(26,1026,'SAKTHIVEL',NULL,'S',9514605031,'PERAMBALUR','jerrycad01@gmail.com'),
(27,1027,'BALAKRISHNAN',NULL,'SANJAY',7708407173,'TRICHY','sanjayrbcad01@gmail.com'),
(28,1028,'KUMAR','S','SANTHOSH',9344560546,'TRICHY','santhoshcad01@gmail.com'),
(29,1029,'SARAN',NULL,'S',6380026784,'CUDDALORE','sarancad01@gmail.com'),
(30,1030,'SIRANJEEVI',NULL,'S',6383685553,'PERAMBALUR','siranjeevicad01@gmail.com'); 

alter table payment_user_reg
add column user_name varchar(250)
after last_name;

select * from payment_User_Reg;

create table payment_Usr_Login(
login_id int not null primary key auto_increment,
user_id int not null,
user_name varchar(250),
password varchar(250)
);
select * from payment_usr_login;
insert into payment_usr_login(password,user_id,user_name) select password,user_id,user_name from payment_user_Reg;

create table payment_tran_history(
sno int primary key auto_increment,
user_id int,
user_name varchar(256),
amount double,
reciept_id int,
reciepent_name varchar(250),
trans_date date,
trans_mode varchar(250)
);
show tables;
select * from payment_tran_history;
/*-----------------------------------------------------procedure for insert table---------------------------------------------------------------------*/
delimiter $$
create procedure inserttable(
in user_id int,
in user_name varchar(250),
in amount int,
in reciept_id int,
in reciepent_name varchar(250),
in trans_date date,
in trans_mode varchar(250)
)
begin
insert into payment_tran_history(user_id,user_name,amount,reciept_id,reciepent_name,trans_date,trans_mode)value (user_id,user_name,amount,reciept_id,reciepent_name,trans_date,trans_mode);
end $$
delimiter ;
call inserttable(1006,'@anand_06',989.90,1019,'kiruthika','2023-12-10','gpay');

drop procedure inserttable;

create table payment_account_details(
sno int not null,
account_number long not null,
name varchar(250),
email varchar(250),
Phone_number long not null,
branch varchar(250),
ifsc_code varchar(250)
);

/*--------------------------------------------------------procedure for update------------------------------------------------------------------------*/
delimiter $$
create procedure accountdetailsm(
in tablename varchar(250),
in columnname varchar(250),
in cvalue varchar(250),
in concolumnname varchar(250),
in mvalue varchar(250)
)		
begin

set @updatet = concat('update ',tablename,' set ',columnname,'=\'',cvalue,'\'',' where ',concolumnname,'=','\'',mvalue,'\'');
prepare stmt from @updatet;
execute stmt;
end $$
delimiter ;
call accountdetailsm('payment_account_details','branch','perambalur','name','aarif');
drop procedure accountdetailsm;
/*-----------------------------------------------end update procedure---------------------------------------------------------------------------------*/
show tables;
 /*---------------------------------------procedure for add column------------------------------------------------------------------------------------*/
delimiter $$

create procedure altertad(
in tablename varchar(250),
in clmname varchar(250),
in datatype varchar(250)
)
begin
set @crte = concat('alter table ',tablename,' add ',clmname,' ',datatype);
prepare smt from @crte;
execute smt;
end $$
delimiter ;
drop procedure alterad;

call altertad('payment_account_details','balance','long');
select * from payment_account_details;
/*---------------------------------------------end add column procedure-------------------------------------------------------------------------------*/

/*--------------------------------------------------------procedure for delete------------------------------------------------------------------------*/
delimiter $$

create procedure delt(
in tablename varchar(250),
in clmname varchar(250),
in clmval varchar(250)
)
begin
set @tablev = concat('delete from ',tablename,' where ',clmname,'=',clmval);
prepare tab from @tablev;
execute tab;
end $$
delimiter ;

call delt('payment_account_details','sno','1');                                                       

select * from payment_account_details;
/*---------------------------------------------------------end del procedure--------------------------------------------------------------------------*/

	