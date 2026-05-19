                        
	-- Monthly Growth % --
																
				WITH monthly_sales AS (
					SELECT
						YEAR(`Date`) AS Year,
						MONTH(`Date`) AS Month,
						ROUND(SUM(`Sale Price`),2) AS Revenue
					FROM vehicle_sales_cleaned
					GROUP BY Year, Month
					),
					growth_analysis AS (
						SELECT
							Year,
							Month,
							Revenue,
							LAG(Revenue) OVER(
							ORDER BY Year, Month
							) AS Previous_Revenue
							FROM monthly_sales
								)
								SELECT
									Year,
									Month,
									Revenue,
									Previous_Revenue,
									IFNULL(
										ROUND(
											(
											Revenue - Previous_Revenue
											)
											/
											Previous_Revenue * 100
										,2)
									,0) AS Growth_Percentage
							FROM growth_analysis
							ORDER BY Year, Month;
					
	-- Moving Average -- 
                            
                            
			WITH Monthly_sales AS(
                SELECT 
                YEAR(`Date`) AS `year`,
                MONTH(`Date`) As `month`,
                ROUND(SUM(`Sale Price`),2) AS Revenue
                FROM vehicle_sales_cleaned
                GROUP BY `year` , `month`
                )
					SELECT
					year,
					month,
					Revenue,
                    ROUND(
						AVG(Revenue) OVER(

						ORDER BY year, month

						ROWS BETWEEN 2 PRECEDING
						AND CURRENT ROW
                    )
					,2) AS Moving_Average
            FROM Monthly_sales
            ORDER BY year , month ; 
                    
