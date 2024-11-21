DROP DATABASE IF EXISTS dealership;

CREATE DATABASE dealership;
USE dealership;

CREATE TABLE `dealerships`(
	`dealership_id` INT AUTO_INCREMENT,
    `name` VARCHAR(50),
    `address` VARCHAR(50),
    `phone` VARCHAR(12),
    PRIMARY KEY (dealership_id)
    );

INSERT INTO dealerships VALUES(null, 'D & B Used Cars', '111 Old Benbrook Rd', '817-555-5555');
INSERT INTO dealerships VALUES(null, 'Scott Clark Toyota', '13052 Marie Garris Rd', '855-314-6444');
INSERT INTO dealerships VALUES(null, 'Keffer Hyundai', '9010 E Independence Blvd', '704-343-8238');


CREATE TABLE `vehicles`(
    `vin` INT,
    `year` INT,
    `make` VARCHAR(30),
    `model` VARCHAR(30),
    `vehicle_type` VARCHAR(10),
    `color` VARCHAR(10),
    `odometer` INT,
    `price` DECIMAL(10, 2),
    `sold` BOOL, 
    PRIMARY KEY(vin)
);

INSERT INTO vehicles VALUES(101234, 1993, 'Porsche', 'GT3-RS', 'Hypercar', 'Yellow', 1500, 265000.00, 0);
INSERT INTO vehicles VALUES(101240, 2009, 'Toyota', 'Corolla', 'Car', 'Silver', 201000, 5000.00, 0);
INSERT INTO vehicles VALUES(101261, 2022, 'Aston Martin', 'Valhalla', 'Hypercar', 'Orange', 50, 2050000.00, 0);
INSERT INTO vehicles VALUES(101257, 2022, 'Pagani', 'Huayra', 'Hypercar', 'Red', 1000, 3050000.00, 0);
INSERT INTO vehicles VALUES(101258, 2023, 'Koenigsegg', 'Gemera', 'Hypercar', 'Red', 100, 1800000.00, 0);


CREATE TABLE `inventory`(
	`inventory_id` INT AUTO_INCREMENT,
    `dealership_id` INT,
    `vin` INT,
    PRIMARY KEY(inventory_id), 
    FOREIGN KEY(vin) REFERENCES vehicles(vin),
    FOREIGN KEY(dealership_id) REFERENCES dealerships(dealership_id)
);

INSERT INTO inventory VALUES (null, 1, 101234);
INSERT INTO inventory VALUES (null, 2, 101240);
INSERT INTO inventory VALUES (null, 1, 101261);
INSERT INTO inventory VALUES (null, 3, 101257);
INSERT INTO inventory VALUES (null, 3, 101258);

CREATE TABLE `sales_contract`(
    `sales_contract_id` INT NOT NULL AUTO_INCREMENT,
    `sales_tax_amount` DECIMAL(10, 2),
    `recording_fee` DECIMAL(6, 2),
    `processing_fee` DECIMAL(6, 2),
    `total_price` DECIMAL(10, 2),
    `date` DATE,
    `customer_name` VARCHAR(50),
    `customer_email` VARCHAR(50),
    `vin` INT,
    `is_financing` BOOL,

    PRIMARY KEY (sales_contract_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)

);

INSERT INTO sales_contract VALUES(null, 1525000.00, 100.00, 491.00, 21350000.00, '2024-10-31', 'Jacob Lockhart', 'prcooder165@gmail.com', 101257, 0);
INSERT INTO sales_contract VALUES(null, 2050000.00, 100.00, 630.00, 2370000.00, '2024-11-03', 'Jacob Lockhart', 'prcooder165@gmail.com', 101261, 0);
INSERT INTO sales_contract VALUES(null, 5000.00, 100.00, 115.00, 7500.00, '2024-11-10', 'Jacob Lockhart', 'prcooder165@gmail.com', 101257, 0);
