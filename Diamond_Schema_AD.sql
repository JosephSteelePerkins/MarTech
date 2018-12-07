--Release00001*02 -- Create AD schema
--Build00001*02

use Diamond

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'AD')
BEGIN
EXEC('CREATE SCHEMA AD')
END

