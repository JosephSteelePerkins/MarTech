--Release00001
--Release00002 - add DeletedInSource
--Release00005 - add SourceContactID field
--Build00001
--MAR-24*01

use Diamond

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Membership')
begin
IF not EXISTS (select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Membership' and TABLE_SCHEMA = 'dw' and column_name = 'DeletedInSource') alter table dw.Membership add DeletedInSource bit
IF not EXISTS (select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Membership' and TABLE_SCHEMA = 'dw' and column_name = 'SourceContactID') alter table dw.Membership add SourceContactID nvarchar(100)
IF not EXISTS (select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Membership' and TABLE_SCHEMA = 'dw' and column_name = 'DespatchMethodID') alter table dw.Membership add DespatchMethodID int

end
else
begin
create table dw.Membership(
	MembershipID int identity(1,1) primary key,
	ContactID int,
	Source nvarchar(100),
	Market nvarchar(100),
	SourceContactID nvarchar(100),
	ProductCode varchar(7),
	Status varchar(100),
	SourceCreateDate datetime,
	SourceLastUpdateDate datetime,
	CreateDate datetime default getdate(),
	DeletedInSource bit,
	DespatchMethodID int
	)
end

