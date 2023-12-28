-- Create a reservation for a customer who may or may not
-- already be listed in our Customers table.

-- Use the following information:
-- Sam McAdams (smac@kinetecoinc.com), for 5 people
-- on August 12, 2022 at 6PM (18:00)


/*
Holy fuck stick. I tried over and over to get this going in one statement, but could never get it to work.
The instructor did it in 3 separate statements, which was SO MUCH EASIER!! I could have done that.

Here:
*/

SELECT 
  CustomerID
FROM
  Customers
WHERE
  Email = 'smac@kinetecoinc.com';
/* no answer, because it doesn't exist yet. 
So add him to Customers */

INSERT INTO
  Customers (FirstName, LastName, Email)
  VALUES ('Sam', 'McAdams', 'smac@kinetecoinc.com');

SELECT *
FROM Customers
ORDER BY CustomerID Desc 
LIMIT 5;
/* Now customer exists. ID 102...
So add his reservation */

INSERT INTO 
  Reservations (CustomerID, Date, PartySize)
VALUES (102, '2022-08-12 18:00:00',5);

SELECT *
FROM 
  Reservations
ORDER BY
  ReservationID DESC LIMIT 5;

-- -----------------------------

INSERT INTO
  Customers (FirstName, LastName, Email)
  Values ('Sam', 'McAdams', 'smac@kinetecoinc.com')
-- test for not existing: 
WHERE NOT EXISTS (
    SELECT 1
    FROM
        Customers
    WHERE
        Email = 'smac@kinetecoinc.com'
)
INSERT INTO 
  Reservations (CustomerID, Date, PartySize)
  VALUES(
  (SELECT
    c.CustomerID
  FROM
    Customers c
   WHERE
    c.Email = 'smac@kinetecoinc.com'), '2022-08-12 18:00:00',5);

SELECT * FROM Customers ORDER BY CustomerID DESC LIMIT 10;

SELECT * From Reservations ORDER BY Date Desc Limit 10;



-- -------------------------------
IF EXISTS
  (SELECT 1
  FROM
    Customers c
  INNER JOIN
    Reservations r 
  ON
    c.CustomerID = r.CustomerID
  WHERE
    c.Email = 'smac@kinetecoinc.com');


-- ---------------------------------------------------


IF EXISTS
  (SELECT
    c.CustomerID
  FROM
    Customers c
  INNER JOIN
    Reservations r 
  ON
    c.CustomerID = r.CustomerID
  WHERE
    c.Email = 'smac@kinetecoinc.com')
BEGIN
-- if customer already exists, add them to the reservations
  INSERT INTO
    Reservations (CustomerID, Date, PartySize)
    VALUES (c.CustomerID, '2022-08-12 18:00:00',5)
END
ELSE
-- If customer does not exist, create customer, then add reservation
  INSERT INTO
  Customers (FirstName, LastName, Email)
  VALUES ('Sam','McAdams','smac@kinetecoinc.com')
-- now add reservation for new customer
  BEGIN
    INSERT INTO
      Reservations (CustomerID, Date, PartySize)

      VALUES(
      (SELECT
        c.CustomerID
      FROM
        Customers c
      INNER JOIN
        Reservations r 
      ON
        c.CustomerID = r.CustomerID
      WHERE
        c.Email = 'smac@kinetecoinc.com'),
        '2022-08-12 18:00:00',5)
  END;

SELECT * FROM Customers ORDER BY CustomerID DESC LIMIT 10;

SELECT * From Reservations ORDER BY Date Desc Limit 10;


      (SELECT 
        c.CustomerID
      FROM 
        Customers c 
      WHERE
        c.Email = 'smac@kinetecoinc.com')


INSERT INTO
  Reservations (CustomerID, Date, PartySize)

VALUES(
(SELECT
  c.CustomerID
FROM
  Customers c
INNER JOIN
  Reservations r 
ON
  c.CustomerID = r.CustomerID
WHERE
  c.Email = 'smac@kinetecoinc.com'),
  '2022-08-12 18:00:00',5);

Select * FROM Reservations ORDER BY Date DESC;