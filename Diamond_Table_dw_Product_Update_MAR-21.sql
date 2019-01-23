--MAR-21*6 - populate table

update dw.Product
set ProductTypeID =
(Select ProductTypeID from dw.ProductType where ProductType = 'Subscription')
where ProductCode = 'FW001'

update dw.Product
set ProductTypeID =
(Select ProductTypeID from dw.ProductType where ProductType = 'Marketing Preference')
where ProductCode = 'FW002'


update dw.Product
set ProductTypeID =
(Select ProductTypeID from dw.ProductType where ProductType = 'Event')
where ProductCode = 'FW003'


