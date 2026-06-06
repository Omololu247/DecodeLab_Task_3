SELECT *
FROM Dataset

SELECT OrderID, 
Date, TotalPrice
FROM Dataset;

--HIGH VALUE SALES
SELECT *
FROM Dataset
WHERE TotalPrice > 1500;


--FILTERS BY REFERRAL SOURCES
SELECT *
FROM Dataset
WHERE ReferralSource = 'Instagram';


--FILTERS BY DATE
SELECT *
FROM Dataset
WHERE Date >= '2024-01-01';



--HIGHEST SALES
SELECT OrderID, TotalPrice
FROM Dataset
ORDER BY TotalPrice DESC;


--TOTAL NUMBERS OF ORDERS
SELECT COUNT(*) AS total_orders
FROM Dataset;


--TOTAL REVENUE
SELECT SUM(TotalPrice) AS total_sales
FROM Dataset;


--AVERAGE SALES VALUE
SELECT AVG(TotalPrice) AS avg_sales
FROM Dataset;



--SALES BY REFERRAL SOURCES
SELECT ReferralSource,
       SUM(TotalPrice) AS total_sales
FROM Dataset
GROUP BY ReferralSource
ORDER BY total_sales DESC;


--NUMBER OF ORDERS BY SOURCES
SELECT ReferralSource,
       COUNT(OrderID) AS total_orders
FROM Dataset
GROUP BY ReferralSource;



--MONTHLY SALES TRENDS
SELECT 
    FORMAT(Date, 'yyyy-MM') AS month,
    SUM(TotalPrice) AS monthly_sales
FROM Dataset
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY month;

--TOP 10 HIGHEST SALES
SELECT TOP 10 *
FROM Dataset
ORDER BY TotalPrice DESC;



--SALES SEGMENTATION
SELECT 
    sales_segment,
    COUNT(*) AS number_of_orders,
    SUM(TotalPrice) AS total_revenue
FROM (
    SELECT 
        TotalPrice,
        CASE 
            WHEN TotalPrice <= 700 THEN 'Low'
            WHEN TotalPrice <= 1400 THEN 'Mid'
            ELSE 'High'
        END AS sales_segment
    FROM Dataset
) AS sub
GROUP BY sales_segment;