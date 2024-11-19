Create Database Assignment;
use Assignment;

create table employee(
  id int primary key Auto_increment,
  name varchar(50),
  position varchar(50),
  salary float(50),
  date_of_join date
);

insert into employee(id, name, position, salary, date_of_join)
values(1, "John Doe", "Manager", 55000.00, "2020-01-15"),
(2, "Jane Smith", "Developer", 48000.00, "2019-07-10"),
(3, "Alica Johnson", "Designer", 45000.00, "2021-03-22"),
(4, "Bob Brown", "Developer", 50000.00, "2018-11-01");

/* write query to retrieve all employee who are are developer */

select * from employee where position = "Developer";

select position, name from employee where position = "Developer";

/* write query to update the salary of Alice Johnson to 46000.00 */
update employee set salary = 46000.00 where name = "Alica Johnson";
update employee set salary = 46000.00 where id = 3;

select  * from employee;

/* write a query  to delete the employee record of bob brown */

delete  from  employee where id  = 4;

/* write query to find the employee who have salary greater than 48000.00 */

select * from employee where salary > 48000.00;

/* write query to add new column email to the employee table */

alter table employee
add column email varchar(50);

/* write a query to update email for john Doe to john.doe@company.com */
update employee set email = "john.doe@company.com" where id = 1;

/* write a query to retrieve only the name and salary of all employee */

select name, salary from employee;

/* write query to count the number of employee who have joined after janauary 1, 2020 */

select count(date_of_join) from employee where date_of_join > 2020-01-1;
select count(*) from employee where date_of_join > 2020-01-1;


/* write a query to order by salary in descending order */
select * from employee order by salary desc;
select salary from employee order by salary desc;

/* write a query to drop the email column from the employee tables */

alter table employee
drop column email;

/* write a query to find the employee with highest salary */

select *  from employee order by salary desc limit 1;
select salary from employee order by salary desc limit 1; 
