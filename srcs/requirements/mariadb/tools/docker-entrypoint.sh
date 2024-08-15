#!/bin/bash

# Directory to check
DIR="/var/lib/mysql/mysql"

# Check if the directory exists
if [ -d "$DIR" ]; then
    echo "Starting MariaDB..."
    mariadbd-safe
else
    echo "$DIR does not exist."
    echo "Initializing MariaDB database..."
    mariadb-install-db --user=mysql
    sed -i '/^bind-address*/ s/^/#/' /etc/mysql/my.cnf
    
    echo "MariaDB initialization completed."
    echo "Starting MariaDB..."
    mariadbd-safe
fi