/*
	Lezione 1 – Il comando SELECT
	
	1. Cos'è SELECT?
	SELECT è il comando SQL utilizzato per interrogare una o più tabelle e recuperare i dati che ci interessano.
	
	2. A cosa serve?
	Permette di:
		- visualizzare tutte le colonne di una tabella;
		- selezionare soltanto alcune colonne;
		- creare colonne calcolate;
		- assegnare nomi personalizzati alle colonne del risultato;
		- individuare valori distinti.
	
	3. Perché è importante per un Data Analyst?
	Un Data Analyst raramente ha bisogno di visualizzare un'intera tabella. 
	Generalmente deve estrarre soltanto le informazioni utili per rispondere a una domanda aziendale.

	Per esempio:
		- Quanti studenti sono iscritti?
		- Quali corsi sono disponibili?
		- Quali studenti hanno un indirizzo email?
		- Quali sono i voti degli studenti?
		- Quanto costa ciascun corso?

	SELECT è quindi uno dei comandi fondamentali per costruire report e analisi.

	4. Sintassi di base
	SELECT Colonna1, Colonna2, Colonna3
	FROM NomeTabella;


	- SELECT: indica quali colonne vogliamo visualizzare.
	- FROM: indica da quale tabella recuperare i dati.
	- ;: termina l'istruzione SQL.



	Obiettivi del modulo
		- Estrarre dati da una o più tabelle.
		- Selezionare soltanto le colonne necessarie.
		- Filtrare i dati in base a condizioni.
		- Ordinare e limitare i risultati.
		- Individuare valori mancanti e duplicati.
		- Preparare dataset per report e dashboard.
*/


-- Estrarre dati da una o più tabelle.

USE ScuolaDb;
GO

-- ESEMPIO 1
SELECT * FROM AnniScolastici;
-- Visualizzare tutti i dati della tabella Studenti

SELECT *
FROM Studenti;

-- Eeempio 2
-- Selezionare soltanto le colonne necessarie dalla tabella studenti
-- Visualizzare. Mome, Cognome, Mail, Codice fiscale, Sesso

SELECT
	Nome,
	Cognome,
	Email,
	CodiceFiscale,
	Sesso
FROM Studenti; 

-- Esempio 3
-- Filtrare i dati in base a condizioni usando la (WHERE).
-- WHERE filtra i dati della tabella in base alle condizioni

SELECT * FROM Aule;

-- Vogliamo recuperare l'aula 5
SELECT * FROM Aule
WHERE AulaId = 7;

-- Esempio 3.1
-- Concatenazione: permette di unire più stringhe usando il "+"
-- Esempio com la tabella studenti
-- Restituire il nome completo dello studente con il codice fiscale

SELECT 
	Nome,
	Cognome,
	CodiceFiscale
FROM Studenti;

-- Per restituire il mome completo che non è previsto nella tabella, si usa "ALIAS (AS)" per definire una 
-- colonna creata. Senza "AS" la colonna restituita non avrebbe nome, si vedrebbe la scitta (Nessun nome di colonna)

SELECT 
	Nome + ' ' + Cognome AS NomeCompleto,
	CodiceFiscale
FROM Studenti;

-- Esisotno vari metodi di concatenazione (Formattazione)
SELECT 
	Nome + ' - ' + Cognome AS [Nome Completo],
	CodiceFiscale AS [Codice Fiscale]
FROM Studenti;


-- Ordinare ed eliminare i dati che non vigliamo, es. NULL con IS NULL e IS NOT NULL
ALTER TABLE Aule ALTER COLUMN TipoAula NVARCHAR(50) NULL;
ALTER TABLE Aule ALTER COLUMN Capacita INT NULL;
INSERT INTO Aule (
	NomeAula,
	TipoAula,
	Capacita,
	Piano,
	Attiva
	)
VALUES ('Aula 31',NULL, NULL, NULL, 0);


SELECT * FROM Aule
WHERE Piano IS NULL;

-- Inserimento della classe con valore NULL
INSERT INTO Classi (
	NomeClasse, 
	AnnoScolasticoId, 
	TutorDocenteId)
VALUES ('2IT-Sezione 35', 12, 30);

SELECT * FROM Classi
WHERE NomeClasse = '2IT-Sezione 35';

-- Limitare il risultato della SELECT alle prime 5 righe
SELECT TOP 5 * FROM Studenti;

SELECT TOP 5 * FROM Studenti
WHERE Sesso = 'F';

SELECT TOP 3 * FROM Studenti
WHERE Sesso = 'M';





