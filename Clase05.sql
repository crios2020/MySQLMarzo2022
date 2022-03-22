-- clase 5
show databases;
use negocio;
show tables;
describe clientes;
describe facturas;
describe articulos;
select * from clientes;
select * from facturas;
select * from articulos;

-- Order by
select * from clientes;		-- no declaro el orden de registros

select * from clientes order by nombre;	
select * from clientes order by nombre asc;
select * from clientes order by nombre desc;
select * from clientes order by apellido desc;
select * from clientes order by apellido,nombre,cuit;
select * from clientes order by apellido desc, nombre,cuit;

insert into clientes (apellido,nombre,cuit) values 
('Perez','Ana',''),
('Perez','Carlos',''),
('Perez','Victor',''),
('Perez','Debora','555555'),
('Perez','Debora','333333');

select * from clientes where nombre>'m';

-- Backup		mysql_dump

-- función concat
select concat(nombre,' ',apellido) nombre_apellido from clientes;

-- función concat_ws
select concat_ws('|',nombre,apellido) nombre_apellido from clientes;

-- funcion upper lower
select upper(nombre) nombre, lower(apellido) apellido from clientes;

-- funcion left right
select left(nombre,2) nombre, right(apellido,2) apellido from clientes;

-- funcion substring
SELECT SUBSTRING(cuit, 4, 8) as 'DNI' FROM clientes;

insert into clientes (nombre,apellido,cuit) values ('Carlos','Rios','30-12345678-9');

SELECT direccion, CHAR_LENGTH(direccion) as 'Cantidad de caracteres' FROM clientes;

SELECT nombre, LOCATE('ar',nombre) 'Posición' from clientes;

insert into clientes (nombre,apellido,cuit) values ('   Carlos','Rios   ','30-12345678-9');

select * from clientes;

select rtrim(ltrim(nombre)) nombre, rtrim(ltrim(apellido)) apellido from clientes;

select trim(nombre) nombre, trim(apellido) apellido from clientes;

insert into clientes (nombre,apellido,direccion) values ('Carlos','Rios','Av. san martin 222');
SELECT REPLACE(direccion, 'Av.', 'Avenida') Direccion from clientes;

SELECT REPLACE(direccion, 'av.', 'Avenida') Direccion from clientes;

select year(curdate()) año;
select year(fecha) año from facturas;
select month(curdate()) mes;
select day(curdate()) dia;

select hour(curtime()) hora;
select minute(curtime()) minutos;
select second(curtime()) segundos;


SELECT DATEDIFF(CURDATE(), fecha) as 'DIAS TRANSCURRIDOS' FROM facturas;
SELECT DATEDIFF(CURDATE(), '1973/02/02') as 'DIAS TRANSCURRIDOS';

SELECT DAYNAME(CURDATE()) as 'Nombre del día';
select monthname(curdate()) as 'Nombre del mes';

select concat(dayname(curdate()),' ',day(curdate()),' ',monthname(curdate()),' ',year(curdate())) 'date';

SELECT DAYOFWEEK(CURDATE()) as 'Número del día de la semana';
SELECT DAYOFYEAR(CURDATE()) as 'Día del año';
select week(curdate());			-- semana 12
select weekofyear(curdate()); 	-- semana 12

SELECT CURDATE() 'Fecha actual',
ADDDATE(CURDATE(), INTERVAL 2 MONTH) 'Vencimiento a 2 meses',
ADDDATE(CURDATE(), INTERVAL 45 DAY) 'Vencimiento a 45 días',
ADDDATE(CURDATE(), INTERVAL 2 YEAR) 'Vencimiento a 2 años';

select adddate(curdate(), INTERVAL 90 DAY) '90 días';

SELECT ROUND(precio/3, 2) valor_cuota FROM articulos;

SELECT precio, precio * 1.27 'Precio con aumento',
CEIL(precio * 1.27) 'Precio redondeado +',
FLOOR(precio * 1.27) 'Precio redondeado -'
FROM articulos;

SELECT MOD(15, 4) resto;	-- 3
SELECT MOD(14, 2) resto;	-- 0
SELECT MOD(15, 2) resto;	-- 1
SELECT MOD(-14, 2) resto;	-- 0
SELECT MOD(-15, 2) resto;	-- -1

SELECT POW(2, 8);

