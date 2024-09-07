#!/bin/bash
set -ex

	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
	chown -R www-data:www-data /var/www/*;
	chown -R 755 /var/www/*;
	mkdir -p /run/php/;
	touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Wordpress: setting up..."
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/wp-config.php
	echo "if ( ! defined( 'ABSPATH' ) ) {" >> /var/www/wp-config.php
	echo "    define( 'ABSPATH', '/var/www/html/' );" >> /var/www/wp-config.php
	echo "}" >> /var/www/wp-config.php
	echo "" >> /var/www/wp-config.php # Add an empty line for readability
	echo "require_once ABSPATH . 'wp-settings.php';" >> /var/www/wp-config.php
	mv /var/www/wp-config.php /var/www/html/
	cat /var/www/html/wp-config.php
	echo "Wordpress: creating users..."
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
	echo "Wordpress: set up!"
fi

exec "$@"
