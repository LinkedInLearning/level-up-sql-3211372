-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

SELECT *
FROM Customers
WHERE FirstName = 'Norby' OR LastName = 'Norby';

SELECT *
FROM Reservations
WHERE CustomerID = 64 AND Reservations.Date > '2022-07-24';

DELETE FROM Reservations WHERE ReservationID = 2000;

-- or:
SELECT * FROM Reservations
JOIN Customers ON Reservations.CustomerID = Customers.CustomerID
WHERE (FirstName = 'Norby' OR LastName = 'Norby')
AND Reservations.Date > '2022-07-24';