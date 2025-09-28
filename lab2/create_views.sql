USE EcoCarRental;

SELECT *
FROM customer;

CREATE VIEW view_customer
AS
    SELECT
        first_name,
        last_name
    FROM customer;

CREATE VIEW view_staff
AS
    SELECT
        first_name,
        last_name
    FROM staff;

SELECT *
FROM view_staff;