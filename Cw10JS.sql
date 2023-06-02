/*
1. Napisz zapytanie, które wykorzystuje transakcję (zaczyna ją), a następnie
aktualizuje cenę produktu o ProductID równym 680 w tabeli Production.Product
o 10% i następnie zatwierdza transakcję.
*/

BEGIN TRANSACTION
UPDATE Production.Product SET ListPrice = ListPrice*1.1
WHERE ProductID = 680;
COMMIT;

SELECT * FROM [AdventureWorks2022].[Production].[Product] WHERE ProductID = 680;

/*
2. Napisz zapytanie, które zaczyna transakcję, usuwa produkt o ProductID równym
707 z tabeli Production.Product, ale następnie wycofuje transakcję.
*/

BEGIN TRANSACTION 
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
DELETE FROM Production.Product WHERE ProductID=707
SELECT * FROM Production.Product WHERE ProductID = 707;
ROLLBACK;

/*
3. Napisz zapytanie, które zaczyna transakcję, dodaje nowy produkt do tabeli
Production.Product, a następnie zatwierdza transakcję.*/

BEGIN TRANSACTION

SET IDENTITY_INSERT Production.Product ON;

INSERT INTO Production.Product (ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, rowguid, ModifiedDate)
VALUES (5, 'kolo', 'KO-2137', 0, 0, 1000, 375, 0.00, 0.00, 1, '2008-04-30 00:00:00.000', '694215B7-08F7-4C0D-ACB1-D734BA44C0C9', '2014-02-08 10:01:36.828')

SELECT * FROM Production.Product WHERE ProductID = 5;

SET IDENTITY_INSERT Production.Product OFF;

COMMIT;

/*
4. Napisz zapytanie, które zaczyna transakcję i aktualizuje StandardCost wszystkich
produktów w tabeli Production.Product o 10%, jeżeli suma wszystkich
StandardCost po aktualizacji nie przekracza 50000. W przeciwnym razie zapytanie
powinno wycofać transakcję.
*/

BEGIN TRANSACTION

UPDATE Production.Product SET StandardCost = StandardCost * 1.1

IF(SELECT SUM(StandardCost) FROM Production.Product) <=50000
	COMMIT TRANSACTION
ELSE
	ROLLBACK TRANSACTION
	
/*
5. Napisz zapytanie SQL, które zaczyna transakcję i próbuje dodać nowy produkt do
tabeli Production.Product. Jeśli ProductNumber już istnieje w tabeli, zapytanie
powinno wycofać transakcję.
*/

BEGIN TRANSACTION 

SET IDENTITY_INSERT Production.Product ON

DECLARE 
@productnumber nvarchar(25) = 'BB-R123-56'

IF EXISTS (SELECT * FROM Production.Product WHERE ProductNumber = @productnumber)
	ROLLBACK TRANSACTION 
ELSE
	BEGIN

	INSERT INTO Production.Product (ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, rowguid, ModifiedDate) 
	VALUES (1001,'rower',@productnumber,1,1,1000,375,0.00,25.25,2,'2008-04-30 00:00:00.000','694215B7-08F7-4C0D-ACB1-D732BA44C0C8','2008-04-30 00:00:00.000')

	COMMIT TRANSACTION

	END

SET IDENTITY_INSERT Production.Product OFF

SELECT * FROM Production.Product

/*
6. Napisz zapytanie SQL, które zaczyna transakcję i aktualizuje wartość OrderQty
dla każdego zamówienia w tabeli Sales.SalesOrderDetail. Jeżeli którykolwiek z
zamówień ma OrderQty równą 0, zapytanie powinno wycofać transakcję.
*/

SELECT * FROM  Sales.SalesOrderDetail

BEGIN TRANSACTION 
IF EXISTS (SELECT * FROM Sales.SalesOrderDetail WHERE OrderQty = 0) 
	ROLLBACK TRANSACTION
ELSE 
	BEGIN
	UPDATE Sales.SalesOrderDetail SET OrderQty = OrderQty + 1
	COMMIT TRANSACTION 
	END

UPDATE Sales.SalesOrderDetail SET OrderQty = OrderQty - 1

/*
7. Napisz zapytanie SQL, które zaczyna transakcję i usuwa wszystkie produkty,
których StandardCost jest wyższy niż średni koszt wszystkich produktów w tabeli
Production.Product. Jeżeli liczba produktów do usunięcia przekracza 10,
zapytanie powinno wycofać transakcję.
*/
select * from Production.Product

BEGIN TRANSACTION
DECLARE
	@srednia INT = (SELECT AVG(ListPrice) FROM Production.Product),
	@ilosc1 INT = (SELECT COUNT(*) FROM Production.Product)
DELETE FROM Production.Product WHERE StandardCost> @srednia
DECLARE
@ilosc2 INT = (SELECT COUNT(*) FROM Production.Product)

IF @ilosc1 - 10 < @ilosc2
	ROLLBACK TRANSACTION
ELSE
	COMMIT TRANSACTION