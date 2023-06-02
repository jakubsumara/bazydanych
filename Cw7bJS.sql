/*
1. Napisz procedurę wypisującą do konsoli ciąg Fibonacciego. Procedura musi przyjmować jako 
argument wejściowy liczbę n. Generowanie ciągu Fibonacciego musi zostać 
zaimplementowane jako osobna funkcja, wywoływana przez procedurę.*/

CREATE SCHEMA fibo;

CREATE FUNCTION fibo.fibonaczi(@n INT)
RETURNS INT
AS
BEGIN
    DECLARE @wynik BIGINT;

    IF @n <= 0
        SET @wynik = 0;
    ELSE IF @n = 1
        SET @wynik = 1;
    ELSE
    BEGIN
        DECLARE @fib0 BIGINT = 0;
        DECLARE @fib1 BIGINT = 1;
        DECLARE @i INT = 2;

        WHILE @i <= @n
        BEGIN
            SET @wynik = @fib0 + @fib1;
            SET @fib0 = @fib1;
            SET @fib1 = @wynik;
            SET @i = @i + 1;
        END
    END
    RETURN @wynik;
END;

CREATE PROCEDURE fibo.oblicz(@n INT)
AS
BEGIN
    DECLARE @i INT = 0;
    DECLARE @numerfibo INT;

    WHILE @i <= @n
    BEGIN
        SET @numerfibo = fibo.fibonaczi(@i);
        PRINT 'Liczba ciagu Fibonacciego na pozycji ' + CAST(@i AS VARCHAR(30)) + ' to ' + CAST(@numerfibo AS VARCHAR(30));
        SET @i = @i + 1;
    END
END;

--DROP PROCEDURE licz.CalculateFibonacci;

EXEC fibo.oblicz @n = 20; 

/*
2. Napisz trigger DML, który po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko 
tak, aby było napisane dużymi literami.	
*/

USE AdventureWorks2022;

CREATE TRIGGER Nazwisko
ON Person.Person
AFTER INSERT
AS
BEGIN
    UPDATE Person.Person SET LastName = UPPER(LastName)
END;

INSERT INTO Person.BusinessEntity(rowguid)
VALUES(newid())
SELECT * FROM [AdventureWorks2022].[Person].[BusinessEntity]
  
INSERT INTO Person.Person (BusinessEntityID, PersonType, FirstName, MiddleName, LastName) VALUES(20888,'IN', 'Jakub', 'Jerzy', 'Sumara')

SELECT * FROM [AdventureWorks2022].[Person].[Person]
-- błąd

/*
3. Przygotuj trigger ‘taxRateMonitoring’, który wyświetli komunikat o błędzie, jeżeli nastąpi 
zmiana wartości w polu ‘TaxRate’ o więcej niż 30%.
*/

CREATE TRIGGER taxRateMonitoring1
ON Sales.SalesTaxRate
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @newTaxRate SMALLMONEY, @oldTaxRate SMALLMONEY;
	SELECT @newTaxRate = TaxRate FROM inserted;
	SELECT @oldTaxRate = TaxRate FROM deleted;

	IF @newtaxrate > @oldTaxRate*1.3 OR @newtaxrate < @oldTaxRate*0.7
	BEGIN
		PRINT 'BLAD, ZA DUZA ZMIANA W POLU TAXRATE';	
		ROLLBACK;
	End
END;

--DROP TRIGGER taxRateMonitoring;
SELECT * FROM Sales.SalesTaxRate;

UPDATE Sales.SalesTaxRate SET TaxRate = TaxRate*1.5;