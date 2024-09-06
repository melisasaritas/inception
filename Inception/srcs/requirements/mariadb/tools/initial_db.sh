set -ex

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -u${DB_ROOT} -p${DB_ROOTPASS} -e "ALTER USER '${DB_ROOT}'@'localhost' IDENTIFIED BY '${DB_ROOTPASS}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u${DB_ROOT} -p${DB_ROOTPASS} shutdown

exec "$@"