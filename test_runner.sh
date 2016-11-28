#!/bin/bash

COMPOSE_ARGS=" -f jenkins.yml -p hacker_registration_jenkins"

docker-compose $COMPOSE_ARGS stop
docker-compose $COMPOSE_ARGS rm --force -v

# build the image
docker-compose $COMPOSE_ARGS build --force-rm

# stand up the services
docker-compose $COMPOSE_ARGS up -d

# create test database
docker-compose $COMPOSE_ARGS run web rake db:create

# run migrations
docker-compose $COMPOSE_ARGS run web rake db:migrate

# run rubocop
docker-compose $COMPOSE_ARGS run web rubocop --format html > $HOME/rubocop.html

# run rspec tests
docker-compose $COMPOSE_ARGS run web rspec

# stop and remove all containers
docker-compose $COMPOSE_ARGS stop
docker-compose $COMPOSE_ARGS rm --force -v
