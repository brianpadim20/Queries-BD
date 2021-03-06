/*FUNCI?N PARA OBTENER EL NOMBRE DEL MES CON BASE A LA FECHA DADA*/
CREATE FUNCTION MESLETRAS(@FECHA DATE)
RETURNS VARCHAR (20)
AS
BEGIN
	DECLARE @NOMBRE VARCHAR (20)
	SET @NOMBRE = CASE DATENAME (MONTH, @FECHA)
		WHEN 'JANUARY' THEN 'JAN.'
		WHEN 'FEBRUARY' THEN 'FEB.'
		WHEN 'MARCH' THEN 'MAR.'
		WHEN 'APRIL' THEN 'APR.'
		WHEN 'MAY' THEN 'MAY.'
		WHEN 'JUNE' THEN 'JUN.'
		WHEN 'JULY' THEN 'JUL.'
		WHEN 'AUGUST' THEN 'AUG.'
		WHEN 'SEPTEMBER' THEN 'SEPT.'
		WHEN 'OCTOBER' THEN 'OCT.'
		WHEN 'NOVEMBER' THEN 'NOV.'
		WHEN 'DECEMBER' THEN 'DEC.'
	END
	RETURN @NOMBRE
END

SELECT DBO.MESLETRAS (GETDATE()) AS "MES ACTUAL"

DECLARE @FEC DATE = GETDATE()
PRINT 'LA FECHA ' + CAST(@FEC AS VARCHAR(15)) + ' TIENE COMO MES A: ' + DBO.MESLETRAS (GETDATE ())

SELECT NOM_CLI AS "NOMBRE DEL CLIENTE", 
	   TEL_CLI AS "TEL?FONO",
	   CAST (DAY(FEC_ING_CLI) AS CHAR (2)) + ' DE ' + DBO.MESLETRAS(FEC_ING_CLI) + ' DEL '  + CAST(YEAR(FEC_ING_CLI) AS CHAR (4))
	   AS "FECHA"
FROM CLIENTES

