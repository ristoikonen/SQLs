USE TODO

DECLARE @json AS VARCHAR(MAX);
DECLARE @s1 AS VARCHAR(MAX);

SET @json = 
(
SELECT TOp 100
		[todoid]
      ,[name]
      ,[details]
      ,[dodate]
      ,[userid]
FROM Todo
FOR JSON PATH
)

PRINT @json

SELECT *
FROM OPENJSON(@json) WITH (
    --id INT 'strict $.id',
    [name] NVARCHAR(50) '$.name',
    details NVARCHAR(50) '$.details',
    dodate DATETIME2 '$.dodate'
);

SET @s1 = 
(
SELECT *
FROM
(
	SELECT *
	FROM OPENJSON(@json) WITH (
		[name] NVARCHAR(50) '$.name',
		details NVARCHAR(50) '$.details',
		dodate DATETIME2 '$.dodate'
	)
) q
FOR JSON PATH
)

PRINT @s1


--DECLARE @json2 NVARCHAR(MAX);

--SET @json2 = N'[
--  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
--  {"id": 5, "info": {"name": "Jane", "surname": "Smith"}, "dob": "2005-11-04T12:00:00"}
--]';

--SELECT *
--FROM OPENJSON(@json2) WITH (
--    id INT 'strict $.id',
--    firstName NVARCHAR(50) '$.info.name',
--    lastName NVARCHAR(50) '$.info.surname',
--    age INT,
--    dateOfBirth DATETIME2 '$.dob'
--);



