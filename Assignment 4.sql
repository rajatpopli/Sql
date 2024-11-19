create database companyA;
use companyA;

create table sales(
 sales_id int primary key,
 product_id int,
 customer_id int,
 sales_date date,
 quantity int,
 unit_price int,
 region varchar(50)
);

insert into sales(sales_id, product_id, customer_id, sales_date, quantity, unit_price, region)
values(1, 101, 1001, "2024-01-05", 5, 200, "North"),
(2, 102, 1002, "2024-01-10", 10, 150, "East" ),
(3, 103, 1003, "2024-02-15", 2, 300, "North"),
(4, 104, 1004, "2024-02-15", 7, 250, "West"),
(5, 101, 1004, "2024-03-05", 1, 200, "East");

select* from sales;
/* write a query to calculate the total sales (quantity* unit price) for each product */

select sales_id, sum(quantity*unit_price)
from sales
group by  sales_id;

/* write a query to find the total number of product sold in each region */

select region, count(quantity)
from sales
group by region;

/* write a query to get the average sales amount per product */

select sales_id, avg(unit_price/quantity)
from sales
group by sales_id;

/* find the region where total sales are more than 3000 */
select region, sum(quantity*unit_price)
from sales
group by region
having sum(quantity * unit_price) > 3000;

/* write a query to get the maximum quantity sold for each product */
select sales_id, max(quantity)
from sales
group by sales_id;

/* write a query to calculate the average quantity of product sold per region */
select region, avg(quantity)
from sales
group by region;

/* Find the product ID that have generated total sales amount more than 1000 */
select product_id, sum(quantity * unit_price)
from sales
group by product_id
having sum(quantity * unit_price) > 1000;

/* Write a query to get the total number of sales row made for each customer */
select customer_id, sum(quantity * unit_price)
from sales 
group by customer_id;

/* write a query to find the sum of the total sales for each customer in each region */
select sales_id, customer_id,region, sum(quantity * unit_price)
from sales 
group by sales_id, customer_id, region;

/* write a query to calculate the total sales for each month */
select sales_date, sum(quantity * unit_price)
from sales
group by sales_date;

/* Find the region where the average unit price is more than  200 */ 
select region, avg(unit_price/quantity)
from sales
group by region
having avg(unit_price/quantity) > 200;

/* write a query to get the minimum and maximum quantity sold per region */
select region, sum(quantity) , max(quantity), min(quantity)
from sales
group by region
order by region asc;

/* Find  the customer who have made more than 2 puchase  */
select customer_id, quantity from sales where quantity > 2;

/* write a query to find the total sales for each product and filter only those product where total sales exceed 1500 */

select product_id, sum(quantity * unit_price)
from sales
group by product_id
having sum(quantity * unit_price) > 1500;



