-- Variables
-- =========
-- Local - Global

-- local variables
-- ===============

-- betb2a f el batch (batch = query ely ana 3amel 3aleh highlight) - Functions - Stored procedure
-- 1st step ==>
Decalre @x int
-- tb lw 3ayz A-intalize default value 3la tul ===> 
Declare @x = 10
-- f aktr mn tare2a to7t beha value ll local variable : 
-- 1st way ====>
set @x=10
-- 2nd way ====> 
select @x=100
-- 3rd way ====>
SELECT @x = age from student where id = 1
-- 4rd way ====>
-- hena by3ml (2 query * 1 ) query = update * select
update student set fname ='omar',@x=age where id = 9

-- lw 3ayz a3rd ===>
select @x



-- Global Variables
-- ================

-- la yenf3 a declare wla A-assign y3ni a7ot values
-- hya mogrd variables gahza gowa el server ana bastkhdmha 3la tul + bett2sr b ely bey7sl f el server
-- f ely a2dr a3mlo beha ==> eny a3rd el values beta3t el variables de
-- betbd2 b @@
-- bett2sr b akher statement ana 3mltlha run

SELECT @@servername
-- de mn esmha betrg3 esm el server ely enta shaghal 3aleh ely hwa ghalebn nafs esm el gehaz beta3k
Select @@rowcount
-- 3ayz a3rd kam row et2sr (affected) mn akher statement (zy update delete select ay 7aga) ana 3mltlha run
Select @@version
-- beyrg3 version el sql server ely enta shaghal 3aleha w de mofeda gedn f 7etet en feeeh quiries msh betshtghl 3la kol el engines 
select @@error
-- lw gab 0 yeb2a el query ely ana lesa 3amlo run da salem ,, lw gab rakam yeb2a el query ely lesa runo da gab error w da rakam el error msg ely gowa el sql el server l2n kol el messages de asln hya already saved f el sql server w mam3ola b arkam 
Select @@identity
-- 7aga shabah el auto increament 
-- beurg3 akhr identity dakhal f el table mn akher insert 
-- y3ni runet insert 3la tabel feeh identity w 3awz te3rf rakam el value beta3t el identity t2olo el statmennt de b2a
-- tb efrd enta runet insert 3la table mafehosh identity f lw te3ml el statement hay3rdlk NULL

-- Feeeh Global Variables keter awy gher dol


-- TIPS:
-- ====
-- a2dr A-asign (a7ot) el value beta3t el global gowa local enma el 3ks aked ma2drsh ===> 
select @x=@@rowcount