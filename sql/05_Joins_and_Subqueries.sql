-- Create seperate table--
                            
			CREATE TABLE customers AS
            	SELECT DISTINCT 
					`Customer Name`,
                    `Customer Gender`,
                    `Customer Age`
                    FROM vehicle_sales_cleaned;
      
	-- Sales table --
                        
			CREATE TABLE sales AS
					SELECT
						`Customer Name`,
                        `Car Make`,
                        `Car Model`,
                        `Salesperson`,
                        `Sales Region`,
                        `Sale Price`
                         FROM vehicle_sales_cleaned;
                                
	--  INNER JOIN OPRATION --
                            
					SELECT 
						s.`Customer Name`,
                        c.`Customer Age`,
                        c.`Customer Gender`,
						s.`Car Make`,
                        s.`Car Model`,
                         ROUND( s.`Sale Price`,0) AS `Sale Price`
                            
				FROM sales s 
                    INNER JOIN  customers c
                    ON s.`Customer Name` = c.`Customer Name` 
                    LIMIT 10;
                            
    -- LEFT JOIN -- 
                            
					SELECT 
						s.`Customer Name`,
                        c.`Customer Age`,
                        c.`Customer Gender`,
						s.`Car Make`,
                        s.`Car Model`,
                        ROUND( s.`Sale Price`,0) AS `Sale Price`
                            
					FROM sales s 
                    LEFT JOIN  customers c
                     ON s.`Customer Name` = c.`Customer Name` 
                     LIMIT 10;
                        
	-- Subqueries --
                        
	-- Cars With Above Average Sale Price --
                    
					SELECT DISTINCT
						`Car Make`,
                        `Car Model`,
						ROUND(`Sale Price`,0) AS `Sale Price`
						FROM vehicle_sales_cleaned
                    	WHERE `Sale Price` >
						 (
                   		SELECT ROUND(AVG(`Sale Price`),2)
                    	FROM vehicle_sales_cleaned
                    	);
                    
                    
    -- Second Highest Revenue Brand --

                    SELECT 
							`Car Make`,
                            ROUND(SUM(`Sale Price`),2) AS Revenue
                            FROM vehicle_sales_cleaned
							GROUP BY `Car Make`
					HAVING Revenue = (
							SELECT
                            MAX(Revenue)
                            FROM (
                            SELECT
							`Car Make`,
                            ROUND(SUM(`Sale Price`),2) AS Revenue
                            FROM vehicle_sales_cleaned
							GROUP BY `Car Make`
                            ) AS temp1
                            
                            WHERE Revenue < (
                            SELECT 
									max(Revenue)
							FROM(
                            SELECT
                            `Car Make`,
                            ROUND(SUM(`Sale Price`),2) AS Revenue
                            FROM vehicle_sales_cleaned
							GROUP BY `Car Make`
							) AS temp2
						)
                    );
                    
                    
                    