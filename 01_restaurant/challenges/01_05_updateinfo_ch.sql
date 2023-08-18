-- Update a customer's contact information.

-- Taylor Jenkins, of 27170 6th Ave., Washington, DC,
-- has moved to 74 Pine St., New York, NY.

Update customers set address = '74 Pine St.', city = 'New York', State = 'NY' 
where firstname = 'Taylor' and lastname = 'Jenkins'

select * from customers where FirstName = 'Taylor' and lastname = 'Jenkins'