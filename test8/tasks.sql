USE Companie_IT;

CREATE TABLE Intretinuti
(
    id_intretinuti INT PRIMARY KEY,
    nume_intretinuti VARCHAR(30) NOT NULL,
    prenume_intretinuti VARCHAR(30) NOT NULL,
    gen VARCHAR(1) NOT NULL CHECK(gen = 'M' OR gen = 'F'),
    data DATE NOT NULL,
    id_angajat INT REFERENCES Angajati(IdAngajat)
);

-- Inserarea copiilor în tabela Intretinuti
INSERT INTO Intretinuti
    (id_intretinuti, nume_intretinuti, prenume_intretinuti, gen, data, id_angajat)
VALUES
    (1, 'Bachinshi', 'Andrei', 'M', '2015-06-01', 1),
    (2, 'Bachinshi', 'Elena', 'F', '2017-08-12', 1),
    (3, 'Godoroja', 'Ion', 'M', '2018-01-23', 2),
    (4, 'Borzin', 'Maria', 'F', '2010-03-15', 3),
    (5, 'Borzin', 'Alex', 'M', '2012-07-18', 3),
    (6, 'Borzin', 'Ioana', 'F', '2014-11-20', 3),
    (7, 'Bachinshi', 'Radu', 'M', '2011-09-09', 5),
    (8, 'Bachinshi', 'Sofia', 'F', '2013-12-12', 5),
    (9, 'Rottaru', 'Daria', 'F', '2015-02-02', 6),
    (10, 'Rottaru', 'Mihai', 'M', '2017-06-06', 6),
    (11, 'Bandas', 'Vlad', 'M', '2010-04-04', 7),
    (12, 'Bandas', 'Eliza', 'F', '2012-08-08', 7),
    (13, 'Iapara', 'Noah', 'M', '2013-10-10', 8),
    (14, 'Iapara', 'Clara', 'F', '2015-12-12', 8),
    (15, 'Caminschi', 'Stefan', 'M', '2011-01-01', 9),
    (16, 'Cristea', 'Lia', 'F', '2013-03-03', 10),
    (17, 'Cristea', 'David', 'M', '2014-04-04', 10),
    (18, 'Cristea', 'Elena', 'F', '2016-06-06', 10),
    (19, 'Cristea', 'Matei', 'M', '2018-08-08', 10),
    (20, 'Volosciuc', 'Ana', 'F', '2016-05-05', 4);



SELECT *
FROM Intretinuti;


INSERT INTO Departamente
VALUES
    (6, 'Educatie', 1),
    (7, 'Retele', 2),
    (8, 'Contabilitate', 3);

SELECT *
FROM Departamente;


SELECT *
FROM Angajati;

SELECT *
FROM Departamente

INSERT INTO Angajati
VALUES
    (11, 6, 1, 'Covali', 'Eugenia', 097656789, 'Durlesti', 23, 'Chisinau', 'Centru', 'F', '1980-01-02', 10000);


INSERT INTO Angajati
VALUES
    (12, 6, 1, 'Golub', 'Andrian', 01234567, 'Durlesti', 23, 'Chisinau', 'Centru', 'M', '1990-10-02', 10000),
    (13, 6, 1, 'Frunza', 'Eugenia', 0987654, 'Chisinau', 45, 'Chisinau', 'Centru', 'F', '1979-12-02', 9000),
    (14, 6, 1, 'Nebunelea', 'Diana', 097656789, 'Durlesti', 3, 'Chisinau', 'Ciocana', 'F', '1987-09-10', 7000),
    (15, 6, 1, 'Cojocaru', 'Liuba', 057837243, 'Chisinau', 13, 'Chisinau', 'Riscani', 'F', '1989-01-22', 8000);

SELECT *
FROM Proiecte

INSERT INTO Proiecte
    (IdProiect, Nume_Proiect, Buget, Termen_lim, IdDepartament)
VALUES
    (12, 'Alpha_AI', 10000, '2025-12-31', 6),
    (6, 'App_Beta', 12000, '2025-11-30', 6),
    (7, 'Gamma_Generator', 8000, '2025-10-31', 6),
    (8, 'Rental_App', 15000, '2025-09-30', 6),
    (9, 'Bank_App', 9000, '2025-08-31', 6),
    (10, 'Gradinita_Moderna', 11000, '2025-07-31', 6),
    (11, 'Jocuri_Interactive', 13000, '2025-06-30', 6);


-- Să se găsească Numele și Prenumele funcționarilor care activează în același departament cu”Covali Eugenia”;
SELECT Nume, Prenume
FROM Angajati
WHERE IdDepartament = (    
    SELECT
    IdDepartament
FROM Angajati
WHERE Nume = 'Covali' AND Prenume = 'Eugenia'
);


-- Să se găsească Numele și Prenumele funcționarilor care au salariu mai mic decât salariul minimal al ocupanților postului în care activează ”Covali Eugenia”
SELECT *
FROM Angajati
WHERE salariu < (SELECT MIN(Salariu)
FROM Angajati
WHERE IdDepartament = (    
    SELECT
    IdDepartament
FROM Angajati
WHERE Nume = 'Covali' AND Prenume = 'Eugenia'
))

-- Să se afle numele și salariile funcționarilor care câștigă un salariu mai mare decât media pe un departament, 
-- dar salariu maxim pe acest departament e mai mic 10000

SELECT a.Nume, a.Prenume, d.Nume_Dep
FROM Angajati a
    JOIN Departamente d ON a.IdDepartament = d.IdDepartament
WHERE Salariu > (
    SELECT AVG(Salariu)
    FROM Angajati
    WHERE IdDepartament = a.IdDepartament)
    AND a.IdDepartament IN (
        SELECT IdDepartament
    FROM Angajati
    GROUP BY IdDepartament
    HAVING MAX(Salariu) < 10000)

-- Să se afișeze denumirile departamentelor care au cel puțin un funcționar care ridică un salariu mai mare de 8000.
SELECT Nume_Dep
FROM Departamente
WHERE IdDepartament IN 
(
    SELECT IdDepartament
FROM Angajati
WHERE Salariu >= 8000)



-- Să se afișeze nr. de copii(întreținuți) pentru fiecare angajat
SELECT IdAngajat, a.Nume, a.Prenume, COUNT(i.id_intretinuti) as nr_de_copii
FROM Angajati a
    JOIN Intretinuti i ON i.id_angajat = a.IdAngajat
GROUP BY IdAngajat, a.Nume, a.Prenume


-- 8. Să se afișați numele și prenumele copiilor pentru fiecare angajat.
SELECT a.Nume, a.Prenume, i.nume_intretinuti, i.prenume_intretinuti
FROM Angajati a
    JOIN Intretinuti i ON i.id_angajat = a.IdAngajat

-- 9. *Pentru nota 10 mai realizați 2 subinterogari ce conțin diferite clauze, funcții,
-- operatori.


-- Angajatii care au mai mult de un copil si salariul mai mare de 5000
SELECT IdAngajat, a.Nume, a.Prenume, COUNT(i.id_intretinuti) as nr_de_copii
FROM Angajati a
    JOIN Intretinuti i ON i.id_angajat = a.IdAngajat
WHERE Salariu > 5000
GROUP BY IdAngajat, a.Nume, a.Prenume
HAVING COUNT(i.id_intretinuti) > 1

-- Numele departamentului cu angajti ce au salriul de peste 10000
SELECT d.Nume_Dep
FROM Departamente d
WHERE d.IdDepartament IN (SELECT IdDepartament
FROM Angajati
WHERE Salariu > 10000)


