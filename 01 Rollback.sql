
SELECT * FROM 
(
SELECT YEAR(ord.OrderDate) as SalesYear,
        ord.OrderId
 FROM Sales.Orders AS ord
) AS Sales
PIVOT (COUNT(OrderId)
FOR SalesYear IN ([2013],[2014],[2015],[2016]))
as PVT


SELECT City.CityId, City.CityName, City.LatestRecordedPopulation, Acc.*
FROM Application.Cities AS City
	CROSS APPLY Application.DetermineCustomerAccess(City.CityId) AS Acc
ORDER BY City.CityId, City.CityName


DROP TABLE IF EXISTS dbo.test;
CREATE TABLE dbo.test (id INT, name VARCHAR(50));

BEGIN TRAN A1

	INSERT INTO dbo.test (id, name)
	VALUES (1, 'alice');

	PRINT N'Transaction count after BEGIN A1 = '  
		+ CAST(@@TRANCOUNT AS nvarchar(10));  

	BEGIN TRAN A2
	INSERT INTO dbo.test (id, name)
	VALUES (2, 'bob');

	PRINT N'Transaction count after BEGIN A2 = '  
		+ CAST(@@TRANCOUNT AS nvarchar(10));  

		BEGIN TRAN A3
		INSERT INTO dbo.test (id, name)
		VALUES (3, 'john');

		PRINT N'Transaction count after BEGIN A3 = '  
		+ CAST(@@TRANCOUNT AS nvarchar(10));  

		SELECT @@TRANCOUNT; 
		COMMIT TRAN
		
	PRINT N'Transaction count after close A3 = '  
		+ CAST(@@TRANCOUNT AS nvarchar(10));  

	INSERT INTO dbo.test (id, name)
	VALUES (4, 'rich');

	ROLLBACK TRAN
	PRINT N'Transaction count after close A2 = '  
		+ CAST(@@TRANCOUNT AS nvarchar(10));  
	
	SELECT * 
	FROM dbo.test;

COMMIT TRAN
PRINT N'Transaction count after close A1 = '  
		+ CAST(@@TRANCOUNT AS nvarchar(10));  

SELECT * 
FROM dbo.test;


DROP TABLE IF EXISTS dbo.test;
CREATE TABLE dbo.test (id INT, name VARCHAR(50));

BEGIN TRAN A1

	INSERT INTO dbo.test (id, name)
	VALUES (1, 'alice');

	PRINT N'Transaction count after BEGIN A1 = '  
		+ CAST(@@TRANCOUNT AS nvarchar(10));  

	BEGIN TRAN A3
		INSERT INTO dbo.test (id, name)
		VALUES (3, 'john');

		PRINT N'Transaction count after BEGIN A3 = '  
		+ CAST(@@TRANCOUNT AS nvarchar(10));  

		SELECT @@TRANCOUNT; 
		ROLLBACK TRAN

	SET XACT_ABORT ON;
	BEGIN TRAN A2
	INSERT INTO dbo.test (id, name)
	VALUES (2, 'bob');

	PRINT N'Transaction count after BEGIN A2 = '  
		+ CAST(@@TRANCOUNT AS nvarchar(10));  
		
	PRINT N'Transaction count after close A3 = '  
		+ CAST(@@TRANCOUNT AS nvarchar(10));  

	INSERT INTO dbo.test (id, name)
	VALUES (4, 'rich');
	
	COMMIT TRAN
	PRINT N'Transaction count after close A2 = '  
		+ CAST(@@TRANCOUNT AS nvarchar(10));  
	
	SELECT * 
	FROM dbo.test;

COMMIT TRAN
PRINT N'Transaction count after close A1 = '  
		+ CAST(@@TRANCOUNT AS nvarchar(10));  

SELECT * 
FROM dbo.test;