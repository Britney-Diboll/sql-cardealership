--Find non expired leases

SELECT *
FROM Leases
where ExpirationDate > GETDATE()