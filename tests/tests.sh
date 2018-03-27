#!/bin/bash

source ../jenkins.env

echo "* * * * * * * * * * * *"
echo "TEST: Knock port localhost:${JENKINS_HOST_PORT}"
curl localhost:${JENKINS_HOST_PORT}
