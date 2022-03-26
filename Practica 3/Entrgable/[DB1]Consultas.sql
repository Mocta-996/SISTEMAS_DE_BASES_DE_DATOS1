-- source C:/Users/Pilo Tuy/Desktop/PRIMER SEMESTRE  2021/BASES DE DATOS/LABORATORIO/PRACTICA3/consultas.sql
-- ====================================== CONSULTA 1 ================================
/*
Mostrar el cliente que mas a comprado. Se debe de mostrar el id del cliente,
nombre, apellido, país y monto total.
*/
/*
SELECT c.id_cliente, c.nombre, c.apellido, p.nombre_pais, SUM(o.cantidad * pro.precio) as monto_total 
FROM cliente  c
INNER JOIN orden o  ON o.id_cliente = c.id_cliente
INNER JOIN producto pro  ON (o.id_producto = pro.id_producto)
INNER JOIN pais p ON c.id_pais = p.id_pais
GROUP BY c.id_cliente, c.nombre, c.apellido 
ORDER BY monto_total DESC LIMIT 20;
*/
-- ====================================== CONSULTA 2 ================================
/*
Mostrar el producto mas y menos comprado. Se debe mostrar el id del
producto, nombre del producto, categoría, cantidad de unidades y monto
vendido.    
*/
-- /// ARREGLAR    
/*
(SELECT p.id_producto, p.nombre_producto, cat.nombre_categoria, SUM(o.cantidad) as cantidad,  SUM(o.cantidad * p.precio) as monto
FROM producto  p
INNER JOIN orden o ON o.id_producto = p.id_producto
INNER JOIN categoria cat ON cat.id_categoria = p.id_categoria
GROUP BY p.id_producto, p.nombre_producto
ORDER BY cantidad DESC LIMIT 1)
UNION ALL
(SELECT p.id_producto, p.nombre_producto, cat.nombre_categoria,SUM(o.cantidad) as cantidad,  SUM(o.cantidad * p.precio) as monto
FROM producto  p
INNER JOIN orden o ON o.id_producto = p.id_producto
INNER JOIN categoria cat ON cat.id_categoria = p.id_categoria
GROUP BY p.id_producto, p.nombre_producto
ORDER BY  cantidad ASC LIMIT 1)
;
*/
-- ====================================== CONSULTA 3 ================================
/*
Mostrar a la persona que mas ha vendido. Se debe mostrar el id del
vendedor, nombre del vendedor, monto total vendido.  
*/
/*
SELECT v.id_vendedor, v.nombre_vendedor,SUM(o.cantidad * pro.precio) as monto_vendido 
FROM vendedor v
INNER JOIN orden o  ON o.id_vendedor = v.id_vendedor
INNER JOIN producto pro  ON (o.id_producto = pro.id_producto)
GROUP BY v.id_vendedor, v.nombre_vendedor
ORDER BY monto_vendido DESC LIMIT 5;
*/

-- ====================================== CONSULTA 4 ================================
/*
Mostrar el país que mas y menos ha vendido. Debe mostrar el nombre del
país y el monto. (Una sola consulta).
*/
/*
(SELECT pa.nombre_pais,SUM(o.cantidad * pro.precio) as monto
FROM pais pa
INNER JOIN vendedor v  ON v.id_pais = pa.id_pais
INNER JOIN orden o  ON o.id_vendedor = v.id_vendedor
INNER JOIN producto pro  ON (o.id_producto = pro.id_producto)
GROUP BY pa.nombre_pais
ORDER BY monto DESC LIMIT 1)
UNION
(SELECT pa.nombre_pais,SUM(o.cantidad * pro.precio) as monto
FROM pais pa
INNER JOIN vendedor v  ON v.id_pais = pa.id_pais
INNER JOIN orden o  ON o.id_vendedor = v.id_vendedor
INNER JOIN producto pro  ON (o.id_producto = pro.id_producto)
GROUP BY pa.nombre_pais
ORDER BY monto ASC LIMIT 1);
*/

-- ====================================== CONSULTA 5 ================================
/*
Top 5 de países que mas han comprado en orden ascendente. Se le solicita
mostrar el id del país, nombre y monto total.
*/
/*
SELECT * FROM (SELECT pa.id_pais, pa.nombre_pais,SUM(o.cantidad * pro.precio) as monto
FROM pais pa
INNER JOIN cliente c ON c.id_pais = pa.id_pais
INNER JOIN orden o  ON o.id_cliente = c.id_cliente
INNER JOIN producto pro  ON o.id_producto = pro.id_producto
GROUP BY pa.id_pais,pa.nombre_pais
ORDER BY monto DESC LIMIT 5)  consulta
ORDER BY consulta.monto ASC;
 */

 -- ====================================== CONSULTA 6 ================================
/*
Mostrar la categoría que mas y menos se ha comprado. Debe de mostrar el
nombre de la categoría y cantidad de unidades. (Una sola consulta).
*/

/*(SELECT ca.nombre_categoria as Categoría, SUM(o.cantidad ) as Unidades
FROM categoria as ca
INNER JOIN producto as pro  ON pro.id_categoria = ca.id_categoria
INNER JOIN orden as o  ON o.id_producto = pro.id_producto
INNER JOIN cliente as c ON c.id_cliente = o.id_cliente
GROUP BY Categoría
ORDER BY Unidades DESC LIMIT 1)
UNION
(SELECT ca.nombre_categoria as Categoría, SUM(o.cantidad ) as Unidades
FROM categoria as ca
INNER JOIN producto as pro  ON pro.id_categoria = ca.id_categoria
INNER JOIN orden as o  ON o.id_producto = pro.id_producto
INNER JOIN cliente as c ON c.id_cliente = o.id_cliente
GROUP BY Categoría
ORDER BY Unidades ASC LIMIT 1);*/

-- ====================================== CONSULTA 7 ================================
/*
Mostrar la categoría mas comprada por cada país. Se debe de mostrar el
nombre del país, nombre de la categoría y cantidad de unidades.
*/
/*SELECT pa.nombre_pais as País , 
FROM pais as pa
INNER JOIN producto as pro  ON pro.id_categoria = ca.id_categoria
INNER JOIN orden as o  ON o.id_producto = pro.id_producto
INNER JOIN cliente as c ON c.id_cliente = o.id_cliente
GROUP BY Categoría
ORDER BY Unidades DESC LIMIT 1*/


/*SELECT pa.nombre_pais as Pais, ca.nombre_categoria as Categoría,  SUM(o.cantidad ) as Unidades
FROM pais as pa
INNER JOIN cliente as c ON  c.id_pais = pa.id_pais
INNER JOIN orden as o ON c.id_cliente = o.id_cliente
INNER JOIN producto as pro  ON o.id_producto = pro.id_producto
INNER JOIN categoria as ca  ON pro.id_categoria = ca.id_categoria
GROUP BY Pais, Categoría
ORDER BY Pais,Unidades DESC;*/
/*
SELECT pa.nombre_pais as Pais, sub.cat as Categoría,  sub.uni AS Unidades
FROM pais as pa, 
(SELECT pa.id_pais as pp, ca.nombre_categoria as cat,  SUM(o.cantidad ) as uni
FROM pais as pa
INNER JOIN cliente as c ON  c.id_pais = pa.id_pais
INNER JOIN orden as o ON c.id_cliente = o.id_cliente
INNER JOIN producto as pro  ON o.id_producto = pro.id_producto
INNER JOIN categoria as ca  ON pro.id_categoria = ca.id_categoria   ) as sub
where pa.id_pais =  sub.pp;
*/

-- ====================================== CONSULTA 8 ================================
/*
Mostrar las ventas por mes de Inglaterra. Debe de mostrar el numero del mes
y el monto.
*/
/*
SELECT EXTRACT(MONTH FROM o.fecha_orden) as mes, SUM(o.cantidad * pro.precio) as monto
FROM orden o 
INNER JOIN vendedor as v  ON o.id_vendedor = v.id_vendedor
INNER JOIN pais as pa  ON pa.id_pais = v.id_pais
INNER JOIN producto pro  ON  o.id_producto = pro.id_producto
WHERE  v.id_pais = (SELECT id_pais  FROM pais WHERE  nombre_pais = 'Inglaterra') 
GROUP by mes 
ORDER BY mes ASC;
*/
-- ====================================== CONSULTA 9 ================================
/*
Mostrar el mes con mas y menos ventas. Se debe de mostrar el numero de
mes y monto. (Una sola consulta).
*/
/*
(SELECT EXTRACT(MONTH FROM o.fecha_orden) as mes, SUM(o.cantidad * pro.precio) as monto
FROM orden o 
INNER JOIN vendedor as v  ON o.id_vendedor = v.id_vendedor
INNER JOIN pais as pa  ON pa.id_pais = v.id_pais
INNER JOIN producto pro  ON  o.id_producto = pro.id_producto
GROUP by mes 
ORDER BY monto DESC
LIMIT 1)
UNION 
(SELECT EXTRACT(MONTH FROM o.fecha_orden) as mes, SUM(o.cantidad * pro.precio) as monto
FROM orden o 
INNER JOIN vendedor as v  ON o.id_vendedor = v.id_vendedor
INNER JOIN pais as pa  ON pa.id_pais = v.id_pais
INNER JOIN producto pro  ON  o.id_producto = pro.id_producto
GROUP by mes 
ORDER BY monto ASC
LIMIT 1);
*/
-- ====================================== CONSULTA 10 ================================
/*
Mostrar las ventas de cada producto de la categoría deportes. Se debe de
mostrar el id del producto, nombre y monto.
*/
/*
SELECT pro.id_producto as id, pro.nombre_producto as Producto, SUM(o.cantidad * pro.precio) as monto
FROM producto pro
INNER JOIN orden o  ON  o.id_producto = pro.id_producto
INNER JOIN vendedor  v  ON o.id_vendedor = v.id_vendedor
where pro.id_categoria = (SELECT id_categoria  FROM categoria WHERE nombre_categoria = 'Deportes') 
GROUP by id,Producto
LIMIT 20;
*/
/*
INSERT INTO orden(id_orden, linea_orden,fecha_orden,id_cliente ,id_vendedor,id_producto,cantidad)
SELECT  id_orden, linea_orden,fecha_orden,id_cliente ,id_vendedor,id_producto,cantidad
FROM temp;*/