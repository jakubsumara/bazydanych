USE AdventureWorks2022

--zad1

WITH zadanie1(BusinessEntityID, Title, FirstName, MiddleName, LastName, Gender, BirthDate, JobTitle, Rate)
AS
(
	SELECT human.BusinessEntityID, Title, FirstName, MiddleName, LastName, Gender, BirthDate, JobTitle, Rate
	FROM AdventureWorks2022.HumanResources.EmployeePayHistory AS human
	JOIN Person.Person as person ON human.BusinessEntityID = person.BusinessEntityID
	JOIN HumanResources.Employee as employee ON human.BusinessEntityID = employee.BusinessEntityID
)
SELECT * FROM zadanie1;

--zad2

WITH zadanie2(CompanyContact,Revenue)
AS
(
	SELECT CONCAT(CompanyName, ' (', FirstName, LastName, ')') AS CompanyContact, TotalDue AS Revenue 
	FROM SalesLT.Customer AS klient
	JOIN SalesLT.SalesOrderHeader AS head
	ON klient.CustomerID = head.CustomerID
)
SELECT * FROM zadanie2 ORDER BY CompanyContact;

SELECT * FROM SalesLT.SalesOrderHeader

-- Zad. 3.
-- Napisz zapytanie, które zwróci wartość sprzedaży dla poszczególnych kategorii produktów
--ZMIEŃ BAZĘ NA LT
select * from SalesLT.ProductCategory
select * from SalesLT.Product
select * from SalesLT.SalesOrderDetail

WITH zadanie3(Category, SalesValue)
AS
(
	SELECT category.Name AS Category, ROUND(UnitPrice, 2) * OrderQty AS SalesValue 
	FROM SalesLT.Product AS produkt
	JOIN SalesLT.ProductCategory AS category
	ON produkt.ProductCategoryID = category.ProductCategoryID
	JOIN SalesLT.SalesOrderDetail AS detal
	ON produkt.ProductID = detal.ProductID
)
SELECT Category, SUM(SalesValue) AS SalesValue FROM zadanie3
GROUP BY Category;