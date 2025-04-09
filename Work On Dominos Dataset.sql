Create Database Dominos;
use dominos;

Create Table Orders(
Order_id int not null,
Order_Date date,
Order_time time,
primary key(Order_id));

Create Table Orders_Details(
Order_Details_id int not null,
Order_id int not null,
Pizza_id text not null,
Quantity int,
primary key(Order_Details_id));

/*Retrieve the total number of order placed*/
SELECT 
    COUNT(Order_id) AS total_orders
FROM
    Orders; 

-- Calculate the total revenue generate from pizza sale.
SELECT 
    ROUND(SUM(orders_details.Quantity * pizzas.price),
            2) as total_sale
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.Pizza_id;
    
  -- Identify the highest pizzz price ..
  
  SELECT 
    name, price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1; 

-- Identify the most common pizza orderd
SELECT 
    COUNT(order_details_id), size
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizzas.size
ORDER BY COUNT(order_details_id) DESC ;

-- list the top 5 most orderd pizza
-- type along with their quantity.

select name,sum(quantity)
from pizza_types
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id=pizzas.pizza_id
group by name
order by sum(quantity) desc limit 5;

--  Join the necesarry table to find the total
-- quantity of each pizza category orderd .
select category,sum(quantity)
from pizza_types
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id=pizzas.pizza_id
group by category
order by sum(quantity) desc;

/*determine the distribution of order by hour of the day*/
SELECT 
    HOUR(Order_time), COUNT(Order_id)
FROM
    orders
GROUP BY HOUR(order_time); 

/* join relevent tables to find the category 
wise distribution of pizza*/
SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category; 


-- group the order by date and calculate the averege number
-- of pizza ordered per day

SELECT 
    ROUND(AVG(quantity), 0)
FROM
    (SELECT 
        orders.order_date, SUM(orders_details.quantity) AS quantity
    FROM
        orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date) AS order_quantity;

--  determine the top 3 mos orderd pizza type base on revenue.

SELECT 
    pizza_types.name,
    SUM(orders_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;








 
  

