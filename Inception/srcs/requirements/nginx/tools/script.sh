#!/bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
echo "Nginx: setting up ssl ...";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out $CERTS_ -subj "/C=TR/ST=ISTANBUL/L=MASLAK/O=42Istanbul/CN=msaritas.42.fr";
echo "Nginx: ssl is set up!";
fi

echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    #server_name $DOMAIN_NAME;

    ssl_certificate $CERTS_;
    ssl_certificate_key /etc/ssl/private/nginx.key;" > /etc/nginx/sites-available/default


echo '
    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/html;

    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass wordpress:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }
} ' >>  /etc/nginx/sites-available/default

nginx -g "daemon off;"