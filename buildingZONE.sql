SELECT c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry FROM Customer c 
JOIN Invoice i ON i.CustomerId = c.CustomerId
WHERE c.Country = 'Brazil';

SELECT DISTINCT BillingCountry FROM Invoice;

SELECT DISTINCT SupportRepId FROM Customer;

SELECT * FROM Employee;

SELECT e.FirstName, e.LastName, c.CustomerId, i.InvoiceId FROM Employee e
    JOIN Customer c ON c.SupportRepId = e.EmployeeId
    JOIN Invoice i ON i.CustomerId = c.CustomerId;

SELECT COUNT(InvoiceId) as InvoiceCount2009 , SUM(Total) as TotalSales FROM Invoice
WHERE InvoiceDate LIKE '%2009%';

SELECT COUNT(InvoiceId) as InvoiceCount2011, SUM(Total) as TotalSales FROM Invoice
    WHERE InvoiceDate LIKE '%2011%';

SELECT COUNT(InvoiceLineId) as InvoiceLineItems FROM InvoiceLine
    WHERE InvoiceId = 37;

SELECT * FROM InvoiceLine;
