
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
insert into gr10_reserva values (1,'2017-10-01','2018-01-01','2018-01-24','TIPO',4,1600,1,1,38524932);
insert into gr10_reserva values (2,'2017-11-30','2018-02-01','2018-03-14','TIPO',1,800,1,2,42908673);
insert into gr10_reserva values (3,'2017-09-18','2018-04-01','2018-04-10','TIPO',2,600,1,3,13244453);
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

------
/* After insets */

/* Punto a. Que las fechas de las reservas sean consistentes, es decir que la fecha de inicio de la reserva sea menor que la fecha de finalización. */

alter table gr10_reserva add constraint gr10_reserva_check_fecha_reserva check ( fecha_reserva <= now());
alter table gr10_reserva add check (fecha_reserva <= fecha_desde);
alter table gr10_reserva add check ( fecha_desde < fecha_hasta);

/*
 * 	Ejemplo de tuplas no aceptadas luego de las restricciones
 *  
 * insert into gr10_reserva values (1,'2018-08-01','2018-10-15','2018-11-14','TIPO',3,1300,1,1,38524932); 
 * insert into gr10_reserva values (1,'2018-03-01','2018-02-15','2018-02-19','TIPO',3,1300,1,1,38524932);
 * insert into gr10_reserva values (1,'2018-03-01','2018-04-15','2018-04-14','TIPO',3,1300,1,1,38524932);
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

	IF (v_cant_habitaciones_tipo <> v_count_habitaciones) THEN
            RAISE EXCEPTION 'La cantidad de habitaciones no coinciden con las del tipo del depto';
    END IF;
    RETURN NEW;
end;
$body$ LANGUAGE plpgsql;

create  trigger tr_gr10_departamento_habitaciones
before insert or update on gr10_departamento
for each statement
execute procedure trfn_gr10_check_depto_habitaciones();

create  trigger tr_gr10_habitaciones_departamento
before insert or update on gr10_habitacion
for each statement
execute procedure trfn_gr10_check_depto_habitaciones();


/* Punto c. Que tanto la persona que realiza la reserva como los huéspedes no sea el propietario del departamento  */

create or replace function trfn_gr10_check_propietario_no_alquila () returns trigger AS $body$
begin
    IF ((SELECT COUNT(*)
        FROM gr10_reserva r
        LEFT JOIN gr10_huesped_reserva hr ON r.id_reserva = hr.id_reserva
        WHERE r.id_dpto IN (SELECT d.id_dpto
                            FROM gr10_departamento d
                            WHERE (r.tipo_doc = d.tipo_doc AND r.nro_doc = d.nro_doc)
                                OR (hr.tipo_doc = d.tipo_doc AND hr.nro_doc = d.nro_doc))) > 0) THEN
            RAISE EXCEPTION 'EL propietario del departamento no puede ser huesped del mismo';
    END IF;
    RETURN NEW;
end;
$body$ LANGUAGE plpgsql;

create  trigger tr_gr10_reserva_departamento_persona 
before insert or update on gr10_reserva
for each statement
execute procedure trfn_gr10_check_propietario_no_alquila();

/* Punto d. Que la cantidad de huéspedes no supere la cantidad máxima de personas permitidas para una reserva */

create or replace function trfn_gr10_check_cantidad_huespedes () returns trigger AS $body$
declare
v_cantidad_huesped integer;
v_capacidad_depto integer;
begin
	select count(nro_doc) into v_cantidad_huesped  from gr10_huesped_reserva where id_reserva = new.id_reserva;
	
	select gr10_tipo_dpto.cant_habitaciones
	into v_capacidad_depto
	from gr10_departamento
	join gr10_tipo_dpto on (gr10_departamento.id_tipo_depto = gr10_tipo_dpto.id_tipo_depto )
	join gr10_reserva on (gr10_reserva.id_dpto = gr10_departamento.id_dpto)
	where gr10_reserva.id_reserva = new.id_reserva;

    IF (v_capacidad_depto < v_cantidad_huesped) THEN
            RAISE EXCEPTION 'La capacidad del departamento fue superado.';
    END IF;
    RETURN NEW;
end;
$body$ LANGUAGE plpgsql;

create  trigger tr_gr10_reserva_departamento_huespedes
before insert or update on gr10_reserva
for each statement
execute procedure trfn_gr10_check_cantidad_huespedes();

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
                      WHERE id_ciudad = v_id_ciudad
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

