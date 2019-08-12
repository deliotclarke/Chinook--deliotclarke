-- top_2013_track.sql: Provide a query that shows the most purchased track of 2013.

SELECT t.name as trackname, SUM(il.quantity) as tracksales
    FROM track t
    JOIN InvoiceLine il on t.trackid = il.trackid
    JOIN invoice i ON il.invoiceid = i.invoiceid
    WHERE YEAR(i.invoicedate) = 2013
    GROUP BY t.name
    ORDER BY sum(il.quanity);

