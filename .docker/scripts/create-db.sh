#!/usr/bin/.env bash
source $(dirname "$0")/colors.sh

echo -e $RED_COLOR"Creating database"$RESET_COLOR

docker-compose -f ./docker-compose.yml exec mysql mysql -uroot -proot -e 'CREATE DATABASE IF NOT EXISTS workshop_test;'
echo -e $GREEN_COLOR"workshop_test created"$RESET_COLOR

docker-compose -f ./docker-compose.yml exec mysql mysql -uroot -proot -e 'CREATE DATABASE IF NOT EXISTS workshop_test_testing;'
echo -e $GREEN_COLOR"workshop_test_testing created"$RESET_COLOR
