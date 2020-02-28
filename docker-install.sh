#!/bin/bash

# Docker Setup Script
# @ling218 20200222 
# LICENSE: MIT

# Remove any existing docker packages and update package list
sudo apt-get remove docker docker-engine docker.io -y
sudo apt-get update

# Install apt HTTPS packages
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y

# Add Docker GPG key
# curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
# China 
curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/debian/gpg | sudo apt-key add -
# Verify key exists
# sudo apt-key fingerprint 0EBFCD88

# Add stable repo
# echo "deb https://download.docker.com/linux/debian buster stable" > /etc/apt/sources.list.d/docker.list
# China
echo "deb https://mirrors.ustc.edu.cn/docker-ce/linux/debian buster stable" > /etc/apt/sources.list.d/docker.list

# Update repo list
sudo apt-get update

# Install docker-ce
sudo apt-get install docker-ce -y

cat << EOF > /etc/docker/daemon.json
{
    "registry-mirrors": [
        "https://dockerhub.azk8s.cn",
        "https://hub-mirror.c.163.com"
    ]
}
EOF

# Verify install by running the docker hello world
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo docker run hello-world
