Select * from Sales.SalesOrderHeader
Select * from Sales.SalesOrderDetail
Select * from Production.Product	
Select * from Sales.Customer	
Select * from Person.Person	Customer 
Select * from Sales.SalesTerritory

CREATE SCHEMA retail_analytics;

CREATE OR REPLACE TABLE retail_analytics.sales_header AS
SELECT *
FROM AdventureWorks.Sales.SalesOrderHeader;

SELECT 
    ROUND(SUM(TotalDue), 2) AS TotalRevenue
FROM retail_analytics.sales_header;

SELECT 
    COUNT(*) AS TotalOrders
FROM retail_analytics.sales_header;

SELECT 
    ROUND(AVG(TotalDue), 2) AS AvgOrderValue
FROM retail_analytics.sales_header;

SELECT 
    EXTRACT(YEAR FROM OrderDate) AS SalesYear,
    EXTRACT(MONTH FROM OrderDate) AS SalesMonth,

    ROUND(SUM(TotalDue), 2) AS TotalSales

FROM retail_analytics.sales_header

GROUP BY 
    SalesYear,
    SalesMonth

ORDER BY 
    SalesYear,
    SalesMonth;

-------Monthly Sales Trend

SELECT 
    EXTRACT(YEAR FROM OrderDate) AS SalesYear,
    EXTRACT(MONTH FROM OrderDate) AS SalesMonth,

    ROUND(SUM(TotalDue), 2) AS TotalSales

FROM retail_analytics.sales_header

GROUP BY 
    SalesYear,
    SalesMonth

ORDER BY 
    SalesYear,
    SalesMonth;

---------Running Total Analysis
SELECT 
    OrderDate,
    TotalDue,

    SUM(TotalDue) OVER
    (
        ORDER BY OrderDate
    ) AS RunningSales

FROM retail_analytics.sales_header;

------Customer Analytics
SELECT 
    CustomerID,

    ROUND(SUM(TotalDue), 2) AS TotalSpent

FROM retail_analytics.sales_header

GROUP BY CustomerID

ORDER BY TotalSpent DESC
LIMIT 10;

---------Customer Ranking

SELECT 
    CustomerID,

    ROUND(SUM(TotalDue), 2) AS Revenue,

    DENSE_RANK() OVER
    (
        ORDER BY SUM(TotalDue) DESC
    ) AS CustomerRank

FROM retail_analytics.sales_header

GROUP BY CustomerID;

