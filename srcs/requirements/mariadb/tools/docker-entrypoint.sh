#!/bin/bash

DIR="/var/lib/mysql/mysql"

if [ -d "$DIR" ]; then
    echo "Starting MariaDB..."
    mariadbd-safe --bind-address=0.0.0.0
else
    echo "$DIR does not exist."
    echo "Initializing MariaDB database..."
    mariadb-install-db --user=mysql
    sed -i '/^bind-address*/ s/^/#/' /etc/mysql/my.cnf
    echo "MariaDB initialization completed."
    echo "Starting MariaDB..."
    mariadbd-safe --bind-address=0.0.0.0 &
    echo "Waiting for MariaDB to start..."
    sleep 5
    echo "Boostrapping DB..."
    mysql < ./createdb.sql
fi