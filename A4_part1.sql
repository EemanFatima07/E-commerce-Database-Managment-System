SELECT * FROM category 
WHERE Description LIKE '%phones%';

SELECT COUNT(*) AS TotalCustomers FROM customer;

SELECT * FROM customer_order WHERE CustomerID = 1;

SELECT 
    co.CustomerID,
    od.UnitPrice,
    od.TotalPrice
FROM 
    order_details od
JOIN 
    customer_order co ON od.CustomerID = co.CustomerID AND od.OrderID = co.OrderID
WHERE 
    co.CustomerID = 1;  

SELECT 
    TransactionStatus,
    SUM(AmountPaid) AS TotalAmountPaid
FROM 
    order_transaction
GROUP BY 
    TransactionStatus;

SELECT 
    c.CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM 
    category c
LEFT JOIN 
    product p ON c.CategoryID = p.CategoryID
GROUP BY 
    c.CategoryName
ORDER BY 
    ProductCount DESC;

SELECT 
    s.ShipperName AS CompanyName,
    COUNT(co.OrderID) AS OrderCount
FROM 
    shipper s
LEFT JOIN 
    customer_order co ON s.ShipperID = co.ShipperID
GROUP BY 
    s.ShipperName
ORDER BY 
    OrderCount DESC;

SELECT 
    s.SupplierName,
    s.Email,
    COUNT(p.ProductID) AS ProductCount
FROM 
    supplier s
LEFT JOIN 
    product p ON s.SupplierID = p.SupplierID
GROUP BY 
    s.SupplierName, s.Email
ORDER BY 
    ProductCount DESC;

SELECT 
    p.ProductName,
    c.CategoryName
FROM 
    product p
JOIN 
    category c ON p.CategoryID = c.CategoryID
ORDER BY 
    c.CategoryName ASC, 
    p.ProductName ASC;

