USE [master]
GO

IF EXISTS (select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Contact' and TABLE_SCHEMA = 'dw' and column_name = 'DeletedInSource') alter table dw.Contact drop DeletedInSource
IF EXISTS (select 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_name = 'Membership' and TABLE_SCHEMA = 'dw' and column_name = 'DeletedInSource') alter table dw.Membership drop DeletedInSource

delete from Diamond.ad.test where release = 'Release00002'