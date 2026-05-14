SELECT SUM(TotalDue) FROM Sales.SalesOrderHeader;


----1. SUM() OVER()

SELECT SalesOrderID, TotalDue,
SUM(TotalDue) OVER() AS GrandTotal
FROM Sales.SalesOrderHeader;

-----2. SUM() OVER(PARTITION BY)

SELECT CustomerID, SalesOrderID, TotalDue, SUM(TotalDue) OVER
(PARTITION BY CustomerID) AS CustomerTotal
FROM Sales.SalesOrderHeader;

------3. SUM() OVER(ORDER BY)

SELECT SalesOrderID, OrderDate, TotalDue, SUM(TotalDue) OVER
(ORDER BY OrderDate) AS RunningTotal
FROM Sales.SalesOrderHeader;

-------4. AVG() OVER()

SELECT CustomerID, SalesOrderID, TotalDue, AVG(TotalDue) OVER
(PARTITION BY CustomerID) AS AvgCustomerSales
FROM Sales.SalesOrderHeader;

-------5. COUNT() OVER()

SELECT CustomerID, SalesOrderID, COUNT(*) OVER
(PARTITION BY CustomerID) AS TotalOrders
FROM Sales.SalesOrderHeader;

-----Combined Example

SELECT CustomerID, SalesOrderID, OrderDate, TotalDue, SUM(TotalDue) OVER
(PARTITION BY CustomerID) AS CustomerTotal,
AVG(TotalDue) OVER
(PARTITION BY CustomerID) AS CustomerAverage, COUNT(*) OVER
(PARTITION BY CustomerID) AS OrderCount, SUM(TotalDue) OVER
(ORDER BY OrderDate) AS RunningTotal
FROM Sales.SalesOrderHeader;

-------6. PARTITION BY + ORDER BY Together

SELECT CustomerID, OrderDate, TotalDue, SUM(TotalDue) OVER
(PARTITION BY CustomerID
ORDER BY OrderDate) AS CustomerRunningTotal
FROM Sales.SalesOrderHeader;



