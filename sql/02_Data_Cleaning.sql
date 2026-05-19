-- TABLE ROWS --
	
		SELECT COUNT(*) AS table_rows,
			COUNT(DISTINCT (`Customer Name`)) As Unique_Customer,
			COUNT(DISTINCT (`Car Make`)) As Car_Make,
			COUNT(DISTINCT (`Car Model`)) As Car_Model,
			COUNT(DISTINCT (`Sales Region`)) As Sales_Region 
		FROM vehicle_sales_cleaned;
       
    -- CHECK NULL VALUES--

		SELECT 
			SUM( CASE WHEN `Date` IS NULL THEN 1 ELSE 0 END ) AS null_dates,
			SUM( CASE WHEN `Customer Name` IS NULL THEN 1 ELSE 0 END ) AS null_customers,
			SUM( CASE WHEN `Car Make` IS NULL THEN 1 ELSE 0 END ) AS null_brands,
			SUM( CASE WHEN `Sale Price` IS NULL THEN 1 ELSE 0 END ) AS null_prices
		FROM vehicle_sales_cleaned;
      
	-- CHECK POTENTIAL DUPLICATE ROW --
        
		SELECT `Customer Name`,
			`Car Make`,
			`Date`,
			COUNT(*) AS Duplicate_Count
			FROM vehicle_sales_cleaned
			GROUP BY 
			`Customer Name`,
			`Car Make`,
			`Date` 
			HAVING COUNT(*)>1;
