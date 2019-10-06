#!/bin/bash

### FILES NEEDED  docker-ce.tar, k8s.tar, rke_linux..., helm-v2.14.1... in devops/dependencies


# All work should be done is this synced directory so it saves to your local computer
cd /master_data

sudo yum update -y

# Install docker-ce.tar
tar -xvf docker-ce.tar
sudo yum localinstall tmp/docker-ce/*.rpm -y
sleep 1
sudo systemctl start docker
sleep1
sudo systemctl enable docker

# Test it was installed
docker --version
echo
echo
sleep 2
echo
echo

# add vagrant user to docker group to omit using sudo with docker commands
sudo usermod -aG docker vagrant

# Navigate to Rancher docs page 
# https://rancher.com/docs/rancher/v2.x/en/installation/air-gap-high-availability/

# Download and install the Prerequisites on both nodes (kubectl, rke, helm)
# Packages should be downloaded and moved into the synced directory, master_data

# Download k8s.tar installs kubectl
tar -xvf k8s.tar
sudo yum localinstall tmp/k8s/3* -y
# Test it was installed
kubectl version
# Output will be similar to this
#Client Version: version.Info{Major:"1", Minor:"15", GitVersion:"v1.15.0"...

echo 
echo 
sleep 2
echo
echo

# rke version 0.2.4
# after dowloading rke file run below commands 
sudo chmod 755 rke_linux-amd64
sudo mv ./rke_linux-amd64 /usr/local/bin/rke
# Test it was installed
rke --version
echo
echo
sleep 2
echo 
echo

# Helm 2.14.1
# Download from our bucket ngcv-devops/dependencies
tar -zxvf helm-v2.14.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
# Test it was installed
helm help
echo
echo

# On master 192.168.1.20 node run
# sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:v2.2.4

# In slave in the master_data directory run below commands, key will allow ssh from slave to slave2 for rke
# to create a kubernetes cluster that will be added to rancher
# ssh-keygen -t rsa -b 2048 -C rke
# sudo chmod 600 rke
# mv rke ~/.ssh
# ls ~/.ssh/ # check if key is there

# In slave2 
# cat rke.pub >> ~/.ssh/authorized_keys
# cat ~/.ssh/authorized_keys #to check it got added

# From slave you should now be able to ssh into slave2
# ssh -i ~/.ssh/rke vagrant@192.168.1.22

# Install docker on slave and slave2 by running the docker-install.sh script in master_data

# In rancher add cluster select custom


