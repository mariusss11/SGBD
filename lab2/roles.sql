USE EcoCarRental;

-- Get all the users and the roles assigned to them
SELECT
    dp1.name AS RoleName,
    dp2.name AS UserName
FROM sys.database_role_members drm
    JOIN sys.database_principals dp1 ON drm.role_principal_id = dp1.principal_id
    JOIN sys.database_principals dp2 ON drm.member_principal_id = dp2.principal_id
ORDER BY dp1.name, dp2.name;


-- CREATE ROLES
CREATE ROLE staff_role;
CREATE ROLE client_role;

-- ASSIGN PERMISSIONS TO ROLES

-- To client_role
GRANT SELECT ON view_staff TO client_role;
GRANT SELECT ON Car TO client_role;
GRANT SELECT ON CarType TO client_role;


-- To staff_role
GRANT SELECT ON Customer TO staff_role;
GRANT SELECT, UPDATE, INSERT, DELETE ON Car TO staff_role;
GRANT SELECT, UPDATE, INSERT, DELETE ON CarType TO staff_role;
GRANT SELECT, UPDATE, INSERT, DELETE ON Rental TO staff_role;
GRANT SELECT ON Staff TO staff_role;



-- ADD MEMBERS (USERS) TO SPECIFIC ROLES

-- To staff_role
ALTER ROLE staff_role ADD MEMBER staff_user;

-- To client_role
ALTER ROLE client_role ADD MEMBER user_client;


-- List all the permissions of a specific role
SELECT rp.name,
    ObjectType = rp.type_desc,
    PermissionType = pm.class_desc,
    pm.permission_name,
    pm.state_desc,
    ObjectType = CASE 
        WHEN obj.type_desc IS NULL
        OR obj.type_desc = 'SYSTEM_TABLE'
        THEN 
            pm.class_desc 
        ELSE obj.type_desc 
    END,
    s.Name as SchemaName,
    [ObjectName] = Isnull(ss.name, Object_name(pm.major_id))
FROM sys.database_principals rp
    INNER JOIN sys.database_permissions pm
    ON pm.grantee_principal_id = rp.principal_id
    LEFT JOIN sys.schemas ss
    ON pm.major_id = ss.schema_id
    LEFT JOIN sys.objects obj
    ON pm.[major_id] = obj.[object_id]
    LEFT JOIN sys.schemas s
    ON s.schema_id = obj.schema_id
WHERE  rp.type_desc = 'DATABASE_ROLE'
    AND pm.class_desc <> 'DATABASE'
    AND rp.name LIKE 'client_role'
ORDER  BY rp.name, 
          rp.type_desc, 
          pm.class_desc 



