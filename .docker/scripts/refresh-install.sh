#!/usr/bin/.env bash
source $(dirname "$0")/colors.sh

echo 'Refreshing instalation...'
docker-compose -f docker-compose.yml down

if [  -f .docker/mysql/dbdata ]; then
    rm -rf .docker/mysql/dbdata
fi

if [  -f .env ]; then
    rm -rf .env
fi

docker rmi workshop-test-php-fpm workshop-test-mysql workshop-test-nginx
