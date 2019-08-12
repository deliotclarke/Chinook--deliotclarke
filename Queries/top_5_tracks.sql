-- top_5_tracks.sql: Provide a query that shows the top 5 most purchased songs.

SELECT TOP 5 t.Name, COUNT(il.InvoiceLineId) as TimesPurchased FROM Track t
    JOIN InvoiceLine il on il.TrackId = t.TrackId
    JOIN Invoice i on i.InvoiceId = il.InvoiceId
    GROUP BY t.Name
    ORDER BY TimesPurchased DESC;