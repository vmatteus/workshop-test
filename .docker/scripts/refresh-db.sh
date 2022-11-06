#!/usr/bin/.env bash
source $(dirname "$0")/colors.sh

echo -e $RED_COLOR"Updating auto-load..."$RESET_COLOR
docker-compose -f ./docker-compose.yml exec -T php-fpm composer dump-autoload

echo -e $RED_COLOR"Dropping all tables. Re-running migrations..."$RESET_COLOR
docker-compose -f ./docker-compose.yml exec -T php-fpm php artisan migrate:refresh

echo -e $RED_COLOR"Re-Running all seeds..."$RESET_COLOR
docker-compose -f ./docker-compose.yml exec -T php-fpm php artisan db:seed
