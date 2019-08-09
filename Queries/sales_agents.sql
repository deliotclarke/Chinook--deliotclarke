-- sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.

SELECT FirstName, LastName, Title FROM Employee
    WHERE Title = 'Sales Support Agent';