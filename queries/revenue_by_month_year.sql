SELECT 
	uo.month_no,
	CASE uo.month_no
		WHEN '01' THEN 'Jan'
	    WHEN '02' THEN 'Feb'
	    WHEN '03' THEN 'Mar'
	    WHEN '04' THEN 'Apr'
	    WHEN '05' THEN 'May'
	    WHEN '06' THEN 'Jun'
	    WHEN '07' THEN 'Jul'
	    WHEN '08' THEN 'Aug'
	    WHEN '09' THEN 'Sep'
	    WHEN '10' THEN 'Oct'
	    WHEN '11' THEN 'Nov'
	    WHEN '12' THEN 'Dec'
	END AS month, 
	SUM(CASE WHEN uo.order_year = '2016' THEN uo.order_payment_value ELSE 0.00 END) AS Year2016,
	SUM(CASE WHEN uo.order_year = '2017' THEN uo.order_payment_value ELSE 0.00 END) AS Year2017,
	SUM(CASE WHEN uo.order_year = '2018' THEN uo.order_payment_value ELSE 0.00 END) AS Year2018
FROM (
   	SELECT DISTINCT 
   		op.order_id,	
	   	STRFTIME('%m', o.order_delivered_customer_date) AS month_no,
	   	STRFTIME('%Y', o.order_delivered_customer_date) AS order_year,
	    (op.payment_value) AS order_payment_value
 	FROM 
     	olist_orders AS o
 	INNER JOIN 
     	olist_order_payments AS op ON
     	o.order_id = op.order_id 
 	WHERE 
 		o.order_status = 'delivered' AND 
 		o.order_delivered_customer_date IS NOT NULL
   	GROUP BY 
   		op.order_id
) AS uo 
WHERE 
   	uo.month_no IS NOT NULL
GROUP BY
	month_no;