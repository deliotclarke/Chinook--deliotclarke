-- top_agent.sql: Which sales agent made the most in sales over all?

-- this feels like overkill

SELECT TOP 1 TotalSalesTable.EmployeeId, TotalSalesTable.FirstName, TotalSalesTable.LastName, MAX(TotalSales) as TopSales2009 FROM (SELECT e.EmployeeId, e.FirstName, e.LastName, SUM(i.Total) as TotalSales FROM Employee e
            JOIN Customer c ON c.SupportRepId = e.EmployeeId
            JOIN Invoice i ON i.CustomerId = c.CustomerId
            WHERE e.Title = 'Sales Support Agent'
            GROUP BY e.EmployeeId, e.FirstName, e.LastName) as TotalSalesTable
        GROUP BY TotalSalesTable.EmployeeId, TotalSalesTable.FirstName, TotalSalesTable.LastName;