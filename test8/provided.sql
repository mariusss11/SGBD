
CREATE DATABASE Companie_IT;

USE Companie_IT;

CREATE TABLE Departamente
(
    IdDepartament int PRIMARY KEY,
    Nume_Dep varchar(20),
    Manager_Id int
);


create table Angajati
(
    IdAngajat int PRIMARY KEY,
    IdDepartament int references Departamente(IdDepartament),
    Supervizor_Id int,
    Nume varchar(50),
    Prenume varchar(50),
    CNP int,
    Strada varchar(50),
    Numar int,
    Oras char(30),
    Judet char(20),
    Sex varchar(1)CHECK(Sex='M' OR Sex='F'),
    Data_n date,
    Salariu int
);

CREATE TABLE Proiecte
(
    IdProiect int NOT NULL PRIMARY KEY,
    Nume_Proiect varchar(30),
    Buget int,
    Termen_lim date,
    IdDepartament int references Departamente(IdDepartament)
);

CREATE TABLE AngProiect
(
    IdAng_Proiect int Primary key,
    IdProiect int NOT NULL references Proiecte(IdProiect),
    IdAngajat int NOT NULL references Angajati(IdAngajat),
    NrOreSap int
);


SELECT *
FROM Departamente
insert into Departamente
values
    (1, 'WEB', 1),
    (2, 'Grafica', 2),
    (3, 'Mecanica', 3),
    (4, 'Design', 4),
    (5, 'Tester1', 5);



SELECT *
FROM Angajati
insert into Angajati
values
    (1, 1, 1, 'Bachinshi', 'Catalin', 02938473, 'Ismail', 34, 'Chisinau', 'Centru', 'M', '2000-01-02', 6000),
    (2, 1, 2, 'Godoroja', 'Marin', 02938473, 'Tighina', 34, 'Chisinau', 'Botanica', 'M', '2001-02-03', 4700),
    (3, 2, 3, 'Borzin', 'Alexandru', 02938473, 'Bulgara', 34, 'Chisinau', 'Buiucani', 'M', '2002-03-05', 3500),
    (4, 2, 4, 'Volosciuc', 'Nicoleta', 02938473, 'Decebal', 34, 'Chisinau', 'Rascani', 'F', '2007-04-09', 1000),
    (5, 3, 5, 'Bachinshi', 'Catalin', 02938473, 'Ismail', 34, 'Chisinau', 'Buiucani', 'M', '1999-11-11', 5500),
    (6, 3, 1, 'Rottaru', 'Tatiana', 02938473, 'Grigore Vieru', 34, 'Chisinau', 'Centru', 'F', '2000-05-11', 6650),
    (7, 4, 2, 'Bandas', 'Victor', 02938473, 'Independentei', 34, 'Chisinau', 'Ciocana', 'M', '2002-08-01', 1430),
    (8, 4, 3, 'Iapara', 'Oleg', 02938473, 'Dacia', 34, 'Chisinau', 'Ciocana', 'M', '2005-10-01', 5500),
    (9, 5, 4, 'Caminschi', 'Leonid', 02938473, 'Traian', 34, 'Buiucani', 'Botanica', 'M', '2002-11-01', 7000),
    (10, 5, 5, 'Cristea', 'Alexandru', 02938473, 'Bulgara', 34, 'Chisinau', 'Rascani', 'M', '2001-12-01', 8100);


SELECT *
FROM Proiecte
insert into Proiecte
values
    (1, 'Ananas', 5000, '2020-07-23', 1),
    (2, 'Banana', 8000, '2020-06-30', 2),
    (3, 'Farfurie', 2300, '2020-06-13', 3),
    (4, 'Husaq', 1300, '2020-05-05', 4),
    (5, 'Nasture', 2400, '2020-05-25', 5);

SELECT *
FROM AngProiect
insert into AngProiect
values
    (1, 1, 10, 24),
    (2, 2, 9, 45),
    (3, 3, 8, 43),
    (4, 4, 7, 24),
    (5, 5, 6, 30),
    (6, 1, 5, 15),
    (7, 2, 4, 20),
    (8, 3, 3, 27),
    (9, 4, 2, 24),
    (10, 5, 1, 34);

/*Crearea unei vederi cu ajutorul joncțiunilor*/
CREATE VIEW Date_Ang
AS
    select Nume, Prenume, Nume_Dep
    from Angajati join Departamente on Angajati.IdAngajat=Departamente.Manager_Id
    where Manager_Id=Angajati.IdAngajat;

SELECT *
FROM Date_Ang;



