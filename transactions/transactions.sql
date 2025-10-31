-- Transactions exercise for Companie_IT
-- Split into distinct transactions per task and add savepoints in each.

USE Companie_IT;
GO

/*
 Transaction 1: add Salariul_calculat column and populate it from Salariu
*/
BEGIN TRY
    BEGIN TRANSACTION Tran_AddSalariulCalculat;

    -- Savepoint before schema changes
    SAVE TRANSACTION SP_BeforeAddColumn;

    ALTER TABLE Angajati
    ADD Salariul_calculat DECIMAL(18,2) NULL;

    -- Populate from Salariu (only where NULL, safe to re-run)
    UPDATE Angajati
    SET Salariul_calculat = CAST(Salariu AS DECIMAL(18,2))
    WHERE Salariul_calculat IS NULL;

    -- Savepoint after update
    SAVE TRANSACTION SP_AfterUpdate;

    PRINT 'Tran_AddSalariulCalculat: populated Salariul_calculat (sample):';

    SELECT TOP (10)
    IdAngajat, Nume, Prenume, Salariu, Salariul_calculat
FROM Angajati
ORDER BY IdAngajat;

    COMMIT TRANSACTION Tran_AddSalariulCalculat;
    PRINT 'Tran_AddSalariulCalculat committed.';

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION Tran_AddSalariulCalculat;
    PRINT 'Error in Tran_AddSalariulCalculat';
END CATCH;
GO

/*
 Transaction 2: raise Salariul_calculat by 10% for Department 1
*/
BEGIN TRY
    BEGIN TRANSACTION Tran_RaiseDept1;

    -- Savepoint before raise
    SAVE TRANSACTION SP_BeforeRaise;

    -- Perform the raise
    UPDATE Angajati
    SET Salariul_calculat = ROUND(Salariul_calculat * 1.10, 2)
    WHERE IdDepartament = 1;

    -- Savepoint before raise
    SAVE TRANSACTION SP_AfterRaise;

    PRINT 'Tran_RaiseDept1: after raise (Dept 1 sample):';
    SELECT
    IdAngajat, IdDepartament, Nume, Prenume, Salariul_calculat
FROM Angajati
WHERE IdDepartament = 1
ORDER BY IdAngajat;

    COMMIT TRANSACTION Tran_RaiseDept1;
    PRINT 'Tran_RaiseDept1 committed.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION Tran_RaiseDept1;
    PRINT 'Error in Tran_RaiseDept1';
END CATCH;

GO

/*
 Transaction 3: add Taxe_retinute and Salariu_achitat columns and compute them
*/
BEGIN TRY
    BEGIN TRANSACTION Tran_AddTaxes;

    SAVE TRANSACTION SP_BeforeTaxes;

    ALTER TABLE Angajati
    ADD Taxe_retinute DECIMAL(18,2) NULL;

    ALTER TABLE Angajati
    ADD Salariu_achitat DECIMAL(18,2) NULL;

    SAVE TRANSACTION SP_AfterAdding;

    -- Compute taxes and net salary
    UPDATE Angajati
    SET Taxe_retinute = ROUND(Salariul_calculat * 0.18, 2),
        Salariu_achitat = ROUND(Salariul_calculat - ROUND(Salariul_calculat * 0.18, 2), 2)
    WHERE Salariul_calculat IS NOT NULL;

    PRINT 'Tran_AddTaxes: computed taxes/net (sample):';
    SELECT TOP (20)
    IdAngajat, Nume, Prenume, Salariul_calculat, Taxe_retinute, Salariu_achitat
FROM Angajati
ORDER BY IdAngajat;

    COMMIT TRANSACTION Tran_AddTaxes;
    PRINT 'Tran_AddTaxes committed.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION Tran_AddTaxes;
    PRINT 'Error in Tran_AddTaxes';
END CATCH;
GO

/*
 Transaction 4: demonstrate deletes with savepoints
*/
BEGIN TRY
    BEGIN TRANSACTION Tran_DeletesDemo;

    PRINT 'Tran_DeletesDemo: deleting employees with Salariu_achitat < 1500 (demo)';
    DELETE FROM Angajati
    WHERE Salariu_achitat < 1500;

    PRINT 'Tran_DeletesDemo: rows after delete (sample):';
    SELECT TOP (50)
    IdAngajat, Nume, Prenume, Salariu_achitat
FROM Angajati
ORDER BY IdAngajat;

    -- Rollback all deletes
    ROLLBACK TRANSACTION Tran_DeletesDemo;
    PRINT 'Tran_DeletesDemo: rolled back (deletes undone).';

    -- If you want to commit instead:
    -- COMMIT TRANSACTION Tran_DeletesDemo;
    -- PRINT 'Tran_DeletesDemo committed (deletes persisted).';

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION Tran_DeletesDemo;
    PRINT 'Error in Tran_DeletesDemo';
END CATCH;
GO
