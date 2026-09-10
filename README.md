Retail Sales & Customer Analytics

An end-to-end retail analytics project using MySQL, SQL, Python, Pandas, Matplotlib, and Power BI to analyze sales performance, customers, products, regions, and discount behavior.

Project Objective

The goal of this project is to turn raw retail transaction data into actionable business insights by combining SQL analysis, Python-based data analysis, and interactive Power BI dashboards.

Tech Stack

MySQL - Data querying and business analysis

SQL - Joins, aggregations, filtering, grouping, sorting, and customer/product analysis

Python - Data analysis workflow

Pandas - Data cleaning, merging, transformation, and aggregation

Matplotlib - Data visualization

Power BI - Interactive dashboards and KPI reporting

GitHub - Project documentation and version control

Dataset

The project uses five CSV files:

File

Records

Purpose

customers.csv

3,000

Customer information

products.csv

200

Product and category information

orders.csv

20,000

Order-level information

order_items.csv

46,998

Product-level order transactions

locations.csv

40

Location and regional information

Data Model

The main relationships are:

customers
    |
    | customer_id
    v
orders
    |
    | order_id
    v
order_items
    |
    | product_id
    v
products

orders
    |
    | location_id
    v
locations

Revenue is calculated after applying the order-level discount:

Revenue = selling_price × quantity × (1 - discount)

SQL Analysis

The SQL analysis covers 10 business questions:

Total Revenue

Monthly Revenue Trend

Revenue by Category

Top 10 Customers by Revenue

Orders per Customer

Average Revenue per Customer

Top 10 Products by Units Sold

Top 10 Products by Revenue

Revenue by Region

Discount vs Sales & Revenue

Python Analysis

Python/Pandas was used to reproduce the core analysis and create visualizations.

Visualizations

Monthly Revenue Trend

Revenue by Category

Order Distribution by Category

The Python workflow includes:

Loading CSV datasets

Merging orders, order items, products, customers, and locations

Converting order dates

Calculating revenue after discounts

Customer-level analysis

Product-level analysis

Regional analysis

Discount analysis

Key Results

Total Revenue: approximately ₹296.79 crore

Total Orders: 20,000

Customers: 3,000

Order-item records: 46,998

Units Sold: approximately 118K

Average Revenue per Customer: approximately ₹9.91 lakh

Top customer by revenue: Customer 2391, approximately ₹33.11 lakh

Highest-revenue region: South

Regional revenue is distributed across South, North, East, and West

Power BI Dashboard

The Power BI report contains two pages.

Page 1: Retail Sales & Customer Analytics

Key KPIs and visuals:

Total Revenue

Total Orders

Total Customers

Total Units Sold

Monthly Revenue Trend

Revenue by Category

Order Distribution by Category

Revenue by Region

Page 2: Customer & Product Insights

Key analysis:

Average Revenue per Customer

Average Orders per Customer

Top 10 Customers by Revenue

Top 10 Products by Units Sold

Discount vs Revenue

Category and Region slicers

Project Workflow

Raw CSV Data
      ↓
MySQL Database
      ↓
SQL Business Analysis
      ↓
Python + Pandas
      ↓
Matplotlib Visualizations
      ↓
Power BI Dashboard
      ↓
Business Insights

Repository Structure

retail-sales-customer-analytics/
│
├── README.md
│
├── sql/
│   └── retail_analysis_final.sql
│
├── python/
│   └── retail_analysis_final.py
│
└── screenshots/
    ├── sales_overview.png
    └── customer_product_insights.png

How to Run

SQL

Create/import the retail_analytics database.

Load the five CSV datasets into their respective MySQL tables.

Open:

sql/retail_analysis_final.sql

Run the queries in MySQL Workbench or another MySQL client.

Python

Install the required libraries:

pip install pandas matplotlib

Keep the five CSV files in the same working directory as the Python script, then run:

python retail_analysis_final.py

Business Insights

This project demonstrates how a Data Analyst can:

Measure overall sales performance

Track revenue trends over time

Identify high-performing product categories

Identify valuable customers

Compare customer purchasing activity

Find high-volume products

Compare regional performance

Analyze the relationship between discounts, units sold, and revenue

Present findings through business-focused dashboards

Portfolio Value

This project demonstrates an end-to-end analytics workflow rather than isolated tool usage:

SQL → Python/Pandas → Visualization → Power BI → Business Insights

It showcases practical skills in data preparation, relational data analysis, KPI development, customer analytics, product analytics, regional analysis, and business reporting.

