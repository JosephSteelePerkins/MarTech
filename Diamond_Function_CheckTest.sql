
--build00001

use Diamond

IF exists (select 1 from sys.objects where type_desc = 'SQL_SCALAR_FUNCTION' and  name = 'CheckTest')
BEGIN
    DROP FUNCTION AD.CheckTest
END
GO



create function AD.CheckTest (@BuildID as varchar(20))
returns bit
begin

Declare @TestCount int
Declare @Output bit

select @TestCount = count(1) 
from Diamond.ad.Test
where BuildID = 'Build00001'
and isnull(TestCount1,'') <> isnull(TestCount2,'')

if @TestCount = 0 
set @Output = 1
else
set @Output = 0

return @Output

end