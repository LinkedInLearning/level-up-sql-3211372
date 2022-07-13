-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT COUNT(Loans.LoanID) AS loancount, Patrons.FirstName, Patrons.Email
FROM Loans
JOIN Patrons ON Loans.PatronID=Patrons.PatronID
GROUP BY Loans.PatronID
ORDER BY loancount ASC
LIMIT 15;