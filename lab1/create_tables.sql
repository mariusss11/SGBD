
-- CREATE DATABASE
CREATE DATABASE EcoCarRental;

-- USE THE DATABASE
USE EcoCarRental;

-- CREATE TABLES
CREATE TABLE Customer
(
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(40) UNIQUE,
    phone VARCHAR(20) NOT NULL,
    driver_license VARCHAR(30)
);

CREATE TABLE Rental
(
    rental_id INT PRIMARY KEY IDENTITY(1,1),
    start_date DATE NOT NULL DEFAULT(GETDATE()),
    end_date DATE NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    customer_id INT REFERENCES Customer(customer_id) NOT NULL,
    car_id INT REFERENCES Car(car_id) NOT NULL,
    staff_id INT REFERENCES Staff(staff_id) NOT NULL
);

CREATE TABLE Staff
(
    staff_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role VARCHAR(15) NOT NULL DEFAULT('Consultant'),
    email VARCHAR(40) NOT NULL UNIQUE
);

-- changed to payment type
CREATE TABLE PaymentType
(
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    method_name VARCHAR(20),
    -- changed to method_name
);

CREATE TABLE Car
(
    car_id INT PRIMARY KEY IDENTITY(1,1),
    make VARCHAR(30) NOT NULL,
    model VARCHAR(30) NOT NULL,
    year INT,
    license_plate VARCHAR(15),
    status VARCHAR(20) NOT NULL DEFAULT('available'),
    -- available, rented, maintenance
    price_per_day DECIMAL(10,2) NOT NULL,
    type_id INT REFERENCES CarType(type_id) NOT NULL
);

CREATE TABLE CarType
(
    type_id INT PRIMARY KEY IDENTITY(1,1),
    type_name VARCHAR(30) NOT NULL
);
