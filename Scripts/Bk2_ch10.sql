--Available Models
--Ans explained: Atlas has lowest inventory(is_sold = false), Maxima has the highest not sold vehicle models
--Which model of vehicle has the lowest current inventory? This will help dealerships know which models the purchase from manufacturers.

select 
	count(v.is_sold) as leftover_inventory, v2.model
from 
	vehicles v
join 
	vehicletypes v2 
on 
	v.vehicle_type_id = v2.vehicle_type_id 
where 
	is_sold = false
group by 
	is_sold, v2.model
order by 
	leftover_inventory asc 
limit 1


--Which model of vehicle has the highest current inventory? This will help dealerships know which models are, perhaps, not selling.

select 
	count(v.is_sold) as not_sold, v2.model
from 
	vehicles v
join 
	vehicletypes v2 
on 
	v.vehicle_type_id = v2.vehicle_type_id 
where 
	is_sold = false
group by 
	is_sold , v2.model
order by 
	not_sold desc
limit 1

--Diverse Dealerships 
--Which dealerships are currently selling the least number of vehicle models? This will let dealerships market vehicle models more effectively per region.
SELECT
  d.business_name,
  v2.model AS vehicle_model,
  COUNT(v2.model) AS model_count,
  COUNT(v.is_sold) AS models_sold
FROM
  vehicles v
JOIN
  vehicletypes v2 ON v.vehicle_type_id = v2.vehicle_type_id
JOIN
  dealerships d ON d.dealership_id = v.dealership_location_id
GROUP BY
  d.business_name,
  v2.model
ORDER BY
  models_sold ASC;
	
 
--Which dealerships are currently selling the highest number of vehicle models? This will let dealerships know which regions have either a high population, or less brand loyalty.

SELECT
  d.business_name,
  v2.model AS vehicle_model,
  COUNT(v2.model) AS model_count,
  COUNT(v.is_sold) AS models_sold
FROM
  vehicles v
JOIN
  vehicletypes v2 ON v.vehicle_type_id = v2.vehicle_type_id
JOIN
  dealerships d ON d.dealership_id = v.dealership_location_id
GROUP BY
  d.business_name,
  v2.model
ORDER BY
  models_sold DESC;
 
/*select distinct 
 d.business_name,
  v2.model AS vehicle_model,
  COUNT(v.is_sold) over (partition by d.business_name)models_sold
  FROM
  vehicles v
JOIN
  vehicletypes v2 ON v.vehicle_type_id = v2.vehicle_type_id
JOIN
  dealerships d ON d.dealership_id = v.dealership_location_id
order by 
	business_name*/


	
		
