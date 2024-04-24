CREATE DATABASE empresaDB;
USE empresaDB;

CREATE TABLE DEPARTAMENTO (
    DEP_NO INT UNSIGNED,
    DNOMBRE VARCHAR(14) NOT NULL,
    LOCALIDAD VARCHAR(10) NOT NULL,
    CONSTRAINT PK_DEPARTAMENTO_DEP_NO PRIMARY KEY (DEP_NO)
);

CREATE TABLE EMPLEADO (
    EMP_NO INT UNSIGNED,
    APELLIDO VARCHAR(50) NOT NULL,
    OFICIO VARCHAR(10) NOT NULL,
    DIRECTOR INT UNSIGNED,
    FECHA_ALTA DATE NOT NULL,
    SALARIO DECIMAL(9, 2) NOT NULL,
    COMISION DECIMAL(9, 2),
    DEP_NO INT UNSIGNED,
    CONSTRAINT PK_EMPLEADO_EMP_NO PRIMARY KEY (EMP_NO),
    CONSTRAINT FK_EMP_DIRECTOR FOREIGN KEY (DIRECTOR)
        REFERENCES EMPLEADO (EMP_NO) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT FK_EMP_DEP_NO FOREIGN KEY (DEP_NO)
        REFERENCES DEPARTAMENTO (DEP_NO) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE CLIENTE (
    CLIENTE_NO INT UNSIGNED,
    NOMBRE VARCHAR(150) NOT NULL,
    LOCALIDAD VARCHAR(50) NOT NULL,
    VENDEDOR_NO INT UNSIGNED,
    DEBE DECIMAL(9,2),
    HABER DECIMAL(9,2),
    LIMITE_CREDITO DECIMAL(9,2),
    CONSTRAINT PK_CLIENTE_NO PRIMARY KEY (CLIENTE_NO),
    CONSTRAINT FK_CLI_EMP_NO FOREIGN KEY (VENDEDOR_NO)
        REFERENCES EMPLEADO (EMP_NO)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE PRODUCTO (
    PRODUCTO_NO INT UNSIGNED,
    DESCRIPCION VARCHAR(30) NULL,
    PRECIO_ACTUAL DECIMAL(8,2),
    STOCK_DISPONIBLE INT UNSIGNED,
    CONSTRAINT PK_PRODUCTO_NO PRIMARY KEY (PRODUCTO_NO)
);


CREATE TABLE PEDIDO (
    PEDIDO_NO INT,
    PRODUCTO_NO INT UNSIGNED NOT NULL,
    CLIENTE_NO INT UNSIGNED NOT NULL,
    UNIDADES INT NOT NULL,
    FECHA_PEDIDO TIMESTAMP,
    CONSTRAINT PK_PEDIDO_NO PRIMARY KEY (PEDIDO_NO),
    CONSTRAINT FK_PEDIDO_PRODUCTO_NO FOREIGN KEY (PRODUCTO_NO)
        REFERENCES PRODUCTO (PRODUCTO_NO)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT FK_PEDIDO_CLIENTE_NO FOREIGN KEY (CLIENTE_NO)
        REFERENCES CLIENTE (CLIENTE_NO)
        ON UPDATE CASCADE ON DELETE CASCADE
);
