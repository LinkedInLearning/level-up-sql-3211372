-- Create reports that will be used to make three menus.

-- Create a report with all the items sorted by price (lowest to highest).
-- Create a report showing appetizers and beverages.
-- Create a report with all items except beverages.

SELECT Type, Name, Price, Description 
FROM Dishes 
ORDER BY Price;

SELECT Type, Name, Price, Description 
FROM Dishes 
WHERE Type = 'Appetizer' OR Type = 'Beverage' 
ORDER BY Type;

SELECT Type, Name, Price, Description 
FROM Dishes 
WHERE Type != 'Beverage'
ORDER BY Type;