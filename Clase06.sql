-- Clase 06

-- Plugin para mysql en vs code
-- https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-mysql-client2

show databases;
use negocio;

select version();

-- funciones de agrupamiento
-- Estas funciones siempre devuelven 1 registro como resultado

select * from facturas;
insert into clientes (nombre,apellido) values ('Zelena','Gomez');
insert into clientes (nombre,apellido) values ('Abel','Pintos');

-- función max(argumento)       argumento: numerico, texto, fecha
select max(monto) from facturas;
select max(monto) monto_máximo from facturas;

select max(fecha) ultima_fecha from facturas;

select max(nombre) ultimo_nombre from clientes;

-- función min(argumento)		argumento: numerico, texto, fecha
select min(monto) monto_mínimo from facturas;
select min(fecha) primer_fecha from facturas;
select min(nombre) primer_nombre from clientes;

select * from facturas;
insert into facturas (letra,numero,fecha,monto) values 
	('a',1003,curdate(),45000);
insert into facturas (letra,numero,fecha,monto) values 
	('a',1004,curdate(),45000.50);

-- función sum(argumento) 		argumento: numerico
select sum(monto) total_facturado from facturas;

select * from facturas;
select letra,numero,fecha,replace(round(monto,2),'.',',') from facturas;


-- función avg(argumento)		argumento: numerico				avg - average - promedio
select avg(monto) promedio from facturas;
select replace(round(avg(monto),2),'.',',') promedio from facturas;

select * from clientes;
-- función count(*)
select count(*) cantidad from facturas;							-- 12 facturas
select count(*) cantidad from clientes;							-- 56 clientes total
select count(direccion) cantidad from clientes;					-- 19 clientes con dirección not null
select count(*)-count(direccion) cantidad from clientes;		-- 37 clientes con dirección null

select count(*) cantidad from clientes where direccion is null;		-- 37 clientes con dirección null
select count(*) cantidad from clientes where direccion is not null;	-- 19 clientes con dirección not null

-- Columna calculada
select letra,numero,fecha,monto from facturas;
select letra,numero,fecha,monto, monto*0.21 valor_iva, monto*1.21 total_iva from facturas;
select letra,numero,fecha,monto, replace(round(monto*0.21,2),'.',',') valor_iva, replace(round(monto*1.21,2),'.',',') total_iva from facturas;

insert into facturas (letra,numero,fecha,monto) values 
	('a',1010,curdate(),45000.5),
    ('a',1011,curdate(),45000.5);

-- Subconsultas subqueries
select max(monto) monto_maximo from facturas;		-- 45000.5


-- select count(*) cantidad from facturas where monto=max(monto);		-- Error no se puede poner función de agrupamiento en el where.
select count(*) cantidad from facturas where monto=45000.5;
select count(*) cantidad from facturas where monto=(select max(monto) monto_maximo from facturas);

select * from facturas where monto=45000.5;
select * from facturas where monto=(select max(monto) monto_maximo from facturas);

-- las facturas del ultimo dia comercial
select max(fecha) from facturas;
select * from facturas where fecha=(select max(fecha) from facturas);

-- las facturas del primer dia comercial
select * from facturas where fecha=(select min(fecha) from facturas);

-- las facturas del año 2011
select * from facturas where year(fecha)=2011;

-- Total facturas en marzo 2022
select sum(monto) total from facturas where year(fecha)=2022 and month(fecha)=03;


select * from facturas;

insert into clientes (nombre,apellido,cuit) values						
( '	Ana	','	Recio	','	2222	'),
( '	juan	','	juanes	','	333	');




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

-- TEmas pendientes Group by y Having














