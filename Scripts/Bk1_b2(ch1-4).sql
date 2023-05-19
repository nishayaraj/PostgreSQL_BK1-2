INSERT INTO 
	public.salestypes(sales_type_name) 
VALUES 
	('Rent');
	
select 
	* 
from 
	oilchangelogs o 
	
INSERT INTO 
public.sales(sales_type_id, vehicle_id, employee_id, dealership_id, price, invoice_number)
VALUES 
(3, 21, 12, 7, 55999, 123477289),
(3, 14, 3, 7, 19999, 232727349),
(3, 6, 75, 7, 39500, 8635482010);

	
INSERT INTO 
public.customers(first_name ,last_name)
VALUES 
('John', 'Doe'),
('Pam', 'On');

insert into 
public.vehicletypes (body_type, make, model)
VALUES('SUV','Kia','Telluride');

insert into 
public.vehicles(vehicle_type_id, floor_price, miles_count)
values(31, 45000, 100);

INSERT INTO 
public.employees (first_name, last_name, email_address ,phone ,employee_type_id)
VALUES 
('Kennie', 'Maharg', 'kmaharge@com.com', '598-678-4885', 4);

INSERT INTO 
public.dealershipemployees(dealership_id ,employee_id)
VALUES 
(3,1003);

SELECT
    v.engine_type,
    v.floor_price,
    v.msr_price
FROM Vehicles v;

--Write a query that returns the business name, city, state, and website for each dealership. Use an alias for the Dealerships table.

select 
	d.business_name,
	d.city,
	d.state,
	d.website
from
    dealerships d 
    
--Write a query that returns the first name, last name, and email address of every customer.
select 
	 c.first_name,
	 c.last_name,
	 c.email
from 
	 customers c 

--Get a list of sales records where the sale was a lease.
select 
	* 
from 
	sales s 
where 
	s.sales_type_id  = 2;

--Get a list of sales where the purchase date is within the last five years.
SELECT
	*
FROM
	sales s 
WHERE
	purchase_date  BETWEEN '2019-01-01' and '2023-01-01';

--Get a list of sales where the deposit was above 5000 or the customer payed with American Express.
select 
	*
from 
	sales s
where 
	s.deposit > 5000 or s.payment_method = 'americanexpress';

--Get a list of employees whose first names start with "M" or ends with "d".
select *
from employees e
where e.first_name like 'M%' or  e.first_name like '%d';

--Get a list of employees whose phone numbers have the 604 area code.
select 
 *
from 
employees e 
where 
e.phone like '604%';

--1. Get a list of the sales that were made for each sales type.
select *
from salestypes s
inner join sales s2
on s.sales_type_id = s2.sales_type_id 

--2. Get a list of sales with the VIN of the vehicle, the first name and last name of the customer, first name and last name of the employee who made the sale and the name, city and state of the dealership.
select 
	v.vin,
	c.first_name as customerFirstName, 
	c.last_name as customerLastName, 
	e.first_name as employeeFirstName, 
	e.last_name as employeeLastName, 
	d.business_name, 
	d.city, 
	d.state 
from
	vehicles v 
join
	sales s 
on
	s.vehicle_id = v.vehicle_id 
join 
	customers c 
on
	s.customer_id = c.customer_id 
join 
	employees e
on
	e.employee_id = s.employee_id 
join
	dealerships d
on
	d.dealership_id = s.dealership_id ;
	
--3. Get a list of all the dealerships and the employees, if any, working at each one.
select 
	d.business_name, e.first_name, e.last_name
from 
	dealerships d 
join 
	dealershipemployees d2 
on  
	d.dealership_id = d2.dealership_id 
join 
	employees e 
on
	d2.employee_id = e.employee_id

--
--4. Get a list of vehicles with the names of the body type, make, model and color.
select  
	v.body_type, v.make, v.model, v2.exterior_color
from 
	vehicletypes v 
right join 
	vehicles v2 
on 
	v.vehicle_type_id = v2.vehicle_type_id 

