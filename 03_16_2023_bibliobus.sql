CREATE DATABASE ejemplo_6_Bibliobus;
go
USE ejemplo_6_Bibliobus;
go
CREATE TABLE tema
(
temaid int not null primary key identity(1,1),
tema varchar(60) not null
);

--Controlando el nombre de la clave primaria 
-- cuando la clave principal este formada
-- por varias columnas

CREATE TABLE libros
(isbn          CHAR(20) NOT NULL, 
 titulo        VARCHAR(60) NOT NULL, 
 autor         VARCHAR(80) NOT NULL, 
 no_ejemplares INT NOT NULL, 
 temaid        INT NOT NULL, 
 CONSTRAINT PK_libro PRIMARY KEY(isbn), 
 CONSTRAINT FK_libros_tema FOREIGN KEY(temaid) REFERENCES tema(temaid)
);

CREATE TABLE socios
(socio_id  INT NOT NULL IDENTITY(1, 1), 
 dni       CHAR(9) NOT NULL, 
 nombre    VARCHAR(60) NOT NULL, 
 direccion VARCHAR(120) NOT NULL, 
 CONSTRAINT PK_socios PRIMARY KEY(socio_id), 
 CONSTRAINT UK_dni UNIQUE(dni)
);

CREATE TABLE prestamos
(prestamo_id  INT NOT NULL IDENTITY(1, 1), 
 f_prestamo   DATE NOT NULL, 
 f_devolucion DATE, 
 isbn         CHAR(20), 
 socio_id     INT,
 --restricciones
 CONSTRAINT PK_prestamos PRIMARY KEY(prestamo_id), 
 CONSTRAINT FK_prestamos_libros FOREIGN KEY(isbn) REFERENCES libros(isbn), 
 CONSTRAINT FK_prestamos_socios FOREIGN KEY(socio_id) REFERENCES socios(socio_id)
);

--Añadir una nueva columna
ALTER TABLE tema
ADD descripcion VARCHAR(80) NOT NULL;

--Modificar una columna
-- cambiar el varchar de 80 a 100
ALTER TABLE tema 
ALTER COLUMN descripcion VARCHAR(100) NOT NULL;

--Eliminar una columna
ALTER TABLE tema DROP COLUMN descripcion;

--Añadir una columna a la tabla de socios
--Edad es entero y con una restricción de que tiene que ser mayor a 0

ALTER TABLE socios
ADD edad INT NOT NULL
             CHECK(edad > 0);

--eliminar la columna autor de la tabla libros
ALTER TABLE libros DROP COLUMN autor;

--Crear la tabla de autores
--dni y nombre
CREATE TABLE autores
(dni    CHAR(9) NOT NULL, 
 nombre VARCHAR(60) NOT NULL, 
 CONSTRAINT PK_autores PRIMARY KEY(dni)
);

--Crear la tabla libros_autores
--con las columnas isbn, dni
CREATE TABLE libros_autor
(ISBN CHAR(20) NOT NULL, 
 dni  CHAR(9) NOT NULL, 
 CONSTRAINT PK_libros_autor PRIMARY KEY(ISBN, dni), 
 CONSTRAINT FK_libros_autor_libros FOREIGN KEY(isbn) REFERENCES libros(isbn)
);

alter table libros_autor
add constraint FK_libros_autor_autor foreign key(dni) references autores(dni);

CREATE TABLE basurilla
(id int not null identity(1,1) primary key,
nombre varchar(60) not null
);

ALTER TABLE basurilla
ADD mas_basurilla VARCHAR(60) NOT NULL;

ALTER TABLE basurilla DROP column mas_basurilla;

--Borrar la tabla basurilla
drop table basurilla;
