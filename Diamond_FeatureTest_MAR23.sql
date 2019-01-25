

--MAR-23*99

use Diamond


insert into ad.test (BuildID, TestType, TestDescription, TestCount1,TestCount2)
SELECT $(BuildID), 'Feature','Test Active exists in SubscriptionStatus',1,(select count(1) FROM dw.SubscriptionStatus where SubscriptionStatus = 'Active')
union
SELECT $(BuildID), 'Feature','Test Inactive exists in SubscriptionStatus',1,(select count(1) FROM dw.SubscriptionStatus where SubscriptionStatus = 'InActive')
