-- Query 1: Conteggio dei verbali trascritti
SELECT COUNT(*) AS conteggio_verbali
FROM VERBALE;

-- Query 2: Conteggio dei verbali trascritti raggruppati per anagrafe
SELECT A.IdAnagrafica, A.Nome, A.Cognome, COUNT(*) AS verbali_per_persona 
FROM ANAGRAFICA AS A
INNER JOIN VERBALE AS V
ON A.IdAnagrafica = V.IdAnagrafica
GROUP BY A.IdAnagrafica, A.Nome, A.Cognome;

-- Query 3: Conteggio dei verbali trascritti raggruppati per tipo di violazione
SELECT TP.Descrizione, COUNT(*) AS verbali_per_violazione
FROM TIPO_VIOLAZIONE AS TP
INNER JOIN VERBALE AS V 
ON V.IdViolazione = TP.IdViolazione
GROUP BY TP.Descrizione

-- Query 4: Totale dei punti decurtati per ogni anagrafe
SELECT A.IdAnagrafica, A.Nome, A.Cognome, SUM(V.DecurtamentoPunti) AS punti_decurtati
FROM ANAGRAFICA AS A
INNER JOIN VERBALE AS V
ON A.IdAnagrafica = V.IdAnagrafica
GROUP BY A.IdAnagrafica, A.Nome, A.Cognome;

-- Query 5: Cognome, Nome, Data violazione, Indirizzo violazione, importo e punti decurtati per tutti gli anagrafici residenti a Palermo
SELECT  A.Cognome, A.Nome,A.Città, V.DataViolazione, V.IndirizzoViolazione, V.Importo, V.DecurtamentoPunti
FROM ANAGRAFICA AS A
INNER JOIN VERBALE AS V
ON A.IdAnagrafica = V.IdAnagrafica
WHERE A.Città = 'Palermo'

-- Query 6: Cognome, Nome, Indirizzo, Data violazione, importo e punti decurtati per le violazioni fatte tra il febbraio 2009 e luglio 2009
SELECT  A.Cognome, A.Nome,A.Città, V.DataViolazione, V.IndirizzoViolazione, V.Importo, V.DecurtamentoPunti
FROM ANAGRAFICA AS A
INNER JOIN VERBALE AS V
ON A.IdAnagrafica = V.IdAnagrafica
WHERE V.DataViolazione BETWEEN '01/02/2009' AND '31/07/2009'

-- Query 7: Totale degli importi per ogni anagrafico
SELECT a.IdAnagrafica, A.Cognome, A.Nome, SUM(V.Importo)
FROM ANAGRAFICA AS A
INNER JOIN VERBALE AS V
ON A.IdAnagrafica = V.IdAnagrafica
GROUP BY A.IdAnagrafica, A.Nome, A.Cognome;

-- Query 8: Visualizzazione di tutti gli anagrafici residenti a Palermo
SELECT *
FROM ANAGRAFICA
WHERE Città = 'Palermo';

-- Query 9: Query parametrica che visualizzi Data violazione, Importo e decurtamento punti relativi ad una certa data
DECLARE @DataParam DATE = '01/02/2009';
SELECT DataViolazione, Importo, DecurtamentoPunti
FROM VERBALE 
WHERE DataViolazione = @DataParam;

-- Query 10: Conteggio delle violazioni contestate raggruppate per Nominativo dell’agente di Polizia
SELECT Nominativo_Agente, COUNT(*) AS Numero_Violazioni_Contestate
FROM VERBALE
GROUP BY Nominativo_Agente;

-- Query 11: Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino il decurtamento di 5 punti
SELECT  A.Cognome, A.Nome, V.IndirizzoViolazione, V.DataViolazione, V.Importo, V.DecurtamentoPunti
FROM ANAGRAFICA AS A
INNER JOIN VERBALE AS V
ON A.IdAnagrafica = V.IdAnagrafica
WHERE V.DecurtamentoPunti > 5

-- Query 12: Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino l’importo di 400 euro
SELECT  A.Cognome, A.Nome, V.IndirizzoViolazione, V.DataViolazione, V.Importo, V.DecurtamentoPunti
FROM ANAGRAFICA AS A
INNER JOIN VERBALE AS V
ON A.IdAnagrafica = V.IdAnagrafica
WHERE V.Importo > 400