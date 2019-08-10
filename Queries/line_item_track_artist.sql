-- line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.

-- ooops! already did it.

SELECT il.InvoiceLineId, il.InvoiceId, t.[Name], t.Composer FROM InvoiceLine il 
    JOIN Track t ON t.TrackId = il.TrackId
    ORDER BY il.InvoiceLineId;