--CSV (Comma-Separated Values)

--TXT (Plain Text)

--XML (Extensible Markup Language)

--JSON (JavaScript Object Notation)

CREATE TABLE PRODUCTS
(
PRODUCTID INT PRIMARY KEY,
ProductName VARCHAR(50),
Price DECIMAL(10,2)
);
INSERT INTO PRODUCTS (PRODUCTID,ProductName,Price)
select 1, 'fgsh', 100
UNION ALL
select 2, 'fhsdf', 120
UNION ALL
SELECT 3, 'DFGDSH', 230

SELECT * FROM PRODUCTS

--NULL — bu qiymat yo‘qligini (ma’lumot kiritilmaganini yoki noma’lum ekanini) bildiradi. Agar ustun NULL bo‘lsa, u holda unga qiymat kiritmaslik ham mumkin.
➝-- Masalan: Telefon raqami ma’lum bo‘lmasa, NULL saqlash mumkin.

--NOT NULL — bu ustunda har doim qiymat bo‘lishi shartligini bildiradi. Ya’ni, qiymat kiritilmasa xatolik yuz beradi.
➝-- Masalan: Talabaning Ismi maydonida qiymat bo‘lishi majburiy, shuning uchun u NOT NULL qilinadi.

ALTER TABLE PRODUCTS
ADD CONSTRAINT UQ_PRODUCTRNAME UNIQUE (PRODUCTNAME);

-- This query retrieves all columns and rows from the Products table
SELECT * FROM Products;
ALTER TABLE PRODUCTS
ADD CATEGORYID INT;

CREATE TABLE CATEGORIES
( CATEGORYID INT PRIMARY KEY,
CATEGORYNAME VARCHAR(50) UNIQUE);

SELECT * FROM CATEGORIES

--IDENTITY ustuni SQL Server’da avtomatik ravishda unikal (takrorlanmaydigan) raqamlar yaratish uchun ishlatiladi.

--Maqsadi:

--Jadvaldagi qatorlarni bir xil bo‘lmagan (unique) identifikator bilan belgilash.

--Har bir yangi yozuv qo‘shilganda ustun qiymatini qo‘lda kiritishga hojat qoldirmasdan, SQL Server o‘zi ketma-ket raqam beradi.

--Odatda PRIMARY KEY ustunlari uchun ishlatiladi.

BULK INSERT PRODUCTS 
FROM 'C:\DATA\PRODUCTS.TXT'
WITH(
    FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	firstrow = 2
);

alter table Products
add constraint FK_PRODUCTS_CATEGORIES
FOREIGN KEY (CATEGORYID) REFERENCES CATEGORIES(CATEGORYID);

--PRIMARY KEY

--Har bir jadvalda faqat bitta bo‘ladi.

--NULL qiymatlarga ruxsat bermaydi.

--Har bir qatorni noyob identifikator bilan belgilaydi.

--Odatda asosiy identifikator sifatida ishlatiladi.

--UNIQUE KEY

--Bir jadvalda bir nechta UNIQUE KEY bo‘lishi mumkin.

--Bitta NULL qiymatga ruxsat beradi.

--Ustundagi qiymatlar takrorlanmasligini ta’minlaydi, lekin asosiy identifikator sifatida ishlatilmaydi.

ALTER TABLE  PRODUCTS
 ADD CONSTRAINT CHK_PRODUCTS_PRICE CHECK  (PRICE > 0);

 ALTER TABLE PRODUCTS
 ADD STOCK INT NOT NULL DEFAULT 0;

SELECT * FROM PRODUCTS

SELECT ProductName, ISNULL(Price, 0) AS Price
FROM Products;

--FOREIGN KEY constraint maqsadi

--FOREIGN KEY jadvaldagi ustunni boshqa jadvaldagi PRIMARY KEY yoki UNIQUE KEY bilan bog‘laydi.

--Bu orqali referensial yaxlitlik (referential integrity) ta’minlanadi, ya’ni bog‘langan ustunda faqat mavjud qiymatlar bo‘lishi mumkin.

CREATE TABLE CUSTOMERS
(
CUSTOMERID INT PRIMARY KEY IDENTITY(1,1),
CUSTOMERNAME VARCHAR(50) NOT NULL,
AGE INT NOT NULL,
CONSTRAINT CHK_CUSTOMERS_AGE CHECK (AGE >=18)
);
SELECT * FROM GUYS

CREATE TABLE GUYS
(
ID INT IDENTITY(100,10) PRIMARY KEY,
NAME VARCHAR(100) NOT NULL);

 CREATE TABLE ORDERDETAILS
 (
ORDERID INT NOT NULL,
PRODUCTID INT NOT NULL,
QUANTITY INT NOT NULL,
CONSTRAINT PK_ORDERDETAILS PRIMARY KEY (ORDERID, PRODUCTID));
--ISNULL - Faqat ikki narsani tekshiradi: agar birinchi qiymat NULL bo‘lsa, ikkinchi qiymatni qaytaradi.

-- COALESCE - Bir nechta qiymatni ketma-ket tekshiradi va birinchi NULL bo‘lmaganini qaytaradi

CREATE TABLE EMPLOYEES
( EMPID INT PRIMARY KEY,
FULLNAME VARCHAR(50) NOT NULL,
EMAIL VARCHAR(50) UNIQUE );

CREATE TABLE ORDERS
(
ORDERID INT PRIMARY KEY,
CUSTOMERID INT,
CONSTRAINT FK_ORDERS_CUSTOMERS
  FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID)
  ON DELETE CASCADE
  ON UPDATE CASCADE);








