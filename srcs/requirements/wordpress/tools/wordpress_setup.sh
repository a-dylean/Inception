#!/bin/bash

php_version=$(php -v | head -n 1 | awk '{print substr($2, 1, 3)}')

## php-fpm config
# Listen to 9000
sed -i "s/listen = \/run\/php\/php$php_version-fpm.sock/listen = 9000/" /etc/php/$php_version/fpm/pool.d/www.conf
# Make php in foreground
sed -i 's/;daemonize = yes/daemonize = no/' /etc/php/$php_version/fpm/php-fpm.conf

# Wordpress config
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /usr/local/bin/
chmod +x /usr/local/bin/wp-cli.phar
mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp

wp core download --path='/var/www/html/wordpress' --allow-root
cd /var/www/html/wordpress
chmod -R 774 /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress

if [ ! -f wp-config.php ] ; then
	echo "Creating wp-config.php..."
	wp config create \
		--dbhost=$DB_HOST \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--dbprefix=wp_ \
		--allow-root
fi

if ! wp core is-installed --allow-root ; then
	echo "Installing Wordpress..."
	wp core install \
		--url=localhost \
		--admin_email=$WP_ADMIN_EMAIL \
		--title="Inception" \
		--admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASSWORD \
		--skip-email \
		--allow-root
	echo "Creating user $WP_USER..."
	wp user create \
		$WP_USER $WP_USER_EMAIL \
		--role=editor \
		--user_pass=$WP_ADMIN_PASSWORD \
		--allow-root
fi

php-fpm$php_version -F -R --nodaemonize