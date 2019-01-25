--MAR-23*4 -- create foreign key
use Diamond

if not exists(
select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'Foreign key' and CONSTRAINT_NAME = 'FK_Membership_SubscriptionStatus' and TABLE_NAME = 'Membership'
)

ALTER TABLE Diamond.dw.Membership
ADD CONSTRAINT FK_Membership_SubscriptionStatus FOREIGN KEY (SubscriptionStatusID)   
    REFERENCES Diamond.dw.SubscriptionStatus (SubscriptionStatusID)