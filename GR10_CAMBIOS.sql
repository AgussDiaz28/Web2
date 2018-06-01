
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

insert into gr10_persona values (4,13244453,'Diaz','Ricardo','1959-11-01','rjdiazt@gmail.com');
insert into gr10_persona values (5,13244453,'Diaz','Ricardo','1959-11-01','rjdiazt@gmail.com');

/*  FALTAN AGREGAR TUPLAS A ESTA TABLA */

/* Creacion de tabla de ciudades */
create table gr10_ciudad (
	id_ciudad int not null,
	nombre varchar(80) not null,
	constraint pk_gr10_ciudad primary key (id_ciudad)
)

insert into gr10_ciudad (1,'Tandil');
insert into gr10_ciudad (2,'Mar Del Plata');
insert into gr10_ciudad (3,'Buenos Aires');
insert into gr10_ciudad (4,'Necochea');
insert into gr10_ciudad (5,'La Plata');

/* Modificacion de departamento */

alter table gr10_departamento add column id_ciudad int;

alter colum gr10_departamento 
add constraint FK_GR10_CIUDAD_DEPARTAMENTO 
FOREIGN KEY (id_ciudad) references gr10_ciudad (id_ciudad)
NOT DEFERRABLE
INITIALLY immediate;


/* insert de departamentos */

insert into gr10_departamento values (1,'',54,1,1,38524932,400);
insert into gr10_departamento values (2,'',74,2,1,38524932,600);
insert into gr10_departamento values (3,'',120,2,1,38524932,800);
insert into gr10_departamento values (4,'',74,1,2,42908673,600);
insert into gr10_departamento values (5,'',74,3,3,13244453,600);

/* insert costo de depto*/

insert into gr10_costodepto values (1,'2018-01-01','2018-01-31',900);
insert into gr10_costodepto values (1,'2018-02-01','2018-02-24',700);
insert into gr10_costodepto values (2,'2018-01-01','2018-03-01',600.50);
insert into gr10_costodepto values (3,'2018-01-01','2018-04-01',500);
insert into gr10_costodepto values (1,'2018-07-15','2018-08-15',1500);

/* insert de Huesped */

insert into gr10_huesped values (1,38524932);
/* El resto de los inserts no funcionan, verificar*/
insert into gr10_huesped values (2,32524932);
insert into gr10_huesped values (1,38524931);
insert into gr10_huesped values (1,13524932);
insert into gr10_huesped values (1,27534332);


/* inserts de reserva */
/* columna tipo ??????? es necesario el tipo_doc y nro_doc en esta tabla ? */
insert into gr10_reserva values (1,'2017-10-01','2018-01-01','2018-01-14','TIPO',1,600,1,1,38524932);
insert into gr10_reserva values (2,'2017-10-01','2018-01-01','2018-01-14','TIPO',1,600,1,1,38524932);
insert into gr10_reserva values (3,'2017-10-01','2018-01-01','2018-01-14','TIPO',1,600,1,1,38524932);
insert into gr10_reserva values (4,'2017-10-01','2018-01-01','2018-01-14','TIPO',1,600,1,1,38524932);
insert into gr10_reserva values (5,'2017-10-01','2018-01-01','2018-01-14','TIPO',1,600,1,1,38524932);

/* insert comentarios */
insert into gr10_comentario values (1,38524932,1,now,'Preferentemente quiero la habitacion en un piso alto de ser posible',5);
/*FALTAN COMENTARIOS*/


/* insert huesped reserva */
insert into gr10_huesped_reserva values(1,38514832,1);
insert into gr10_huesped_reserva values(1,38514832,2);
insert into gr10_huesped_reserva values(1,38514832,3);
/* Cambiar de huesped a las reservas 5 y */
insert into huesped_reserva values(1,38514832,4);
insert into huesped_reserva values(1,38514832,5);

/* inserts en estado Luego Ocupacion */

insert into gr10_estadoluegoocupacion values (1,'2018-01-15','comentario 1');
insert into gr10_estadoluegoocupacion values (2,'2018-02-01','comentario 2');
insert into gr10_estadoluegoocupacion values (3,'2018-01-15','comentario 3');
insert into gr10_estadoluegoocupacion values (4,'2018-01-15','comentario 4');
insert into gr10_estadoluegoocupacion values (5,'2018-01-15','comentario 5');



