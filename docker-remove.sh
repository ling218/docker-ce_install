#!/bin/bash

# docker-ce remvoe
# @ling218 20200222
# MIT

sudo apt-get remove docker-ce -y
sudo rm -rf /etc/docker/daemon.json
sudo rm -rf /etc/apt/sources.lsit.d/docker.list
sudo apt-get autoremove -y 

