-- Sesión 1: Fundamentos de SQL--
-- Ejemplo 1: Establecer la conección a una BD en específico --
-- Ejemplo 2: Estructura de una tabla --
SHOW DATABASES;
USE tienda;
SHOW TABLES;
DESCRIBE empleado;
/* Con la sentencia DESCRIBE podemos conocer el tipo de dato que esta 
almacenado en cada campo(columna) de la tabla, también podemos conocer
 si pertenece a una llave primaria(indicador único) o secundaria
así que nos permite conocer los registros de la tabla deseada */

-- RETO 1--
/* Usando la BD tienda muestra la descripción de las tablas artículo, puesto y
venta*/
USE tienda;
DESCRIBE articulo; -- contiene int, varchar(long) y double
DESCRIBE puesto; -- contiene int, varchar(long) y double
DESCRIBE venta; -- contiene int, varchar(long) y timestamp
/* Para este reto es necesario llenar una tabla con los campos: tipo y 
descripción del dato*/

-- Ejemplo 3 --
USE tienda;
SELECT nombre -- SELECT nos permite hacer consultas de un campo
FROM empleado; -- se especifica de donde se va a buscar

SELECT * -- * nos muestra todos los campos
FROM empleado;

SELECT *
FROM empleado WHERE apellido_paterno='Risom'; -- WHERE nos permite filtrar información que cumplan con lo solicitado

SELECT *
FROM empleado WHERE id_puesto > 100;
 /* Es posible utilizar filtros con operadores lógicos, WHERE se puede combinar con AND y OR */

SELECT * 
FROM empleado WHERE id_puesto >= 100 AND id_puesto <= 200;

SELECT * 
FROM empleado WHERE id_puesto=100 OR id_puesto=200;

SELECT *
FROM empleado WHERE id_puesto IN (100,200); -- IN arroja un rango de valores, sustituye varios OR

-- RETO  2--
-- Estructura básica de una consulta--
-- ¿cuál es el nombre de los empleados con el puesto 4 ?
USE tienda;
SELECT nombre 
FROM empleado WHERE id_puesto= 4;

-- ¿Qué puestos tienen un salario mayor a 10,000?
DESCRIBE puesto;
SELECT id_puesto
FROM puesto WHERE salario > 10000;

-- ¿Qué articulos tienen un precio mayor a $1,000 y un iva mayor a 100?
SHOW TABLES;
DESCRIBE articulo;
SELECT id_articulo, nombre
FROM articulo WHERE precio > 1000 AND iva > 100;

/* ¿Qué ventas incluyen los artículo 135 o 963 y fueron 
hechas por los empleados 835 o 369? */
SHOW TABLES;
DESCRIBE venta;
SELECT *
FROM venta WHERE (id_articulo = 135 OR id_articulo = 963)
AND (id_empleado = 835 OR id_empleado = 369); -- Es importante colocar los paréntesis para agrupar las condiciones

-- Ejemplo 4  Ordenamientos y límites--
SELECT *
FROM puesto ORDER BY salario DESC;
-- Por default ORDER BY ordena de forma ascendente, puede agregarse adicional a WHERE 

SELECT *
FROM puesto ORDER BY salario ASC;

SELECT *
FROM puesto ORDER BY salario;
-- Así estas últimas dos sentencias son las mismas

SELECT *
FROM empleado LIMIT 5; -- Con LIMIT se limitan el número de registros en una consulta


-- Reto 3: Ordenamientos y límites--
-- Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.
USE tienda;
SELECT *
FROM puesto
ORDER BY salario DESC LIMIT 5;

-- Ejercicios--
/*Todas las consultas que realices deberás mantenerlas dentro del editor de textos de MySQL Workbench. Al finalizar, guarda este archivo, llendo al menú File > Save script. 
Recuerda que para hacer consultas a una tabla debes conocer primero su estructura.
1. Dentro del mismo servidor de bases de datos, conéctate al esquema classicmodels.
2. Dentro de la tabla employees, obtén el apellido de todos los empleados.
3. Dentro de la tabla employees, obtén el apellido, nombre y puesto de todos los empleados.
4. Dentro de la tabla employees, obtén todos los datos de cada empleado.
5. Dentro de la tabla employees, obtén el apellido, nombre y puesto de todos los empleados que tengan el puesto Sales Rep.
6. Dentro de la tabla employees, obtén el apellido, nombre, puesto y código de oficina de todos los empleados que tengan el puesto Sales Rep y código de oficina 1.
7. Dentro de la tabla employees, obtén el apellido, nombre, puesto y código de oficina de todos los empleados que tengan el puesto Sales Rep o código de oficina 1.
8. Dentro de la tabla employees, obtén el apellido, nombre y código de oficina de todos los empleados que tenga código de oficina 1, 2 o 3.
9. Dentro de la tabla employees, obten el apellido, nombre y puesto de todos los empleados que tengan un puesto distinto a Sales Rep.
10. Dentro de la tabla employees, obtén el apellido, nombre y código de oficina de todos los empleados cuyo código de oficina sea mayor a 5.
11. Dentro de la tabla employees, obtén el apellido, nombre y código de oficina de todos los empleados cuyo cdigo de oficina sea menor o igual 4.
12. Dentro de la tabla customers, obtén el nombre, país y estado de todos los clientes cuyo país sea USA y cuyo estado sea CA.
13. Dentro de la tabla customers, obtén el nombre, país, estado y límite de crédito de todos los clientes cuyo país sea, USA, cuyo estado sea CA y cuyo límite de crédito sea mayor a 100000.
14. Dentro de la tabla customers, obtén el nombre y país de todos los clientes cuyo país sea USA o France.
15. Dentro de la tabla customers, obtén el nombre, pas y límite de crédito de todos los clientes cuyo país sea USA o France y cuyo límite de crédito sea mayor a 100000. Para este ejercicio ten cuidado con los paréntesis.
16. Dentro de la tabla offices, obtén el código de la oficina, ciudad, teléfono y país de aquellas oficinas que se encuentren en USA o France.
17. Dentro de la tabla offices, obtén el código de la oficina, ciudad, teléfono y país de aquellas oficinas que no se encuentren en USA o France.
18. Dentro de la tabla orders, obtén el número de orden, número de cliente, estado y fecha de envío de todas las órdenes con el número 10165, 10287 o 10310.
19. Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena los resultados por apellido de forma ascendente.
20. Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena los resultados por apellido de forma descendente.
21. Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena los resultados por apellido de forma descendente y luego por nombre de forma ascendente.
22. Dentro de la tabla customers, obtén el número de cliente, nombre de cliente y el límite de crédito de los cinco clientes con el límite de crédito más alto (top 5).
23. Dentro de la tabla customers, obtén el número de cliente, nombre de cliente y el límite de crédito de los cinco clientes con el límite de crédito más bajo.*/

SHOW DATABASES;
USE classicmodels; -- 1
SHOW TABLES;
DESCRIBE employees;

SELECT lastName
FROM employees; -- 2 

SELECT lastName, firstName,jobTitle
FROM employees; -- 3

SELECT *
FROM employees; -- 4 

SELECT lastName, firstName,jobTitle
FROM employees
WHERE jobTitle = 'Sales Rep'; -- 5

SELECT lastName, firstName,jobTitle,officeCode
FROM employees
WHERE jobTitle = 'Sales Rep' AND officeCode = 1; -- 6

SELECT lastName, firstName,jobTitle,officeCode
FROM employees
WHERE jobTitle = 'Sales Rep' OR officeCode = 1; -- 7

SELECT lastName, firstName,officeCode
FROM employees
WHERE  officeCode = 1 OR officeCode = 2 OR  officeCode = 3; -- 8
-- Esta es una forma alternativa también valida
SELECT lastName, firstName,officeCode
FROM employees
WHERE  officeCode IN (1,2,3); -- 8

SELECT lastName, firstName,jobTitle
FROM employees
WHERE jobTitle != 'Sales Rep'; -- 9

SELECT lastName, firstName,officeCode
FROM employees
WHERE  officeCode > 5; -- 10

SELECT lastName, firstName,officeCode
FROM employees
WHERE  officeCode <= 4; -- 11

DESCRIBE customers;

SELECT customerName, country, state
FROM customers 
WHERE country = 'USA' AND state = 'CA'; -- 12

SELECT customerName, country, state, creditLimit
FROM customers 
WHERE country = 'USA' AND state = 'CA' AND  creditLimit > 100000; -- 13
-- Nota en este caso no es necesario agrupar con paréntesis

SELECT customerName, country
FROM customers 
WHERE country = 'USA' OR country = 'France'; -- 14

SELECT customerName, country, creditLimit
FROM customers 
WHERE (country = 'USA' OR country = 'France') AND creditLimit > 100000; -- 15
/*Es importante el uso de los paréntesis para separar condiciones en este ejercicio ya que buscamos 
 que se cumplan las dos condiciones, WHERE va a indicar que se cumple que sean de USA o de Francia
 y AND nos asegura que se cumpla el límite de crédito. Sin el uso de paréntesis, al utilizar OR se arroja los 
 clientes de USA con crédito > 100000 o de Francia, lo cual nos arroja créditos menores a 100000*/
-- When combining AND and OR be sure to enclose the individual clauses in parenthesis --
DESCRIBE offices;

SELECT officeCode,city,phone, country
FROM offices
WHERE country = 'USA' OR country = 'France'; -- 16

SELECT officeCode,city,phone, country
FROM offices
WHERE country != 'USA' AND country != 'France'; -- 17  
-- Recordar que cuando negamos un OR se combierte en AND , buscamos que no esten en USA o en France

DESCRIBE orders ;
SELECT orderNumber,customerNumber, status,shippedDate
FROM orders
WHERE orderNumber IN (10165, 10287 , 10310); -- 18

SELECT  contactLastName, contactFirstName
FROM customers
ORDER BY contactLastName; -- 19
-- No es necesario colocar ASC ya que por default se ordenan ascendentemente

SELECT  contactLastName, contactFirstName
FROM customers
ORDER BY contactLastName DESC; -- 20

SELECT  contactLastName, contactFirstName
FROM customers
ORDER BY contactLastName DESC, contactFirstName  ; -- 21

SELECT customerNumber, customerName, creditLimit
FROM customers 
ORDER BY creditLimit DESC  LIMIT 5; -- 22

SELECT customerNumber, customerName, creditLimit
FROM customers 
ORDER BY creditLimit LIMIT 5 ; -- 23









