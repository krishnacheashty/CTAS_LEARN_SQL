-- CREATE A CTAS 

--FOR REFRESH CTAS WE HAVE TO DO IN EVERY DAY

IF OBJECT_ID('Sales.MonthlyOrders','U') IS NOT NULL
	DROP TABLE Sales.MonthlyOrders
GO


	SELECT 
		DATENAME(month,OrderDate) OrderMonth,
		MONTH(OrderDate)MonthNumber,
		COUNT(OrderID) TotalOrders
	INTO Sales.MonthlyOrders
	FROM Sales.Orders
	GROUP BY DATENAME(month,OrderDate),MONTH(OrderDate)

	SELECT 
	m.OrderMonth,
	m.MonthNumber,
	m.TotalOrders
	FROM Sales.MonthlyOrders m
	ORDER BY m.MonthNumber


