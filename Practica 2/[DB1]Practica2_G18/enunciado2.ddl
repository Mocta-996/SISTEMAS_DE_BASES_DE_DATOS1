CREATE TABLE categoria (
    id          INTEGER NOT NULL,
    nombre      VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(50)
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id );

CREATE TABLE ciudad (
    id     INTEGER NOT NULL,
    nombre VARCHAR2(50) NOT NULL
);

ALTER TABLE ciudad ADD CONSTRAINT ciudad_pk PRIMARY KEY ( id );

CREATE TABLE cliente (
    rut          INTEGER NOT NULL,
    nombre       VARCHAR2(50) NOT NULL,
    direccion_id INTEGER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( rut );

CREATE TABLE detalle (
    factura_no_factura INTEGER NOT NULL,
    producto_id        INTEGER NOT NULL,
    precio_venta       VARCHAR2(50),
    cantidad_vendida   VARCHAR2(50),
    monto_total        VARCHAR2(50)
);

ALTER TABLE detalle ADD CONSTRAINT detalle_pk PRIMARY KEY ( factura_no_factura, producto_id );

CREATE TABLE direccion (
    id        INTEGER NOT NULL,
    calle     VARCHAR2(50) NOT NULL,
    numero    VARCHAR2,
    comuna    VARCHAR2(50),
    ciudad_id INTEGER NOT NULL
);

ALTER TABLE direccion ADD CONSTRAINT direccion_pk PRIMARY KEY ( id );

CREATE TABLE factura (
    no_factura INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    fecha      DATE NOT NULL,
    descuento  FLOAT
);

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( no_factura );

CREATE TABLE producto (
    id            INTEGER NOT NULL,
    nombre        VARCHAR2(50) NOT NULL,
    precio_actual FLOAT NOT NULL,
    stock         INTEGER,
    categoria_id  INTEGER NOT NULL,
    proveedor_rut INTEGER NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id );

CREATE TABLE proveedor (
    rut          INTEGER NOT NULL,
    nombre       VARCHAR2(50) NOT NULL,
    telefono     VARCHAR2(50),
    pagina_web   VARCHAR2(50),
    direccion_id INTEGER NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( rut );

CREATE TABLE telefono (
    id          INTEGER NOT NULL,
    telefono    VARCHAR2(50) NOT NULL,
    cliente_rut INTEGER NOT NULL
);

ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY ( id );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_direccion_fk FOREIGN KEY ( direccion_id )
        REFERENCES direccion ( id );

ALTER TABLE detalle
    ADD CONSTRAINT detalle_factura_fk FOREIGN KEY ( factura_no_factura )
        REFERENCES factura ( no_factura );

ALTER TABLE detalle
    ADD CONSTRAINT detalle_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( id );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_ciudad_fk FOREIGN KEY ( ciudad_id )
        REFERENCES ciudad ( id );

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( categoria_id )
        REFERENCES categoria ( id );

ALTER TABLE producto
    ADD CONSTRAINT producto_proveedor_fk FOREIGN KEY ( proveedor_rut )
        REFERENCES proveedor ( rut );

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_direccion_fk FOREIGN KEY ( direccion_id )
        REFERENCES direccion ( id );

ALTER TABLE telefono
    ADD CONSTRAINT telefono_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );



