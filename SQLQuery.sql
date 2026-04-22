Use AxioraGlobal

Select * from Employee;
Select * from Sales;

Drop Table Sales;
Drop Table Employee;

CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    SaleDate DATE,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Category VARCHAR(50),
    Region VARCHAR(50),
    Units INT,
    UnitPrice DECIMAL(10,2),
    TotalAmount AS (Units * UnitPrice)
);

INSERT INTO Sales (SaleDate, CustomerName, Product, Category, Region, Units, UnitPrice)
VALUES
('2026-04-01', 'Ravi Kumar', 'Laptop', 'Electronics', 'South', 2, 50000),
('2026-04-02', 'Sneha Reddy', 'Mobile', 'Electronics', 'East', 3, 20000),
('2026-04-03', 'Amit Sharma', 'Tablet', 'Electronics', 'North', 1, 30000),
('2026-04-04', 'Priya Singh', 'Headphones', 'Accessories', 'West', 5, 2000),
('2026-04-05', 'Kiran Rao', 'Monitor', 'Electronics', 'South', 2, 15000);

Select * from Sales;

Select CustomerName, Product,Region from Sales;

Select * from Sales 
Where Category = 'Electronics';

Select * from Sales 
Where Category = 'Electronics' and UnitPrice < 60000;

Select Distinct Region from Sales;

Select Distinct Category from Sales;

Select * from Sales	Order by UnitPrice Asc;

Select * from Sales	Order by TotalAmount Desc;

SELECT * FROM Sales
ORDER BY Product
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT * FROM Sales
ORDER BY Product
OFFSET 3 ROWS FETCH NEXT 3 ROWS ONLY;