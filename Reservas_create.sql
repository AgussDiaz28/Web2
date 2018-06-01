-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-06-01 18:39:29.854

-- tables
-- Table: GR10_Comentario
CREATE TABLE GR10_Comentario (
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    id_reserva int  NOT NULL,
    fecha_hora_comentario date  NOT NULL,
    comentario varchar(2048)  NOT NULL,
    estrellas int  NOT NULL,
    CONSTRAINT PK_GR10_COMENTARIO PRIMARY KEY (tipo_doc,nro_doc,id_reserva,fecha_hora_comentario)
);

-- Table: GR10_CostoDepto
CREATE TABLE GR10_CostoDepto (
    id_dpto int  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    precio_noche decimal(10,2)  NOT NULL,
    CONSTRAINT PK_GR10_COSTO_DEPTO PRIMARY KEY (id_dpto,fecha_desde)
);

-- Table: GR10_Departamento
CREATE TABLE GR10_Departamento (
    id_dpto int  NOT NULL,
    descripcion varchar(80)  NOT NULL,
    superficie decimal(10,2)  NOT NULL,
    id_tipo_depto int  NOT NULL,
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    precio_noche decimal(10,2)  NOT NULL,
    CONSTRAINT PK_GR10_DEPARTAMENTO PRIMARY KEY (id_dpto)
);

-- Table: GR10_EstadoLuegoOcupacion
CREATE TABLE GR10_EstadoLuegoOcupacion (
    id_reserva int  NOT NULL,
    fecha int  NOT NULL,
    comentario varchar(2048)  NOT NULL,
    CONSTRAINT PK_GR10_ESTADO_LUEGO_OCUPACION PRIMARY KEY (id_reserva,fecha)
);

-- Table: GR10_Habitacion
CREATE TABLE GR10_Habitacion (
    id_dpto int  NOT NULL,
    id_habitacion int  NOT NULL,
    posib_camas_simples int  NOT NULL,
    posib_camas_dobles int  NOT NULL,
    posib_camas_kind int  NOT NULL,
    tv boolean  NOT NULL,
    sillon int  NOT NULL,
    frigobar int  NOT NULL,
    mesa boolean  NOT NULL,
    sillas int  NOT NULL,
    cocina boolean  NOT NULL,
    CONSTRAINT PK_GR10_HABITACION PRIMARY KEY (id_dpto,id_habitacion)
);

-- Table: GR10_Huesped
CREATE TABLE GR10_Huesped (
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    CONSTRAINT PK_GR10_HUESPED PRIMARY KEY (tipo_doc,nro_doc)
);

-- Table: GR10_Huesped_Reserva
CREATE TABLE GR10_Huesped_Reserva (
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    id_reserva int  NOT NULL,
    CONSTRAINT PK_GR10_HUESPED_RESERVA PRIMARY KEY (tipo_doc,nro_doc,id_reserva)
);

-- Table: GR10_Pago
CREATE TABLE GR10_Pago (
    fecha_pago timestamp  NOT NULL,
    id_reserva int  NOT NULL,
    id_tipo_pago int  NOT NULL,
    comentario varchar(80)  NULL,
    importe decimal(8,3)  NOT NULL,
    CONSTRAINT PK_GR10_PAGO PRIMARY KEY (fecha_pago,id_reserva,id_tipo_pago)
);

-- Table: GR10_Persona
CREATE TABLE GR10_Persona (
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    apellido varchar(80)  NOT NULL,
    nombre varchar(80)  NOT NULL,
    fecha_nac date  NOT NULL,
    e_mail int  NOT NULL,
    CONSTRAINT PK_GR10_PERSONA PRIMARY KEY (tipo_doc,nro_doc)
);

-- Table: GR10_Reserva
CREATE TABLE GR10_Reserva (
    id_reserva int  NOT NULL,
    fecha_reserva date  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    tipo varchar(15)  NOT NULL,
    id_dpto int  NOT NULL,
    valor_noche decimal(8,3)  NOT NULL,
    limpieza decimal(5,3)  NOT NULL,
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    CONSTRAINT PK_GR10_RESERVA PRIMARY KEY (id_reserva)
);

-- Table: GR10_Tipo_Dpto
CREATE TABLE GR10_Tipo_Dpto (
    id_tipo_depto int  NOT NULL,
    cant_habitaciones int  NOT NULL,
    cant_banios int  NOT NULL,
    cant_max_huespedes int  NOT NULL,
    CONSTRAINT PK_GR10_TIPO_DEPTO PRIMARY KEY (id_tipo_depto)
);

-- Table: GR10_Tipo_Pago
CREATE TABLE GR10_Tipo_Pago (
    id_tipo_pago int  NOT NULL,
    empresa int  NOT NULL,
    CONSTRAINT PK_GR10_TIPO_PAGO PRIMARY KEY (id_tipo_pago)
);

-- foreign keys
-- Reference: FK_Comentario_Huesped_Reserva (table: GR10_Comentario)
ALTER TABLE GR10_Comentario ADD CONSTRAINT FK_Comentario_Huesped_Reserva
    FOREIGN KEY (tipo_doc, nro_doc, id_reserva)
    REFERENCES GR10_Huesped_Reserva (tipo_doc, nro_doc, id_reserva)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_CostoDepto_Departamento (table: GR10_CostoDepto)
ALTER TABLE GR10_CostoDepto ADD CONSTRAINT FK_CostoDepto_Departamento
    FOREIGN KEY (id_dpto)
    REFERENCES GR10_Departamento (id_dpto)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_Departamento_Persona (table: GR10_Departamento)
ALTER TABLE GR10_Departamento ADD CONSTRAINT FK_Departamento_Persona
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GR10_Persona (tipo_doc, nro_doc)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_Departamento_Tipo_Dpto (table: GR10_Departamento)
ALTER TABLE GR10_Departamento ADD CONSTRAINT FK_Departamento_Tipo_Dpto
    FOREIGN KEY (id_tipo_depto)
    REFERENCES GR10_Tipo_Dpto (id_tipo_depto)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_EstadoLuegoOcupacion_Reserva (table: GR10_EstadoLuegoOcupacion)
ALTER TABLE GR10_EstadoLuegoOcupacion ADD CONSTRAINT FK_EstadoLuegoOcupacion_Reserva
    FOREIGN KEY (id_reserva)
    REFERENCES GR10_Reserva (id_reserva)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_Habitacion_Departamento (table: GR10_Habitacion)
ALTER TABLE GR10_Habitacion ADD CONSTRAINT FK_Habitacion_Departamento
    FOREIGN KEY (id_dpto)
    REFERENCES GR10_Departamento (id_dpto)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_Huesped_Persona (table: GR10_Huesped)
ALTER TABLE GR10_Huesped ADD CONSTRAINT FK_Huesped_Persona
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GR10_Persona (tipo_doc, nro_doc)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_Huesped_Reserva_Huesped (table: GR10_Huesped_Reserva)
ALTER TABLE GR10_Huesped_Reserva ADD CONSTRAINT FK_Huesped_Reserva_Huesped
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GR10_Huesped (tipo_doc, nro_doc)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_Huesped_Reserva_Reserva (table: GR10_Huesped_Reserva)
ALTER TABLE GR10_Huesped_Reserva ADD CONSTRAINT FK_Huesped_Reserva_Reserva
    FOREIGN KEY (id_reserva)
    REFERENCES GR10_Reserva (id_reserva)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_Pago_Reserva (table: GR10_Pago)
ALTER TABLE GR10_Pago ADD CONSTRAINT FK_Pago_Reserva
    FOREIGN KEY (id_reserva)
    REFERENCES GR10_Reserva (id_reserva)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_Pago_Tipo_Pago (table: GR10_Pago)
ALTER TABLE GR10_Pago ADD CONSTRAINT FK_Pago_Tipo_Pago
    FOREIGN KEY (id_tipo_pago)
    REFERENCES GR10_Tipo_Pago (id_tipo_pago)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_Reserva_Departamento (table: GR10_Reserva)
ALTER TABLE GR10_Reserva ADD CONSTRAINT FK_Reserva_Departamento
    FOREIGN KEY (id_dpto)
    REFERENCES GR10_Departamento (id_dpto)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_Reserva_Huesped (table: GR10_Reserva)
ALTER TABLE GR10_Reserva ADD CONSTRAINT FK_Reserva_Huesped
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GR10_Huesped (tipo_doc, nro_doc)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- End of file.
