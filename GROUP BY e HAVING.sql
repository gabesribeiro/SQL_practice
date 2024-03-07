-- Prática de GROUP BY e HAVING

SELECT
	*
FROM
	DimStore


SELECT
	StoreName,
	AVG
	(
		EmployeeCount
	) AS Média,
	MIN
	(
		EmployeeCount
	) AS Mínimo,
	MAX
	(
		EmployeeCount
	) AS Máximo
FROM
	DimStore
WHERE
	GeographyKey
	IN
	(
		950,
		813
	)
GROUP BY
	StoreName
HAVING
	MAX(EmployeeCount) < 70
ORDER BY
	StoreName DESC

SELECT
	StoreName,
	AVG (EmployeeCount),
	MAX (EmployeeCount),
	MIN (EmployeeCount)
FROM
	DimStore
GROUP BY
	StoreName