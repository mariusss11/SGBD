USE EcoCarRental;

SELECT *
FROM Car;

CREATE TABLE AuditLogs
(
    id INT IDENTITY PRIMARY KEY,
    table_name NVARCHAR(100),
    operation NVARCHAR(10),
    old_data NVARCHAR(MAX),
    new_data NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE()
);

EXEC sp_rename 'dbo.AuditLogs', CarLogs

CREATE TRIGGER log_cars_table
ON Car 
AFTER INSERT, UPDATE, DELETE 
AS
BEGIN

    IF OBJECT_ID('dbo.CarLogs', 'U') IS NULL
    BEGIN
        PRINT 'THE LOGS WILL NOT BE SAVED!';
        RETURN;
    END
    ELSE
    BEGIN
        INSERT INTO CarLogs
            (table_name, operation, old_data, new_data)
        SELECT
            'Car' AS table_name,
            CASE 
            WHEN EXISTS(SELECT *
                FROM inserted) AND EXISTS(SELECT *
                FROM deleted) THEN 'UPDATE'
            WHEN EXISTS(SELECT *
                FROM inserted) AND NOT EXISTS(SELECT *
                FROM deleted) THEN 'INSERT'
            WHEN NOT EXISTS(SELECT *
                FROM inserted) AND EXISTS(SELECT *
                FROM deleted) THEN 'DELETE'
        END AS operation,
            (SELECT *
            FROM deleted
            FOR JSON AUTO) AS old_data,
            (SELECT *
            FROM inserted
            FOR JSON AUTO) AS new_data;
    END
END

-- retrive info from the log table
SELECT *
FROM CarLogs

-- insert mock info in the car table
INSERT INTO Car
    (make, model, year, license_plate, status, price_per_day, type_id)
VALUES
    ('TestMake', 'TestModel', 2025, 'TES001', 'available', 50.00, 1);

-- mock update query 
UPDATE CAR 
SET license_plate = 'CHG001'
WHERE car_id = 19;

-- delete the mock data
DELETE FROM Car
WHERE car_id = 19;