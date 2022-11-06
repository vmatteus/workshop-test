#!/usr/bin/.env bash
source $(dirname "$0")/colors.sh

ASK=$RED_COLOR"What report do you want to generate?? "$RESET_COLOR
EXIT="exit"
PS3=$ASK

select opt in "Report" "Coverage" "Coverage-html" $EXIT
do
    if [[ $opt == $EXIT || $REPLY == 'exit' ]]; then
        break;
    fi

    case $opt in
        Report)
            echo 'generating report...'
	        docker-compose -f ./docker-compose.yml exec -T php-fpm vendor/bin/codecept run --html
	        break;;
        Coverage)
	        echo 'generating coverage...'
	        docker-compose -f ./docker-compose.yml exec -T php-fpm vendor/bin/codecept run api --coverage
	        break;;
        Coverage-html)
	        echo 'generating coverage...'
	        docker-compose -f ./docker-compose.yml exec -T php-fpm vendor/bin/codecept run api --coverage --coverage-html
	        break;;
        *)
            break;;
    esac
done
