--Release00001 - table created
--Release00002 - DeletedInSource field added
--Build00001

use Diamond


IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Contact')
begin
IF not EXISTS (select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Contact' and TABLE_SCHEMA = 'dw' and column_name = 'DeletedInSource') alter table dw.Contact add DeletedInSource bit
end
else
begin
create table dw.Contact(
	ContactID int identity(1,1) primary key,
	Source nvarchar(100),
	Market nvarchar(100),
	SourceContactID nvarchar(100),
	FirstName nvarchar(150),
	Surname nvarchar(150),
	EmailAddress nvarchar(255),
	CompanyName nvarchar(150),
	AddressLine1 nvarchar(150),
	AddressLine2 nvarchar(150),
	AddressLine3 nvarchar(150),
	AddressLine4 nvarchar(150),
	City nvarchar(150),
	PostCode nvarchar(150),
	County nvarchar(150),
	Country nvarchar(150),
	Telephone nvarchar(150),
	SourceCreateDate datetime,
	SourceLastUpdateDate datetime,
	CreateDate datetime default getdate(),
	DeletedInSource bit
	)
end
