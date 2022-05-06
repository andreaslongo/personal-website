-- Eine neue Datenbank anlegen
CREATE DATABASE NeueDatenbankAlongo
;


-- Datenbank mit USE auswählen
USE [NeueDatenbankAlongo]
;


-- Eine Tabelle erstellen
CREATE TABLE Mitarbeiter (
    MitarbeiterID int IDENTITY (1,1) NOT NULL,
    Vorname nvarchar(50) NOT NULL,
    Nachname nvarchar(50) NOT NULL,
    Job nvarchar(50) NULL,
    Email nvarchar(50) NOT NULL
);


-- Eine Spalten in eine Tabelle einfügen
ALTER TABLE Mitarbeiter
    ADD Gehalt money
;


-- Mehrere Spalten einfügen
ALTER TABLE Mitarbeiter
    ADD ZweiterVorname nvarchar(50),
        BonusProzent int,
        LeistungsBewertung int
;


-- Spalten aus aus einer Tabellen entfernen
ALTER TABLE Mitarbeiter
    DROP COLUMN Gehalt,
                ZweiterVorname,
                BonusProzent,
                Leistungsbewertung
;

-- Eine Tabelle entfernen
CREATE TABLE MitarbeiterKopie (
    MitarbeiterID int IDENTITY (1,1) NOT NULL,
    Vorname nvarchar(50) NOT NULL,
    Nachname nvarchar(50) NOT NULL,
    Job nvarchar(50) NULL,
    Email nvarchar(50) NOT NULL
);

DROP TABLE MitarbeiterKopie
;



-- Alle Spalten abfragen
SELECT *
FROM Mitarbeiter
;


-- Datensätze eintragen
INSERT INTO Mitarbeiter
    VALUES ('Martin', 'Hofer', 'IT Support', 'mhofer@example.com')
;


-- Datensätzen gezielt eintragen
INSERT INTO Mitarbeiter (Email, Vorname, Nachname)
    VALUES ('mpichler@example.com', 'Mathias', 'Pichler'),
           ('sscherer@example.com', 'Stefan', 'Scherer')
;


-- Mehrere Datensätze ändern
ALTER TABLE Mitarbeiter
    ADD Teilzeit char(4)    -- neue Spalte
;

UPDATE Mitarbeiter
    SET Teilzeit = 'nein'
;


-- Alle Spalten abfragen
SELECT *
FROM Mitarbeiter
;


-- Eine Spalte abfragen
SELECT Nachname
FROM Mitarbeiter
;


-- Mehrere Spalten abfragen
SELECT Vorname, Nachname, Job
FROM Mitarbeiter
;


-- Ergebnisse anpassen
SELECT
    Nachname,
	Email AS [E-Mail Adresse],
	Teilzeit AS [Teilzeit Anstellung]
FROM Mitarbeiter
;


-- Datensätze filtern
SELECT MitarbeiterID, Vorname, Nachname, Job
FROM Mitarbeiter
WHERE MitarbeiterID = 1;

SELECT MitarbeiterID, Vorname, Nachname, Job
FROM Mitarbeiter
WHERE MitarbeiterID > 1;

SELECT Vorname, Nachname, Job
FROM Mitarbeiter
WHERE Job LIKE '%support%';


-- Datensätze löschen
DELETE
    FROM Mitarbeiter
    WHERE MitarbeiterID = 2
;

-- Einen Datensatz ändern
UPDATE Mitarbeiter
    SET Email = 'itsupport@example.com'
    WHERE Email = 'mhofer@example.com'
;
