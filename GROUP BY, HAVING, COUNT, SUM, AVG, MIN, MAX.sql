Select * from Sales.SalesOrderHeader;

------Group By
---Total Sales by Customer
SELECT CustomerID, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY TotalSales DESC;

--------Count
------Count Orders by Sales Person
SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
GROUP BY SalesPersonID
ORDER BY TotalOrders DESC;

-------Sum
------Total Revenue by Product
SELECT P.Name AS ProductName, SUM(SOD.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail SOD
INNER JOIN Production.Product P
ON SOD.ProductID = P.ProductID
GROUP BY P.Name
ORDER BY TotalRevenue DESC;


--------AVG
-------Average Order Amount by Territory
SELECT TerritoryID, AVG(TotalDue) AS AvgOrderAmount
FROM Sales.SalesOrderHeader
GROUP BY TerritoryID
ORDER BY AvgOrderAmount DESC;


-------MIN
------Minimum Product Price by Product Category
SELECT ProductSubcategoryID, MIN(ListPrice) AS MinimumPrice
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID
ORDER BY MinimumPrice;


---------MAX
-------Maximum Product Price by Product Category
SELECT ProductSubcategoryID, MAX(ListPrice) AS MaximumPrice
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID
ORDER BY MaximumPrice DESC;


--------Having
-------Show Customers with Sales Greater Than 100000
SELECT CustomerID, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING SUM(TotalDue) > 100000
ORDER BY TotalSales DESC;

------Combined Example
------Sales Summary by Product
SELECT P.Name AS ProductName,
COUNT(SOD.SalesOrderID) AS TotalOrders,
SUM(SOD.LineTotal) AS TotalSales,
AVG(SOD.LineTotal) AS AvgSales,
MIN(SOD.LineTotal) AS MinSales,
MAX(SOD.LineTotal) AS MaxSales
FROM Sales.SalesOrderDetail SOD
INNER JOIN Production.Product P
ON SOD.ProductID = P.ProductID
GROUP BY P.Name
HAVING SUM(SOD.LineTotal) > 50000
ORDER BY TotalSales DESC;