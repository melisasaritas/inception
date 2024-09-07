CREATE DATABASE IF NOT EXISTS wordpress_db;
CREATE USER 'msaritas'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'msaritas'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root123';
FLUSH PRIVILEGES;
