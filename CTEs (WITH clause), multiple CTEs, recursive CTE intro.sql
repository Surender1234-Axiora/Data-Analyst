----Simple CTE
-----Example: Total Sales by Customer

WITH CustomerSales AS
(SELECT CustomerID, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY CustomerID)
SELECT * FROM CustomerSales
ORDER BY TotalSales DESC;

------CTE with JOIN
------Example: Product Sales Summary

WITH ProductSales AS
(SELECT ProductID, SUM(LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail
GROUP BY ProductID)
SELECT P.Name, PS.TotalRevenue
FROM ProductSales PS
INNER JOIN Production.Product P
ON PS.ProductID = P.ProductID
ORDER BY PS.TotalRevenue DESC;


------CTE with HAVING
-----Customers with Sales Greater Than 100000

WITH CustomerSales AS
(SELECT CustomerID, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader GROUP BY CustomerID)
SELECT * FROM CustomerSales
WHERE TotalSales > 100000;


-------Multiple CTEs
-------You can define multiple CTEs separated by commas.
-----  Example: Sales + Orders

WITH CustomerSales AS
(SELECT CustomerID, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY CustomerID),
CustomerOrders AS
(SELECT CustomerID, COUNT(SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderHeader
GROUP BY CustomerID)
SELECT CS.CustomerID, CS.TotalSales, CO.TotalOrders
FROM CustomerSales CS
INNER JOIN CustomerOrders CO
ON CS.CustomerID = CO.CustomerID
ORDER BY CS.TotalSales DESC;


------Recursive CTE Example
------Employee Hierarchy

WITH Numbers AS
(SELECT 1 AS Num
UNION ALL
SELECT Num + 1
FROM Numbers
WHERE Num < 10)
SELECT *FROM Numbers;