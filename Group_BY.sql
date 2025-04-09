create database company3;
use company3;
create table Employee(
 emp_id int primary key,
 First_name varchar(50),
 Last_name varchar(50),
 department varchar(50),
 salary int,
 hire_date date
);

insert into Employee(emp_id, First_name, Last_name, department, salary, hire_date)
values(1, "John", "Doc", "IT", 60000.00, "2019-01-10"),
(2, "Jane", "Simth", "HR", 55000.00, "2018-03-05"),
(3, "Emly", "Jones", "IT", 62000.00, "2020-07-23"),
(4, "Michael", "Brown", "Finance", 70000.00, "2016-05-14"),
(5, "Sarah", "Davis", "Finance", 69000.00, "2017-11-18"),
(6, "David", "Johnson", "HR", 48000.00, "2021-09-10");

/* Find the average salary of employee in each department */
select department, avg(salary) 
from Employee
group by department;

/* Find the total number of employee hire after 2019 */
select hire_date
from Employee
group by hire_date
having hire_date > "2019-01-10";

/* List the department and the total salary of all employee in each department order by the total salary */
select sum(salary) from Employee;

select department, sum(salary)
from Employee
group by department
order by sum(salary) asc;

select department, sum(salary)
from Employee
group by department
order by department asc;

/* Find the highest salary in Finance department */ 
select emp_id, department, sum(salary)
from Employee
group by emp_id
having emp_id = 4;

select salary, department from Employee where emp_id = 4;


/* Get the top 3 highest paid employee */
select salary from Employee order by salary desc limit 3;

select salary 
from Employee
group by salary
order by salary desc limit 3;


select department, min(salary)
from Employee
group by department;

select min(salary) from Employee;


/* Display the total number of employee in each department order by  the number of employee */

select department, count(emp_id)
from Employee
group by department
order by department asc;

select count(emp_id) from Employee;

/* Find the average salary of employee who hired before 2020 */
select avg(salary) from Employee where hire_date < "2020-07-23";

select * from Employee where hire_date < "2020-07-23";


/* List the name of employee in the IT department order by hire date with the most recently hired employee first */
select department, first_name from Employee where emp_id >1 order by hire_date asc;

select department, count(emp_id)
from Employee
group by department
order by department asc;


/* Find the sum of salary for all employee hire after January 1, 2019 order by salary */
select hire_date, sum(salary)
from Employee
group by hire_date
having hire_date > "2019-01-10"
order by sum(salary) asc;


/* Get the employee with the lowest salary in the HR department */
select emp_id, sum(Salary)
from Employee 
group by emp_id
order by emp_id desc limit 1;


/* Find the total salary paid to employee in each department but limit the result to the 2 highest paying department */
select department, sum(salary)
from Employee
group by department
order by department desc limit 2;



/* List all employee hired after 2018 order by salary and show only first 4 employee */
select emp_id, salary from Employee where hire_date > "2018-03-05" order by salary desc;



/* Find the highest salary in the IT department but limit in the result to top 1 result */
select department, salary from Employee where emp_id in  (1, 3) order by salary asc limit 1;

select emp_id, department, sum(salary)
from Employee
group by emp_id
having emp_id in (1, 3)
order by emp_id desc limit 1;


/* Get the average salary of employee in each department and list only department with average salary greater than 60000 */
select department, avg(salary)
from Employee
group by department
having avg(salary) > 60000;



