--MAR-23*5 - populate table

use Diamond

truncate table dw.SubscriptionStatus

insert into dw.SubscriptionStatus(SubscriptionStatus)
values ('Active'),
('Inactive')