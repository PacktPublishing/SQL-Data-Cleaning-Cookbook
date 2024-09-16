-- ## Analyzing Relationship Mapping between Tables ##

-- Discovering Potential Foreign Key Relationships
WITH tbl_columns AS (
	SELECT table_name, column_name
	FROM information_schema.columns
	WHERE table_name like 'ch01_r07%'
	AND table_schema not in ('pg_catalog', 'information_schema')
)
SELECT 
    t1.table_name AS table1,
    t1.column_name AS column1,
    t2.table_name AS table2,
    t2.column_name AS column2
FROM 
    tbl_columns t1
    JOIN tbl_columns t2 
    ON t1.column_name = t2.column_name
WHERE 
    t1.table_name <> t2.table_name
order by column1, table1;



-- Find all customer_id values that that exist across these 3 tables
WITH customer_ids AS (
	SELECT DISTINCT customer_id FROM (
	SELECT customer_id FROM ch01_r07_customers
    UNION
    SELECT customer_id FROM ch01_r07_orders
    UNION
    SELECT customer_id FROM ch01_r07_reviews
	)
)
SELECT
    cid.customer_id,
    CASE WHEN c.customer_id IS NOT NULL THEN 'Exists' ELSE 'Missing' END AS in_customers,
    CASE WHEN o.customer_id IS NOT NULL THEN 'Exists' ELSE 'Missing' END AS in_orders,
    CASE WHEN r.customer_id IS NOT NULL THEN 'Exists' ELSE 'Missing' END AS in_reviews
FROM
    customer_ids cid
LEFT JOIN
    ch01_r07_customers c ON cid.customer_id = c.customer_id
LEFT JOIN
    ch01_r07_orders o ON cid.customer_id = o.customer_id
LEFT JOIN
    ch01_r07_reviews r ON cid.customer_id = r.customer_id;

