-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424

-- ---------------First is the dead simple look-up code ----
SELECT 
  l.LoanID,
  b.Title,
  MAX(l.LoanDate),
  l.DueDate,
  l.ReturnedDate
FROM Loans l 
INNER JOIN Books b
ON l.BookID = b.BookID
WHERE
  b.Barcode = 6435968624
  OR b.Barcode = 5677520613
  OR b.Barcode = 8730298424
GROUP BY
  l.BookID
;
-- ------------------ 1-liner code for integration ------------
-- this is the over-engineered part:
SELECT l.LoanID FROM Loans l INNER JOIN Books b ON l.BookID = b.BookID WHERE b.Barcode = 6435968624 GROUP BY l.BookID

-- --------------------** my integrated code ------------------------
-- ------------------ I initially over-engineered it. I just needed to find the "is null" returned dates
UPDATE
  Loans
SET 
  ReturnedDate = '2022-07-05'
FROM
  Loans l
WHERE
  ((SELECT BookID FROM Books WHERE Barcode = 6435968624) AND l.ReturnedDate IS NULL)
  OR ((SELECT BookID FROM Books WHERE Barcode = 5677520613) AND l.ReturnedDate IS NULL)
  OR ((SELECT BookID FROM Books WHERE Barcode = 8730298424) AND l.ReturnedDate IS NULL)
;

