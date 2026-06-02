# E-Commerce Customer & Sales Analytics Project

## Project Overview
This is an end-to-end data analytics portfolio project using the Kaggle Online Retail Dataset. The goal of this project is to analyze retail transaction data to identify sales trends, customer behavior, product performance, and business insights.

## Business Questions
- What is the total revenue generated?
- Which countries generate the highest revenue?
- Which products generate the most revenue?
- Who are the top customers?
- What is the monthly sales trend?
- How can customers be segmented based on revenue?

## Tools Used
- Excel / Google Sheets: Data cleaning and data quality checks
- MySQL: SQL analysis and business questions
- R Programming: Data analysis and visualization
- Tableau: Interactive dashboard
- GitHub: Project documentation and portfolio publishing

## Dataset
Dataset used: Kaggle Online Retail Dataset

The dataset contains online retail transactions including invoice number, product description, quantity, invoice date, unit price, customer ID, and country.

## Data Cleaning Steps
The dataset was cleaned using Excel/Google Sheets before importing into MySQL.

Cleaning steps included:
- Removed cancelled orders where InvoiceNo starts with C
- Removed rows with Quantity less than 0
- Removed rows with missing CustomerID
- Removed rows with missing Description
- Removed rows with UnitPrice less than or equal to 0
- Created Revenue column using Quantity * UnitPrice
- Created OrderYear, OrderMonthNumber, OrderMonthName, and OrderDayName columns

## MySQL Analysis
The cleaned dataset was imported into MySQL using a schema named ecommerce_project and a table named online_retail.

SQL was used to calculate:
- Total revenue
- Total orders
- Total customers
- Average order value
- Revenue by country
- Top products by revenue
- Top customers by revenue
- Monthly revenue trend
- Customer segmentation

## R Analysis
R will be used for additional analysis and visualizations, including:
- Revenue distribution
- Top product visualization
- Monthly sales trend
- Customer revenue analysis

## Tableau Dashboard
Tableau will be used to create an interactive dashboard with:
- KPI cards
- Monthly revenue trend
- Top countries by revenue
- Top products by revenue
- Top customers
- Customer segments

## Key Insights
This section will be updated after SQL, R, and Tableau analysis are completed.

## Project Status
In progress.
