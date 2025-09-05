
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
