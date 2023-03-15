--EJEMPLOS DE INNER JOIN
--Obtener las columnas de productid, productname, categoryid, categoryname, unitprice
--de las tablas de Productos y Categorias

SELECT product_id, 
       product_name, 
       p.category_id, 
       category_name, 
       unit_price
FROM Categories c
     INNER JOIN Products p ON c.category_id = p.category_id;

-- Obtener las columnas orderid, producid, productname, unitprice de ambas tablas
--de las tablas detalle de ordenes y productos

SELECT [order_id], 
     p.[product_id], 
       p.[product_name], 
       od.[unit_price] as precio_vendido, 
       p.[unit_price] as precio_catalogo
FROM orders_details od
     INNER JOIN Products p ON od.[product_id] = p.[product_id];

-- Obtener las columnas orderid, employeeid, columna calculada de nombre y apellido, orderdate
-- de las tablas orders, employees
SELECT orderid, 
       o.employeeid, 
       --CONCAT(firstname, ' ', LastName) AS nombre_completo
	   concat_ws(' ', FirstName, LastName) as nombre_completo
	   --FirstName + ' ' + LastName as nombre_completo
FROM orders o
     INNER JOIN employees e ON o.EmployeeID = e.EmployeeID;

--Obtener el productid, productname, supplierid, companyname
--de las tablas products y suppliers

SELECT p.[ProductID],
p.[ProductName],
p.[SupplierID],
s.[CompanyName]
FROM [dbo].[Suppliers] s
INNER JOIN Products p ON p.SupplierID = s.SupplierID;

--Obtener el orderid, customerid, companyname y orderdate
--de las tablas orders y customers

SELECT [OrderID], 
       c.[CustomerID], 
       [CompanyName], 
       [OrderDate]
FROM orders ord
     JOIN customers c ON ord.[CustomerID] = c.[CustomerID];

--Obtener las columnas de productid, productname, categoryid, categoryname, unitprice
--de las tablas de Productos y Categorias
-- sólo de los productos cuya categoria sea 1, 3

SELECT productid, 
       productname, 
       p.categoryid, 
       categoryname, 
       unitprice
FROM Categories c
     INNER JOIN Products p ON c.CategoryID = p.CategoryID
WHERE p.CategoryID IN(1, 3);

-- Obtener las columnas orderid, producid, productname, unitprice de ambas tablas
--de las tablas detalle de ordenes y productos
-- cuyo precio de catalogo sea mayor a 75

SELECT [OrderID], 
      p.[ProductID], 
       p.[ProductName], 
       od.[UnitPrice] as precio_vendido, 
       p.[UnitPrice] as precio_catalogo
FROM [Order Details] od
     INNER JOIN Products p ON od.[ProductID] = p.[ProductID]
	 where p.UnitPrice > 75;

-- Obtener las columnas employeeid, columna calculada de nombre y apellido, contar las ordenes
-- de las tablas orders, employees
SELECT 
       o.employeeid, 
       --CONCAT(firstname, ' ', LastName) AS nombre_completo
	   concat_ws(' ', FirstName, LastName) as nombre_completo,
	   count(orderid) as contador_ordenes
	   --FirstName + ' ' + LastName as nombre_completo
FROM orders o
     INNER JOIN employees e ON o.EmployeeID = e.EmployeeID
group by o.employeeid,  concat_ws(' ', FirstName, LastName);

--1. --OBTENER LA SUMA DE LA CANTIDAD VENDIDA Y EL PRECIO PROMEDIO POR NOMBRE DE PRODUCTO
--DE LA TABLA DE ORDERS DETAILS Y PRODUCTS
SELECT ProductName, 
       AVG(OD.UNITPRICE) PRECIO_PROMEDIO, 
       SUM(QUANTITY) CANTIDAD_VENDIDA
FROM PRODUCTS P
     INNER JOIN [Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY ProductName;

--2. --OBTENER LAS VENTAS (UNITPRICE * QUANTITY) POR CLIENTE 
--DE LAS TABLAS ORDER DETAILS, ORDERS

SELECT O.CustomerID, SUM(OD.UNITPRICE * OD.QUANTITY) AS VENTAS
FROM ORDERS O
INNER JOIN [Order Details] OD
ON O.OrderID = OD.OrderID
GROUP BY O.CustomerID


