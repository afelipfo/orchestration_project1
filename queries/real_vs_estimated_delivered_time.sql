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
	AVG(CASE WHEN uo.order_year = '2016' THEN uo.real_time ELSE NULL END) AS Year2016_real_time,
	AVG(CASE WHEN uo.order_year = '2017' THEN uo.real_time ELSE NULL END) AS Year2017_real_time,
	AVG(CASE WHEN uo.order_year = '2018' THEN uo.real_time ELSE NULL END) AS Year2018_real_time,
	AVG(CASE WHEN uo.order_year = '2016' THEN uo.estimated_time ELSE NULL END) AS Year2016_estimated_time,
	AVG(CASE WHEN uo.order_year = '2017' THEN uo.estimated_time ELSE NULL END) AS Year2017_estimated_time,
	AVG(CASE WHEN uo.order_year = '2018' THEN uo.estimated_time ELSE NULL END) AS Year2018_estimated_time
FROM (
	SELECT DISTINCT 
	    o.order_id,    
	    STRFTIME('%m', o.order_purchase_timestamp) AS month_no,
	    STRFTIME('%Y', o.order_purchase_timestamp) AS order_year,
	    (JULIANDAY(o.order_delivered_customer_date) - JULIANDAY(o.order_purchase_timestamp)) AS real_time,
	    (JULIANDAY(o.order_estimated_delivery_date) - JULIANDAY(o.order_purchase_timestamp)) AS estimated_time
	FROM
	    olist_orders AS o
	WHERE 
	    o.order_status = 'delivered' AND 
	    o.order_delivered_customer_date IS NOT NULL
) AS uo 
GROUP BY
	uo.month_no
ORDER BY uo.month_no ASC;