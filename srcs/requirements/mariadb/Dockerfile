FROM debian:11
RUN	apt update && apt install -y --no-install-recommends --no-install-suggests \
    mariadb-server \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3306

LABEL version="1.0"
LABEL description="MariaDB Server"

HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["mariadbd"]