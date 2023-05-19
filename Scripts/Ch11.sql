--Employee Reports

--How many emloyees are there for each role?
select 
	count(e.employee_type_id), e2.employee_type_name
from
	employees e 
join
	employeetypes e2 
on 
	e.employee_type_id = e2.employee_type_id 
group by 
	e.employee_type_id, e2.employee_type_name 

--How many finance managers work at each dealership?
	--dealershipemployees
	--employees
	--employeetypes
	-- finance managers - employeetypeid =2
	select 
		de.dealership_id, 
		count(e.employee_type_id) as num_of_finance_managers
	from
		dealershipemployees de 
	join
		employees e 
	on 
		e.employee_id = de.employee_id 
	where 
		e.employee_type_id = 2
	group by 
		dealership_id 
	order by 
		dealership_id asc
		
--Get the names of the top 3 employees who work shifts at the most dealerships?
		select 
			concat(e.first_name,' ' ,e.last_name) employee_name,
			count(de.dealership_id) as num_of_dealerships
			
		from 
			employees e 
		join
			dealershipemployees de 
		on
			e.employee_id = de.employee_id 
		group by 
			employee_name
		order by 
			 num_of_dealerships desc
		limit 3
		
--Get a report on the top two employees who has made the most sales through leasing vehicles.
		--employeeid
		--salestypeid
	select 
		s.employee_id,
		count(s.sales_type_id) as num_of_lease_sales
	from
		sales s
	where
		s.sales_type_id = 2
	group by 
		employee_id
	order by 
		num_of_lease_sales desc
	limit 2