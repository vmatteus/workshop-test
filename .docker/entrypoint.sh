#!/bin/bash

if [ ! -f .env ]; then
    cp .env.example .env
fi

if [ ! -f .env.testing ]; then
    cp .env.testing.example .env.testing
fi

chown -R 1000:www-data storage/ bootstrap/cache/
chmod -R 775 storage/ bootstrap/cache/

php-fpm
