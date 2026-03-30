-- DB --> Employees
create TABLE Employee(
Eid INT PRIMARY KEY ,
Ename Varchar(50),
Salary Decimal(10,2),
Address Varchar(100),
did INT
);


INSERT INTO employee (Eid, Ename, Salary, Address, did)
VALUES 
(1, 'ahmed', 3000, 'cairo', 10),
(2, 'ali', 5000, 'cairo', 10),
(3, 'eman', 2000, 'cairo', 10),
(4, 'khalid', 1000, 'alex', 10),
(5, 'yousef', 4000, 'alex', 10),
(6, 'sameh', 5000, 'alex', 10),
(7, 'mohamed', 6000, 'alex', 20),
(8, 'alaa', 7000, 'alex', 20),
(9, 'ola', 4000, 'cairo', 20),
(10, 'reem', 2000, 'cairo', 20),
(11, 'nada', 9000, 'cairo', 20),
(12, 'sayed', 8000, 'mansoura', 30),
(13, 'reham', 15000, 'mansoura', 30),
(14, 'sally', 2000, 'mansoura', 30),
(15, 'omar', 3000, 'mansoura', 30);



UPDATE Employee 
set salary = 1500
where eid=13

SELECT SUM(salary),did
From Employee 
where Address like '_a%'
GROUP BY did 
HAVING SUM(Salary) > 12000



Select MAX(salary),address
From Employee 
WHERE did in (10,30)
group by Address 
HAVING COUNT (eid) > 3

------------------------------------------------------------------------------------------------------

-- DB --> ITI
SELECT SUM(salary)
FROM Instructor

-- ALIAS NAME L AGG COLOUMNS
SELECT MIN(salary) as [MIN VAL], MAX(salary) as [MAX VAL]
FROM Instructor

-- EL AGG FN mabtakhodsh el NULL VLAUE m3aha f el e3tbar
SELECT COUNT(*) as ALLL, COUNT (St_Id ) as IDs,COUNT(St_Lname ) as numOfLname,COUNT(St_Age) as numOfAge
From Student 
-- NULL VALUE m3 avg w count
select avg(st_age)
FROM student

SELECT SUM(St_Age) / COUNT(*)
FROM  Student

-- 3shan teb2a el 2ola nafs nateg el tanya 
select avg(isnull(st_age,0))
FROM student

-- GROUB BY
SELECT sum(salary) as salary,Dept_Id 
From Instructor
GROUP BY Dept_Id

SELECT sum(salary),d.Dept_Id,Dept_Name  
FROM Instructor i inner join Department d 
ON d.Dept_Id = i.Dept_Id
GROUP BY d.Dept_Id , Dept_Name


SELECT SUM(Salary ) , Dept_Id 
FROM Instructor
where Salary > 1000
GROUP By Dept_Id 

-- HAVING BY
SELECT sum(salary),Dept_Id 
from Instructor 
GROUP BY Dept_Id
Having SUM(Salary) > 100000 

SELECT sum(salary),Dept_Id 
from Instructor 
GROUP BY Dept_Id
Having COUNT(Ins_Id ) <6


SELECT sum(salary),Dept_Id 
from Instructor 
where Salary > 1000
GROUP BY Dept_Id
Having COUNT(Ins_Id ) <6

------------------------------------------------------------------------------------------------------

-- Subquieries (ALTER QUERY + INNER QUERY)

--De hya   
SELECT *
FROM Student 
WHERE St_Age < (select avg(st_age)from Student )
-- D3
SELECT *
FROM Student 
WHERE St_Age < 23

-- ALTER QUERY ---->
-- SELECT *
-- FROM Student 
-- WHERE St_Age
-- + INNER QUERY ---->
-- select avg(st_age)from Student


SELECT *
from Student s 
select distinct(dept_id) from Student

SELECT DISTINCT (Dept_Id)
FROM Student
where Dept_Id is not NULL 

SELECT Dept_name
FROM Department 
where Dept_Id in(10,20,30,40)

--haat asamy el aksam ely feha students
SELECT Dept_name
FROM Department 
where Dept_Id in (SELECT DISTINCT (Dept_Id)
FROM Student
where Dept_Id is not NULL)

--subquery + dml (insert-delete-update) values (rows )
delete from Stud_Course
where St_Id = 1 

--tyb lw 3ayz a delete el nas elle 3aysha fe cairo
-- momkn b join w momkn subquery w el a7sn JOIN l2nha asr3
-- msh lazm el engine nekhleh ye3ml optimization 3la el subquery 3hsan da hayakhod wa2t w bl taly el mawdo3 hayb2a bate2 
delete from Stud_Course
where St_Id in (select st_id from Student where St_Address = 'cairo')


-----------------------------------------------------------------------
--union family
--union all bey7ot kol el rows fo2 b3d mn 7agat mlhash 3elaka bb3d asln w lakn lazm yekon data type w mmkn at7ayl 3la l mwdo3 b convert 3ady

select St_Fname
from Student
union all
select Ins_Name
from Instructor

--union bygm3 b distinct --> yeshel el motshabeh w orderd
select St_Fname
from Student
union 
select Ins_Name
from Instructor

--except bygeb elle mwgod fel awlanya w sh mwgod fel tanya
select St_Fname
from Student
except
select Ins_Name
from Instructor

--intersect bygeb el moshtrk benhom 
select St_Fname
from Student
intersect
select Ins_Name
from Instructor
-----------------------------------------------------------------------
-----------------------------------------------------------------------
Select St_Fname,St_age,dept_id
From Student 
order by dept_id asc,st_age desc

-----------------------------------------------------------------------

-- /** el top de lesa ma3rfsh 3anha 7aga awy >>>
--top rows
select top 3 (st_fname)
from Student
--lw 3ayz mn t7t e3mlha top m3 3ks el trteb


