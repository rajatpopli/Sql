create database library;
use library;
create table books
(id int primary key auto_increment,
title varchar(255),
author VARCHAR(100),
year int,
genre varchar(100)
);
insert into books(id,title,author,year,genre)
values(1,"the great gatsby","f.scott fitzgerald",1925,"fiction");

insert into books(id,title,author,year,genre)
values(2,"pride and prejudice","jane austen",1813,"romance");

insert into books(id,title,author,year,genre)
values(3,"to kill a mockingbird","harper lee",1960,"fiction");

insert into books(id,title,author,year,genre)
values(4,"1984","george orwell",1949,"dystopian");

insert into books(id,title,author,year,genre)
values(5,"moby dick","herman melville",1851,"adventure");

select * from books where title like"%t%";


select * from books where author like"%son";

select * from books where title like "%and%";

select * from books where title like "%bird";

use library;
select * from books where title regexp '^[A-Za-z]+[A-Za-z]+[A-Za-z]+$';

select * from books where title regexp "[0-9]";

select * from books where author regexp "a|j";

select * from books where genre regexp "^fiction|adventure$";

select * from books where title regexp "A-Z";

select * from books where year between 1800 and 1950;

select * from books where author regexp "^[A-Za-z]+[A-Za-z]+$";

select * from books where title regexp "^p[A-Za-z]*[A-Za-z]+$";

select * from books where title regexp '[!@#$%^&*()]';







select * from books;

