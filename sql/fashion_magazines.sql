-- SELECT * from subscriptions;
-- SELECT * from customers;
-- SELECT * from orders;


WITH subs AS (
    select subscription_id from subscriptions WHERE description = 'Fashion Magazine'
)
SELECT DISTINCT c.customer_name
FROM customers c, orders o
WHERE c.customer_id = o.customer_id
AND o.order_status = 'unpaid'
AND o.subscription_id in subs;
