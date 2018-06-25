
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
);

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
insert into gr10_persona values (1,37120008,'garcia','arturo','1972-01-17','diego@qwavee.com');
insert into gr10_persona values (1,12345678,'reinhold','arturo','1972-01-17','diego@qwavee.com');
insert into gr10_persona values (1,87654321,'arturo','arturo','1972-01-17','diego@qwavee.com');
insert into gr10_persona values (1,22222222,'persona','arturo','1972-01-17','diego@qwavee.com');



/* Creacion de tabla de ciudades */
create table gr10_ciudad (
	id_ciudad int not null,
	nombre varchar(80) not null,
	constraint pk_gr10_ciudad primary key (id_ciudad)
);

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
insert into gr10_huesped values (1,12345678);
insert into gr10_huesped values (1,87654321);
insert into gr10_huesped values (1,22222222);

/* inserts de reserva */
insert into gr10_reserva values (1,'2017-10-01','2018-01-01','2018-01-24','TIPO',4,1600,1,1,38524932);
insert into gr10_reserva values (2,now(),'2018-06-01','2018-07-14','TIPO',1,800,1,2,42908673);
insert into gr10_reserva values (3,now(),'2018-06-01','2018-07-10','TIPO',2,600,1,3,13244453);
insert into gr10_reserva values (4,now(),'2018-07-20','2018-08-14','TIPO',2,500,1,1,27890165);
insert into gr10_reserva values (5,now(),'2018-05-01','2018-05-30','TIPO',1,450,1,1,25908361);


/* insert huesped reserva */
insert into gr10_huesped_reserva values(1,38524932,1);
insert into gr10_huesped_reserva values(1,27890165,4);
insert into gr10_huesped_reserva values(1,25908361,5);
insert into gr10_huesped_reserva values(3,13244453,3);
insert into gr10_huesped_reserva values(2,42908673,2);

/* insert comentarios */
insert into gr10_comentario values (1,38524932,1,now(),'Preferentemente quiero la habitacion gris en un piso alto de ser posible',5);
insert into gr10_comentario values (5,25908361,1,now(),'Preferentemente quiero la habitacion negra en un piso alto de ser posible',5);
insert into gr10_comentario values (3,13244453,1,now(),'Preferentemente quiero la habitacion blanca en un piso alto de ser posible',5);
insert into gr10_comentario values (2,42908673,1,now(),'Preferentemente quiero la habitacion en un piso mediano de ser posible',5);
insert into gr10_comentario values (4,27890165,1,now(),'Preferentemente quiero la habitacion en un piso bajo de ser posible',5);
/*FALTAN AGREGAR COMENTARIOS*/

/* inserts en estado Luego Ocupacion */

insert into gr10_estadoluegoocupacion values (1,'2018-01-15','comentario 1');
insert into gr10_estadoluegoocupacion values (2,'2018-02-01','comentario 2');
insert into gr10_estadoluegoocupacion values (3,'2018-01-15','comentario 3');
insert into gr10_estadoluegoocupacion values (4,'2018-01-15','comentario 4');
insert into gr10_estadoluegoocupacion values (5,'2018-01-15','comentario 5');

/* insert de habitaciones */

/*
 * Depto 1 : Tipo de depto 3 ; habitacion -> 1 ; banio -> 1 ; max_huespedes -> 2
 * Depto 2 : Tipo de depto 4 ; habitacion -> 3 ; banio -> 1 ; max_huespedes -> 6
 * Depto 3 : Tipo de depto 1 ; habitacion -> 4 ; banio -> 2 ; max_huespedes -> 6
 * Depto 4 : Tipo de depto 1 ; habitacion -> 4 ; banio -> 2 ; max_huespedes -> 6
 * Depto 5 : Tipo de depto 3 ; habitacion -> 1 ; banio -> 2 ; max_huespedes -> 2
*/

/* Insert de habitacion para depto 1*/
insert into gr10_habitacion values (1,1,0,1,1,true,1,1,true,1,true);
/* Insert de habitacion para depto 2*/
insert into gr10_habitacion values (2,2,1,1,1,true,1,1,true,1,true);
insert into gr10_habitacion values (2,3,1,1,1,true,1,1,true,1,true);
insert into gr10_habitacion values (2,4,1,1,1,true,1,1,true,1,true);
/* Insert de habitacion para depto 3*/
insert into gr10_habitacion values (3,5,1,1,1,true,1,1,true,1,true);
insert into gr10_habitacion values (3,6,1,1,1,true,1,1,true,1,true);
insert into gr10_habitacion values (3,7,1,1,1,true,1,1,true,1,true);
insert into gr10_habitacion values (3,8,1,1,1,true,1,1,true,1,true);
/* Insert de habitacion para depto 4*/
insert into gr10_habitacion values (4,9,1,1,1,true,1,1,true,1,true);
insert into gr10_habitacion values (4,10,1,1,1,true,1,1,true,1,true);
insert into gr10_habitacion values (4,11,1,1,1,true,1,1,true,1,true);
insert into gr10_habitacion values (4,12,1,1,1,true,1,1,true,1,true);
/* Insert de habitacion para depto 5*/
insert into gr10_habitacion values (5,13,0,1,1,true,1,1,true,1,true);
insert into gr10_habitacion values (5,14,0,1,1,true,1,1,true,1,true);

/*Inserts de pago*/

insert into gr10_pago values (now(),1,1,3,10);
insert into gr10_pago values (now(),2,2,3,100);
insert into gr10_pago values (now(),3,3,3,1000);
insert into gr10_pago values (now(),4,4,3,10000);
insert into gr10_pago values (now(),5,5,3,100000);

/* After inserts */

/* Punto a. Que las fechas de las reservas sean consistentes, es decir que la fecha de inicio de la reserva sea menor que la fecha de finalización. */

alter table gr10_reserva add constraint gr10_reserva_check_fecha_reserva check ( fecha_reserva <= now());
alter table gr10_reserva add check (fecha_reserva <= fecha_desde);
alter table gr10_reserva add check ( fecha_desde < fecha_hasta);

/*
 * 	Ejemplo de tuplas no aceptadas luego de las restricciones
 *insert into gr10_reserva values (6, '7-25-2018', '8-25-2018', '9-25-2018', 'tipo', 1, 200, 200, 1, 37120008);
 *insert into gr10_reserva values (6, 8-30-2018, '8-25-2018', '9-25-2018', 'tipo', 1, 200, 200, 1, 37120008);
 *insert into gr10_reserva values (6, 8-30-2018, '9-25-2018', '8-25-2018', 'tipo', 1, 200, 200, 1, 37120008);
 * */


/* Punto b. Que el detalle de las habitaciones sea consistente con el tipo de departamento, es decir que si el tipo de departamento es de 2 habitaciones, en el detalle se consideren como máximo 2 habitaciones. */

create or replace function trfn_gr10_check_depto_habitaciones () returns trigger AS $body$
declare
v_cant_habitaciones_tipo integer;
v_count_habitaciones integer;
begin
	select gr10_tipo_dpto.cant_habitaciones
	into v_cant_habitaciones_tipo
	from gr10_departamento
	join gr10_tipo_dpto on (gr10_departamento.id_tipo_depto = gr10_tipo_dpto.id_tipo_depto )
	where id_dpto = new.id_dpto;

	select count(*)
	into v_count_habitaciones
	from gr10_habitacion
	where id_dpto = new.id_dpto;

	IF (v_cant_habitaciones_tipo < v_count_habitaciones) THEN
            RAISE EXCEPTION 'La cantidad de habitaciones no coinciden con las del tipo del depto';
    END IF;
    RETURN NEW;
end;
$body$ LANGUAGE plpgsql;

create or replace function trfn_gr10_check_cant_hab_tipo_dpto() returns trigger AS $body$
declare
dptos record;
cant  integer;
begin
FOR dptos IN (select *
				 from gr10_departamento d
				 where id_tipo_depto= new.id_tipo_depto)
LOOP
	cant:= (select count(*)
          from gr10_habitacion h
				  where h.id_dpto= dptos.id_dpto)

					IF (new.cant_habitaciones < cant) THEN
						RAISE EXCEPTION 'La cantidad de habitaciones no coinciden con las del tipo del depto';
					END IF;
END LOOP;
    RETURN NEW;
end;
$body$ LANGUAGE plpgsql;

create  trigger tr_gr10_departamento_habitaciones
after update of id_tipo_depto on gr10_departamento
for each row
execute procedure trfn_gr10_check_depto_habitaciones();

create  trigger tr_gr10_habitaciones_departamento
after insert or update of id_dpto on gr10_habitacion
for each row
execute procedure trfn_gr10_check_depto_habitaciones();

create  trigger tr_gr10_tipo_dpto_cant_habitaciones
after update of cant_habitaciones on gr10_tipo_dpto
for each row
execute procedure trfn_gr10_check_cant_hab_tipo_dpto();
/*
Ejemplos de inserciones y cambios rechazados:

update gr10_departamento set id_tipo_depto=3 where id_tipo_dpto=2;
update gr10_habitacion set id_dpto=5 where id_habitacion=3
insert into gr10_habitacion values (5,20,0,1,1,true,1,1,true,1,true);
update gr10_tipo_dpto set cant_habitaciones = 1 where id_tipo_depto=2
*/

/* Punto c. Que tanto la persona que realiza la reserva como los huéspedes no sea el propietario del departamento  */

create or replace function trfn_gr10_check_propietario_huesped_reserva() returns trigger AS $body$
begin
					IF (EXISTS(SELECT *
					           FROM gr10_huesped_reserva hr
									   JOIN gr10_reserva r ON(new.id_reserva= r.id_reserva)
									   JOIN gr10_departamento d ON (r.id_dpto= d.id_dpto)
									   WHERE new.tipo_doc= d.tipo_doc AND new.nro_doc= d.nro_doc))
							THEN
						RAISE EXCEPTION 'El propietario no puede ser huesped de una reserva en su departamento.';
					END IF;
RETURN NEW;
end;
$body$ LANGUAGE plpgsql;

create or replace function trfn_gr10_check_propietario_reserva() returns trigger AS $body$
begin
					IF (EXISTS(SELECT d.nro_doc, d.tipo_doc
					           FROM gr10_departamento d
									   WHERE d.id_dpto= new.id_dpto AND d.nro_doc=new.nro_doc and d.tipo_doc=new.tipo_doc))
							THEN
						RAISE EXCEPTION 'El propietario del departamento no puede realizar una reserva a su nombre en el mismo.';
					END IF;
RETURN NEW;
end;
$body$ LANGUAGE plpgsql;

create or replace function trfn_gr10_check_propietario_no_esta_reservando() returns trigger AS $body$
DECLARE
tieneReserva boolean;
esHuespedReserva boolean;
begin
					tieneReserva:= EXISTS(select *
					                      from gr10_reserva r
															  WHERE r.tipo_doc= new.tipo_doc and r.nro_doc= new.nro_doc and CURRENT_DATE BETWEEN r.fecha_desde and r.fecha_hasta);
					esHuespedReserva:= EXISTS(select *
               											from gr10_huesped_reserva hr
               											join gr10_reserva r on(hr.id_reserva= r.id_reserva)
               											join gr10_departamento d on (r.id_dpto=new.id_dpto)
               											where (hr.tipo_doc= new.tipo_doc and hr.nro_doc = new.nro_doc) and CURRENT_DATE BETWEEN r.fecha_desde and r.fecha_hasta);
					IF (tieneReserva or esHuespedReserva) THEN
						RAISE EXCEPTION 'El nuevo propietario no puede tener una reserva o ser huesped de una en este momento.';
					END IF;
RETURN NEW;
end;
$body$ LANGUAGE plpgsql;

create  trigger tr_gr10_reserva_departamento
after insert or update on gr10_reserva
for each row
execute procedure trfn_gr10_check_propietario_reserva();

create  trigger tr_gr10_huesped_reserva_reserva_departamento
after insert or update on gr10_huesped_reserva
for each row
execute procedure trfn_gr10_check_propietario_huesped_reserva();

create  trigger tr_gr10_huesped_reserva_departamento_persona
after update of nro_doc, tipo_doc on gr10_departamento
for each row
execute procedure trfn_gr10_check_propietario_no_esta_reservando();

/*
Ejemplos de inserciones rechazadas:
				insert into gr10_reserva values (6, now(), '2020-10-10', '2020-12-12', 'tipo', 1, 2, 1, 1, 38524932);
				insert into gr10_reserva values (6, now(), '2020-10-10', '2020-12-12', 'tipo', 2, 2, 1, 1, 38524932);
*/

/* Punto d. Que la cantidad de huéspedes no supere la cantidad máxima de personas permitidas para una reserva */

create or replace function trfn_gr10_check_tipo_dpto_capacidad () returns trigger AS $body$
	declare
	dptos record;
	cant  integer;
	reservas record;
	begin
	FOR dptos IN (select *
					 from gr10_departamento d
					 where id_tipo_depto= new.id_tipo_depto)
	LOOP
		FOR reservas IN (select *
	          from gr10_reserva r
					  where r.id_dpto= dptos.id_dpto and CURRENT_DATE BETWEEN r.fecha_desde and r.fecha_hasta)
		LOOP
				cant := (select count(*)
			           from gr10_huesped_reserva hr
							   where hr.id_reserva= reservas.id_reserva);

				IF (new.cant_max_huespedes< cant) THEN
		 							RAISE EXCEPTION 'La cantidad de habitaciones no coinciden con las del tipo del depto';
		 		END IF;
		END LOOP;
	END LOOP;
	    RETURN NEW;
	end;
	$body$ LANGUAGE plpgsql;

create or replace function trfn_gr10_check_cant_huesped_reserva () returns trigger AS $body$
declare
v_cantidad_huespedes integer;
v_capacidad_depto integer;
begin
		v_cantidad_huespedes := (select count(*)
	 													 from gr10_huesped_reserva hr
													   where hr.id_reserva = new.id_reserva);
		v_capacidad_depto := (select t.cant_max_huespedes
												  from gr10_reserva r
												  join gr10_departamento d on (r.id_dpto= d.id_dpto)
												  join gr10_tipo_dpto t on (d.id_tipo_depto= t.id_tipo_depto)
													where(r.id_reserva= new.id_reserva));
		IF (v_capacidad_depto < v_cantidad_huespedes)	THEN
			RAISE EXCEPTION 'Capacidad máxima de huéspedes superada';
		END IF;
    RETURN NEW;
end;
$body$ LANGUAGE plpgsql;

create  trigger tr_gr10_cant_huesped_reserva
after insert or update on gr10_huesped_reserva
for each row
execute procedure trfn_gr10_check_cant_huesped_reserva();

create  trigger tr_gr10_reserva_departamento_huespedes
after update of id_dpto on gr10_reserva
for each row
execute procedure trfn_gr10_check_cant_huesped_reserva();

create  trigger tr_gr10_tipo_dpto_capacidad
after update of cant_max_huespedes on gr10_tipo_dpto
for each row
execute procedure trfn_gr10_check_tipo_dpto_capacidad();

/* Creacion de Servicios */

/* a) dada una fecha listar departamentos con su estado, es decir, si estan disponibles u ocupados en esa fecha */

CREATE OR REPLACE FUNCTION FN_GR10_listar_estado_departamento(fecha DATE)
RETURNS TABLE(id_departamento INT, estado_dpto VARCHAR) AS $body$
DECLARE
    var_r RECORD;
BEGIN
    FOR var_r IN (SELECT d.id_dpto,r.id_reserva
                  FROM gr10_departamento d
                  LEFT JOIN gr10_reserva r ON d.id_dpto = r.id_dpto
                  AND fecha BETWEEN r.fecha_desde AND r.fecha_hasta
                  ORDER BY d.id_dpto)
    LOOP
        id_departamento := var_r.id_dpto;
        IF (var_r.id_reserva IS NOT NULL) THEN
            estado_dpto := 'ocupado';
        ELSE
            estado_dpto := 'libre';
        END IF;
        RETURN NEXT;
    END LOOP;
END;
$body$ LANGUAGE plpgsql;

/* b) listar todos los departamentos que, dado un rango de fecha, estan libres en dicho rango */

CREATE OR REPLACE FUNCTION FN_GR10_departametos_disponibles(f_desde DATE, f_hasta DATE, city varchar(50))
RETURNS TABLE(id_departamento INT) AS $body$
DECLARE
    var_r RECORD;
	v_id_ciudad integer;
begin

	select id_ciudad into v_id_ciudad from gr10_ciudad where nombre like city;

    IF (f_desde < f_hasta) THEN
        FOR var_r IN (SELECT d.id_dpto
                      FROM gr10_departamento d
                      LEFT JOIN gr10_reserva r ON d.id_dpto = r.id_dpto
                      AND ((r.fecha_desde NOT BETWEEN f_desde AND f_hasta) AND (r.fecha_hasta NOT BETWEEN f_desde AND f_hasta))
                      WHERE d.id_ciudad = v_id_ciudad
                      GROUP BY d.id_dpto
                      ORDER BY d.id_dpto)
        LOOP
            id_departamento := var_r.id_dpto;
            RETURN NEXT;
        END LOOP;
    ELSE
        RAISE EXCEPTION 'La fecha de inicio debe ser menor a la fecha de fin';
    END IF;
END;
$body$ LANGUAGE plpgsql;

/* Creacion de vistas */

/* Punto a. listar departamentos y su recaudacion en los ultimos 6 meses */

create or replace view GR10_dpto_recaudacion AS
    SELECT d.id_dpto AS "ID departamento", COALESCE(SUM(p.importe), 0) AS "recaudacion"
    FROM gr10_departamento d
    LEFT JOIN gr10_reserva r ON d.id_dpto = r.id_dpto
    LEFT JOIN gr10_pago p ON r.id_reserva = p.id_reserva
        AND p.fecha_pago > CURRENT_DATE - INTERVAL '6 months'
    GROUP BY d.id_dpto
    ORDER BY d.id_dpto;

/* Punto b. listar departamentos ordenados por ciudad y por mejor rating */

create or replace view GR10_dpto_rating AS
	SELECT d.id_dpto, d.id_ciudad, COALESCE(AVG(CAST(c.estrellas AS FLOAT)), 0)
	FROM gr10_departamento d
	LEFT join gr10_reserva r ON d.id_dpto = r.id_dpto
	LEFT JOIN gr10_comentario c ON r.id_reserva = c.id_reserva
	GROUP BY d.id_dpto
	ORDER BY
		d.id_ciudad,
		AVG(c.estrellas);
---
