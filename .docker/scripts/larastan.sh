#!/usr/bin/.env bash
source $(dirname "$0")/colors.sh
options=(`docker container ls --filter "label=php" --format "{{.Names}}"`)

echo -e $RED_COLOR"Running Larastan analyse..."$RESET_COLOR
docker-compose -f ./docker-compose.yml exec php-fpm vendor/bin/phpstan analyse
