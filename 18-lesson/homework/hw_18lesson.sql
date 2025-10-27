
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'),
(21, 1, 1, '2024-04-20');


create table #monthlySales
(
productID int,
totalquantity varchar (50),
totalRevenue   DECIMAL(10,2)
)
select * from #monthlySales



*/ 
/*
create view vw_ProductSalesSummary as (
select ProdutID int,
       ProductNAme varchar (50),
	   category varchar (50),
	   totalQuantitySold decimal (10,2),
datename (day, getdate()) + ' - ' +
       datename (month, getdate()) + ',' +
	   DATENAME( weekday, getdate()) + '  ' +
	    DATENAME(HOUR, getdate())  + ': ' +
	   DATENAME(MINUTE, getdate())  + ' ' as calendar_date )
	   */


create view vw_ProductSalesSummary as 
select
       p.ProductID ,
       p.ProductNAme ,
	   p.category ,
	   sum(s.Quantity) as totalQuantitySold from Products p
	   join Sales s 
	    on p.ProductID = s.ProductID
		group by  p.ProductID ,
       p.ProductNAme ,
	   p.category 
select * from vw_ProductSalesSummary
select * from Products
select * from Sales
create function fn_GetSalesByCategory(@Category VARCHAR(50))
returns table
	as 
	 return
	  select 
	  p.productname,
	  SUM(s.quantity) as totalQuantity,
	  SUM(s.quantity * p.price) as totalRevenue from Products p
	  join sales s
	  on p.ProductID = s.ProductID
	  where p.Category = @Category
	  group by p.ProductName

	  


create function fn_GetTotalRevenueForProductt(@ProductID INT) 
returns decimal(10,2)
as
 begin
   declare @totalreveneu decimal(10,2);
   select 
       @totalreveneu = SUM(s.quantity * p.price) from Products p 
	   join Sales s 
	   on p.ProductID = s.ProductID
	   where s.ProductID = @productID
	   return @totalreveneu
end

SELECT dbo.fn_GetTotalRevenueForProductt(101) AS TotalRevenue;


create function dbo.fn_Isprime (@number int)
returns varchar (3)
as
  begin
     IF @number <= 1
	 return 'no';
	 declare @i INT = 2;
	 
	 while @i <=	SQRT(@NUMBER)
	 begin
	  IF @number % @i =0
	   return 'no';
	   set @i = @i +1
	   end;
	   return 'yes'
	   end

CREATE FUNCTION fn_GetNumbersBetween(@Start INT, @End INT)
RETURNS @Numbers TABLE
(
    Number INT
)
AS
BEGIN
    DECLARE @Current INT = @Start;

    WHILE @Current <= @End
    BEGIN
        INSERT INTO @Numbers VALUES (@Current);
        SET @Current = @Current + 1;
    END;

    RETURN;
END;
SELECT * FROM dbo.fn_GetNumbersBetween(5, 10);

select * from employee

CREATE FUNCTION getNthHighestSalary(@N INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        ISNULL(
            (SELECT DISTINCT Salary
             FROM Employee
             ORDER BY Salary DESC
             OFFSET @N - 1 ROWS
             FETCH NEXT 1 ROWS ONLY),
        NULL) AS HighestNSalary
);


SELECT id, COUNT(DISTINCT friend_id) AS num
FROM (
  SELECT requester_id AS id, accepter_id  AS friend_id FROM RequestAccepted
  UNION ALL
  SELECT accepter_id  AS id, requester_id AS friend_id FROM RequestAccepted
) t
GROUP BY id
ORDER BY num DESC

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Customers
INSERT INTO Customers (customer_id, name, city)
VALUES
(1, 'Alice Smith', 'New York'),
(2, 'Bob Jones', 'Chicago'),
(3, 'Carol White', 'Los Angeles');

-- Orders
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2024-12-10', 120.00),
(102, 1, '2024-12-20', 200.00),
(103, 1, '2024-12-30', 220.00),
(104, 2, '2025-01-12', 120.00),
(105, 2, '2025-01-20', 180.00);


select * from customers 
select * from Orders


create view vw_CustomerOrderSummaryy as
select
     c.customer_id,
	 c.name,
	 SUM(amount) as total_amount,
	 count(order_id) as total_orders,
	 max(order_date) as last_order_date from customers c
	 join orders o
	 on c.customer_id = o.customer_id
	 group by c.customer_id, c.name

select * from vw_CustomerOrderSummaryy

DROP TABLE IF EXISTS Gaps;

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,'Charlie'), (11, NULL), (12, NULL)

select * from Gaps


SELECT
    RowNumber,
    LAST_VALUE(TestCase IGNORE NULL) OVER (
        ORDER BY RowNumber
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Workflow
FROM Gaps;

