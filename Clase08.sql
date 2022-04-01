show databases;
use negocio;
show tables;
describe clientes;
describe facturas;
describe articulos;
describe pedidos_neptuno;

select * from clientes;
select * from facturas;
select * from articulos;
select * from pedidos_neptuno;

-- Ingresamos el campo de relación
alter table facturas add codigoCliente int not null;

set sql_safe_updates=0;
update facturas set codigoCliente=1 where numero<5;
update facturas set codigoCliente=2 where numero between 5 and 100;
update facturas set codigoCliente=3 where numero>=1000;

-- Ingreso un registro que no cumple con la integridad referencial (Registro no valido)
-- Factura realizada a un cliente no registrado o desconocido
insert into facturas values ('c',1001,curdate(),500,150);

-- asignamos un cliente valido a la factura c 1001 para cumplir con la integridad referencial
update facturas set codigoCliente=6 where letra='c' and numero=1001;

-- Ingresamos el campo clave foranea (Foreign Key)!
alter table facturas
	add constraint FK_Facturas_Clientes
    foreign key(codigoCliente)
    references clientes(codigo);

-- Registro no valido
-- insert into facturas values ('c',1002,curdate(),500,150);

-- Consulta del producto cartesiano
select * from clientes,facturas;

select count(*) cantidad from clientes;						--  51
select count(*) cantidad from facturas;						--  15
select 51 * 15;												-- 765
select 		(select count(*) from clientes)					-- 765
		*	(select count(*) from facturas) cantidad;
        
select count(*) cantidad from clientes, facturas;			-- 765

-- Consulta del producto relacionado
select * from clientes, facturas where codigo=codigoCliente;
select * from clientes, facturas where clientes.codigo=facturas.codigoCliente;
select * from clientes c, facturas f where c.codigo=f.codigoCliente;

-- Uso del JOIN (Devuelve el producto relacionado)
select * from clientes c join facturas f on c.codigo=f.codigoCliente; 

-- Temas pendientes
-- Left Join - Rigth JOin


