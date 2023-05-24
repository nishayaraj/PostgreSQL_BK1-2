--To create a view for employees and the dealerships they work at:
CREATE VIEW employee_dealership_names AS
  SELECT 
    e.first_name,
    e.last_name,
    d.business_name
  FROM employees e
  INNER JOIN dealershipemployees de ON e.employee_id = de.employee_id
  INNER JOIN dealerships d ON d.dealership_id = de.dealership_id;
  
 
 
-- Now that the view is created, whenever you need to access this data, you can just run the following select statement:
SELECT
	*
FROM
	employee_dealership_names;
	
--Create a view that lists all vehicle body types, makes and models.
create view vehicle_type_filtered_data 
	as
	select 
	v.body_type,
	v.model,
	v.make 
	from vehicletypes v 

SELECT
	*
FROM
	vehicle_type_filtered_data ;

--Create a view that shows the total number of employees for each employee type.
create view employee_type_number as
	select count(e2.employee_id), e.employee_type_name  from employees e2 
	join employeetypes e 
	on e.employee_type_id = e2.employee_type_id 
	group by e.employee_type_name

SELECT
	*
FROM
	employee_type_number ;

--Create a view that lists all customers without exposing their emails, phone numbers and street address.
create view customer_names as
	select first_name, last_name 
	from customers 

select * from customer_names

--Create a view named sales2018 that shows the total number of sales for each sales type for the year 2018.
create view sales2018 as
	select st.sales_type_name, count(s.sales_type_id) 
	from salestypes st
	join sales s
	on s.sales_type_id = st.sales_type_id 
	where s.purchase_date between '2018-01-01' and '2018-12-31'
	group by st.sales_type_name

select * from sales2018

--Create a view that shows the employee at each dealership with the most number of sales.
--modify to find max
--(select count(sale_id) as number_of_sales, employee_id, dealership_id
--from sales
--group by employee_id, dealership_id 
--order by number_of_sales desc) as sales_per_employee



