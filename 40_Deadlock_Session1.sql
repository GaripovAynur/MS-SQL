--SET DEADLOCK_PRIORITY NORMAL
BEGIN TRAN

SELECT PersonId, FullName, PreferredName,  PhoneNumber
FROM Application.People
WHERE FullName = 'Kayla Woodcock'
AND IsEmployee = 1;

UPDATE Application.People
SET PreferredName = 'Kaila'
WHERE PersonID = 2;

UPDATE Sales.Orders
SET SalespersonPersonID = 16
WHERE SalespersonPersonID = 2
	AND OrderId IN (73535, 73537, 73545);
 
ROLLBACK TRAN