-- Quantigration RMA Analytical Queries
-- KPI reporting and business analysis

-- =====================================
-- 1. Sales Volume by State
-- =====================================

SELECT 
    State,
    COUNT(*) AS Sales_Count
FROM Collaborator
GROUP BY State
ORDER BY Sales_Count DESC;


-- =====================================
-- 2. Total Returns Company-Wide
-- =====================================

SELECT 
    COUNT(*) AS Total_Returns
FROM RMA;


-- =====================================
-- 3. Returns by Product (SKU)
-- =====================================

SELECT 
    Orders.SKU,
    COUNT(*) AS Return_Count
FROM Orders
INNER JOIN RMA 
    ON Orders.Order_ID = RMA.Order_ID
GROUP BY Orders.SKU
ORDER BY Return_Count DESC;


-- =====================================
-- 4. Return Percentage by Product
-- =====================================

SELECT 
    Orders.SKU,
    COUNT(RMA.RMAID) AS Return_Count,
    COUNT(Orders.Order_ID) AS Total_Orders,
    ROUND(
        (COUNT(RMA.RMAID) / COUNT(Orders.Order_ID)) * 100, 
        2
    ) AS Return_Percentage
FROM Orders
LEFT JOIN RMA
    ON Orders.Order_ID = RMA.Order_ID
GROUP BY Orders.SKU
ORDER BY Return_Percentage DESC;


-- =====================================
-- 5. Returns by State
-- =====================================

SELECT 
    Collaborator.State,
    COUNT(RMA.RMAID) AS Return_Count
FROM Collaborator
INNER JOIN Orders
    ON Collaborator.Collaborator_ID = Orders.Collaborator_ID
INNER JOIN RMA
    ON Orders.Order_ID = RMA.Order_ID
GROUP BY Collaborator.State
ORDER BY Return_Count DESC;
