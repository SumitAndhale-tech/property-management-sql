# Property Management & Real Estate Analytics Database

## 1. Project Overview

Property management companies handle large amounts of information about properties, units, tenants, leases, payments, maintenance requests, employees, and expenses.

Managing this information across separate records can make it difficult to answer important business questions such as:

- Which units are occupied or vacant?
- Which tenants currently have active leases?
- How much rental revenue does each property generate?
- Which properties have higher expenses?
- Which employees handle the most maintenance requests?
- What is the occupancy rate of each property?
- Which properties generate higher net amounts?

This project builds a relational SQL database to organize and analyze property-management data and answer these business questions using SQL.

---

## 2. Project Objective

The main objective is to design a structured property-management database and use SQL to perform business-oriented analysis.

The project focuses on:

- Relational database design
- Primary keys and foreign keys
- Data integrity and constraints
- SQL querying
- Joins
- Aggregations
- Subqueries
- CTEs
- CASE expressions
- Window functions
- Views
- Indexes
- Transactions and ACID concepts
- Property-level business analytics

---

## 3. Business Scenario

The project uses a fictional property-management company called:

**UrbanNest Property Management**

The company manages residential properties across cities such as:

- Pune
- Mumbai
- Nagpur
- Nashik
- Bengaluru

The database stores information about properties, apartments, tenants, rental agreements, payments, maintenance operations, employees, and expenses.

This is a fictional project and is not affiliated with Yardi Systems.

---

## 4. Database Structure

The project contains 8 main tables:

| Table | Purpose |
|---|---|
| `properties` | Stores properties managed by the company |
| `units` | Stores individual units/apartments |
| `tenants` | Stores tenant information |
| `leases` | Stores rental agreements |
| `payments` | Stores tenant payment transactions |
| `maintenance_requests` | Stores maintenance/service requests |
| `employees` | Stores company employee information |
| `expenses` | Stores property-related expenses |

---

## 5. Relationships

The main relationships are:

```text
PROPERTIES
    |
    | 1 : N
    ↓
  UNITS
   /  \
  /    \
1:N    1:N
↓       ↓
LEASES  MAINTENANCE_REQUESTS
  |             |
  |             |
  | N:1         | N:1
  ↓             ↓
TENANTS      EMPLOYEES
  |
  | 1:N
  ↓
PAYMENTS


PROPERTIES
    |
    | 1:N6. Database Design Principles

The database was designed using relational database principles.

Primary Keys

Each table has a unique primary key.

Examples:

property_id
unit_id
tenant_id
lease_id
payment_id
Foreign Keys

Foreign keys connect related tables.

For example:

FOREIGN KEY (property_id)
REFERENCES properties(property_id)

This ensures that a unit cannot reference a property that does not exist.

Data Integrity

The project uses constraints such as:

PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE

These constraints help maintain valid and consistent data.

7. Sample Dataset

The project contains:

10 properties
50 units
30 tenants
12 employees
40 leases
150 payments
60 maintenance requests
60 expenses

The dataset contains both historical and current records so that the database can support realistic analysis.

8. SQL Concepts Demonstrated
Basic SQL
SELECT
WHERE
AND / OR
IN
BETWEEN
LIKE
ORDER BY
LIMIT
Aggregation
COUNT
SUM
AVG
GROUP BY
HAVING
Joins
INNER JOIN
LEFT JOIN
Self-join concepts
Conditional Logic
CASE
Advanced SQL
Subqueries
CTEs
Window functions
Set operations
Database Objects
Views
Indexes
Transaction Management
START TRANSACTION
COMMIT
ROLLBACK
SAVEPOINT
9. Business Analysis

The project contains 30 analysis queries covering questions such as:

Number of units in each property
Vacant units
High-rent units
Top expensive units
Active tenants
Active tenants and their units
Occupied units by property
Average rent by property
Total monthly rent by property
Vacant units by property
Properties with high average rent
Properties with more than four units
Total leases per tenant
Paid rental revenue by property
Total expenses by property
Pending expenses
Maintenance requests per employee
Maintenance requests by priority
Maintenance requests by property
Active lease details
Tenants with late payments
Properties with high occupancy
Highest active lease rent
Tenants paying above average active rent
Property with highest rental revenue
Employee with highest maintenance workload
Highest property occupancy rate
Top three properties by revenue
Revenue vs expenses and net amount
Properties with high occupancy and revenue
10. Views

The project contains five views.

active_lease_details

Provides active tenant, unit, property and lease information.

property_occupancy_summary

Provides:

Total units
Occupied units
Vacant units
Occupancy rate
property_revenue_summary

Provides paid rental revenue by property.

property_expense_summary

Provides paid expenses by property.

property_financial_summary

Combines revenue and expenses to calculate:

Net Amount = Total Revenue - Total Expenses
11. Indexing

Indexes were created on frequently referenced foreign-key columns:

payments(lease_id)
leases(tenant_id)
units(property_id)
maintenance_requests(employee_id)

Indexes can help improve lookup and join performance for suitable queries.

However, indexes also require additional storage and need to be maintained when data changes.

12. Transactions

The project demonstrates transaction management using realistic payment operations.

COMMIT

Permanently saves successful changes.

ROLLBACK

Cancels changes made during the current transaction.

SAVEPOINT

Allows a transaction to roll back part of its work without cancelling the entire transaction.

Example flow:

START TRANSACTION
       ↓
   Operation 1
       ↓
   SAVEPOINT
       ↓
   Operation 2
       ↓
ROLLBACK TO SAVEPOINT
       ↓
    COMMIT
13. Project Files
Property-Management-SQL/
│
├── schema.sql
├── data.sql
├── analysis_queries.sql
├── views.sql
├── indexes.sql
├── transactions.sql
├── README.md
│
└── docs/
File Description
File	Purpose
schema.sql	Creates database tables and relationships
data.sql	Inserts sample data
analysis_queries.sql	Contains 30 business-analysis queries
views.sql	Creates reusable analytical views
indexes.sql	Creates performance-oriented indexes
transactions.sql	Demonstrates transaction operations
README.md	Project documentation
docs/	Project documentation and diagrams
14. Tools Used
MySQL
MySQL Workbench
SQL
GitHub
VS Code
15. Key Learning Outcomes

Through this project, I practiced:

Designing relational databases
Identifying entities and relationships
Creating tables with constraints
Working with primary and foreign keys
Writing multi-table JOIN queries
Performing aggregation and business analysis
Using subqueries and CTEs
Applying conditional logic with CASE
Using window functions
Creating reusable SQL views
Understanding database indexes
Working with transactions and ACID concepts
Translating business questions into SQL queries
16. Project Architecture
Business Requirements
        ↓
Database Design
        ↓
ER Diagram
        ↓
Table Creation
        ↓
Data Population
        ↓
SQL Analysis
        ↓
Views
        ↓
Indexes
        ↓
Transactions
        ↓
Business Insights
17. How to Run the Project
Step 1: Create the database

Run the database and table creation commands from:

schema.sql
Step 2: Insert sample data

Run:

data.sql
Step 3: Run analysis queries

Open:

analysis_queries.sql

and execute the required queries.

Step 4: Create views

Run:

views.sql
Step 5: Create indexes

Run:

indexes.sql
Step 6: Review transactions

Open:

transactions.sql

and execute the transaction examples carefully.

18. Project Highlights
8-table relational database
10 properties and 50 units
150 payment records
60 maintenance requests
60 expense records
30 business-analysis queries
Multiple SQL views
Performance-oriented indexes
Transaction and rollback demonstrations
Real-estate/property-management business domain
19. Resume Project Description

Property Management & Real Estate Analytics Database

Designed and implemented an 8-table MySQL database for property management operations covering properties, units, tenants, leases, payments, maintenance, employees, and expenses. Developed 30 SQL business-analysis queries using joins, aggregations, subqueries, CTEs, CASE expressions and window functions, along with analytical views, indexes, and transaction handling to analyze occupancy, rental revenue, expenses, maintenance workload, and property-level financial performance.
    ↓
 EXPENSES
 
 
 
 Properties  → Units
Units       → Leases
Tenants     → Leases
Leases      → Payments
Units       → Maintenance Requests
Employees   → Maintenance Requests
Properties  → Expenses


