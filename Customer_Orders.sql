-- Create Tables

CREATE TABLE Customers
(
CustID INT PRIMARY KEY,
CustName VARCHAR(30),
Address VARCHAR(50),
State VARCHAR(20)
);


CREATE TABLE Items
(
ItemID INT PRIMARY KEY,
ItemName VARCHAR(30),
Category VARCHAR(30),
Price INT,
Instock INT
);


CREATE TABLE Orders
(
OrderID INT PRIMARY KEY,
CustID INT,
ItemID INT,
Quantity INT,
OrderDate DATE,

FOREIGN KEY (CustID) REFERENCES Customers(CustID),
FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);


CREATE TABLE Delivery
(
DeliveryID INT PRIMARY KEY,
CustID INT,
OrderID INT,

FOREIGN KEY (CustID) REFERENCES Customers(CustID),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);



-- Insert Values

INSERT INTO Customers VALUES (1,'Arun','Kochi','Kerala');
INSERT INTO Customers VALUES (2,'Meera','TVM','Kerala');
INSERT INTO Customers VALUES (3,'Rahul','Chennai','TamilNadu');
INSERT INTO Customers VALUES (4,'Anu','Bangalore','Karnataka');
INSERT INTO Customers VALUES (5,'Ravi','Kochi','Kerala');


INSERT INTO Items VALUES (1,'Pen','Stationery',10,100);
INSERT INTO Items VALUES (2,'Book','Stationery',50,60);
INSERT INTO Items VALUES (3,'Mouse','Electronics',500,20);
INSERT INTO Items VALUES (4,'Keyboard','Electronics',700,15);
INSERT INTO Items VALUES (5,'Bag','Accessories',800,10);


INSERT INTO Orders VALUES (1,1,1,5,'2024-01-10');
INSERT INTO Orders VALUES (2,1,2,3,'2024-01-11');
INSERT INTO Orders VALUES (3,1,3,1,'2024-01-12');
INSERT INTO Orders VALUES (4,1,4,2,'2024-01-13');
INSERT INTO Orders VALUES (5,1,5,1,'2024-01-14');
INSERT INTO Orders VALUES (6,1,2,4,'2024-01-15');
INSERT INTO Orders VALUES (7,2,3,2,'2024-01-16');
INSERT INTO Orders VALUES (8,3,1,6,'2024-01-17');


INSERT INTO Delivery VALUES (1,1,1);
INSERT INTO Delivery VALUES (2,2,7);
INSERT INTO Delivery VALUES (3,3,8);



--------------------------------------------------
-- QUESTION 5.2
--------------------------------------------------

-- Customers Grouped by State

SELECT State,COUNT(*)
FROM Customers
GROUP BY State;



-- Items Grouped by Category with Price > Average Price

SELECT Category,AVG(Price)
FROM Items
WHERE Price >
(
SELECT AVG(Price) FROM Items
)
GROUP BY Category;



-- Customers Having More Than 5 Orders

SELECT CustName
FROM Customers,Orders
WHERE Customers.CustID=Orders.CustID
GROUP BY CustName
HAVING COUNT(OrderID)>5;



--------------------------------------------------
-- QUESTION 6
--------------------------------------------------

-- Customers Who Placed Orders

SELECT DISTINCT Customers.*
FROM Customers,Orders
WHERE Customers.CustID=Orders.CustID;



-- Customers Whose Orders Delivered

SELECT DISTINCT Customers.*
FROM Customers,Delivery
WHERE Customers.CustID=Delivery.CustID;



-- Order Date for All Customers

SELECT CustName,OrderDate
FROM Customers,Orders
WHERE Customers.CustID=Orders.CustID;
