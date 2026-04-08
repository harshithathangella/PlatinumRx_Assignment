-- NOTE:
-- execute each query individually

-- Q1: Last booked room per user\
SELECT b.user_id, b.room_no
FROM bookings b
JOIN (
    SELECT user_id, MAX(booking_date) AS last_date
    FROM bookings
    GROUP BY user_id
) latest
ON b.user_id = latest.user_id 
AND b.booking_date = latest.last_date;

-- Q2: Total billing for bookings created in November 2021

SELECT 
    b.booking_id,
    SUM(bc.item_quantity * i.item_rate) AS total_bill
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(b.booking_date) = 11 
  AND YEAR(b.booking_date) = 2021
GROUP BY b.booking_id;

-- Q3: Bills > 1000 in October 2021

SELECT 
    bc.bill_id,
    SUM(bc.item_quantity * i.item_rate) AS total_bill
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 10 
  AND YEAR(bc.bill_date) = 2021
GROUP BY bc.bill_id
HAVING total_bill > 1000;

-- Q4: Most & Least ordered item per month (2021)

WITH item_counts AS (
    SELECT 
        MONTH(bc.bill_date) AS month,
        i.item_name,
        SUM(bc.item_quantity) AS total_qty,
        
        RANK() OVER (
            PARTITION BY MONTH(bc.bill_date) 
            ORDER BY SUM(bc.item_quantity) DESC
        ) AS rank_desc,
        
        RANK() OVER (
            PARTITION BY MONTH(bc.bill_date) 
            ORDER BY SUM(bc.item_quantity) ASC
        ) AS rank_asc

    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY month, i.item_name
)

SELECT *
FROM item_counts
WHERE rank_desc = 1 OR rank_asc = 1;

-- Q5: Customers with 2nd highest bill per month (2021)

WITH bill_data AS (
    SELECT 
        MONTH(bc.bill_date) AS month,
        b.user_id,
        SUM(bc.item_quantity * i.item_rate) AS total_bill,
        
        DENSE_RANK() OVER (
            PARTITION BY MONTH(bc.bill_date)
            ORDER BY SUM(bc.item_quantity * i.item_rate) DESC
        ) AS rnk

    FROM booking_commercials bc
    JOIN bookings b ON bc.booking_id = b.booking_id
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY month, b.user_id
)

SELECT *
FROM bill_data
WHERE rnk = 2;