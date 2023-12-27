-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

-- Find his customer ID, 
-- locate the date, get Reservation ID
-- remove the for where Reserveration ID = blahblahblah

SELECT
  LastName,
  FirstName,
  CustomerID
FROM
  Customers
WHERE
  LastName = 'Norby'
  OR
  FirstName = 'Norby';

SELECT
  ReservationID,
  Date(Date) as Day

FROM
  Reservations
WHERE
  CustomerID = 64
  AND
  Day > '2022-07-24';

SELECT 
  *
FROM  
  Reservations r
INNER JOIN
  Customers c 
ON
  c.CustomerID = r.CustomerID
WHERE
  (c.LastName = 'Norby'
  OR
  c.FirstName = 'Norby')
AND
  r.Date > '2022-07-22';

DELETE
FROM 
  Reservations
WHERE
  ReservationID = 2000;