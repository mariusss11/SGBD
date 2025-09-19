USE ecoCarRental;

-- Verifying Permissions
-- You can check the user permissions by querying the sys.database_permissions view:
SELECT
    pr.name AS PrincipalName,
    pr.type_desc AS PrincipalType,
    pe.permission_name AS Permission,
    pe.state_desc AS PermissionState,
    ob.name AS ObjectName,
    ob.type_desc AS ObjectType
FROM sys.database_permissions AS pe
    JOIN sys.database_principals AS pr
    ON pe.grantee_principal_id = pr.principal_id
    LEFT JOIN sys.objects AS ob
    ON pe.major_id = ob.object_id
WHERE pr.name = 'user_client';

-- Use the server
USE master;

-- Create a login
CREATE LOGIN client
WITH PASSWORD = 'qwerty!2#'

-- Use the instance of the desired database
USE EcoCarRental;

-- Create a user for that specific database
CREATE USER user_client
FOR LOGIN client;

-- Permit the client to see all the names of the staff 
GRANT SELECT ON view_staff TO user_client;



