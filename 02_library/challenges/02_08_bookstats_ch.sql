-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

-- Report 2: Show the five books that have been
-- checked out the most.

-- # of books published in each year:
SELECT
  Count(DISTINCT Title) as [Number of Books],
  Published
FROM
  Books
--WHERE
--  (SELECT DISTINCT Published FROM Books)
GROUP BY
  Published
Order BY
  [Number of Books] DESC;

-- top five most-checked out books
-- This ended up only accounting for individual copies, not multiple copies of same book. See "integrated code" for total answer
SELECT
  Count(l.BookID) as [How Many Times],
  l.BookID,
  b.Title,
  b.Author
FROM
  Loans l
INNER JOIN
  Books b
ON
  l.BookID = b.BookID
GROUP BY
  l.BookID
ORDER BY
  [How Many Times] DESC
LIMIT 5;

-- --- Top 5 checked out books -- My integrated code wh/accounts for multiple copies ---- 
SELECT
  b.Title,
  b.Author,
  COUNT (DISTINCT l.LoanID) AS [Total Checkouts]
FROM
  Loans l 
INNER JOIN
  Books b 
ON
  l.BookID = b.BookID
--WHERE           -- *** I was breaking my head to get this part, but in the end, we did not need it.
--  b.Title IN (Select DISTINCT(Title) FROM Books)
GROUP BY 
  b.Title
ORDER BY
  [Total Checkouts] DESC
LIMIT 5
;

-- Simple code : This gets all the book IDs ---
SELECT
BookID
--Title
FROM
Books
WHERE
Title IN (Select DISTINCT(Title) FROM Books)
ORDER BY
Title