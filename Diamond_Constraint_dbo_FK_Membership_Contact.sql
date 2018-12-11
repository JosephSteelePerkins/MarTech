--Release00005*90
--Build00001*90

use Diamond

IF EXISTS (select constraint_name FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE constraint_name = 'FK_Membership_Contact')
ALTER TABLE Diamond.dw.Membership drop CONSTRAINT FK_Membership_Contact

ALTER TABLE Diamond.dw.Membership 
ADD CONSTRAINT FK_Membership_Contact FOREIGN KEY (ContactID)     
    REFERENCES Diamond.dw.Contact (ContactID)