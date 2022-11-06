#!/usr/bin/.env bash
source $(dirname "$0")/colors.sh

# ASK=$RED_COLOR"What suit test do you want to running?? "$RESET_COLOR
# EXIT="exit"
# PS3=$ASK

# select opt in "all" "api" "functional" "unit" $EXIT
# do
#     if [[ $opt == $EXIT || $REPLY == 'exit' ]]; then
#         break;
#     fi

#     case $opt in
#         all)
#             echo 'Running all suits...'
#             docker-compose -f ./docker-compose.yml exec -T php-fpm vendor/bin/phpunit
# 	        break;;
#         api)
#             echo 'Running API suit...'
# 	        docker-compose -f ./docker-compose.yml exec -T php-fpm vendor/bin/phpunit api
# 	        break;;
#         functional)
# 	        echo 'Running Functional suit...'
# 	        docker-compose -f ./docker-compose.yml exec -T php-fpm vendor/bin/phpunit functional
# 	        break;;
#         unit)
# 	        echo 'Running Unit suit...'
# 	        docker-compose -f ./docker-compose.yml exec -T php-fpm vendor/bin/phpunit unit
# 	        break;;
#         *)
#             break;;
#     esac
# done

echo 'Running all suits...'
docker-compose -f ./docker-compose.yml exec -T php-fpm vendor/bin/phpunit
