
-- CONFIGURACIONES
/*
1.  mysql> SET GLOBAL local_infile=1;
    Query OK, 0 rows affected (0.00 sec)

2.  mysql> quit
    Bye

3.  mysql --local-infile=1 -u root -p
*/
-- source C:/Users/Pilo Tuy/Desktop/PRIMER SEMESTRE  2021/BASES DE DATOS/LABORATORIO/PRACTICA3/cargamasiva.sql;
-- =========================================== 1. CARGA TABLA PAIS ==================================
/*LOAD DATA  LOCAL
INFILE "C:/Users/Pilo Tuy/Desktop/PRIMER SEMESTRE  2021/BASES DE DATOS/LABORATORIO/PRACTICA3/CSV Practica 3/CSV Practica 3/Pais.csv"
INTO TABLE  pais
CHARACTER SET UTF8
fields terminated by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

*/
-- =========================================== 2. CARGA TABLA VENDEDOR ==================================
/*LOAD DATA  LOCAL
INFILE "C:/Users/Pilo Tuy/Desktop/PRIMER SEMESTRE  2021/BASES DE DATOS/LABORATORIO/PRACTICA3/CSV Practica 3/CSV Practica 3/Vendedor.csv"
INTO TABLE  vendedor
CHARACTER SET UTF8
fields terminated by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
*/

-- =========================================== 3. CARGA TABLA CLIENTE ==================================
/* LOAD DATA  LOCAL
INFILE "C:/Users/Pilo Tuy/Desktop/PRIMER SEMESTRE  2021/BASES DE DATOS/LABORATORIO/PRACTICA3/CSV Practica 3/CSV Practica 3/Cliente.csv"
INTO TABLE  cliente
CHARACTER SET UTF8
fields terminated by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
*/ 

-- =========================================== 4. CARGA TABLA CATEGORIA ==================================
/*LOAD DATA  LOCAL
INFILE "C:/Users/Pilo Tuy/Desktop/PRIMER SEMESTRE  2021/BASES DE DATOS/LABORATORIO/PRACTICA3/CSV Practica 3/CSV Practica 3/Categoria.csv"
INTO TABLE  categoria
CHARACTER SET UTF8
fields terminated by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
*/

-- =========================================== 5. CARGA TABLA PRODUCTO ==================================
/*LOAD DATA  LOCAL
INFILE "C:/Users/Pilo Tuy/Desktop/PRIMER SEMESTRE  2021/BASES DE DATOS/LABORATORIO/PRACTICA3/CSV Practica 3/CSV Practica 3/Producto.csv"
INTO TABLE  producto
CHARACTER SET UTF8
fields terminated by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
*/

-- =========================================== 5. CARGA TABLA ORDEN ==================================
/*LOAD DATA  LOCAL
INFILE "C:/Users/Pilo Tuy/Desktop/PRIMER SEMESTRE  2021/BASES DE DATOS/LABORATORIO/PRACTICA3/CSV Practica 3/CSV Practica 3/Orden.csv"
INTO TABLE  orden
CHARACTER SET UTF8
fields terminated by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS; 

(id_orden,linea_orden,@fecha_orden,id_cliente,id_vendedor,id_producto,cantidad)
SET fecha_orden = STR_TO_DATE(@fecha_orden, '%d/%m/%Y')*/

LOAD DATA  LOCAL
INFILE "C:/Users/Pilo Tuy/Desktop/PRIMER SEMESTRE  2021/BASES DE DATOS/LABORATORIO/PRACTICA3/CSV Practica 3/CSV Practica 3/Orden.csv"
INTO TABLE  temp
CHARACTER SET UTF8
fields terminated by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_orden,linea_orden,@fecha_orden,id_cliente,id_vendedor,id_producto,cantidad)
SET fecha_orden = STR_TO_DATE(@fecha_orden, '%d/%m/%Y');