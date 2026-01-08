-- This query creates flags for the user funnel along with conversions for each stage
-- The output dataset was put into power bi to create a dashboard visual
WITH user_events AS (
    SELECT
        user_id,
        MAX(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS viewed,
        MAX(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS carted
    FROM events
    GROUP BY user_id
),
-- using completed orders to get true purchase conversions
user_orders AS (
    SELECT
        user_id,
        1 AS purchased,
        SUM(total_amount) AS revenue
    FROM orders
    WHERE order_status = 'completed'
    GROUP BY user_id
)
SELECT
-- counts users at each stage of funnel
    COUNT(DISTINCT u.user_id) AS total_users,
    SUM(ue.viewed) AS viewed_users,
    SUM(ue.carted) AS carted_users,
    COUNT(uo.user_id) AS purchased_users,
    -- Calculate Conversion rates from users at each stage
    ROUND(SUM(ue.viewed)*100.0/COUNT(DISTINCT u.user_id),1) AS view_pct,
    ROUND(SUM(ue.carted)*100.0/COUNT(DISTINCT u.user_id),1) AS cart_pct,
    ROUND(COUNT(uo.user_id)*100.0/COUNT(DISTINCT u.user_id),1) AS purchase_pct,
    -- total Revenue and AOV
    ROUND(SUM(uo.revenue),2) AS total_revenue,
    ROUND(SUM(uo.revenue)/COUNT(DISTINCT u.user_id),2) AS Avg_revenue_per_user,
    ROUND(SUM(uo.revenue)/COUNT(uo.user_id),2) AS AOV
FROM users u
LEFT JOIN user_events ue ON u.user_id = ue.user_id
LEFT JOIN user_orders uo ON u.user_id = uo.user_id;
