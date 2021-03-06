--Release00004*02
--Build00001*61

use Diamond

if exists (select 1 from sys.database_principals where  Type = 'S' and name = 'Analyst')
drop user Analyst

go

if exists (select 1 from master.dbo.syslogins where loginname = 'Analyst')
drop login Analyst

go

USE [master]
GO
CREATE LOGIN [Analyst] WITH PASSWORD=N'Analyst', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Diamond]
GO
CREATE USER [Analyst] FOR LOGIN [Analyst]
GO
USE [Diamond]
GO
ALTER ROLE [Analysts] ADD MEMBER [Analyst]
GO
