--Release00002*91
--Build00001*99

use Diamond

declare @Release varchar(20) 

set @Release = 'Release00002'

insert into ad.test (Release, TestType, TestDescription, TestCount1,TestCount2)
SELECT @Release, 'Unit','Test DeletedInSource has been added to Contact',1, 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Contact' and TABLE_SCHEMA = 'dw' and column_name = 'DeletedInSource'
union
SELECT @Release, 'Unit','Test DeletedInSource has been added to Membership',1, 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Membership' and TABLE_SCHEMA = 'dw' and column_name = 'DeletedInSource'

