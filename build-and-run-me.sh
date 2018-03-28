#!/bin/bash

#fail fast
set -e

# read our env vars
source jenkins.env; 

# fix our docker and ansible templates according to our env (ENV_SUBTITUTION)
rm -rf docker-compose.yml; envsubst < "docker-compose-template.yml" > "docker-compose.yml";
rm -rf jenkins-ansible.yml; envsubst < "jenkins-ansible-template.yml" > "jenkins-ansible.yml";

rm -rf nodes
mkdir nodes
for SLAVE_X_NAME in "${SLAVES_NAMES[@]}"
do
  echo "[INFO] Fixing slave's jenkins xml config file for slave: ${SLAVE_X_NAME}"
  export SLAVE_X_NAME=${SLAVE_X_NAME}
  mkdir nodes/${SLAVE_X_NAME}
  envsubst < "slave-template.xml" > "nodes/${SLAVE_X_NAME}/config.xml";

  echo "[INFO] Adding slave's config to docker-compose.yml"
  envsubst < "docker-compose-slave-template.yml" >> "docker-compose.yml";
done

docker-compose build
docker-compose up --force-recreate
