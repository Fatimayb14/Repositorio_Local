-- Crear la Base Datos
create database Taller;
-- Usar la Base de Datos
use Taller;

-- Cliente ( DNI, noombre, apell1, apelli2, tlfn)

create table Cliente(
DNI char (9) not null,
nombre varchar (150) not null,
apell1 varchar (150) not null, 
apell2 varchar (150) not null,
tlfn char (9) not null,
constraint PK_Cliente Primary key (DNI)
);

-- Vehículo( matricula, dni, Nbastidor, marca, modelo, fechaCompra)
create table Vehículo(
matricula char (6) not null,
dni char (9) not null, 
Nbastidor varchar(100) not null,
marca varchar (100) not null,
modelo varchar (100) not null,
fechaCompra date null, -- puede ser nula, no se que se pone al respecto
constraint PK_Vehículo Primary key (matricula)
);


-- Mecánico (Codigo, dni, nombre, ape1, ape2, tlfn, salario)

create table Mecanico (
codigo int unsigned auto_increment,
nombre varchar (150) not null,
ape1 varchar (100) not null,
ape2 varchar (100) not null, 
tlfn char (9) not null,
salario float UNIQUE,
constraint PK_Mecanico Primary Key (codigo)
);

-- Reparacion (codigo, fecha, mecanico, vehiculo)
create table Reparacion(
codigo int unsigned auto_increment not null, 
fecha timeStamp default null,
mecanico varchar(100) not null,
vehiculo varchar (150) not null,
constraint PK_Reparacion Primary Key (codigo)
);

-- DetalleReparación(Reparación, Concepto, cantidad)
create table DetalleReparacion(
reparacion tinytext  not null,
concepto varchar (100) not null, 
cantidad int  not null,
constraint PK_DetalleReparacion Primary Key (reparacion, concepto)
);
-- Concepto (Código, Descripción, Precio)
create table Concepto(
codigo int unsigned auto_increment,
descripcion tinytext not null,
precio float not null,
constraint PK_Concepto Primary Key (codigo)
);

alter table vehiculo add constraint FK_Vehiculo_Cliente Foreign Key(DNI)
references cliente(DNI);

alter table reparacion add constraint FK_Reparacion_Mecanico Foreign Key(mecanico)
references mecanico(codigo);

alter table detallereparacion add constraint FK_DeRepara Foreign Key(reparacion)
references reparacion(codigo);

alter table concepto add constraint PK_DeConce Primary Key(codigo);



