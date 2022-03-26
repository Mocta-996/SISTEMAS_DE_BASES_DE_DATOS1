CREATE TABLE constituyente (
    codigo VARCHAR2 
    nombre VARCHAR2(50) NOT NULL
);

ALTER TABLE constituyente ADD CONSTRAINT constituyente_pk PRIMARY KEY ( codigo );

CREATE TABLE destino (
    id_destino VARCHAR2(50) NOT NULL,
    nombre     VARCHAR2(50) NOT NULL
);

ALTER TABLE destino ADD CONSTRAINT destino_pk PRIMARY KEY ( id_destino );

CREATE TABLE detalle_traslado (
    traslado_no_traslado     INTEGER NOT NULL,
    transporte_id_transporte VARCHAR2(50) NOT NULL,
    km_recorrido             VARCHAR2(50) NOT NULL,
    fecha_entrega            DATE NOT NULL,
    tratamiento              VARCHAR2(50)
);

ALTER TABLE detalle_traslado
    ADD CONSTRAINT detalle_traslado_pk PRIMARY KEY ( fecha_entrega,traslado_no_traslado,transporte_id_transporte );

CREATE TABLE empresa (
    codigo_empresa INTEGER NOT NULL,
    nombre         VARCHAR2(50) NOT NULL,
    direccion      VARCHAR2(50),
    telefono       INTEGER NOT NULL
);

ALTER TABLE empresa ADD CONSTRAINT empresa_pk PRIMARY KEY ( codigo_empresa );

CREATE TABLE envase (
    iid_envase  VARCHAR2(50) NOT NULL,
    tipo_envase VARCHAR2(50) NOT NULL
);

ALTER TABLE envase ADD CONSTRAINT envase_pk PRIMARY KEY ( iid_envase );

CREATE TABLE productor (
    id_productor INTEGER NOT NULL,
    nombre       VARCHAR2(50) NOT NULL
);

ALTER TABLE productor ADD CONSTRAINT productor_pk PRIMARY KEY ( id_productor );

CREATE TABLE residuo (
    codigo                 VARCHAR2(50) NOT NULL,
    nombre                 VARCHAR2(50) NOT NULL,
    productor_id_productor INTEGER NOT NULL
);

ALTER TABLE residuo ADD CONSTRAINT residuo_pk PRIMARY KEY ( codigo );

CREATE TABLE residuo_constituyente (
    cantidad             FLOAT NOT NULL,
    residuo_codigo       VARCHAR2(50) NOT NULL,
    constituyente_codigo VARCHAR2 
);

ALTER TABLE residuo_constituyente ADD CONSTRAINT residuo_constituyente_pk PRIMARY KEY ( residuo_codigo );

CREATE TABLE transporte (
    id_transporte          VARCHAR2(50) NOT NULL,
    tipo                   VARCHAR2(50) NOT NULL,
    empresa_codigo_empresa INTEGER NOT NULL
);

ALTER TABLE transporte ADD CONSTRAINT transporte_pk PRIMARY KEY ( id_transporte );

CREATE TABLE traslado (
    no_traslado                          INTEGER NOT NULL,
    cantidad                             INTEGER,
    envase_iid_envase                    VARCHAR2(50) NOT NULL,
    destino_id_destino                   VARCHAR2(50), 
    residuo_constituyente_residuo_codigo VARCHAR2(50)
);

ALTER TABLE traslado ADD CONSTRAINT traslado_pk PRIMARY KEY ( no_traslado );

ALTER TABLE detalle_traslado
    ADD CONSTRAINT detalle_traslado_transporte_fk FOREIGN KEY ( transporte_id_transporte )
        REFERENCES transporte ( id_transporte );

ALTER TABLE detalle_traslado
    ADD CONSTRAINT detalle_traslado_traslado_fk FOREIGN KEY ( traslado_no_traslado )
        REFERENCES traslado ( no_traslado );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE residuo_constituyente
    ADD CONSTRAINT residuo_constituyente_constituyente_fk FOREIGN KEY ( constituyente_codigo )
        REFERENCES constituyente ( codigo );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE residuo_constituyente
    ADD CONSTRAINT residuo_constituyente_residuo_fk FOREIGN KEY ( residuo_codigo )
        REFERENCES residuo ( codigo );

ALTER TABLE residuo
    ADD CONSTRAINT residuo_productor_fk FOREIGN KEY ( productor_id_productor )
        REFERENCES productor ( id_productor );

ALTER TABLE transporte
    ADD CONSTRAINT transporte_empresa_fk FOREIGN KEY ( empresa_codigo_empresa )
        REFERENCES empresa ( codigo_empresa );

ALTER TABLE traslado
    ADD CONSTRAINT traslado_destino_fk FOREIGN KEY ( destino_id_destino )
        REFERENCES destino ( id_destino );

ALTER TABLE traslado
    ADD CONSTRAINT traslado_envase_fk FOREIGN KEY ( envase_iid_envase )
        REFERENCES envase ( iid_envase );

