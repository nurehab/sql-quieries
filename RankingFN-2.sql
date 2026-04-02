SELECT * , Row_Number() over (order by St_Age desc) as RN
From Student 

-- de ka2nha top(1) hat baynat a3la age 3ndk
SELECT *
from
(SELECT * , Row_Number() over (order by St_Age desc) as RN
From Student) as NewTable
where RN = 1


SELECT *
from
(SELECT * , Row_Number() over ( partition by Dept_Id order by St_Age desc) as RN
From Student) as NewTable



where RN = 1



SELECT * , Dense_Rank() over (order by St_Age desc) as DR
From Student

-- hata baynat el age beta3 24 m3 el tekrar
SELECT *
from
(SELECT * , Dense_Rank() over (order by St_Age desc) as DR
From Student) as NewTable
where DR = 4

-- el partition w b3d kda beyrtb el age
SELECT *
from
(SELECT * , Dense_Rank() over ( partition by Dept_Id order by St_Age desc) as DN
From Student) as NewTable



where DN = 1





SELECT *
from
(SELECT * , NTile(4) over (order by St_Age desc) as G
From Student) as NewTable
where G = 1


--- lesa makmltsh ---