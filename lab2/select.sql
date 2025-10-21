USE EcoCarRental;

-- ALL THE RENTS THAT COSTED MORE THAT 400 LEI
SELECT
    CONCAT(c.first_name, ' ', c.last_name) as Customer_Name,
    CONCAT(s.first_name, ' ', s.last_name) as Staff_Name,
    CONCAT(car.make, ' ', car.model, ' ', car.year) as Car,
    t.type_name as CarType,
    r.total_cost as TotalPrice
FROM Customer c
    JOIN Rental r ON c.customer_id = r.customer_id
    JOIN STAFF s ON s.staff_id = r.staff_id
    JOIN Car car ON car.car_id = r.car_id
    JOIN CarType t ON car.type_id = t.type_id
WHERE r.total_cost > 400.00;

-- CUSTOMER SORTED DESCENDING AFTER THE NUMBERS OF RENTS
SELECT
    CONCAT(c.first_name, ' ', c.last_name) as Customer_Name,
    COUNT(r.rental_id) as Total_Rentals
FROM Customer c
    JOIN Rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY Total_Rentals DESC;

-- CUSTOMER WITH THE LONGEST RENTING PERIOD
SELECT
    CONCAT(c.first_name, ' ', c.last_name) as Customer_Name,
    CONCAT(car.make, ' ', car.model, ' ', car.year) as Car,
    CONCAT(DATEDIFF(DAY, r.start_date, r.end_date), ' days') AS DurationDays
FROM Rental r
    JOIN Customer c ON c.customer_id = r.customer_id
    JOIN Car car ON car.car_id = r.car_id
WHERE DATEDIFF(DAY, r.start_date, r.end_date) = (
    SELECT MAX(DATEDIFF(DAY, r2.start_date, r2.end_date))
FROM Rental r2);

-- ALL THE CUSTOMERS THAT BORRWED CARS NEWER THEN 2020
SELECT
    CONCAT(c.first_name, ' ', c.last_name) as Customer_Name,
    CONCAT(car.make, ' ', car.model, ' ', car.year) as Car
FROM Customer c
    JOIN Rental r ON c.customer_id = r.customer_id
    JOIN Car car ON car.car_id = r.car_id
WHERE car.[year] >= 2022;

-- ALL THE CUSTOMERS THAT BORROWED A SPECIFIC CAR (Ford Focus)
SELECT
    CONCAT(c.first_name, ' ', c.last_name) as Customer_Name
FROM Customer c
    JOIN Rental r ON c.customer_id = r.customer_id
    JOIN Car car ON car.car_id = r.car_id
WHERE car.make = 'Ford' AND car.model = 'Focus';


-- -------------------------------------
-- UNFINISHED
-- CUSTOMER AND THEIR FAVORITE RENTAL CAR
SELECT
    CONCAT(c.first_name, ' ', c.last_name) as Customer_Name,
    CONCAT(car.make, ' ', car.model, ' ', car.year) as Car
FROM Customer c
    JOIN Rental r ON c.customer_id = r.customer_id
    JOIN Car car ON car.car_id = r.car_id
-- GROUP BY c.customer_id, c.first_name, c.last_name

-- -------------------------------------

-- SHOW THE CUSTOMERS THAT BORROWED CARS MINIMUM 2 TIMES
SELECT
    -- c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) as Customer_Name,
    COUNT(r.rental_id) as Total_Rentals
FROM Customer c
    JOIN Rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 1
ORDER BY Total_Rentals DESC


-- THE NUMBERS OF TIMES A SPECIFC CLIENT BORROWED HIS CARS
SELECT
    CONCAT(car.make, ' ', car.model, ' ', car.year) as Car,
    COUNT(r.rental_id) as TimesBorrowed
FROM Customer c
    JOIN Rental r ON c.customer_id = r.customer_id
    JOIN Car car ON r.car_id = car.car_id
WHERE c.customer_id = 10
GROUP BY car.make, car.model, car.year


-- SELECT THE MOST FAVORITE CAR OF A DRIVER
SELECT TOP 1
    CONCAT(car.make, ' ', car.model, ' ', car.year) as Car,
    COUNT(r.rental_id) as TimesBorrowed
FROM Customer c
    JOIN Rental r ON c.customer_id = r.customer_id
    JOIN Car car ON r.car_id = car.car_id
WHERE c.customer_id = 8
GROUP BY car.make, car.model, car.year
ORDER BY TimesBorrowed DESC;

