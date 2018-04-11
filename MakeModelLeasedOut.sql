--Get make and model of cars that are leased out 

select Make, Model
from CarData
JOIN Cars ON Cars.CarDataID = CarData.ID
JOIN Leases ON Leases.CarID = Cars.ID
