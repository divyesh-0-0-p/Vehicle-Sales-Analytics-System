-- TOTAL REVENUE--
    
			SELECT 
			ROUND(SUM(`Sale Price`),2) AS Revenue
			FROM vehicle_sales_cleaned;

	-- Top Selling Car Brands --
    
		SELECT 
			`Car Make`,
			COUNT(*) AS Total_sales
			FROM vehicle_sales_cleaned
			GROUP BY `Car Make`
			ORDER BY Total_sales DESC;
			
	-- Top Revenue Generating Brands--
    
		SELECT 
			`Car Make`,
			ROUND(SUM(`Sale Price`),2) AS Revenue
			FROM vehicle_sales_cleaned
			GROUP BY `Car Make`
			ORDER BY Revenue DESC;
        
	-- Monthly Sales Trend --
    
		SELECT 
			YEAR(`Date`),
			MONTH(`Date`),
			ROUND(SUM(`Sale Price`),2) AS Monthly_Revenue
			FROM vehicle_sales_cleaned
			GROUP BY 
			YEAR(`Date`),
			MONTH(`Date`)
			ORDER BY 
			YEAR(`Date`),
			MONTH(`Date`);
		
	-- Top 5 Revenue Generating Models --
			
		SELECT
			(`Car Model`),
			ROUND(SUM(`Sale Price`),2) AS Model_Revenue
			FROM vehicle_sales_cleaned 
			GROUP BY (`Car Model`)
			ORDER BY MOdel_Revenue DESC LIMIT 5;
        
	-- Region Wise Revenue --
            
		SELECT  
			(`Sales Region`),
			ROUND(SUM(`Sale Price`),2) AS Region_Revenue
			FROM vehicle_sales_cleaned 
			GROUP BY (`Sales Region`)
			ORDER BY Region_Revenue DESC LIMIT 10;
        
	-- Average Sale Price Per Brand --
            
		SELECT 
			(`Car Make`),
			ROUND(AVG(`Sale Price`),2) AS Average_selling_Price
			FROM vehicle_sales_cleaned
			GROUP BY (`Car Make`)
			ORDER BY Average_selling_Price DESC;
        
	-- Top Performing Salespersons --
            
		SELECT 
			(`Salesperson`),
			ROUND(SUM(`Sale Price`),2) AS Total_Revenue
			FROM vehicle_sales_cleaned
			GROUP BY (`Salesperson`) 
			ORDER BY Total_Revenue DESC LIMIT 10;