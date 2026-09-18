# Property Management & Real Estate Analytics Database

A relational MySQL database project designed to manage and analyze property-management operations including properties, units, tenants, leases, payments, maintenance requests, employees, and expenses.

---

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
- Set operations
- Views
- Indexes
- Transactions and ACID concepts
- Property-level business analytics

---

## 3. Business Scenario

The project uses a fictional property-management company called **UrbanNest Property Management**.

The company manages residential properties across cities such as:

- Pune
- Mumbai
- Nagpur
- Nashik
- Bengaluru

The database stores information about:

- Properties
- Apartments / units
- Tenants
- Rental agreements
- Payments
- Maintenance operations
- Employees
- Property expenses

> **Note:** This is a fictional project and is not affiliated with Yardi Systems.

---

## 4. Database Structure

The project contains **8 main tables**.

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

The main database relationships are:

**Properties → Units** — 1:N  
**Properties → Expenses** — 1:N  
**Units → Leases** — 1:N  
**Units → Maintenance Requests** — 1:N  
**Tenants → Leases** — 1:N  
**Leases → Payments** — 1:N  
**Employees → Maintenance Requests** — 1:N

### Relationship Flow

**PROPERTY → UNIT → LEASE → PAYMENT**

**TENANT → LEASE**

**UNIT → MAINTENANCE REQUEST → EMPLOYEE**

**PROPERTY → EXPENSE**

---

## 6. Database Design Principles

The database was designed using relational database principles.

### Primary Keys

Each table has a unique primary key.

Examples:

- `property_id`
- `unit_id`
- `tenant_id`
- `lease_id`
- `payment_id`

### Foreign Keys

Foreign keys connect related tables.

Example:

`FOREIGN KEY (property_id) REFERENCES properties(property_id);`

This ensures that a unit cannot reference a property that does not exist.

### Data Integrity

The project uses constraints such as:

- `PRIMARY KEY`
- `FOREIGN KEY`
- `NOT NULL`
- `UNIQUE`

These constraints help maintain valid and consistent data.

---

## 7. Sample Dataset

The project contains:

| Entity | Records |
|---|---:|
| Properties | 10 |
| Units | 50 |
| Tenants | 30 |
| Employees | 12 |
| Leases | 40 |
| Payments | 150 |
| Maintenance Requests | 60 |
| Expenses | 60 |

The dataset contains both historical and current records so that the database can support realistic analysis.

---

## 8. SQL Concepts Demonstrated

### Basic SQL

- `SELECT`
- `WHERE`
- `AND / OR`
- `IN`
- `BETWEEN`
- `LIKE`
- `ORDER BY`
- `LIMIT`

### Aggregation

- `COUNT`
- `SUM`
- `AVG`
- `GROUP BY`
- `HAVING`

### Joins

- `INNER JOIN`
- `LEFT JOIN`
- Self-joins

### Conditional Logic

- `CASE`

### Advanced SQL

- Subqueries
- CTEs
- Window functions
- Set operations

### Database Objects

- Views
- Indexes

### Transaction Management

- `START TRANSACTION`
- `COMMIT`
- `ROLLBACK`
- `SAVEPOINT`

---

## 9. Business Analysis

The project contains **30 SQL analysis queries** covering questions such as:

1. Number of units in each property
2. Vacant units
3. High-rent units
4. Top expensive units
5. Active tenants
6. Active tenants and their units
7. Occupied units by property
8. Average rent by property
9. Total monthly rent by property
10. Vacant units by property
11. Properties with high average rent
12. Properties with more than four units
13. Total leases per tenant
14. Paid rental revenue by property
15. Total expenses by property
16. Pending expenses
17. Maintenance requests per employee
18. Maintenance requests by priority
19. Maintenance requests by property
20. Active lease details
21. Tenants with late payments
22. Properties with high occupancy
23. Highest active lease rent
24. Tenants paying above average active rent
25. Property with highest rental revenue
26. Employee with highest maintenance workload
27. Highest property occupancy rate
28. Top three properties by revenue
29. Revenue vs expenses and net amount
30. Properties with high occupancy and revenue

---

## 10. Views

The project contains **five analytical views**.

| View | Purpose |
|---|---|
| `active_lease_details` | Provides active tenant, unit, property, and lease information |
| `property_occupancy_summary` | Provides total units, occupied units, vacant units, and occupancy rate |
| `property_revenue_summary` | Provides paid rental revenue by property |
| `property_expense_summary` | Provides paid expenses by property |
| `property_financial_summary` | Combines revenue and expenses to calculate net amount |

### Property Financial Summary

**Net Amount = Total Revenue - Total Expenses**

---

## 11. Indexing

Indexes were created on frequently referenced foreign-key columns:

- `payments(lease_id)`
- `leases(tenant_id)`
- `units(property_id)`
- `maintenance_requests(employee_id)`

Indexes can help improve lookup and join performance for suitable queries.

However, indexes also:

- Require additional storage
- Need to be maintained when data changes
- Should be created based on actual query requirements

---

## 12. Transactions

The project demonstrates transaction management using realistic payment operations.

### COMMIT

Permanently saves successful changes.

### ROLLBACK

Cancels changes made during the current transaction.

### SAVEPOINT

Allows a transaction to roll back part of its work without cancelling the entire transaction.

### Transaction Flow

**START TRANSACTION → Operation 1 → SAVEPOINT → Operation 2 → ROLLBACK TO SAVEPOINT → COMMIT**

---

## 13. Project Structure

Property-Management-SQL/

├── schema.sql  
├── data.sql  
├── analysis_queries.sql  
├── views.sql  
├── indexes.sql  
├── transactions.sql  
├── README.md  
└── docs/  
&nbsp;&nbsp;&nbsp;&nbsp;└── ER_Diagram.png

### File Description

| File / Folder | Purpose |
|---|---|
| `schema.sql` | Creates database tables and relationships |
| `data.sql` | Inserts sample data |
| `analysis_queries.sql` | Contains 30 business-analysis queries |
| `views.sql` | Creates reusable analytical views |
| `indexes.sql` | Creates performance-oriented indexes |
| `transactions.sql` | Demonstrates transaction operations |
| `README.md` | Project documentation |
| `docs/` | Project documentation and diagrams |

---

## 14. Tools Used

| Tool | Purpose |
|---|---|
| MySQL | Relational database |
| MySQL Workbench | Database development and testing |
| SQL | Database querying and analysis |
| VS Code | SQL script development |
| GitHub | Version control and project hosting |

---

## 15. Key Learning Outcomes

Through this project, I practiced:

- Designing relational databases
- Identifying entities and relationships
- Creating tables with constraints
- Working with primary and foreign keys
- Writing multi-table JOIN queries
- Performing aggregation and business analysis
- Using subqueries and CTEs
- Applying conditional logic with CASE
- Using window functions
- Creating reusable SQL views
- Understanding database indexes
- Working with transactions and ACID concepts
- Translating business questions into SQL queries

---

## 16. Project Architecture

**Business Requirements → Database Design → ER Diagram → Table Creation → Data Population → SQL Analysis → Views → Indexes → Transactions → Business Insights**

---

## 17. How to Run the Project

### Step 1: Create the Database

Run the database and table creation commands from:

`schema.sql`

### Step 2: Insert Sample Data

Run:

`data.sql`

### Step 3: Run Analysis Queries

Open:

`analysis_queries.sql`

Execute the required queries.

### Step 4: Create Views

Run:

`views.sql`

### Step 5: Create Indexes

Run:

`indexes.sql`

### Step 6: Review Transactions

Open:

`transactions.sql`

Execute the transaction examples carefully.

> **Note:** `data.sql` is intended for initial database setup. Avoid repeatedly executing it on an already populated database because it may insert duplicate records.

---

## 18. Project Highlights

- 8-table relational database
- 10 properties and 50 units
- 30 tenants
- 40 leases
- 150 payment records
- 60 maintenance requests
- 60 expense records
- 30 business-analysis queries
- 5 analytical SQL views
- Performance-oriented indexes
- Transaction and rollback demonstrations
- Real-estate/property-management business domain

---

## 19. Resume Project Description

**Property Management & Real Estate Analytics Database**

Designed and implemented an 8-table MySQL database for property management operations covering properties, units, tenants, leases, payments, maintenance, employees, and expenses. Developed 30 SQL business-analysis queries using joins, aggregations, subqueries, CTEs, CASE expressions, and window functions, along with analytical views, indexes, and transaction handling to analyze occupancy, rental revenue, expenses, maintenance workload, and property-level financial performance.
