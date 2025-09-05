-- USE THE DATABASE
USE EcoCarRental;

--  INSERT SOME DATA

INSERT INTO Customer
    (first_name, last_name, email, phone, driver_license)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '+1234567890', 'D1234567'),
    ('Jane', 'Smith', 'jane.smith@example.com', '+1234567891', 'D1234568'),
    ('Alice', 'Brown', 'alice.brown@example.com', '+1234567892', 'D1234569'),
    ('Bob', 'Johnson', 'bob.johnson@example.com', '+1234567893', 'D1234570'),
    ('Charlie', 'Davis', 'charlie.davis@example.com', '+1234567894', 'D1234571');

INSERT INTO CarType
    (type_name)
VALUES
    ('Sedan'),
    ('SUV'),
    ('Hatchback'),
    ('Convertible'),
    ('Pickup');

INSERT INTO Car
    (make, model, year, license_plate, status, price_per_day, type_id)
VALUES
    ('Toyota', 'Corolla', 2020, 'ABC123', 'available', 50.00, 1),
    ('Honda', 'Civic', 2019, 'DEF456', 'available', 55.00, 1),
    ('Ford', 'Escape', 2021, 'GHI789', 'available', 70.00, 2),
    ('BMW', 'Z4', 2022, 'JKL012', 'available', 120.00, 4),
    ('Chevrolet', 'Silverado', 2020, 'MNO345', 'available', 90.00, 5);

INSERT INTO Staff
    (first_name, last_name, role, email)
VALUES
    ('Michael', 'Scott', 'Manager', 'michael.scott@example.com'),
    ('Pam', 'Beesly', 'Consultant', 'pam.beesly@example.com'),
    ('Jim', 'Halpert', 'Consultant', 'jim.halpert@example.com'),
    ('Dwight', 'Schrute', 'Consultant', 'dwight.schrute@example.com'),
    ('Angela', 'Martin', 'Consultant', 'angela.martin@example.com');

INSERT INTO Rental
    (start_date, end_date, total_cost, customer_id, car_id, staff_id)
VALUES
    ('2025-09-01', '2025-09-05', 200.00, 1, 1, 1),
    ('2025-09-02', '2025-09-06', 220.00, 2, 2, 2),
    ('2025-09-03', '2025-09-07', 280.00, 3, 3, 3),
    ('2025-09-04', '2025-09-08', 480.00, 4, 4, 4),
    ('2025-09-05', '2025-09-09', 360.00, 5, 5, 5);

INSERT INTO Payment
    (method, rental_id)
VALUES
    ('maib', 1),
    ('micb', 2),
    ('mb', 3),
    ('cash', 4),
    ('PayPal', 5);