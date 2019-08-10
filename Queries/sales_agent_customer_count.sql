-- sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.

SELECT e.EmployeeId, e.FirstName, e.LastName, COUNT(e.EmployeeId) as CustomerCount FROM Employee e
    JOIN Customer c ON c.SupportRepId = e.EmployeeId
    WHERE e.Title = 'Sales Support Agent'
    GROUP BY e.EmployeeId, e.FirstName, e.LastName;