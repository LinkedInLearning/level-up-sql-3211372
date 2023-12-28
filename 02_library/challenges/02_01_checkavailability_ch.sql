-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.

SELECT
  BookID
FROM 
  Books
WHERE
  Title = 'Dracula';
-- IDs are 12, 60, 73

-- ---------- ** First trial -----------
SELECT *
FROM 
  Loans
WHERE
  BookID IN (12, 60, 73)
ORDER BY 
  BookID
  ;
-- ------- ** My completed steps ----------
SELECT
  LoanID,
  b.BookID,
  b.Title,
  b.Author,
  PatronID,
  MAX(LoanDate) [Loan Date],
  DueDate,
  ReturnedDate
FROM
  Loans l
INNER JOIN
  Books b
ON
  b.BookID = l.BookID
WHERE
  l.BookID IN (SELECT BookID FROM Books WHERE Title = 'The Scarlet Letter')
GROUP BY 
  l.BookID;



