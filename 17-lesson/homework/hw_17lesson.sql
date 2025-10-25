
CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
GO
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);

select * from #RegionSales


   CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);


select * from Employee
 
select managerID from Employee
group by managerId 
having count(*) >=5


CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);
select * from Products
select * from orders

select   p.product_name,
       SUM(o.unit)
	from Products p
	join Orders o
	on p.product_id = o.product_id
	where order_date >= '2020-02-01'
    AND order_date < '2020-03-01' 
	group by p.product_name
	having
	SUM(o.unit) >= 100

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');

select * from Orders
select CustomerID,
       Vendor
from Orders
group by CustomerID,
       Vendor
	   having Count(*) =(
	   select MAX(count))

WITH cust_vendor_counts AS (
    SELECT
        customerid,
        vendor,
        COUNT(*) AS orders_count
    FROM Orders
    GROUP BY customerid, vendor
)

;WITH cust_vendor_counts AS (
    SELECT
        customerid,
        vendor,
        COUNT(*) AS orders_count
    FROM Orders
    GROUP BY customerid, vendor
),
ranked AS (
    SELECT
        customerid,
        vendor,
        orders_count,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY orders_count DESC, vendor_id) AS rn
    FROM cust_vendor_counts
)
SELECT
    customerid,
    vendor,
    orders_count
FROM ranked
WHERE rn = 1;


DECLARE @Check_Prime INT = 91;
-- Your WHILE-based SQL logic here


declare @Check_Prime INT = 91;
declare @i INT = 2;
DECLARE @isPrime BIT = 1;
if @Check_Prime <= 1
begin
  set @isPrime = 0
  if @isprime = 1 
  print 'this number is prime'
  else
  print 'this number is not prime'
end


CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');


select * from Device


select count(DISTINCT Locations) from Device
select top 1 locations,
count (*) as total_signals
from Device
group by Locations
order by  total_signals DESC

SELECT Device_ID,
count(*) signals_pre_device from device
group by device_id
order by device_id


WITH loc_counts AS (
    SELECT 
        Locations,
        COUNT(*) AS loc_signals
    FROM Device
    GROUP BY Locations
),
total_locs AS (
    SELECT COUNT(*) AS total_locations
    FROM (SELECT DISTINCT Locations FROM Device) t
),
top_loc AS (
    SELECT TOP 1
        Locations AS top_location,
        loc_signals AS top_location_signals
    FROM loc_counts
    ORDER BY loc_signals DESC, Locations
),
device_counts AS (
    SELECT 
        Device_id,
        COUNT(*) AS total_signals_per_device
    FROM Device
    GROUP BY Device_id
)
SELECT 
    t.total_locations,
    tl.top_location,
    tl.top_location_signals,
    d.Device_id,
    d.total_signals_per_device
FROM device_counts d
CROSS JOIN total_locs t
CROSS JOIN top_loc tl
ORDER BY d.Device_id;

CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);

select empID, Name, salary from Employees e
where salary > (select AVG(salary) from Employees)
   

| Ticket ID | Number |
|-----------|--------|
| A23423    | 25     |
| A23423    | 45     |
| A23423    | 78     |
| B35643    | 25     |
| B35643    | 45     |
| B35643    | 98     |
| C98787    | 67     |
| C98787    | 86     |
| C98787    | 91     |

-- Step 1: Create the table
CREATE TABLE Numbers (
    Number INT
);

-- Step 2: Insert values into the table
INSERT INTO Numbers (Number)
VALUES
(25),
(45),
(78);


-- Step 1: Create the Tickets table
CREATE TABLE Tickets (
    TicketID VARCHAR(10),
    Number INT
);

-- Step 2: Insert the data into the table
INSERT INTO Tickets (TicketID, Number)
VALUES
('A23423', 25),
('A23423', 45),
('A23423', 78),
('B35643', 25),
('B35643', 45),
('B35643', 98),
('C98787', 67),
('C98787', 86),
('C98787', 91);

select * from Numbers
select * from Tickets

select 
     t.TicketID,
COUNT(distinct t.number) as matchednumbers,
case 
    when COUNT(distinct t.number) = (select COUNT(*) from Numbers n) then 100 
	when COUNT(distinct t.number) > 0 then 10
	else 0
	end as prize
	from tickets t
	WHERE t.Number IN (SELECT Number FROM Numbers)
GROUP BY t.TicketID;

CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);

select * from Spending

select count(distinct user_iD) from Spending
select PLATFORM = 'mobile', 'desktop'

WITH user_day AS (
    SELECT
        User_id,
        Spend_date,
        SUM(CASE WHEN Platform = 'Mobile'  THEN Amount ELSE 0 END) AS sum_mobile,
        SUM(CASE WHEN Platform = 'Desktop' THEN Amount ELSE 0 END) AS sum_desktop,
        MAX(CASE WHEN Platform = 'Mobile'  THEN 1 ELSE 0 END)  AS has_mobile,
        MAX(CASE WHEN Platform = 'Desktop' THEN 1 ELSE 0 END)  AS has_desktop
    FROM Spending
    GROUP BY User_id, Spend_date
),
classified AS (
    select 
        Spend_date,
        User_id,
        CASE
            WHEN has_mobile = 1 AND has_desktop = 1 THEN 'Both'
            WHEN has_mobile = 1 THEN 'Mobile Only'
            WHEN has_desktop = 1 THEN 'Desktop Only'
            ELSE 'None'
        END AS PlatformCategory,
        (sum_mobile + sum_desktop) AS user_total_amount
    FROM user_day
)
SELECT
    ROW_NUMBER() OVER (PARTITION BY Spend_date ORDER BY PlatformCategory) AS Row,
    Spend_date,
    PlatformCategory AS Platform,
    COUNT(*)            AS Total_Users,
    SUM(user_total_amount) AS Total_Amount
FROM classified
WHERE PlatformCategory <> 'None'
GROUP BY Spend_date, PlatformCategory
ORDER BY Spend_date, PlatformCategory;

CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil', 3), ('Eraser', 4), ('Notebook', 2);


select * from Grouped

select 
   PRODUCT
   from Grouped g
   join(
   select 1 as n union all
   select 2 union all
   select 3 union all
   select 4 union all 
   select 5) as numbers
   on numbers.n <= g.Quantity
