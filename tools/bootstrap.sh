#!/usr/bin/env bash
set -e
PROJ_NAME=muc_adn

apt-get update
apt-get install -y git
# install Docker as per https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce
docker --version

# install docker-compose as per https://docs.docker.com/compose/install/#install-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version


# tests
rm -rf ${PROJ_NAME}
git clone https://github.com/zerogvt/${PROJ_NAME}.git
cd ${PROJ_NAME}
chmod +x build-and-run-me.sh
./build-and-run-me.sh &
sleep 90
source ./jenkins.env
curl localhost:${JENKINS_HOST_PORT}


