
--MAR-23*1 -- create table

use Diamond

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='SubscriptionStatus')
begin
print 'do nothing'
end
else
begin
create table dw.SubscriptionStatus(
	SubscriptionStatusID int identity(1,1),
	SubscriptionStatus varchar(200)
	)
end