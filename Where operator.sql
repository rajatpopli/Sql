create database college;
use college;
create table student(
Name varchar(50) not null,
Id int not null unique,
age int not null check (age>=18),
gender varchar(1),
phone int not null unique,
city varchar(50) not null default "haryana");
insert into student(Name,Id,age,gender,phone,city)
values("rajat",1,25,"m",889556565,"haryana");
insert into student(Name,Id,age,gender,phone,city)
values("rishu",2,23,"m",8896565,"haryana");
insert into student(Name,Id,age,gender,phone,city)
values("abhi",3,22,"m",88456565,"haryana");
insert into student(Name,Id,age,gender,phone)
values("ramu",4,26,"m",880556565);
insert into student(Name,Id,age,gender,phone,city)
values("ram",5,26,"m",88056565,"agra");
insert into student(Name,Id,age,gender,phone,city)
values("rum",6,26,"m",8805565,"bhopal");

alter table student
add fees int;

alter table student
drop column fees;

alter table student
modify phone varchar(50);

alter table student
add email varchar(50) unique;

alter table student
change email email_id varchar(50);

alter table student
rename stdnt;

alter table stdnt
change column Name stdnt_name varchar(50);

select * from stdnt where age=25;
select*from stdnt where age >18 or age <27;
select * from stdnt where age <30;
select*from stdnt where age >18 and age <26;
select*from stdnt where age >18 and age <27;
select stdnt_name from stdnt where gender="m";
select*from stdnt where age >20;
select * from stdnt where city="agra";
select * from stdnt where city !="agra";
select*from stdnt where age=25 and city="haryana";
select stdnt_name from stdnt where age=25 and city="haryana";
select stdnt_name from stdnt where age=15 or city="haryana";
select stdnt_name from stdnt where age=15 and city="haryana";
select * from stdnt where not (city="bhopal" or city="agra");
select * from stdnt where city!="bhopal" and city!="agra";
select * from stdnt where gender="m" and (city="bhopal" or city="agra");
select * from stdnt where city!="haryana" and city!="bhopal";

update stdnt set age=(100+1) where id=3;

select * from stdnt where age in (25);

update stdnt set age=18 where id in(1,4,5);

use college;

select * from stdnt where age between 18 and 25;

select * from stdnt where age not between 18 and 25;

select * from stdnt where id between 2 and 5;

select * from stdnt where stdnt_name between "a" and "t";

delete from stdnt where id=1;

delete from stdnt where age>20;

set sql_safe_updates=0;

select * from stdnt where stdnt_name like "r%";

select * from stdnt where stdnt_Name like "%at%";student
