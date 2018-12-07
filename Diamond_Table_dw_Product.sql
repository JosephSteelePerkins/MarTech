--Release00003 - create table
--Build00001

use Diamond

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Product')
begin
print 'do nothing'
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