
--DDL (Data Definition Language)Define y modifica la estructura de la base de datos y sus objetos

--CREATE
--Crea nuevas bases de datos y tablas
CREATE TABLE productos (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    precio NUMBER
);

--ALTER
--Modifica estructura de una tabla existente
ALTER TABLE productos ADD (descripcion VARCHAR2(200));

--DROP 
--Elimina bases de datos o tablas
DROP TABLE productos;

--TRUNCATE
-- Elimina todos los registros de una tabla pero mantiene la estructura de la tabla
TRUNCATE TABLE productos;



--DML (Data Manipulation Language) Manipulamos los datos de las tablas

--SELECT
--Recupera datos de una base de datos
SELECT nombre, precio FROM productos WHERE precio > 100;

--Insert
--Inserta nuevos registros en una tabla
INSERT INTO productos (id, nombre, precio) VALUES (1, 'Laptop', 1500);

--UPDATE
--Actualiza datos existentes en una tabla
UPDATE productos SET precio = 1400 WHERE nombre = 'Laptop';

--DELETE
--Elimina registros de una tabla
DELETE FROM productos WHERE id = 1;



--DCL (Data Control Language)Controla el acceso a los datos en la base de datos

--GRANT
--Otorga permisos
GRANT SELECT, INSERT ON productos TO usuario1;

--REVOKE
-- Revoca permisos
REVOKE INSERT ON productos FROM usuario1;



--TCL (Transaction Control Language)Gestiona las transacciones dentro de la base de datos

--SAVEPOINT
-- Iniciar una transacción
INSERT INTO productos (id, nombre, precio) VALUES (2, 'Tablet', 300);
SAVEPOINT save1;

UPDATE productos SET precio = 280 WHERE id = 2;

--ROLLBACK 
--Revierte a un punto de guardado
ROLLBACK TO save1;

--COMMIT
-- Confirmamos  los cambios
COMMIT;

--Tablas para comandos de JOIN,AGGREGATION,ORDER BY, GROUP BY, ALIAS, WHERE
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100),
    phone_number VARCHAR2(20),
    hire_date DATE,
    job_id VARCHAR2(20),
    salary NUMBER(8,2),
    manager_id NUMBER,
    department_id NUMBER
);


INSERT INTO employees VALUES (100, 'Steven', 'King', 'steven.king@example.com', '515.123.4567', TO_DATE('2003-06-17', 'YYYY-MM-DD'), 'AD_PRES', 24000, NULL, 90);
INSERT INTO employees VALUES (101, 'Neena', 'Kochhar', 'neena.kochhar@example.com', '515.123.4568', TO_DATE('2005-09-21', 'YYYY-MM-DD'), 'AD_VP', 17000, 100, 90);
INSERT INTO employees VALUES (102, 'Lex', 'De Haan', 'lex.dehaan@example.com', '515.123.4569', TO_DATE('2001-01-13', 'YYYY-MM-DD'), 'AD_VP', 17000, 100, 90);
INSERT INTO employees VALUES (103, 'Alexander', 'Hunold', 'alexander.hunold@example.com', '590.423.4567', TO_DATE('2006-01-03', 'YYYY-MM-DD'), 'IT_PROG', 9000, 102, 60);
INSERT INTO employees VALUES (104, 'Bruce', 'Ernst', 'bruce.ernst@example.com', '590.423.4568', TO_DATE('2007-05-21', 'YYYY-MM-DD'), 'IT_PROG', 6000, 103, 60);
INSERT INTO employees VALUES (105, 'David', 'Austin', 'david.austin@example.com', '590.423.4569', TO_DATE('2005-06-25', 'YYYY-MM-DD'), 'IT_PROG', 4800, 103, 60);
INSERT INTO employees VALUES (106, 'Valli', 'Pataballa', 'valli.pataballa@example.com', '590.423.4560', TO_DATE('2006-02-05', 'YYYY-MM-DD'), 'IT_PROG', 4800, 103, 60);
INSERT INTO employees VALUES (107, 'Diana', 'Lorentz', 'diana.lorentz@example.com', '590.423.5567', TO_DATE('2007-02-07', 'YYYY-MM-DD'), 'IT_PROG', 4200, 103, 60);
INSERT INTO employees VALUES (108, 'Nancy', 'Greenberg', 'nancy.greenberg@example.com', '515.124.4569', TO_DATE('2002-08-17', 'YYYY-MM-DD'), 'FI_MGR', 12000, 101, 100);
INSERT INTO employees VALUES (109, 'Daniel', 'Faviet', 'daniel.faviet@example.com', '515.124.4169', TO_DATE('2002-08-16', 'YYYY-MM-DD'), 'FI_ACCOUNT', 9000, 108, 100);
INSERT INTO employees VALUES (110, 'John', 'Chen', 'john.chen@example.com', '515.124.4269', TO_DATE('2005-09-28', 'YYYY-MM-DD'), 'FI_ACCOUNT', 8200, 108, 100);


CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(50),
    manager_id NUMBER,
    location_id NUMBER
);

INSERT INTO departments VALUES (10, 'Administration', 200, 1700);
INSERT INTO departments VALUES (20, 'Marketing', 201, 1800);
INSERT INTO departments VALUES (30, 'Purchasing', 114, 1700);
INSERT INTO departments VALUES (40, 'Human Resources', 203, 2400);
INSERT INTO departments VALUES (50, 'Shipping', 121, 1500);
INSERT INTO departments VALUES (60, 'IT', 103, 1400);
INSERT INTO departments VALUES (70, 'Public Relations', 204, 2700);
INSERT INTO departments VALUES (80, 'Sales', 145, 2500);
INSERT INTO departments VALUES (90, 'Executive', 100, 1700);
INSERT INTO departments VALUES (100, 'Finance', 108, 1700);
INSERT INTO departments VALUES (110, 'Accounting', 205, 1700);



--JOIN 
--Combina filas de dos o más tablas basándose en una columna relacionada entre ellas

--INNER JOIN Devuelve filas cuando hay una coincidencia en ambas tablas
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

--LEFT JOIN (or LEFT OUTER JOIN)
--Devuelve todas las filas de la tabla izquierda y las filas coincidentes de la tabla derecha si no hay coincidencia devuelve NULL para las columnas de la tabla derecha
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

--RIGHT JOIN (or RIGHT OUTER JOIN)
--Devuelve todas las filas de la tabla derecha y las filas coincidentes de la tabla izquierda y si no coincide devuelve NULL para las columnas de la tabla izquierda
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

--FULL JOIN (or FULL OUTER JOIN)
--Devuelve todas las filas cuando hay una coincidencia en cualquiera de las tablas. Si no hay coincida y devuelve NULL para las columnas sin coincidencia en ambas tablas
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e
FULL JOIN departments d ON e.department_id = d.department_id;

--AGGREGATION
--Realiza cálculos sobre grupos de filas para devolver un único valor por grupo

--SUM calcula la suma de los valores
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

--AVG calcula el promedio de los valores
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

--COUNT cuenta el número de filas que cumplen una condición
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id;

--ORDER BY ordena los resultados de una consulta basándose en una o más columnas
SELECT employee_id, last_name, salary
FROM employees
ORDER BY salary DESC; -- Ordena por salario de forma descendente

--GROUP BY agrupa filas que tienen el mismo valor en una o más columnas y permite aplicar funciones de agregación
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id; -- Calcula el salario promedio por departamento

--ALIAS proporciona nombres temporales a columnas o tablas en una consulta para hacer la salida más legible o para referencia en consultas anidadas

--Alias de columnas
SELECT employee_id AS id, last_name AS apellido, salary AS salario
FROM employees;

--Alias de tablas
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

--WHERE Filtra las filas que cumplen una condición específica en una consulta
SELECT employee_id, last_name, hire_date
FROM employees
WHERE hire_date > TO_DATE('01-JAN-2005', 'DD-MON-YYYY'); -- Filtra empleados contratados después del 1 de enero de 2005









