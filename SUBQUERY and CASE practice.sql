SELECT
	*
FROM
	DimStore
WHERE
	GeographyKey
	IN
	(
		SELECT
			GeographyKey
		FROM
			DimGeography
		WHERE
			ContinentName
		IN
		(
			'Europe'
		)
	)

Select
	*
FROM
	DimGeography


SELECT
	*
FROM
	DimStore
WHERE
	GeographyKey
	IN
	(
		SELECT
			GeographyKey
		FROM
			DimGeography
		WHERE
			ContinentName
		IN
		(
			'Europe'
		)
	);

SELECT
	StoreKey,
	StoreName,
	SellingAreaSize,
	CASE
		WHEN 
			SellingAreaSize < 500
		THEN
			'Pequeno'
		WHEN
			SellingAreaSize > 690
		THEN
			'Grande'
		ELSE
			'Medio'
	END
		'Porte'
FROM
	DimStore