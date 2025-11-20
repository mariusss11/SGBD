USE EcoCarRental;
GO


/*
Procedure 1: Modificica date masina
*/

SELECT *
FROM Car;
GO

IF OBJECT_ID('modify_car_details', 'P') IS NOT NULL
    DROP PROCEDURE modify_car_details;
GO


CREATE PROCEDURE modify_car_details
    @car_id INT,
    @make NVARCHAR(50) = NULL,
    @model NVARCHAR(50) = NULL,
    @year INT = NULL,
    @license_plate NVARCHAR(50) = NULL,
    @price_per_day DECIMAL(10,2) = NULL
AS
BEGIN
    UPDATE Car
    SET
        make = COALESCE(@make, make),
        model = COALESCE(@model, model),
        year = COALESCE(@year, year),
        license_plate = COALESCE(@license_plate, license_plate),
        price_per_day = COALESCE(@price_per_day, price_per_day)
    WHERE car_id = @car_id;
END;
GO

IF OBJECT_ID('add_car', 'P') IS NOT NULL
    DROP PROCEDURE add_car;
GO

CREATE PROCEDURE add_car
    @make NVARCHAR(50),
    @model NVARCHAR(50),
    @year INT,
    @license_plate NVARCHAR(50),
    @status NVARCHAR(20) = 'available',
    @price_per_day DECIMAL(10,2),
    @type_id INT
AS
BEGIN
    -- Check: required fields are not NULL or empty
    IF @make IS NULL OR LTRIM(RTRIM(@make)) = ''
    BEGIN
        RAISERROR('Make is required.', 16, 1);
        RETURN;
    END

    IF @model IS NULL OR LTRIM(RTRIM(@model)) = ''
    BEGIN
        RAISERROR('Model is required.', 16, 1);
        RETURN;
    END

    IF @year IS NULL OR @year < 1900 OR @year > YEAR(GETDATE()) + 1
    BEGIN
        RAISERROR('Year is invalid.', 16, 1);
        RETURN;
    END

    IF @price_per_day IS NULL OR @price_per_day <= 0
    BEGIN
        RAISERROR('Price per day must be greater than zero.', 16, 1);
        RETURN;
    END

    IF @license_plate IS NULL OR LTRIM(RTRIM(@license_plate)) = ''
    BEGIN
        RAISERROR('License plate is required.', 16, 1);
        RETURN;
    END

    IF EXISTS(
    SELECT 1
    FROM Car
    WHERE license_plate = @license_plate
    )
    BEGIN
        RAISERROR('A car with this license plate already exists.', 16, 1);
        RETURN;
    END


    -- All checks passed, insert the new car
    INSERT INTO Car
        (make, model, year, license_plate, status, price_per_day, type_id)
    VALUES(@make, @model, @year, @license_plate, @status, @price_per_day, @type_id);
END;
GO

IF OBJECT_ID('check_car_availability', 'P') IS NOT NULL
    DROP PROCEDURE check_car_availability;
GO

CREATE PROCEDURE check_car_availability
    @car_id INT,
    @start_date DATE,
    @end_date DATE
AS
BEGIN
    IF EXISTS(
        SELECT 1
    FROM Rental
    WHERE car_id = @car_id
        AND start_date <= @end_date
        AND end_date >= @start_date
    )
        PRINT 'Car is not available';
    ELSE
        PRINT 'Car is available';
END;

EXEC check_car_availability @car_id = 1,@start_date = '2025-11-01', @end_date = '2025-11-02'
