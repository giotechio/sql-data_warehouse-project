/*
========================================
Stored Procedure: Load Bronze Layer(Source -> Bronze)
========================================
Script Purpose:
  This stored procedure loads data into the 'bronze' schema from external CSV files.
  It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the 'BULK INSERT' command to load data from csv Files to bronze values.

Parameters:
    None.
This stored procedure does not accept any parameter or return any values

Usage Example:
    EXEC bronze.load_bronze;
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN 

	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; -- declare the variables
	BEGIN TRY
			SET @batch_start_time=GETDATE();
		-- Bulk Loading
		-- For nice looking result
			PRINT '===============================================================';
			PRINT'Loading Bronze Layer';
			PRINT '===============================================================';
			Print '-----------------------------';
			PRINT 'Loading CRM Tables';
			Print '-----------------------------';
	
		SET @start_time = GETDATE(); -- 	when starts
		TRUNCATE TABLE bronze.crm_cust_info;	-- In order NOT to load same data multiple times
			PRINT'>> Truncating Table : Bronze.crm_cust_info';
			PRINT 'Inserting Data Into : bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\My Computer\Desktop\SQL_Barra\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2, -- indicates the data starts from 2nd row (1st row is headers) 
			FIELDTERMINATOR = ',', -- tell the system what is the delimiter 
			TABLOCK
		);
				SET @end_time = GETDATE(); 
				PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time )  AS NVARCHAR) + ' seconds';
				Print '-----------------------------';
		-- check the number of rows
		-- SELECT COUNT(*) FROM bronze.crm_cust_info


		-- ======================================
		-- crm file 2
		--=========================================
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_prd_info;
				PRINT'>> Truncating Table : bronze.crm_prd_info';
			PRINT 'Inserting Data Into : bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\My Computer\Desktop\SQL_Barra\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2, -- indicates the data starts from 2nd row (1st row is headers) 
			FIELDTERMINATOR = ',', -- tell the system what is the delimiter 
			TABLOCK
		);
		SET @end_time = GETDATE(); 
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time ) AS NVARCHAR) + ' seconds';
		Print '-----------------------------';
		-- ======================================
		-- crm file 3
		--=========================================
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_sales_details;
				PRINT'>> Truncating Table : bronze.crm_sales_details';
				PRINT 'Inserting Data Into : bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\My Computer\Desktop\SQL_Barra\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2, -- indicates the data starts from 2nd row (1st row is headers) 
			FIELDTERMINATOR = ',', -- tell the system what is the delimiter 
			TABLOCK
		);
		SET @end_time = GETDATE(); 
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time )  AS NVARCHAR) + ' seconds';
		Print '-----------------------------';

		-- ======================================
		-- erp file 1
		--=========================================

		Print '-----------------------------';
		PRINT 'Loading ERP Tables';
		Print '-----------------------------';
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_CUST_AZ12;
				PRINT'>> Truncating Table : Bronze.erp_CUST_AZ12';
				PRINT 'Inserting Data Into : bronze.erp_CUST_AZ12';
		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'C:\Users\My Computer\Desktop\SQL_Barra\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2, -- indicates the data starts from 2nd row (1st row is headers) 
			FIELDTERMINATOR = ',', -- tell the system what is the delimiter 
			TABLOCK
		);
		SET @end_time = GETDATE(); 
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time ) AS NVARCHAR) + ' seconds';
		Print '-----------------------------';
		-- ======================================
		-- erp file 2
		--=========================================
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_LOC_A101;
				PRINT'>> Truncating Table : Bronze.erp_LOC_A101';
				PRINT 'Inserting Data Into : bronze.erp_LOC_A101';
		BULK INSERT bronze.erp_LOC_A101
		FROM 'C:\Users\My Computer\Desktop\SQL_Barra\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2, -- indicates the data starts from 2nd row (1st row is headers) 
			FIELDTERMINATOR = ',', -- tell the system what is the delimiter 
			TABLOCK
		);
		SET @end_time = GETDATE(); 
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time ) AS NVARCHAR) + ' seconds';
		Print '-----------------------------';
		-- ======================================
		-- erp file 3
		--=========================================
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
				PRINT'>> Truncating Table : Bronze.erp_PX_CAT_G1V2';
				PRINT 'Inserting Data Into : bronze.erp_PX_CAT_G1V2';
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'C:\Users\My Computer\Desktop\SQL_Barra\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2, -- indicates the data starts from 2nd row (1st row is headers) 
			FIELDTERMINATOR = ',', -- tell the system what is the delimiter 
			TABLOCK
		);
		SET @end_time = GETDATE(); 
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time ) AS NVARCHAR) + ' seconds';
		Print '-----------------------------';

		SET @batch_end_time=GETDATE();
		PRINT 'Loading Bronze layer is Completed'
		PRINT'======================================================================';
		PRINT'======================================================================';
		PRINT '		- Total Load Duration : ' + CAST(DATEDIFF(second,@batch_start_time,@batch_end_time ) AS NVARCHAR) + ' seconds';
				PRINT'======================================================================';
		PRINT'======================================================================';
	END TRY

	BEGIN CATCH
		PRINT '================================='
		PRINT'Error Occured During Loading Bronze Layer'
		PRINT '================================='
	END CATCH

END
