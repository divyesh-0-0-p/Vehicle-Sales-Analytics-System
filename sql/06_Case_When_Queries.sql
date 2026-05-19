                    
	-- CASE - WHEN QUERY --

	-- Price category --           
					SELECT 
						`Car Make`,
                        `Car Model`,
                        ROUND((`Sale Price`),0) AS Sale_Price,
					CASE
						WHEN `Sale Price` < 50000
								THEN 'BUDGET'
						WHEN `Sale Price` BETWEEN 50000 AND 100000
								THEN 'MID-RANGE'
						ELSE 'LUXURY'
					END AS Price_Category
                    FROM vehicle_sales_cleaned
                    LIMIT 20; 
									
	-- Sales Performance Classification --
								
					SELECT 
						`Salesperson`,
                        ROUND((`Sale Price`),0)AS Sale_Price,
					CASE 
						WHEN `Sale Price` < 50000
							THEN 'low sale'
						WHEN `Sale Price` BETWEEN 50000 AND 100000
							THEN 'medium sale'
						ELSE 'high sale'
					END AS Sales_Category
					FROM vehicle_sales_cleaned
                    LIMIT 20 ;
                         