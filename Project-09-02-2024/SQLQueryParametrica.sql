-- Query 9: Query parametrica che visualizzi Data violazione, Importo e decurtamento punti relativi ad una certa data

CREATE PROCEDURE QueryParametrica

@Data NVARCHAR(10)

AS
BEGIN

SELECT DataViolazione, Importo, DecurtamentoPunti
FROM VERBALE 
WHERE DataViolazione = @Data;

END
GO
