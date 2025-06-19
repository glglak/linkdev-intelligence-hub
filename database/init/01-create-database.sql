USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'LinkDevIntelligence')
BEGIN
    CREATE DATABASE LinkDevIntelligence
    COLLATE Arabic_CI_AS;
END
GO

USE LinkDevIntelligence;
GO