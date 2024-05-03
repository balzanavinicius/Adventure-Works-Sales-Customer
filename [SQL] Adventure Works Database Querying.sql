		
		-- Adventure Works | Comercial Dashboard Project KPIs

		-- GENERAL TAB

-- 1) Total Revenue
-- 2) Amount Sold
-- 3) Total Product Categories
-- 4) Amount of Customers
-- 5) Total Revenue and Total Profit per Month
-- 6) Profit Margin
-- 7) Quantity Sold per Month
-- 8) Profit by Country

		-- CUSTOMERS TAB

-- 1) Sales by Country
-- 2) Customers by Country
-- 3) Sales by Gender
-- 4) Sales by Category

		-- TABLES

--SELECT * FROM FactInternetSales
--SELECT * FROM DimProductCategory
--SELECT * FROM DimCustomer
--SELECT * FROM DimGeography

		-- COLUMNS

-- SalesOrderNumber								(FactInternetSales)
-- OrderDate									(FactInternetSales)
-- EnglishProductCategoryName					(DimProductCategory)
-- CustomerKey									(DimCustomer)
-- FirstName + ' ' + Last Name					(DimCustomer)
-- Gender										(DimCustomer)
-- EnglishCountryRegionName						(DimGeography)
-- OrderQuantity								(FactInternetSales)
-- SalesAmount									(FactInternetSales)
-- TotalProductCost								(FactInternetSales)
-- Sales Amount - Total Product Cost (Profit)	(FactInternetSales)

		-- VIEW – AdventureWorks Results

CREATE OR ALTER VIEW RESULTS_ADW AS
SELECT
	fis.SalesOrderNumber AS 'Order Number',
	fis.OrderDate AS 'Order Date',
	dpc.EnglishProductCategoryName AS 'Product Category',
	fis.CustomerKey AS 'Customer ID',
	dc.FirstName + ' ' + dc.LastName AS 'Full Name',
	REPLACE(REPLACE(dc.Gender, 'M', 'Male'), 'F', 'Female') AS 'Gender',
	dg.EnglishCountryRegionName AS 'Country',
	fis.OrderQuantity AS 'Quantity',
	fis.SalesAmount AS 'Sales Revenue',
	fis.TotalProductCost AS 'Sales Cost',
	fis.SalesAmount - fis.TotalProductCost AS 'Sales Profit'
FROM
	FactInternetSales AS fis
INNER JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
	INNER JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
		INNER JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
	INNER JOIN DimGeography dg ON dc.GeographyKey = dg.GeographyKey

SELECT * FROM RESULTS_ADW