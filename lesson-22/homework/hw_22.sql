
CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')


	select * from sales_data
	select 
customer_name,
order_date,
quantity_sold,
SUM(quantity_sold) over (partition by customer_name order by order_date
 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as total_sales
from sales_data

select 
product_category,
COUNT(*) as number_of_product
from sales_data
group by product_category

select product_category,
MAX(total_amount) as maxtotal
from sales_data
group by product_category



select product_category,
Min(unit_price) as minPrice
from sales_data
group by product_category

select 
order_date,
quantity_sold,
AVG(quantity_sold) over(order by order_date 
	rows between 1 PRECEDING AND 1 FOLLOWING) AS MOVING_AVG
	FROM sales_data


Select * from sales_data

select
quantity_sold,
region,
SUM(quantity_sold) over (partition by region ) as regionalSales
from sales_data


Select *,
RANK() over(partition by department order by salary desc)
from Employees

Select *,
DENSE_RANK() over(partition by department order by salary desc)
from Employees



select
customer_name,
total_purchase,
RANK() over( order by total_purchase DESC) as Purchase_rank
from (
select
customer_name,
SUM(total_amount) as total_purchase
from sales_data
group by customer_name) t


select
customer_name,
order_date,
total_amount,
total_amount -
 LAG(total_amount) over (partition by customer_name order by order_date)
 as differce_sales
from sales_data


select 
product_category,
product_name,
unit_price from(

select 
product_category,
product_name,
unit_price,
ROW_NUMBER() over 
(partition by product_category order by unit_price DESC)
AS top3_product
from sales_data) ranked
where top3_product <= 3


select * from sales_data

select 
total_amount,
order_date,
region,
SUM(total_amount) 
over (partition by region order by order_date) as sum_of_sales
from sales_data


select 
total_amount,
order_date,
product_category,
SUM(total_amount) 
over (partition by product_category order by order_date) as sum_of_sales
from sales_data
order by product_category, order_date

CREATE TABLE Numbers (
    ID INT
);

INSERT INTO Numbers (ID) VALUES
(1), (2), (3), (4), (5);


SELECT 
    ID,
    SUM(ID) OVER (ORDER BY ID) AS SumPreValues
FROM Numbers;

CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);

select * from OneColumn

select 
value,
sum(value) over (order by value) as sumPrevalues
from OneColumn

select 
customer_name from sales_data
group by customer_name
having count(distinct product_category) > 1


select 
customer_name,
total_amount,
region from (
select 
customer_name,
total_amount,
region,
AVG(total_amount) over (partition by region order by region) avg_region 
from sales_data ) t
where total_amount > avg_region

select 
customer_name,
total_amount,
region,
RANK() over(partition by region order by total_amount DESC) RANKED
from sales_data
order by region, RANKED



select 
customer_id,
total_amount,
order_date,
SUM(total_amount) over
(partition by customer_id order by order_date) ascumulative_sales
from sales_data
order by customer_id, order_date

;with monthlySales as (
select 
order_date,
SUM(total_amount) as monthly_sales
from sales_data
group by order_date )
select 
order_date,
monthly_Sales,
lag(monthly_sales) over (order by order_date) as prev_sales,
(monthly_sales - LAG(monthly_sales) over (order by order_date)) * 100.0
/ LAG(monthly_sales) over(order by order_date) as grow_rate
from monthlySales
order by order_date


;with orderedSales as (
select
customer_id,
customer_name,
total_amount,
ROW_NUMBER() 
over(partition by customer_id order by order_date DESC) AS RN,
LAG(total_amount)
over( partition by customer_id order by order_date) as prev_month
from sales_data	)
select customer_id, customer_name, total_amount, prev_month
from orderedSales
where total_amount > prev_month


select
product_name,
unit_price
from sales_data
where unit_price > (select AVG(unit_price) from sales_data)

CREATE TABLE MyData (
    Id INT, Grp INT, Val1 INT, Val2 INT
);
INSERT INTO MyData VALUES
(1,1,30,29), (2,1,19,0), (3,1,11,45), (4,2,0,0), (5,2,100,17);

select * from MyData
select 
id,
val1,
val2,
SUM(val1 + val2) over (partition by grp) as groupTotal
from MyData

CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), (1235,100,130), (1235,100,135), (1236,12,136);

select * from TheSumPuzzle

select
id,
SUM(cost) totalCost,
SUM(quantity) totalQuantity
from TheSumPuzzle
group by ID


CREATE TABLE Seats 
( 
SeatNumber INTEGER 
); 

INSERT INTO Seats VALUES 
(7),(13),(14),(15),(27),(28),(29),(30), 
(31),(32),(33),(34),(35),(52),(53),(54); 

select * from Seats

;with cte as (
select 1 as n 
union all
select n+1 from cte 
where n < 54
),cte2 as (select *, n-ROW_NUMBER()over(partition by seatnumber order by n) gr from cte
left join Seats on cte.n=Seats.SeatNumber
)select distinct
  MIN(N)over(partition by gr) as Gap_Start,
  MAX(N)over(partition by gr) as Gap_End
from cte2
where SeatNumber is null

