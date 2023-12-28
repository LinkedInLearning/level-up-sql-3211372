-- Register a customer for our Anniversary event.

-- The customer 'atapley2j@kinetecoinc.com' will be in
-- attendance, and will bring 3 friends.

INSERT INTO
  AnniversaryParty (CustomerID, Party)
VALUES (
  (SELECT
    c.CustomerID
  FROM
    Customers c
  WHERE
    c.Email = 'atapley2j@kinetecoinc.com'),
    8);
Select * FROM AnniversaryParty;

  