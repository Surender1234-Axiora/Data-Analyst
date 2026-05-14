select * from Sales.SalesOrderHeader;
select * from Sales.SalesOrderDetail;
select * from Production.Product;
select * from Sales.Customer;

-----Non-Correlated Subquery
-----A subquery that runs independently from the main query.
-----Example: Products Costlier Than Average Price

SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice >
(SELECT AVG(ListPrice) FROM Production.Product);


-------Correlated Subquery
------A subquery that depends on the outer query row-by-row.
------Example: Customers with Orders Greater Than Their Average Order

SELECT SOH.CustomerID, SOH.SalesOrderID, SOH.TotalDue
FROM Sales.SalesOrderHeader SOH
WHERE SOH.TotalDue >
(SELECT AVG(SOH2.TotalDue) FROM Sales.SalesOrderHeader SOH2
WHERE SOH.CustomerID = SOH2.CustomerID);


----IN Operator
----Checks multiple values returned from subquery.
----Example: Customers Who Placed Orders

SELECT CustomerID FROM Sales.Customer
WHERE CustomerID IN
(SELECT CustomerID FROM Sales.SalesOrderHeader);

-----IN Example with Products
-----Products Ordered More Than Once

SELECT Name FROM Production.Product
WHERE ProductID IN
(SELECT ProductID FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING COUNT(*) > 1);


------EXISTS Operator
------Checks whether subquery returns rows.
-----Example: Customers Having Orders

SELECT CustomerID FROM Sales.Customer C
WHERE EXISTS
(SELECT 1 FROM Sales.SalesOrderHeader SOH
WHERE C.CustomerID = SOH.CustomerID);

