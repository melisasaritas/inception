#!/bin/bash
set -e
touch /var/www/sqlfile.sql

cat <<EOF > /var/www/sqlfile.sql
CREATE DATABASE IF NOT EXISTS wordpress_db;
CREATE USER IF NOT EXISTS 'msaritas'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'msaritas'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';
EOF

echo "SQL file created at sqlfile.sql"
