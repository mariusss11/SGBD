USE EcoCarRental;

-- SCALAR FUNCTION
ALTER FUNCTION most_expensive_car_from_a_brand
(@car_brand VARCHAR(50))
RETURNS INT
AS 
BEGIN
    DECLARE @price INT;

    SELECT @price = MAX(price_per_day)
    FROM Car
    WHERE make = @car_brand;

    RETURN @price;
END;
GO

SELECT dbo.most_expensive_car_from_a_brand('Toyota') price;


-- TABELAR FUNCTION (RETURN A TABLE)
CREATE FUNCTION car_brand_maximum_price()  
RETURNS TABLE  
AS  
RETURN
    SELECT
    c.make,
    dbo.most_expensive_car_from_a_brand(c.make) AS price
FROM Car c
GROUP BY c.make


SELECT *
FROM car_brand_maximum_price()

-- MULTIPLE INSTRUCTION TABELAR FUNCTION (RETURN ALSO A TABLE BUT MORE INSTRUCTION CAN BE MADE)
CREATE FUNCTION car_description ()
RETURNS @Result TABLE (
    Car VARCHAR(50),
    number_of_borrows INT,
    Description VARCHAR(20)
)
AS
BEGIN
    INSERT INTO @Result
        (Car, number_of_borrows, Description)
    SELECT
        CONCAT(c.make, ' ', c.model, ' ', c.year) AS Car,
        COUNT(r.rental_id) AS number_of_borrows,
        CASE
            WHEN COUNT(r.rental_id) <= 2 THEN 'Putine inchirieri'
            WHEN COUNT(r.rental_id) BETWEEN 3 AND 4 THEN 'Medii'
            ELSE 'Multe inchirieri'
        END AS Description
    FROM car c
        LEFT JOIN Rental r ON r.car_id = c.car_id
    GROUP BY c.make, c.model, c.year;

    RETURN;
END;


SELECT *
FROM car_description()
