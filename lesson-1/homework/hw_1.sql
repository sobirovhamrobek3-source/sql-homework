--1)Quyidagi atamalarni aniqlang: ma'lumotlar, ma'lumotlar bazasi, relyatsion ma'lumotlar bazasi va jadval.
--Umumiy har xil turdagi malumotlarni tartiblanmagan shaklda turishi
--2)SQL Serverning beshta asosiy xususiyatini sanab o'ting.
--Ma'lumotlarni boshqarish va saqlash, SQL tilini qo'llab-quvatlash, xavfsizlik, zaxira nusxa olish va tiklash, katta hajmda ishlash.
--3)SQL Serverga ulanishda qanday autentifikatsiya usullari mavjud? (kamida 2 ta bering)
--Windows Authentication, SQL Server Authentication, Microsoft Entra MFA, Microsoft Entra Default
--4)SSMS da SchoolDB nomli yangi ma'lumotlar 
--Create database SchoolDB
--5)Ustunlar bilan talabalar nomli jadval yaratish uchun so'rov yozing va bajaring: StudentID (INT, PRIMARY KEY), Ism (VARCHAR(50)), Age (INT).
--6)SQL Server, SSMS va SQL o'rtasidagi farqlarni tasvirlab bering
--SQL Server - bu ma'lumotlar bazasini boshqarish tizimi
--SSMS - bu ma'lumotlar bilan ishlash uvhun til bo'lib,SQL Server yoki boshqa tizimlar bilan ishlash uchun kerak.
--SQL - bu ma'lumotlar bilan ishlash uchun til bo'lib,SQl Server yoki boshqa tizimlar bilan ishlash uvhun kerak
--7)Turli xil SQL buyruqlarini tadqiq qiling va tushuntiring: DQL, DML, DDL, DCL, TCL misollar bilan.
--DQL - Ma'lumot so'rash, asosiy buyriqlar:SELECT misol: SELECT * FROM users;
--DML - ma'lumot qo'shish, o'zgartirish, o'chirish, asosiy buyruqlar: INSERT,UPDATE,DELETE misol: DELETE FROM users WHERE id=1
--DDL - Tuzilmani boshqarish, asosiy buyruqlar: CREATE,ALTER,DROP,TRUNCATE misol:CREATE TABLE users(...);
--DQL - ruxsatlarni boshqarish, asosiy buyruqlar: GRANT,REVOKE, misol: GRANT SELECT ON users TO 'Maab';
--TQL - tranzaktsiyalarni boshqarish, asosiy buyruqlar: COMMIT,ROLLBACK,SAVEPOINT misol:COMMIT;


--8)Talabalar jadvaliga uchta yozuv kiritish uchun so'rov yozing.
Create table Student(
StudentID int Primary key,
Name varchar(50),
Age int)
INSERT INTO student (StudentID, name, Age) VALUES (1, 'Navroz', 18);
INSERT INTO student (StudentID, Name, Age) VALUES
(4, 'Navroz', 18),
(2, 'Hamrobek', 18),
(3, 'Asatbek', 18);

