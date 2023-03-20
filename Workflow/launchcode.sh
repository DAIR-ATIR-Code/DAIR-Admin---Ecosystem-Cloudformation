#!/bin/bash

#make the script executable
#chmod a+x ~/launchcode.sh

#install docker and all dependencies
echo "Installing docker and all dependencies"
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install python3-pip -y
sudo apt-get install docker-compose -y
sudo systemctl enable --now docker
sudo groupadd docker
sudo usermod -aG docker $(ls /home/* -d | head -n 1 | cut -d/ -f3)
sudo chmod 666 /var/run/docker.sock

#create directory tree for boosterpack environment
echo "Creating directory tree for boosterpack environment"
mkdir /home/$(ls /home/* -d | head -n 1 | cut -d/ -f3)/BPCode
cd /home/$(ls /home/* -d | head -n 1 | cut -d/ -f3)/BPCode

#clone repository
echo "Cloning repository
git clone https://github.com/LeslieMills/GILBP.git
cd GILBP

#Run the application
echo "Running the application"
docker pull devashishupadhyay/scikit-learn-docker
docker-compose up --build --detach