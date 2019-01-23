--MAR-21*4 -- create foreign key
use Diamond

if not exists(
select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'Foreign key' and CONSTRAINT_NAME = 'FK_Product_ProductType' and TABLE_NAME = 'Product'
)

ALTER TABLE Diamond.dw.Product
ADD CONSTRAINT FK_Product_ProductType FOREIGN KEY (ProductTypeID)   
    REFERENCES Diamond.dw.ProductType (ProductTypeID)