USE Diamond
GO

if exists (select * from sys.database_principals where  Type = 'S' and name = 'Analyst')
drop user Analyst

if exists (select * from sys.database_principals where  Type = 'R' and name = 'Analysts')
drop ROLE [Analysts]

if exists (select 1 from master.dbo.syslogins where loginname = 'Analyst')
drop login Analyst

delete from ad.Test where release = 'release00001'