use ejercicio4;

CREATE TABLE Productos(
    id_fab INT,
    id_producto INT,
    descripcion VARCHAR(100),
    precio DOUBLE,
    existencias INT,
    PRIMARY KEY (id_fab, id_producto)
);

CREATE TABLE Pedidos(
    num_pedido INT PRIMARY KEY,
    fecha_pedido DATE,
    clie INT,
    rep INT,
    fab INT,
    producto INT,
    cant INT,
    importe DOUBLE
);

CREATE TABLE Clientes(
    num_clie INT PRIMARY KEY,
    empresa VARCHAR(100),
    rep_clie INT,
    limite_credito INT
);

ALTER TABLE Pedidos ADD CONSTRAINT FK_PEDIDOS_CLIENTES FOREIGN KEY(clie) REFERENCES Clientes(num_clie);

CREATE TABLE Repventas(
    num_empl INT PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
    oficina_rep INT,
    titulo VARCHAR(100),
    contrato VARCHAR(100),
    director VARCHAR(100),
    cuota INT,
    ventas INT
);

ALTER TABLE Clientes ADD CONSTRAINT FK_CLIENTES_REPVENTAS FOREIGN KEY(rep_clie) REFERENCES Repventas(num_empl);
ALTER TABLE Pedidos ADD CONSTRAINT FK_PEDIDOS_REPVENTAS FOREIGN KEY(rep) REFERENCES Repventas(num_empl);

CREATE TABLE Oficinas(
    oficina INT PRIMARY KEY,
    ciudad VARCHAR(100),
    region VARCHAR(100),
    dir INT,
    objetivo VARCHAR(100),
    ventas INT
);


ALTER TABLE Oficinas ADD CONSTRAINT FK_OFICINAS_REPVENTAS FOREIGN KEY(dir) REFERENCES Repventas(num_empl);
ALTER TABLE PEDIDOS ADD CONSTRAINT FK_PEDIDOS_PRODUCTOS_FAB FOREIGN KEY(fab) REFERENCES Productos(id_fab);
ALTER TABLE Repventas ADD CONSTRAINT FK_REPVENTAS_OFICINAS FOREIGN KEY(oficina_rep) REFERENCES Oficinas(oficina);
