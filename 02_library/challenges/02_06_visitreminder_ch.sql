-- Prepare a report of the library patrons
-- who have checked out the fewest books.

-- ------------ This time, the dead-simple code did it on the first go -------------
SELECT
  p.FirstName||' ' ||p.LastName as [Patron Name],
  p.Email,
  l.PatronID,
  Count(l.LoanID) as [Number of Loans]
FROM
  Loans l
INNER JOIN
  Patrons p
ON
  p.PatronID = l.PatronID
GROUP BY
  l.PatronID
ORDER BY
  [Number of Loans] ASC
LIMIT
  20;
