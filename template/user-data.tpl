#!/bin/bash -e

NODE_NAME=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
if [ -z "$NODE_NAME" ]; then
  NODE_NAME=$(hostname)
fi]

#Docker installation
sudo apt-get update
sudo apt install docker.io -y
sudo apt-get install docker-compose -y
sudo usermod -a -G docker $USER

sudo mkdir -p /tmp/test/