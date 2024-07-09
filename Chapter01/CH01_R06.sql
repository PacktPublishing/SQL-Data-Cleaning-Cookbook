-- ## Analyzing Date and Time Data Anomalies ##





-- Detecting Inconsistent Date Formats
WITH ValidFormats AS (
    SELECT 
        order_id,
        order_datetime,
        order_datetime_utc,
        timezone,
        CASE 
            WHEN order_datetime ~ '^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$' THEN 'Valid Format'
            ELSE 'Invalid Format'
        END AS format_status
    FROM ch01_r06_orders
),
-- Identifying Future Dates in Historical Data
FutureDates AS (
    SELECT 
        order_id,
        order_datetime,
        order_datetime_utc,
        timezone,
        format_status,
        CASE 
			WHEN format_status <> 'Valid Format' THEN 'N/A'
            WHEN format_status = 'Valid Format' AND TO_TIMESTAMP(order_datetime, 'YYYY-MM-DD HH24:MI:SS') > CURRENT_TIMESTAMP THEN 'Future Date'
            ELSE 'Valid Date'
        END AS date_status
    FROM ValidFormats
),
-- Identifying datetime UTC conversion errors. 
UTCCheck AS (
    SELECT 
        order_id,
        order_datetime,
        order_datetime_utc,
	    timezone,
        format_status,
        date_status,
        CASE 
			WHEN format_status <> 'Valid Format' THEN 'N/A'
            WHEN format_status = 'Valid Format'  AND 
                 (order_datetime::timestamp AT TIME ZONE timezone) AT TIME ZONE 'UTC'  = 
                 order_datetime_utc::timestamp THEN 'Correct UTC'
			
            ELSE 'Incorrect UTC'
        END AS utc_status
    FROM FutureDates
)
-- Final Analysis
SELECT 
    order_id, 
    order_datetime,
    order_datetime_utc,
    timezone,
    format_status,
    date_status,
    utc_status
FROM UTCCheck
WHERE format_status = 'Invalid Format'
   OR date_status = 'Future Date'
   OR utc_status = 'Incorrect UTC';