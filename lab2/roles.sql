USE EcoCarRental;

-- Get all the users and the roles assigned to them
SELECT
    dp2.name AS UserName,
    dp1.name AS RoleName
FROM sys.database_role_members drm
    JOIN sys.database_principals dp1 ON drm.role_principal_id = dp1.principal_id
    JOIN sys.database_principals dp2 ON drm.member_principal_id = dp2.principal_id
ORDER BY dp1.name, dp2.name;


-- Create roles
CREATE ROLE admin_role;
CREATE ROLE staff_role;
CREATE ROLE client_role;



-- Assign permission to roles

-- Assign permission to client_role
GRANT SELECT ON view_staff TO client_role;


-- Assign permission to client_role
GRANT SELECT ON Customer TO staff_role;

-- Add user to role
ALTER ROLE staff_role ADD MEMBER staff_user;



