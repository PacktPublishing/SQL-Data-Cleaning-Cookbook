-- ## Detecting Outliers in Numerical Data ##

-- Z-Score (Standard Deviation Method)
-- Step 1: We first calculate the mean and standard deviation of the Age column.
WITH Stats AS (
    SELECT 
        AVG(age) AS mean_value,
        STDDEV(age) AS stddev_value
    FROM ch01_r05_customers
),
-- Step 2: We then compute the z-score for each age, which indicates how many standard deviations a value is from the mean.
Outliers AS (
    SELECT 
        *, 
        (age - (SELECT mean_value FROM Stats)) / (SELECT stddev_value FROM Stats) AS z_score
    FROM ch01_r05_customers
)
-- Step 3: Finally, we select the records where the absolute z-score is greater than 2, identifying them as outliers.
SELECT 
    id, name, age,  ROUND(mean_value,2) mean, ROUND(stddev_value,2) std_dev, ROUND(z_score) z_score
FROM Outliers cross join Stats
WHERE ABS(z_score) >= 2 -- Change 2 to a different number if you need a different threshold
ORDER BY age;





--  Interquartile Range (IQR) Method
-- Step 1: Partition data into four quartiles using NTILE
WITH Quartiles AS (
    SELECT 
        Age,
        NTILE(4) OVER (ORDER BY Age) AS quartile
    FROM ch01_r05_customers
),
-- Step 2: Calculate Q1 and Q3
QuartileValues AS (
    SELECT 
        MIN(CASE WHEN quartile = 1 THEN Age END) AS Q1,
        MAX(CASE WHEN quartile = 3 THEN Age END) AS Q3
    FROM Quartiles
),
-- Step 3: Calculate IQR and determine outlier thresholds
IQR_Calc AS (
    SELECT 
        Q1,
        Q3,
        Q3 - Q1 AS IQR,
        Q1 - 1.5 * (Q3 - Q1) AS Lower_Threshold,
        Q3 + 1.5 * (Q3 - Q1) AS Upper_Threshold
    FROM QuartileValues
),
-- Step 4: Identify outliers based on IQR thresholds
Outliers AS (
    SELECT 
        ch01_r05_customers.*,Lower_Threshold, Upper_Threshold,
        CASE
            WHEN Age < Lower_Threshold THEN 'Below'
            WHEN Age > Upper_Threshold THEN 'Above'
            ELSE 'Within'
        END AS Outlier_Status
    FROM ch01_r05_customers, IQR_Calc
)
-- Step 5: Select records classified as outliers
SELECT 
    Name, Age, Outlier_Status, Lower_Threshold, Upper_Threshold
FROM Outliers where outlier_status <> 'Within'
order by age;

