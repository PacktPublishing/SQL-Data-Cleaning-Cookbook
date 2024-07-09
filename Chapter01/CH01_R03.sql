-- ## Calculating Record Completeness  ##

-- Calculating Record Completeness Percentage
WITH check_completeness AS 
	(
SELECT *, 
       (CASE WHEN birthday IS NOT NULL THEN 1 ELSE 0 END +
        CASE WHEN gender IS NOT NULL AND gender <> '' THEN 1 ELSE 0 END +
        CASE WHEN marital_status IS NOT NULL AND marital_status <> '' THEN 1 ELSE 0 END +
        CASE WHEN email IS NOT NULL AND email <> '' THEN 1 ELSE 0 END +
	    CASE WHEN birthcountry IS NOT NULL AND birthcountry <> '' THEN 1 ELSE 0 END ) AS non_null_fields,
        5 AS total_fields
FROM ch01_r03_customers
	)
SELECT  id, total_fields, non_null_fields, 
	    ROUND((non_null_fields*100.0/total_fields),2)  as completeness_pct,
		birthday, gender, marital_status, email, birthcountry 
FROM check_completeness 
WHERE non_null_fields/total_fields < 1;


-- Calculating Table Completeness Percentage
WITH check_completeness AS 
	(
SELECT *, 
       (CASE WHEN birthday IS NOT NULL THEN 1 ELSE 0 END +
        CASE WHEN gender IS NOT NULL AND gender <> '' THEN 1 ELSE 0 END +
        CASE WHEN marital_status IS NOT NULL AND marital_status <> '' THEN 1 ELSE 0 END +
        CASE WHEN email IS NOT NULL AND email <> '' THEN 1 ELSE 0 END +
	    CASE WHEN birthcountry IS NOT NULL AND birthcountry <> '' THEN 1 ELSE 0 END ) AS non_null_fields,
        5 AS total_fields
FROM ch01_r03_customers
	)
SELECT ROUND(COUNT(case when non_null_fields = total_fields THEN 1 ELSE NULL END) * 100.0 / COUNT(*),2) as completeness_records_pct 
FROM check_completeness;



	