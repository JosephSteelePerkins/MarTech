
--MAR-24*1 -- create table

use Diamond

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='DespatchMethod')
begin
print 'do nothing'
end
else
begin
create table dw.DespatchMethod(
	DespatchMethodID int identity(1,1),
	DespatchMethod varchar(200)
	)
end