
--Build00001

use master

if exists(
select 1 from master.dbo.sysdatabases where name = 'Diamond')
DROP DATABASE Diamond

if exists(
select * from master.sys.server_principals where name = 'Analyst')
drop login Analyst
