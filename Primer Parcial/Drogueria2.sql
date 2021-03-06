USE MASTER 
GO 
CREATE DATABASE DROGUERIA2
GO 
USE DROGUERIA2
GO
CREATE TABLE CLIENTES 
(
	PK_CED_CLI NCHAR (15),
	NOM_CLI NCHAR (50) NULL,
	TEL_CLI NCHAR (20) NULL,
	CEL_CLI NCHAR (20) NULL,
	DIR_CLI NCHAR (100) NULL,
	FEC_ING_CLI DATETIME,
	CONSTRAINT PK_DE_CLIENTES PRIMARY KEY(PK_CED_CLI)
)

CREATE TABLE VENDEDORES
(
	PK_CED_VEN NCHAR (15),
	NOM_VEN NCHAR (50) NULL,
	TEL_VEN NCHAR (20) NULL,
	CEL_VEN NCHAR (20) NULL,
	DIR_VEN NCHAR (100) NULL,
	FEC_ING_VEN DATETIME NULL,
	CONSTRAINT PK_DE_VENDEDORES PRIMARY KEY(PK_CED_VEN)
)

CREATE TABLE ENC_FAC 
(
	PK_NUM_FAC NCHAR (15),
	FK_CED_CLI_FAC NCHAR (15),
	FEC_FAC DATETIME NULL,
	TOT_FAC INT NULL,
	FK_CED_VEN_FAC NCHAR(15) NULL,
	CONSTRAINT PK_DE_ENC_FAC PRIMARY KEY (PK_NUM_FAC),
	CONSTRAINT FK_CLIENTES_ENC_FAC FOREIGN KEY (FK_CED_CLI_FAC)
	REFERENCES CLIENTES(PK_CED_CLI),
	CONSTRAINT FK_VENDEDORES_ENC_FAC FOREIGN KEY (FK_CED_VEN_FAC)
	REFERENCES VENDEDORES(PK_CED_VEN)
)

CREATE TABLE TIPO
(
	PK_ID_TIPO NCHAR(15),
	NOM_TIPO NCHAR(50) NULL,
	CONSTRAINT PK_DE_TIPO PRIMARY KEY (PK_ID_TIPO)
)

CREATE TABLE MARCA
(
	PK_ID_MARCA NCHAR (15),
	NOM_MARCA NCHAR (50) NULL,
	CONSTRAINT PK_DE_MARCA PRIMARY KEY(PK_ID_MARCA)
)

CREATE TABLE PROVEEDORES
(
	PK_NIT_PROV NCHAR(15),
	NOM_PROV NCHAR(50) NULL,
	TEL_PROV NCHAR(20) NULL,
	CEL_PROV NCHAR (20) NULL,
	DIR_PROV NCHAR (100) NULL,
	FEC_ING_PROV DATETIME NULL,
	CONSTRAINT PK_PROVEEDORES PRIMARY KEY (PK_NIT_PROV)
)

CREATE TABLE INVENTARIO
(
	PK_REF_INV NCHAR (15),
	FK_ID_TIPO_INV NCHAR (15),
	FK_ID_MARCA_INV NCHAR (15),
	FK_NIT_PROV_INV NCHAR (15),
	STOCK_INV INT NULL,
	VAL_COS_INV INT NULL,
	VAL_VENTA_INV INT NULL,
	FEC_ING_INV DATETIME NULL,
	DESC_INV NCHAR (50),
	CONSTRAINT PK_DE_INVENTARIO PRIMARY KEY (PK_REF_INV),
	CONSTRAINT FK_INVENTARIO_TIPO FOREIGN KEY (FK_ID_TIPO_INV)
	REFERENCES TIPO (PK_ID_TIPO),
	CONSTRAINT FK_INVENTARIO_MARCA FOREIGN KEY (FK_ID_MARCA_INV)
	REFERENCES MARCA (PK_ID_MARCA),
	CONSTRAINT FK_INVENTARIO_PROVEEDORES FOREIGN KEY (FK_NIT_PROV_INV)
	REFERENCES PROVEEDORES (PK_NIT_PROV)
)

CREATE TABLE DET_FAC
(
	FK_NUM_FAC_DET NCHAR(15),
	CANT_ART_DET INT NULL, 
	FK_REF_ART_DET NCHAR (15),
	CONSTRAINT FK_DET_FAC_ENC_FAC FOREIGN KEY (FK_NUM_FAC_DET)
	REFERENCES ENC_FAC(PK_NUM_FAC),
	CONSTRAINT FK_DET_FAC_INVENTARIO FOREIGN KEY  (FK_REF_ART_DET)
	REFERENCES INVENTARIO (PK_REF_INV)
)

GO

INSERT INTO VENDEDORES VALUES
('49825667', 'OLGA TRUJILLO', '5786698','3215889966','AV SIEMPREVIVA 123','2001-10-20'),
('39168997', 'PEDRO MORA', '3332258','3108579966','CALLE 33-5520','2005-05-20')

INSERT INTO CLIENTES VALUES
('71397885', 'CARLOS AGUDELO', '2781488', '3105359988', 'CARRERA 80 -5023', '2001-09-15'),
('1288996655', 'FABIOLA JARAMILLO', '3036536', NULL, 'CALLE 123','2008-11-30'),
('10261558899', 'JUANA FERNANDEZ', '4257869', '300456987', 'CARRERA 6 No 23 12','2020-12-23'),
('25668879', 'FELIPE SANCHEZ', '2780387', '350796468', NULL, '2009-11-20')

