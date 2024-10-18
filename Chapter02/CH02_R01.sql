-- ## Removing Duplicate Rows ##

-- Step 1: Enriching the dataset
CREATE VIEW ch02_r01_cdr_vw AS (
    SELECT 
        c1.call_id AS call_id_1, 
        c2.call_id AS call_id_2, 
        c1.phone_number_from,
		c1.phone_number_to as phone_number_to_1,
		c2.phone_number_to as phone_number_to_2,
        c1.call_start_time AS start_time_1, 
        c2.call_start_time AS start_time_2,
        ST_Distance(
            ST_MakePoint(c1.tower_longitude, c1.tower_latitude)::geography, 
            ST_MakePoint(c2.tower_longitude, c2.tower_latitude)::geography
        ) / 1609.34 AS distance_miles,  -- Convert meters to miles
       ABS(EXTRACT(EPOCH FROM (c2.call_start_time - c1.call_start_time)))  AS time_diff_seconds
    FROM 
        ch02_r01_cdr c1
    JOIN 
        ch02_r01_cdr c2 ON c1.phone_number_from = c2.phone_number_from 
    WHERE 
	c2.call_id > c1.call_id
)


-- Step 2: Identifying Duplicates
SELECT *
FROM ch02_r01_cdr_vw
WHERE 
	distance_miles < 50 AND time_diff_seconds <= 1


-- Step 3: Removing duplicate records
	
--3.1 Add flag column
ALTER TABLE ch02_r01_cdr
ADD COLUMN duplicate_flag boolean;

--3.2 if record is a duplicate then flag column is set to true 
UPDATE ch02_r01_cdr 
SET duplicate_flag=true
WHERE call_id in (SELECT call_id_2
FROM ch02_r01_cdr_vw
WHERE 
	distance_miles < 50 AND time_diff_seconds <= 1);

--3.3 check duplicate records
SELECT * FROM ch02_r01_cdr 
	WHERE duplicate_flag=true;
	

-- There is more: potential fraudulent activity
SELECT *
FROM ch02_r01_cdr_vw
WHERE 
	distance_miles > 500 AND time_diff_seconds <= 120

