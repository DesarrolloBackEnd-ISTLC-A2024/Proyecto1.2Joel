CREATE TABLE Pedidos (
    ID_Pedido NUMBER PRIMARY KEY,
    ID_Cliente NUMBER,
    Nombre_Cliente VARCHAR2(100),
    Producto VARCHAR2(100),
    Cantidad NUMBER,
    Precio_Total NUMBER
);
INSERT INTO Pedidos (ID_Pedido, ID_Cliente, Nombre_Cliente, Producto, Cantidad, Precio_Total) VALUES
(1, 101, 'Juan Pérez', 'Televisor', 1, 500);

INSERT INTO Pedidos (ID_Pedido, ID_Cliente, Nombre_Cliente, Producto, Cantidad, Precio_Total) VALUES
(2, 102, 'Ana Gómez', 'Lavadora', 1, 300);

INSERT INTO Pedidos (ID_Pedido, ID_Cliente, Nombre_Cliente, Producto, Cantidad, Precio_Total) VALUES
(3, 101, 'Juan Pérez', 'Microondas', 2, 200);

COMMIT;



--Primera Forma Normal (1NF)
-- creamos tabla clientes
CREATE TABLE Clientes (
    ID_Cliente NUMBER PRIMARY KEY,
    Nombre_Cliente VARCHAR2(50)
);

-- Creamos la tabla pedidos
CREATE TABLE Pedidos (
    ID_Pedido NUMBER PRIMARY KEY,
    ID_Cliente NUMBER,
    Producto VARCHAR2(50),
    Cantidad NUMBER,
    Precio_Total NUMBER,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

-- Insertamos datos  a la tabla clientes
INSERT INTO Clientes (ID_Cliente, Nombre_Cliente) VALUES (101, 'Juan Pérez');
INSERT INTO Clientes (ID_Cliente, Nombre_Cliente) VALUES (102, 'Ana Gómez');

-- Insertamos datos a la tabla pedidos
INSERT INTO Pedidos (ID_Pedido, ID_Cliente, Producto, Cantidad, Precio_Total) VALUES (1, 101, 'Televisor', 1, 500);
INSERT INTO Pedidos (ID_Pedido, ID_Cliente, Producto, Cantidad, Precio_Total) VALUES (2, 102, 'Lavadora', 1, 300);
INSERT INTO Pedidos (ID_Pedido, ID_Cliente, Producto, Cantidad, Precio_Total) VALUES (3, 101, 'Microondas', 2, 200);



--Segunda Forma Normal (2NF)

-- Creamos tabla productos
CREATE TABLE Productos (
    ID_Producto NUMBER PRIMARY KEY,
    Nombre_Producto VARCHAR2(50),
    Precio NUMBER
);

-- Actualizamos las tablas pedidos
CREATE TABLE Pedidos (
    ID_Pedido NUMBER PRIMARY KEY,
    ID_Cliente NUMBER,
    ID_Producto NUMBER,
    Cantidad NUMBER,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);

--Insertamos datos a las tablas de 2NF

-- Insertamos datos a la tala productos
INSERT INTO Productos (ID_Producto, Nombre_Producto, Precio) VALUES (1, 'Televisor', 500);
INSERT INTO Productos (ID_Producto, Nombre_Producto, Precio) VALUES (2, 'Lavadora', 300);
INSERT INTO Productos (ID_Producto, Nombre_Producto, Precio) VALUES (3, 'Microondas', 100);

-- Insertamos datos a las tablas pedidos
INSERT INTO Pedidos (ID_Pedido, ID_Cliente, ID_Producto, Cantidad) VALUES (1, 101, 1, 1);
INSERT INTO Pedidos (ID_Pedido, ID_Cliente, ID_Producto, Cantidad) VALUES (2, 102, 2, 1);
INSERT INTO Pedidos (ID_Pedido, ID_Cliente, ID_Producto, Cantidad) VALUES (3, 101, 3, 2);

--Tercera Forma Normal (3NF)
--En 3NF, eliminamos las dependencias transitivas. Esto significa que una columna no clave no debe depender de otra columna no clave.