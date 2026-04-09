-- Q1: Revenue by sales channel
SELECT sales_channel, SUM(amount) AS revenue
FROM clinic_sales
WHERE strftime('%Y', datetime) = '2021'
GROUP BY sales_channel;

-- Q2: Top 10 customers
SELECT uid, SUM(amount) AS total_spent
FROM clinic_sales
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;

-- Q3: Monthly revenue, expense, profit
SELECT 
month,
revenue,
expense,
(revenue - expense) AS profit,
CASE 
    WHEN (revenue - expense) > 0 THEN 'Profit'
    ELSE 'Loss'
END AS status
FROM (
    SELECT 
        strftime('%m', cs.datetime) AS month,
        SUM(cs.amount) AS revenue,
        (SELECT SUM(e.amount)
         FROM expenses e
         WHERE strftime('%m', e.datetime) = strftime('%m', cs.datetime)
        ) AS expense
    FROM clinic_sales cs
    GROUP BY month
);

-- Q4: Most profitable clinic per city
SELECT *
FROM (
    SELECT c.city, cs.cid, SUM(cs.amount) AS revenue,
           RANK() OVER (PARTITION BY c.city ORDER BY SUM(cs.amount) DESC) rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    GROUP BY c.city, cs.cid
)
WHERE rnk = 1;

-- Q5: Second least profitable clinic per state
SELECT *
FROM (
    SELECT c.state, cs.cid, SUM(cs.amount) AS revenue,
           RANK() OVER (PARTITION BY c.state ORDER BY SUM(cs.amount)) rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    GROUP BY c.state, cs.cid
)
WHERE rnk = 2;

