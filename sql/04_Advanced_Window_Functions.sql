-- RANK() && DENSE_RANK() --
			
		SELECT 
			(`Car Make`),
			ROUND(SUM(`Sale Price`),2) AS Revenue,
			
			RANK() OVER (
						ORDER BY SUM(`Sale Price`) DESC
						) AS BRAND_RANK,
			DENSE_RANK() OVER (
						ORDER BY SUM(`Sale Price`) DESC
						) AS BRAND_DENSE_RANK
                    
			FROM vehicle_sales_cleaned
			GROUP BY `Car Make`;
			
        
	-- ROW_NUMBER() BY SALES PERSON --
		
		SELECT 
			(`Salesperson`),
			ROUND(SUM(`Sale Price`),2) AS Revenue  ,
			ROW_NUMBER()
			OVER(
			ORDER BY SUM(`Sale Price`) DESC
			) AS ROW_NUM
						
			FROM vehicle_sales_cleaned
			GROUP BY (`Salesperson`) 
			ORDER BY Revenue DESC ;
			
	-- PARTITION BY REGION_RANK  && CTE CONCEPT--
            
			WITH Sales_Rank AS (SELECT
							(`Sales Region`),
							(`Salesperson`),
							ROUND(SUM(`Sale Price`),2) AS Revenue,
							RANK() OVER (
							PARTITION BY (`Sales Region`)
							ORDER BY SUM(`Sale Price`) DESC
							) AS REGION_RANK
							
							FROM vehicle_sales_cleaned
							
							GROUP BY `Sales Region`,
									`Salesperson`
							ORDER BY `Sales Region`,
									`REGION_RANK` 
						)
				SELECT * FROM Sales_Rank
				WHERE REGION_RANK <= 5;
                
    -- Running Total / Cumulative Revenue --
			
			WITH Monthly_Revenue AS(SELECT 
									YEAR(`Date`) AS Year,
									MONTH(`Date`) AS Month,
									ROUND(SUM(`Sale Price`),2) AS Revenue
									
									FROM vehicle_sales_cleaned
									GROUP BY (`Year`),
											(`Month`)
								)
								SELECT 
								Year,
								Month,
								Revenue,
								ROUND
								(SUM(`Revenue`) OVER(
								ORDER BY Year,
										month
										),2)AS Running_Total 
								FROM Monthly_Revenue;