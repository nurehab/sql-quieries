-- Cartesiam product aw Cross join (NOT SUPPORTED FOR DEVELOPERS, SUPPORTED FOR TESTERS)
select st_fname,dept_name 
from Student , Department

select st_fname,dept_name 
from Student cross join Department

select st_fname,dept_name 
from Student S , Department D
WHERE D.Dept_Id = S.Dept_Id

select st_fname,dept_name,D.Dept_Id  
from Student S , Department D
WHERE D.Dept_Id = S.Dept_Id

-- efrd kan 3ayz esm el tgalb w kol bayanat el dept ely hwa feeh
SELECT st_fname , D.*
from Student s , Department d 
where D.Dept_Id = S.Dept_Id 

-- daymn lama bagy a3ml join ba2ol where w asawy el pk = fk (Where pk = fk)
-- INNER JOIN
select st_fname,dept_name 
from Student , Department 
where Department.Dept_Id = Student.Dept_Id 

-- 3ayz a3ml conditions :
select st_fname,Dept_name  
from Student S , Department D  
where D.Dept_Id = S.Dept_Id and st_address = 'alex'
order by dept_name

select st_fname,dept_name 
from Student S inner JOIN  Department D 
ON D.Dept_Id = S.Dept_Id and st_address = 'alex'
-- outer JOIN : LEFT - RIGHT - FULL
select St_Fname,dept_name
from Student s left outer join Department d
on d.dept_id = s.dept_id

select St_Fname,dept_name
from Student s right outer join Department d
on d.dept_id = s.dept_id

select St_Fname,dept_name
from Student s full outer join Department d
on d.dept_id = s.dept_id

-- Self JOIN
SELECT x.St_Fname as Sname , y.*
from Student x , Student y
where Y.St_id = x.St_super 


SELECT x.St_Fname as Sname , y.*
from Student x inner JOIN  Student y
ON  Y.St_id = x.St_super 


-- JOIN MULTI TABLES
SELECT st_fname,Crs_name,grade
from Student s , Stud_Course sc ,Course c
WHERE S.St_Id  = sc.St_Id AND 
c.Crs_Id = sc.Crs_Id 

-- JOIN MULTI TABLES with INNER JOIN
Select st_fname , crs_name,grade
from Student S inner join Stud_course Sc
on S.St_Id = Sc.St_Id 
INNER JOIN Course c 
On C.Crs_Id = Sc.Crs_Id

-- JOIN DML (INSERT - UPDATE - DELETE)
-- JOIN UPDATE
update stud_course
set grade +=10
from Student s , Stud_Course sc 
where S.St_Id = sc.St_Id  and s.St_Address = 'cairo'

update sc
set grade +=10
from Student s , Stud_Course sc 
where S.St_Id = sc.St_Id  and s.St_Address = 'cairo'

-- is not null || isnull || coalesce || concat
select St_Fname 
from Student
WHERE St_Fname  is NOT null

select isnull(st_fname,'')
from Student

select isnull(st_fname,'has no name')
from Student

select isnull(st_fname,St_Lname) as NewName
from Student

-- Multi Replacemnet
select coalesce (st_fname,st_lname,St_Address,'NO DATA') as NewName
from Student 

-- View name with age (diff data types as one coloumn)
select st_fname+''+convert(varchar(2),st_age) as oneCol
from student

-- BIG string
select 'studentName = ' +st_fname + '     &   age= ' + convert(varchar(2),st_age)
from Student

-- LW feeh 7aga b NULL --> isnull
select isnull(st_fname,'')+ ' '+ convert(varchar(2),isnull(st_age,0)) as oneCol
from student

-- concat --> de fn bet7wl kol el gowa l string sawa2 kanet el data type beta3to be eh + teshel ay Null w to7ot makano string fadya
select concat (st_fname,' ',st_age)
from Student 

-- = W like || _ W %
select *
from Student 
WHERE St_Fname = 'ahmed'

select *
from Student 
WHERE St_Fname like 'ahmed'

select *
from Student 
WHERE St_Fname like 'a%'

select *
from Student 
WHERE St_Fname like '%a'

select *
from Student 
WHERE St_Fname like '%a%'

select *
from Student 
WHERE St_Fname like '_a%'

-- Many patterns f el korase

-- order by
SELECT St_Fname , Dept_Id , St_Age 
from Student 
order by St_Address

SELECT St_Fname , Dept_Id , St_Age 
from Student 
order by 1

SELECT St_Fname , Dept_Id , St_Age 
from Student 
order by 3

SELECT St_Fname , Dept_Id , St_Age 
from Student 
order by Dept_Id , St_Age 

SELECT St_Fname , Dept_Id , St_Age 
from Student 
order by Dept_Id asc , St_Age DESC

-- el order ely malosh lazma lama a3ml kda -->
SELECT St_Fname , Dept_Id , St_Age 
from Student 
order by St_Id  , St_Age 


--- lab 3

-- 01 /
SELECT d.Dnum ,d.Dname ,e.Fname + ' ' + e.Lname AS [FULL NAME]
FROM Departments d INNER JOIN Employee e 
ON e.SSN = d.MGRSSN 

-- 02 /
SELECT d.Dname AS [Department Name] ,p.Pname AS [Project Name]  
FROM Departments d , Project p 
WHERE d.Dnum = p.Dnum 

-- 03 /
-- FULL OUTER JOIN --> K-code salem w hay-run 3ady w msh haytl3 error bs K-bussiness logic haytl3 sefof zeaya ll employees ely ma3ndhomsh arayb (dependent) w da ely msh matloob
SELECT d.*
FROM Dependent d FULL OUTER JOIN Employee e 
ON e.SSN  = d.ESSN 

SELECT d.*, e.Fname + ' ' + e.Lname AS [Employee Name]
FROM Dependent d INNER JOIN Employee e
ON e.SSN = d.ESSN ;

-- 04 /
SELECT Pnumber , Pname , Plocation   
FROM Project
WHERE City IN ('Cairo', 'Alex');

-- 05 / 
SELECT *   
FROM Project
WHERE Pname like 'a%'

-- 06 /
SELECT e.*
FROM Employee e  INNER JOIN Departments d 
ON e.Dno = d.Dnum 
WHERE d.Dnum = 30 and e.Salary BETWEEN 1000 and 2000

SELECT *
FROM Employee
WHERE Dno = 30 AND Salary BETWEEN 1000 AND 2000;

-- 07 /
-- Da 7al seky meky
SELECT e.Fname +' '+e.Lname AS [FULL NAME]
FROM Employee e
WHERE e.Dno = 10

-- Da 7al el SO2AL -->
SELECT e.Fname +' '+e.Lname AS [FULL NAME]
FROM Employee e INNER JOIN Works_for w 
ON e.SSN = w.ESSn
INNER JOIN Project p
ON P.Pnumber = w.Pno 
WHERE e.Dno = 10 AND w.hours >= 10
AND p.Pname = 'AL Rabwah'

-- 08 / 
SELECT x.Fname + ' ' + x.Lname as [FULL NAME]
FROM Employee x , Employee y 
WHERE y.SSN = x.Superssn
AND  y.Fname = 'Kamel' AND y.Lname = 'Mohamed';

-- 09 / 
SELECT e.Fname + ' ' + e.Lname AS [FULL NAME] , p.Pname 
FROM Employee e INNER JOIN Works_for wf  
ON e.SSN = wf.ESSn 
INNER JOIN Project p ON p.Pnumber = wf.Pno 
ORDER BY p.Pname 

-- 10 /
SELECT p.Pnumber ,d.Dname, e.Lname ,e.Address ,e.Bdate 
FROM Departments d INNER JOIN Project p 
ON d.Dnum = p.Dnum 
INNER JOIN Employee e ON e.SSN = d.MGRSSN  
WHERE p.City = 'Cairo'

-- 11 / 
SELECT e.*,d.*
FROM Employee e INNER JOIN Departments d 
ON e.SSN = d.MGRSSN 

-- 12 /
SELECT e.* , d.*
FROM Employee e FULL OUTER JOIN Dependent d
ON e.SSN = d.ESSN 

-- DML JOINS / 
-- 01 /
INSERT INTO Employee (SSN, Fname, Lname, Salary, Superssn, Dno)
VALUES (102672, 'Nour', 'Ehab', 3000, 112233, 30);

-- 02 / 
INSERT INTO Employee (SSN, Fname, Lname, Salary, Superssn, Dno)
VALUES (102660, 'Ta7a', 'Mohamed', NULL, NULL, 30);

-- 03 / 
UPDATE Employee 
set salary += (salary*0.2) 
WHERE SSN = 102672

