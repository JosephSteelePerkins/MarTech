--Release00001*02 -- Create DW schema
--Build00001*02

use Diamond

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'DW')
BEGIN
EXEC('CREATE SCHEMA DW')
END

