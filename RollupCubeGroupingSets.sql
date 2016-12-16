SELECT * FROM [Sales].[SalesTerritory]

---CTE -- Common Table Expressions
WITH CTE_SALESTERR
AS
(
	SELECT NAME, COUNTRYREGIONCODE FROM [Sales].[SalesTerritory]
)

SELECT * FROM CTE_SALESTERR
WHERE NAME LIKE 'North%';

----Group By

SELECT NAME, NULL, NULL, SUM(SALESYTD)
FROM [Sales].[SalesTerritory]
GROUP BY NAME

UNION ALL

SELECT NAME, CountryRegionCode, NULL, SUM(SALESYTD)
FROM [Sales].[SalesTerritory]
GROUP BY NAME, CountryRegionCode

UNION ALL

SELECT NAME, CountryRegionCode, [Group], SUM(SALESYTD)
FROM [Sales].[SalesTerritory]
GROUP BY NAME, CountryRegionCode, [Group]


---GROUPING SETS
SELECT NAME, CountryRegionCode, [Group], SUM(SALESYTD)
FROM [Sales].[SalesTerritory]
GROUP BY GROUPING SETS
(
	(NAME),
	(NAME, CountryRegionCode),
	(NAME, CountryRegionCode, [Group])
)

---ROLLUP - Keep Hierarchy intact (dd-mm-yyyy/mm-yyyy/yyyy)
SELECT NAME, CountryRegionCode, [Group], SUM(SALESYTD)
FROM [Sales].[SalesTerritory]
GROUP BY ROLLUP
(
	(NAME, CountryRegionCode, [Group])
)

----CUBE -All possible cominbations(dd-mm-yyyy/mm-yyyy/yyyy/yyyy-dd-mm/mm-dd-yyyy/yyyy-mm/etc.)
SELECT NAME, CountryRegionCode, [Group], SUM(SALESYTD)
FROM [Sales].[SalesTerritory]
GROUP BY CUBE
(
	(NAME, CountryRegionCode, [Group])
)
