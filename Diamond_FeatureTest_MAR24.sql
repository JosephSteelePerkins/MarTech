

--MAR-24*99

use Diamond

insert into ad.test (BuildID, TestType, TestDescription, TestCount1,TestCount2)
SELECT $(BuildID), 'Feature','Test Digital exists in ProductType',1,(select count(1) FROM dw.DespatchMethod where DespatchMethod = 'Digital')
union
SELECT $(BuildID), 'Feature','Test Physical in ProductType',1,(select count(1) FROM dw.DespatchMethod where DespatchMethod = 'Physical')


