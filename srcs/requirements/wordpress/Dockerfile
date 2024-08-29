FROM debian:11

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  wget \
  php-mysql \
  php-fpm \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php/
COPY ./tools/wordpress-setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress-setup.sh
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT [ "wordpress-setup.sh" ]