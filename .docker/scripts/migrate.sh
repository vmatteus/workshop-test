#!/usr/bin/.env bash
source $(dirname "$0")/colors.sh

echo -e $RED_COLOR"Running Migrations..."$RESET_COLOR
docker-compose -f ./docker-compose.yml exec -T php-fpm php artisan migrate
