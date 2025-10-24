-- Dynamic data masking restricts sensitive data exposure by masking it at the query result level

-- Use the desired database
USE EcoCarRental;

-- The command that mask the info 
ALTER TABLE customer
ALTER COLUMN driver_license ADD MASKED WITH (FUNCTION = 'partial(2, "XXX", 3)');
-- It masks the customer driver_license column, showing only the first two and the last three characters.

-- Before (eg.)
-- D1234567

-- After (eg.)
-- D1XXX567

SELECT *
FROM customer;

-- Learn more about it here: https://learn.microsoft.com/en-us/sql/relational-databases/security/dynamic-data-masking?view=sql-server-ver17
