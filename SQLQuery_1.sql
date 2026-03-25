-- DDL
CREATE TABLE emp
(
    eid int PRIMARY KEY,
    ename VARCHAR(20) NOT NULL ,
    eage INT,
    eadd VARCHAR(20) default 'cairo',
    hiredate DATE default getdate(),
    Dnum INT

)

ALTER TABLE emp add sal INT

ALTER TABLE emp ALTER COLUMN sal bigint

ALTER TABLE emp drop COLUMN sal

drop TABLE emp

----------------------------------

-- DML
-- insert update delete 
INSERT into emp
VALUES(1,'ali',NULL,'alex','1/1/2010',NULL)

INSERT into emp (ename,eid)
VALUES('eman',2)

-- insert constructor
insert into emp (ename,eid)
VALUES('eman',8),('ehab',12),('nada',7)

-- update
UPDATE emp 
set ename = 'omar' WHERE eid = 1

UPDATE emp 
set ename = 'omar', eage=22 WHERE eid = 1

UPDATE emp 
set eage +=1

-- select
select * from emp

-- DQL
SELECT * FROM emp

SELECT ename,eid FROM emp

SELECT ename,eid FROM emp WHERE eage >=25
