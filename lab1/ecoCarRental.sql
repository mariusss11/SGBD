
-- CREATEA DATABASE
CREATE DATABASE EcoCarRental;

-- USE THE DATABASE
-- USE EcoCarRental;

-- CREATE TABLES
CREATE TABLE Customer
(
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(40) UNIQUE,
    phone VARCHAR(20) NOT NULL,
    driver_license VARCHAR(30)
)

CREATE TABLE Car
(
    car_id INT PRIMARY KEY IDENTITY(1,1),
    make VARCHAR(30) NOT NULL,
    model VARCHAR(30) NOT NULL,
    year INT,
    license_plate VARCHAR(15),
    status VARCHAR(20) NOT NULL DEFAULT('available'),
    -- available, rented, maintenance
    price_per_day DECIMAL(10,2) NOT NULL
)

CREATE TABLE Rental
(
    rental_id INT PRIMARY KEY IDENTITY(1,1),
    start_date DATE NOT NULL DEFAULT(GETDATE()),
    end_date DATE NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    customer_id INT NOT NULL,
    car_id INT NOT NULL
)

CREATE TABLE Payment
(
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    method VARCHAR(20),
    -- card, cash, transfer
    rental_id INT NOT NULL
)

CREATE TABLE Staff
(
    staff_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role VARCHAR(15) NOT NULL DEFAULT('Consultant'),
    email VARCHAR(40) NOT NULL UNIQUE
)

CREATE TABLE CarType
(
    type_id INT PRIMARY KEY IDENTITY(1,1),
    type_name VARCHAR(30) NOT NULL
)

-- ADD RELATIONSHIPS BETWEEN TABLES
ALTER TABLE Rental
ADD CONSTRAINT rentalCustomerIdFK
FOREIGN KEY (car_id) REFERENCES Customer(customer_id)


ALTER TABLE Rental
ADD CONSTRAINT rentalCarIdFK
FOREIGN KEY(car_id) REFERENCES CAR(car_id)

-- ADD A COLUMN FOR THE STAFF IN THE RENTAL TABLE
ALTER TABLE Rental
ADD staff_id INT FOREIGN KEY REFERENCES STAFF(staff_id)

-- ADD A NEW COLUMN (FOR CONNECTING THE Car AND CarType TABLES)
ALTER TABLE Car
ADD type_id INT FOREIGN KEY REFERENCES CarType(type_id)

-- CHECK IF THE COLUMN APPEARED
SELECT *
FROM Car;

ALTER TABLE Car
ADD type_id INT FOREIGN KEY REFERENCES CarType(type_id)



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



-- SECURITY

-- CREATE LOGIN
CREATE LOGIN staffLogin WITH PASSWORD = 'strongPassword#123!';
GO

-- Connect to a specific database
USE EcoCarRental;

CREATE USER staff FOR LOGIN staffLogin;  
GO

-- ADD SOME PERMISSIONS
ALTER ROLE db_datareader ADD MEMBER staff;
ALTER ROLE db_datawriter ADD MEMBER staff;
GO


-- 
