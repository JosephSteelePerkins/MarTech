--Release00001*91
--Build00001*99

use Diamond

declare @Release varchar(20) 

set @Release = 'Release00001'

insert into ad.test (Release, TestType, TestDescription, TestCount1,TestCount2)
SELECT @Release, 'Unit','Test Contact table exists',1,count(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Contact' and TABLE_SCHEMA = 'dw'
union
SELECT @Release, 'Unit','Test Membership table exists',1,count(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Membership' and TABLE_SCHEMA = 'dw'
union
SELECT @Release, 'Unit','Test FK_Membership_Contact exists',1,count(1) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE constraint_name = 'FK_Membership_Contact'
