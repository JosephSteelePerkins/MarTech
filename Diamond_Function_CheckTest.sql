
--build00001

use Diamond

IF exists (select 1 from sys.objects where type_desc = 'SQL_SCALAR_FUNCTION' and  name = 'CheckTest')
BEGIN
    DROP FUNCTION AD.CheckTest
END
GO

create function AD.CheckTest (@BuildID as varchar(20))
returns int
begin

Declare @TestCount int
Declare @Output int
Declare @NoOfRows int

--declare @BuildID varchar(20) = 'Build00001'
-- if there are no test cases then return -1

select @NoOfRows = count(1)
from Diamond.ad.Test
where BuildID = @BuildID

select @TestCount = count(1) 
from Diamond.ad.Test
where BuildID = @BuildID
and isnull(TestCount1,'') <> isnull(TestCount2,'')


if @NoOfRows = 0
set @Output = -1
else
	if @TestCount = 0 
	set @Output = 1
	else
	set @Output = 0

return @Output

end