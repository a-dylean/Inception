**Inception**
---
42 school project about setting up a small infrastructure composed of WordPress with LEMP Stack (Nginx, MariaDB and PHP) using Docker / Docker-Compose.

**How to run the project**
---
1. Create the .env file in ```srcs``` folder with the following variables:
```
# SSL certificate requirements

USER=
LOCATION=
ORGANISATION=

# MariaDB(MySQL) database config

DB_HOST=
DB_NAME=
DB_USER=
DB_PASSWORD=

# Wordpress config

WP_ADMIN_USER=
WP_ADMIN_PASSWORD=
WP_USER=
WP_USER_EMAIL=
WP_ADMIN_EMAIL=
```
2. Start the project with this command which will create SSL certificates, build the images and start the containers:
```
make all
```
3. To stop and remove containers, images, volumes and network:
```
make fclean
```

**Useful resources for configuration and evaluation of the project**
---
***The Operating System***
1. Debian releases: https://www.debian.org/releases/
2. FPM version for Debian: https://packages.debian.org/search?keywords=php-fpm

***NGINX***
1. [NGINX official documentation](https://nginx.org/en/docs/)
2. [Installation for Debian](https://nginx.org/en/linux_packages.html#Debian)
3. [NGINX Guide](https://nginx.org/en/docs/beginners_guide.html)
4. [Configuring HTTPS servers](https://nginx.org/en/docs/http/configuring_https_servers.html)
5. [Configure NGINX container with docker secrets](https://docs.docker.com/engine/swarm/secrets/) (search: Configure the Nginx container)

***WordPress***
1. [Installation](https://developer.wordpress.org/advanced-administration/before-install/howto-install/)
2. Access WP-Admin: access WP-Admin by typing your website address in your browser’s address bar, followed by /wp-admin. For example: atonkopi.42.fr/wp-admin

***PHP***
1. [PHP Manual](https://www.php.net/manual/en/index.php)
2. [FastCGI Process Manager (FPM)](https://www.php.net/manual/en/install.fpm.php)
3. [Required PHP modules for Wordpress](https://make.wordpress.org/hosting/handbook/server-environment/#php)

***MariaDB***
1. [Creating custom image](https://mariadb.com/kb/en/creating-a-custom-container-image/)
2. [Create database](https://mariadb.com/kb/en/create-database/)
3. [Create user](https://mariadb.com/kb/en/create-user/)

***OpenSSL***
1. [Documentation](https://docs.openssl.org/master/man1/openssl-req/#options)

**Commands**

***Docker***

- ```docker-compose -f srcs/docker-compose.yml up --build -d```
- ```docker stop $(docker ps -qa)```
- ```docker volume ls```
- ```docker image ls```
- ```docker image inspect```
- ```docker network inspect```
- ```docker logs```
- ```docker volume rm```

***MySQL***

- Run the container and open bash: ```docker exec -it mariadb bash```
- Connect to the db as root: ```mysql -u root -p```
- Connect to db on port 3306 with atonkopi user via TCP: ```mysql -P 3306 -u atonkopi -p --protocol=TCP```
- Show all databases: ```SHOW DATABASES;```
- Show all tables from a database db: ```SHOW TABLES FROM db;```
- Show all WP users: ```USE db; SELECT * FROM wp_users;```

***Other***

- Check out connection: ```wget https://atonkopi.42.fr:443 --no-check-certificate```
- Change localhost: ```sudo vim /etc/hosts```
