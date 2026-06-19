-- E-Commerce Customer & Sales Analytics Project
-- Tool: MySQL
-- Dataset: Kaggle Online Retail Dataset
-- Schema: ecommerce
-- Table: online_retail

-- Data Quality Check 

USE ecommerce;

SELECT *
FROM online_retail
LIMIT 10;

SELECT COUNT(*) AS missing_customer_id
FROM online_retail
WHERE CustomerID IS NULL OR CustomerID = '';

SELECT COUNT(*) AS missing_description
FROM online_retail
WHERE Description IS NULL OR Description = '';

SELECT COUNT(*) AS negative_quantity_rows
FROM online_retail
WHERE Quantity < 0;

SELECT COUNT(*) AS invalid_price_rows
FROM online_retail
WHERE UnitPrice <= 0;

SELECT COUNT(*) AS cancelled_orders
FROM online_retail
WHERE InvoiceNo LIKE 'C%';

SELECT *
FROM online_retail
WHERE UnitPrice <= 0;

SELECT COUNT(*) AS cancelled_orders
FROM online_retail
WHERE InvoiceNo LIKE 'C%';

-- Business Analysis

-- Find Total Revenue

SELECT
ROUND(SUM(Revenue), 2) AS total_revenue
FROM online_retail;

-- Count Total Orders

SELECT
	COUNT(distinct InvoiceNo) AS total_orders
FROM online_retail;

-- Count Customers

SELECT
	COUNT(distinct CustomerID) AS total_customers
FROM online_retail;

-- Find Average Order Value Per Orders

SELECT
	ROUND(SUM(Revenue) / COUNT(distinct InvoiceNo), 2) AS Average_Order_Value
FROM online_retail;

-- Find Country With The Highest Revenue
SELECT
	Country,
    round(sum(Revenue), 2) AS Total_Revenue
FROM online_retail
GROUP BY Country
ORDER BY Total_Revenue DESC;

-- Find Top 10 Countries With Highest Revenue
SELECT
	Country,
    round(sum(Revenue), 2) AS Total_Revenue
FROM online_retail
GROUP BY Country
ORDER BY Total_Revenue DESC LIMIT 10;

-- Find Top 10 Products By Revenue
SELECT
	Description,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM online_retail
GROUP BY Description
ORDER BY Total_Revenue DESC LIMIT 10;

-- Find Products Sold Most Quantity
SELECT
	Description,
    SUM(Quantity) AS Total_Quantity_Sold
FROM online_retail
GROUP BY Description
ORDER BY Total_Quantity_Sold DESC LIMIT 10;

-- Top Customers by Revenue

SELECT
	CustomerID,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    COUNT(distinct InvoiceNo) AS Total_Orders
FROM online_retail
	GROUP BY CustomerID
    ORDER BY Total_Revenue DESC 
    LIMIT 10;
    
-- Monthly Revenue Trend

SELECT
	OrderYear,
    OrderMonth,
    ROUND(SUM(Revenue), 2) AS Monthly_Revenue
FROM online_retail
GROUP BY OrderYear, OrderMonth
ORDER BY OrderYear;

-- Find Revenue By Year

SELECT
	OrderYear,
    ROUND(SUM(Revenue), 2) AS Yearly_Revenue
FROM online_retail
	GROUP BY OrderYear
    ORDER BY OrderYear;
    
-- Find Customers with Most Orders
    
SELECT
	CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM online_retail
    GROUP BY CustomerID
    ORDER BY Total_Orders DESC 
    LIMIT 10;
    
-- Customer Segmentation

SELECT
	CustomerID,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    COUNT(distinct InvoiceNo) AS Total_Orders,
    CASE
		WHEN SUM(Revenue) >= 10000 THEN 'High Value Customer'
        WHEN SUM(Revenue) >= 3000 THEN 'Medium Value Customer'
        ELSE 'Low Value Customer'
	END AS Customer_Segment
FROM online_retail
GROUP BY CustomerID
ORDER BY Total_Revenue DESC;

-- Count Customers in Each Segment

SELECT
	Customer_Segment,
    COUNT(*) AS Number_Of_Customers
FROM
	(SELECT
		CustomerID,
        CASE
		WHEN SUM(Revenue) >= 10000 THEN 'High Value Customer'
        WHEN SUM(Revenue) >= 3000 THEN 'Medium Value Customer'
        ELSE 'Low Value Customer'
	END AS Customer_Segment
	FROM online_retail
    GROUP BY CustomerID) AS Customer_Groups
GROUP BY Customer_Segment
ORDER BY Number_Of_Customers DESC;
    
-- Find Revenue by Customer Segment
    
SELECT
	Customer_Segment,
    ROUND(SUM(Total_Revenue), 2) AS Segment_Revenue
FROM
    (SELECT
		CustomerID,
        SUM(Revenue) AS Total_Revenue,
        CASE
			WHEN SUM(Revenue) >=10000 THEN 'High Value Customer'
            WHEN SUM(Revenue) >=3000 THEN 'Medium Value Customer'
            ELSE 'Low Value Customer'
		END AS Customer_Segment
    FROM online_retail
    GROUP BY CustomerID) AS Customer_Groups
GROUP BY Customer_Segment
ORDER BY Segment_Revenue DESC;
    
-- Most Frequently Purchased Products

SELECT
	Description,
    COUNT(DISTINCT InvoiceNo) AS Total_orders,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM online_retail
GROUP BY Description
ORDER BY Total_orders DESC
LIMIT 10;

-- Revenue by Day of Week
SELECT
	OrderDay,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM online_retail
GROUP BY OrderDay
ORDER BY FIELD(
			OrderDay,
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday',
            'Sunday'
        );
        
-- Highest Value Invoices
SELECT
	CustomerID,
    InvoiceNo,
    Description,
    Country,
    ROUND(SUM(Revenue), 2) AS Invoice_Revenue
FROM online_retail
GROUP BY InvoiceNo, Description, CustomerID, Country
ORDER BY Invoice_Revenue DESC
LIMIT 10;

-- Product Performance by Country
SELECT
	Country,
    Description,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    SUM(Quantity) AS Total_Quantity
FROM online_retail
GROUP BY Country, Description 
ORDER BY Country, Total_Revenue DESC
LIMIT 10;

-- Revenue Percentage by Country
SELECT
	Country,
    ROUND(SUM(Revenue), 2) AS Country_Revenue,
    ROUND(SUM(Revenue) * 100 / (SELECT SUM(Revenue) FROM online_retail), 2) AS Revenue_Percentage
FROM online_retail
GROUP BY Country
ORDER BY Revenue_Percentage DESC;