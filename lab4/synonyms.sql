USE EcoCarRental;
-- Synonyms provide an alias for database objects (tables, views, procedures, etc.)

-- List all the synonyms in the database
SELECT name, base_object_name
FROM sys.synonyms;


-- Create a synonym for a table
CREATE SYNONYM deals FOR dbo.rental;
-- Now you can use Syn_Students instead of dbo.Students
SELECT *
FROM deals;

-- Create a synonym for a view
CREATE SYNONYM customers FOR dbo.view_customer;
SELECT *
FROM customers;


-- Drop a synonym
DROP SYNONYM customers;

-- Rename a synonym (not directly supported, so recreate)
-- Drop old, create new
DROP SYNONYM deals;
CREATE SYNONYM sign_deals FOR dbo.rental;


-- Synonyms can reference tables, views, procedures, functions, etc.
-- But not user-defined types or sequences

-- Synonyms are database-scoped

-- Synonyms do not provide security isolation; permissions are checked on the base object

-- Drop all synonyms (use with caution!)
-- Generates DROP statements for all synonyms
SELECT 'DROP SYNONYM [' + name + '];'
FROM sys.synonyms;