/*
	INSERT INTO
	è un istruzione SQL utilizzata per inserire nuovi record 
	aall'interno di una tabella.

	Sintassi di base:

	INSERT INTO NomeTabella 
		(colonna1, colonna2, ...)
	VALUES (valore1, valore2, ...)
*/

USE ScuolaDB;

-- Insert Studenti
INSERT INTO Studenti
(
    Nome,
    Cognome,
    DataNascita,
    Email,
    Telefono,
    CodiceFiscale,
    Attivo
)
VALUES
	('Luca', 'Bianchi', '1999-02-10',
	'luca@email.it', '3331111111',
	'BNCLCU99B10H501A', 1),

	('Anna', 'Verdi', '2000-07-20',
	'anna@email.it', '3332222222',
	'VRDNNA00L60H501B', 1),

	('Marco', 'Neri', '1997-11-05',
	'marco@email.it', '3333333333',
	'NREMRC97S05H501C', 1),

	('Sara', 'Rossi', '2001-03-12',
	'sara@email.it', '3334444444',
	'RSSSRA01C52H501D', 1),

	('Paolo', 'Gialli', '1998-09-25',
	'paolo@email.it', '3335555555',
	'GLLPLA98P25H501E', 1);

SELECT * FROM Studenti;

DELETE FROM Aule;

-- Insert dei corsi
INSERT INTO Corsi
(
    NomeCorso,
    Descrizione,
    Crediti,
    Durata
)
VALUES
('SQL Server per Data Analysis',
 'Analisi e gestione dei dati con SQL Server',
 12, 60),

('Python Data Analysis',
 'Analisi dei dati utilizzando Python e Pandas',
 15, 80),

('Programmazione C#',
 'Fondamenti di programmazione con C# e .NET',
 10, 60),

('Database Administration',
 'Gestione, sicurezza e amministrazione dei database',
 14, 90),

('Power BI',
 'Creazione di dashboard e report aziendali',
 10, 40);

SELECT * FROM Corsi;


 -- Inserimento Docenti
INSERT INTO Docenti
(
    Nome,
    Cognome,
    Email,
    Telefono,
    Specializzazione,
    CodiceFiscale
)
VALUES
('Moussa', 'Salisou',
 'moussa@email.it', '3401111111',
 'SQL Server e Data Analysis',
 'SLSMSS90A01H501A'),

('Antonio', 'Bianchi',
 'antonio@email.it', '3402222222',
 'Programmazione C#',
 'BNCNTN85B12H501B'),

('Laura', 'Verdi',
 'laura@email.it', '3403333333',
 'Python e Machine Learning',
 'VRDLRA88C45H501C'),

('Marco', 'Rossi',
 'marco.docente@email.it', '3404444444',
 'Power BI e Business Intelligence',
 'RSSMRC80D15H501D');

SELECT * FROM Docenti; 

EXEC sp_rename 'Aule.Capacità', 'Capacita';

  -- Inserimento delle Aule
INSERT INTO Aule
(
    NomeAula,
    Capacita
)
VALUES
	('Aula Informatica 1', 25),
	('Aula Informatica 2', 20),
	('Laboratorio SQL', 15),
	('Laboratorio Python', 18),
	('Aula Formazione', 30);

SELECT * FROM Aule;

SELECT * FROM Studenti;

-- Inserimento 
INSERT INTO Iscrizioni
(
    StudenteId,
    CorsoId,
    DataIscrizione
)
VALUES
	(12, 1, '2026-11-01'),
	(13, 1, '2026-11-02'),
	(14, 2, '2026-11-03'),
	(15, 3, '2026-11-04'),
	(16, 4, '2026-11-05'),
	(6, 5, '2026-11-06');

SELECT * FROM Iscrizioni;