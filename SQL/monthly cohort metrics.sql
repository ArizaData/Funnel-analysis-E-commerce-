-- Monthly cohort funnel and revenue analysis to analyze user sign up trends
-- output was brought into power bi to generate visual
WITH user_cohorts AS (
    -- Assign each user to a cohort based on signup month
    SELECT
        user_id,
        DATE_FORMAT(signup_date, '%Y-%m') AS signup_month
    FROM users
),
 -- Aggregate event metrics per signup month
cohort_events AS (
SELECT uc.signup_month,
        COUNT(DISTINCT CASE WHEN e.event_type = 'view' THEN e.user_id END) AS viewed_users,
        COUNT(DISTINCT CASE WHEN e.event_type = 'cart' THEN e.user_id END) AS carted_users
FROM user_cohorts uc
	LEFT JOIN events e
        ON uc.user_id = e.user_id
    GROUP BY uc.signup_month
),
cohort_orders AS (
    -- Aggregate purchase metrics per signup month
    SELECT
        uc.signup_month,
        COUNT(DISTINCT o.user_id) AS purchasing_users,
        COUNT(o.order_id) AS total_orders,
        SUM(o.total_amount) AS total_revenue,
        ROUND(SUM(o.total_amount)/NULLIF(COUNT(o.order_id),0),2) AS avg_order_value,
        ROUND(SUM(o.total_amount)/NULLIF(COUNT(DISTINCT o.user_id),0),2) AS avg_revenue_per_user
    FROM user_cohorts uc
    LEFT JOIN orders o
        ON uc.user_id = o.user_id
       AND o.order_status = 'completed'
    GROUP BY uc.signup_month
)
-- Combine events and order metrics for each cohort
SELECT
    co.signup_month AS "Signup Month",
    ce.viewed_users AS "Users Viewed",
    ce.carted_users AS "Users Added to Cart",
    co.purchasing_users AS "Users Purchased",
    co.total_orders AS "Total Orders",
    co.total_revenue AS "Total Revenue",
    co.avg_order_value AS "Average Order Value",
    co.avg_revenue_per_user AS "Average Revenue per User",
    ROUND(ce.carted_users * 100.0 / ce.viewed_users,1) AS "Cart Conversion %",
    ROUND(co.purchasing_users * 100.0 / ce.viewed_users,1) AS "Purchase Conversion %"
FROM cohort_orders co
LEFT JOIN cohort_events ce
    ON co.signup_month = ce.signup_month
ORDER BY co.signup_month;
