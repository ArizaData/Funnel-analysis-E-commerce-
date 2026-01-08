-- calculate the number of users who are repeat purchasers and the revenue generated
-- output was brought to power bi to generate visual
WITH user_orders AS (
SELECT 
	user_id,
	COUNT(order_id) AS num_orders,
	SUM(total_amount) AS total_revenue
FROM orders
WHERE order_status = 'completed'
GROUP BY user_id
)
SELECT 
	COUNT(*) AS repeat_purchasers,
	SUM(total_revenue) AS repeat_purchasers_revenue
FROM user_orders
WHERE num_orders > 1;
