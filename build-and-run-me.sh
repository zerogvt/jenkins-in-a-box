#!/bin/bash

#fail fast
set -e

source jenkins.env; 
rm -rf docker-compose.yml; envsubst < "docker-compose-template.yml" > "docker-compose.yml";
rm -rf jenkins-ansible.yml; envsubst < "jenkins-ansible-template.yml" > "jenkins-ansible.yml";
ls -la
sleep 10
docker-compose build
docker-compose up
