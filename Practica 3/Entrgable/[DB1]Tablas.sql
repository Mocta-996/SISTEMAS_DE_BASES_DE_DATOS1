-- ========================================     USO DE  LA BASE DE DATOS =========================
-- USE PRACTICA3;
-- source C:/Users/Pilo Tuy/Desktop/PRIMER SEMESTRE  2021/BASES DE DATOS/LABORATORIO/PRACTICA3/tablas.sql
-- ELIMINACION DE TABLAS
/*
SET FOREIGN_KEY_CHECKS=0; 
DROP TABLE IF EXISTS pais       CASCADE;
DROP TABLE IF EXISTS vendedor   CASCADE;
DROP TABLE IF EXISTS cliente    CASCADE ;
DROP TABLE IF EXISTS categoria  CASCADE; 
DROP TABLE IF EXISTS producto   CASCADE;
DROP TABLE IF EXISTS orden      CASCADE;
SET FOREIGN_KEY_CHECKS=1;

--  ========================================= CREACION DE TABLAS  =================================== 

-- ===========================================   TABLA 1    ===========================================
-- ===========================================    PAIS      ===========================================

CREATE TABLE pais (
    id_pais             INT NOT NULL PRIMARY KEY,
    nombre_pais         VARCHAR(150)
);

-- ===========================================   TABLA 2    ===========================================
-- ===========================================  VENDEDOR    ===========================================

CREATE TABLE vendedor (
    id_vendedor         INT NOT NULL PRIMARY KEY,
    nombre_vendedor     VARCHAR(200),
    id_pais             INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

-- ===========================================   TABLA 3    ===========================================
-- ===========================================   CLIENTE    ===========================================

CREATE TABLE cliente (
    id_cliente          INT NOT NULL PRIMARY KEY,
    nombre              VARCHAR(150),
    apellido            VARCHAR(150),
    direccion           VARCHAR(150),
    telefono            VARCHAR(15),
    tarjeta_credito     VARCHAR(50),
    edad                INT,
    salario             INT,
    genero              VARCHAR(2),
    id_pais             INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

-- ===========================================   TABLA 4    ===========================================
-- ===========================================    CATEGORIA     ===========================================

CREATE TABLE categoria (
    id_categoria        INT NOT NULL PRIMARY KEY,
    nombre_categoria    VARCHAR(150)
);

-- ===========================================   TABLA 5    ===========================================
-- ===========================================  VENDEDOR    ===========================================

CREATE TABLE producto (
    id_producto         INT NOT NULL PRIMARY KEY,
    nombre_producto     VARCHAR(200),
    precio              DECIMAL(5,2),
    id_categoria        INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- ===========================================   TABLA 6    ===========================================
-- ===========================================  VENDEDOR    ===========================================

CREATE TABLE orden (
    id_orden            INT NOT NULL ,
    linea_orden         INT NOT NULL ,
    fecha_orden         DATETIME,
    id_cliente          INT NOT NULL,
    id_vendedor         INT NOT NULL,
    id_producto         INT NOT NULL,
    cantidad            INT,
    PRIMARY KEY (id_orden,linea_orden),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
*/
CREATE TABLE temp (
    id_orden            INT  ,
    linea_orden         INT  ,
    fecha_orden         DATETIME,
    id_cliente          INT ,
    id_vendedor         INT ,
    id_producto         INT ,
    cantidad            INT
);