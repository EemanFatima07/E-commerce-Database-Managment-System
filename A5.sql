SELECT SupplierID, SupplierName, Email
FROM supplier s
WHERE NOT EXISTS (
    SELECT 1
    FROM product p
    WHERE p.SupplierID = s.SupplierID
);

SELECT c.CategoryName, 
       AVG(p.Price) AS AveragePrice, 
       MIN(p.Price) AS MinimumPrice, 
       MAX(p.Price) AS MaximumPrice
FROM product p
JOIN category c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

SELECT c.CustomerID, c.FirstName, c.LastName, AVG(od.TotalPrice) AS AverageOrderValue
FROM customer c
JOIN customer_order co ON c.CustomerID = co.CustomerID
JOIN order_details od ON co.CustomerID = od.CustomerID AND co.OrderID = od.OrderID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING AVG(od.TotalPrice) > 0;

SELECT CustomerID, FirstName, LastName, Email
FROM customer
MINUS
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email
FROM customer c
JOIN customer_order co ON c.CustomerID = co.CustomerID;

SELECT Province, 'Customer' AS Type, COUNT(*) AS Count
FROM customer
GROUP BY Province
UNION
SELECT Province, 'Supplier' AS Type, COUNT(*) AS Count
FROM supplier
GROUP BY Province;
