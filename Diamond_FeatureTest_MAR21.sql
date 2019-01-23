

--MAR-21*99

use Diamond

declare @Release varchar(20) 

set @Release = 'MAR-21'

delete from ad.test where BuildID = @Release and TestType = 'Feature'

insert into ad.test (BuildID, TestType, TestDescription, TestCount1,TestCount2)
SELECT @Release, 'Feature','Test Subscription exists in ProductType',1,(select count(1) FROM dw.ProductType where ProductType = 'Subscription')
union
SELECT @Release, 'Feature','Test Marketing Preference exists in ProductType',1,(select count(1) FROM dw.ProductType where ProductType = 'Marketing Preference')
union
SELECT @Release, 'Feature','Test Event exists in ProductType',1,(select count(1) FROM dw.ProductType where ProductType = 'Event')
union
SELECT @Release, 'Feature','Test ProudctCode FW001 has ProudctType Subscription',1,(select count(1) FROM dw.Product where ProductTypeID = 
	(select producttypeid from dw.Producttype where ProductType = 'Subscription') and ProductCode = 'FW001')


-- try to create a new product where producttypeid doesn't exist. Should fail

declare @ErrorInt int

begin try
insert into dw.Product(ProductCode,ProductName,ProductTypeID)
values ('Test','Test',100) 
end try
begin catch
set @ErrorInt = 1
end catch

insert into ad.test (BuildID, TestType, TestDescription, TestCount1,TestCount2)
values (@Release, 'Feature','Test adding a product with invalid ProductTypeId failes',1,@ErrorInt)


