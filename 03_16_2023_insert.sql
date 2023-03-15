--Comando Insert
--añadir una(s) fila(s) a una tabla
--Sintaxis
--1a variante
INSERT INTO Categories
(CategoryName, 
 Description
)
VALUES
('prueba insert', 
 'Esta categoria se realiza desde una ventana de consulta'
);

--2a variante
--Cuando hay que dar de alta todos los datos de la tabla 
insert into Categories
values
('todas columnas','Este ejemplo es cuando tenemos todos los datos de la fila','x1')

--3a variante
--insertar más de una fila a la vez
INSERT INTO Categories
(CategoryName)
values
       ('varios a la vez'), 
       ('otro ...'), 
       ('otro ....');

select * from Categories order by CategoryID desc;

--insertar una fila en la tabla de productos

insert into products
(ProductName, CategoryID, SupplierID)
values
('Ejemplo1',1,1)

select * from Products order by ProductID desc;
--insertar una fila en la tabla de empleados
INSERT INTO Employees
([LastName], 
 [FirstName], 
 [BirthDate],
[HireDate]
)
VALUES
('García', 
 'Manolo', 
 '30-08-1992',
-- cast ('01-12-2021' as datetime)
convert(datetime, '01/12/2021',103)
);

select * from Employees order by EmployeeID desc;
select * from [Order Details];


sp_helplanguage;
select @@LANGUAGE;
--cambiar el idioma de la conexion 
set language English;

--cambiar el formato de la fecha
set dateformat dmy

--insertar varias filas en la tabla de orders details
insert into [Order Details]
values
(10248,2,2,2,0),
(10248,3,3,3,0);

--Sintaxis del Update
--Modificando una columna
UPDATE Categories
  SET 
      CategoryName = 'cambio'
WHERE CategoryID = 9;
--Modificando más de una columna
UPDATE Categories
  SET 
      CategoryName = 'cambio', Description='otro cambio'
WHERE CategoryID = 9;

--cambiar el nombre del producto creado en ejercicio anterior
update Products
set productname = 'cambio'
where ProductID =79;
--cambiar la cantidad del detalle de la orden con id 10248 y producto 2  por 20
update [dbo].[Order Details]
set quantity = '20'
where orderid = '10248' and productid = '2';

--No mostrar el mensaje de las filas afectadas
set nocount off;

--Delete 
DELETE FROM Categories
WHERE CategoryID > 10;

select * from Products;

delete from Products
where ProductID >= 79;

--Cómo crear un indice
--Crear un índice en la tabla de clientes por país
CREATE INDEX ix_pais ON Customers(country);
--Crear un índice en la tabla de Productos por la columna
--[UnitsInStock]
CREATE INDEX ix_stock ON products(unitsinstock);
--Borrar el índice 
DROP INDEX ix_stock ON products;

-- Crear tabla
create table indice_agrupado
(
id int primary key,
valor char 
);

create table indice_no_agrupado
(
id int primary key nonclustered,
valor char 
);
