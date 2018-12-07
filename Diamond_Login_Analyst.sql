--Release00004*02
--Build00001*02

use Diamond

if exists (select 1 from sys.database_principals where  Type = 'S' and name = 'Analyst')
drop user Analyst

if exists (select 1 from master.dbo.syslogins where loginname = 'Analyst')
drop login Analyst

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
