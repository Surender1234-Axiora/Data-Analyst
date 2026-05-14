--------Create Index
CREATE NONCLUSTERED INDEX IX_Sales_CustomerID
ON Sales.SalesOrderHeader(CustomerID);

SELECT * FROM Sales.SalesOrderHeader
WHERE CustomerID = 11000;

-----CTE vs Subquery

SELECT *FROM(
SELECT CustomerID, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY CustomerID) AS SalesSummary
WHERE TotalSales > 100000;

