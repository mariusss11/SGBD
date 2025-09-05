#!/bin/sh

echo 'Running the script'

DB_USER="staffLogin"
DB_PASS="strongPassword#123!"
DB_NAME="EcoCarRental"

while :
do
    echo 'Enter the query (CTRL + C to stop)':  
    read query
    echo Defined query: ${query}

    sleep 1
    clear

    echo Results: 
    sqlcmd -S localhost -U "$DB_USER" -P "$DB_PASS" -d "$DB_NAME" -Q "$query" -C

    echo 'Continue (y/n): '
    read answer

    # Condition for checking if the user wants to stop the script
    if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
        echo "Exiting..."
        exit 0
    fi
    clear
    echo 
done