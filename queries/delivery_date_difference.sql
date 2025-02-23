SELECT 
	c.customer_state AS State,
	CAST(
		AVG(
			(julianday(STRFTIME('%Y-%m-%d', o.order_estimated_delivery_date))-
			julianday(STRFTIME('%Y-%m-%d', o.order_delivered_customer_date)))
		) AS INTEGER
		) AS Delivery_Difference 
FROM  
	olist_orders AS o
INNER JOIN 
	olist_customers AS c ON
	o.customer_id = c.customer_id
WHERE
	o.order_status = 'delivered'
	AND o.order_delivered_customer_date IS NOT NULL
GROUP BY
	c.customer_state
ORDER BY 
	Delivery_Difference ASC;