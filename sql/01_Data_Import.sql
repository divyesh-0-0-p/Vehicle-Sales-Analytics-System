
-- DATABASE CREATION --
			
		CREATE DATABASE vehicle_sales_project;
		use vehicle_sales_project;
		show tables;
           
    -- IMPORT DATA --
           
		SET GLOBAL local_infile = 1;
		use vehicle_sales_project;
		LOAD DATA LOCAL INFILE 'C:/Desktop/Vehicle-Sales-Analytics-System/data/cleaned_data/vehicle_sales_cleaned.csv'
		INTO TABLE vehicle_sales_cleaned
		FIELDS TERMINATED BY ','
		ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
		IGNORE 1 ROWS;

	-- CHECK DATA TABLE--
        
		SELECT * FROM vehicle_sales_cleaned LIMIT 5;

	-- TOTAL ROWS --
        
		SELECT COUNT(*) FROM vehicle_sales_cleaned;