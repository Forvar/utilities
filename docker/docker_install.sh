#!/bin/bash

# Install:
sudo apt update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce



# Useful commands:
#
# Build the 'webapp' machine from a docker file in the current directory:
# 	sudo docker build -t webapp . 
#
# Run the 'webapp' machine in daemon mode, mapping its port 80 to the local port 8000:
# 	sudo docker run -d -p 8000:80 webapp
#
# Stop all containers:
# 	sudo docker stop $(sudo docker ps -a -q)
#
# Remove all containers:
# 	sudo docker rm $(sudo docker ps -a -q)
#
# Remove all images:
# 	sudo docker rmi $(sudo docker images -q)
