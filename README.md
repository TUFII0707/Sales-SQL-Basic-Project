# Sales-SQL-Basic-Project

# Sales Database SQL Project

## Project Overview

This project demonstrates the creation and analysis of a small sales database using **SQLite** in an online sandbox environment. The goal of this project is to design a simple relational database with customer, product, and order data and perform analytical queries to answer common business questions.

The project simulates a basic sales reporting system that helps understand customer behavior, monthly sales trends, and product popularity.

## Tools Used

* SQLite (SQLiteOnline Sandbox)
* SQL
* GitHub (for version control and project repository)

## Database Schema

The project contains **three main tables**:

### 1. CustomerDetails

Stores customer information such as ID, name, contact number, and location.

### 2. ProductDetails

Stores product information including product ID, product name, and price.

### 3. OrderDetails

Stores transaction data including order ID, customer ID, product ID, quantity purchased, and order date.

Relationships:

* A customer can place multiple orders.
* Each order references a product.
* Foreign keys are used to maintain relationships between tables.

## Business Questions Solved

### 1. Top N Customers by Revenue

A query calculates the **top N customers based on total revenue generated**.

Revenue is calculated as:

quantity × product price

The query aggregates total revenue per customer and ranks them in descending order.

### 2. Monthly Sales Analysis

A **SQL view** is created to calculate the total sales revenue for each month.
This allows easy reporting of monthly business performance.

The month is extracted from the order date and grouped to produce monthly totals.

### 3. Product Popularity Ranking

A **window function (RANK())** is used to rank products based on total quantity sold.

This helps answer:

* Which products are most popular?
* Which products generate the most demand?

## Project Structure

```
sales-database-project
│
├── sales_database.sql
├── README.md
```

### sales_database.sql

Contains:

* Table creation scripts
* Data insertion (DML)
* Analytical queries
* SQL view creation
* Window function query

Each query includes comments explaining the **business question it answers**.

## Example Insights from the Project

* Identify the customers generating the highest revenue
* Track monthly revenue trends
* Discover the most popular products based on sales volume

## How to Run the Project

1. Open SQLiteOnline or any SQLite environment.
2. Copy and paste the contents of `sales_database.sql`.
3. Execute the script to create tables and insert data.
4. Run the analytical queries to view insights.

## Learning Outcomes

This project demonstrates:

* Relational database design
* SQL joins and aggregations
* GROUP BY operations
* SQL views
* Window functions (RANK)
* Business-oriented data analysis

## Author

Unmukt

## License

This project is created for educational and portfolio purposes.
