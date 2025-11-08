CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE DepartmentBonus (
    Department NVARCHAR(50) PRIMARY KEY,
    BonusPercentage DECIMAL(5,2)
);

INSERT INTO Employees VALUES
(1, 'John', 'Doe', 'Sales', 5000),
(2, 'Jane', 'Smith', 'Sales', 5200),
(3, 'Mike', 'Brown', 'IT', 6000),
(4, 'Anna', 'Taylor', 'HR', 4500);

INSERT INTO DepartmentBonus VALUES
('Sales', 10),
('IT', 15),
('HR', 8);

select * from Employees
select * from DepartmentBonus


create procedure usp_updateSalary
@departmentName nvarchar(50),
@increasePercent decimal(5,2)
as 
  begin
   set nocount on;
   Print 'Department:' + @departmentName;
   Print 'increase percent:' + cast(@IncreasePercent as nvarchar(10))
   UPDATE Employees
SET Salary = Salary + (Salary * @IncreasePercent / 100)
WHERE Department = @DepartmentName;
select * from Employees
where Department = @departmentName
   end
   go

 

  select * from Employees e
	join DepartmentBonus d
	on d.Department = e.Department
     create table #employeeBonus (
	  EmployeeID int,
	  FulltName varchar(50),
	  department nvarchar(50),
	  salary decimal(10,2),
	  bonusamount decimal(10,2)
	  );

	  insert into #employeeBonus (EmployeeID, FulltName, department,
	  salary,bonusamount)
	  select
	    e.employeeID,
		CONCAT(e.firstName, ' ', e.LastName) as fullName,
		e.department,
		e.salary,
		 (e.Salary * d.BonusPercentage / 100.0) AS BonusAmount 
		 from Employees e
		 inner join DepartmentBonus d
		 on d.Department = e.Department
		 end
	
	EXEC usp_getemployees

CREATE TABLE Tree (id INT, p_id INT);

INSERT INTO Tree (id, p_id) VALUES (1, NULL);
INSERT INTO Tree (id, p_id) VALUES (2, 1);
INSERT INTO Tree (id, p_id) VALUES (3, 1);
INSERT INTO Tree (id, p_id) VALUES (4, 2);
INSERT INTO Tree (id, p_id) VALUES (5, 2);

select * from Tree

	select *,
	 case when id-p_id is null then 'root'
	      when id-p_id = 1 then 'inner'
		  else 'leef' end node_tree
		  from tree

CREATE TABLE Products_Current (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE Products_New (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

INSERT INTO Products_Current VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 600),
(3, 'Smartphone', 800);

INSERT INTO Products_New VALUES
(2, 'Tablet Pro', 700),
(3, 'Smartphone', 850),
(4, 'Smartwatch', 300);


select * from Products_Current
select * from Products_New

merge into products_current as curren
using products_new as news
on curren.productID = news.ProductId

when matched then
  update set 

 curren.ProductName = news.productName,
 curren.Price = news.price

 when not matched by target then
   insert (productID, ProductName, Price)
    values (news.ProductId, news.ProductName, news.price)

when not matched by source then
delete;


MERGE INTO Products_Current AS Target
USING Products_New AS Source
ON Target.ProductID = Source.ProductID

WHEN MATCHED THEN
    UPDATE SET
        Target.ProductName = Source.ProductName,
        Target.Price = Source.Price

WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProductID, ProductName, Price)
    VALUES (Source.ProductID, Source.ProductName, Source.Price)

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;


SELECT * FROM Products_Current;


IF OBJECT_ID('Signups') IS NULL
CREATE TABLE Signups (
    user_id INT,
    time_stamp DATETIME
);

IF OBJECT_ID('Confirmations') IS NULL
CREATE TABLE Confirmations (
    user_id INT,
    time_stamp DATETIME,
    action VARCHAR(10) CHECK (action IN ('confirmed', 'timeout'))
);


TRUNCATE TABLE Signups;
TRUNCATE TABLE Confirmations;

INSERT INTO Signups (user_id, time_stamp) VALUES
(3, '2020-03-21 10:16:13'),
(7, '2020-01-04 13:57:59'),
(2, '2020-07-29 23:09:44'),
(6, '2020-12-09 10:39:37');

INSERT INTO Confirmations (user_id, time_stamp, action) VALUES
(3, '2021-01-06 03:30:46', 'timeout'),
(3, '2021-07-14 14:00:00', 'timeout'),
(7, '2021-06-12 11:57:29', 'confirmed'),
(7, '2021-06-13 12:58:28', 'confirmed'),
(7, '2021-06-14 13:59:27', 'confirmed'),
(2, '2021-01-22 00:00:00', 'confirmed'),
(2, '2021-02-28 23:59:59', 'timeout');


select * from  Signups 
select * from Confirmations

select 
   s.user_ID,
   round(
     Coalesce(
	    cast(sum(case when c.action = 'confirmed' then 1 else 0 end) as Float)
		/NullIF(count(c.user_ID),0),0
		),
		2
		) as confirmation_rate
		from Signups s
		left join Confirmations c
		  on s.user_id = c.user_id
		  group by s.user_id
		  order by s.user_id

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2)
);

-- Ma'lumot kiritish
INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000.00),
(2, 'Bob', 60000.00),
(3, 'Charlie', 50000.00);

select * from employees

select name, salary from employees
where salary =( select MIN(salary) from employees)




-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2)
);

-- Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    SaleDate DATE
);

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop Model A', 'Electronics', 1200),
(2, 'Laptop Model B', 'Electronics', 1500),
(3, 'Tablet Model X', 'Electronics', 600),
(4, 'Tablet Model Y', 'Electronics', 700),
(5, 'Smartphone Alpha', 'Electronics', 800),
(6, 'Smartphone Beta', 'Electronics', 850),
(7, 'Smartwatch Series 1', 'Wearables', 300),
(8, 'Smartwatch Series 2', 'Wearables', 350),
(9, 'Headphones Basic', 'Accessories', 150),
(10, 'Headphones Pro', 'Accessories', 250),
(11, 'Wireless Mouse', 'Accessories', 50),
(12, 'Wireless Keyboard', 'Accessories', 80),
(13, 'Desktop PC Standard', 'Computers', 1000),
(14, 'Desktop PC Gaming', 'Computers', 2000),
(15, 'Monitor 24 inch', 'Displays', 200),
(16, 'Monitor 27 inch', 'Displays', 300),
(17, 'Printer Basic', 'Office', 120),
(18, 'Printer Pro', 'Office', 400),
(19, 'Router Basic', 'Networking', 70),
(20, 'Router Pro', 'Networking', 150);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 2, '2024-01-15'),
(2, 1, 1, '2024-02-10'),
(3, 1, 3, '2024-03-08'),
(4, 2, 1, '2024-01-22'),
(5, 3, 5, '2024-01-20'),
(6, 5, 2, '2024-02-18'),
(7, 5, 1, '2024-03-25'),
(8, 6, 4, '2024-04-02'),
(9, 7, 2, '2024-01-30'),
(10, 7, 1, '2024-02-25'),
(11, 7, 1, '2024-03-15'),
(12, 9, 8, '2024-01-18'),
(13, 9, 5, '2024-02-20'),
(14, 10, 3, '2024-03-22'),
(15, 11, 2, '2024-02-14'),
(16, 13, 1, '2024-03-10'),
(17, 14, 2, '2024-03-22'),
(18, 15, 5, '2024-02-01'),
(19, 15, 3, '2024-03-11'),
(20, 19, 4, '2024-04-01');

select * from Products
select * from Sales

create procedure GetProductSalesSummary
@productID int
as
begin
  set nocount on
  select p.productName ,
  sum(s.quantity) as total_quantity_sold,
  sum(s.quantity * p.price) as total_sales_amount,
  min(s.saleDate) as first_saledate,
  max(s.saleDate) as last_saleDate
  from  dbo.Products p
  left join dbo.sales s
    on p.ProductID = s.ProductID
	where p.ProductID = @productID
	group by p.ProductName
  end
