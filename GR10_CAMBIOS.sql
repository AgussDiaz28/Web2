
/* ALTERS en TIPO_PAGO */
ALTER TABLE gr10_tipo_pago ALTER COLUMN empresa TYPE VARCHAR(255);

/* inserts de tipos de pagos */

insert into gr10_tipo_pago values (1,'Visa');
insert into gr10_tipo_pago values (2,'Mastercard');
insert into gr10_tipo_pago values (3,'PayPal');
insert into gr10_tipo_pago values (4,'Cabal');
insert into gr10_tipo_pago values (5,'American Express');

/* inserts de tipos de deptos */

insert into gr10_tipo_dpto values (1,4,2,6);
insert into gr10_tipo_dpto values (2,2,1,4);
insert into gr10_tipo_dpto values (3,1,1,2);
insert into gr10_tipo_dpto values (4,3,1,6);
insert into gr10_tipo_dpto values (5,3,2,5);

/* Alters de Persona */

ALTER TABLE gr10_persona ALTER COLUMN e_mail TYPE varchar USING e_mail::varchar;

/* Create Table de tipo de documentos */

CREATE TABLE gr10_tipo_doc (
	id_tipo_doc int NOT NULL,
	descripcion varchar(20) NOT NULL,
	CONSTRAINT pk_gr10_tipo_doc PRIMARY KEY (id_tipo_doc)
) 

/* inserts de tipo de documentos */
insert into gr10_tipo_doc values(1,'DNI');
insert into gr10_tipo_doc values(2,'Pasaporte');
insert into gr10_tipo_doc values(3,'CI');
insert into gr10_tipo_doc values(4,'LE');
insert into gr10_tipo_doc values(5,'LC');

/* insert de personas */

insert into gr10_persona values (1,38524932,'Diaz','Agustin','1995-01-28','agussdiaz28@gmail.com');
insert into gr10_persona values (2,42908673,'Diaz Gargiulo','Mariano','1999-08-31','marianodiaz@gmail.com');
insert into gr10_persona values (3,13244453,'Diaz','Ricardo','1959-11-01','rjdiazt@gmail.com');

insert into gr10_persona values (1,27890165,'Pizzi','Alejandra','1979-08-11','alejandra@qwavee.com');
insert into gr10_persona values (1,25908361,'Rodriguez','Diego','1977-01-17','diego@qwavee.com');

/*  FALTAN AGREGAR TUPLAS A ESTA TABLA */

/* Creacion de tabla de ciudades */
create table gr10_ciudad (
	id_ciudad int not null,
	nombre varchar(80) not null,
	constraint pk_gr10_ciudad primary key (id_ciudad)
)

insert into gr10_ciudad values (1,'Tandil');
insert into gr10_ciudad values (2,'Mar Del Plata');
insert into gr10_ciudad values (3,'Buenos Aires');
insert into gr10_ciudad values (4,'Necochea');
insert into gr10_ciudad values (5,'La Plata');

/* Modificacion de departamento */

alter table gr10_departamento add column id_ciudad int;

alter table gr10_departamento  
add constraint FK_GR10_CIUDAD_DEPARTAMENTO 
FOREIGN KEY (id_ciudad) references gr10_ciudad (id_ciudad);


/* insert de departamentos */
insert into gr10_departamento values (1,'Departamento1',54,3,1,38524932,400,1);
insert into gr10_departamento values (2,'Departamento2',74,4,1,38524932,600,1);
insert into gr10_departamento values (3,'Departamento3',99,1,1,38524932,800,5);
insert into gr10_departamento values (4,'Departamento4',68,1,2,42908673,600,5);
insert into gr10_departamento values (5,'Departamento5',94,3,3,13244453,600,2);

/* insert costo de depto*/

insert into gr10_costodepto values (1,'2018-01-01','2018-01-31',900);
insert into gr10_costodepto values (1,'2018-02-01','2018-02-24',700);
insert into gr10_costodepto values (2,'2018-01-01','2018-03-01',600.50);
insert into gr10_costodepto values (3,'2018-01-01','2018-04-01',500);
insert into gr10_costodepto values (1,'2018-07-15','2018-08-15',1500);

/* insert de Huesped */
insert into gr10_huesped values (1,38524932);
insert into gr10_huesped values (2,42908673);
insert into gr10_huesped values (3,13244453);
insert into gr10_huesped values (1,27890165);
insert into gr10_huesped values (1,25908361);


/* inserts de reserva */
insert into gr10_reserva values (1,'2017-10-01','2018-01-01','2018-01-24','TIPO',3,1600,1,1,38524932);
insert into gr10_reserva values (2,'2017-11-30','2018-02-01','2018-03-14','TIPO',4,800,1,2,42908673);
insert into gr10_reserva values (3,'2017-09-18','2018-04-01','2018-04-10','TIPO',5,600,1,3,13244453);
insert into gr10_reserva values (4,'2017-10-14','2018-01-01','2018-01-14','TIPO',2,500,1,1,27890165);
insert into gr10_reserva values (5,'2017-12-12','2018-05-01','2018-05-8','TIPO',1,450,1,1,25908361);

/* insert huesped reserva */
insert into gr10_huesped_reserva values(1,38524932,1);
insert into gr10_huesped_reserva values(1,27890165,4);
insert into gr10_huesped_reserva values(1,25908361,5);
insert into gr10_huesped_reserva values(3,13244453,3);
insert into gr10_huesped_reserva values(2,42908673,2);

/* insert comentarios */
insert into gr10_comentario values (1,38524932,1,now(),'Preferentemente quiero la habitacion en un piso alto de ser posible',5);
/*FALTAN AGREGAR COMENTARIOS*/

/* inserts en estado Luego Ocupacion */

insert into gr10_estadoluegoocupacion values (1,'2018-01-15','comentario 1');
insert into gr10_estadoluegoocupacion values (2,'2018-02-01','comentario 2');
insert into gr10_estadoluegoocupacion values (3,'2018-01-15','comentario 3');
insert into gr10_estadoluegoocupacion values (4,'2018-01-15','comentario 4');
insert into gr10_estadoluegoocupacion values (5,'2018-01-15','comentario 5');


SELECT * FROM gr10_departamento;

