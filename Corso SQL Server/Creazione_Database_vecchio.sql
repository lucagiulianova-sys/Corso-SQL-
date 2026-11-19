-- La base di SQL Server

/* 
	Tipi di dati in SQL Server
	| Tipo             | Quando usarlo                    |
	| ---------------- | -------------------------------- |
	| INT  = INTERGER  | numeri interi (ID, età) = 100 000 000          |
	| CHAR             | un solo carattere (esempio il genere)
	| DECIMAL(10,2)    | soldi (precisione!)              |
	| NVARCHAR, VARCHAR| testo (sempre meglio di VARCHAR) |
	| DATE             | solo data                        |
	| DATETIME         | data + ora                       |
	| BIT              | booleano (0/1)   Vero o Falso    |

*/

-- Creazione del Data Base
CREATE DATABASE ScuolaDB;

-- Usa il Data Base creato prima
USE ScuolaDB;

/*
	Creazione Tabella

	Sintassi di base:
	Create table [nome_della_tabella] (
		La chiave primaria non può essere vuoto, deve incrementarsi di (1,1)
		colonne con tipo di dato e lunghezza
	);	
*/

-- Creazione tebella studenti
CREATE TABLE Studenti (
	
	StudenteID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
		-- IDENTITY (1,1) genera automaticamente i numeri
		-- Il primo 1 è il valore iniziale, il secondo indica l'incremento
	Nome NVARCHAR (50) NOT NULL,
	Cognome NVARCHAR (50) NOT NULL,
	DataNascita DATE NOT NULL,
	Email NVARCHAR (100) UNIQUE NULL,
	Telefono NVARCHAR (20) UNIQUE NULL,
	CodiceFiscale CHAR (16) UNIQUE NOT NULL,
	Attivo BIT DEFAULT 1 
);

/*
	Select * from [nome tabella] stituisce il risultato di tutte le righe 
*/
SELECT * FROM Studenti;

/*
	Tabella corsi
	Corso ID
	Nome corso
	Descrizione
	Crediti
	Durata
*/
CREATE TABLE Corsi (
	CorsoID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	NomeCorso NVARCHAR(60) NOT NULL,
	Descrizione NVARCHAR (250) NOT NULL,
	Crediti INT,
	Durata INT 
);

SELECT * FROM Corsi;

-- Creazione tabella Docenti
CREATE TABLE Docenti (
	DocenteID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	Nome NVARCHAR (50) NOT NULL,
	Cognome NVARCHAR(50) NOT NULL,
	Email NVARCHAR (150) UNIQUE NOT NULL,
	Telefono NVARCHAR (20) UNIQUE NOT NULL,
	Specializzazione NVARCHAR (100) NOT NULL,
	CodiceFiscale CHAR (16) UNIQUE NOT NULL
)

SELECT * FROM Docenti;

-- Creazione tabella aule
CREATE TABLE Aule (
	AulaID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	NomeAula NVARCHAR (100) NOT NULL,
	Capacità INT NOT NULL
);

SELECT * FROM Aule;

-- Modificare il nome di una colonna usando la procedura del System
-- EXEC sp_rename 'Studenti.StudentiID','StudenteID';

/*
	Chiave esterna in SQL Server
	Uno studente può iscrivewrsi a 1 o più corsi
	Tabella Iscrizioni
*/
CREATE TABLE Iscrizioni (
	IscrizioniID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	StudenteID INT NOT NULL,
	CorsoID INT NOT NULL,
	DataIscrizione DATE DEFAULT GETDATE(),

	-- Relazione tra Tabelle
	FOREIGN KEY (StudenteID) REFERENCES Studenti (StudenteID),
	FOREIGN KEY (CorsoID) REFERENCES Corsi (CorsoID)
); 

SELECT * FROM Iscrizioni;

-- Creazione tabella DocentiCorsi
CREATE TABLE DocentiCorsi (
	DocenteCorsoID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	DocenteID INT NOT NULL,
	CorsoID INT NOT NULL,

	FOREIGN KEY (DocenteId) REFERENCES Docenti (DocenteID),
	FOREIGN KEY (CorsoId) REFERENCES Corsi (CorsoID)
);

SELECT * FROM DocentiCorsi;


-- Creazioni tabella lezioni
CREATE TABLE Lezioni (
	LezioneID int not null PRIMARY KEY IDENTITY (1,1),
	CorsoID INT NOT NULL,
	AulaID INT NOT NULL,
	DataCreazione DATE DEFAULT GETDATE (),
	OraInizio TIME,
	OraFine TIME,

	FOREIGN KEY (AulaID)  REFERENCES Aule (AulaID),
	FOREIGN KEY (CorsoID) REFERENCES Corsi (CorsoID)
);

SELECT * FROM Lezioni;

