use negocio;

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

-- cross Join Producto cartesiano
select * from clientes c cross join facturas;

-- Inner join Producto relacionado
select * from clientes c inner join facturas f on c.codigo=f.codigoCliente;

-- Temas pendientes
-- Left Join - Rigth Join

-- Left Join relacionado + clientes que nunca compraron
select * from clientes c left join facturas f on c.codigo=f.codigoCliente;

-- Right Join relacionado + facturas que no tienen clientes asignados
select * from clientes c right join facturas f on c.codigo=f.codigoCliente;


-- Clientes registrados que nunca compraron?
select c.codigo, c.nombre, c.apellido, c.cuit, c.direccion, c.comentarios 
	from clientes c left join facturas f on c.codigo=f.codigoCliente 
    where f.letra is null;

-- Cantidad de clientes registrados que nunca compraron?
select count(*) cantidad 
	from clientes c left join facturas f on c.codigo=f.codigoCliente 
    where f.letra is null;

-- Facturas que no tienen cliente asignado (facturas erroneas o falsas)?
select f.letra, f.numero, f.fecha, f.monto, f.codigoCliente 
	from clientes c right join facturas f on c.codigo=f.codigoCliente 
    where c.codigo is null;
    
-- Cantidad de facturas que no tienen cliente asignado?
select count(*) cantidad
	from clientes c right join facturas f on c.codigo=f.codigoCliente 
    where c.codigo is null;
    
-- A que cliente(nombre, apellido) pertenece la factura 'a' 1001?
select c.nombre, c.apellido 
	from clientes c join facturas f on c.codigo=f.codigoCliente 
    where letra='a' and numero='1001';

-- Clientes (nombre, apellido) que comprar el dia de hoy?
insert into facturas values ('b',2001,curdate(),5000,10);
insert into facturas values ('b',2002,curdate(),5000,11);
insert into facturas values ('b',2003,curdate(),5000,7);
insert into facturas values ('b',2004,curdate(),5000,8);
insert into facturas values ('b',2005,curdate(),5000,10);

select distinct c.nombre, c.apellido 
	from clientes c join facturas f on c.codigo=f.codigoCliente 
    where fecha=curdate();
-- disctinct no muestra tuplas(registros) duplicados

-- Cuanto se le facturo en total al cliente Juan Perez?
select * from clientes;
select sum(monto) total from clientes c join facturas f where nombre='Juan' and apellido='Perez';

select replace(round(sum(monto),2),'.',',') total 
	from clientes c join facturas f 
    where cuit='99999999';

describe facturas;
-- Creamos la tabla detalles
create table detalles(
	letraFactura char(1) not null,
    numeroFactura int not null,
    codigoArticulo int not null,
    cantidad int not null,
    precioVenta double not null,
    primary key(letraFactura, numeroFactura, codigoArticulo)
);

-- creamos restricciones de clave foranea
alter table detalles 
	add constraint FK_Detalles_Facturas
    foreign key(letraFactura, numeroFactura)
    references facturas(letra,numero);

alter table detalles
	add constraint FK_Detalles_Articulos
    foreign key(codigoArticulo)
    references articulos(codigo);



insert into detalles values('a',1,3,10,100);
insert into detalles values('a',1,1,3,200);
insert into detalles values('a',1,5,3,300);
insert into detalles values('a',2,3,10,400);
insert into detalles values('b',3,3,10,500);
select * from detalles;

-- Consulta del producto cartesiano
select * from clientes,facturas,detalles,articulos limit 50000;

select count(*) cantidad from clientes;						-- 51
select count(*) cantidad from facturas;						-- 20
select count(*) cantidad from detalles;						--  5
select count(*) cantidad from articulos;					--  7

select 51 * 20 * 5 * 7;										-- 35700
select count(*) from clientes,facturas,detalles,articulos;

-- Consulta del producto relacionado de toda la base
select * 
	from clientes c join facturas f on c.codigo=f.codigoCliente
    join detalles d on f.letra=d.letraFactura and f.numero=d.numeroFactura
    join articulos a on d.codigoArticulo=a.codigo;
    

insert into detalles values('a',1001,4,10,100);
insert into detalles values('a',1001,1,3,200);
insert into detalles values('a',1002,5,3,300);
insert into detalles values('a',1003,4,10,400);
insert into detalles values('a',1003,110,10,500);
insert into detalles values('a',1011,4,10,100);
insert into detalles values('a',1011,1,3,200);
insert into detalles values('b',2001,5,3,300);
insert into detalles values('b',2001,4,10,400);
insert into detalles values('b',2001,110,10,500);
select * from facturas;
select * from articulos;

-- Quienes (nombre, apellido) compraron el producto destornillador?
select distinct c.codigo, c.nombre, c.apellido 
	from clientes c join facturas f on c.codigo=f.codigoCliente
    join detalles d on f.letra=d.letraFactura and f.numero=d.numeroFactura
    join articulos a on d.codigoArticulo=a.codigo
    where a.nombre='destornillador';


-- Que articulos compro Juan Perez?
select distinct a.codigo, a.nombre, a.precio, a.stock
	from clientes c join facturas f on c.codigo=f.codigoCliente
    join detalles d on f.letra=d.letraFactura and f.numero=d.numeroFactura
    join articulos a on d.codigoArticulo=a.codigo
    where c.nombre='Juan' and c.apellido='Perez';

-- Que articulos se vendieron el dia de hoy?
select distinct a.codigo, a.nombre, a.precio, a.stock
	from facturas f join detalles d on f.letra=d.letraFactura and f.numero=d.numeroFactura
    join articulos a on d.codigoArticulo=a.codigo
    where f.fecha=curdate();




