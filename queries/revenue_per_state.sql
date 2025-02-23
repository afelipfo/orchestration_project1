SELECT
	c.customer_state,
	SUM(p.payment_value) AS Revenue
FROM 
	olist_customers AS c 
INNER JOIN 
	olist_orders AS o ON 
	c.customer_id = o.customer_id 
INNER JOIN 
	olist_order_payments AS p ON 
	o.order_id = p.order_id 
WHERE 
	o.order_status = 'delivered' AND 
	o.order_delivered_customer_date IS NOT NULL
GROUP BY 
	c.customer_state 
ORDER BY 
	Revenue DESC 
LIMIT 
	10;