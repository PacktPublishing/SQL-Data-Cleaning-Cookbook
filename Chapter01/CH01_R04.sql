-- ## Profiling Data Distribution ##

-- Numerical Columns: MIN/MAX/AVG/STD
SELECT
    to_char(MIN(annualincome),'FM$999,999,999.00') AS Min_Income,
    to_char(MAX(annualincome),'FM$999,999,999.00') AS Max_Income,
    to_char(AVG(annualincome),'FM$999,999,999.00') AS Avg_Income,
    to_char(STDDEV(annualincome),'FM$999,999,999.00') AS StdDev_Income,
	ROUND(MIN(age),0) AS Min_Age,
    ROUND(MAX(age),0) AS Max_Age,
    ROUND(AVG(age),0) AS Avg_Age,
    ROUND(STDDEV(age),0) AS StdDev_Age
FROM
    ch01_r04_customers;

-- Numerical Columns: RANGE
SELECT
    CASE
        WHEN annualincome < 20000 THEN 'Below 20k'
        WHEN annualincome BETWEEN 20000 AND 39999 THEN '20k-40k'
        WHEN annualincome BETWEEN 40000 AND 59999 THEN '40k-60k'
        WHEN annualincome BETWEEN 60000 AND 79999 THEN '60k-80k'
        WHEN annualincome BETWEEN 80000 AND 99999 THEN '80k-100k'
        ELSE '100k and above'
    END AS annualincome_range,
    COUNT(*) AS income_count,
	ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS Percentage
FROM
    ch01_r04_customers
GROUP BY
    annualincome_range
ORDER BY Percentage;



-- Date Columns: Distribution of Records by Year
SELECT
    EXTRACT(YEAR FROM Birthday) AS birthyear,
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS Percentage
FROM
    ch01_r04_customers
GROUP BY
    EXTRACT(YEAR FROM Birthday)
ORDER BY
    birthyear;

-- Date Columns: Distribution of Records by Month
SELECT
    EXTRACT(MONTH FROM Birthday) AS birth_month,
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS Percentage
FROM
    ch01_r04_customers
GROUP BY
    EXTRACT(MONTH FROM Birthday)
ORDER BY
    birth_month;


-- Categorical Columns
SELECT
    Marital_Status,
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS Percentage
FROM
    ch01_r04_customers
GROUP BY
    Marital_Status
ORDER BY
    Marital_Status;