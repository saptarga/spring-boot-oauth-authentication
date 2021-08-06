#!/usr/bin/env bash

echo 'Stopping containers'
docker-compose -f docker-compose.yml down

read -p "Do you want to remove created image ? (y/n) " option

if [[ ${option} == y ]]
then
    docker image rm spring-boot-oauth-authentication_web-service
fi