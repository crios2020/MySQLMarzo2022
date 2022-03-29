-- https://vscode-sqltools.mteixeira.dev/ 
-- para ejecutar hay que señalar y CTRL E CTRL E

show databases;
use negocio;

-- Group by
-- Total recaudado por cada letra de facturas
select 'letra A' letra, sum(monto) total from facturas where letra='a';		-- 183891.5
select 'letra B' letra, sum(monto) total from facturas where letra='b';		--   1000
select 'letra C' letra, sum(monto) total from facturas where letra='c';		--    300
select 'letra F' letra, sum(monto) total from facturas where letra='f';		--    700

/*
	Total recaudado por cada letra de facturas
    
    letra			total
    letra A			183891.5
    letra B			  1000
    letra C			   300
    letra F			   700

*/




select sum(monto) total from facturas;								-- 185891.5
select 
		(select sum(monto) total_letra_a from facturas where letra='a') +
        (select sum(monto) total_letra_a from facturas where letra='b') +
        (select sum(monto) total_letra_a from facturas where letra='c') +
        (select sum(monto) total_letra_c from facturas where letra='f');



select letra, sum(monto) total from facturas group by letra;

-- total recaudado por cada día
select fecha, sum(monto) total from facturas group by fecha;

-- total recaudado y cantidad de facturas por cada día
select fecha, sum(monto) total, count(*) cantidad from facturas group by fecha;

-- total recaudado por mes?
select fecha from facturas;

select month(fecha) mes from facturas;
select concat(year(fecha),'/',month(fecha)) mes from facturas order by fecha;

select concat(year(fecha),'/',month(fecha)) mes, sum(monto) total 
    from facturas group by mes;

select concat(year(fecha),'/',month(fecha)) mes, sum(monto) total 
    from facturas group by concat(year(fecha),'/',month(fecha));


-- uso del having
select letra, sum(monto) total from facturas group by letra having sum(monto)>=1000;


show tables;
show databases;

-- se descargo de alumni
select * from pedidos_neptuno;

-- Utilizando la tabla PEDIDOS_NEPTUNO, calcula las siguientes estadísticas:
-- a. El total facturado por empleado.
select empleado, round(sum(cargo),2) facturación from pedidos_neptuno group by empleado;

-- a2. El total vendido a cada cliente (NombreCompania).
select NombreCompania, round(sum(cargo),2) facturación from pedidos_neptuno group by NombreCompania;

-- b. El promedio de facturación por empleado.
select empleado, round(avg(cargo),2) promedio from pedidos_neptuno group by empleado;

-- c. La mejor venta efectuada por cada empleado.
select empleado, max(cargo) mejor_venta from pedidos_neptuno group by empleado;

-- d. La peor venta efectuada por cada empleado.
select empleado, min(cargo) peor_venta from pedidos_neptuno group by empleado;

-- e. La cantidad de ventas efectuadas por cada empleado.
select empleado, count(*) cantidad_ventas from pedidos_neptuno group by empleado;

-- x. Cantidad de ventas por transportista y por mes
select Transportista, concat(year(FechaPedido),'/',month(FechaPedido)) mes, count(*) cantidad_ventas from 
	pedidos_neptuno group by Transportista, concat(year(FechaPedido),'/',month(FechaPedido));

-- f. Ten en cuenta las siguientes especificaciones: las columnas deben recibir los
-- nombres FACTURACION, PROMEDIO, MEJOR VENTA, PEOR VENTA y VENTAS.
-- Las columnas FACTURACION y PROMEDIO deben mostrar, como máximo, 2
-- decimales.


-- Comando DML delete ANSI
select * from clientes;
-- delete from clientes where codigo=40;

select count(*) cantidad from clientes where nombre='Juan';
-- delete from clientes where nombre='Juan';
-- delete from clientes;

-- descactivar o activar la protección safeupdates de workbench
set sql_safe_updates =	1;			-- =0 para desactivar   =1 para activar

insert into clientes (codigo,nombre,apellido) values (100,'Homero','Simpson');
-- delete from clientes where codigo=100;
insert into clientes (nombre,apellido) values ('bart','simpson');

-- comando DDL truncate table
-- truncate clientes;


-- Comando DML update ANSI
select * from clientes;

update clientes set cuit='87654321' where codigo=2;
update clientes set cuit='99999999', direccion='Medrano 162' where codigo=1;
-- update clientes set nombre='Juana' where nombre='Juan';
-- update clientes set nombre='Juana';


-- Calcula la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO que hayan sido
-- entregados por el transportista con el nombre SPEEDY EXPRESS. La columna en la que
-- se obtiene el resultado debe mostrarse con el nombre ENTREGAS SPEEDY EXPRESS.
select * from pedidos_neptuno;

select count(*) 'ENTREGAS SPEEDY EXPRESS' from pedidos_neptuno where Transportista='SPEEDY EXPRESS';		-- 248

select count(*) 'ENTREGAS SPEEDY EXPRESS' from pedidos_neptuno where Transportista like '%speedy%' or Transportista like '%express%';






































insert into clientes (nombre,apellido,cuit,direccion) values ('juan','perez','xxxxx','peru 323');
insert into clientes (nombre,apellido,cuit,direccion) values ('diego','torres','xxxxx','chile 320');
insert into clientes (nombre,apellido,cuit,direccion) values ('laura','gomez','xxxxx','san juan 420');
insert into clientes (nombre,apellido,cuit,direccion) values ('mario','lopez','xxxxx','lavalle 770');
insert into clientes (nombre,apellido,cuit,direccion) values ('dario','sanchez','xxxxx','mexico 150');

insert into clientes (nombre,apellido,direccion) values ('Andrea','Abate','Laprida 648');
insert into clientes (apellido,nombre) values ('Stuart','Jhon');
insert into clientes values(null,'Laura','Georgeff','56565','Berutti 2589','');
insert into clientes (codigo,nombre,apellido,cuit,direccion) values (null,'jose','sanchez','xxxxx','chile 150');
insert into clientes values (null,'marta','martinez','xxxxx','florida 150','');
insert into clientes (nombre,apellido,cuit,direccion) values ('carlos','flores','xxxxx','bolivar 150');
insert into clientes values (20,'Romeo','Lopez','34343434','Anchorena 950','');
insert into clientes (nombre,apellido,cuit,direccion) values ('Florencia','Salinas','82828282','W.Morris 3420');
insert into clientes (apellido,nombre,direccion) values ('Ana','Salone',null);
insert into clientes (nombre,apellido) values ('Ana','Lopez');
insert into clientes (nombre,apellido) values ('Laura','Garcia');
insert into clientes (nombre,apellido) values ('Diego','Borro');
insert into clientes (nombre,apellido) values ('Lorena','Braca');
insert into clientes (nombre,apellido) values ('Manuel','Mendoza');
insert into clientes (nombre,apellido) values ('Javier','Ledesma');
insert into clientes (nombre,apellido) values ('Mario','Alunso');

-- valores null		(null desconocido)
insert into clientes (nombre,apellido,direccion) values ('Melina','Salas',null);
insert into clientes (nombre,apellido,direccion) values ('Gustavo','Campos','');

-- Comando DML insert 
-- insert normal con definición de campos		ANSI
insert into clientes (nombre,apellido,direccion) values ('Ana','Perez','Lama 222');

-- insert abreviado sin definición de campos	ANSI
insert into clientes values (null,'Jose','Soto','111111','peru 650',null);

select * from clientes;

-- insert set NO ANSI    solo mySQL o MariaDB
insert clientes set nombre='Laura', apellido='Gomez', direccion='lima 222';

-- Insert Masivo ANSI
-- 1 sola Transacción
insert into clientes (nombre,apellido) values
	('Ana','Lopez'),
    ('Laura','Garcia'),
    ('Diego','Borro'),
    ('Lorena','Braca'),
    ('Manuel','Mendoza'),
    ('Javier','Ledesma'),
    ('Mario','Alunso');


-- 7 Transacciones
insert into clientes (nombre,apellido) values ('Ana','Lopez');
insert into clientes (nombre,apellido) values ('Laura','Garcia');
insert into clientes (nombre,apellido) values ('Diego','Borro');
insert into clientes (nombre,apellido) values ('Lorena','Braca');
insert into clientes (nombre,apellido) values ('Manuel','Mendoza');
insert into clientes (nombre,apellido) values ('Javier','Ledesma');
insert into clientes (nombre,apellido) values ('Mario','Alunso');

-- valores null		(null desconocido)
insert into clientes (nombre,apellido,direccion) values ('Melina','Salas',null);
insert into clientes (nombre,apellido,direccion) values ('Gustavo','Campos','');
insert into clientes (nombre,apellido) values
('Mirta','Perez'),('Macarena','Perez'),('Micaela','Perez'),
('Omar','Perez'),('Martin','Perez'),('Monica','Perez'),
('Mariela','Perez'),('Magali','Perez'),('Mariano','Perez');









