--Employee Reports
--Best Sellers
--Who are the top 5 employees for generating sales income?
select s.employee_id, 
	sum(s.price) as total_income_generated, 
	concat(e.first_name, ' ', e.last_name) as  employee_name
		from sales s
		join employees e 
		on s.employee_id = e.employee_id 
		where s.sale_returned = false 
		group by s.employee_id, employee_name
		order by total_income_generated desc
		limit 5
		
--Who are the top 5 dealership for generating sales income?
select s.dealership_id , 
	sum(s.price) as total_income_generated, 
	d.business_name 
		from sales s
		join dealerships d 
		on s.dealership_id  = d.dealership_id 
		where s.sale_returned = false 
		group by s.dealership_id , business_name
		order by total_income_generated desc
		limit 5

--Which vehicle model generated the most sales income?
select sum(s.price) as total_income_generated,
	vt.model
		from sales s
		join vehicles v 
		on s.vehicle_id = v.vehicle_id 
		join vehicletypes vt
		on v.vehicle_type_id = vt.vehicle_type_id
		where s.sale_returned = false 
		group by vt.model 
		ORDER BY total_income_generated DESC 
		LIMIT 1
	
--Top Performance
--Which employees generate the most income per dealership?

SELECT *
FROM
	(select s.employee_id,
	d.business_name,
	sum(s.price) as total_income_generated,
	concat(e.first_name, ' ', e.last_name) as employee_name,
	rank() OVER (PARTITION BY d.business_name
		ORDER BY sum(s.price) DESC
		) top_rank
		from sales s
		join employees e
		on s.employee_id = e.employee_id
		JOIN dealerships d
		ON s.dealership_id = d.dealership_id
		where s.sale_returned = false
		group by s.employee_id, employee_name, d.business_name) AS subQ
	WHERE top_rank = 1;
		
		
