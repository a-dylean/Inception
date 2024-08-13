ssl:
	mkdir -p srcs/requirements/nginx/ssl
	(cd srcs/requirements/nginx/ && openssl req -x509 -nodes -out ssl/atonkopi.42.fr.crt -keyout ssl/atonkopi.42.fr.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=atonkopi/CN=atonkopi.42.fr")

all: ssl
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

ps:
	docker-compose -f srcs/docker-compose.yml ps

re:	down
	docker-compose -f ./docker-compose.yml up -d --build

clean: down
	docker system prune -a

fclean:
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force

.PHONY	: all build down re clean fclean