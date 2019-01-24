
--MAR-21*99

use Diamond

declare @Release varchar(20) 

set @Release = 'MAR-21'

insert into ad.test (BuildID, TestType, TestDescription, TestCount1,TestCount2)
SELECT @Release, 'Unit','Test ProductType table exists',1,(select count(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ProductType' and TABLE_SCHEMA = 'dw')
union
SELECT @Release, 'Unit','Test FK_Product_ProductType exists',1,(select count(1) from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'Foreign key' and CONSTRAINT_NAME = 'FK_Product_ProductType' and TABLE_NAME = 'Product')
union
SELECT @Release, 'Unit','Test ProductTypeID column exists in Product Table',1,(select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'product' and column_name = 'ProductTypeID')
