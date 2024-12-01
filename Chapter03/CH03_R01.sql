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
        WHEN check_in_timestamp ~ '^[0-9]{2}[-/][0-9]{2}[-/][0-9]{4}\s[0-9]{1,2}:[0-9]{2}(:[0-9]{2})?(\s?(AM|PM))?$' THEN
            CASE
                -- Determine date format: DD/MM/YYYY if the first number is > 12
                WHEN CAST(SUBSTRING(check_in_timestamp FROM 1 FOR 2) AS INT) > 12 THEN TO_TIMESTAMP(
                    CASE 
                        -- Append :00 if seconds are missing, and handle AM/PM
                        WHEN check_in_timestamp ~ 'AM|PM$' THEN REGEXP_REPLACE(check_in_timestamp, '\s?(AM|PM)$', ':00 \1')
                        WHEN check_in_timestamp ~ ':[0-9]{2}$' THEN check_in_timestamp -- Seconds are already present
                        ELSE check_in_timestamp || ':00' -- Append :00 if missing
                    END, 
                    CASE WHEN check_in_timestamp ~ 'AM|PM$' THEN 'DD/MM/YYYY HH:MI:SS AM' ELSE 'DD/MM/YYYY HH24:MI:SS' END
                )
                -- MM/DD/YYYY if the second number is > 12
                WHEN CAST(SUBSTRING(check_in_timestamp FROM 4 FOR 2) AS INT) > 12 THEN TO_TIMESTAMP(
                    CASE 
                        WHEN check_in_timestamp ~ 'AM|PM$' THEN REGEXP_REPLACE(check_in_timestamp, '\s?(AM|PM)$', ':00 \1')
                        WHEN check_in_timestamp ~ ':[0-9]{2}$' THEN check_in_timestamp
                        ELSE check_in_timestamp || ':00'
                    END, 
                    CASE WHEN check_in_timestamp ~ 'AM|PM$' THEN 'MM/DD/YYYY HH:MI:SS AM' ELSE 'MM/DD/YYYY HH24:MI:SS' END
                )
                -- Ambiguous rows: Apply region-based logic
                ELSE TO_TIMESTAMP(
                    CASE 
                        WHEN check_in_timestamp ~ 'AM|PM$' THEN REGEXP_REPLACE(check_in_timestamp, '\s?(AM|PM)$', ':00 \1')
                        WHEN check_in_timestamp ~ ':[0-9]{2}$' THEN check_in_timestamp
                        ELSE check_in_timestamp || ':00'
                    END, 
                    CASE 
                        WHEN Region = 'NA' AND check_in_timestamp ~ 'AM|PM$' THEN 'MM/DD/YYYY HH:MI:SS AM'
                        WHEN Region = 'NA' THEN 'MM/DD/YYYY HH24:MI:SS'
                        WHEN check_in_timestamp ~ 'AM|PM$' THEN 'DD/MM/YYYY HH:MI:SS AM'
                        ELSE 'DD/MM/YYYY HH24:MI:SS'
                    END
                )
            END
        -- For YYYY/MM/DD or YYYY-MM-DD with time in HH:MI, HH:MI:SS AM/PM, or HH24:MI:SS format
        WHEN check_in_timestamp ~ '^[0-9]{4}[-/][0-9]{2}[-/][0-9]{2}\s[0-9]{1,2}:[0-9]{2}(:[0-9]{2})?(\s?(AM|PM))?$' THEN TO_TIMESTAMP(
            CASE 
                WHEN check_in_timestamp ~ 'AM|PM$' THEN REGEXP_REPLACE(check_in_timestamp, '\s?(AM|PM)$', ':00 \1')
                WHEN check_in_timestamp ~ ':[0-9]{2}$' THEN check_in_timestamp
                ELSE check_in_timestamp || ':00'
            END, 
            CASE WHEN check_in_timestamp ~ 'AM|PM$' THEN 'YYYY/MM/DD HH:MI:SS AM' ELSE 'YYYY/MM/DD HH24:MI:SS' END
        )
        -- For invalid or null values, set to NULL
        ELSE NULL
    END;


-- 3.2 check_out_datetime
UPDATE ch03_r01_bookings
SET standardized_check_out_timestamp = 
    CASE
        -- For DD/MM/YYYY or MM/DD/YYYY with time in HH:MI, HH:MI:SS AM/PM, or HH24:MI:SS format
        WHEN check_out_timestamp ~ '^[0-9]{2}[-/][0-9]{2}[-/][0-9]{4}\s[0-9]{1,2}:[0-9]{2}(:[0-9]{2})?(\s?(AM|PM))?$' THEN
            CASE
                -- Determine date format: DD/MM/YYYY if the first number is > 12
                WHEN CAST(SUBSTRING(check_out_timestamp FROM 1 FOR 2) AS INT) > 12 THEN TO_TIMESTAMP(
                    CASE 
                        -- Append :00 if seconds are missing, and handle AM/PM
                        WHEN check_out_timestamp ~ 'AM|PM$' THEN REGEXP_REPLACE(check_out_timestamp, '\s?(AM|PM)$', ':00 \1')
                        WHEN check_out_timestamp ~ ':[0-9]{2}$' THEN check_out_timestamp -- Seconds are already present
                        ELSE check_out_timestamp || ':00' -- Append :00 if missing
                    END, 
                    CASE WHEN check_out_timestamp ~ 'AM|PM$' THEN 'DD/MM/YYYY HH:MI:SS AM' ELSE 'DD/MM/YYYY HH24:MI:SS' END
                )
                -- MM/DD/YYYY if the second number is > 12
                WHEN CAST(SUBSTRING(check_out_timestamp FROM 4 FOR 2) AS INT) > 12 THEN TO_TIMESTAMP(
                    CASE 
                        WHEN check_out_timestamp ~ 'AM|PM$' THEN REGEXP_REPLACE(check_out_timestamp, '\s?(AM|PM)$', ':00 \1')
                        WHEN check_out_timestamp ~ ':[0-9]{2}$' THEN check_out_timestamp
                        ELSE check_out_timestamp || ':00'
                    END, 
                    CASE WHEN check_out_timestamp ~ 'AM|PM$' THEN 'MM/DD/YYYY HH:MI:SS AM' ELSE 'MM/DD/YYYY HH24:MI:SS' END
                )
                -- Ambiguous rows: Apply region-based logic
                ELSE TO_TIMESTAMP(
                    CASE 
                        WHEN check_out_timestamp ~ 'AM|PM$' THEN REGEXP_REPLACE(check_out_timestamp, '\s?(AM|PM)$', ':00 \1')
                        WHEN check_out_timestamp ~ ':[0-9]{2}$' THEN check_out_timestamp
                        ELSE check_out_timestamp || ':00'
                    END, 
                    CASE 
                        WHEN Region = 'NA' AND check_out_timestamp ~ 'AM|PM$' THEN 'MM/DD/YYYY HH:MI:SS AM'
                        WHEN Region = 'NA' THEN 'MM/DD/YYYY HH24:MI:SS'
                        WHEN check_out_timestamp ~ 'AM|PM$' THEN 'DD/MM/YYYY HH:MI:SS AM'
                        ELSE 'DD/MM/YYYY HH24:MI:SS'
                    END
                )
            END
        -- For YYYY/MM/DD or YYYY-MM-DD with time in HH:MI, HH:MI:SS AM/PM, or HH24:MI:SS format
        WHEN check_out_timestamp ~ '^[0-9]{4}[-/][0-9]{2}[-/][0-9]{2}\s[0-9]{1,2}:[0-9]{2}(:[0-9]{2})?(\s?(AM|PM))?$' THEN TO_TIMESTAMP(
            CASE 
                WHEN check_out_timestamp ~ 'AM|PM$' THEN REGEXP_REPLACE(check_out_timestamp, '\s?(AM|PM)$', ':00 \1')
                WHEN check_out_timestamp ~ ':[0-9]{2}$' THEN check_out_timestamp
                ELSE check_out_timestamp || ':00'
            END, 
            CASE WHEN check_out_timestamp ~ 'AM|PM$' THEN 'YYYY/MM/DD HH:MI:SS AM' ELSE 'YYYY/MM/DD HH24:MI:SS' END
        )
        -- For invalid or null values, set to NULL
        ELSE NULL
    END;

-- Step 4: Check values on standardized columns
SELECT * FROM ch03_r01_bookings


-- Step 5: Replace the Original Columns (Optional)

-- Drop the original columns that used datetime
ALTER TABLE ch03_r01_bookings DROP COLUMN booking_date;
ALTER TABLE ch03_r01_bookings DROP COLUMN check_in_timestamp;
ALTER TABLE ch03_r01_bookings DROP COLUMN check_out_timestamp;
-- Rename the standardized columns to their original names, now reflecting timestamp
ALTER TABLE ch03_r01_bookings RENAME COLUMN standardized_booking_date TO booking_date;
ALTER TABLE ch03_r01_bookings RENAME COLUMN standardized_check_in_timestamp TO check_in_timestamp;
ALTER TABLE ch03_r01_bookings RENAME COLUMN standardized_check_out_timestamp TO check_out_timestamp;



