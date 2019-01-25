
--MAR-24 -- rollback

use Diamond

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'Foreign key' and CONSTRAINT_NAME = 'FK_Membership_DespatchMethod' and TABLE_NAME = 'Membership')
ALTER TABLE Diamond.dw.Membership drop constraint FK_Membership_DespatchMethod

IF EXISTS (select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Membership' and column_name = 'DespatchMethodID')
ALTER TABLE dw.Membership drop column DespatchMethodID 

if exists(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='DespatchMethod')
drop table dw.DespatchMethod