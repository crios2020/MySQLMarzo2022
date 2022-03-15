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
-- tinyint			1	2^8			256
-- smallint			2	2^16		65536
-- mediumint		3	2^24		16777216
-- int (integer)	4	2^32		4294967296
-- bigint			8	2^64		18446744073709551616
-- float			4	 		
-- double			8
-- decimal(t,d)		t+2 

/*
		codigo tinyint			(signed)
        
        |--------|--------|
	  -128	     0	 	 127

	
		codigo tinyint unsigned
        
        |-----------------|
		0				 255
        
*/

/*

        3/10
        
		precio float
        
        3.333333
        --------
        
        precio double
        
        3.333333333333333
        -----------------
        
        
        3/100
        
		precio float			(32 bits)
        
        33.33333
        --------
        
        precio double			(64 bits)
        
        33.33333333333333
        -----------------
        
        
        precio decimal(8,2)
        
        999999,99
        ------,--
        
        precio decimal (10,2)
        
        99999999,99
        --------,--
        
        
*/


-- Tipo de datos Fecha y Hora

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- date		3	Año Mes Dia ‘2022-03-15’		'2022/03/15'
-- datetime	8
-- time		3
-- year		1



-- Temas pendientes

-- Fecha hora

show databases;
use CursoMySQL;

select 'Hola Mundo!!';			-- imprime en la consola de salida

select 2+2;
select 2+2 as resultado;		-- uso del alias
select 2+2 resultado;			-- No es necesario usar as
select 2+2 valor_resultado;		-- no usar espacio   _
select 2+2 'valor resultado';	-- No se usa en programación, si se usa en reporteria
	
select PI() valor_PI;			-- funcion PI en un valor float
select round(pi(),2) valor_PI;	-- Redondear

select curdate() fecha_actual;		-- devuelve la fecha del server			formato date
select curtime() hora_actual;		-- devuelve la hora del server			formato time
select sysdate() fecha_hora;		-- devuelve fecha y hora del server		formato datetime

-- ------------------------
-- Definiciones importantes
-- ------------------------


-- Significado de SQL
-- Structured Query Language

-- ANSI SQL
-- En la actualidad el SQL es el estándar de facto de la inmensa mayoría de los SGBD comerciales.
-- Y, aunque la diversidad de añadidos particulares que incluyen las distintas implementaciones
-- comerciales del lenguaje es amplia, el soporte al estándar SQL-92 es general y muy amplio.


-- DDL (DATA DEFINITION LANGUAGE)
-- Create table
-- Alter table
-- Drop table

-- DML (DATA MANIPULATION LANGUAGE)
-- Select
-- Insert
-- Update
-- Delete



-- Comando DDL Alter 

-- Agregar un campo a la tabla		alter table
describe clientes;
select * from clientes;

alter table clientes add edad int;		-- agrega el campo edad

alter table clientes add fenaci date after direccion;

alter table clientes drop fenaci;		-- borra el campo fenaci

alter table clientes modify edad tinyint unsigned;
alter table clientes drop edad;

-- Comando DML insert 
-- insert normal con definición de campos		ANSI
insert into clientes (nombre,apellido,direccion) values ('Ana','Perez','Lama 222');

-- insert abreviado sin definición de campos	ANSI
insert into clientes values (null,'Jose','Soto','111111','peru 650',null);

select * from clientes;

-- insert set NO ANSI    solo mySQL o MariaDB
insert clientes set nombre='Laura', apellido='Gomez', direccion='lima 222';

-- Temas pendientes Insert Masivo


