--Release00003*90
--Build00001*90

IF NOT EXISTS (select constraint_name FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE constraint_name = 'FK_Membership_Product')
ALTER TABLE Diamond.dw.Membership 
ADD CONSTRAINT FK_Membership_Product FOREIGN KEY (ProductCode)     
    REFERENCES Diamond.dw.Product (ProductCode)