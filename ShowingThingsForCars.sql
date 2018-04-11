--Sowing mkae, model, color, avail., miles for all cars

SELECT
       [Color]
	  ,[AvailableForLease]
	  ,[MilesDriven]
	  ,[Make]
	  ,[Model]
FROM Cars
JOIN CarData ON [Cars].[CarDataID] = CarData.ID

