CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    StockQuantity INT
);

INSERT INTO Products VALUES
(1, 'Laptop', 1200.00, 'Electronics', 30),
(2, 'Smartphone', 800.00, 'Electronics', 50),
(3, 'Tablet', 400.00, 'Electronics', 40),
(4, 'Monitor', 250.00, 'Electronics', 60),
(5, 'Keyboard', 50.00, 'Accessories', 100),
(6, 'Mouse', 30.00, 'Accessories', 120),
(7, 'Chair', 150.00, 'Furniture', 80),
(8, 'Desk', 200.00, 'Furniture', 75),
(9, 'Pen', 5.00, 'Stationery', 300),
(10, 'Notebook', 10.00, 'Stationery', 500),
(11, 'Printer', 180.00, 'Electronics', 25),
(12, 'Camera', 500.00, 'Electronics', 40),
(13, 'Flashlight', 25.00, 'Tools', 200),
(14, 'Shirt', 30.00, 'Clothing', 150),
(15, 'Jeans', 45.00, 'Clothing', 120),
(16, 'Jacket', 80.00, 'Clothing', 70),
(17, 'Shoes', 60.00, 'Clothing', 100),
(18, 'Hat', 20.00, 'Accessories', 50),
(19, 'Socks', 10.00, 'Clothing', 200),
(20, 'T-Shirt', 25.00, 'Clothing', 150),
(21, 'Lamp', 60.00, 'Furniture', 40),
(22, 'Coffee Table', 100.00, 'Furniture', 35),
(23, 'Book', 15.00, 'Stationery', 250),
(24, 'Rug', 90.00, 'Furniture', 60),
(25, 'Cup', 5.00, 'Accessories', 500),
(26, 'Bag', 25.00, 'Accessories', 300),
(27, 'Couch', 450.00, 'Furniture', 15),
(28, 'Fridge', 600.00, 'Electronics', 20),
(29, 'Stove', 500.00, 'Electronics', 15),
(30, 'Microwave', 120.00, 'Electronics', 25),
(31, 'Air Conditioner', 350.00, 'Electronics', 10),
(32, 'Washing Machine', 450.00, 'Electronics', 15),
(33, 'Dryer', 400.00, 'Electronics', 10),
(34, 'Hair Dryer', 30.00, 'Accessories', 100),
(35, 'Iron', 40.00, 'Electronics', 50),
(36, 'Coffee Maker', 50.00, 'Electronics', 60),
(37, 'Blender', 35.00, 'Electronics', 40),
(38, 'Juicer', 55.00, 'Electronics', 30),
(39, 'Toaster', 40.00, 'Electronics', 70),
(40, 'Dishwasher', 500.00, 'Electronics', 20);

select min (price) as miniPrice from products
select max(Salary)  as maxSalary from Employees 

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NULL,
    LastName VARCHAR(50) NULL,
    DepartmentName VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    Age INT,
    Email VARCHAR(100) NULL,
    Country VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentName, Salary, HireDate, Age, Email, Country) VALUES
(1, 'John', 'Doe', 'IT', 55000.00, '2020-01-01', 30, 'johndoe@example.com', 'USA'),
(2, 'Jane', 'Smith', 'HR', 65000.00, '2019-03-15', 28, 'janesmith@example.com', 'USA'),
(3, NULL, 'Johnson', 'Finance', 45000.00, '2021-05-10', 25, NULL, 'Canada'),
(4, 'James', 'Brown', 'Marketing', 60000.00, '2018-07-22', 35, 'jamesbrown@example.com', 'UK'),
(5, 'Patricia', NULL, 'HR', 70000.00, '2017-08-30', 40, NULL, 'USA'),
(6, 'Michael', 'Miller', 'IT', 75000.00, '2020-12-12', 27, 'michaelm@example.com', 'Germany'),
(7, 'Linda', NULL, 'Finance', 48000.00, '2016-11-02', 42, NULL, 'Canada'),
(8, 'David', 'Moore', 'Marketing', 85000.00, '2021-09-01', 29, 'davidm@example.com', 'UK'),
(9, 'Elizabeth', 'Taylor', 'HR', 60000.00, '2019-05-18', 31, 'elizabetht@example.com', 'USA'),
(10, 'William', NULL, 'IT', 64000.00, '2020-04-10', 26, NULL, 'Germany'),
(11, NULL, 'Thomas', 'Finance', 47000.00, '2017-01-25', 38, NULL, 'Canada'),
(12, 'Joseph', 'Jackson', 'Marketing', 78000.00, '2016-09-30', 44, 'josephj@example.com', 'UK'),
(13, 'Karen', 'White', 'HR', 59000.00, '2018-06-10', 33, 'karenw@example.com', 'USA'),
(14, 'Steven', NULL, 'IT', 71000.00, '2021-07-15', 24, NULL, 'Germany'),
(15, 'Nancy', 'Clark', 'Finance', 45000.00, '2020-02-20', 27, 'nancyc@example.com', 'Canada'),
(16, 'George', 'Lewis', 'Marketing', 80000.00, '2019-11-10', 36, 'georgel@example.com', 'UK'),
(17, 'Betty', NULL, 'HR', 55000.00, '2017-04-05', 41, NULL, 'USA'),
(18, 'Samuel', 'Walker', 'IT', 72000.00, '2021-03-22', 23, 'samuelw@example.com', 'Germany'),
(19, 'Helen', 'Hall', 'Finance', 49000.00, '2018-10-16', 34, 'helenh@example.com', 'Canada'),
(20, NULL, 'Allen', 'Marketing', 90000.00, '2015-08-11', 50, NULL, 'UK'),
(21, 'Betty', 'Young', 'HR', 53000.00, '2020-05-17', 28, 'bettyy@example.com', 'USA'),
(22, 'Frank', NULL, 'IT', 67000.00, '2021-02-02', 26, 'frankk@example.com', 'Germany'),
(23, 'Deborah', 'Scott', 'Finance', 47000.00, '2019-07-09', 29, NULL, 'Canada'),
(24, 'Matthew', 'Green', 'Marketing', 76000.00, '2021-01-15', 30, 'matthewg@example.com', 'UK'),
(25, NULL, 'Adams', 'HR', 54000.00, '2020-06-21', 27, NULL, 'USA'),
(26, 'Paul', 'Nelson', 'IT', 71000.00, '2018-12-03', 37, 'pauln@example.com', 'Germany'),
(27, 'Margaret', NULL, 'Finance', 46000.00, '2020-08-19', 25, 'margaretc@example.com', 'Canada'),
(28, 'Anthony', 'Mitchell', 'Marketing', 82000.00, '2021-04-10', 29, NULL, 'UK'),
(29, 'Lisa', 'Perez', 'HR', 60000.00, '2021-03-05', 24, 'lisap@example.com', 'USA'),
(30, NULL, 'Roberts', 'IT', 69000.00, '2019-09-24', 32, NULL, 'Germany'),
(31, 'Jessica', 'Gonzalez', 'Finance', 47000.00, '2017-12-13', 38, 'jessicag@example.com', 'Canada'),
(32, 'Brian', NULL, 'Marketing', 85000.00, '2018-11-05', 35, NULL, 'UK'),
(33, 'Dorothy', 'Evans', 'HR', 59000.00, '2019-06-11', 31, 'dorothye@example.com', 'USA'),
(34, 'Matthew', 'Carter', 'IT', 70000.00, '2020-01-29', 29, 'matthewc@example.com', 'Germany'),
(35, NULL, 'Martinez', 'Finance', 51000.00, '2021-06-06', 22, NULL, 'Canada'),
(36, 'Daniel', 'Perez', 'Marketing', 83000.00, '2021-07-01', 30, 'danielp@example.com', 'UK'),
(37, 'Catherine', 'Roberts', 'HR', 60000.00, '2020-09-19', 27, 'catheriner@example.com', 'USA'),
(38, 'Ronald', NULL, 'IT', 68000.00, '2017-02-04', 39, NULL, 'Germany'),
(39, 'Angela', 'Jenkins', 'Finance', 52000.00, '2018-04-23', 34, 'angelaj@example.com', 'Canada'),
(40, 'Gary', 'Wright', 'Marketing', 87000.00, '2021-01-10', 29, NULL, 'UK');

select count(CustomerID ) from customers

select  count( distinct Category)  from products


select sum (Saleamount) as totalSales from sales

select avg (age) from employees

select count(*) from employees

select Category, min(price),  max(price) from products
group by Category

CREATE TABLE Sales (

    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, SaleAmount) VALUES
(1, 1, 1, '2023-01-01', 150.00),
(2, 2, 2, '2023-01-02', 200.00),
(3, 3, 3, '2023-01-03', 250.00),
(4, 4, 4, '2023-01-04', 300.00),
(5, 5, 5, '2023-01-05', 350.00),
(6, 6, 6, '2023-01-06', 400.00),
(7, 7, 7, '2023-01-07', 450.00),
(8, 8, 8, '2023-01-08', 500.00),
(9, 9, 9, '2023-01-09', 550.00),
(10, 10, 10, '2023-01-10', 600.00),
(11, 1, 1, '2023-01-11', 150.00),
(12, 2, 2, '2023-01-12', 200.00),
(13, 3, 3, '2023-01-13', 250.00),
(14, 4, 4, '2023-01-14', 300.00),
(15, 5, 5, '2023-01-15', 350.00),
(16, 6, 6, '2023-01-16', 400.00),
(17, 7, 7, '2023-01-17', 450.00),
(18, 8, 8, '2023-01-18', 500.00),
(19, 9, 9, '2023-01-19', 550.00),
(20, 10, 10, '2023-01-20', 600.00),
(21, 1, 2, '2023-01-21', 150.00),
(22, 2, 3, '2023-01-22', 200.00),
(23, 3, 4, '2023-01-23', 250.00),
(24, 4, 5, '2023-01-24', 300.00),
(25, 5, 6, '2023-01-25', 350.00),
(26, 6, 7, '2023-01-26', 400.00),
(27, 7, 8, '2023-01-27', 450.00),
(28, 8, 9, '2023-01-28', 500.00),
(29, 9, 10, '2023-01-29', 550.00),
(30, 10, 1, '2023-01-30', 600.00),
(31, 1, 2, '2023-02-01', 150.00),
(32, 2, 3, '2023-02-02', 200.00),
(33, 3, 4, '2023-02-03', 250.00),
(34, 4, 5, '2023-02-04', 300.00),
(35, 5, 6, '2023-02-05', 350.00),
(36, 6, 7, '2023-02-06', 400.00),
(37, 7, 8, '2023-02-07', 450.00),
(38, 8, 9, '2023-02-08', 500.00),
(39, 9, 10, '2023-02-09', 550.00),
(40, 10, 1, '2023-02-10', 600.00);


SELECT 
    CustomerID,
    SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID;

select  EmployeeID from employees
group by EmployeeID
having count (*) > 5

select Category, sum (Price), avg(Price) from Products
 group by Category

select count (*) as employeCount from employees
where departmentNAme = 'HR';

select * from Sales
select * from Products


select EmployeeID,
 max (salary),
 min (salary)
 from employees
 group by EmployeeID

 
 select employeeID, 
  avg (salary)
  from employees
  group by employeeID

select employeeId, count(*), avg (salary)
from employees
group by employeeID

select category,
      avg(Price) from Products
group by category
having AVG(Price) > 400;


SELECT 
    YEAR(SaleDate) AS SaleYear,
    SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate)
ORDER BY SaleYear;



CREATE TABLE Orders (
        OrderID INT PRIMARY KEY,
        CustomerID INT,
        ProductID INT,
        OrderDate DATE,
        Quantity INT,
        TotalAmount DECIMAL(10, 2),
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
        FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
    );

    -- Insert 40 orders
INSERT INTO Orders VALUES
(1, 1, 2, '2023-05-14', 1, 800.00),
(2, 1, 3, '2024-09-07', 2, 800.00),
(3, 1, 4, '2022-11-22', 1, 250.00),
(4, 1, 5, '2021-03-30', 3, 150.00),

(5, 2, 6, '2025-07-19', 1, 30.00),

(6, 3, 7, '2022-08-25', 2, 300.00),
(7, 3, 8, '2024-06-10', 1, 200.00),

(8, 4, 9, '2021-12-04', 4, 40.00),

(9, 5, 10, '2023-02-18', 1, 10.00),
(10, 5, 11, '2025-09-27', 2, 360.00),

(11, 6, 12, '2023-10-11', 1, 500.00),
(12, 6, 13, '2024-04-03', 1, 25.00),
(13, 6, 14, '2022-07-29', 2, 60.00),

(14, 7, 15, '2021-01-22', 3, 135.00),

(15, 8, 16, '2025-11-15', 1, 80.00),

(16, 9, 17, '2022-10-08', 1, 60.00),
(17, 9, 18, '2023-06-21', 2, 40.00),
(18, 9, 19, '2021-09-13', 5, 50.00),

(19, 10, 20, '2025-03-05', 2, 50.00),

(20, 11, 21, '2024-08-14', 1, 60.00),
(21, 11, 22, '2022-12-01', 1, 100.00),

(22, 12, 23, '2023-09-09', 1, 15.00),
(23, 12, 24, '2021-07-18', 2, 180.00),

(24, 13, 25, '2025-06-23', 3, 15.00),

(25, 14, 26, '2023-03-12', 4, 100.00),
(26, 14, 27, '2022-04-07', 1, 450.00),

(27, 15, 28, '2024-11-30', 1, 600.00),

(28, 16, 29, '2021-02-25', 1, 500.00),

(29, 17, 30, '2025-05-28', 2, 240.00),

(30, 18, 31, '2023-08-20', 1, 350.00),
(31, 18, 32, '2022-01-17', 1, 450.00),

(32, 19, 33, '2025-09-10', 1, 40.00),

(33, 20, 34, '2021-04-04', 2, 100.00),
(34, 20, 35, '2024-07-15', 3, 120.00),
(35, 20, 36, '2022-10-31', 1, 60.00),

(36, 21, 37, '2023-12-22', 1, 35.00),

(37, 22, 38, '2021-06-06', 2, 110.00),
(38, 22, 39, '2025-02-01', 1, 40.00),

(39, 23, 40, '2023-11-26', 3, 120.00),
(40, 24, 1, '2024-03-09', 1, 1200.00);

select customerID,
   count(*)
 from orders
 group by CustomerID
 having count(*) >=3

 SELECT 
    employeeID,
    AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY EmployeeID
HAVING AVG(Salary) > 60000;


select category,
      avg(price)
from products
group by category
having avg(price)> 150


SELECT 
    CustomerID,
    SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount) > 1500;

SELECT 
    employeeID,
    AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY EmployeeID
HAVING AVG(Salary) > 65000;

select custid,
   sum (case when unitprice *qty*(1-discount) > 50 then unitprice*qty*(1-discount)
   else 0 end) as price
   from [Sales].[Orders] o join [Sales].[OrderDetails] od on o.orderid = od. orderid

   group by custid
   order by 1

select 
   year(orderdate) as saalesyear,
   month( orderdate) as salesmonth,
   sum(sales) as totalsales,
   count(distinct ProductID ) 
   from Orders
   group by year (orderdate), month(orderdate)
   having count(distinct ProductID) >=2
   order by Salesyear,SalesMonth;

SELECT 
    YEAR(OrderDate) AS SalesYear,
    MONTH(OrderDate) AS SalesMonth,
    SUM(Sales) AS TotalSales,
    COUNT(DISTINCT ProductID) AS UniqueProductsSold
FROM [Sales].[Orders] o join [Sales].[OrderDetails] od on o.orderid = od. orderid
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(DISTINCT ProductID) >= 2
ORDER BY SalesYear, SalesMonth;


SELECT 
    YEAR(OrderDate) AS OrderYear,
    MIN(OrderQuantity) AS MinOrderQty,
    MAX(OrderQuantity) AS MaxOrderQty
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;





