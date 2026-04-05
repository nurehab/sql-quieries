alter table emp add CONSTRAINT c100 check (hour_rate > 100)

alter table emp drop constraint c3

-- tasfer 000 el id === reset el id
DBCC CHECKIDENT ('emp', RESEED, 0);

-- el a7aga ely sa3ba a3mlha bl constraint ====>
--xxxxxxxxxx     constraint ----> New Data 
--xxxxxxxxxx     constraint ----> shared 
--xxxxxxxxxx     Datatype   ----> Constraint   Default  


-- Rule 
-- ====
CREATE rule r1 as @x>1000

sp_bindrule r1,'instructor.salary'

sp_unbindrule r1,'instructor.salary'

drop rule r1


-- Default 
-- =======

CREATE default def1 as 5000

sp_bindefault def1,'instructor.salary'

sp_unbindefault def1,'instructor.salary'

drop default def1

-- Create Datatype (Custom Datatype)  ====> complexDT (int         >1000    default value 5000)
 sp_addtype complexDT, 'int'

 sp_bindrule r1,complexDT
 sp_bindefault def1,complexDT
 
 
 create TABLE test3 (
 id int,
 name varchar(20),
 salary complexDT
 )