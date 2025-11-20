
USE Companie_IT;

CREATE PROCEDURE increase_salary
    @procent INT,
    @max INT

AS
BEGIN

    UPDATE Angajati
    SET Salariu = Salariu + (Salariu * @procent / 100)
    WHERE Salariu < @max;
END

SELECT Salariu
FROM Angajati;

-- increase the salary by 10% to the employes that have an salary smaller than 2000
EXEC increase_salary @procent = 10, @max = 2000;