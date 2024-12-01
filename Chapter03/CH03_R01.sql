-- ## Standardizing Date-Time Formats ##

-- Step 1: Create Staging Columns
ALTER TABLE ch03_r01_bookings 
ADD COLUMN Standardized_Booking_Date DATE,
ADD COLUMN Standardized_Check_In_Timestamp TIMESTAMP,
ADD COLUMN Standardized_Check_Out_Timestamp TIMESTAMP;

	
-- Step 2: Standardize booking_date
UPDATE ch03_r01_bookings
SET standardized_booking_date = 
    CASE
        -- For DD/MM/YYYY or MM/DD/YYYY format
        WHEN booking_date ~ '^[0-9]{2}[-/][0-9]{2}[-/][0-9]{4}$' THEN
            CASE
                -- First number greater than 12 indicates DD/MM/YYYY
                WHEN CAST(SUBSTRING(booking_date FROM 1 FOR 2) AS INT) > 12 THEN TO_DATE(booking_date, 'DD/MM/YYYY')
                -- Second number greater than 12 indicates MM/DD/YYYY
                WHEN CAST(SUBSTRING(booking_date FROM 4 FOR 2) AS INT) > 12 THEN TO_DATE(booking_date, 'MM/DD/YYYY')
                -- Ambiguous rows: Apply region-based logic
                ELSE CASE WHEN Region = 'NA' THEN TO_DATE(booking_date, 'MM/DD/YYYY') ELSE TO_DATE(booking_date, 'DD/MM/YYYY') END
            END
        -- For YYYY/MM/DD or YYYY-MM-DD format
        WHEN booking_date ~ '^[0-9]{4}[-/][0-9]{2}[-/][0-9]{2}$' THEN TO_DATE(booking_date, 'YYYY/MM/DD')
        -- For invalid or null values
        ELSE NULL
    END;



-- Step 3: Standardize check_in_datetime and check_out_datetime
-- 3.1 check_in_datetime
UPDATE ch03_r01_bookings
SET standardized_check_in_timestamp = 
    CASE
        -- For DD/MM/YYYY or MM/DD/YYYY with time in HH:MI, HH:MI:SS AM/PM, or HH24:MI:SS format
        WHE