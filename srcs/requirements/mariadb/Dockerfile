FROM debian:11

RUN		apt update && \
		apt install -y --no-install-recommends --no-install-suggests \
		mariadb-server sudo && \
		rm -rf /var/lib/apt/lists/*

# ensure that /run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
RUN mkdir -p /run/mysqld; \
	chmod 777 /run/mysqld;

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY ./tools/createdb.sql /

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3306

CMD ["docker-entrypoint.sh"]