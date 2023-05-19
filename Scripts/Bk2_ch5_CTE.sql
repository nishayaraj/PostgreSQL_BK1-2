--For the top 5 dealerships, which employees made the most sales?
--need verification
/*with employees_with_most_sales as 
(
	select 
		e.first_name || ' ' || e.last_name employee_name,
		count(s.sale_id) as num_of_sales,
		d.business_name
	from employees e 
	join sales s 
	on e.employee_id = s.employee_id 
	join dealerships d 
	on d.dealership_id = s.dealership_id 
	group by employee_name, business_name
	order by num_of_sales desc
)

--dealership with most sales
select s.dealership_id, count(s.sale_id) as total_sales
from sales s
group by s.dealership_id 
order by total_sales desc*/

WITH top_five_cte AS (
     SELECT 
          sales.dealership_id, 
          SUM(price) AS total_sales
     FROM sales
     GROUP BY sales.dealership_id
     ORDER BY total_sales DESC
     LIMIT 5
),
top_selling_employees AS (
     SELECT 
          sales.dealership_id,
          sales.employee_id,
          COUNT(sales.sale_id) AS num_of_sales
     FROM sales
     INNER JOIN top_five_cte
     ON sales.dealership_id = top_five_cte.dealership_id
     GROUP BY sales.dealership_id, sales.employee_id
     ORDER BY sales.dealership_id, num_of_sales DESC
),
altogether_now AS (
     SELECT
          dealerships.business_name AS business_name,
          employees.first_name || ' ' || employees.last_name AS employee_name,
          num_of_sales,
          RANK() OVER (PARTITION BY dealerships.business_name ORDER BY num_of_sales DESC)
     FROM top_selling_employees
     INNER JOIN dealerships USING (dealership_id)
     INNER JOIN employees USING (employee_id)
)
SELECT
     business_name,
     employee_name,
     num_of_sales
FROM altogether_now
WHERE rank = 1;
