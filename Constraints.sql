create table Dept
(
Dept_id int primary key,
dname varchar(20)

)

create table emp (
eid int identity(1,1),
ename varchar(20),
eadd varchar (20) default 'alex',
hiredate date DEFAULT GETDATE(),
sal int,
overtime int, 
netsal as (isnull(sal,0)+ isnull(overtime,0)) persisted,
BD date,
age as (year(getdate())-year(BD)) ,
gender varchar(1),
hour_rate int not null,
did int,
constraint c1 primary key (eid,ename),
constraint c2 unique (sal),
constraint c3 unique (overtime),
constraint c4 check (sal>1000),
constraint c5 check (eadd in ('cairo','mansoura','alex')),
constraint c6 check (gender ='F' or gender ='M'),
constraint c7 check (overtime between 100 and 500),
constraint c8 foreign key(did) references dept(dept_id)
on delete set Null on update cascade
)