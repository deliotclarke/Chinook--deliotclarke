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


SELECT MAX(TotalSalesTable.EmployeeId) as EmployeeId, MAX(TotalSales) as TopSales2009 FROM (SELECT e.EmployeeId, SUM(i.Total) as TotalSales FROM Employee e
            JOIN Customer c ON c.SupportRepId = e.EmployeeId
            JOIN Invoice i ON i.CustomerId = c.CustomerId
            WHERE e.Title = 'Sales Support Agent' AND i.InvoiceDate LIKE '%2009%'
            GROUP BY e.EmployeeId) as TotalSalesTable;

SELECT TOP 1 TotalSalesTable.EmployeeId, TotalSalesTable.FirstName, TotalSalesTable.LastName, MAX(TotalSales) as TopSales2009 FROM (SELECT e.EmployeeId, e.FirstName, e.LastName, SUM(i.Total) as TotalSales FROM Employee e
            JOIN Customer c ON c.SupportRepId = e.EmployeeId
            JOIN Invoice i ON i.CustomerId = c.CustomerId
            WHERE e.Title = 'Sales Support Agent'
            GROUP BY e.EmployeeId, e.FirstName, e.LastName) as TotalSalesTable
        GROUP BY TotalSalesTable.EmployeeId, TotalSalesTable.FirstName, TotalSalesTable.LastName;

SELECT e.EmployeeId, e.FirstName, e.LastName, COUNT(e.EmployeeId) as CustomerCount FROM Employee e
    JOIN Customer c ON c.SupportRepId = e.EmployeeId
    WHERE e.Title = 'Sales Support Agent'
    GROUP BY e.EmployeeId, e.FirstName, e.LastName;

SELECT BillingCountry, SUM(Total) FROM Invoice
    GROUP BY BillingCountry;

SELECT MAX(CountrySales.CountryName), MAX(TotalSales) FROM 
    (SELECT BillingCountry as CountryName, SUM(Total) as TotalSales FROM Invoice
        GROUP BY BillingCountry) as CountrySales;

SELECT TrackId, COUNT(TrackId) as PurchaseCount FROM InvoiceLine
    GROUP BY TrackId
    ORDER BY COUNT(TrackId) DESC;

SELECT COUNT(il.TrackId), il.TrackId FROM Invoice i
    JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
    WHERE i.InvoiceDate LIKE '%2013%'
    GROUP BY il.TrackId;

SELECT TOP 5 t.Name, COUNT(il.InvoiceLineId) as TimesPurchased FROM Track t
    JOIN InvoiceLine il on il.TrackId = t.TrackId
    JOIN Invoice i on i.InvoiceId = il.InvoiceId
    GROUP BY t.Name
    ORDER BY TimesPurchased DESC;

SELECT DISTINCT a.[Name], SUM(il.UnitPrice) as TotalSales FROM Artist a
    JOIN Album al ON a.ArtistId = a.ArtistId
    JOIN Track t ON t.AlbumId = al.AlbumId
    JOIN InvoiceLine il on il.TrackId = t.TrackId
    JOIN Invoice i on i.InvoiceId = il.InvoiceId
    GROUP BY a.Name, il.UnitPrice;