-- RETOS Sesión 1: Fundamentos de SQL--
-- Registro de evidencias del Work -- 

-- RETO 1--
/* Usando la BD tienda muestra la descripción de las tablas artículo, puesto y venta*/
SHOW TABLES;
USE tienda;
DESCRIBE articulo; -- contiene int, varchar(long) y double
DESCRIBE puesto; -- contiene int, varchar(long) y double
DESCRIBE venta; -- contiene int, varchar(long) y timestamp
/* Para este reto es necesario llenar una tabla con los campos: tipo y descripción del dato*/


-- RETO  2: Estructura básica de una consulta--
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

/* ¿Qué ventas incluyen los artículo 135 o 963 y fueron  hechas por los empleados 835 o 369? */
SHOW TABLES;
DESCRIBE venta;
SELECT *
FROM venta WHERE (id_articulo = 135 OR id_articulo = 963)
AND (id_empleado = 835 OR id_empleado = 369);
 /* Es importante colocar los paréntesis para agrupar las condiciones cuando combinamos AND y OR , ya 
 que en este caso hay dos condiciones individuales que cumplir*/


-- Reto 3: Ordenamientos y límites--
-- Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.
USE tienda;
SELECT *
FROM puesto
ORDER BY salario DESC LIMIT 5;
/* Para obtener el top 5 hay que ordenarlos del puesto que más gana al que menos (ORDER BY salario DES)
y limitar la consulta a los primeros 5 (LIMIT 5)*/

