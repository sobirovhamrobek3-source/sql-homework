Create database homework_1_lesson
use homework_1_lesson

CREATE TABLE Employees
(EmpID INT PRIMARY KEY,
Name VARCHAR(50),
Salary DECIMAL(10, 2));

INSERT INTO Employees(empID, Name, Salary)
VALUES (1, 'NAVROZ', 1500.00);

INSERT INTO Employees (EmpID, Name, Salary)
VALUES (2, 'rjgek', 750.00);

INSERT INTO Employees (EmpID, Name, Salary)
VALUES (3, 'EYWETHR', 950.00);

UPDATE Employees
set salary = 7000
where EmpID = 1;

DELETE FROM Employees
where EmpID = 2
ALTER TABLE Employees 
ALTER COLUMN Name VARCHAR (100);
ALTER TABLE Employees
ADD  Department VARCHAR(50);

ALTER TABLE EMPLOYEES
ALTER COLUMN SALARY FLOAT;


CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
Departmentname VARCHAR(50)
);

TRuNCATE TABLE Employees;

 
INSERT INTO DEPARTMENTS (DEPARTMENTID,DEPARTMENTName)
VALUES (1, 'NAVROZZ');
INSERT INTO Departments (departmentID, Departmentname)
select 2, 'sgdf'
UNION ALL
SELECT 3, 'FGDF'
UNION ALL
SELECT 4, 'FGAFDRG'
UNION ALL
SELECT 5, 'RGHSDTHGB';

update employees
set Department = 'Managment'
where salary > 5000;

TRUNCATE TABLE Employees;
 
 
ALTER TABLE Employees
DROP COLUMN Department;

EXEC sp_rename 'employees', 'staffmember';

DROP TABLE Departments;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2), 
    Stock INT
);

alter table products 
add constraint chk_price_positibe CHECK (Price > 0);

alter table products
add stockQuantity int default 50;

EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Stock, StockQuantity)
SELECT 1,'sdfgfg', 'dfagaf', 1200.50, 20, 50 
UNION ALL
SELECT 2, 'DFGWERH', 'RETERAG', 800.00, 35, 50
UNION ALL
SELECT 3, 'FDGAFG', 'RFGRG', 300.00, 40, 50
UNION ALL
SELECT 4, 'ESGAFG', 'ERGQR',400.00, 49, 50
UNION ALL 
SELECT 5, 'GRSDH', 'ERTRTR', 340.00, 59, 50;

SELECT *
INTO Products_Backup
FROM Products;

EXEC sp_rename 'Products', 'Inventory';

SELECT ProductName, ProductCategory, Price, StockQuantity,
       IDENTITY(INT, 1000, 5) AS ProductCode
INTO Inventory_New
FROM Inventory;

DROP TABLE Inventory;

EXEC sp_rename 'Inventory_New', 'Inventory';

--DELETE – Removes rows from a table row by row, can include a WHERE clause, and can be rolled back (transaction safe). The table structure remains.

--TRUNCATE – Removes all rows from a table quickly by deallocating data pages. It cannot use WHERE, but the table structure remains. It’s less logged than DELETE.

--DROP – Completely removes the entire table structure and its data from the database. Once dropped, the table no longer exists
