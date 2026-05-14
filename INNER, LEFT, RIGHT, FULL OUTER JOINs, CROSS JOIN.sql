Select * from Sales.Customer;
Select * from Sales.SalesOrderHeader;
Select * from Person.Person;
Select * from Production.Product;

-----INNER JOIN
----Returns only matching records from both tables.

SELECT C.CustomerID, SOH.SalesOrderID, SOH.OrderDate
FROM Sales.Customer C
INNER JOIN Sales.SalesOrderHeader SOH
ON C.CustomerID = SOH.CustomerID;

---------LEFT JOIN
---------All records from left table
-------Matching records from right table
-------Non-matching right-side values become NULL
SELECT C.CustomerID, SOH.SalesOrderID
FROM Sales.Customer C
LEFT JOIN Sales.SalesOrderHeader SOH
ON C.CustomerID = SOH.CustomerID;


-------RIGHT JOIN
------All records from right table
------Matching records from left table

SELECT C.CustomerID, SOH.SalesOrderID
FROM Sales.Customer C
RIGHT JOIN Sales.SalesOrderHeader SOH
ON C.CustomerID = SOH.CustomerID;


-------FULL OUTER JOIN
-------All matching rows
-------All non-matching rows from both tables

SELECT C.CustomerID, SOH.SalesOrderID
FROM Sales.Customer C
FULL OUTER JOIN Sales.SalesOrderHeader SOH
ON C.CustomerID = SOH.CustomerID;


--------CROSS JOIN
--------Returns Cartesian Product
------Every row from first table joins with every row from second table.

SELECT P1.Name AS Product1, P2.Name AS Product2
FROM Production.Product P1
CROSS JOIN Production.Product P2;

