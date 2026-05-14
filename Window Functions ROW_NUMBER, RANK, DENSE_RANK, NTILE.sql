select * from Sales.SalesOrderHeader;

-----1. ROW_NUMBER()
-----Assigns unique sequential numbers.
----Even duplicate values get different numbers.

SELECT SalesOrderID, CustomerID, TotalDue,
ROW_NUMBER() OVER
(ORDER BY TotalDue DESC) AS RowNum
FROM Sales.SalesOrderHeader;

---2. RANK()
---Rank Customers by Sales

SELECT SalesOrderID, CustomerID, TotalDue,
RANK() OVER
(ORDER BY TotalDue DESC) AS RankNum
FROM Sales.SalesOrderHeader;


------3. DENSE_RANK()
------Same as RANK(), but does NOT skip numbers.

SELECT SalesOrderID, CustomerID, TotalDue,
DENSE_RANK() OVER
(ORDER BY TotalDue DESC) AS DenseRankNum
FROM Sales.SalesOrderHeader;


------4. NTILE()
-----Divides rows into groups/buckets.

SELECT SalesOrderID, CustomerID, TotalDue,
NTILE(4) OVER
(ORDER BY TotalDue DESC) AS Quartile
FROM Sales.SalesOrderHeader;


------PARTITION BY
-------Resets numbering within groups.

SELECT CustomerID, SalesOrderID, TotalDue, ROW_NUMBER() OVER
(PARTITION BY CustomerID
ORDER BY TotalDue DESC) AS RowNum
FROM Sales.SalesOrderHeader;

--------Compare All Window Functions

SELECT SalesOrderID, CustomerID, TotalDue,
ROW_NUMBER() OVER(ORDER BY TotalDue DESC) AS RowNum,
RANK() OVER(ORDER BY TotalDue DESC) AS RankNum,
DENSE_RANK() OVER(ORDER BY TotalDue DESC) AS DenseRankNum,
NTILE(4) OVER(ORDER BY TotalDue DESC) AS Quartile
FROM Sales.SalesOrderHeader;