--WHERE function.
--Using WHERE to filter numbers, string and date.

SELECT
	*
FROM
	DimProduct

SELECT TOP(1)
	ProductName,
	UnitPrice
FROM
	DimProduct
ORDER BY
	UnitPrice DESC


--Filtering by Numbers
--How many products have the price higher than $1000?

SELECT
	ProductName AS 'Product',
	UnitPrice AS 'Price'
FROM
	DimProduct
WHERE
	UnitPrice > 1000
ORDER BY
	UnitPrice



--Filtering by String/Text
--Which Brand names are the same as the manufacturer?

SELECT DISTINCT
	BrandName
FROM
	DimProduct

SELECT
	*
FROM
	DimProduct
WHERE
	BrandName = 'Adventure Works'


SELECT
	*
FROM
	DimProduct
WHERE
	ColorName = 'Blue'


--Filtering by Date
--Selecting all customers that are born after a specific date

SELECT
	*
FROM
	DimCustomer
WHERE
	BirthDate > '1970-12-31'
ORDER BY
	BirthDate



--Logical Operators - WHERE...AND, OR and NOT
--WHERE...AND

SELECT
	*
FROM
	DimProduct

SELECT
	*
FROM
	DimProduct
WHERE
	BrandName= 'Fabrikam'
	AND
	ColorName= 'Black'


--WHERE...OR

SELECT
	*
FROM
	DimProduct
WHERE
	BrandName= 'Contoso'
	OR
	BrandName= 'Fabrikam'
ORDER BY
	BrandName


--WHERE...NOT

SELECT
	*
FROM
	DimEmployee
WHERE NOT
	DepartmentName= 'Marketing'
	AND NOT
	Title= 'Sales State Manager'