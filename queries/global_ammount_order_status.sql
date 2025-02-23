SELECT 
	o.order_status,
	COUNT(o.order_status) AS Ammount 
FROM 
	olist_orders AS o
GROUP BY 
	o.order_status; 