#!/bin/bash

# Install WP-CLI
if [ ! -f /usr/local/bin/wp ]; then
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

# Set up WordPress configuration file
touch /var/www/html/wp-config.php
php /var/www/wpconf.php

# Run WP-CLI to complete the WordPress setup
cd /var/www/html
wp core install --url=${WP_URL} --title="${WP_TITLE}" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root
wp user create --user_login=${WP_USER_USER} --user_email=${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --allow-root

echo "WordPress installation and configuration complete!"

# Run any additional commands or services here
exec "$@"
