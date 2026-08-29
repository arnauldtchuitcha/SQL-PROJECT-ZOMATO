-- Creating tables
CREATE TABLE restaurants (
restaurant_id INT PRIMARY KEY,
retaurant_name VARCHAR (55),
city VARCHAR(15),
opening_hours VARCHAR(55)
);
ALTER TABLE restaurants
RENAME COLUMN Restaurant_name TO restaurant_name;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(25),
reg_date DATE
);

DROP TABLE IF EXISTS riders;
CREATE TABLE riders (
rider_id INT PRIMARY KEY,
rider_name VARCHAR(55),
sign_up DATE
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
restaurant_id INT,
order_item VARCHAR(55),
order_date DATE,
order_time TIME,
order_status VARCHAR(20),
total_amount FLOAT
);
-- adding fk constraint
ALTER TABLE orders
ADD CONSTRAINT fk_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

-- adding fk constraint
ALTER TABLE orders
ADD CONSTRAINT fk_restaurants
FOREIGN KEY (restaurant_id)
REFERENCES restaurants(restaurant_id);

DROP TABLE IF EXISTS deliveries;
CREATE TABLE deliveries (
delivery_id INT PRIMARY KEY,
order_id INT,
delivery_status VARCHAR(35),
delivery_time TIME,
rider_id INT
);

ALTER TABLE deliveries
ADD CONSTRAINT fk_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

ALTER TABLE deliveries
ADD CONSTRAINT fk_riders
FOREIGN KEY (rider_id)
REFERENCES riders(rider_id);

-- Insert Database
INSERT INTO customers (customer_id,customer_name,reg_date)
VALUES (1,'Arjun Mehta', '2023-03-10'), (2,'Priya Sharma', '2023-04-15'),(3,'Vikram Singh','2023-05-01'),(4,'Ritu Patel', '2023-06-05'),
(5,'Aman Gupta','2023-07-12'),(6,'Sneha Desai','2023-08-23'), (7,'Rahul Verma','2023-09-05'),(8,'Neha Joshi','2023-10-10'),(9,'Karan Kapoor','2023-11-15'),
(10,'Divya Nair','2023-12-20');

INSERT INTO restaurants (restaurant_id,restaurant_name,city,opening_hours)
VALUES (1,'The Bombay Canteen', 'Mumbai','10:00 AM-11:00 PM'), (2,'Leopold Cafe', 'Mumbai','9:00 AM-12:00 AM'),(3,'Bademiya', 'Mumbai','6:00 PM-03:00 AM'),(4,'Ziya', 'Mumbai','12:00 PM-11:00 PM'),
(5,'Gajalee', 'Mumbai','11:00 AM-11:00 PM'),(6,'Indian Accent', 'Delhi','12:00 PM-2:30 PM'), (7,'Karim Aos', 'Delhi','09:00 AM-12:00 AM'),(8,'Bukhara', 'Delhi','12:30 PM-2:45 PM'),(9,'Motin Mahal', 'Delhi','12:00 PM-11:30 PM'),
(10,'SodaBottleOpenerWala', 'Delhi','11:00 AM-11:30 PM');

INSERT INTO orders (order_id,customer_id,restaurant_id,order_item,order_date,order_time,order_status,total_amount)
VALUES (1,9,5,'Pasta Alfredo','2023-08-13','23:59:58', 'Completed', 314),(2,5,8,'Chicken Birya','2023-03-03','23:59:58', 'Completed',411),(3,7,2,'Samosa','2023-11-28','23:59:58', 'Completed',200),(4,1,6,'Pasta Alfredo','2023-09-04','23:59:58', 'Completed',422),
(5,1,8,'arnauld pasta','2023-09-06','23:59:58', 'Completed',211),(6,5,1,'Chicken Birya','2023-03-03','23:59:58', 'Completed',533), (7,5,4,'Masala Inside','2023-11-23','23:59:58', 'Completed',122),(8,1,5,'Pasta Alfredo','2023-09-04','23:59:58', 'Not Completed',342),
(9,1,5,'Pasta Alfredo','2023-09-04','23:59:58', 'Not Completed',342),(10,1,10,'Pasta Alfredo','2023-09-04','23:59:58', 'Not Completed',342); 

UPDATE orders
SET order_time = '01:01:45'
WHERE order_id = 1;

UPDATE orders
SET order_time = '03:07:45'
WHERE order_id = 2;

UPDATE orders
SET order_time = '05:20:45'
WHERE order_id = 3;

UPDATE orders
SET order_time = '11:01:34'
WHERE order_id = 4;

UPDATE orders
SET order_time = '12:01:22'
WHERE order_id = 5;

UPDATE orders
SET order_time = '14:01:31'
WHERE order_id = 6;

UPDATE orders
SET order_time = '14:01:45'
WHERE order_id = 7;

UPDATE orders
SET order_time = '23:45:21'
WHERE order_id = 8;

UPDATE orders
SET order_time = '23:08:34'
WHERE order_id = 9;

UPDATE orders
SET order_time = '23:01:37'
WHERE order_id = 10;

INSERT INTO deliveries (delivery_id,order_id,delivery_status, delivery_time, rider_id)
VALUES (1,5,'Delivered','02:11:00',7), (2,9,'Not Delivered','03:11:00',4),(3,7,'Not Delivered','02:11:00',6),(4,9,'Delivered','08:11:00',6),
(5,3,'Delivered','07:11:00',7),(6,2,'Delivered','09:11:00',4), (7,7,'Delivered','01:42:00',9),(8,4,'Delivered','02:11:00',2),(9,3,'Delivered','03:21:00',8),
(10,5,'Not Delivered','07:11:00',4);

INSERT INTO riders (rider_id,rider_name,sign_up)
VALUES (1,'Ravi kumar', '2023-01-05'), (2,'Anil Singh', '2023-02-04'),(3,'Sunil yadav','2023-03-02'),(4,'Ramesh yanrh','2023-03-01'),
(5,'Aman Gupta','2023-07-13'),(6,'Amit Patern','2023-09-17'), (7,'Mahesh Gupi','2023-07-03'),(8,'Pankaj Sharm','2023-01-07'),(9,'Rohit Mehra','2023-12-04'),
(10,'Gopal Das','2023-09-14');

-- EDA

select * from customers;
select * from deliveries; 
select * from orders;
select * from restaurants;
select * from riders;

-- Handling null values
SELECT COUNT(*) FROM customers
WHERE customer_id IS NULL
	OR customer_name IS NULL
    OR reg_date IS NULL;
    
SELECT COUNT(*) FROM deliveries
WHERE order_id IS NULL
    OR delivery_status IS NULL
    OR delivery_time IS NULL
    OR rider_id IS NULL;
    
    SELECT COUNT(*) FROM orders
WHERE customer_id IS NULL
    OR restaurant_id IS NULL
    OR order_item IS NULL
    OR order_date IS NULL
    OR order_time IS NULL
    OR order_status IS NULL
    OR total_amount IS NULL;
    
   SELECT COUNT(*) FROM restaurants
WHERE restaurant_id IS NULL
	OR restaurant_name IS NULL
    OR city IS NULL
    OR opening_hours IS NULL;
    
    SELECT COUNT(*) FROM riders
WHERE rider_id IS NULL
	OR rider_name IS NULL
    OR sign_up IS NULL;

-- Analysis report
-- Q1 Write a query to find the top 5 most frequently ordered dishes by customer 'Arjun Mehta' in the last 3 year
-- join customers and orders
-- Filter for last 1 year 
-- Filter 'Arjun Metha'
-- Group by customer_id,order_item,cnt 
SELECT * FROM (SELECT c.customer_id,
       c.customer_name, 
       o.order_item as dishes,
        count(*) as Total_orders,
        dense_rank() OVER(ORDER BY COUNT(*)DESC) as ran
       FROM 
       customers c
       Join
       orders o
       on o.customer_id=c.customer_id
       WHERE o.order_date >= CURRENT_DATE-INTERVAL 3 Year
       AND c.customer_name= 'Arjun Mehta'
       GROUP BY 1,2,3
       ORDER BY 1,4 DESC) as t1
       where ran <=1;
       
       -- Q2 Popular Time Slots
	   -- Question : Identify the time slots during which the most orders are placed. Based on 2-hours intervals
       
       SELECT
          CASE
             WHEN EXTRACT(HOUR FROM order_time) BETWEEN 0 AND 1 THEN '00:00 - 02:00'
             WHEN EXTRACT(HOUR FROM order_time) BETWEEN 2 AND 3 THEN '02:00 - 04:00'
             WHEN EXTRACT(HOUR FROM order_time) BETWEEN 4 AND 5 THEN '04:00 - 06:00'
             WHEN EXTRACT(HOUR FROM order_time) BETWEEN 6 AND 7 THEN '06:00 - 08:00'
             WHEN EXTRACT(HOUR FROM order_time) BETWEEN 8 AND 9 THEN '08:00 - 10:00'
             WHEN EXTRACT(HOUR FROM order_time) BETWEEN 10 AND 11 THEN '10:00 - 12:00'
             WHEN EXTRACT(HOUR FROM order_time) BETWEEN 12 AND 13 THEN '12:00 - 14:00'
             WHEN EXTRACT(HOUR FROM order_time) BETWEEN 14 AND 15 THEN '14:00 - 16:00'
             WHEN EXTRACT(HOUR FROM order_time) BETWEEN 16 AND 17 THEN '16:00 - 18:00'
             WHEN EXTRACT(HOUR FROM order_time) BETWEEN 18 AND 19 THEN '18:00 - 20:00'
             WHEN EXTRACT(HOUR FROM order_time) BETWEEN 20 AND 21 THEN '20:00 - 22:00'
             WHEN EXTRACT(HOUR FROM order_time) BETWEEN 22 AND 23 THEN '22:00 - 00:00'
		END AS time_slot,
        COUNT(order_id) AS order_count
        FROM Orders
        GROUP BY time_slot
        ORDER BY order_count DESC;
        
        SELECT
             FLOOR(EXTRACT(HOUR FROM order_time)/2)*2 as start_time,
             FLOOR(EXTRACT(HOUR FROM order_time)/2)*2 + 2 as end_time,
             COUNT(*) as total_orders
		FROM orders
        GROUP BY 1,2
        ORDER BY 3 desc;
        
-- 3. Order Value Analysis
-- Question: Find the average order value per custom who has placed more than 2 orders
-- Return customer_name, and aov (average order value)

SELECT 
c.customer_name,
AVG(o.total_amount) as aov,
COUNT(order_id) as total_orders
FROM orders o
JOIN customers c
on c.customer_id= o.customer_id
GROUP BY 1
HAVING total_orders >= 2;


-- 4. High values customers 
-- Question : List the customer who have spend more than 500 in total on food orders
-- return customer_name and customer_id

SELECT 
c.customer_name,
c.customer_id,
sum(o.total_amount) as sov
FROM orders o
JOIN customers c
on c.customer_id= o.customer_id
GROUP BY 2
having sum(o.total_amount) >= 500;

-- 5. Orders without Delivery 
-- Question : Write a query to find orders that were placed but not deivered
-- Return each restaurant name, city and number of not delivered orders

SELECT
o.order_id,
r.restaurant_name,
r.city,
COUNT(o.order_id) as nndo
FROM  orders o
LEFT JOIN restaurants r
on r.restaurant_id= o.restaurant_id
LEFT JOIN deliveries d
on d.order_id=o.order_id
where d.delivery_id is NULL
GROUP BY 1;

-- 6.Restaurant ranking
-- Rank restaurant by their total revenue from the last year,including their name
-- total revenue, and rank within their city
-- Tables to use: Restaurantsand order

SELECT 
r.city,
r.restaurant_name,
SUM(o.total_amount) as total_revenue,
RANK() OVER(PARTITION BY r.city ORDER BY SUM(o.total_amount)DESC) as rankbycity,
dense_rank() OVER(ORDER BY SUM(o.total_amount)DESC) as rankbyrestaurant
FROM restaurants r
JOIN orders o
on o.restaurant_id=r.restaurant_id
WHERE o.order_date >= CURRENT_DATE-INTERVAL 3 Year
GROUP BY 1,2
order by 1,3 DESC;

-- Best ranking restaurant cy city
With ranking_table
AS(
    SELECT 
r.city,
r.restaurant_name,
SUM(o.total_amount) as total_revenue,
RANK() OVER(PARTITION BY r.city ORDER BY SUM(o.total_amount)DESC) as rankbycity
FROM restaurants r
JOIN orders o
on o.restaurant_id=r.restaurant_id
WHERE o.order_date >= CURRENT_DATE-INTERVAL 3 Year
GROUP BY 1,2
 )
 SELECT
     *
 FROM ranking_table
 WHERE rankbycity = 1;
 
 -- 7. Most Popular Dish by City
 -- Identify the most popular dish in each city based on the number of orders
 -- Tables : orders and restaurant
 -- Method 1
 with ranking_table
 as (
 SELECT 
r.city,
o.order_item,
COUNT(o.order_id) as noo,
RANK() OVER(PARTITION BY r.city ORDER BY COUNT(o.order_id)DESC) as rankbycity
FROM restaurants r
JOIN orders o
on o.restaurant_id=r.restaurant_id
WHERE o.order_date >= CURRENT_DATE-INTERVAL 3 Year
GROUP BY 1,2
)
select *
from ranking_table
where rankbycity = 1;
 
 
 -- Method 2
SELECT *
FROM (
 SELECT 
r.city,
o.order_item,
COUNT(o.order_id) as noo,
RANK() OVER(PARTITION BY r.city ORDER BY COUNT(o.order_id)DESC) as rankbycity
FROM restaurants r
JOIN orders o
on o.restaurant_id=r.restaurant_id
GROUP BY 1,2
) as t1
where rankbycity = 1;

-- 8.Customer Churn :
-- Find customer who haven't placed an order in 2024 but did in 2023
-- tables : customers & orders

-- Method 1
SELECT DISTINCT customer_id
FROM orders 
where order_date like '2023%'
and order_date not like '2024%';

-- Method 2
SELECT DISTINCT customer_id
FROM orders 
where extract(year from order_date)= 2023
and customer_id not in 
					(SELECT DISTINCT customer_id
					 FROM orders
					 where extract(year from order_date)= 2024);
                     
-- 9. Cancellation Rate comparison
-- Calculate and compare the order cancellation rate for each restaurant between the
-- current year and the previous year
-- Tables : orders

WITH cancel_ratio
AS
(
SELECT 
restaurant_id,
COUNT(o.order_id) as total_orders,
COUNT(CASE WHEN delivery_id IS NULL THEN 1 END)  Not_Delivery
from orders o
LEFT JOIN deliveries d
on o.order_id = d.order_id
Where EXTRACT(YEAR FROM order_date)= 2023
GROUP BY 1
)
SELECT 
restaurant_id,
total_orders,
Not_Delivery,
round(Not_Delivery /total_orders*100,0)
from cancel_ratio;

-- 11. Monthly Restaurant Growth Ratio:
-- Calculate each restaurant's growth ratio based on the total number of delivered orders since its joining
WITH growth_ratio
AS (
SELECT 
o.restaurant_id,
DATE_FORMAT(o.order_date, '%m-%y') as month,
COUNT(o.order_id) as cnt_orders,
LAG(COUNT(o.order_id),1) OVER(PARTITION BY o.restaurant_id ORDER BY DATE_FORMAT(o.order_date, '%m-%y')) as previous_month
FROM orders as o
JOIN
deliveries d
on o.order_id = d.order_id
WHERE d.delivery_status = 'delivered'
group by 1,2
order by 1,2
)
SELECT
o.restaurant_id,
month,
cnt_orders,
previous_month,
(cnt_orders-previous_month)/previous_month * 100
FROM growth_ration;

-- 12. Customer segmentation
-- Customer segmentation : Segment customers into 'Gold' or 'Silver' groups based on their total spending
-- compared to the average order value (AOV). If a customer's total spending exceed the AOV,
-- label them as 'Gold'; otherwise, label them as 'Silver'. Write an SQL query to determine each segment's
-- total number of orders and total revenue

-- Method 1
WITH  Total_segment
as (
SELECT 
customer_id,
SUM(total_amount) total_spent,
COUNT(order_id) total_orders,
CASE WHEN SUM(total_amount)>= (SELECT AVG(total_amount) from orders) THEN 'Gold'
      ELSE 'Silver'
END as customer_segment
FROM orders
GROUP BY 1
)
SELECT 
customer_segment,
SUM(total_orders),
SUM(total_spent)
FROM total_segment
group by 1;

-- Method 2
SELECT 
customer_segment,
SUM(total_orders) as total_orders,
SUM(total_spent) as total_revenue
FROM (
SELECT 
customer_id,
SUM(total_amount) total_spent,
COUNT(order_id) total_orders,
CASE WHEN SUM(total_amount)>= (SELECT AVG(total_amount) from orders) THEN 'Gold'
      ELSE 'Silver'
END as customer_segment
FROM orders
GROUP BY 1
) as t1
group by 1;

-- 13. Rider monthly earning :
-- Calculate each rider's total monthly earnings, assuming they earn 8% of the order amount
-- Tables : deliveries, orders

SELECT 
d.rider_id,
DATE_FORMAT(o.order_date, '%m-%y') as month,
SUM(o.total_amount) as total_revenue,
SUM(o.total_amount) * 0.08 as rider_earning
FROM
deliveries as d
LEFT JOIN 
orders as o 
on d.order_id = o.order_id
GROUP BY 1,2
order by 1,3 desc;

-- 14. Rider Ratings Analysis :
-- Find the number of 5-star, 4-star, and 3-star ratings each rider has
-- riders receive this rating based on delivery time.
-- If orders are delivered less than 15 minutes of orders received time the rider gets 5-star rating,
-- If they deliver 15 and 20 minutes they get 4-star rating
-- If they deliver after 20 minutes they get 3-star rating

-- tables : orders, deliveries

-- Method 1
SELECT
rider_id,
stars,
count(*) FROM
(
SELECT 
rider_id,
delivery_took_time,
CASE WHEN delivery_took_time < 15 THEN '5 Star'
     WHEN delivery_took_time BETWEEN 15 AND 20 THEN '4 Star'
     ELSE '3 Star'
END as Stars
FROM 
(
SELECT 
  o.order_id,
  o.order_time,
  d.delivery_time,
  CASE WHEN d.delivery_time > o.order_time THEN TIMESTAMPDIFF(minute,o.order_time,d.delivery_time) 
                                          ELSE TIMESTAMPDIFF(minute,o.order_time,d.delivery_time) + (24*60)
END as delivery_took_time,
d.rider_id
FROM orders o
JOIN deliveries d
on o.order_id = d.order_id
Where delivery_status = 'Delivered'
 ) as t1
)as t2
GROUP BY 1,2;

-- Method 2 (Completed)
SELECT
rider_id,
rating_star,
count(*)
from
(
SELECT 
d.rider_id,
CASE WHEN d.delivery_time > o.order_time THEN TIMESTAMPDIFF(minute,o.order_time,d.delivery_time) 
                                          ELSE TIMESTAMPDIFF(minute,o.order_time,d.delivery_time) + (24*60)
END as Delivery_order_diff,
CASE WHEN (CASE WHEN d.delivery_time > o.order_time THEN TIMESTAMPDIFF(minute,o.order_time,d.delivery_time) 
                                          ELSE TIMESTAMPDIFF(minute,o.order_time,d.delivery_time) + (24*60)
END) <= 15 then '5-Star'
     WHEN (CASE WHEN d.delivery_time > o.order_time THEN TIMESTAMPDIFF(minute,o.order_time,d.delivery_time) 
                                          ELSE TIMESTAMPDIFF(minute,o.order_time,d.delivery_time) + (24*60)
END) between 15 AND 20 then '4-Star'
     ELSE '3-star'
END as rating_star
FROM orders o
JOIN deliveries d
on o.order_id = d.order_id
Where delivery_status = 'Delivered'
)as t1
group by 1,2
order by 3 DESC;

-- 15. Order frequency by day
-- Analyze order frequency per day of the week and identify the peak day for each restaurant 
-- Tables: Orders

SELECT *
FROM
(
SELECT
r.restaurant_name,  
DAYNAME(o.order_date) as day_name,
count(*),
RANK() OVER(PARTITION BY r.restaurant_name order by count(*) DESC) as class
FROM orders o
JOIN restaurants r
on o.restaurant_id = r.restaurant_id
group by 1,2 
ORDER BY 1,3 DESC 
) as t1
WHERE class = 1;

-- 16.Customer Lifetime values
-- Calculate the total revenue generated by each customer over all their orders
-- tables : customers & orders

SELECT 
c.customer_id,
c.customer_name,
SUM(o.total_amount) as CLV
FROM
customers c
JOIN orders o
on c.customer_id = o.customer_id
GROUP BY 1,2;

-- 17 Monthly sales trends:
-- Identify sales trends by comparing each month's total sales to the previous month

SELECT
EXTRACT(YEAR FROM order_date) as year,
EXTRACT(MONTH FROM order_date) as month,
SUM(total_amount) as total_sale,
lag(SUM(total_amount), 1) OVER (ORDER BY EXTRACT(YEAR FROM order_date),EXTRACT(MONTH FROM order_date)) as previous_month
FROM orders
GROUP BY 1,2;

-- 18. Rider Efficiency
-- Evaluate rider efficiency by determining average delivery times and identifying those with  lowest and highest averages

select 
max(delivery_took_time) as highest,
min(delivery_took_time) as lowest
FROM
(
SELECT 
  d.rider_id,
  round(AVG(CASE WHEN d.delivery_time > o.order_time THEN TIMESTAMPDIFF(minute,o.order_time,d.delivery_time) 
                                          ELSE TIMESTAMPDIFF(minute,o.order_time,d.delivery_time) + (24*60)
END),0) as delivery_took_time
FROM orders o
JOIN deliveries d
on o.order_id = d.order_id
Where delivery_status = 'Delivered'
GROUP BY 1
order by 2 desc
) as t1;

-- 19 Order item popularity
-- track the popularity of specific order items over time and identify seasonal demand spikes 

SELECT 
order_item,
seasons,
count(*) as total_orders
FROM
(
SELECT *,
       EXTRACT(MONTH FROM order_date) as month,
       CASE
          WHEN EXTRACT(MONTH FROM order_date) BETWEEN 4 AND 6 THEN 'Spring'
          WHEN EXTRACT(MONTH FROM order_date) > 4 AND EXTRACT(MONTH FROM order_date) < 9 THEN 'Summer'
          ELSE 'Winter'
	   END as seasons
FROM orders
) as t1
GROUP BY 1,2
ORDER BY 1,3 DESC;

-- 20 Monthly restaurant growth ratio:()
-- Calculate each restaurant's growth ratio based on the total number of delivered orders
SELECT 
r.restaurant_name,
o.order_id,
EXTRACT(MONTH FROM order_date)
FROM restaurants r
JOIN orders o
on r.restaurant_id=o.restaurant_id
JOIN deliveries d
on o.order_id = d.order_id
where d.delivery_status = 'delivered';

-- 20 Rank each city based on the total revenue for last year 2023
SELECT
 r.city,
 sum(total_amount) as total_revenue,
 RANK() OVER(order by sum(total_amount)desc) as city_rank
 FROM orders as o
 JOIN restaurants as r
on o.restaurant_id = r.restaurant_id
GROUP BY 1

