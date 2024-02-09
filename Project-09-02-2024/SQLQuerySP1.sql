-- Stored Procedure 1: Elenco delle contravvenzioni effettuate in un determinato anno
CREATE PROCEDURE VisualizzaContravvenzioniPerAnno
    @Anno INT
AS
BEGIN
    SELECT *
    FROM VERBALE
    WHERE YEAR(DataViolazione) = @Anno;
END;
GO