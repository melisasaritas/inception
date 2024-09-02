#!/bin/bash

if [ ! -f /var/www/sqlfile.sql ]; then
cat <<EOF > "/var/www/sqlfile.sql"
CREATE DATABASE IF NOT EXISTS wordpress_db;
CREATE USER IF NOT EXISTS 'msaritas'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'msaritas'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';
EOF
echo "SQL file created at"
fi

service mysql start

# Wait for MariaDB to start and the socket file to be available
until [ -S /run/mysqld/mysqld.sock ]; do
    echo "Waiting for MariaDB to start..."
    sleep 1
done

# Execute SQL commands
mysql < /var/www/sqlfile.sql

# Remove SQL file
rm -f /var/www/sqlfile.sql

exec "$@"