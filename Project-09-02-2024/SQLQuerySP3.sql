-- Stored Procedure 3: Eliminazione di un determinato verbale identificato con il proprio identificativo
CREATE PROCEDURE EliminaVerbale
    @IdVerbale INT
AS
BEGIN
    DELETE FROM VERBALE
    WHERE IdVerbale = @IdVerbale;
END;
GO