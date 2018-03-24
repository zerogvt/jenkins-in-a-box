#!/bin/bash

#fail fast
set -e

# read our env vars
source jenkins.env; 

# fix our docker and ansible templates according to our env (ENV_SUBTITUTION)
rm -rf docker-compose.yml; envsubst < "docker-compose-template.yml" > "docker-compose.yml";
rm -rf jenkins-ansible.yml; envsubst < "jenkins-ansible-template.yml" > "jenkins-ansible.yml";

# create jenkins slaves configs
rm -rf slave_1.xml; export SLAVE_NAME=${SLAVE_1_NAME}; envsubst < "slave-template.xml" > "slave_1.xml";
rm -rf slave_2.xml; export SLAVE_NAME=${SLAVE_2_NAME}; envsubst < "slave-template.xml" > "slave_2.xml";


docker-compose build
docker-compose up


