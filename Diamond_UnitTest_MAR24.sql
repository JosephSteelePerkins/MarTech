
--MAR-24*99

use Diamond


insert into ad.test (BuildID, TestType, TestDescription, TestCount1,TestCount2)
SELECT $(BuildID), 'Unit','Test DespatchMethod table exists',1,(select count(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='DespatchMethod' and TABLE_SCHEMA = 'dw')
union
SELECT $(BuildID), 'Unit','Test FK_Membership_DespatchMethod exists',1,(select count(1) from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'Foreign key' and CONSTRAINT_NAME = 'FK_Membership_DespatchMethod' and TABLE_NAME = 'Membership')
union
SELECT $(BuildID), 'Unit','Test DespatchMethodID column exists in Membership Table',1,(select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Membership' and column_name = 'DespatchMethodID')
