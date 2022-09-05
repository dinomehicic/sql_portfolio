use retail_data;

-- This is a showcase of different queries within SQL.
-- Data is randomly generated and fictional, essential
-- queries are displayed for portfolio purposes.

-- Pull the amount of times a customer ordered 3 items

SELECT COUNT(*) as total_num
from tr_orderdetails
where Quantity = 3;

-- Show the full name of the PropertyCity with orders placed

SELECT  orderID, OrderDate, tr_propertyinfo.PropertyCity
FROM tr_orderdetails
JOIN tr_propertyinfo
ON tr_orderdetails.PropertyID = tr_propertyinfo.PropID;

-- Count how many times Orlando was the location for the order

SELECT COUNT(*) as Orlando_Orders
FROM tr_orderdetails
JOIN tr_propertyinfo
ON tr_orderdetails.PropertyID = tr_propertyinfo.PropID
WHERE PropertyCity = 'Orlando';

-- Pull orders where OrderID is between 500 and 675

SELECT *
FROM tr_orderdetails
WHERE OrderID BETWEEN 500 AND 675;

-- Pull all products from tr_products where Price
-- is greater than 50 and ProductCategory is Maintenance

SELECT *
FROM tr_products
WHERE Price > 50 AND ProductCategory = 'Maintenance';

-- Find average Price of all products in Housekeeping

SELECT AVG(Price) AS hk_avg_price
FROM tr_products
Where ProductCategory = 'Housekeeping';

-- Change the Price of ProductID 4 to 35

UPDATE tr_products
SET Price = 35 WHERE ProductID = 4;

-- What state has the most stores

SELECT PropertyState, COUNT(*) AS stores
FROM tr_propertyinfo
GROUP BY PropertyState
ORDER BY stores DESC;

-- Find which product is the best seller

SELECT ProductID, SUM(Quantity) AS total_amount
FROM tr_orderdetails
GROUP BY ProductID
ORDER BY total_amount DESC;

-- How many orders are not from Housekeeping
-- or maintenance

SELECT COUNT(*) as total_orders
FROM tr_orderdetails
JOIN tr_products
ON tr_orderdetails.ProductID = tr_products.ProductID
WHERE ProductCategory != 'Housekeeping' OR 'Maintenance';