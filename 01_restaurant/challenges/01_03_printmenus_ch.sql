-- Create reports that will be used to make three menus.

-- Create a report with all the items sorted by price (lowest to highest).
-- Create a report showing appetizers and beverages.
-- Create a report with all items except beverages.

/*Types: Appetizer, Main, Dessert, Beverage
*/

SELECT
  Name,
  Type,
  Price
FROM
  Dishes
WHERE 
  Type IN ('Appetizer', 'Beverage');
ORDER BY
  Type;