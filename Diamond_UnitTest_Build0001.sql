--Build00001*99

use Diamond

declare @Release varchar(20) 

set @Release = 'Build00001'

insert into ad.test (Release, TestType, TestDescription, TestCount1,TestCount2)
SELECT @Release, 'Unit','Test Contact table exists',1,count(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Contact' and TABLE_SCHEMA = 'dw'
union
SELECT @Release, 'Unit','Test Membership table exists',1,count(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Membership' and TABLE_SCHEMA = 'dw'
union
SELECT @Release, 'Unit','Test FK_Membership_Contact exists',1,count(1) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE constraint_name = 'FK_Membership_Contact'

insert into ad.test (Release, TestType, TestDescription, TestCount1,TestCount2)
SELECT @Release, 'Unit','Test DeletedInSource has been added to Contact',1, 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Contact' and TABLE_SCHEMA = 'dw' and column_name = 'DeletedInSource'
union
SELECT @Release, 'Unit','Test DeletedInSource has been added to Membership',1, 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Membership' and TABLE_SCHEMA = 'dw' and column_name = 'DeletedInSource'

insert into ad.test (Release, TestType, TestDescription, TestCount1,TestCount2)
SELECT @Release, 'Unit','Test Product table has been populated',3,count(1) FROM dw.Product
union
SELECT @Release, 'Unit','Test FK_Membership_Product exists',1,count(1) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE constraint_name = 'FK_Membership_Product'

insert into ad.test (Release, TestType, TestDescription, TestCount1,TestCount2)
SELECT @Release, 'Unit','Test Analyst role exists',1,count(1) FROM sys.database_principals where  Type = 'R' and name = 'Analysts'
union
SELECT @Release, 'Unit','Test Analyst login exists',1,count(1) FROM master.dbo.syslogins where loginname = 'Analyst'