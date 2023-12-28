-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

SELECT
  o.CustomerID,
  c.FirstName||' '||c.LastName as [Customer Name],
  c.Email,
  Count(o.OrderID) AS [Number of Orders]
FROM
  Orders o
INNER JOIN
  Customers c
ON
  o.CustomerID = c.CustomerID
GROUP BY
  o.CustomerID
ORDER BY 
  [Number of Orders] DESC
LIMIT 10;