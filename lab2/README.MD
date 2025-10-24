# Lab 2 – EcoCarRental Database Security Configuration

## Overview
This phase of the project involve creating some script to retrive info but also improve the overall security 
---

## Database Diagram

You can view the diagram [here](/lab1/README.MD)
---



## SQL Scripts

### Security Config

The script for adding login and user in the database is [here](./security.sql) 

### Security Diagram 

The **Security Diagram** illustrates the roles, users, and their permissions in the **EcoCarRental** database.  
It helps visualize which users can access which database objects and the hierarchy of roles.

**Diagram Overview:**
- **Client Role (`client_role`)**  
  - Can **view staff**, **view cars**, and **view car types**.  
- **Staff Role (`staff_role`)**  
  - Can **manage cars** (add, edit, delete), **manage car types**, **manage rentals**, and **view customers**.  
- **Administrator**  
  - Can **manage users and roles**.  

**Diagram Link (PlantUML Rendered Image):**  

![EcoCarRental Security Diagram](https://www.plantuml.com/plantuml/png/TLBDSjCm4BxxANRAeN3e32sbS69QF0aNJWrmNwojgwaiULQhTcA6Kry2XdVW9UWXZuLYAudbf9V4slts-_Rdk_I2BA4nXQ4R0N70khuLK9gf4kriuU-qRP6n0Qp4yKAMXW0VoBk6Hiar76qTSpyAW8-E5N7fZ6DuSJPxVr6UnkZSMLdeZk3qFBq6jk_EgEBdY2nugj0dAgpkQdR1gaGtFvzVpD_jYPHlPczVPo9daRFecuRIQBAI7Wl1cvlqVQKQRRKNnlWgYjqKHxFAbSZNiGmDB9PUg3cA3KM5OoYn2wn14GJHHdV8j940UFbDTm5ZbB1xUeG6Lx-Zn2j03_UQ7YAftqU9RXFZ0VoNPKi7QbfYxooQBNGOBEAkgIE-tue_FVOG9YkHxVaHjlMVoAzllpz0WnPhsenmfJ3KKnLKAkRNwPdI4YccWD0g54gOrIyXhYb7A3AK47al-PgcNUqMbHVz-skhMysQU0mVBdjWhTNwaAi_emi4BwuXzizlBhVHj864YoaDiMjWPqBMorSVsQ-T8R-sx35yfhXMYPYDguO_E3dva7iYZoS3Z8Bfv0VgVP4B3QNzRmyRNNeQJEfP8blfBZvPtp4CgVg0lw1bRK7RoWH5nKw-vqccogCZ9-M9dO7o6Vih5TcjUlZU4Ix9gj2O_m00)

> **Tip:** You can open the PlantUML source to modify or expand the diagram as your database schema evolves.

--- 

### Select Queries

The script for the *select commands* in the database is [here](./select.sql)

### View Queries

The script for creating *views* the database is [here](./create_views.sql)

### Data Masking Tehnique

Implemented dynamic data masking [here](./dataMasking.sql)

### Docs

* Basic Practicies for Strong Security [here](https://www.sqlservercentral.com/articles/a-few-best-practices-for-strong-sql-server-security)
* Dynamic Data Masking [here](https://learn.microsoft.com/en-us/sql/relational-databases/security/dynamic-data-masking?view=sql-server-ver17)

---

| ⬅️ Previous Lab | Next Lab ➡️ |
|-----------------|------------|
| [Lab 1 – Database Design](../lab1/README.MD) | [Lab 3 – Advanced Security](../lab3/README.MD) |

