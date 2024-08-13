FROM debian:11
EXPOSE 443
RUN	apt update && apt install -y --no-install-recommends --no-install-suggests \
    nginx \
    openssl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl
# COPY index.html /usr/share/nginx/html
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY conf/ssl/atonkopi.42.fr.key /etc/nginx/ssl
COPY conf/ssl/atonkopi.42.fr.crt /etc/nginx/ssl
CMD ["nginx", "-g", "daemon off;"]