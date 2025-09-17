USE master;
DROP DATABASE EcoCarRental;

USE master;
ALTER DATABASE EcoCarRental SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE EcoCarRental;


USE master;
SELECT
    d.name AS DatabaseName,
    s.host_name,
    s.program_name,
    s.login_name
FROM sys.dm_exec_sessions s
    JOIN sys.databases d ON d.database_id = s.database_id
WHERE d.name = 'EcoCarRental';
