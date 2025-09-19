USE EcoCarRental;

-- Get all the users and the roles assigned to them
SELECT
    dp2.name AS UserName,
    dp1.name AS RoleName
FROM sys.database_role_members drm
    JOIN sys.database_principals dp1 ON drm.role_principal_id = dp1.principal_id
    JOIN sys.database_principals dp2 ON drm.member_principal_id = dp2.principal_id
ORDER BY dp1.name, dp2.name;


-- CREATE ROLES
CREATE ROLE admin_role;
CREATE ROLE staff_role;
CREATE ROLE client_role;



-- ASSIGN PERMISSIONS TO ROLES

-- To client_role
GRANT SELECT ON view_staff TO client_role;


-- To staff_role
GRANT SELECT ON Customer TO staff_role;




-- ADD MEMBERS (USERS) TO ROLES

-- To staff_role
ALTER ROLE staff_role ADD MEMBER staff_user;



