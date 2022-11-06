#!/usr/bin/.env bash
source $(dirname "$0")/colors.sh

echo -e $RED_COLOR"Running Database Seeds..."$RESET_COLOR
docker-compose -f ./docker-compose.yml exec -T php-fpm php artisan db:seed
