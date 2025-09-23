# This is a doc file for Linux users for starting / running mssql-server 


## ▶️ To start it manually:
```
sudo systemctl start mssql-server
```

## 🔄 To restart (if it was running before):

```
sudo systemctl restart mssql-server
```

## 🚀 To make it start automatically on boot:
```
sudo systemctl enable mssql-server
```

## ✅ Then check again:
```
systemctl status mssql-server
```

#### You should see something like:
```
Active: active (running)
```

## To see all services running 
```
systemctl list-unit-files --type=service
```

## To see only the running services:
```
systemctl list-units --type=service --state=running
```


### Password for user auth for the SQL Server

The user for the client
```
Username: client
Password: qwerty!2#
```

The user for the staff
```
Username: staff_login
Password: staff123.
```

## Command to connect to the db using *sqlcmd*
```bash
sqlcmd -S localhost -U "$DB_USER" -P "$DB_PASS" -d "EcoCarRental" -C
```

