# SGBD — Yearly Projects in SQL & Database Systems

**Author:** mariusss11  
**Repository:** SGBD  
<!-- **Last update:** *(date you last commit / update this file)* -->

---

## 🧾 Overview

This repository collects all the work I’ve done during my year in database theory, SQL, and related programming assignments. It contains labs, database schemas, scripts, and related files organized by lab.

The goal is to have a structured portfolio of my learning, experimentation, and solutions in relational database systems (SGBD).

---

## 📂 Repository Structure

```
SGBD/
│
├── lab1/               
├── lab2/            
├── lab3/            
└── README.md        # This file
```

You may also find other directories or files added as the year progressed.

---

## 🛠 What’s Inside / Features

- SQL scripts (CREATE, INSERT, UPDATE, DELETE, SELECT, etc.)  
<!-- - Stored procedures, triggers, views   -->
<!-- - Database schema files   -->
<!-- - Sample data sets   -->
- Basic shell / deployment scripts
- Configuration instructions (credentials, setup)  

---

## 🚀 Setup & Usage

To run or test the scripts in this repo, follow these steps (adjust based on your environment):

### 1. Install / Setup a SQL Engine
- Example: Microsoft SQL Server (i used th e one for Linux)  
- Ensure you have client tools installed (e.g. `sqlcmd` for *Linux*)

### 2. Start SQL Server (Linux Users)

```bash
# ▶️ Start manually
sudo systemctl start mssql-server

# 🔄 Restart if already running
sudo systemctl restart mssql-server

# 🚀 Enable auto-start on boot
sudo systemctl enable mssql-server

# ✅ Check status
systemctl status mssql-server
```

Expected output:
```
Active: active (running)
```

### 3. Useful Service Commands
```bash
# Show all services
systemctl list-unit-files --type=service

# Show only running services
systemctl list-units --type=service --state=running
```

### 4. Create Database
- Use the provided `.sql` files in `lab1/`  
- Define tables, constraints, and relationships  

### 5. Retrive Data
- Run **select** scripts  

### 6. Credentials / Access
Test users available in the repo:

```
Client User:
  Username: client
  Password: qwerty!2#

Staff User:
  Username: staff_login
  Password: staff123.
```

*(Update them as needed — do **not** use in production environments)*

### 7. Connect with `sqlcmd`
Example for **EcoCarRental** database:

```bash
sqlcmd -S localhost -U "$DB_USER" -P "$DB_PASS" -d "EcoCarRental" -C
```

---

## ✅ Status & Known Issues

- Scripts tested in classroom environment  
- Some queries may require dialect adjustments (PostgreSQL, MySQL, etc.)  
- Paths and credentials may need updating on different systems  

---

## 📞 Contact & Acknowledgments

- **Author / Maintainer**: mariusss11  
- Special thanks to professors for support during this year (2024-2026) 

---