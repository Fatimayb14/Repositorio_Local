-- Creamos la base de datos 
create database Ejercicio1;

-- Aquí usamos la base de datos
use  Ejercicio1;

-- Creamos la tabla PUB (nombre, licencia_fiscal, domicilio, fecha_apertura, horario, cod_localidad)
CREATE TABLE Pub (
    cod_Pub TINYINT,
    nombre VARCHAR(150) NOT NULL,
    licenciaFiscal VARCHAR(100) NOT NULL,
    domicilio VARCHAR(100) NOT NULL,
    fechaApertura DATE NOT NULL,
    horario TIME NOT NULL,
    codLocalidad TINYINT NOT NULL,
    CONSTRAINT PK_Pub PRIMARY KEY (cod_Pub)
);

-- Creamos la tabla TiTULAR (nombre, domicilio, codPub)
CREATE TABLE Titular(
DNI_titular VARCHAR (9),
nombre VARCHAR (150) NOT NULL,
domicilio VARCHAR(100),
codPub VARCHAR (100) NOT NULL,
CONSTRAINT PK_Titular PRIMARY KEY (DNI_titular)
);

-- Creamos la tabla EMPLEADO (nombre, domicilio)
CREATE TABLE Empleado (
DNI_Empleado VARCHAR (9), 
nombre VARCHAR (150) NOT NULL,
domicilio VARCHAR (100) ,
CONSTRAINT PK_Empleado PRIMARY KEY (DNI_Empleado)

);

-- Creamos la tabla EXISTENCIAS (nombre, cantidad, precio, codPub)
CREATE TABLE Existencias (
Cod_Articulo tinyint,
nombre VARCHAR (150),
cantidad INT NOT NULL,
precio DECIMAL (4,2) NOT NULL,
codPub TINYINT,
CONSTRAINT PK_Existencias PRIMARY KEY (Cod_Articulo)
);

-- Creamos la tabla LOCALIDAD (nombre)
CREATE TABLE Localidad (
Cod_localidad tinyint,
nombre VARCHAR (150),
CONSTRAINT PK_Localidad PRIMARY KEY (cod_localidad)

);

-- Creamos una tabla PUB_EMPLEADO(cod_Pub, DNI_Empleado, funcion)
CREATE TABLE pub_empleado(
cod_Pub TINYINT,
DNIempleado VARCHAR (9),
funcion ENUM('CAMARERO', 'SEGURIDAD', 'LIMPIEZA'),
CONSTRAINT PK_Pub_Empleado PRIMARY KEY (cod_Pub)
);
