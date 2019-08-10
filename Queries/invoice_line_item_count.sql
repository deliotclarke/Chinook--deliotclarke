--invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.

SELECT i.InvoiceId, COUNT(il.InvoiceLineId) as InvoiceLineCount FROM Invoice i
    JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
    GROUP BY i.InvoiceId;