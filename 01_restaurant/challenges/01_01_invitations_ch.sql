-- Generate a list of customer information.

-- Show their first name, last name, and email address.
-- Sort the list of results by last name.

select FirstName, LastName,Email
from customers
order by LastName ASC