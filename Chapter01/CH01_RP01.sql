SELECT column_name, data_type, is_nullable
FROM information_schema.columns 
WHERE table_name = 'ch01_r01_customers'
ORDER BY ordinal_position;

SELECT column_name, data_type, udt_name, numeric_precision, numeric_scale, character_maximum_length, datetime_precision, is_nullable
FROM information_schema.columns 
WHERE table_name = 'ch01_r01_customers'
ORDER BY ordinal_position;