FROM debian:11

RUN apt update && \
    apt install -y \
    php-fpm \
    php-mysqli \
    curl \
    wget \
    unzip && \
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
