USE master
GO
CREATE DATABASE LIBRERIA
GO
USE LIBRERIA

CREATE TABLE LIBROS
(	
	CODIGO INT IDENTITY,
	TITULO VARCHAR (40),
	AUTOR VARCHAR (30),
	PRECIO DECIMAL (6,2),
	STOCK INT,
	CONSTRAINT PK_LIBROS PRIMARY KEY (CODIGO)
)

CREATE TABLE VENTAS
(
	NUMERO INT IDENTITY,
	FECHA DATETIME,
	CODIGOLIBRO INT NOT NULL, /*FK*/
	PRECIO DECIMAL (6,2),
	CANTIDAD INT NOT NULL
	CONSTRAINT PK_VENTAS PRIMARY KEY (NUMERO),
	CONSTRAINT FK_VENTAS_CODIGOLIBRO FOREIGN KEY (CODIGOLIBRO)
	REFERENCES LIBROS (CODIGO) /*REFERENCIA AL CODIGO DE LA TABLA LIBROS*/
)
GO
INSERT INTO LIBROS VALUES
('UNO', 'RICHARD BACH', 15, 100),
('ILUSIONES','RICHARD BACH',18,50),
('EL ALEPH','JORGE LUIS BORGES',25,200),
('APRENDA PHP','MARIO MOLINA',45,200)

CREATE TRIGGER DIS_VENTAS_INSERTAR
ON VENTAS
FOR INSERT
AS
DECLARE @STOCK INT
SELECT @STOCK = STOCK FROM LIBROS
				JOIN inserted
				ON inserted.CODIGOLIBRO=LIBROS.CODIGO
				WHERE LIBROS.CODIGO = inserted.CODIGOLIBRO

IF(@STOCK >= (SELECT CANTIDAD FROM inserted))
	UPDATE LIBROS SET STOCK = STOCK - inserted.CANTIDAD
	FROM LIBROS
	JOIN inserted
	ON inserted.CODIGOLIBRO = LIBROS.CODIGO
	WHERE CODIGO = inserted.CODIGOLIBRO
ELSE
	BEGIN
		RAISERROR('HAY MENOS LIBROS EN STOCK DE LOS SOLICITADOS PARA LA VENTA', 16,1) /*SE CREA UN MENSAJE DE ERROR CON PARÁMETROS
																					  QUE UNO MISMO ELIGE PARA ESE ERROR*/
		ROLLBACK TRANSACTION
	END
GO