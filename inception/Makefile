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
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf /home/msaritas/data/wordpress
	rm -rf /home/msaritas/data/mariadb

.PHONY: all re down clean