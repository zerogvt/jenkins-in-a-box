#!/bin/bash

source ./jenkins.env
curl localhost:${JENKINS_HOST_PORT}
