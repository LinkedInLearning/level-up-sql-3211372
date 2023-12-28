-- Prepare a report of books due to be returned
-- to the library on July 13, 2022.
-- Provide the due date, the book title, and
-- the borrower's first name and email address.

-- --------------** Did this integrated solution in one fell swoop this time ----------------
SELECT
 l.LoanID,
 l.LoanDate,
 l.DueDate,
 l.ReturnedDate,
 b.Title,
 p.FirstName||' '||p.LastName as [Patron Name],
 p.Email
FROM
  Loans l
INNER JOIN
  Books b
ON
  l.BookID = b.BookID
INNER JOIN
  Patrons p
ON
  l.PatronID = p.PatronID
WHERE
  DueDate < '2022-07-13'  -- I changed the operator to '<' from '=' to see ALL overdue books. 
  AND ReturnedDate IS NULL;