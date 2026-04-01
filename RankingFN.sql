-- Ranking FN
-- ==========
-- Row_Number()
-- Dense_rank()
-- NTiles(Group)
-- Rank()

----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Row_Number()
-- ============

-- el syntax beta3ha ---> select *, Row_Number() over (order by sal desc) as RN
-- betrtb w te3ml coloumn feeeh sequential numbers (arkam bl taslsol) ---> 1 2 3 4 5 6 7 8 9 .....


-- Dense_rank()
-- ============

-- el syntax beta3ha ---> select *, Dense_rank() over (order by sal desc) as DR
-- nafs el Row_Number bs el far2 el coloumn ely beyt3ml el arkam feeh batre2a mo3na 
-- y3ni el values beta3t el 7aga ely ma3molha order by betakhod nafs el rank y3nii lw etrtb en feeh 2 rows el sal fehom b 10000 w homa awel 2 el nums beta3thom hatb2a 1 1


-- NTile(GROUP) NTile === Number of tiles
-- ======================================

-- nafs el syntax w kol 7aga ---> select *, Ntile(3) over (order by sal desc) as G
-- btsa3dk enk te2sm el table l groups y3ni enta ely te7dd el table da 3ebara 3n kam group 3shan bona2n 3aleh te3ml f conditions
-- efrd 3ayz te2sm table l 3 group w el table da 3ebara 3n 14 row hattsrf ezay 3shan mayb2ash feeh zolm w laghbta
-- hwa hena beyrtb el nas bl sal w b3d m yertb 3ayz ye2sm l 3 group w el table feeh 14 row f kda hayb2a feeeh na2s
-- el na2s da daymn ll groups el akher awel group hwa ely beyakhod el ta3wed w el na2s da mayzedsh 3n 1
-- y3ni homa delw2ty 14 row F ---> 5 , 5 , 4 || 13 row ---> 5 , 4 , 4
-- w el arkam bta3t coloumn el group betb2a b taslsol bardo y3ni el 14 row --> 1,1,1,1,1,2,2,2,2,2,3,3,3,3


-- Rank()
-- ======

-- nafs el syntax w kol 7aga ---> select *, Rank() over (order by sal desc) as R
-- nafs el dense_rank mn esmha bs f tarteb el arkam el coloumn ely bet3mlo beyb2a mokhtlf 7abten talata 3n el dense_rank
-- yeni el dense_rank kanet betrtb 3la asas el ties (el shabah b3d) y3ni kanet bet3ml kda --> 1,1,2,2,2,3,3,3,4,5
-- enma el rank b2a lw awel etnen row zy b3d hat3ml kda ---> 1,1,3 || tb lw awel talata zy b3d --> 1,1,1,4


-- Notes
-- =====
-- el kalam da kol bey7sl f el RUNTIME bs
-- KOLHOM beyego m3 el select 
-- w m3 el shoghl da kolom yenf3 a3ml m3ahom where w a3esh b2a m3 el conditions
-- ana bafkr f el top el awel manf3tsh baro7 ll ranking Fns
-- el ranking Fns beyb2a feha subquery f el supquery akher 7aga bafkr feha
--  la yofdl estkhdam 2 or 3 Ranking Fn m3 b3d f nafs el query hwa 3ady bs la yofdl 3shan hay7sl laghbta w tashatot f case lw el order f kol ranking fn mokhtlf 3n el tany f el output beta3 el query hayb2a shaklo moshtet gdnnn w hay2sr gamed f el preformance hayb2a bate2 gdn gdn by3ml 7aga esmha (Multiple Sorts)
-- m3 el ranking fn el subquery hya el sadek el sadok ely benn7tghom 3shan lezom el felter l2n hena el where btt-excute b4 el select f hwa hay3rf el alias name ely enta 3amlo 3la ay asas f hayb2a 3la asas el subquery f el subquery hena 7aga must be 
