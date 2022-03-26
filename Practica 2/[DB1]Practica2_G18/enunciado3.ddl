CREATE TABLE alumno (
    dni       INTEGER NOT NULL,
    matricula VARCHAR2(50) NOT NULL,
    nombre    VARCHAR2(50) NOT NULL
);

ALTER TABLE alumno ADD CONSTRAINT alumno_pk PRIMARY KEY ( dni );

CREATE TABLE colaborador (
    profesor_dni INTEGER NOT NULL,
    alumno_dni   INTEGER NOT NULL
);

ALTER TABLE colaborador ADD CONSTRAINT colaborador_pk PRIMARY KEY ( profesor_dni,alumno_dni );

CREATE TABLE comite (
    no_tribunal INTEGER NOT NULL,
    lugar       VARCHAR2(50) NOT NULL,
    componentes INTEGER,
    alumno_dni  INTEGER NOT NULL
);

ALTER TABLE comite ADD CONSTRAINT comite_pk PRIMARY KEY ( no_tribunal );

CREATE TABLE detalle_comite (
    comite_no_tribunal INTEGER NOT NULL,
    profesor_dni       INTEGER NOT NULL
);

ALTER TABLE detalle_comite ADD CONSTRAINT detalle_comite_pk PRIMARY KEY ( comite_no_tribunal,  profesor_dni );

CREATE TABLE detalle_grupo (
    grupo_investigacion_no_grupo INTEGER NOT NULL,
    alumno_dni                   INTEGER NOT NULL,
    fecha                        DATE NOT NULL
);

ALTER TABLE detalle_grupo ADD CONSTRAINT detalle_grupo_pk PRIMARY KEY ( grupo_investigacion_no_grupo, alumno_dni );

CREATE TABLE grupo_investigacion (
    no_grupo    INTEGER NOT NULL,
    nombre      VARCHAR2(50) NOT NULL,
    componentes INTEGER NOT NULL
);

ALTER TABLE grupo_investigacion ADD CONSTRAINT grupo_investigacion_pk PRIMARY KEY ( no_grupo );

CREATE TABLE profesor (
    dni        INTEGER NOT NULL,
    nombre     VARCHAR2(50) NOT NULL,
    domicilio  VARCHAR2(50),
    puesto     VARCHAR2(50) NOT NULL,
    alumno_dni INTEGER NOT NULL
);

ALTER TABLE profesor ADD CONSTRAINT profesor_pk PRIMARY KEY ( dni );

CREATE TABLE tfc (
    no_orden       INTEGER NOT NULL,
    tema           VARCHAR2(50) NOT NULL,
    fecha_comienzo DATE NOT NULL,
    alumno_dni     INTEGER NOT NULL
);

CREATE UNIQUE INDEX tfc__idx ON
    tfc (
        alumno_dni
    ASC );

ALTER TABLE tfc ADD CONSTRAINT tfc_pk PRIMARY KEY ( no_orden );

ALTER TABLE colaborador
    ADD CONSTRAINT colaborador_alumno_fk FOREIGN KEY ( alumno_dni )
        REFERENCES alumno ( dni );

ALTER TABLE colaborador
    ADD CONSTRAINT colaborador_profesor_fk FOREIGN KEY ( profesor_dni )
        REFERENCES profesor ( dni );

ALTER TABLE comite
    ADD CONSTRAINT comite_alumno_fk FOREIGN KEY ( alumno_dni )
        REFERENCES alumno ( dni );

ALTER TABLE detalle_comite
    ADD CONSTRAINT detalle_comite_comite_fk FOREIGN KEY ( comite_no_tribunal )
        REFERENCES comite ( no_tribunal );

ALTER TABLE detalle_comite
    ADD CONSTRAINT detalle_comite_profesor_fk FOREIGN KEY ( profesor_dni )
        REFERENCES profesor ( dni );

ALTER TABLE detalle_grupo
    ADD CONSTRAINT detalle_grupo_alumno_fk FOREIGN KEY ( alumno_dni )
        REFERENCES alumno ( dni );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_grupo
    ADD CONSTRAINT detalle_grupo_grupo_investigacion_fk FOREIGN KEY ( grupo_investigacion_no_grupo )
        REFERENCES grupo_investigacion ( no_grupo );

ALTER TABLE profesor
    ADD CONSTRAINT profesor_alumno_fk FOREIGN KEY ( alumno_dni )
        REFERENCES alumno ( dni );

ALTER TABLE tfc
    ADD CONSTRAINT tfc_alumno_fk FOREIGN KEY ( alumno_dni )
        REFERENCES alumno ( dni );


