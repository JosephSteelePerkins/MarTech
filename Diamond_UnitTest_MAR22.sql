
--MAR-22*99

use Diamond

--declare @Release varchar(20) 

-- set @Release = 'MAR-22'

insert into ad.test (BuildID, TestType, TestDescription, TestCount1,TestCount2)
SELECT $(BuildID), 'Unit','Test ProductType table exists',1,(select count(1) FROM diamond.dw.Product where productcode = 'FG001')
