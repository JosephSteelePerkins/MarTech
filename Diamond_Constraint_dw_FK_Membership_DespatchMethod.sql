--MAR-24*4 -- create foreign key
use Diamond

if not exists(
select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'Foreign key' and CONSTRAINT_NAME = 'FK_Membership_DespatchMethod' and TABLE_NAME = 'Membership'
)

ALTER TABLE Diamond.dw.Membership
ADD CONSTRAINT FK_Membership_DespatchMethod FOREIGN KEY (DespatchMethodID)   
    REFERENCES Diamond.dw.DespatchMethod (DespatchMethodID)