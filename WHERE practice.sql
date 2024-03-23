-- [SQL Server] Ordering and filtering data

-- 1. Select all rows from DimEmployee with female employees from the Finance department.

SELECT
	*
FROM
	DimEmployee
WHERE
	Gender= 'F' AND
	DepartmentName= 'Finance'



-- 2. Select all rows from DimProduct with Contoso products and in color red and with UnitPrice higher than $100

SELECT
	*
FROM
	DimProduct
WHERE
	BrandName = 'Contoso' AND
	ColorName = 'Red' AND
	UnitPrice >= 100



-- 3. Select all rows from DimProduct with products from Litware or Fabrikam or with the black color.

SELECT
	*
FROM
	DimProduct
WHERE
	BrandName = 'Litware' OR
	BrandName = 'Fabrikam' OR
	ColorName = 'Black'
ORDER BY
	BrandName


	
-- 4. Select all rows from DimSalesTerritory where the continent is Europe but the country isn't Italy.

SELECT
	*
FROM
	DimSalesTerritory
WHERE NOT
	SalesTerritoryCountry = 'Italy' AND
	SalesTerritoryGroup = 'Europe'
	

	
-- 5. Select all rows from DimProduct where the products are in red or black color, but the brand has to be Fabrikam.

SELECT
	*
FROM
	DimProduct
WHERE
(
	ColorName = 'Black' OR
	ColorName = 'Red'
) AND
	BrandName = 'Fabrikam'
ORDER BY
	ColorName



-- 6. Use the 'IN' command to make 'OR' simpler.

SELECT
	*
FROM
	DimEmployee
WHERE
	DepartmentName IN
	(
		'Production',
		'Marketing',
		'Engineering'
	)
ORDER BY
	DepartmentName



-- 7. Select all rows from DimProduct where the products are MP3 Players with 4GB memory.

SELECT
	*
FROM
	DimProduct
WHERE
	ProductDescription LIKE '%MP3%' AND
	ProductDescription LIKE '%4GB%'



-- 8. Select all rows from DimProduct where the UnitPrice for the products are between $50 and $100

SELECT
	*
FROM
	DimProduct
WHERE
	UnitPrice BETWEEN 50 AND 100
ORDER BY
	UnitPrice