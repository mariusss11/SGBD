USE EcoCarRental;

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
    JOIN CarType t ON car.type_id = t.type_id;


SELECT
    CONCAT(c.first_name, ' ', c.last_name) as Customer_Name,
    COUNT(r.rental_id) as Total_Rentals
FROM Customer c
    JOIN Rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY Total_Rentals DESC;

