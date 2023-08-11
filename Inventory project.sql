-- Table: Procurement
CREATE TABLE Procurement (
    OrderID INT PRIMARY KEY,
    ProductID VARCHAR(10),
    Quantity INT,
    Cost DECIMAL(10, 2),
    OrderDate DATE
);

-- Insert sample data into Procurement table
INSERT INTO Procurement (OrderID, ProductID, Quantity, Cost, OrderDate)
VALUES
    (1, 'P001', 100, 500.00, '2023-01-10'),
    (2, 'P002', 150, 800.00, '2023-02-05'),
    (3, 'P001', 50, 250.00, '2023-03-20');

-- Table: Inventory
CREATE TABLE Inventory (
    ProductID VARCHAR(10) PRIMARY KEY,
    QuantityInStock INT
);

-- Insert sample data into Inventory table
INSERT INTO Inventory (ProductID, QuantityInStock)
VALUES
    ('P001', 200),
    ('P002', 100),
    ('P003', 300);

SELECT p.ProductID, SUM(p.Quantity) AS TotalProcured, i.QuantityInStock
FROM Procurement p
JOIN Inventory i ON p.ProductID = i.ProductID
GROUP BY p.ProductID, i.QuantityInStock
HAVING TotalProcured < 100; -- Example threshold
