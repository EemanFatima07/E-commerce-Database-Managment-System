CREATE TABLE category(
CategoryID NUMBER PRIMARY KEY,
CategoryName VARCHAR(25),
Description VARCHAR(50));

CREATE TABLE supplier(
SupplierID NUMBER PRIMARY KEY,
SupplierName VARCHAR(25) NOT NULL,
Email VARCHAR(25) NOT NULL,
Password VARCHAR(25) NOT NULL,
Phone VARCHAR(12),
Street VARCHAR(25) NOT NULL,
City VARCHAR(25) NOT NULL,
Province VARCHAR(25) NOT NULL,
PostalCode VARCHAR(10) NOT NULL,
CardNumber NUMBER NOT NULL,
CardName VARCHAR(25) NOT NULL,
CardExp NUMBER NOT NULL,
CardCVV NUMBER NOT NULL);

CREATE TABLE product(
ProductID NUMBER PRIMARY KEY,
CategoryID NUMBER REFERENCES Category(CategoryID),
SupplierID NUMBER REFERENCES Supplier(SupplierID),
ProductName VARCHAR(25) NOT NULL,
Price NUMBER NOT NULL,
SKU NUMBER NOT NULL,
Description VARCHAR(50),
Dimensions VARCHAR(25),
Color VARCHAR(25));

CREATE TABLE customer(
CustomerID NUMBER PRIMARY KEY,
FirstName VARCHAR(25) NOT NULL,
LastName VARCHAR(25) NOT NULL,
Email VARCHAR(25) NOT NULL,
Password VARCHAR(25) NOT NULL,
Phone VARCHAR(12),
Street VARCHAR(25) NOT NULL,
City VARCHAR(25) NOT NULL,
Province VARCHAR(25) NOT NULL,
PostalCode VARCHAR(10) NOT NULL,
CardNumber NUMBER NOT NULL,
CardName VARCHAR(25) NOT NULL,
CardExp NUMBER NOT NULL,
CardCVV NUMBER NOT NULL);


CREATE TABLE shipper(
ShipperID NUMBER PRIMARY KEY,
ShipperName VARCHAR(25) NOT NULL,
Description VARCHAR(50));

CREATE TABLE customer_order(
CustomerID NUMBER REFERENCES Customer(CustomerID),
OrderID NUMBER,
ProductID NUMBER REFERENCES Product(ProductID),
ShipperID NUMBER REFERENCES Shipper(ShipperID),
OrderDate DATE NOT NULL,
ShipDate DATE NOT NULL,
Status VARCHAR(25) DEFAULT 'Pending',
PRIMARY KEY(CustomerID, OrderID));

CREATE TABLE order_details(
CustomerID NUMBER,
OrderID NUMBER,
OrderDetailsID NUMBER,
Quantity NUMBER,
UnitPrice NUMBER,
TotalPrice NUMBER,
PRIMARY KEY(CustomerID, OrderID, OrderDetailsID),
FOREIGN KEY (CustomerID, OrderID) REFERENCES Customer_Order(CustomerID, OrderID));

CREATE TABLE order_transaction(
CustomerID NUMBER,
OrderID NUMBER,
TransactionID NUMBER,
PaymentMethod VARCHAR(25) NOT NULL,
AmountPaid NUMBER DEFAULT 0,
AmountDue NUMBER NOT NULL,
TransactionDate DATE,
TransactionStatus VARCHAR(25) DEFAULT 'Pending',
PRIMARY KEY(CustomerID, OrderID, TransactionID),
FOREIGN KEY (CustomerID, OrderID) REFERENCES Customer_Order(CustomerID, OrderID));


INSERT INTO category(CategoryID, CategoryName, Description) VALUES (1, 'Electronics', 'Laptops, phones, tablets, and more');
INSERT INTO category(CategoryID, CategoryName, Description) VALUES (2, 'Furniture', 'sofas, tables, chairs, and more');

INSERT INTO supplier(SupplierID, SupplierName, Email, Password, Phone, Street, City, Province, PostalCode, CardNumber, CardName, CardExp, CardCVV) VALUES (1, 'Lenovo', 'lenovo@email.com', '1234', '123-456-7891', 'ABC Street', 'Toronto', 'Ontario', 'LU4 8F5', 123456789, 'Lenovo Business', 0225, 513);
INSERT INTO supplier(SupplierID, SupplierName, Email, Password, Phone, Street, City, Province, PostalCode, CardNumber, CardName, CardExp, CardCVV) VALUES (2, 'IKEA', 'ikea@email.com', 'securePassword', '123-456-7890', '456 Furniture Rd', 'Toronto', 'Ontario', 'M5B 2K3', 123456789, 'IKEA Canada', 1234, 789);
INSERT INTO product(ProductID, CategoryID, SupplierID, ProductName, Price, SKU, Description, Dimensions, Color) VALUES (1, 1, 1, 'Lenovo Ideapad 5', 1000, 498, 'High-performance laptop', '15x10x1 inches', 'Silver');
INSERT INTO product(ProductID, CategoryID, SupplierID, ProductName, Price, SKU, Description, Dimensions, Color) VALUES (2, 2, 2, 'Modern Sofa', 750, 301, 'Comfortable and stylish sofa for living rooms', '85x35x30 inches', 'Gray');


INSERT INTO customer(CustomerID, FirstName, LastName, Email, Password, Phone, Street, City, Province, PostalCode, CardNumber, CardName, CardExp, CardCVV) VALUES (1, 'John', 'Doe', 'john.doe@example.com', 'password123', '1234567890', '123 Main St', 'Toronto', 'Ontario', 'M1A1A1', 1234567890123456, 'John Doe', 1225, 123); 
INSERT INTO customer(CustomerID, FirstName, LastName, Email, Password, Phone, Street, City, Province, PostalCode, CardNumber, CardName, CardExp, CardCVV) VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', 'securePassword456', '0987654321', '456 Elm St', 'Vancouver', 'British Columbia', 'V5K0A1', 6543210987654321, 'Jane Smith', 1226, 456);
INSERT INTO shipper(ShipperID, ShipperName, Description) VALUES (1, 'Fedex', 'Fast shipping services');
INSERT INTO shipper(ShipperID, ShipperName, Description) VALUES (2, 'UPS', 'Reliable package delivery services');


INSERT INTO customer_order(CustomerID, OrderID, ProductID, ShipperID, OrderDate, ShipDate, Status) VALUES (1, 1, 1, 2, TO_DATE('2024-09-23', 'YYYY-MM-DD'), TO_DATE('2024-09-25', 'YYYY-MM-DD'), 'Pending');
INSERT INTO customer_order(CustomerID, OrderID, ProductID, ShipperID, OrderDate, ShipDate, Status) VALUES (2, 2, 2, 2, TO_DATE('2024-09-28', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'), 'Shipped');

INSERT INTO order_details (CustomerID, OrderID, OrderDetailsID, Quantity, UnitPrice, TotalPrice) VALUES (1, 1, 1, 2, 1000, 2000);
INSERT INTO order_details (CustomerID, OrderID, OrderDetailsID, Quantity, UnitPrice, TotalPrice) VALUES (2, 2, 2, 2, 750, 1000);
INSERT INTO order_transaction (CustomerID, OrderID, TransactionID, PaymentMethod, AmountPaid, AmountDue, TransactionDate, TransactionStatus) VALUES (1, 1, 1, 'Credit Card', 0, 2000, TO_DATE('2024-09-23', 'YYYY-MM-DD'), 'Pending');
INSERT INTO order_transaction (CustomerID, OrderID, TransactionID, PaymentMethod, AmountPaid, AmountDue, TransactionDate, TransactionStatus) VALUES (2, 2, 2, 'PayPal', 1500, 0, TO_DATE('2024-09-28', 'YYYY-MM-DD'), 'Completed');


