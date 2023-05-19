--Lease Income by Dealership
--Total Income by Employee

--Write a query that shows the total lease income per dealership.
select distinct 
	s.dealership_id,
	d.business_name,
	sum(s.price) over() total_sales,
	sum(s.price) over(partition by d.dealership_id) income_per_dealership
from 
 	sales s
join
	dealerships d 
ON 
	s.dealership_id = d.dealership_id 
where 
	s.sales_type_id = 2
order by dealership_id, business_name


--Write a query that shows the lease income per dealership for Jan of 2020.
select distinct 
	s.dealership_id,
	d.business_name,
	sum(s.price) over() total_sales,
	sum(s.price) over(partition by d.dealership_id) income_per_dealership
from 
 	sales s
join
	dealerships d 
ON 
	s.dealership_id = d.dealership_id 
where 
	s.sales_type_id = 1
and
	s.purchase_date between '2020-01-01' and '2020-01-31'
order by dealership_id, business_name

--Write a query that shows the lease income per dealership for all of 2019.
select distinct 
	s.dealership_id,
	d.business_name,
	sum(s.price) over() total_sales,
	sum(s.price) over(partition by d.dealership_id) income_per_dealership
from 
 	sales s
join
	dealerships d 
ON 
	s.dealership_id = d.dealership_id 
where 
	s.sales_type_id = 1
and
	s.purchase_date between '2010-01-01' and '2019-12-31'
order by dealership_id, business_name

--Total Income by Employee
--Write a query that shows the total income (purchase and lease) per employee.
select distinct
	e.last_name || ', ' || e.first_name employee_name,
	s.employee_id,
	sum(s.price) over() total_sales,
	sum(s.price) over(partition by e.employee_id) total_employee_sales
from
	employees e
join
	sales s 
on
	s.employee_id = e.employee_id
where 
	s.sales_type_id != 3
order by employee_name
