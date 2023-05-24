--What are the top 5 US states with the most customers who have purchased a vehicle from a dealership participating in the Carnival platform?
select  c.state, count(*) as customer_total
from customers c
join sales s 
on c.customer_id = s.customer_id 
where s.sales_type_id = 1
group by c.state
order by customer_total desc
limit 5

--What are the top 5 US zipcodes with the most customers who have purchased a vehicle from a dealership participating in the Carnival platform?
select  c.zipcode , count(*) as customer_total
from customers c
join sales s 
on c.customer_id = s.customer_id 
where s.sales_type_id = 1
group by c.zipcode 
order by customer_total desc
limit 5

--What are the top 5 dealerships with the most customers?

select s.dealership_id, count(*) as customer_total
from customers c
join sales s 
on c.customer_id = s.customer_id 
group by s.dealership_id 
order by customer_total desc
limit 5
