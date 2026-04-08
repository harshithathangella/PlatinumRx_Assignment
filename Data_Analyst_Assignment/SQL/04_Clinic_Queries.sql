-- Clinic Q1: Revenue by sales channel (2021)
SELECT 
    sales_channel,
    SUM(amount) AS total_revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;

-- Clinic Q2: Top 10 customers by revenue (2021)
SELECT 
    cs.uid,
    c.name,
    SUM(cs.amount) AS total_spent
FROM clinic_sales cs
JOIN customer c ON cs.uid = c.uid
WHERE YEAR(cs.datetime) = 2021
GROUP BY cs.uid, c.name
ORDER BY total_spent DESC
LIMIT 10;

-- Clinic Q3: Monthly revenue, expense, profit, status (2021)
WITH revenue AS (
    SELECT 
        MONTH(datetime) AS month,
        SUM(amount) AS total_revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2021
    GROUP BY month
),

expenses_cte AS (
    SELECT 
        MONTH(datetime) AS month,
        SUM(amount) AS total_expense
    FROM expenses
    WHERE YEAR(datetime) = 2021
    GROUP BY month
)

SELECT 
    r.month,
    r.total_revenue,
    e.total_expense,
    (r.total_revenue - e.total_expense) AS profit,
    
    CASE 
        WHEN (r.total_revenue - e.total_expense) > 0 THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS status

FROM revenue r
JOIN expenses_cte e ON r.month = e.month;

-- Clinic Q4: Most profitable clinic per city (October 2021)
WITH revenue AS (
    SELECT 
        cid,
        SUM(amount) AS total_revenue
    FROM clinic_sales
    WHERE MONTH(datetime) = 10 AND YEAR(datetime) = 2021
    GROUP BY cid
),

expenses_cte AS (
    SELECT 
        cid,
        SUM(amount) AS total_expense
    FROM expenses
    WHERE MONTH(datetime) = 10 AND YEAR(datetime) = 2021
    GROUP BY cid
),

profit_data AS (
    SELECT 
        c.city,
        c.clinic_name,
        (r.total_revenue - e.total_expense) AS profit,
        
        RANK() OVER (
            PARTITION BY c.city
            ORDER BY (r.total_revenue - e.total_expense) DESC
        ) AS rnk

    FROM revenue r
    JOIN expenses_cte e ON r.cid = e.cid
    JOIN clinics c ON r.cid = c.cid
)

SELECT *
FROM profit_data
WHERE rnk = 1;

-- Clinic Q5: Second least profitable clinic per state (October 2021)
WITH revenue AS (
    SELECT 
        cid,
        SUM(amount) AS total_revenue
    FROM clinic_sales
    WHERE MONTH(datetime) = 10 AND YEAR(datetime) = 2021
    GROUP BY cid
),

expenses_cte AS (
    SELECT 
        cid,
        SUM(amount) AS total_expense
    FROM expenses
    WHERE MONTH(datetime) = 10 AND YEAR(datetime) = 2021
    GROUP BY cid
),

profit_data AS (
    SELECT 
        c.state,
        c.clinic_name,
        (r.total_revenue - e.total_expense) AS profit,
        
        DENSE_RANK() OVER (
            PARTITION BY c.state
            ORDER BY (r.total_revenue - e.total_expense) ASC
        ) AS rnk

    FROM revenue r
    JOIN expenses_cte e ON r.cid = e.cid
    JOIN clinics c ON r.cid = c.cid
)

SELECT *
FROM profit_data
WHERE rnk = 2;