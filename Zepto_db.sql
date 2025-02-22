-- Creating zepto_db table --
DROP TABLE IF EXISTS zepto_db;

CREATE TABLE zepto_db (
Order_ID TEXT,
Customer_ID	INT,
Order_Timestamp	TEXT,
City VARCHAR(100),
Payment_Mode VARCHAR(100),
Product_Category VARCHAR(100),
Product_Name VARCHAR(100),
Price FLOAT,
Discount_Percentage	INT,
Final_Price	FLOAT,
Quantity INT,
Total_Spend	FLOAT,
Customer_Age_Group TEXT,
Delivery_Time_Minutes INT,
Rider_Rating FLOAT
);

SELECT * FROM zepto_db;

-- DATA ANALYSIS & FINDINGS --

-- Total Orders Placed
SELECT COUNT(*) AS Total_orders
FROM zepto_db;

-- Total Unique Customers
SELECT COUNT(DISTINCT Customer_Id) AS Unique_Customers
FROM zepto_db;

-- Order per City
SELECT City,
	COUNT(*) AS Total_Orders
FROM zepto_db
GROUP BY City
ORDER BY Total_Orders;

-- Most Popular Product Categories
SELECT Product_Category,
	COUNT(*) AS Total_Orders
FROM zepto_db
GROUP BY Product_Category
ORDER BY Total_Orders;

-- Find Top 5 Best Selling Products
SELECT Product_name,
	SUM(Quantity) AS Total_Quantity_Sold
FROM zepto_db
GROUP BY Product_Name
ORDER BY Total_Quantity_Sold DESC
LIMIT 5;

-- Total Revenue by Product Category
SELECT Product_Category,
	ROUND(SUM(Total_Spend)::NUMERIC, 0) AS Total_Revenue
FROM zepto_db
GROUP BY Product_Category
ORDER BY Total_Revenue DESC;

-- Which Age Group Spends the Most?
SELECT Customer_Age_Group,
	ROUND(AVG(Total_Spend)::NUMERIC, 2) AS Total_Spendings
FROM zepto_db
GROUP BY Customer_Age_Group
ORDER BY Total_Spendings;

-- Repeat Purchases by City
SELECT City,
	COUNT(DISTINCT Customer_Id) AS Unique_Customers,
	COUNT(Order_Id) AS Total_Orders
FROM zepto_db
GROUP BY City
ORDER BY Total_Orders DESC;

-- Does Giving Discount Increasing Sales
SELECT Discount_Percentage,
	COUNT(Order_Id) AS Total_Orders,
	ROUND(AVG(Final_Price)::NUMERIC,2) AS Avg_Final_Price
FROM zepto_db
GROUP BY Discount_Percentage
ORDER BY Discount_Percentage DESC;

-- Average Delivery Time by City
SELECT City,
	ROUND(AVG(Delivery_Time_Minutes)::NUMERIC,2) AS Avg_Delivery_Time
FROM zepto_db
GROUP BY City
ORDER BY Avg_Delivery_Time ASC;

-- What time of the day has the Most orders
SELECT EXTRACT(HOUR FROM Order_TimeStamp::TIMESTAMP) AS Order_hour,
	COUNT(Order_Id) AS Total_Orders
FROM zepto_db
GROUP BY Order_hour
ORDER BY Total_Orders DESC;

-- Most Preferred Payment Mode
SELECT Payment_Mode,
	COUNT(Order_Id) AS total_order
FROM zepto_db
GROUP BY Payment_Mode
ORDER BY total_order DESC;

-- Which Product is Most Discounted
SELECT Product_Name,
	ROUND(AVG(Discount_Percentage)::NUMERIC,2) AS Avg_Discount
FROM zepto_db
GROUP BY Product_Name
ORDER BY Avg_Discount DESC
LIMIT 5;

-- Top 3 Best Rated Riders
SELECT Rider_Rating,
	COUNT(*) AS Riding_Count
FROM zepto_db
GROUP BY Rider_Rating
ORDER BY Riding_Count DESC
LIMIT 3;

-- Rider Rating vs Delivery Time
SELECT ROUND(AVG(Rider_Rating)::NUMERIC, 2) AS Avg_Rating,
	ROUND(AVG(Delivery_Time_Minutes)::NUMERIC, 2) AS Avg_Delivery_Time
FROM zepto_db;


---END OF PROJECT--






