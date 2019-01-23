
--MAR-21*2 -- add primary key
use Diamond

if not exists(
select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'Primary key' and CONSTRAINT_NAME = 'PK_ProductType'
)

ALTER TABLE dw.ProductType
ADD CONSTRAINT PK_ProductType PRIMARY KEY CLUSTERED (ProductTypeID);  
