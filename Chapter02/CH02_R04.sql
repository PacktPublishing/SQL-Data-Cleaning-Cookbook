-- ## Conditional Imputation of Missing Data Based on Analytical Context ##

-- Step 1: Calculate the moving average of sales_amount
WITH SalesWithMovingAvg AS (
    SELECT 
        sales_id,
        sales_date,
        sales_amount,
        RANK() OVER (PARTITION BY store_id ORDER BY sales_date) AS rank,
        -- Calculate the average of the previous 10 and next 10 sales amounts using a window frame
        AVG(sales_amount) OVER (PARTITION BY store_id ORDER BY sales_date 
                                ROWS BETWEEN 10 PRECEDING AND 10 FOLLOWING) AS moving_avg_sales
    FROM ch02_r04_sales
)
	
--Step 2: update missing sales_amount based on the moving average of previous and next 10 sales
UPDATE ch02_r04_sales
SET sales_amount = (
  	SELECT 
        COALESCE(s.sales_amount, 
                 CASE 
                     WHEN s.rank = 1 THEN 0  -- If it's the first sale, assume 0 if missing
                     WHEN s.sales_amount IS NULL THEN s.moving_avg_sales
                 END
        )
    FROM SalesWithMovingAvg s
	WHERE ch02_r04_sales.sales_id = s.sales_id
)
WHERE ch02_r04_sales.sales_amount IS NULL;