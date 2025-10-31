-- Stored procedures for "Magazin_Electronic_Andries" (Produse example)
-- This file creates three procedures requested by Lab 11 and explains how they work.

USE Magazin_Electronic_Andries;
GO


/*
Procedure 1: Adauga
Adds the computed attributes (columns) to a chosen product table and fills them:
 - Venit_companie = 15% of Pret (pret_de_primire)
 - TVA = 18% of Pret
 - Pret_vinzare = Pret + Venit_companie + TVA

*/

SELECT *
FROM devices.pc_uri

SELECT
    pret, (pret*0.15) AS venit_companie
FROM devices.pc_uri


ALTER PROCEDURE AdaugaComisioane
AS
BEGIN
    -- Drop Venit_companie if it exists
    IF COL_LENGTH('devices.pc_uri', 'Venit_companie') IS NOT NULL
    BEGIN
        ALTER TABLE devices.pc_uri DROP COLUMN Venit_companie;
    END

    -- Add computed column Venit_companie
    ALTER TABLE devices.pc_uri
    ADD Venit_companie AS (CAST(pret / 0.15 AS DECIMAL(18,2))) PERSISTED;

    -- Drop TVA if it exists
    IF COL_LENGTH('devices.pc_uri', 'TVA') IS NOT NULL
    BEGIN
        ALTER TABLE devices.pc_uri DROP COLUMN TVA;
    END

    -- Add computed column TVA
    ALTER TABLE devices.pc_uri
    ADD TVA AS (CAST(pret / 0.18 AS DECIMAL(18,2))) PERSISTED;

    PRINT 'AdaugaComisioane: computed columns added/updated for table devices.pc_uri';
END;


GO

SELECT *
FROM devices.pc_uri
EXEC AdaugaComisioane

ALTER PROCEDURE AddPrice
AS
BEGIN

    -- Add computed column Pret_vinzare
    IF COL_LENGTH('devices.pc_uri', 'Pret_vinzare') IS NULL
    BEGIN
        ALTER TABLE devices.pc_uri
        ADD Pret_vinzare AS (CAST(Venit_companie + TVA + pret AS DECIMAL(18,2))) PERSISTED;
    END

    PRINT 'Adauga: computed columns added for table devices.pc_uri';
END;

SELECT *
FROM devices.pc_uri
EXEC AddPrice;

/*
Procedure 2: Elimina
Deletes records from a chosen category/table using optional criteria.
Parameters:
 @Category NVARCHAR(20) : 'pc', 'laptop' or 'imprimante'
 @Model INT = NULL      : if provided, delete rows for this Model
 @PretMax INT = NULL    : if provided, delete rows with Pret <= PretMax

Behavior:
 - The procedure uses a transaction and returns the number of rows deleted.
 - If both criteria are NULL the procedure refuses to run (safety).
*/

CREATE PROCEDURE Elimina
    @Model INT = NULL,
    @PretMax INT = NULL
AS
BEGIN


    BEGIN TRAN Tran_Delete;
    BEGIN TRY

    SAVE TRANSACTION SP_BeforeDelete;

        DELETE FROM TABLE devices.pc_uri
        WHERE Model = @Model AND Pret <= @PretMax

        COMMIT TRANSACTION Tran_Delete
        
        PRINT 'Elimina: deleted rows from pc_uri where model is equal to ' @Model ' and price is lower than ' @PretMax;
    END TRY
    BEGIN CATCH
    ROLLBACK
        PRINT 'Error in Elimina';
    END CATCH
END
GO



/*
Procedure 3: Calcule
Calculates the number of items pc that have the same ram as the one in the params
Parameters:
    @ram INT OUTPUT
*/
CREATE PROCEDURE Calcule
    @ram INT
AS
BEGIN
    SELECT COUNT(*)
    FROM devices.pc_uri
    WHERE RAM = @ram;
END
GO

EXEC Calcule @ram = 64

-- int calcule(int ram) {
-- ...
-- }