-- Quantigration RMA Data Export
-- Demonstrates extraction of structured data for reporting or downstream systems

-- =====================================
-- 1. Export Orders Table to CSV
-- =====================================

SELECT *
FROM Orders
INTO OUTFILE '/home/codio/workspace/Orders_Export.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';


-- =====================================
-- 2. Export Return Summary by Product
-- =====================================

SELECT 
    Orders.SKU,
    COUNT(RMA.RMAID) AS Return_Count
FROM Orders
LEFT JOIN RMA
    ON Orders.Order_ID = RMA.Order_ID
GROUP BY Orders.SKU
INTO OUTFILE '/home/codio/workspace/Return_Summary.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';
