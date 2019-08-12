-- top_2009_agent.sql: Which sales agent made the most in sales in 2009?

-- feels a little like overkill? not sure.

SELECT MAX(TotalSalesTable.EmployeeId) as EmployeeId, MAX(TotalSales) as TopSales2009 FROM (SELECT e.EmployeeId, SUM(i.Total) as TotalSales FROM Employee e
            JOIN Customer c ON c.SupportRepId = e.EmployeeId
            JOIN Invoice i ON i.CustomerId = c.CustomerId
            WHERE e.Title = 'Sales Support Agent' AND i.InvoiceDate LIKE '%2009%'
            GROUP BY e.EmployeeId) as TotalSalesTable;