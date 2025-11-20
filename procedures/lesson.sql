USE Companie_IT;

CREATE PROCEDURE inserareDepartament
    @id_departament INT,
    @nume_departament VARCHAR(40)
AS
BEGIN
    IF NOT EXISTS (
        SELECT *
    FROM Departamente
    WHERE Nume_Dep = @nume_departament
    )

    BEGIN
        INSERT INTO Departamente
            (IdDepartament, Nume_Dep)
        VALUES
            (@id_departament, @nume_departament)
    END
    ELSE PRINT @nume_departament + ' este deja folosit!';
END

EXEC inserareDepartament @id_departament = 10, @nume_departament = 'Team Lead';

SELECT *
FROM Departamente;

