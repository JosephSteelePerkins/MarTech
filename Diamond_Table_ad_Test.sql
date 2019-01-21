--Release00001
--build00001

use Diamond


IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Test')
begin
print 'nothing'
end
else
begin
create table ad.Test(
	TestID int identity(1,1) primary key,
	BuildID varchar(20),
	TestType varchar(10),
	TestDescription varchar(500),
	TestCount1 int,
	TestCount2 int,
	CreateDate datetime default getdate()
	)
end
