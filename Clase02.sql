-- Clase 2
-- Encender servicio MySQL en el paquete XAMPP
-- Abrir workbench y conectar

show databases;

use CursoMySQL;

show tables;		-- muestras las tablas de la BD

/*
	Planilla de Calculo				Base de Datos
    Columna							Campo
    Fila							Registro


	Planilla de calculo	almacena en Memoria.
    
    Base de datos almacena en disco duro.


	Memoria RAM:	Ultra Veloz		Volatil			Muy Caro	
    Disco Duro:		Muy Lento		Persistente		Muy Economico

*/

-- Creamos la tabla clientes
drop table if exists clientes;
create table clientes (
	codigo 		int 			auto_increment primary key,
    nombre 		varchar(20) 	not null,
    apellido 	varchar(20) 	not null,
    cuit 		char(13),
    direccion 	varchar(50),
    comentarios varchar(255)
);

describe clientes;			-- muestra la estructura de la tabla

select * from clientes;		-- muestra los registros de una tabla

-- insertar un registro
insert into clientes (nombre, apellido, direccion) values ('Ana', 'Garcia', 'Lavalle 648');
insert into clientes (nombre, apellido, direccion) values ('Diego', 'Vega', 'Lavalle 1648');
insert into clientes (apellido, nombre, direccion) values ('Torres', 'Virginia', 'Medrano 1648');

insert into clientes (nombre,apellido,cuit,direccion) values ('juan','perez','xxxxx','peru 323');
insert into clientes (nombre,apellido,cuit,direccion) values ('diego','torres','xxxxx','chile 320');
insert into clientes (nombre,apellido,cuit,direccion) values ('laura','gomez','xxxxx','san juan 420');
insert into clientes (nombre,apellido,cuit,direccion) values ('mario','lopez','xxxxx','lavalle 770');
insert into clientes (nombre,apellido,cuit,direccion) values ('dario','sanchez','xxxxx','mexico 150');
-- insert into clientes (apellido,cuit,direccion) values ('sanchez','xxxxx','mexico 150');



-- -----------------------------------
-- Tipos de datos más comunes en MySQL
-- -----------------------------------


-- Tipo de datos Texto de datos más comunes

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- char(x)		x
-- varchar(x)	x+1

/*
			nombre char(20),
            |ANA                 |				20 bytes
            |CARLOS              |				20 bytes
			|MAXIMILIANO         |				20 bytes
										Total	60 bytes
                                        
			nombre varchar(20),
            |ANA                 |				 3 + 1 =  4 bytes
            |CARLOS              |				 6 + 1 =  7 bytes
            |MAXIMILIANO         |				11 + 1 = 12 bytes
												Total	 23 bytes

*/



-- Tipo de datos Numérico

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- bool (boolean)	1	(0 es false distinto de 0 es true)
-- tinyint			1	2^8		256
-- smallint			2	2^16		65536
-- mediumint		3	2^24		16777216
-- int (integer)	4	2^32		4294967296
-- bigint			8	2^64		18446744073709551616
-- float			4	 		
-- double			8
-- decimal(t,d)		t+2 


-- Tipo de datos Fecha y Hora

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- date		3	Año Mes Dia ‘2012-10-25’		
-- datetime	8
-- time		3
-- year		1



-- Temas pendientes
-- Signed Unsigned
-- Tipo de datos enteros - Decimal - Fecha hora




