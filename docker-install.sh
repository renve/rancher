#!/bin/bash

# Intalls docker

sudo yum update -y

tar -xvf docker-ce.tar
sudo yum localinstall tmp/docker-ce/*.rpm -y
sleep 1
sudo systemctl start docker
sleep1
sudo systemctl enable docker

# add vagrant to docker group to avoid typing sudo before docker commands will need to exit the shell session
sudo usermod -aG docker vagrant
