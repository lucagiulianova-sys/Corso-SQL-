-- INNER JOIN e JOIN sono la stessa cosa
-- Restituire la lista degli studenti iscritti
/*
	SELECT 
		t1.colonna1,
		t1.colonna2,
		t2.colonna6
		...
	FROM tabella AS t1
	INNER JOIN Tabella2 AS t2 
		ON  t1.colonnaId = t2.colonnaId <= condizione
*/
USE ScuolaDb;

SELECT * 
FROM Studenti AS s
INNER JOIN Iscrizioni AS i 
	ON s.StudenteId = i.StudenteId;

-- Restituisce la lista degli studenti iscritti
SELECT 
	CONCAT (Nome, ' ', Cognome) AS Studente,
	s.CodiceFiscale AS CF,
	s.Email,
	i.DataIscrizione AS [Data Iscrizione],
	i.Stato
FROM Studenti AS s
INNER JOIN Iscrizioni AS i
	ON s.StudenteId = i.StudenteId;

-- Restituisce la lista degli studenti iscritti
SELECT 
	CONCAT (Nome, ' ', Cognome) AS Studente,
	s.CodiceFiscale AS CF,
	s.Email,
	c.NomeCorso As [Nome del corso],
	c.Descrizione,
	i.DataIscrizione AS [Data Iscrizione],
	i.Stato
FROM Studenti AS s
INNER JOIN Iscrizioni AS i
	ON s.StudenteId = i.StudenteId
INNER JOIN Corsi AS c
	ON c.CorsoId = i.CorsoId
WHERE i.Stato = 'Attivo' OR i.Stato = 'Sospeso'
	ORDER BY i.Stato ASC;


