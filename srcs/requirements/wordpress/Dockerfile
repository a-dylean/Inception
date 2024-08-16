FROM debian:11

RUN apt update && \
    apt install -y \
    php7.4-fpm \
    php7.4-mysqli \
    curl \
    wget \
    unzip && \
    # sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf && \
    # sed -i "s|;listen.owner = www-data|listen.owner = www-data|g" /etc/php/7.4/fpm/pool.d/www.conf && \
    # sed -i "s|;listen.group = www-data|listen.group = www-data|g" /etc/php/7.4/fpm/pool.d/www.conf && \
    rm -rf /var/lib/apt/lists/*
    
WORKDIR /var/www
# Download and install WordPress.
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

COPY conf/wp-config-create.sh .

RUN sh wp-config-create.sh && rm wp-config-create.sh && \
        chmod -R 0777 wp-content/
    
# Starting PHP-FPM
CMD ["php-fpm7.4", "-F"]