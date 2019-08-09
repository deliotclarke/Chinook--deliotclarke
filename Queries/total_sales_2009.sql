-- total_sales_{year}.sql: What are the respective total sales for each of those years?

SELECT COUNT(InvoiceId) as InvoiceCount2009 , SUM(Total) as TotalSales FROM Invoice
    WHERE InvoiceDate LIKE '%2009%';