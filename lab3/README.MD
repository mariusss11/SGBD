# Lab 3 – EcoCarRental Database Security Configuration

## Overview
In this lab, we focus on improving query performance using indexes and securing sensitive data through encryption techniques.
---

## Database Diagram

You can view the diagram [here](/lab1/README.MD)
---

## SQL Scripts

### Indexes

Script for working with indexes [here](./dataMasking.sql)

#### 📌 Clustered Index
- A clustered index determines the physical order of data in the table.  
- Each table can have only **one clustered index**.  
- In `EcoCarRentalDB`, we created a clustered index on the **primary key columns** (e.g., `Car.CarID`, `Customer.CustomerID`, `Rental.RentalID`), ensuring efficient lookups by unique identifiers.

#### 📌 Non-Clustered Index
- A non-clustered index creates a separate structure that points to the data rows.  
- A table can have **multiple non-clustered indexes**.  
- We added non-clustered indexes to frequently queried columns to speed up filtering and searching.


**Examples in this project:**
- `idx_customer_names` → speeds up lookups for customer info.
- `idx_car_details` → improves searches for info about cars.
- `idx_staff_details` → speeds up lookups for staff info.  


#### ⚡ Performance Note
- Indexes make `SELECT` queries faster, but `INSERT`, `UPDATE`, and `DELETE` operations can be slightly slower since indexes must also be updated.  
- Choosing the right columns for indexing is critical to balance performance.


### Docs

For more details, see the [Microsoft Docs on Indexes](https://learn.microsoft.com/en-us/sql/relational-databases/indexes/create-nonclustered-indexes?view=sql-server-ver15).