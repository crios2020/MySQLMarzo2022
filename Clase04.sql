show databases;
use CursoMySQL;

drop database if exists negocio;
create database negocio;
use negocio;

create table clientes (
codigo integer auto_increment,
nombre varchar(20) not null,
apellido varchar(20) not null,
cuit char(13),
direccion varchar(50),
comentarios varchar(140),
primary key (codigo)
);

create table facturas(
letra char(1),
numero integer,
fecha date,
monto double,
primary key (letra,numero)
);

create table articulos(
codigo integer auto_increment,
nombre varchar(50),
precio double,
stock integer,
primary key (codigo)
);

insert into clientes (nombre,apellido,cuit,direccion) values ('juan','perez','xxxxx','peru 323');
insert into clientes (nombre,apellido,cuit,direccion) values ('diego','torres','xxxxx','chile 320');
insert into clientes (nombre,apellido,cuit,direccion) values ('laura','gomez','xxxxx','san juan 420');
insert into clientes (nombre,apellido,cuit,direccion) values ('mario','lopez','xxxxx','lavalle 770');
insert into clientes (nombre,apellido,cuit,direccion) values ('dario','sanchez','xxxxx','mexico 150');

insert into articulos values (1,'destornillador',25,50);
insert into articulos values (2,'pinza',35,22);
insert into articulos values (3,'martillo',15,28);
insert into articulos values (4,'maza',35,18);
insert into articulos values (5,'valde',55,13);

insert into facturas values ('a',0001,'2011/10/18',500);
insert into facturas values ('a',0002,'2011/10/18',2500);
insert into facturas values ('b',0003,'2011/10/18',320);
insert into facturas values ('b',0004,'2011/10/18',120);
insert into facturas values ('b',0005,'2011/10/18',560);
-- inserto un registro con la fecha actual
insert into facturas values ('c',0006,curdate(),300);

insert into clientes (nombre,apellido,cuit,direccion) values ('maria','fernandez','xxxxx','');
insert into clientes (nombre,apellido,cuit,direccion) values ('gustavo','ramirez','xxxxx',null);


insert into facturas values ('f',0006,curdate(),300);
insert into facturas values ('f',0007,curdate(),400);

insert into clientes (nombre,apellido,cuit,direccion) values ('jose','benuto','3647493','loria 940');

insert into facturas (letra,numero,fecha,monto) values ('a',1001,'2012/10/25',350);
insert into facturas (letra,numero,fecha,monto) values ('a',1002,curdate(),540);

insert into articulos (codigo,nombre,precio,stock) values (110,'destornillador',30,100);
insert into articulos (codigo,nombre,precio,stock) values (111,'martillo',40*1.21,50);

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

show tables;
describe Pedidos;
select * from Pedidos;

select * from clientes;

-- Uso del comando DML Select 		ANSI

-- * comodin que significa todos los campos
select * from clientes;
select nombre,apellido from clientes;
select apellido,nombre,apellido,curdate() fecha from clientes;
select concat(nombre,' ',apellido) 'nombre y apellido', direccion,cuit from clientes;

-- uso del where
select * from clientes where codigo=3;
select * from clientes where nombre='laura';

-- operadores relacionales = < <= > >= != <>
select * from clientes where codigo>=10;
select * from clientes where nombre>='laura';
select * from clientes where nombre != 'laura';
select * from clientes where nombre <> 'laura';

select * from facturas;
select * from facturas where monto >300;

-- Operador and y or
select * from clientes where nombre='Laura' or nombre='ana';

insert into clientes (nombre,apellido) values
	('laura','perez'),
    ('laura','gomez'),
    ('juan','Perez'),
    ('juan','Gomez');
    
select * from clientes where nombre='laura' or apellido='perez';
select * from clientes where nombre='laura' and apellido='perez';
select * from clientes where nombre='susana' and apellido='perez';

select * from facturas where monto >=300 and monto<=400;
select * from facturas where monto<300 or monto>400;

-- Operador between - not between
select * from facturas where monto between 300 and 400;
select * from facturas where monto not between 300 and 400;

-- Operador in - not in 
select * from clientes 
	where codigo=2 
    or codigo=5 
    or codigo=23 
    or codigo=15 
    or codigo=17;

select * from clientes 
	where codigo!=2 
    and codigo!=5 
    and codigo!=23 
    and codigo!=15 
    and codigo!=17;

select * from clientes where codigo in(2,5,23,15,17);
select * from clientes where codigo not in(2,5,23,15,17);

-- valores null		is null is not null
select * from clientes where direccion=null;   		-- error
select * from clientes where direccion is null;
select * from clientes where direccion is not null;
select * from clientes where direccion = '';

insert into clientes (nombre,apellido) values
('Mirta','Perez'),('Macarena','Perez'),('Micaela','Perez'),
('Omar','Perez'),('Martin','Perez'),('Monica','Perez'),
('Mariela','Perez'),('Magali','Perez'),('Mariano','Perez');

-- busqueda de expresiones like not like
select * from clientes where nombre like 'm%';	-- nombres que inician con letra m
select * from clientes where nombre like 'ma%';
select * from clientes where nombre like 'mar%';
select * from clientes where nombre like '%a';	-- nombres que terminan con letra a
select * from clientes where nombre like 'm%a'; -- nombres que inician con m y terminan con a
select * from clientes where nombre like '%ar%';-- nombres que contienen 'ar'
-- select * from libros where autor like '%borges%';
select * from clientes where nombre not like 'm%';	-- nombres que no inician con m
select * from clientes where nombre like 'm_r%';	-- _ significa 1 caracter solo
select * from clientes where nombre like '___';		-- nombres de 3 letras;
select * from clientes where nombre like '____';	-- nombres de 4 letras;
select * from clientes where nombre like '_____%';	-- nombres de 5 letras o mas;

show databases;
use negocio;
show tables;
describe articulos;

-- clausula limit
select * from clientes limit 0,2000;
select * from clientes limit 0,5;
select * from clientes limit 5,5;
select * from clientes limit 10,5;
select * from clientes limit 15,5;

-- Tema pendiente Orden By
