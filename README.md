# DecodeLab_Task_3
🗄️ SQL Tools & Data Querying

🎯 Overview

Structured Query Language (SQL) was used to extract, manipulate, and analyze data from the sales dataset. SQL played a key role in transforming raw data into meaningful insights through filtering, aggregation, and segmentation.

🛠️ SQL Tools Used
* **SQL Server Management Studio (SSMS)**

📥 Data Import Process

* Dataset was cleaned in Excel and saved as **CSV format**
* Imported into SQL database using:

  * Table creation scripts
  * Import wizard / bulk load commands

🔍 Core SQL Operations
🔹 Data Selection

```sql
SELECT * FROM sales_data;
```
🔹 Filtering Data

```sql
SELECT *
FROM sales_data
WHERE TotalPrice > 1500;
```🔹 Sorting Results

```sql
SELECT OrderID, TotalPrice
FROM sales_data
ORDER BY TotalPrice DESC;
```
📊 Aggregation Functions
🔹 Total Revenue

```sql
SELECT SUM(TotalPrice) AS total_sales
FROM sales_data;
```
🔹 Average Sales

```sql
SELECT AVG(TotalPrice) AS avg_sales
FROM sales_data;
```
🔹 Total Orders

```sql
SELECT COUNT(*) AS total_orders
FROM sales_data;
```
📈 Grouping & Insights
🔹 Sales by Referral Source

```sql
SELECT ReferralSource,
       SUM(TotalPrice) AS total_sales
FROM sales_data
GROUP BY ReferralSource
ORDER BY total_sales DESC;
```
🔹 Monthly Sales Trend

```sql
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month,
    SUM(TotalPrice) AS monthly_sales
FROM sales_data
GROUP BY DATE_FORMAT(Date, '%Y-%m')
ORDER BY month;
```

🧠 Advanced Analysis
🔹 Customer Segmentation

```sql
SELECT 
    CASE 
        WHEN TotalPrice <= 700 THEN 'Low'
        WHEN TotalPrice <= 1400 THEN 'Mid'
        ELSE 'High'
    END AS sales_segment,
    COUNT(*) AS number_of_orders,
    SUM(TotalPrice) AS total_revenue
FROM sales_data
GROUP BY 
    CASE 
        WHEN TotalPrice <= 700 THEN 'Low'
        WHEN TotalPrice <= 1400 THEN 'Mid'
        ELSE 'High'
    END;
```
🔹 Top Transactions (Outliers)
```sql
SELECT *
FROM sales_data
ORDER BY TotalPrice DESC
LIMIT 10;
Key Insights from SQL Analysis
* Sales distribution is **right-skewed**, with a few high-value transactions
* Majority of transactions fall within the **mid-range spending category**
* Certain referral sources generate more revenue
* Monthly aggregation reveals **fluctuating sales trends**
* High-value transactions contribute significantly to total revenue

 Outcome
SQL enabled efficient data exploration and transformation, forming the foundation for further visualization in Power BI. The queries helped uncover trends, segment customers, and support data-driven decision-making.
