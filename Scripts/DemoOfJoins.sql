* Demo of Joins */
SELECT 
--*
     po.OwnerID,
     po.OwnerName,
--     d.*
     c.*
--     c.catname,
--     vcc.*
--     vcc.VetClinicCustomerId
--     ,vc.ClinicName
FROM PetOwners po
-- INNER JOIN Cats c ON c.OwnerId = po.OwnerId -- 4 rows, No owenerId = 2
-- LEFT JOIN Cats c ON c.OwnerId = po.OwnerId  -- 5 rows; OwnerId = 2 
-- LEFT JOIN VetClinicCustomers vcc ON vcc.CustomerId = po.OwnerId
-- RIGHT JOIN VetClinics vc ON vc.VetClinicId = vcc.VetClinicId
-- FULL OUTER JOIN Dogs d ON d.OwnerID = po.OwnerId
 FULL OUTER JOIN Cats c ON c.OwnerID = po.OwnerId


/*WHERE CLause */
SELECT 
CONCAT(d.dogname, '', d.color) as DogInfo,
d.dogId as DogNumber
FROM Dogs d
-- WHERE dogname = 'Lady'
-- WHERE dogname LIKE '%L%'
-- WHERE d.dogname LIKE '%L%' AND color = 'Brown'
ORDER BY d.dogid DESC 
--LIMIT 1
