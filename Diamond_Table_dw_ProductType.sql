
--MAR-21*1 -- create table

use Diamond

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ProductType')
begin
print 'do nothing'
end
else
begin
create table dw.ProductType(
	ProductTypeID int identity(1,1),
	ProductType varchar(200)
	)
end