-- Use the target database
USE Companie_IT;

/*
  Views exercises for Companie_IT
  - create several views (simple and join-based)
  - demonstrate SELECT from views
  - show INSERT/UPDATE/DELETE through a simple (updatable) view
  - show ALTER VIEW and DROP VIEW examples
  Notes: some views (those based on joins) are not updatable; INSERT/UPDATE/DELETE on them
  will fail unless INSTEAD OF triggers or other mechanisms are used.
*/

-- ---------- 1) Simple updatable view on Angajati ----------

-- if the view is not null we will drop it
IF OBJECT_ID('AngSimple_vw','V') IS NOT NULL
	DROP VIEW AngSimple_vw;

-- CREATE THE VIEW 
CREATE VIEW AngSimple_vw
AS
    SELECT IdAngajat,
        IdDepartament,
        Nume,
        Prenume,
        Salariu
    FROM Angajati;

-- Use the view to read employee basic info
SELECT *
FROM AngSimple_vw;

-- Example: insert a new employee via the simple view (works because the view maps
-- directly to a single base table and no computed/aggregate columns are present).

-- INSERT INTO AngSimple_vw (IdAngajat, IdDepartament, Nume, Prenume, Salariu)
-- VALUES (11, 1, 'Ionescu', 'Mihai', 4200);

-- Update salary through the view (allowed)
-- UPDATE AngSimple_vw SET Salariu = Salariu + 500 WHERE IdAngajat = 11;

-- Delete an employee through the view (allowed)
-- DELETE FROM AngSimple_vw WHERE IdAngajat = 11;

-- ---------- 2) Join-based views (usually not updatable) ----------
IF OBJECT_ID('Date_Ang_vw','V') IS NOT NULL
	DROP VIEW Date_Ang_vw;

-- CREATE THE ADVANCED VIEW
CREATE VIEW Date_Ang_vw
AS
    SELECT a.IdAngajat,
        a.Nume,
        a.Prenume,
        d.Nume_Dep AS Departament,
        a.Salariu
    FROM Angajati a
        LEFT JOIN Departamente d ON a.IdDepartament = d.IdDepartament;

SELECT *
FROM Date_Ang_vw;

-- Attempting to INSERT into a join view that includes columns from multiple tables
-- will generally fail. Example (will raise an error in most RDBMS):
-- INSERT INTO Date_Ang_vw (IdAngajat, Nume, Prenume, Departament, Salariu)
-- VALUES (12, 'Popescu', 'Ion', 'WEB', 3900);
-- Instead, insert into the base table(s) directly.

-- Another useful view: employees assigned to projects
IF OBJECT_ID('Angajati_Proiecte_vw','V') IS NOT NULL
	DROP VIEW Angajati_Proiecte_vw;

CREATE VIEW Angajati_Proiecte_vw
AS
    SELECT ap.IdAng_Proiect,
        a.IdAngajat,
        a.Nume,
        a.Prenume,
        p.IdProiect,
        p.Nume_Proiect,
        ap.NrOreSap
    FROM AngProiect ap
        JOIN Angajati a ON ap.IdAngajat = a.IdAngajat
        JOIN Proiecte p ON ap.IdProiect = p.IdProiect;

SELECT *
FROM Angajati_Proiecte_vw;

-- ---------- 3) ALTER VIEW example ----------
-- Suppose we want the simple view to also show a full name column.
IF OBJECT_ID('AngSimple_vw','V') IS NOT NULL
	DROP VIEW AngSimple_vw;

-- CREATE THE VIEW
CREATE VIEW AngSimple_vw
AS
    SELECT IdAngajat,
        IdDepartament,
        Nume,
        Prenume,
        Salariu
    FROM Angajati;

SELECT *
FROM AngSimple_vw;

-- MODIFY THE VIEW, BY ADDING THE COMPUND COLUMN
ALTER VIEW AngSimple_vw
AS
    SELECT IdAngajat,
        IdDepartament,
        Nume,
        Prenume,
        (Nume + ' ' + Prenume) AS Nume_Complet,
        Salariu
    FROM Angajati;

SELECT IdAngajat, Nume_Complet, Salariu
FROM AngSimple_vw;

-- Note: because we replaced the view with a computed column, the view may become
-- non-updatable for certain operations (some RDBMS allow updates to base columns
-- even if the view defines additional computed columns; behavior depends on engine).

-- ---------- 4) DROP VIEW examples ----------
-- Drop single view
IF OBJECT_ID('Angajati_Proiecte_vw','V') IS NOT NULL
	DROP VIEW Angajati_Proiecte_vw;

-- Drop multiple views (if they exist)
IF OBJECT_ID('Date_Ang_vw','V') IS NOT NULL
	DROP VIEW Date_Ang_vw;

IF OBJECT_ID('AngSimple_vw','V') IS NOT NULL
	DROP VIEW AngSimple_vw;


-- ---------- MOVING A OBJECT FROM A SCHEMA TO ANOTHER SCHEMA ----------

-- The format of the command is: 
-- ALTER SCHEMA <newschema> TRANSFER <object>

/*
  Summary / Notes:
  - Use updatable views (simple views on a single base table without aggregates/computed
	expressions) to INSERT/UPDATE/DELETE through the view.
  - Views based on JOINs or containing GROUP BY, aggregates, DISTINCT, TOP, or
	computed columns are typically not updatable.
  - For complex updatable behavior you can create INSTEAD OF triggers on views
	(SQL Server) to intercept DML and propagate changes to base tables.
  - Always check your RDBMS documentation for exact rules about view updatability.
*/

