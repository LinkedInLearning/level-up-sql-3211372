-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.

SELECT
  r.ReservationID,
  c.FirstName||' '||c.LastName as [Reservation Name],
  r.PartySize,
  r.Date

FROM
  Reservations r 
INNER JOIN
  Customers c
ON
  r.CustomerID = c.CustomerID

WHERE
  c.LastName LIKE 'St%'
AND
  r.Date LIKE '%06-14%'
;