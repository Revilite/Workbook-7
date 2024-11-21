USE dealership;
-- 1.
SELECT * FROM dealerships;

-- 2.  TODO: Find a better way to do this 
SELECT inventory_id, dealership_id, vehicles.vin, year, make, model, vehicle_type, color odometer, price, sold FROM inventory
RIGHT JOIN vehicles ON vehicles.vin = inventory.vin
WHERE dealership_id = 1;

-- 3
SELECT * FROM vehicles
WHERE vin = 101261;

-- 4
SELECT inventory_id, inventory.dealership_id, vin, name, address, phone FROM inventory -- use simple name if the name is not ambiguous  
JOIN dealerships ON dealerships.dealership_id = inventory.dealership_id -- default inner join 
WHERE vin = 101240;

-- 5
SELECT inventory_id, inventory.dealership_id, inventory.vin, name, address, phone FROM inventory
JOIN dealerships ON dealerships.dealership_id = inventory.dealership_id
JOIN vehicles ON vehicles.vin = inventory.vin
WHERE vehicles.color LIKE "Red"
AND vehicles.make  LIKE "Pagani" 
AND vehicles.model  LIKE "Huayra";

-- 6
 SELECT * FROM sales_contract
 JOIN inventory ON inventory.vin = sales_contract.vin
 JOIN dealerships ON dealerships.dealership_id = inventory.dealership_id
 WHERE dealerships.dealership_id = 3
 AND date BETWEEN "2024-10-1" AND "2024-11-1";

