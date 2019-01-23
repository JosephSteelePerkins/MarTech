
--MAR-21 -- rollback

use Diamond

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'Foreign key' and CONSTRAINT_NAME = 'FK_Product_ProductType' and TABLE_NAME = 'Product')
ALTER TABLE Diamond.dw.Product drop constraint FK_Product_ProductType

IF EXISTS (select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'product' and column_name = 'ProductTypeID')
ALTER TABLE dw.product drop column ProductTypeID 

if exists(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ProductType')
drop table dw.ProductType