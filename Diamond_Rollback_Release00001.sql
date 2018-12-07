

USE [master]
GO

IF (EXISTS (SELECT name 
FROM master.dbo.sysdatabases 
WHERE name = 'Diamond'))
begin
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'Diamond'
ALTER DATABASE [Diamond] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE [Diamond]
end

delete from Diamond.ad.test where release = '00001'