USE master;

-- Create a new schema
CREATE SCHEMA car_schema;
GO

-- Show all schemas in the database
SELECT name
FROM sys.schemas;
GO

-- Set the default schema for a user (example for user 'dbo')
ALTER USER [dbo] WITH DEFAULT_SCHEMA = car_schema;
GO

-- Drop a schema (only if empty)
-- DROP SCHEMA car_schema;
GO

-- Show all tables in the current schema
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'car_schema';
GO

-- Create a table in the schema as an example
CREATE TABLE car_schema.cars
(
    id INT PRIMARY KEY,
    model NVARCHAR(50),
    year INT
);
GO

-- Info:
-- SELECT name FROM sys.schemas: Lists all schemas in the database.
-- ALTER USER ... WITH DEFAULT_SCHEMA: Sets car_schema as the default schema for a user.
-- DROP SCHEMA car_schema: Deletes the schema (only if empty).
-- SELECT ... FROM INFORMATION_SCHEMA.TABLES: Lists all tables in the specified schema.
-- CREATE TABLE: Example of creating a table within a schema.