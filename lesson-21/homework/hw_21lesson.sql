
CREATE TABLE ProductSales (
    SaleID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    SaleDate DATE NOT NULL,
    SaleAmount DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    CustomerID INT NOT NULL
);
INSERT INTO ProductSales (SaleID, ProductName, SaleDate, SaleAmount, Quantity, CustomerID)
VALUES 
(1, 'Product A', '2023-01-01', 148.00, 2, 101),
(2, 'Product B', '2023-01-02', 202.00, 3, 102),
(3, 'Product C', '2023-01-03', 248.00, 1, 103),
(4, 'Product A', '2023-01-04', 149.50, 4, 101),
(5, 'Product B', '2023-01-05', 203.00, 5, 104),
(6, 'Product C', '2023-01-06', 252.00, 2, 105),
(7, 'Product A', '2023-01-07', 151.00, 1, 101),
(8, 'Product B', '2023-01-08', 205.00, 8, 102),
(9, 'Product C', '2023-01-09', 253.00, 7, 106),
(10, 'Product A', '2023-01-10', 152.00, 2, 107),
(11, 'Product B', '2023-01-11', 207.00, 3, 108),
(12, 'Product C', '2023-01-12', 249.00, 1, 109),
(13, 'Product A', '2023-01-13', 153.00, 4, 110),
(14, 'Product B', '2023-01-14', 208.50, 5, 111),
(15, 'Product C', '2023-01-15', 251.00, 2, 112),
(16, 'Product A', '2023-01-16', 154.00, 1, 113),
(17, 'Product B', '2023-01-17', 210.00, 8, 114),
(18, 'Product C', '2023-01-18', 254.00, 7, 115),
(19, 'Product A', '2023-01-19', 155.00, 3, 116),
(20, 'Product B', '2023-01-20', 211.00, 4, 117),
(21, 'Product C', '2023-01-21', 256.00, 2, 118),
(22, 'Product A', '2023-01-22', 157.00, 5, 119),
(23, 'Product B', '2023-01-23', 213.00, 3, 120),
(24, 'Product C', '2023-01-24', 255.00, 1, 121),
(25, 'Product A', '2023-01-25', 158.00, 6, 122),
(26, 'Product B', '2023-01-26', 215.00, 7, 123),
(27, 'Product C', '2023-01-27', 257.00, 3, 124),
(28, 'Product A', '2023-01-28', 159.50, 4, 125),
(29, 'Product B', '2023-01-29', 218.00, 5, 126),
(30, 'Product C', '2023-01-30', 258.00, 2, 127);


select * from ProductSales


Select *,
RANK() over(partition by saledate order by saleAmount desc)
from ProductSales


SELECT *,
       ROW_NUMBER() OVER (ORDER BY SaleDate) AS RowNum
FROM ProductSales;


select saleID,
SUM(quantity) as totalSold,
DENSE_RANK() over (order by sum (quantity) desc) as rank 
from ProductSales
group by SaleID

 

select 
  saleID,
  SaleAmount,
  lead(SaleAmount, 1) over( order by saledate) as nextSale
  from ProductSales;
  

  select 
  saleID,
  SaleAmount,
  lag (SaleAmount, 1) over( order by saledate) as backSale
  from ProductSales;
 
 select * from ( select 
 saleID,
 saleAmount,
 lag(Saleamount, 1) over (order by saledate) as backsale
 from ProductSales ) h
 where SaleAmount - backsale > 0




 SELECT * from( select
    SaleID,
    SaleAmount,
    LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PrevSale
FROM ProductSales ) as p
WHERE SaleAmount > PrevSale


select 
  SaleId,
  saleAmount,
  nextSale,
  ((nextSale - saleAmount) * 100 / SaleAmount) as percentagechange
  from(
  select 
   saleID,
   SaleAmount,
   LEAD(saleAmount) over (order by saleDate ) as nextSale
   from ProductSales) as p
   where nextSale is not null

   select * from ProductSales

   select 
    saleID,
	saleAmount,
	saleDate,
	lag(saleAmount) over ( order by saledate) as prevsale,
	ROUND(saleAmount * 1.0 /
	lag (saleAmount) over (order by saledate), 2) as saleratio
	from ProductSales
	order by SaleDate
 
 
 select top 1
  saleAmount as firstsale
  from ProductSales
  order by SaleDate
   
 select saleID,
   min (saleAmount ) as firstsale
   from ProductSales 
   group by SaleID 


 select * from ProductSales


 select * from (
 select
  saleID,
  saleAmount,
  saleDate,
  LAG(saleAmount)over ( order by saleDate) as increaseSale
  from productSales) g
  where SaleAmount >(select LAG(saleAmount)over 
  ( order by saleDate))
   
   select 
     saleID,
	 SaleDate,
	 saleamount,
	 sum(saleAmount) over (order by saleDate) as closingbalance
	 from productSales
	 order by saleDate

select * from ProductSales

select 
    saleID,
	saleDate,
	saleamount,
	avg(SaleAmount) over ( order by saleDate 
	rows between 2 preceding and current row) as avgSales
	from ProductSales
	order by saleDate
	
select 
  saleID,
  saleDate,
  saleAmount,
  AVG(saleAmount) over () as avgsale,
  SaleAmount - AVG(saleAmount) over () as differenceSale
  from productSales
  order by saleDate


  CREATE TABLE Employees1 (
    EmployeeID   INT PRIMARY KEY,
    Name         VARCHAR(50),
    Department   VARCHAR(50),
    Salary       DECIMAL(10,2),
    HireDate     DATE
);

INSERT INTO Employees1 (EmployeeID, Name, Department, Salary, HireDate) VALUES
(1, 'John Smith', 'IT', 60000.00, '2020-03-15'),
(2, 'Emma Johnson', 'HR', 50000.00, '2019-07-22'),
(3, 'Michael Brown', 'Finance', 75000.00, '2018-11-10'),
(4, 'Olivia Davis', 'Marketing', 55000.00, '2021-01-05'),
(5, 'William Wilson', 'IT', 62000.00, '2022-06-12'),
(6, 'Sophia Martinez', 'Finance', 77000.00, '2017-09-30'),
(7, 'James Anderson', 'HR', 52000.00, '2020-04-18'),
(8, 'Isabella Thomas', 'Marketing', 58000.00, '2019-08-25'),
(9, 'Benjamin Taylor', 'IT', 64000.00, '2021-11-17'),
(10, 'Charlotte Lee', 'Finance', 80000.00, '2016-05-09'),
(11, 'Ethan Harris', 'IT', 63000.00, '2023-02-14'),
(12, 'Mia Clark', 'HR', 53000.00, '2022-09-05'),
(13, 'Alexander Lewis', 'Finance', 78000.00, '2015-12-20'),
(14, 'Amelia Walker', 'Marketing', 57000.00, '2020-07-28'),
(15, 'Daniel Hall', 'IT', 61000.00, '2018-10-13'),
(16, 'Harper Allen', 'Finance', 79000.00, '2017-03-22'),
(17, 'Matthew Young', 'HR', 54000.00, '2021-06-30'),
(18, 'Ava King', 'Marketing', 56000.00, '2019-04-16'),
(19, 'Lucas Wright', 'IT', 65000.00, '2022-12-01'),
(20, 'Evelyn Scott', 'Finance', 81000.00, '2016-08-07');

select* from Employees1


select * from employees1
where salary in( select salary from Employees1
group by Salary
having count(*) >1)
  

  
select saleID,
SUM(quantity) as totalSold,
DENSE_RANK() over (order by sum (quantity) desc) as rank 
from ProductSales
group by SaleID

   select * from ( select 
   department,
employeeID,
salary,
DENSE_RANK() over (partition by department order by salary desc) as ranksalary
from Employees1) as t
where ranksalary <=2
order by Department,ranksalary


select * from(
select employeeID,
       department,
	   salary,
	   row_number() over (partition by department order by salary ASC) as rn
	   from Employees1
	   ) as t
	   where rn = 1


	
	select 
employeeID,
department,
salary,
SUM(salary) over (order by hiredate
rows between UNBOUNDED PRECEDING and current row) as totalsalary
from employees1
order by hiredate, Department


	
	select 
employeeID,
department,
salary,
SUM(salary) over (partition by department 
) as totalsalary
from employees1
order by Department, EmployeeID



	select 
employeeID,
department,
salary,
avg(salary) over (partition by department 
) as avgsalary
from employees1
order by Department, EmployeeID

select * from Employees1

select 
    saleID,
	saleDate,
	saleamount,
	avg(SaleAmount) over ( order by saleDate 
	rows between 2 preceding and current row) as avgSales
	from ProductSales
	order by saleDate


	select 
	employeeID,
	department,
	salary,
	avg(salary) over(partition by department)as avgsalary,
	salary - avg(salary) over(partition by department) as differncesalary
	from Employees1
	order by Department


	select * from Employees1

	select 
	employeeID,
	department,
	salary,
	AVG(salary) over (order by salary
	 ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) as totalsalary
	 from Employees1
	 order by Salary


select sum(salary) as last3employee from(
select top 3 salary from Employees1
order by HireDate DESC) t
