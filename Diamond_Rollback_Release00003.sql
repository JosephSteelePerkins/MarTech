USE Diamond
GO

IF EXISTS (select constraint_name FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE constraint_name = 'FK_Membership_Product')
ALTER TABLE Diamond.dw.Membership 
drop CONSTRAINT FK_Membership_Product 

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Product')
drop table Diamond.dw.product

delete from Diamond.ad.test where release = 'Release00003'