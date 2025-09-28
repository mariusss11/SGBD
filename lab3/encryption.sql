USE master;
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD= 'P-2331!@#$%programare';
GO

CREATE CERTIFICATE MyServerCert
    WITH SUBJECT = 'My DEK Certificate';
GO

USE EcoCarRental;
GO

CREATE DATABASE ENCRYPTION KEY WITH ALGORITHM = AES_256
    ENCRYPTION BY SERVER CERTIFICATE MyServerCert;
GO

ALTER DATABASE EcoCarRental
    SET ENCRYPTION ON;
GO


-- Backup the certificate and the private key
USE master;
GO

BACKUP CERTIFICATE MyServerCert
   TO FILE = '/var/opt/mssql/backup/MyServerCert.cer'
   WITH PRIVATE KEY (
       FILE = '/var/opt/mssql/backup/MyServerCert.pvk',
       ENCRYPTION BY PASSWORD = 'StrongPassword!123'
   );
GO