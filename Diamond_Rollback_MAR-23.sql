
--MAR-23 -- rollback

use Diamond

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'Foreign key' and CONSTRAINT_NAME = 'FK_Membership_SubscriptionStatus' 
	and TABLE_NAME = 'Membership')
ALTER TABLE Diamond.dw.Membership drop constraint FK_Membership_SubscriptionStatus

IF EXISTS (select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Membership' and column_name = 'SubscriptionID')
ALTER TABLE dw.Membership drop column SubscriptionID 

if exists(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='SubscriptionStatus')
drop table dw.SubscriptionStatus