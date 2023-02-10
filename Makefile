# Variables
DOCKER = docker
DOCKER_COMPOSE = docker-compose
EXEC = $(DOCKER) exec -w /var/www/proj www_docker_env
PHP = $(EXEC) php
COMPOSER = $(EXEC) composer
NPM = $(EXEC) npm
SYMFONY_CONSOLE = $(PHP) bin/console

# Colors
GREEN = /bin/echo -e "\x1b[32m\#\# $1\x1b[0m"
RED = /bin/echo -e "\x1b[31m\#\# $1\x1b[0m"

init: ## Init the project
	$(MAKE) docker-start
	$(MAKE) composer-install
	

cache-clear: ## Clear cache
	$(SYMFONY_CONSOLE) cache:clear

docker-start: ## Start app
	$(DOCKER_COMPOSE) up -d

composer-install: ## Installer composer
	$(COMPOSER) install

composer-update: ## Composer update
	$(COMPOSER) update