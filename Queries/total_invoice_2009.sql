-- total_invoices_{2009}.sql: How many Invoices were there in 2009 and 2011?

SELECT COUNT(InvoiceId) as InvoiceCount2009 FROM Invoice
    WHERE InvoiceDate LIKE '%2009%';

