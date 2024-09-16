-- ## Identifying Duplicate Rows  ##

-- Finding Exact Duplicates Records based on name, address, city,  zipcode and email
SELECT name, address, city,  zipcode, email, count(*) as num_duplicates 
FROM ch01_r02_customers
GROUP BY name, address, city, zipcode, email
HAVING count(*) > 1;


-- Retrieving Exact Duplicate Records
WITH duplicated_records AS
(
	SELECT name, address, city,  zipcode, email 
	FROM ch01_r02_customers
	GROUP BY name, address, city, zipcode, email
	HAVING count(*) > 1
)
SELECT *
FROM ch01_r02_customers
WHERE 
	(name, address, city,  zipcode, email) IN (
	SELECT name, address, city,  zipcode, email FROM duplicated_records
	)
ORDER BY name, address, city,  zipcode, email;


-- Finding Parcial Duplicates Records based on name and email only
SELECT name, email, count(*) as num_duplicates 
FROM ch01_r02_customers
GROUP BY name, email
HAVING count(*) > 1
EXCEPT
SELECT name, email, num_duplicates  FROM
(SELECT name, address, city,  zipcode, email, count(*) as num_duplicates 
FROM ch01_r02_customers
GROUP BY name, address, city, zipcode, email
HAVING count(*) > 1);


-- Retrieving Parcial Duplicate Records
WITH duplicated_records AS
(
	SELECT name, email, count(*) as num_duplicates 
	FROM ch01_r02_customers
	GROUP BY name, email
	HAVING count(*) > 1
	EXCEPT
	SELECT name, email, num_duplicates  FROM
	(SELECT name, address, city,  zipcode, email, count(*) as num_duplicates 
	FROM ch01_r02_customers
	GROUP BY name, address, city, zipcode, email
	HAVING count(*) > 1)
)
SELECT *
FROM ch01_r02_customers
WHERE 
	(name, email) IN (
	SELECT name, email FROM duplicated_records
	)
ORDER BY name, email;


-- Finding Similar Strings: Using Substring Matching
SELECT a.id, a.address, b.id AS similar_id, b.address AS similar_address
FROM ch01_r02_customers a
JOIN ch01_r02_customers b ON a.id <> b.id
WHERE LEFT(a.address, 13) = LEFT(b.address, 13)
AND a.address <> b.address
AND a.city = b.city
AND a.state = b.state
AND a.id < b.id;


-- levenshtein distance
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;

SELECT a.id, b.id, a.name, a.address AS address1, b.address AS address2, levenshtein(a.address, b.address) AS distance
FROM ch01_r02_customers a
JOIN ch01_r02_customers b
ON a.city = b.city  -- Ensuring that addresses are from the same city and state
AND a.state = b.state
AND a.id < b.id    -- Ensuring we don't compare the same record with itself
WHERE levenshtein(a.address, b.address) <= 5 -- Setting a threshold of similarity (5 or below in this case)
ORDER BY distance desc;
