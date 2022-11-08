help: 	 		 ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build: 		 	 ## Build all docker containers.
	@docker-compose -f docker-compose.yml build --no-cache

up: 	 		 ## Up all docker containers.
	@docker-compose -f ./docker-compose.yml up -d

down: 	 		 ## Down all docker containers.
	@docker-compose -f ./docker-compose.yml down

refresh:  		 ## Put down, rebuild and up all docker containers.
	@bash ./.docker/scripts/refresh.sh

refresh-install: ## Put down, rebuild and up all docker containers.
	@bash ./.docker/scripts/refresh-install.sh

in: 	         ## Show user a list of avaliable docker containers to go inside like root.
	@bash ./.docker/scripts/in-root.sh

logs:			 ## Show logs of all containers.
	@bash ./.docker/scripts/docker-log.sh

docker-clean:	 ## Remove all Containers, Images, Networks and Volumes.
	@bash ./.docker/scripts/docker-clean.sh

composer-install:## Install composer in php container.
	@bash ./.docker/scripts/composer-install.sh

composer-dump:	 ## Run composer dump in php container.
	@bash ./.docker/scripts/composer-dump.sh

migrate:  		 ## Run all migrations in php container.
	@bash ./.docker/scripts/migrate.sh

seed: 	 		 ## Run all seeders in php container.
	@bash ./.docker/scripts/seed.sh

refresh-db:   	 ## Drop all tables, re-run migrations and re-seed in php container.
	@bash ./.docker/scripts/refresh-db.sh

test:            ## Run tests suits from Codeception.
	@bash ./.docker/scripts/test.sh

test-reports:    ## Generate Report and Coverage off tests from codeception.
	@bash ./.docker/scripts/test-reports.sh

larastan:        ## Run Larastan analyse.
	@bash ./.docker/scripts/larastan.sh

permissions:   	 ## Run permissions in some directories
	@bash ./.docker/scripts/permissions.sh

create-database: ## Create database
	@bash ./.docker/scripts/create-db.sh

first-install:   ## Execute the first start of the project.
	echo "First Install"
	make build
	make up
	make create-database
	make composer-install
	make refresh-db
	make composer-dump
	make permissions
