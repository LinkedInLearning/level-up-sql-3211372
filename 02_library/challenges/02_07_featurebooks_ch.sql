-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899 
-- which are not currently checked out.

SELECT
  BookID,
  Title,
  Author,
  Published
FROM
  Books
WHERE
  Published BETWEEN 1890 AND 1899
ORDER BY 
  Title ASC
-- --------------------------
SELECT BookID FROM Books WHERE Published BETWEEN 1890 AND 1899  
-- --------------------------
SELECT
  l.BookID,
  b.Title,
  b.Author,
  b.Published
FROM
  Loans l 
INNER JOIN
  Books b
ON
  l.BookID = b.BookID
WHERE
  l.BookID in (SELECT BookID FROM Books WHERE Published BETWEEN 1890 AND 1899) AND
  l.ReturnedDate NOT NULL
GROUP BY
  Title
ORDER BY
  Title ASC;