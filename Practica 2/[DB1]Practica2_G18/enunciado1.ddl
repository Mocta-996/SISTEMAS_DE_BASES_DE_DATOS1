CREATE TABLE catalo_opcion (
    catalogo_modelo INTEGER NOT NULL,
    opcion_id       INTEGER NOT NULL,
    attribute_1     unknown 
);

ALTER TABLE catalo_opcion ADD CONSTRAINT catalo_opcion_pk PRIMARY KEY ( catalogo_modelo,
                                                                        opcion_id );

CREATE TABLE catalogo (
    modelo   INTEGER NOT NULL,
    marca    VARCHAR2(50) NOT NULL,
    precio   VARCHAR2(50) NOT NULL,
    cilindro VARCHAR2(50)
);

ALTER TABLE catalogo ADD CONSTRAINT catalogo_pk PRIMARY KEY ( modelo );

CREATE TABLE cliente (
    dni       VARCHAR2(50) NOT NULL,
    nombre    VARCHAR2(50) NOT NULL,
    direccion VARCHAR2(50) NOT NULL,
    telefono  INTEGER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( dni );

CREATE TABLE detalle (
    matricula       VARCHAR2(50) NOT NULL,
    venta_no_venta  INTEGER NOT NULL,
    catalogo_modelo INTEGER NOT NULL
);

ALTER TABLE detalle ADD CONSTRAINT detalle_pk PRIMARY KEY ( venta_no_venta,
                                                            catalogo_modelo );

CREATE TABLE opcion (
    id          INTEGER NOT NULL,
    nombre      VARCHAR2(50) NOT NULL,
    precio      VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(50)
);

ALTER TABLE opcion ADD CONSTRAINT opcion_pk PRIMARY KEY ( id );

CREATE TABLE sesion (
    no_sesion INTEGER NOT NULL,
    matricula VARCHAR2(50) NOT NULL,
    precio    FLOAT NOT NULL,
    marca     VARCHAR2(50) NOT NULL,
    modelo    INTEGER NOT NULL,
    fecha     DATE
);

ALTER TABLE sesion ADD CONSTRAINT sesion_pk PRIMARY KEY ( no_sesion );

CREATE TABLE vendedor (
    dni       VARCHAR2(50) NOT NULL,
    nombre    VARCHAR2(50) NOT NULL,
    direccion VARCHAR2(50) NOT NULL,
    telefono  INTEGER NOT NULL
);

ALTER TABLE vendedor ADD CONSTRAINT vendedor_pk PRIMARY KEY ( dni );

CREATE TABLE venta (
    no_venta         INTEGER NOT NULL,
    fecha            DATE NOT NULL,
    cliente_dni      VARCHAR2(50) NOT NULL,
    sesion_no_sesion INTEGER NOT NULL,
    vendedor_dni     VARCHAR2(50) NOT NULL
);

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( no_venta );

ALTER TABLE catalo_opcion
    ADD CONSTRAINT catalo_opcion_catalogo_fk FOREIGN KEY ( catalogo_modelo )
        REFERENCES catalogo ( modelo );

ALTER TABLE catalo_opcion
    ADD CONSTRAINT catalo_opcion_opcion_fk FOREIGN KEY ( opcion_id )
        REFERENCES opcion ( id );

ALTER TABLE detalle
    ADD CONSTRAINT detalle_catalogo_fk FOREIGN KEY ( catalogo_modelo )
        REFERENCES catalogo ( modelo );

ALTER TABLE detalle
    ADD CONSTRAINT detalle_venta_fk FOREIGN KEY ( venta_no_venta )
        REFERENCES venta ( no_venta );

ALTER TABLE venta
    ADD CONSTRAINT venta_cliente_fk FOREIGN KEY ( cliente_dni )
        REFERENCES cliente ( dni );

ALTER TABLE venta
    ADD CONSTRAINT venta_sesion_fk FOREIGN KEY ( sesion_no_sesion )
        REFERENCES sesion ( no_sesion );

ALTER TABLE venta
    ADD CONSTRAINT venta_vendedor_fk FOREIGN KEY ( vendedor_dni )
        REFERENCES vendedor ( dni );



