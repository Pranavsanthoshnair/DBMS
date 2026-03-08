CREATE TABLE Items(
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(50),
    Category VARCHAR(50),
    Price INT,
    Instock INT
);
SELECT * FROM Items;

CREATE TABLE Customers(
    CustID INT PRIMARY KEY,
    CustName VARCHAR(50),
    Address VARCHAR(100),
    State VARCHAR(50)
);
SELECT * FROM Customers;

CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustID INT,
    ItemID INT,
    Quantity INT,
    OrderDate DATE
);
SELECT * FROM Orders;

CREATE TABLE Delivery(
    DeliveryID INT PRIMARY KEY,
    CustID INT,
    OrderID INT
);
SELECT * FROM Delivery;

INSERT INTO Items VALUES
(1,'Samsung Galaxy S4','Mobile',5200,10),
(2,'iPhone 13','Mobile',7000,5),
(3,'Dell Laptop','Laptop',4500,7),
(4,'HP Laptop','Laptop',4800,6),
(5,'Sony Headphones','Accessories',800,15),
(6,'Logitech Mouse','Accessories',300,20);
SELECT * FROM Items;

INSERT INTO Customers VALUES
(1,'John','Delhi','Delhi'),
(2,'Mickey','Mumbai','Maharashtra'),
(3,'James','Chennai','Tamil Nadu'),
(4,'Arun','Kochi','Kerala'),
(5,'David','Pune','Maharashtra');
SELECT * FROM Customers;

INSERT INTO Orders VALUES
(101,1,1,2,'2013-01-10'),
(102,2,3,1,'2013-02-15'),
(103,2,1,1,'2013-03-20'),
(104,3,2,1,'2012-12-25'),
(105,4,5,3,'2014-01-11'),
(106,2,6,2,'2015-02-05'),
(107,2,4,1,'2016-04-18');
SELECT * FROM Orders;

INSERT INTO Delivery VALUES
(1,1,101),
(2,2,102),
(3,3,104),
(4,4,105);
SELECT * FROM Delivery;

SELECT State,COUNT(*) FROM Customers GROUP BY State;

SELECT Category,AVG(Price)
FROM Items
GROUP BY Category
HAVING AVG(Price)>(SELECT AVG(Price) FROM Items);

SELECT CustName
FROM Customers
WHERE CustID IN
(
    SELECT CustID
    FROM Orders
    GROUP BY CustID
    HAVING COUNT(OrderID)>5
);

SELECT * FROM Customers
WHERE CustID IN
(
    SELECT CustID FROM Orders
);

SELECT * FROM Customers
WHERE CustID IN
(
    SELECT CustID FROM Delivery
);

SELECT OrderDate
FROM Orders
WHERE CustID IN
(
    SELECT CustID FROM Customers WHERE CustName LIKE 'J%'
);

SELECT ItemName,Price
FROM Items
WHERE ItemID IN
(
    SELECT ItemID
    FROM Orders
    WHERE CustID IN
    (
        SELECT CustID FROM Customers WHERE CustName='Mickey'
    )
);

SELECT *
FROM Customers
WHERE CustID IN
(
    SELECT CustID
    FROM Orders
    WHERE OrderDate>'2013-01-01'
)
AND CustID NOT IN
(
    SELECT CustID FROM Delivery
);

SELECT ItemID FROM Orders
UNION
SELECT ItemID FROM Orders
WHERE OrderID NOT IN
(
    SELECT OrderID FROM Delivery
);

SELECT CustName
FROM Customers
WHERE CustID IN
(
    SELECT CustID FROM Orders
)
AND CustID IN
(
    SELECT CustID FROM Delivery
);

SELECT CustName
FROM Customers
WHERE CustID IN
(
    SELECT CustID FROM Orders
)
AND CustID NOT IN
(
    SELECT CustID FROM Delivery
);

SELECT CustName
FROM Customers
WHERE CustID=
(
    SELECT CustID
    FROM Orders
    GROUP BY CustID
    HAVING COUNT(*)=
    (
        SELECT MAX(cnt)
        FROM
        (
            SELECT COUNT(*) cnt FROM Orders GROUP BY CustID
        ) t
    )
);

SELECT *
FROM Customers
WHERE CustID IN
(
    SELECT CustID
    FROM Orders
    WHERE ItemID IN
    (
        SELECT ItemID FROM Items WHERE Price>5000
    )
);

SELECT CustName,Address
FROM Customers
WHERE CustID NOT IN
(
    SELECT CustID
    FROM Orders
    WHERE ItemID IN
    (
        SELECT ItemID FROM Items WHERE ItemName='Samsung Galaxy S4'
    )
);

SELECT *
FROM Customers
LEFT JOIN Orders
ON Customers.CustID=Orders.CustID;

SELECT *
FROM Customers
RIGHT JOIN Orders
ON Customers.CustID=Orders.CustID;

SELECT State,COUNT(*)
FROM Customers
GROUP BY State;

SELECT Category,AVG(Price)
FROM Items
GROUP BY Category
HAVING AVG(Price)>(SELECT AVG(Price) FROM Items);
