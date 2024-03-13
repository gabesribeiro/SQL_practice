--ORDER BY practice
--Working on ordering the table by the columns

SELECT
	*
FROM
	DimStore
ORDER BY
	EmployeeCount



/*Exercise: Select the first 10 products, ordering them by highest to lowest price from UnitCost*/

SELECT TOP(10)
	ProductName,
	UnitCost,
	Weight
FROM
	DimProduct
ORDER BY
	UnitCost DESC,
	Weight DESC