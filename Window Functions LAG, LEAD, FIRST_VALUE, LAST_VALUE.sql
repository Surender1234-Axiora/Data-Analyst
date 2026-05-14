Select * from Sales.SalesOrderHeader;

-----1. LAG()
------Returns value from previous row.

SELECT SalesOrderID, OrderDate, TotalDue,
LAG(TotalDue) OVER
(ORDER BY OrderDate) AS PreviousOrderAmount
FROM Sales.SalesOrderHeader;

-----2. LEAD()
-----Returns value from next row.

SELECT SalesOrderID, OrderDate, TotalDue, LEAD(TotalDue) OVER
(ORDER BY OrderDate) AS NextOrderAmount
FROM Sales.SalesOrderHeader;

-----3. FIRST_VALUE()
-----Returns first value in partition/window.

SELECT CustomerID, SalesOrderID, OrderDate, TotalDue, FIRST_VALUE(TotalDue) OVER
(PARTITION BY CustomerID
ORDER BY OrderDate) AS FirstOrderAmount
FROM Sales.SalesOrderHeader;

-----4. LAST_VALUE()
-----Returns last value in partition.

SELECT CustomerID, SalesOrderID, OrderDate, TotalDue, LAST_VALUE(TotalDue) OVER
(PARTITION BY CustomerID
ORDER BY OrderDate
ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
) AS LastOrderAmount
FROM Sales.SalesOrderHeader;
