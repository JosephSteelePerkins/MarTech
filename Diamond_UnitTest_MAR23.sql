
--MAR-23*99

use Diamond


insert into ad.test (BuildID, TestType, TestDescription, TestCount1,TestCount2)
SELECT $(BuildID), 'Unit','Test ProductType table exists',1,(select count(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='SubscriptionStatus' and TABLE_SCHEMA = 'dw')
union
SELECT $(BuildID), 'Unit','Test FK_Product_ProductType exists',1,(select count(1) from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'Foreign key' and CONSTRAINT_NAME = 'FK_Membership_SubscriptionStatus' and TABLE_NAME = 'Membership')
union
SELECT $(BuildID), 'Unit','Test ProductTypeID column exists in Product Table',1,(select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Membership' and column_name = 'SubscriptionStatusID')
