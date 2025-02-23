SELECT 
	pc.product_category_name_english as Category,
	count(DISTINCT o.order_id) as Num_order,
	SUM(p.payment_value) AS Revenue
FROM 
	olist_orders AS o
INNER JOIN 
	olist_order_items AS oi ON 
	o.order_id = oi.order_id
INNER JOIN 
	olist_products AS pr ON 
	oi.product_id = pr.product_id 
INNER JOIN
	product_category_name_translation AS pc ON 
	pc.product_category_name = pr.product_category_name 
INNER JOIN
	olist_order_payments AS p ON
	oi.order_id = p.order_id 
WHERE 
	o.order_status = 'delivered' AND 
	o.order_delivered_customer_date IS NOT NULL AND 
	pr.product_category_name IS NOT NULL
GROUP BY 
	pc.product_category_name_english
ORDER BY 
	Revenue ASC
LIMIT
	10;
