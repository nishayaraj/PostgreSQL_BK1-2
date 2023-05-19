--Purchase Income by Dealership

--Write a query that shows the total purchase sales income per dealership.
--This query shows the total sales and income per dealership.
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
order by dealership_id, business_name

--This query shows total sales where sales_type_id = 1 (purchase) and income per dealership based on purchases
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
order by dealership_id, business_name


--Write a query that shows the purchase sales income per dealership for July of 2020.	
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
	s.purchase_date between '2020-07-01' and '2020-07-31'
order by dealership_id, business_name

--Write a query that shows the purchase sales income per dealership for all of 2020.
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
	s.purchase_date between '2020-01-01' and '2020-12-31'
order by dealership_id, business_name
