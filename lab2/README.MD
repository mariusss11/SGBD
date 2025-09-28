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
![EcoCarRental Security Diagram](https://www.plantuml.com/plantuml/png/TLBDSjCm4BxhANRA8N3e32sbS69QF0aNJWbmNwoDgwaiULPIEp73gIy1mplm4lIGnqAErTXMqajYxVVjjp_xNJcFx4EjXQQr1s-1LNNZGIgcqYjhXBjLfa766h3qbbT-emdmdfojQGHsT3HLn7u8W8-M9N5XjMLuSJv_VrcSnUZ26hzIBS7PHNhrQj-jbkBdI2muAj4bAInlAxR1o2Itk5XSBjuT52dUpD--dXGvZvfYrpGKMf7nwR7ok5wdxsjPAwESPuml8OOfJkQbBP2NCGqrh3REKtqI6ueLPb1W6rY190XUQTKYKoeHuPVVL1imHWdRnmUeSVixbdW5wE1EqNqKTOSihvgaU8J_PTFGaPo6s5c3Ua_j1uky9RN4T_lYZmyx2fFnKUtv4VRvdyXrjpySe4Q35JsDS2qnL7aLb3BY7JoNoaU9d10QYPuIP_lB4rSqPKZIb1XPB_cQigxIehAaVtzDUQDO4O_f_MMFhBNi3hdzCxf0SDxMnExPpMKsoXj8l0WfY5q3MnqclNnrKNrfDRdEiZFuJ76jFdAUNDN_mUdfXy53UIoDdyMJAQQgVMpts_76Pys3IJO7XlqDyMnNC-YXweYPe65bG9bI1qbYAD_f90TbqS4s6J2uPJ9ZVn8nEKn7Fzouk28ZGwt5Vm00)

> **Tip:** You can open the PlantUML source to modify or expand the diagram as your database schema evolves.

### Select Queries

The script for the *select commands* in the database is [here](./select.sql)

### View Queries

The script for creating *views* the database is [here](./create_views.sql)

### Data Masking Tehnique

Implemented dynamic data masking [here](./dataMasking.sql)

### Docs

* Basic Practicies for Strong Security [here](https://www.sqlservercentral.com/articles/a-few-best-practices-for-strong-sql-server-security)
* Dynamic Data Masking [here](https://learn.microsoft.com/en-us/sql/relational-databases/security/dynamic-data-masking?view=sql-server-ver17)