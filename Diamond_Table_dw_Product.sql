--Release00003 - create table
--Build00001
--MAR-21*3 -- add ProductTypeID field

use Diamond

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Product')
begin

IF NOT EXISTS (select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'product' and column_name = 'ProductTypeID')
ALTER TABLE dw.product ADD ProductTypeID INT


end
else
begin
create table dw.Product(
	ProductCode varchar(7) Primary Key,
	ProductName varchar(200),
	CreateDate datetime default getdate(),
	LastUpdateDate datetime
	)
end