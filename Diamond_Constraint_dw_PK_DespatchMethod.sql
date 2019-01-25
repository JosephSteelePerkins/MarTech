
--MAR-24*2 -- add primary key
use Diamond

if not exists(
select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE = 'Primary key' and CONSTRAINT_NAME = 'PK_DespatchMethod'
)

ALTER TABLE dw.DespatchMethod
ADD CONSTRAINT PK_DespatchMethod PRIMARY KEY CLUSTERED (DespatchMethodID);  
