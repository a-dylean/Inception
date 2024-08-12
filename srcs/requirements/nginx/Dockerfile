FROM debian:11
EXPOSE 443
RUN	apt update && apt install -y --no-install-recommends --no-install-suggests \
    nginx \
    openssl && \
    rm -rf /var/lib/apt/lists/*
COPY index.html /usr/share/nginx/html
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
