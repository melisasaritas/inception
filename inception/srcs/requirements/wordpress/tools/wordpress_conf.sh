#!/bin/bash


# Install wordpress
if [ ! -f /var/www/html/wp-config-sample.php ]; then
    sed -i "s/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/" "/etc/php/8.2/fpm/pool.d/www.conf";
    chown -R www-data:www-data /var/www/*;
	chown -R 755 /var/www/*;
	mkdir -p /run/php/;
	touch /run/php/php8.2-fpm.pid;
    cd /var/www/html
    wp core download --allow-root
    # Set up WordPress configuration file
    php /var/www/wpconf.php
    wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USER_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root
    wp plugin update --all --allow-root
fi

echo "WordPress installation and configuration complete!"

# Run any additional commands or services here
exec "$@"
