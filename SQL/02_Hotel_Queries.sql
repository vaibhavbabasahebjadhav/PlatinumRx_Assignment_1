-- Q1: Last booked room per user
SELECT user_id, room_no
FROM bookings b1
WHERE booking_date = (
    SELECT MAX(booking_date)
    FROM bookings b2
    WHERE b1.user_id = b2.user_id
);

-- Q2: Total billing in Nov 2021
SELECT bc.booking_id,
SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y-%m', bc.bill_date) = '2021-11'
GROUP BY bc.booking_id;

-- Q3: Bills > 1000 in Oct
SELECT bc.bill_id,
SUM(bc.item_quantity * i.item_rate) AS total_bill
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%Y-%m', bc.bill_date) = '2021-10'
GROUP BY bc.bill_id
HAVING total_bill > 1000;

-- Q4: Most and least ordered item per month
SELECT *
FROM (
    SELECT 
        strftime('%m', bill_date) AS month,
        item_id,
        SUM(item_quantity) AS total_qty,
        RANK() OVER (PARTITION BY strftime('%m', bill_date) ORDER BY SUM(item_quantity) DESC) AS rnk_high,
        RANK() OVER (PARTITION BY strftime('%m', bill_date) ORDER BY SUM(item_quantity)) AS rnk_low
    FROM booking_commercials
    GROUP BY month, item_id
)
WHERE rnk_high = 1 OR rnk_low = 1;

-- Q5: Second highest bill per month
SELECT *
FROM (
    SELECT 
        bill_id,
        SUM(item_quantity * item_rate) AS total,
        RANK() OVER (PARTITION BY strftime('%m', bill_date) ORDER BY SUM(item_quantity * item_rate) DESC) AS rnk
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    GROUP BY bill_id
)
WHERE rnk = 2;