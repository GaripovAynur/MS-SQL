DECLARE @sql NVARCHAR(4000);

CREATE TABLE dbo.test_dynamic
	(id INT IDENTITY(1,1),
	 name VARCHAR(10));

INSERT INTO dbo.test_dynamic(name)
VALUES ('abc');

SELECT SCOPE_IDENTITY() as id_abc;

SET @sql = 'INSERT INTO dbo.test_dynamic(name)
		VALUES (''dynamic'')';

EXEC sp_executesql @sql;

--in new session 
INSERT INTO dbo.test_dynamic(name)
VALUES ('test3');

SELECT SCOPE_IDENTITY() AS id, @@IDENTITY, IDENT_CURRENT('dbo.test_dynamic');

SELECT * FROM dbo.test_dynamic;

DROP TABLE dbo.test_dynamic;
