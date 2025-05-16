/*
===================================
DDL Script : Create Silver Tables
===================================
Script Purpose : 
  This script creates tables in the 'silver' schema, droping existing tables if they already exist.
Run this script to re-define the DDL Structure of the 'silver' tables
*/





IF OBJECT_ID ('silver.crm_prd_info', 'U') IS NOT NULL
DROP TABLE silver.crm_prd_info;
GO
CREATE TABLE silver.crm_prd_info (

	prd_id INT,
	CAT_ID NVARCHAR(50),
    prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATE,
    prd_end_dt DATE,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
	   	  
);




-- unfinished copy






IF OBJECT_ID ('silver.crm_sales_details', 'U') IS NOT NULL
DROP TABLE silver.crm_sales_details;
GO
CREATE TABLE silver.crm_sales_details (
	sls_ord_num NVARCHAR(50),
      sls_prd_key NVARCHAR(50),
      sls_cust_id INT,
      sls_order_dt DATE,
      sls_ship_dt DATE,
      sls_due_dt DATE,
      sls_sales INT,
      sls_quantity INT,
      sls_price INT,
	  dwh_create_date DATETIME2 DEFAULT GETDATE()
 
 );
