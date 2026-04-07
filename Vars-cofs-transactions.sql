declare @x int = (select avg(st_age) from student)
select @x
SELECT @x = 10


declare @y int
select @y=st_age from student where st_id = 6
select @y


declare @y int  = 100
select @y=st_age from student where st_id = 990
select @y


declare @y int  = 100
select @y=st_age from student where st_address = 'alex'
select @y

declare @y int  = 100,@name varchar(20)
select @y=st_age,@name=st_fname from student where st_id=4
select @y,@name


declare @z int 
update student set st_fname = 'ali',@z=dept_id
where st_id = 7
select @z


declare @t table (x int)
insert into @t
select st_id from Student where st_address = 'alex'
select *  from @t



declare @x int =5
select top(@x)*
from student

select 'select * from student'

-- execute ===> covert from string to query
execute('select * from student')


-- Dynamic query ==> 
declare @col varchar(20)  = '*',@tab varchar(20) = 'instructor'
EXECUTE ('select' + @col+' from '+@tab)

-- =======================================================================================================================

-- Global variables
-- ================

select @@servername

select @@version

update student 
set st_age+=1
select @@Rowcount
select @@Rowcount -- de hatl3 wa7d l2n akher statemrnt etrun kan ely 2bleha ely kan bey3rd row wa7d ayn kan matob eh el gowah



SELECT * from stud
go
select @@error


select @@Identity -- lw 3mltlha run delw2ty akeed hatl3 NULL -- hat2sr emta : lw kont runet INSERT STATEMENT 3la table feeeh already identity w kont 3awz a3rf rakam el identity ely dakhal gowa el table kam

-- ==========================================================================================================================================================================================================================

-- control of flow statement
-- =========================
-- if
declare @x int
update student
set st_age +=1
select @x=@@ROWCOUNT
IF @x > 0
select 'Multi rows Affected'
else
select 'No Rows Affected'

-- begin
-- end
-- ====
-- doool lw feeh kaze line aw kaza query msh query wa7da l2n hena mafesh { } zy el barmga
declare @x int
update student
set st_age +=1
select @x=@@ROWCOUNT
IF @x > 0
begin
select 'Multi rows Affected'
select 'Multi rows AHMED'
end
else
select 'No Rows Affected'

-- if exists if not exists
select * from sys.tables -- hena baklm el metadata beta3t el db msh el db beta3t el db nafsha
select name from sys.tables where name = 'student'
-- lw gab anteg w b2a true :
if exists (select name from sys.tables where name = 'student')
select 'table is existed'
else
create table student (
id int,
name varchar(20)
)
-- lw false :
if exists (select name from sys.tables where name = 'students')
select 'table is existed'
else
create table students (
id int,
name varchar(20)
)
-- el check bl if not exist 
-- lw el id da malosh relation e3ml delete enma lw leeh tal3 string msg
if not exists (select dept_id from Instructor where dept_id=20 )
and not exists (select dept_id from Student  where dept_id = 20)
delete from department where dept_id =20
else 
select 'table has a relationship'
-- try / catch
begin try
delete from department where dept_id =20
end try
begin catch
select 'Error 404'
select Error_Line(), Error_Number(),Error_Message() -- more about error
end catch

-- while
-- continue
-- break
declare @x int =10
while @x <= 20
begin
	set @x +=1
	if @x = 14
	continue 
	if @x = 16
	break
	select @x
end

-- case
-- iif
-- waitfor
-- choose

-- ==========================================================================================================================================================================================================================

-- Transactions     [Set of queries]  ====> Single unit of work

create table parent (pid int PRIMARY KEY)

create table child (cid int FOREIGN KEY references parent(pid))

insert into parent values (1)
insert into parent values (2)
insert into parent values (3)
insert into parent values (4)

select * from child
truncate table child

-- hayms7 7ata lw sa7 3shan ROLLBACK
begin transaction
insert into child values (1)
insert into child values (2)
insert into child values (3)
ROLLBACK


begin transaction
insert into child values (1)
insert into child values (5)
insert into child values (3)
ROLLBACK 

begin try
begin transaction
insert into child values (1)
insert into child values (5)
insert into child values (3)
COMMIT
end try
begin catch
ROLLBACK 
end catch

begin try
begin transaction
insert into child values (1)
insert into child values (2)
insert into child values (3)
COMMIT
end try
begin catch
ROLLBACK 
end catch
