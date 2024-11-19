create database google;
use google;
create table e_info(
emp_id int,
first_name varchar (50),
last_name varchar(50),
department varchar (50),
salary int,
hire_date date
);
insert into e_info(emp_id,first_name,last_name,department,salary,hire_date)
values(1,"john","doe","it",60000,"2019-01-10"),
(2,"jane","smith","hr",55000,"2018-03-05"),
(3,"emily","jones","it",62000,"2020-07-23"),
(4,"michael","brown","finance",70000,"2016-05-14"),
(5,"sarah","davis","finance",69000,"2017-11-18"),
(6,"david","johnson","hr",48000,"2021-09-10");


/*Find the average salary of employees in each department*/ 
select department,avg(salary)as "averege salary" from e_info group by department;

/*Find the total number of employees hired after 2019*/
select hire_date 
from e_info
group by hire_date
having hire_date >"2019-01-10";

/*List the departments and the total salary of all employees in each department, ordered by the total salary*/
select department,sum(salary) from e_info group by department order by sum(salary)asc;

/*Find the highest salary in the Finance department*/
select department,max(salary)from e_info where department="finance";

/*Get the top 3 highest-paid employees*/
select first_name,max(salary)from e_info group by first_name order by max(salary)desc limit 3;

/*Find the department with the minimum average salary*/  
select department,avg(salary) from e_info group by department order by avg(salary)asc limit 1;

/*Display the total number of employees in each department ordered by the number of employees*/
select department,count(emp_id)as"total number of employee" from e_info group by department;

/*Find the average salary of employees who were hired before 2020*/ 
select avg(salary)from e_info where hire_date < "2020-07-23";

 /*List the names of employees in the IT department ordered by hire date, with the most recently hired employees first*/
select concat(first_name," ",last_name),hire_date from e_info where department="it" order by hire_date desc;

/*Find the sum of salaries for all employees hired after January 1, 2019, ordered by salary*/
select hire_date,sum(salary)
from e_info
group by hire_date
having hire_date > "2019-01-01"
order by sum(salary)asc;

 /*Get the employee with the lowest salary in the HR department*/ 
select min(salary)from e_info where department="hr";

/*Find the total salary paid to employees in each department, but limit the result to the top 2 highest-paying departments*/
select department,sum(salary)
from e_info
group by department
order by sum(salary)desc limit 2 ;

/*List all employees hired after 2018, ordered by salary, and show only the first 4 employees*/
select concat(first_name," ",last_name),salary from e_info where hire_date > "2018-03-05" order by salary asc;

/*Find the highest salary in the IT department, but limit the results to the top 1 result*/
select max(salary),department
from e_info
where department="hr"
order by max(salary)asc limit 1;

/*Get the average salary of employees in each department and list only departments with an average salary greater than $60,000*/
select department, avg(salary)
from e_info
group by department
having avg(salary)>60000;