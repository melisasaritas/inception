#build the docker images using docker-compose.yml

all:
	@mkdir -p /home/msaritas/data/wordpress
	@mkdir -p /home/msaritas/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f ./srcs/docker-compose.yml up --build

fclean:
	@docker-compose -f ./srcs/docker-compose.yml down -v --rmi all --remove-orphans
	@sudo rm -rf /home/msaritas/data/wordpress
	@sudo rm -rf /home/msaritas/data/mariadb

.PHONY: all re down clean