FROM debian:11

ARG PHP_VERSION=8.2 \
    DB_NAME \
    DB_USER \
    DB_PASS

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget \
    unzip \
    lsb-release \
    ca-certificates \
    apt-transport-https \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update && apt-get install -y \
    php${PHP_VERSION} \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-common \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-openssl \
    # && sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf \
    # && sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf \
    # && sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf \
    && rm -rf /var/lib/apt/lists/*

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
CMD ["/usr/sbin/php-fpm82", "-F"]