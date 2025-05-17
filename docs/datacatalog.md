Data Catalog for Gold Layer

Overview
The Gold layer is the Business - level data representation, structured to support analytical and reporting use cases. It consists of dimension tables and fact tables for specific business metrics.

1. gold.dim_customers
- purpose: stores customer details enriched with demographic and geographic data
- columns are :
Column Name	Data Type	Description
customer_key	INT	Surrogate key uniquely identifying each customer record in the dimension table
customer_id	INT	Unique numerical identifier assigned to each customer
customer_number	NVARCHAR(50)	Alphanumeric identifier representing the customer, used for tracking and referencing
first_name	NVARCHAR(50)	The customer’s first name, as recorded in the system
last_name	NVARCHAR(50)	The custoemrs last name or family name
country	NVARCHAR(50)	The country of residence for the customer( e.g. ‘Germany’)
marital_status	NVARCHAR(50)	The marital status of the customer(e.g. ‘Married’,’Single’)
gender	NVARCHAR(50)	The gender of the customer(e.g. ‘Male’, ‘Female’)
birth_date	DATE	The date of birth of the customer, formatted as YYYY-MM-DD(e.g. 1976-10-21)
create_date	DATE	The date and time when the customer record was created in the system
   
2. gold.dim_products
Provides information about the products and their attributes
Column Name	Data Type	Description
product_key	INT	Surrogate key uniquely identifying each product record in the dimension table
product_id	INT	A unique identifier assigned to the product for internal tracking and referencing
product_number	NVARCHAR(50)	A Structured Alphanumeric code representing the product, often used for categorization of inventory
product_name	NVARCHAR(50)	Descriptive name of a product, including details
category_id	NVARCHAR(50)	A unique identifier for the product’s category linking to its high-level classification
category	NVARCHAR(50)	The broader classification of a product( e.g., Bikes etc.) to group related items
sub_category	NVARCHAR(50)	A more detailed classification of the product within the category
maintenance	NVARCHAR(50)	Indicate whether the product requires maintenance( Yes or No) 
cost	INT	The cost or base price of the product, measured in monetary units
Product_line	NVARCHAR(50)	The specific product line or series to which the product belongs( Road, Mountain etc.)
start_date	DATE	The date when the product became available for sale or use, stored in.




3. gold.fact_sales
Stores transactional sales data for analytical purposes

Column Name	Data Type	Description
order_number	NVARCHAR(50)	A unique alphanumeric identifier for each sales order( e.g. ‘SO55446’)
product_key	INT	Surrogate key linking the order to the product dimension table
customer_key	INT	Surrogate key linking the order to the customer dimension table
order_date	DATE	The date when the order has been placed
shipping_date	DATE	The date when the order was shipped to the consumer
due_date	DATE	The date when the order payment was due
sales_amount	INT	The total monetary value of the sale for the line item, in currency units  
quantity	INT	The number of units of the product ordered for the line item
sls_price	INT	The price per unit of the product for the line item, in currency units


