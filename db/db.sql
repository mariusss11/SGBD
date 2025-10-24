

-- S = SQL login
-- U = Windows login
-- G = Windows group
-- E = External login
-- X = External group
-- is_disabled = 1 → login dezactivat

-- Get all logins
SELECT name, type_desc, is_disabled
FROM sys.server_principals
WHERE type IN ('S', 'E','U', 'G', 'X')
ORDER BY name;

-- Get all database users
SELECT name, type_desc
FROM sys.database_principals
WHERE type IN ('U', 'G', 'S')
ORDER BY name;

-- Get database users with their corresponding logins
SELECT dp.name AS DatabaseUser, sp.name AS ServerLogin
FROM sys.database_principals dp
    LEFT JOIN sys.server_principals sp
    ON dp.sid = sp.sid
WHERE dp.type IN ('U','G','S')
ORDER BY dp.name;

USE master;

CREATE LOGIN testLogin WITH PASSWORD = 'strongPassword#123!';
GO

-- Connect to a specific database
USE Inchirieri;

CREATE USER testUser FOR LOGIN testLogin;  
GO

Use EcoCarRental;

-- Select to get the column name of a table and the data type
SELECT
    COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = N'Staff' -- 'table_name'




