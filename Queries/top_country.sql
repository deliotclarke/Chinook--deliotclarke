-- top_country.sql: Which country's customers spent the most?

SELECT MAX(CountrySales.CountryName), MAX(TotalSales) FROM 
    (SELECT BillingCountry as CountryName, SUM(Total) as TotalSales FROM Invoice
        GROUP BY BillingCountry) as CountrySales;