-- Stored Procedure 2: Totale dei punti decurtati in una determinata data
CREATE PROCEDURE VisualizzaTotalePuntiDecurtatiPerData
    @Data NVARCHAR(10)
AS
BEGIN
    SELECT SUM(DecurtamentoPunti) AS Totale_Punti_Decurtati_nel_giorno
    FROM VERBALE
    WHERE DataViolazione = @Data;
END;
GO
