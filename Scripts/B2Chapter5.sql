-- Find employees who haven't made any sales and the name of the dealership they work at.
SELECT
    e.first_name,
    e.last_name,
    d.business_name,
    s.price
FROM employees e
INNER JOIN dealershipemployees de ON e.employee_id = de.employee_id
INNER JOIN dealerships d ON d.dealership_id = de.dealership_id
LEFT JOIN sales s ON s.employee_id = e.employee_id
WHERE s.price IS NULL;

-- Get all the departments in the database,
-- all the employees in the database and the floor price of any vehicle they have sold.
SELECT
    d.business_name,
    e.first_name,
    e.last_name,
    v.floor_price
FROM dealerships d
LEFT JOIN dealershipemployees de ON d.dealership_id = de.dealership_id
INNER JOIN employees e ON e.employee_id = de.employee_id
INNER JOIN sales s ON s.employee_id = e.employee_id
INNER JOIN vehicles v ON s.vehicle_id = v.vehicle_id;

-- Use a self join to list all sales that will be picked up on the same day,
-- including the full name of customer picking up the vehicle. .
SELECT
    CONCAT  (c.first_name, ' ', c.last_name) AS last_name,
    s1.invoice_number,
    s1.pickup_date
FROM sales s1
INNER JOIN sales s2
    ON s1.sale_id <> s2.sale_id 
    AND s1.pickup_date = s2.pickup_date
INNER JOIN customers c
   ON c.customer_id = s1.customer_id;
   
 --Produce a report that lists every dealership, the number of purchases done by each, 
 --and the number of leases done by each.
SELECT d.business_name , 
       SUM(CASE WHEN s.sales_type_id = 1  THEN 1 ELSE 0 END) AS num_purchases, 
       SUM(CASE WHEN s.sales_type_id  = 2 THEN 1 ELSE 0 END) AS num_leases 
FROM sales s
INNER JOIN  dealerships d 
ON s.dealership_id = d.dealership_id 
GROUP BY business_name;

--Produce a report that determines the most popular vehicle model that is leased.
select vt.model, count(vt.model) as num_of_leases from vehicles v 
	join vehicletypes vt
	on v.vehicle_type_id = vt.vehicle_type_id 
	join sales s 
	on s.vehicle_id = v.vehicle_id 
	join salestypes st 
	on s.sales_type_id = st.sales_type_id 
	where s.sales_type_id = 2
group by vt.model 
order by num_of_leases desc 
limit 1


--What is the most popular vehicle make in terms of number of sales?
--Solution 1
select v2.make, count(v2.make) as num_of_sales from sales s
join vehicles v 
on s.vehicle_id = v.vehicle_id 
join vehicletypes v2 
on v.vehicle_type_id = v2.vehicle_type_id 
group by v2.make
order by num_of_sales desc
limit 1

--Solution 2
SELECT vt.make,COUNT (vt.make) AS Num_of_sales FROM sales s
JOIN vehicles v
ON s.vehicle_id = v.vehicle_id
JOIN vehicletypes vt
ON v.vehicle_type_id = vt.vehicle_type_id
WHERE s.price IS NOT NULL
GROUP BY vt.make
ORDER BY Num_of_sales desc
limit 1


--Which employee type sold the most of that make?
select v2.make, count(v2.make) as num_of_sales, e2.employee_type_name from sales s
join vehicles v 
on s.vehicle_id = v.vehicle_id 
join vehicletypes v2 
on v.vehicle_type_id = v2.vehicle_type_id 
join employees e 
on e.employee_id = s.employee_id 
join employeetypes e2 
on e.employee_type_id = e2.employee_type_id 
group by v2.make, e2.employee_type_name
order by num_of_sales desc
limit 1

