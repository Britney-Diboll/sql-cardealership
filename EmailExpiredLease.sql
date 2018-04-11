--show emails of customers with expired leases

select Email
from Customers
JOIN LeaseAgreement ON LeaseAgreement.CustomerID = Customers.ID
JOIN Leases ON Leases.ID = LeaseAgreement.LeaseID
where ExpirationDate < GETDATE()
