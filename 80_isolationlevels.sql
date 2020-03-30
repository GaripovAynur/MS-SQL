SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT PersonId, FullName, PreferredName,  PhoneNumber
FROM Application.People
WHERE FullName = 'Kayla Woodcock'
AND IsEmployee = 1;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT PersonId, FullName, PreferredName,  PhoneNumber
FROM Application.People
WHERE FullName = 'Kayla Woodcock'
AND IsEmployee = 1;

SELECT PersonId, FullName, PreferredName,  PhoneNumber
FROM Application.People
WHERE PersonId = 3;

SELECT PersonId, FullName, PreferredName,  PhoneNumber
FROM Application.People
WHERE PersonId = 16;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRAN 
SELECT PersonId, FullName, PreferredName,  PhoneNumber
FROM Application.People
WHERE PreferredName = 'Kayla'

SELECT PersonId, FullName, PreferredName,  PhoneNumber
FROM Application.People
WHERE PersonID = 3;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRAN

UPDATE Application.People
SET PhoneNumber = '1029232'
WHERE PersonID = 3261;

UPDATE Application.People
SET PreferredName = 'Kayla'
WHERE PersonID = 3261;

ROLLBACK TRAN