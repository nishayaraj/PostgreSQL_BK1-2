--Vehicle Reports
--Inventory
--In our Vehicle inventory, show the count of each Model that is in stock.
SELECT v2.model, count(v.vehicle_type_id)
	FROM vehicles v 
	JOIN vehicletypes v2 
	ON v.vehicle_type_id = v2.vehicle_type_id
	WHERE v.is_sold = FALSE 
	GROUP BY v2.model 
	
--In our Vehicle inventory, show the count of each Make that is in stock.
SELECT v2.make , count(v.vehicle_type_id)
	FROM vehicles v 
	JOIN vehicletypes v2 
	ON v.vehicle_type_id = v2.vehicle_type_id
	WHERE v.is_sold = FALSE 
	GROUP BY v2.make 
	
--In our Vehicle inventory, show the count of each BodyType that is in stock.
SELECT v2.body_type  , count(v.vehicle_type_id)
	FROM vehicles v 
	JOIN vehicletypes v2 
	ON v.vehicle_type_id = v2.vehicle_type_id
	WHERE v.is_sold = FALSE 
	GROUP BY v2.body_type 
	
--Purchasing Power
--Which US state's customers have the highest average purchase price for a vehicle?
	SELECT c.state, round (avg(s.price), 2) AS avg_purchase_price
		FROM sales s
		JOIN customers c 
		ON s.customer_id = c.customer_id 
		GROUP BY c.state 
		ORDER BY avg_purchase_price DESC 
		
--Now using the data determined above, which 5 states have the customers with the highest average purchase price for a vehicle?
	SELECT c.state, round (avg(s.price), 2) AS avg_purchase_price
		FROM sales s
		JOIN customers c 
		ON s.customer_id = c.customer_id 
		GROUP BY c.state 
		ORDER BY avg_purchase_price DESC 
		LIMIT 5
	