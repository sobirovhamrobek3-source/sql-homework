
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

select id, name, salary from employees
where salary =(select min(salary) from employees as min_salary)

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300); 

select * from products

select id, product_name, price from products
where price > (select avg(price) from products)

drop table employees


select * from employees
select * from departments

select e.id, e.name,
        d.department_name
from employees e
join departments d
on e.department_id = d.id
where d.department_name = 'sales'


CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);

select c.customer_id, c.name 
      from customers c
	left join orders o
	on c.customer_id = o.customer_id
	where o.order_id is null

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);


select p.id, p.product_name, p.price from products p
 where p.price = (
 select max(price)
 from products )



 CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);

select * from employees
select * from departments

select e.id, e.name, e.salary ,d.department_name
from employees e
join departments d
on e.department_id = d.id
where d.department_name =( 
select top 1 department_id from employees
group by department_id
order by AVG(e.salary) desc)

select  e.salary, e.salary, e.department_id from employees e
where e.salary > (
select AVG(e2.salary) from employees e2 
where e2.department_id= e.department_id)


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);






CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);


select  s.name, g.course_id, g.grade from  grades g
join students s
on s.student_id = g.student_id
where g.grade  = ( select MAX(g2.grade) from grades g2
where g2.course_id = g.course_id)

select * from products

SELECT id, product_name, price, category_id
FROM (
  SELECT
    p.*,
    DENSE_RANK() OVER (PARTITION BY category_id ORDER BY price DESC) AS dr
  FROM products p
) t
WHERE dr = 3;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);

select * from employees

SELECT 
    e.id,
    e.name,
    e.salary,
    e.department_id
FROM employees e
WHERE 
    e.salary > (SELECT AVG(salary) FROM employees)  -- kompaniya o‘rtacha maoshidan yuqori
    AND e.salary < (
        SELECT MAX(salary)
        FROM employees e2
        WHERE e2.department_id = e.department_id     -- o‘z bo‘limidagi eng yuqori maoshdan past
    );
