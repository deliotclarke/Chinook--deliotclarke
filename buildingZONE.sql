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

SELECT il.InvoiceLineId, il.InvoiceId, t.[Name], t.Composer FROM InvoiceLine il 
    JOIN Track t ON t.TrackId = il.TrackId
    ORDER BY il.InvoiceLineId;

SELECT BillingCountry, COUNT(InvoiceId) FROM Invoice
    GROUP BY BillingCountry;

SELECT * FROM Playlist;

SELECT * FROM PlaylistTrack;

SELECT pl.[Name] as PlaylistName, COUNT(t.TrackId) as TrackCount FROM Playlist pl
    JOIN PlaylistTrack pt ON pt.PlaylistId = pl.PlaylistId
    JOIN Track t ON t.TrackId = pt.TrackId
    GROUP BY pl.[Name];

SELECT t.[Name], a.Title, mt.[Name], g.[Name] FROM Track t
    JOIN Album a ON a.AlbumId = t.AlbumId
    JOIN MediaType mt ON mt.MediaTypeId = t.MediaTypeId
    JOIN Genre g ON g.GenreId = t.GenreId
    ORDER BY t.TrackId;

SELECT InvoiceLineId, COUNT(InvoiceId) as InvoiceCount FROM InvoiceLine
    GROUP BY InvoiceLineId;

SELECT i.InvoiceId, COUNT(il.InvoiceLineId) as InvoiceLineCount FROM Invoice i
    JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
    GROUP BY i.InvoiceId;


