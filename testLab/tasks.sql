USE master;

-- Create a login
CREATE LOGIN mariusLogin
WITH PASSWORD = 'qwerty!@3'

-- Use the instance of the desired database
USE Magazin_Electronic_Andries;

-- Create a user for that specific database
CREATE USER marius
FOR LOGIN mariusLogin;

-- Give the user the desired permissions
GRANT SELECT, INSERT, UPDATE ON imprimante TO marius;
GRANT SELECT, INSERT, UPDATE ON laptop_uri TO marius;
GRANT SELECT, INSERT, UPDATE ON pc_uri TO marius;
GRANT SELECT, INSERT, UPDATE ON produse TO marius;

-- Give a role to the user
ALTER ROLE db_datawriter ADD MEMBER marius;
ALTER ROLE db_datareader ADD MEMBER marius;

-- Create a schema
CREATE SCHEMA devices;

-- Move the tables in the created schema
ALTER SCHEMA devices
TRANSFER dbo.imprimante;

ALTER SCHEMA devices
TRANSFER dbo.pc_uri;

ALTER SCHEMA devices
TRANSFER dbo.laptop_uri;

-- Check if the tables were transfered 
SELECT *
FROM devices.laptop_uri

-- Create synonyms 
CREATE SYNONYM laptops FOR devices.laptop_uri;
CREATE SYNONYM pcs FOR devices.pc_uri;

-- SELECT QUERIES


-- Să se afișeze pe ecran toate pc_urile ce au prețul > 400, 
-- selectând datele prin intermediul sinonileor.
SELECT *
FROM pcs
WHERE pret > 400

-- Să se afișeze toate produsele produse 
-- de producatorul B ordonate după model,
SELECT *
FROM produse
WHERE Producator = 'B'
ORDER BY Model

-- Creați o vedere care va afișa numărul pc-uri unde valoarea
--  câmpului e diferita de null sau alegeți un criteriu la dorință,
CREATE VIEW devices.good_pcs
AS
    SELECT *
    FROM pcs
    WHERE RAM  >= 16;

SELECT *
FROM devices.good_pcs

-- Să se creeze o vedere care va afișa cel mai ieftin pc.
CREATE VIEW devices.cheapest_pc
AS
    SELECT TOP 1
        *
    FROM pcs
    ORDER BY Pret ASC;


-- Să se creze un index asupra tabelului PC-uri, 
-- pentru cel mai des selectat atribut.
CREATE INDEX idx_pcs_details ON devices.pc_uri(Pret);

-- Să se foloseasca expresia case pentru a returna un text 
-- informativ-daca viteza <500 să afișeze slab, >500- normal,
SELECT
    *,
    CASE
        WHEN viteza < 500 THEN 'Slab'
        WHEN viteza >= 500 THEN 'Normal'
    END as Generals
FROM devices.good_pcs

