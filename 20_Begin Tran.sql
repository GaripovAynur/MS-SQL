create table dbo.test (id INT IDENTITY(1,1), name VARCHAR(10), amount INT)

--window A
BEGIN TRAN
INSERT INTO dbo.test (name, amount)
VALUES ('apple', 10), ('orange', 10);

COMMIT TRAN

select * 
from dbo.test;

BEGIN TRAN

UPDATE dbo.test
SET amount = amount - 1 
WHERE name = 'apple';

COMMIT WORK

select * 
from dbo.test;

BEGIN TRAN 

UPDATE dbo.test
SET amount = 0 
WHERE name = 'apple';

ROLLBACK WORK 

select * 
from dbo.test;

DROP TABLE dbo.test;