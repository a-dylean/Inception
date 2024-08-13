FROM debian:11

ARG PHP_VERSION=8 \
    DB_NAME \
    DB_USER \
    DB_PASS
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
    /etc/php8/php-fpm.d/www.conf \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
    /etc/php8/php-fpm.d/www.conf \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
    /etc/php8/php-fpm.d/www.conf \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www
# Download and install WordPress.
RUN wget https://wordpress.org/latest.zip \
    && unzip latest.zip \
    && mv wordpress/* /var/www/html/ \
    && rmdir /var/www/html/wordpress \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && rm latest.zip

COPY ./requirements/wordpress/conf/wp-config-create.sh .
RUN sh wp-config-create.sh && rm wp-config-create.sh && \
        chmod -R 0777 wp-content/
    
# Starting PHP-FPM
CMD ["/usr/sbin/php-fpm82", "-F"]