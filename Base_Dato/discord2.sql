DROP DATABASE ventascoche;

CREATE DATABASE IF NOT EXISTS ventascoche;

USE ventascoche;


DROP TABLE coches;


CREATE TABLE coches

(reg_coche CHAR(12) NOT NULL,

marca VARCHAR(10) NOT NULL,

modelo VARCHAR(10) NOT NULL,

variante VARCHAR(5) NOT NULL,

anio_modelo INT NOT NULL,

color VARCHAR(10) NOT NULL,

anio_compra INT NOT NULL,

kilometros INT NOT NULL,

CONSTRAINT reg_coche_PK PRIMARY KEY (reg_coche),

CONSTRAINT marca_CK CHECK (marca IN ('Mazda', 'Ford', 'Hyundai')),

CONSTRAINT color_CK CHECK (color IN ('Negro', 'Blanco', 'Rojo', 'Azul')),

CONSTRAINT Km_CK CHECK (kilometros < 50000));


DROP TABLE propietarios;

CREATE TABLE propietarios

(ID_propietario CHAR(10),

nombre VARCHAR(30) NOT NULL,

telefono INT NOT NULL,

num_de_licencia CHAR(10) NOT NULL,

CONSTRAINT id_propietario_PK PRIMARY KEY (ID_propietario),

CONSTRAINT propietario_ID_CK CHECK (ID_propietario LIKE 'ID_%'),

CONSTRAINT NL_UQ UNIQUE (num_de_licencia));


DROP TABLE propietario_coche;

CREATE TABLE propietario_coche

(ID_propietario CHAR(10),

reg_coche CHAR(12) NOT NULL,

precio DECIMAL(8,2) NOT NULL,

CONSTRAINT propietario_coche_PK PRIMARY KEY (ID_propietario, reg_coche),

CONSTRAINT recio_CK CHECK (precio > 150000));



-- Alteración de tablas:

-- Modifiquemos las tablas según las instrucciones.


-- a. Añada la clave foránea en la tabla propietario_coche para hacer referencia a ID_propietario de la tabla propietarios.

ALTER TABLE propietario_coche

ADD CONSTRAINT propietario_FK

FOREIGN KEY (ID_propietario)

REFERENCES propietarios(ID_propietario);


-- b. Añada la clave foránea en la tabla propietario_coche para hacer referencia a reg_coche de la tabla coches.

ALTER TABLE propietario_coche

ADD CONSTRAINT coche_FK

FOREIGN KEY (reg_coche)

REFERENCES coches(reg_coche);


-- c. Añade un atributo direccion en la tabla propietarios.

ALTER TABLE propietarios ADD direccion VARCHAR(40) NOT NULL;


-- d. Añade un atributo Estado_de_prueba del coche que acepte valores basados en caracteres.

ALTER TABLE coches ADD Estado_de_prueba VARCHAR(10) NOT NULL;


-- e. Eliminar la columna Año_de_compra de COCHE.

-- La sintaxis para remover una columna de una tabla existente es "DROP COLUMN nombre_columna".

ALTER TABLE coches DROP COLUMN anio_compra;


-- f. Eliminar la columna Dirección_del_propietario de la tabla PROPIETARIO.

ALTER TABLE propietarios DROP COLUMN direccion;


-- g. Elimine la restricción Unique del atributo num_de_licencia.

-- La eliminación de restricciones puede realizarse mediante la sintaxis "DROP CONSTRAINT nombre_restricción".

ALTER TABLE propietarios DROP CONSTRAINT NL_UQ;

-- [Recordemos que en la definición de la tabla propietarios, NL_UQ es el nombre de la restricción UNIQUE].


-- h. Eliminar la restricción de color para que se puedan insertar coches de cualquier color.

ALTER TABLE coches DROP CONSTRAINT color_CK;


-- i. Añadir una columna Years_Used a la tabla OWNER_CAR que almacene el número de años que el coche ha sido utilizado por el propietario.

ALTER TABLE propietario_coche ADD anios_usados INT;


-- j. Remover la tabla propietario_coche de la base de datos completamente.

-- La sintaxis para remover una tabla de la base de datos permanentemente es "DROP TABLE nombre_tabla"

DROP TABLE propietario_coche;


-- k. Cambiar el tipo del atributo num_de_licencia de tipo basado en caracteres a tipo numérico.

-- La sintaxis para cambiar el tipo o tamaño de los datos es "MODIFY COLUMN nombre_columna tipo_dato".

ALTER TABLE propietarios MODIFY COLUMN num_de_licencia INT;
 

-- [Nota: Si desea cambiar el tipo de datos o el tamaño de cualquier atributo, entonces debe eliminar todos los registros existentes antes de la alteración. Esto se puede hacer de dos maneras;

DELETE FROM nombre_tabla;

TRUNCATE TABLE nombre_tabla;