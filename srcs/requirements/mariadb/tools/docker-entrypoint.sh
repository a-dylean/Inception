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
    cat << EOF > /tmp/create_db.sql
FLUSH PRIVILEGES;
DELETE FROM     mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF
        mysql < /tmp/create_db.sql
        rm -f /tmp/create_db.sql
fi