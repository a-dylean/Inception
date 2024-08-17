FROM debian:11

EXPOSE 443

RUN	apt update && apt install -y --no-install-recommends --no-install-suggests \
    nginx \
    openssl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl
RUN chown -R www-data:www-data /var/www/html
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]