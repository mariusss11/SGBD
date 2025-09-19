USE EcoCarRental;

SELECT
    CONCAT(c.first_name, ' ', c.last_name) as Customer_name,
    CONCAT(car.make, ' ', car.model, ' ', car.year) as Car,
    t.type_name as CarType,
    CONCAT(s.first_name, ' ', s.last_name) as Staff_name
FROM Customer c
    JOIN Rental r ON c.customer_id = r.customer_id
    JOIN STAFF s ON s.staff_id = r.staff_id
    JOIN Car car ON car.car_id = r.car_id
    JOIN CarType t ON car.type_id = t.type_id;