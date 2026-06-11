# E-Commerce Customer & Sales Analytics Project

## Project Overview

This is an end-to-end data analytics portfolio project using the Kaggle Online Retail Dataset. The goal of this project is to analyze retail transaction data to identify sales trends, customer behavior, product performance, and business insights.

## Business Questions

* What is the total revenue generated?
* Which countries generate the highest revenue?
* Which products generate the most revenue?
* Who are the top customers?
* What is the monthly sales trend?
* How can customers be segmented based on revenue?

## Tools Used

* **Excel / Google Sheets:** Data cleaning and data quality checks
* **MySQL:** SQL analysis and business questions
* **Python:** Data analysis and visualization
* **Tableau:** Interactive dashboard
* **GitHub:** Project documentation and portfolio publishing

## Dataset

Dataset used: Kaggle Online Retail Dataset

The dataset contains online retail transactions including invoice number, product description, quantity, invoice date, unit price, customer ID, and country.

## Data Cleaning Steps

The dataset was cleaned using Excel/Google Sheets before importing into MySQL.

Cleaning steps included:

* Removed cancelled orders where `InvoiceNo` starts with `C`
* Removed rows with `Quantity` less than 0
* Removed rows with missing `CustomerID`
* Removed rows with missing `Description`
* Removed rows with `UnitPrice` less than or equal to 0
* Created `Revenue` column using `Quantity * UnitPrice`
* Created date-based columns for year, month, and day analysis

## MySQL Analysis

The cleaned dataset was imported into MySQL using a schema named `ecommerce` and a table named `online_retail`.

SQL was used to calculate:

* Total revenue
* Total orders
* Total customers
* Average order value
* Revenue by country
* Top products by revenue
* Top customers by revenue
* Monthly revenue trend
* Customer segmentation

## Python Analysis

Python was used for additional data analysis and visualization.

Python analysis included:

* Loading and reviewing the cleaned dataset
* Performing data quality checks
* Handling invalid price rows
* Creating a revenue column
* Creating date-based columns such as year, month, and day
* Analyzing top countries by revenue
* Analyzing top products by revenue
* Analyzing top customers by revenue
* Calculating monthly revenue trends
* Creating customer segments
* Creating visualizations using Python

## Tableau Dashboard

Tableau will be used to create an interactive dashboard with:

* KPI cards
* Monthly revenue trend
* Top countries by revenue
* Top products by revenue
* Top customers
* Customer segments

## Key Insights

This section will be updated after SQL, Python, and Tableau analysis are completed.

## Project Status

In progress.
