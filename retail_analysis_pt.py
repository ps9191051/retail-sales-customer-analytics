# Retail Sales & Customer Analytics
# Python | Pandas | Matplotlib
# Analysis period: 2025

import pandas as pd
import matplotlib.pyplot as plt

# Load data
customers = pd.read_csv("customers.csv")
locations = pd.read_csv("locations.csv")
orders = pd.read_csv("orders.csv")
order_items = pd.read_csv("order_items.csv")
products = pd.read_csv("products.csv")

# Prepare analysis dataset
sales_data = orders.merge(order_items, on="order_id", how="inner")
sales_data = sales_data.merge(products, on="product_id", how="inner")
sales_data["order_date"] = pd.to_datetime(sales_data["order_date"])

# Calculate revenue after discount
sales_data["revenue"] = (
    sales_data["selling_price"]
    * sales_data["quantity"]
    * (1 - sales_data["discount"])
)

# Q1. Total Revenue
total_revenue = sales_data["revenue"].sum()
print("Total Revenue:", total_revenue)

# Q2. Monthly Revenue Trend
monthly_revenue = (
    sales_data
    .groupby(sales_data["order_date"].dt.to_period("M"))["revenue"]
    .sum()
)
print("\nMonthly Revenue:")
print(monthly_revenue)

# Q3. Revenue by Category
revenue_by_category = (
    sales_data
    .groupby("category")["revenue"]
    .sum()
    .sort_values(ascending=False)
)
print("\nRevenue by Category:")
print(revenue_by_category)

# Q4. Top 10 Customers by Revenue
sales_data = sales_data.merge(
    customers[["customer_id", "customer_name"]],
    on="customer_id",
    how="inner"
)

top_customers = (
    sales_data
    .groupby(["customer_id", "customer_name"])["revenue"]
    .sum()
    .sort_values(ascending=False)
    .head(10)
)
print("\nTop 10 Customers by Revenue:")
print(top_customers)

# Q5. Orders per Customer
orders_per_customer = (
    sales_data
    .groupby("customer_id")["order_id"]
    .nunique()
)
print("\nOrders per Customer:")
print(orders_per_customer)

# Q6. Average Revenue per Customer
customer_revenue = sales_data.groupby("customer_id")["revenue"].sum()
average_revenue_per_customer = customer_revenue.mean()
print("\nAverage Revenue per Customer:", average_revenue_per_customer)

# Q7. Top 10 Products by Units Sold
top_products_by_units = (
    sales_data
    .groupby(["product_id", "product_name"])["quantity"]
    .sum()
    .sort_values(ascending=False)
    .head(10)
)
print("\nTop 10 Products by Units Sold:")
print(top_products_by_units)

# Q8. Top 10 Products by Revenue
top_products_by_revenue = (
    sales_data
    .groupby(["product_id", "product_name"])["revenue"]
    .sum()
    .sort_values(ascending=False)
    .head(10)
)
print("\nTop 10 Products by Revenue:")
print(top_products_by_revenue)

# Q9. Revenue by Region
sales_region = sales_data.merge(
    locations[["location_id", "region"]],
    on="location_id",
    how="inner"
)

revenue_by_region = (
    sales_region
    .groupby("region")["revenue"]
    .sum()
    .sort_values(ascending=False)
)
print("\nRevenue by Region:")
print(revenue_by_region)

# Q10. Discount vs Sales & Revenue
discount_analysis = (
    sales_data
    .groupby("discount")
    .agg(
        total_units_sold=("quantity", "sum"),
        total_revenue=("revenue", "sum")
    )
    .sort_index()
)
print("\nDiscount vs Sales & Revenue:")
print(discount_analysis)

# Visual 1. Monthly Revenue Trend
plt.figure(figsize=(12, 6))
plt.plot(
    monthly_revenue.index.astype(str),
    monthly_revenue.values,
    marker="o"
)
plt.title("Monthly Revenue Trend")
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.xticks(rotation=45)
plt.grid(True)
plt.tight_layout()
plt.show()

# Visual 2. Revenue by Category
plt.figure(figsize=(10, 6))
plt.bar(
    revenue_by_category.index,
    revenue_by_category.values
)
plt.title("Revenue by Category")
plt.xlabel("Category")
plt.ylabel("Revenue")
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()

# Visual 3. Orders by Category
orders_by_category = (
    sales_data
    .groupby("category")["order_id"]
    .nunique()
)

plt.figure(figsize=(8, 8))
plt.pie(
    orders_by_category.values,
    labels=orders_by_category.index,
    autopct="%1.1f%%",
    startangle=90
)
plt.title("Order Distribution by Category")
plt.tight_layout()
plt.show()
