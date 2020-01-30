#!/bin/bash

#uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc -y

sudo apt-get update

#Install packages to allow apt to use a repository over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

#add docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# setup the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

#install lastest version of docker engine and containerd
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

#pull hello-world for test
sudo docker run hello-world
