-- top 
-- ====
-- 3ayz masln awel 3 rows:
-- ========================

SELECT top(3) * from Student 

-- top with ties yeb2a m3aha 3latul --> order by 
-- ==============================================
-- hena lw akhr 7aga f el order by metrara betakhodha

SELECT top(3) with TIES * from Student order by St_Fname desc

SELECT top(3) with TIES * from Instructor order by  Salary desc 

----------------------------------------------------------------------------------------------------------------------------------------------------------

-- newid() --> Global universal id (GUID) =====> unique and randomized id 3la mostwa el server msh el table
-- =========================================================================================================

select newid() as id

select * , newid() AS uniID
FROM Student 

select * 
FROM Student
order by newid()

select top(3)* 
FROM Student
order by newid()

----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Execution order
-- ================

-- awel 7aga : ---> 3ayz a3rf meen el tables ely shaghal 3aleha :
-- from - join - on
-- tany 7aga : ---> filter rows 3ayz a3rf meeen el rows ely hashtghl 3aleha w meen el rows ely msh hashtghl 3aleha :
-- where
-- b3d kda momkn a2sm el ba2y l-groups :
-- group by
-- A filter el group :
-- Having [el agg ely m3 el having m3 el having]
-- b3d kda ashof 3ayz a3rd eh :
-- select [distinct ++ agg]
-- artb :
-- order by
-- w b3d kda f el akher a3ml top :
-- top

SELECT St_Fname + ' ' + St_Lname as fullname
From Student 
order by fullname 

SELECT St_Fname + ' ' + St_Lname as fullname
From Student 
where fullname = 'ahmed ali' -- f de leha 7alen ====>

-- el awel 
-- =======
SELECT St_Fname + ' ' + St_Lname as fullname
From Student 
where St_Fname + ' ' + St_Lname = 'ahmed ali'

-- el tany
-- =======
SELECT * 
from (SELECT St_Fname + ' ' + St_Lname as fullname
From Student ) as NewTable
where fullname = 'ahmed ali'

-- hena el inner haytnfz el awel ekmno 3nd el from f yezhr el memory 7aga esmha fullname f ye2dr ye3ml where 3shan el where m3 el from ely bara msh ely gowa
-- ay subquery blzaat m3 el from lazm yeb2a leha alias name (ka2nk bt-create table f el runtime f lazm yeb2a esmo eh y3ni)

----------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT @@SERVERNAME;

-- FULL PATH LL object
-- ===================

SELECT * from [nour-Lenovo-ideapad-520-15IKB].ITI.dbo.Student
-- [serverName].dbName.schemaName.objectName

-- w momkn te3ml kda 3la tul lw data mawgoda f db tanya ===> 
SELECT * from Company.dbo.Employee

-- yenf3 b2a te3ml union aw join ma been two diff db w momkn kman yeb2a b eeen 2 server bs lazm el etnen yeb2o sql server
SELECT dname
from Company.dbo.Departments
union ALL 
SELECT Dept_Name 
from Department 

----------------------------------------------------------------------------------------------------------------------------------------------------------

-- select     into 
-- ===============

-- da msh DQL la da DDL (data defintion language)
-- bey3ml table copy / paste ==> by-create table bdlalt table tany

SELECT * into table2
from Student 

-- enma da kda ghalat ==>
SELECT * into Student 
from Student -- 3shan already feeh table esmo student

-- yenf3 a copy / paste el table f db tanya aw f server tany lw ana 3ayz ==> 
SELECT * into Company.dbo.student
from Student

-- yenf3 akhod goz2 msh el table kolo ==>
SELECT St_id,st_fname into tab3 
from Student
where st_address = 'alex'

-- de kda ba3ml condition msh hayt72e2 f han2l ele structure bs y3ni mafesh data el data fadya (kolha b NULL) aknk bt-create table bet3ml el steucture beta3o
SELECT * into tab4
from student
where 1 =2

SELECT * into tab5
from student
where St_Age  <  -1000

-- insert into m3 el select    into
-- ================================
--insert based on select
-- =====================
-- de betn2l data mn table mawgod l table tany mawgod w lazm el 2 table yeb2o nafs el structure [k2n el mawdo3 da subquery 3mlt select w rametha LL insert] ===>
insert INTO tab3 
select st_id,st_fname from Student 

----------------------------------------------------------------------------------------------------------------------------------------------------------

-- ezay A-run - HAVING - mn gher - GROUB BY - "Special Case" :
-- =========================================================
--> lw kanet el select feha AGG FN ONLY 
SELECT sum(salary)
From Instructor
Having COUNT (Ins_Id ) < 100

SELECT sum(salary)
From Instructor
Where COUNT (Ins_Id ) > 100 -- error
