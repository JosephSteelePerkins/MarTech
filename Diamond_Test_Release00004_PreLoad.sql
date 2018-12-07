--Release00004*95
--Build00001*99

use Diamond

declare @Release varchar(20) 

set @Release = 'Release00004'

insert into ad.test (Release, TestType, TestDescription, TestCount1,TestCount2)
SELECT @Release, 'Unit','Test Analyst role exists',1,count(1) FROM sys.database_principals where  Type = 'R' and name = 'Analysts'
union
SELECT @Release, 'Unit','Test Analyst login exists',1,count(1) FROM master.dbo.syslogins where loginname = 'Analyst'

