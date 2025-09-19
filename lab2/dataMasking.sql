USE EcoCarRental;

SELECT *
FROM Customer;

-- The command that mask the info 
ALTER TABLE customer
ALTER COLUMN driver_license ADD MASKED WITH (FUNCTION = 'partial(2, "XXX", 3)');
