create database Actividad;
use Actividad;

CREATE TABLE Cliente (
    DNI VARCHAR(9),
    nombre VARCHAR(150) NOT NULL,
    ap1 VARCHAR(100) NOT NULL,
    ap2 VARCHAR(100) NOT NULL,
    calle VARCHAR(100) NOT NULL,
    CP char(5)  NOT NULL, 
    CONSTRAINT PK_Actividad PRIMARY KEY (DNI)
);

CREATE TABLE Cod_Postal (
    CP CHAR(5),
    localidad VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Cod_Postal PRIMARY KEY (CP)
);

CREATE TABLE Factura (
    ID_Factura INT,
    DNI VARCHAR(9) NOT NULL,
    fechaFactura DATE NOT NULL,
    totalFactura FLOAT NOT NULL,
    CONSTRAINT PK_Factura PRIMARY KEY (ID_Factura)
);
CREATE TABLE Factura_Articulo (
    ID_Factura INT,
    Ref varchar(150),
    cantidad int unsigned not null,
    CONSTRAINT PK_Factura PRIMARY KEY (ID_Factura, Ref)
);

create table Articulo(
	Ref varchar(150),
    nombre varchar(150) not null,
    precio float not null
);






















