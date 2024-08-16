**Resources**

***The Operating System***
1. Debian releases: https://www.debian.org/releases/

***NGINX***
1. [NGINX official documentation](https://nginx.org/en/docs/)
2. [Installation for Debian](https://nginx.org/en/linux_packages.html#Debian)
3. [NGINX Guide](https://nginx.org/en/docs/beginners_guide.html)
4. [Configuring HTTPS servers](https://nginx.org/en/docs/http/configuring_https_servers.html)
5. [Configure NGINX container with docker secrets](https://docs.docker.com/engine/swarm/secrets/) (search: Configure the Nginx container)

***WordPress***
1. Installation: https://developer.wordpress.org/advanced-administration/before-install/howto-install/

***PHP***
1. PHP Manual: https://www.php.net/manual/en/index.php
2. FastCGI Process Manager (FPM): https://www.php.net/manual/en/install.fpm.php
3. Required PHP modules for Wordpress: https://make.wordpress.org/hosting/handbook/server-environment/#php 

***MariaDB***
1. Creating custom image: https://mariadb.com/kb/en/creating-a-custom-container-image/
2. Create database: https://mariadb.com/kb/en/create-database/
3. Create user: https://mariadb.com/kb/en/create-user/

***OpenSSL***
1. Doc: https://docs.openssl.org/master/man1/openssl-req/#options

**Commands**

***Docker***

```docker compose up --build -d```

***MySQL***

Run the container and open bash: ```docker exec -it mariadb bash```

```mysql -h localhost -p 3306 -u atonkopi```

```mysql -u root -p```

Connect to db on port 3306 with atonkopi user via TCP: ```mysql -P 3306 -u atonkopi -p --protocol=TCP```

***Other***

```sudo rm -rf db/*```