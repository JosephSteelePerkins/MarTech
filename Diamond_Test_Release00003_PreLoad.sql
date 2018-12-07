--Release00003*95
--Build00001*99

use Diamond

declare @Release varchar(20) 

set @Release = 'Release00003'

insert into ad.test (Release, TestType, TestDescription, TestCount1,TestCount2)
SELECT @Release, 'Unit','Test Product table has been populated',3,count(1) FROM dw.Product
union
SELECT @Release, 'Unit','Test FK_Membership_Product exists',1,count(1) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE constraint_name = 'FK_Membership_Product'
