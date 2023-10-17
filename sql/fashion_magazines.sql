SELECT c.customer_name as "Customer", PRINTF("$%.2f",SUM(s.subscription_length * s.price_per_month)) AS "Amount Due"
FROM orders o
INNER JOIN customers c
  ON o.customer_id = c.customer_id
INNER JOIN subscriptions s 
  ON o.subscription_id = s.subscription_id
WHERE s.description = 'Fashion Magazine'
AND o.order_status = 'unpaid'
GROUP BY c.customer_name; 
