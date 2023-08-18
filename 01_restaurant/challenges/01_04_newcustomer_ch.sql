-- Add a customer to the restaurant's loyalty program.

-- Use the following information to create a record:
-- Anna Smith (asmith@samoca.org)
-- 479 Lapis Dr., Memphis, TN
-- Phone: (555) 555-1212; Birthday: July 21, 1973

Insert into Customers(Firstname, lastname, email,address, city,state,phone, Birthday) values ("Anna","Smith","asmith@samoca.org","479 Lapis Dr.","Memphis","TN","555-555-1212","1973-07-21" );

select * from customers order by CustomerID DESC