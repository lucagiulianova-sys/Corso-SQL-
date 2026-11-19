USE master;

CREATE DATABASE Azienda_DB;
GO

USE Azienda_DB;
GO

-- Dipendenti
CREATE TABLE Dipendenti (
	DipendenteId INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Nome NVARCHAR (100) NOT NULL,
	Cognome NVARCHAR (100) NOT NULL,
	CodiceFiscale CHAR (16) NOT NULL UNIQUE,
	Telefono NVARCHAR (25) NULL,
	Email NVARCHAR (100) NULL
);

SELECT * FROM Dipendenti;

CREATE TABLE Stipendi (
	StipendioId INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	DipendenteId INT NOT NULL,
	Importo DECIMAL (10,2) NOT NULL,
	DataPagamento DATE DEFAULT GETDATE (),
	OreLavorate DECIMAL (5,2) NOT NULL,
	TasseRitenuta DECIMAL (10,2),
	Straordinari DECIMAL (5,2)
	
	FOREIGN KEY (DipendenteId) REFERENCES Dipendenti(DipendenteId)
);

SELECT * FROM Stipendi;

-- Modifica del nome di una tabella
EXEC sp_rename 'Dipendente', 'Dipendenti';

-- Modifica del nome del nome della colonna CodiceFiscale 
EXEC sp_rename 'Dipendenti.CodiceFiscale', 'Codice_Fiscale';

-- Modificare il nome di una colonna
ALTER TABLE Stipendi ALTER COLUMN TasseRitenuta DECIMAL(10, 2) NOT NULL;
ALTER TABLE Stipendi ADD CONSTRAINT CK_Stipendi_importo CHECK (Importo >= 0);
ALTER TABLE Stipendi ADD CONSTRAINT CK_Stipendi_TasseRitenuta CHECK (TasseRitenuta >= 0);

-- Controllo dell ore lavorative e straordinarie
ALTER TABLE Stipendi ADD CONSTRAINT CK_Stipendi_OreLavorte CHECK (OreLavorate >= 0 AND Straordinari >=0);

-- Verifica del vincolo Stipendi
SELECT 
    name AS NomeVincolo,
    type_desc AS TipoVincolo
FROM sys.check_constraints 
WHERE parent_object_id = OBJECT_ID('Stipendi');



-- Create, Read, Update, Delete
-- Inserimento dei dati
INSERT INTO Dipendenti (
	Nome,
	Cognome,
	CodiceFiscale,
	Telefono,
	Email)
VALUES	('Beniamino', 'Ale', 'ABCD123456TE258P', '+393562147890','b.ale@gmail.it'),
		('Mario', 'Rossi', 'RSSMRA85M01H501Z', '+3935621470000', 'm.rossi@gmail.com'),
		('Christian', 'Pegoraro', 'PGRCRS1234567890','+392345678901','c.pegoraro@gmail.it'),
		('Francesca', 'Pitzanti', 'FGHYWBSSSHAUAJGS', '+393567896478', 'f.pitzanti@gmail.it'),
		('Simone', 'Ale', 'SIMO243567YTR67O', '+390003336767', 'Simo.ale@gmail.it'),
		('Jeanyfer', 'Andrades', 'ARCD234056YK258P', '+393586541324', 'j.andrades@gmail.it'),
		('Raquel','Santana',' DFSGSD8266225N', '393214569', 'raquelsantana@outlook.it'),
		('Chiara', 'Bono', 'BCAS562147XS456O', '+394512365478', 'c.bno@gmail.it'),
		('Davide','De Rossi', 'DDR216354TA258D', '+39388526563','d.rossi@gmail.com'),
		('Caterina','Franco','ASDO1O39079D3124', '+39 32189421', 'catcat@mail.it'),
		('Paolo', 'Rossi', 'PUEKOI157893DOIE', '+3935874687','paolorossi@aruba.it'),
		('Italo', 'Massacesi', 'MSSTLI45P56E567I', '+3932381234567', 'italo.m@gmail.com');

SELECT * FROM Dipendenti;

INSERT INTO Stipendi (
	DipendenteId,
	Importo,
	DataPagamento,
	OreLavorate,
	TasseRitenuta,
	Straordinari
)
VALUES
    (9, 2300.00,'2026-11-10', 175, 5.98, 15),
    (10, 2200.00, '2025-12-08', 160.00, 310.50, 9.00),
    (11, 2900.00, '2026-11-30', 168, 450.00, 12),
    (12, 3200.00, '2026-04-30', 176, 600.00, 18),
    (13, 5000.00, '2026-03-30', 100, 875.00, 15),
    (14, 3500.00, '2026-02-18', 150, 250.00, 12),
    (15, 1850.00, '2026-06-28', 145, 250.00, 8),
    (16, 2600.00, '2026-05-30', 200, 350.00, 80),
    (17, 3100.00, '2026-11-15', 150, 300, 10),
    (18, 3500.00, '2026-01-30', 160, 500.00, 20),
    (19, 3000.00, '2026-12-18', 165.00, 500.00, 10.00),
    (20, 1500.00, '2026-09-30', 120, 18, 2); 

SELECT * FROM Stipendi;


-- Restituisce le prime 5 righe della tabella stipendi
SELECT TOP 5 * FROM Stipendi;

-- DISTINCT permette di rimuovere i duplicati
USE ScuolaDb;

INSERT INTO Studenti(
	Nome,
	Cognome,
	DataNascita,
	CodiceFiscale,
	Sesso,
	Email,
	Telefono,
	Citta,
	Attivo)
VALUES
    ('Luca', 'Rossi', '2009-01-01', 'MSS0000000000PPP', 'M', 'l.rossi@studenti.it', '+393200258945', 'Ferrara', 0),
	('Luca', 'Rossi', '2009-01-01', 'MSS0000000300PPP', 'M', 'l.rossi1@studenti.it', '+393200278945', 'Ferrara', 0)
SELECT * FROM Studenti ORDER BY Nome ASC;


-- Provare a inserire un altro Luca Rossi con dati diversi
SELECT DISTINCT
	Nome,
	Cognome,
	Citta
FROM Studenti 
WHERE Nome = 'Luca';




-- Clienti
-- Dipendenti
-- Fornitori
-- Prodotti
-- Magazzino
-- Ordine
-- Fattura
-- Documenti
