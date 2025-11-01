
CREATE TABLE #Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);


INSERT INTO #Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
('David', 'Laptop', 1, 1300.00, '2024-03-05'),
('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
('Jack', 'Smartphone', 1, 820.00, '2024-06-01');

select * from #Sales

select distinct customerName,product, SaleDate from #Sales
where SaleDate >= '2024-03-01'
and SaleDate < '2024-04-01'

select distinct customerName,product, price from #Sales
where Price = (select MAX(price) from #Sales)

select  MAX(price) as secondHighestprice from #Sales
where( Price*Quantity) < (select MAX(price* Quantity) from #Sales)

select customerName, product, month(saledate) perMonth,
       sum(quantity ) totalQuantity
	   from #sales
	   group by customerName, product, month(saledate)
	   order by CustomerName, product, month(saledate)

select customerName, PRODUCT from #Sales
group by CustomerName, Product
having count(distinct product) = 1

select name, 
       fruit,
	   count (*)
	   from  Fruits
group by  name, fruit

select ParentID,
       childID,
	   count(*)
	   from family
	group by parentID,
	childId

	select f1.parentId as olderPerson,
	       f1.childId as youngerperson
		from family f1

create table Fruits(Name varchar(50), Fruit varchar(50))
insert into Fruits values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
							('Mario', 'Orange')

create table Family(ParentId int, ChildID int)
insert into Family values (1, 2), (2, 3), (3, 4)

CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);


INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);

select * from #Orders

select * from #Orders o
where o.DeliveryState = 'tx'
and exists(
 select 1 from #Orders c
 where c.CustomerID = o.CustomerID
 and c.DeliveryState = 'ca')


 create table #residents(resid int identity, fullname varchar(50), address varchar(100))

insert into #residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22')


select * from #residents

update #residents
set fullname =
   SUBSTRING(
    address,
	CHARINDEX('fullname=', address) +5,
	CHARINDEX(' ', address + ' ', CHARINDEX('fullname=', address)) - CHARINDEX('fullname=', address) - 5)
	where fullname is null or fullname = ' '


CREATE TABLE #Routes
(
RouteID        INTEGER NOT NULL,
DepartureCity  VARCHAR(30) NOT NULL,
ArrivalCity    VARCHAR(30) NOT NULL,
Cost           MONEY NOT NULL,
PRIMARY KEY (DepartureCity, ArrivalCity)
);

INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1,'Tashkent','Samarkand',100),
(2,'Samarkand','Bukhoro',200),
(3,'Bukhoro','Khorezm',300),
(4,'Samarkand','Khorezm',400),
(5,'Tashkent','Jizzakh',100),
(6,'Jizzakh','Samarkand',50);

select * from #Routes
where DepartureCity = 'tashkent' and ArrivalCity = 'khorezm'
and Cost in (
     select MIN(Cost) from #Routes where DepartureCity = 'tashkent' and ArrivalCity = 'khorezm' 
	 union all
	 select  Max(Cost) from #Routes where DepartureCity = 'tashkent' and ArrivalCity = 'khorezm'
	 )











CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)

 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')

select * from #RankingPuzzle

Select *,
RANK() over( order by vals desc)
from  #RankingPuzzle

CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);

INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);

select * from #EmployeeSales

select employeeName, department, salesAmount
from ( select *,
  AVG(salesAmount) over(partition by department) as deptsales 
  from #EmployeeSales) as t
  where SalesAmount > deptsales

  
select e.employeeName, e.department, e.salesAmount, e.salesMonth
from #EmployeeSales e
where exists (
select 1 from #EmployeeSales e2
where e2.SalesMonth = e.SalesMonth
group by e2.SalesMonth
 having MAX(e2.SalesAmount) = e.SalesAmount)
  

  SELECT e.EmployeeName
FROM (SELECT DISTINCT EmployeeName FROM #EmployeeSales) e
WHERE NOT EXISTS (
    SELECT 1
    FROM #EmployeeSales m
    WHERE NOT EXISTS (
        SELECT 1
        FROM #EmployeeSales es
        WHERE es.EmployeeName = e.EmployeeName
          AND MONTH(es.SalesMonth) = m.SalesMonth
    )
);


Select *,
SUM(Salary)over(partition by department),
AVG(Salary)over(partition by department),
MAX(Salary)over(partition by department),
MIN(Salary)over(partition by department),
COUNT(Salary)over(partition by department),

SUM(Salary)over(),
AVG(Salary)over(),
MAX(Salary)over(),
MIN(Salary)over(),
COUNT(Salary)over()
from EmployeesSimple

CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);

INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);

select * from Products


select Name, category, Price
from ( select *,
  AVG(Price) over() as deptsales 
  from Products) as p
  where Price > deptsales

select * from Products
  
select Name, category, Stock 
from Products
where Stock < (select max(stock) from Products)

 
select Name, category 
from Products
where Category =
(select Category from Products where name = 'laptop')


select Name, category, Price
from Products
where price > 
(select min(price) from Products where Category = 'electronics')

select name, category, price from Products p
where Price > (select AVG(price)
from Products where Category = p.Category)
  
  CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');

select * from Orders

select productID, quantity from Orders 
where Quantity > (select AVG(quantity) from Orders )

select top 1 
ProductID ,
sum(quantity) as total_quantity from Orders
group by ProductID
order by SUM(quantity) desc


select * from Products
select * from Orders

select p.productID , p.name from Products p
left join Orders o
on p.ProductID = o.ProductID
where o.ProductID is null


select distinct p.productID , p.name from Products p
inner join Orders o
on p.ProductID = o.ProductID



