-- ## Merging Duplicate Rows ##

-- Step 1: Identify Duplicates Using SSN
WITH ranked_customers AS (
    SELECT 
        customer_id,
        first_name,
        last_name,
        email,
        phone,
        city,
        last_purchase,
		ssn,
        ROW_NUMBER() OVER (
            PARTITION BY ssn
            ORDER BY last_purchase DESC
        ) AS rn,
        MIN(customer_id) OVER (
            PARTITION BY ssn
        ) AS min_customer_id
    FROM ch02_r02_customers
),
-- Step 2: Merge Duplicate Data
consolidated_customer AS (
    SELECT 
		min_customer_id AS customer_id , 
		COALESCE(MAX(first_name) FILTER (WHERE rn = 1 and first_name<>''), MAX(first_name)) AS first_name,
		COALESCE(MAX(last_name) FILTER (WHERE rn = 1 and last_name<>''), MAX(last_name)) AS last_name,
	    COALESCE(MAX(email) FILTER (WHERE rn = 1 and email<>''), MAX(email)) AS email,
		COALESCE(MAX(phone) FILTER (WHERE rn = 1 and phone<>''), MAX(phone)) AS phone,
		COALESCE(MAX(city) FILTER (WHERE rn = 1 and city<>''), MAX(city)) AS city,
        MAX(last_purchase) AS last_purchase,
		ssn
	FROM ranked_customers
    GROUP BY ssn, min_customer_id
)
-- Step 3: Insert Consolidated Data into a Clean Table
INSERT INTO ch02_r02_customers_clean (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn)
SELECT * FROM consolidated_customer



-- There is more: Handling Complex Conflicts in the last_name Field
WITH ranked_customers AS (
    SELECT 
        customer_id,
        first_name,
        last_name,
        email,
        phone,
        city,
        last_purchase,
        ssn,
        ROW_NUMBER() OVER (
            PARTITION BY ssn
            ORDER BY last_purchase DESC
        ) AS rn,
        MIN(customer_id) OVER (
            PARTITION BY ssn
        ) AS min_customer_id
    FROM ch02_r02_customers
),
-- Step 2: Count Last Name Frequencies
last_name_frequencies AS (
    SELECT ssn, last_name, COUNT(*) AS last_name_count
    FROM ranked_customers
    WHERE last_name IS NOT NULL
    GROUP BY ssn, last_name
),
-- Step 3: Rank Last Names Based on Frequency
ranked_last_names AS (
    SELECT ssn, last_name, last_name_count,
           ROW_NUMBER() OVER (PARTITION BY ssn ORDER BY last_name_count DESC) AS name_rank
    FROM last_name_frequencies
),
-- Step 4: Select Most Frequent Last Name
most_frequent_last_name AS (
    SELECT ssn, last_name
    FROM ranked_last_names
    WHERE name_rank = 1
),
-- Step 5: Consolidate Customer Data
consolidated_customer AS (
    SELECT 
        rc.min_customer_id AS customer_id,
        COALESCE(MAX(rc.first_name) FILTER (WHERE rc.rn = 1 AND rc.first_name <> ''), MAX(rc.first_name)) AS first_name,
        COALESCE(MAX(rc.last_name) FILTER (WHERE rc.rn = 1 AND rc.last_name <> ''), mf.last_name) AS last_name,
        COALESCE(MAX(rc.email) FILTER (WHERE rc.rn = 1 AND rc.email <> ''), MAX(rc.email)) AS email,
        COALESCE(MAX(rc.phone) FILTER (WHERE rc.rn = 1 AND rc.phone <> ''), MAX(rc.phone)) AS phone,
        COALESCE(MAX(rc.city) FILTER (WHERE rc.rn = 1 AND rc.city <> ''), MAX(rc.city)) AS city,
        MAX(rc.last_purchase) AS last_purchase,
        rc.ssn
    FROM ranked_customers rc
    LEFT JOIN most_frequent_last_name mf ON rc.ssn = mf.ssn
    GROUP BY rc.min_customer_id, mf.last_name, rc.ssn
)
-- Step 6: Insert Consolidated Data into Clean Table
INSERT INTO ch02_r02_customers_clean (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn)
SELECT * FROM consolidated_customer

	--where ssn in ('204-80-7411','470-94-1218') ;