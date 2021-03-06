--Release00004*01
--Build00001*60

use Diamond

if exists (select * from sys.database_principals where  Type = 'R' and name = 'Analysts')
drop ROLE [Analysts]

USE [Diamond]
GO
CREATE ROLE [Analysts]
GO
use [Diamond]
GO
GRANT SELECT ON SCHEMA::[DW] TO [Analysts]
GO
use [Diamond]
GO
DENY VIEW CHANGE TRACKING ON SCHEMA::[DW] TO [Analysts]
GO
