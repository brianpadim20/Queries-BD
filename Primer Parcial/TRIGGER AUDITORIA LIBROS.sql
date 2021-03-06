CREATE TRIGGER AUDITORIA_TABLA_LIBROS
ON LIBROS
AFTER INSERT, DELETE
AS
BEGIN
	SET NOCOUNT ON 
	INSERT INTO AUDITORIALIBROS
	(
		FECHA,
		CODIGO,
		TITULO,
		AUTOR,
		PRECIO,
		STOCK,
		OPERACION
	)
	SELECT 
		GETDATE(),
		CODIGO,
		TITULO,
		AUTOR,
		PRECIO,
		STOCK,
		'INS'
	FROM
		inserted
	UNION ALL 
	SELECT 
		GETDATE(),
		CODIGO, /*IDENTITY DE LIBROS*/
		TITULO,
		AUTOR,
		PRECIO,
		STOCK,
		'DEL'
	FROM
		deleted
END