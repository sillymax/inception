#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

rm -rf /var/www/html/*
cd /var/www/html
wp core download --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --allow-root
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_SUPER_USER --admin_password=$WP_SUPER_PASS --admin_email=$WP_SUPER_EMAIL --allow-root
wp user create $WP_USER $WP_EMAIL --role=contributor --user_pass=$WP_PASS --allow-root

php-fpm7.4 -F
