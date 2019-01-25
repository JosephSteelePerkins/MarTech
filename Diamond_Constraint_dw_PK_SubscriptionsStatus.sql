
--MAR-23*2 -- add primary key
use Diamond

if not exists(
select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'Primary key' and CONSTRAINT_NAME = 'PK_SubscriptionStatus'
)

ALTER TABLE dw.SubscriptionStatus
ADD CONSTRAINT PK_SubscriptionStatus PRIMARY KEY CLUSTERED (SubscriptionStatusID);  
