/*
	Operatoi aritmetici +, -, /, *, %
	
	Operatori di confromto =, !=, <>, >, <, <=, >=

	Operatori logici AND, OR, NOT

	Operatori di assegnazione =, +=, -=, *=, /=, %=

	DECLARE @Importo1 DECIMAL (10,2);
	DECLARE @Importo2 DECIMAL (10,2);
	DECLARE @Somma DECIMAL (10,2);

	SET @Importo1 = 100.00;
	SET @Importo2 = 200.00;
	SET @Somma = @Importo1 + @Importo2;

	PRINT La somma ei due importi è: ' + CAST(@SOMMA AS NVARCHAR(10));


	Operatori speciali IS NULL, IS NOT NULL, BETWEEN, IN(), LIKE, EXISTS
*/

SELECT 
	10 + 20 Addizione,
	10 - 20 Sottrazione,
	10 * 20 Moltiplicazione,
	10 / 20 Divisione,
	10 % 20 Modulo;


SELECT * FROM Voti
WHERE Voto >= 6;

-- ORDER BY permette di ordinare le colonne, ASC Ascendente, DESC discendente

SELECT * FROM Voti
WHERE Voto >= 6 ORDER BY Voto DESC;


SELECT 12 < 15 AND 15 > 13;

SELECT * FROM Pagamenti
WHERE Importo >= 200 AND Importo <= 300;

SELECT * FROM Pagamenti
WHERE Importo >= 200 OR Importo <= 300;

SELECT * FROM Classi
WHERE Descrizione IS NULL OR Descrizione = 'Classe formativa numero 22'


-- Esempio di BETWEEN
SELECT * FROM Pagamenti
WHERE Importo BETWEEN 200 AND 300;


SELECT * FROM Classi
WHERE Descrizione IS NOT NULL 
	AND Descrizione <> 'Classe formativa numero 16'
	AND Descrizione != 'Classe formativa numero 10';


-- Cercare i pagamenti effettuati nel periodo (1/1/2026  31/12/2026)
SELECT * FROM Pagamenti
WHERE DataPagamento BETWEEN '2026-01-01' AND '2026-12-31' AND MetodoPagamento = 'Carta'
					AND Stato = 'In attesa';


-- Esempio di IN() verifica se un valore appartiene ad un elenco di valori specificati
-- Serve a evitare molte condizioni OR
SELECT * FROM Docenti
WHERE DocenteId = 1 OR DocenteId = 5 OR DocenteId = 15 OR DocenteId = 17

SELECT * FROM Docenti
WHERE DocenteId IN(1,5, 15, 17);


-- Restituire la lista dei voti escludendo i voti congli id 14, 5, 16, 30
SELECT * FROM Voti
WHERE VotoId NOT IN (5, 14, 16, 30);

-- Restituire 5 classi 
SELECT * FROM Classi
WHERE ClasseId IN (7, 10, 28, 31, 17);


/* 
	LIKE consente di cercare un modello di testo all'interno di una colonna

	Serve quando non conosciamo un valore completo che stiamo cercando

	'a%' significa che restituisce tutti i valori che cominciano con la lettera "a"
	'%i' significa che restituisce tutti i valori che finiscono  con la lettera "i"
	'%i%' significa che restituisce tutti i valori che hanno la lettera "i" all'interno

*/

-- Esempi di LIKE
SELECT * FROM Studenti
WHERE Nome LIKE 'M%';

SELECT * FROM Studenti
WHERE Nome LIKE 'M%' AND Cognome LIKE '%i';

SELECT * FROM Studenti
WHERE Nome LIKE 'M___o';

SELECT * FROM Studenti
WHERE Nome LIKE '%M_s%';

/*
	EXISTS verifica se una sottoquery ha almeno una riga
	E' utile se si vogliono verificare delle relazioni fra due tbelle
*/
-- Esempio 1, vogliamo restituire gli studenti che hanno almeno un iscrizione
SELECT * FROM Studenti 
WHERE EXISTS (
	SELECT 1 FROM Iscrizioni
	WHERE Studenti.StudenteId = Iscrizioni.StudenteId);

-- Essempio 2
SELECT 
    CONCAT(s.Nome, ' ', s.Cognome) AS [Studente],
    s.CodiceFiscale AS CF
FROM Studenti AS s 
WHERE EXISTS (
    SELECT 1
    FROM Iscrizioni AS i
    WHERE s.StudenteId = i.StudenteId
)

-- Vogliamo individuare i corsi che hanno almeno uno studente iscritto
SELECT * FROM Corsi AS C
WHERE EXISTS (
	SELECT 1 FROM Iscrizioni AS i
	WHERE i.CorsoId = C.CorsoId);


	SELECT * FROM Iscrizioni;
	SELECT 1 from Iscrizioni;
	
