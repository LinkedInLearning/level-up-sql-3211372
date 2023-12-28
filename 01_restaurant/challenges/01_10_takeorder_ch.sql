-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

/*
Find the customer - search in Customers, get ID
Create order record - add CustomerID and Order Date ('2022-09-22 14:00:00') to Orders table
                    - Get Order ID
From the Dishes table - Get Dish IDs
Add items to order - Add OrderID (multiple time) and DishIDs to OrdersDishes
Find total cost  - sum the Prices from the Dishes table
*/

SELECT 
  CustomerID
FROM Customers
WHERE
  FirstName = 'Loretta' 
  AND LastName = 'Hundey';

INSERT INTO 
  Orders (CustomerID, OrderDate)
 VALUES (
  (SELECT 
  CustomerID
FROM Customers
WHERE
  FirstName = 'Loretta' 
  AND LastName = 'Hundey'), '2022-09-22 14:00:00');

SELECT * FROM Orders ORDER BY OrderID DESC;
-- Success! OrderID is 1001

-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
SELECT 
  DishID
FROM
  Dishes
WHERE
  Name = 'House Salad' OR -- 4
  Name = 'Mini Cheeseburgers' OR -- 7 
  Name = 'Tropical Blue Smoothie'; -- 20

INSERT INTO 
  OrdersDishes (OrderID, DishID)
VALUES(1001,4),(1001,7),(1001,20);

-- ------- ** integrated way to combine the above 2 statements --------------
INSERT INTO 
  OrdersDishes (OrderID, DishID)
VALUES
(1001, (SELECT DishID FROM Dishes WHERE Name = 'House Salad')),
(1001, (SELECT DishID FROM Dishes WHERE Name = 'Mini Cheeseburgers')),
(1001, (SELECT DishID FROM Dishes WHERE Name = 'Tropical Blue Smoothie'));

-- -------- ** end integration ----------------------------------------------


SELECT * FROM OrdersDishes ORDER BY OrdersDishesID Desc LIMIT 5;
-- Cool! orders added successfully to order
-- now get the cost

SELECT 
  SUM (d.Price)
FROM
  Dishes d
INNER JOIN 
  OrdersDishes od
ON
  d.DishID = od.DishID
WHERE
  od.OrderID = 1001;

-- total cost is $21.00