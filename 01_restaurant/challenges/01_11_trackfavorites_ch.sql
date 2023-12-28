-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

-- Experiment:
SELECT
  CustomerID
FROM
  Customers c
WHERE
  c.FistName = Cleo AND
  c.LastName = Goldwater;
-- she is customerID 42


-- My trial:
UPDATE
  Customers
SET
  FavoriteDish = (SELECT DishID FROM Dishes WHERE Name = 'Quinoa Salmon Salad')
WHERE
  CustomerID = (SELECT CustomerID FROM Customers c WHERE c.FirstName = 'Cleo' AND c.LastName = 'Goldwater');

-- confirm:
SELECT * FROM Customers WHERE CustomerID = 42;