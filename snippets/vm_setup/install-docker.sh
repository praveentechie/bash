#!/bin/bash

echo "********************Start of installation********************"
echo "Installing yum utils";
sudo yum install -y yum-utils
sleep 2;
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sleep 2;
echo "********************Installing docker engine********************";
sudo yum install docker-ce docker-ce-cli containerd.io -y
sleep 2;
sudo yum install docker-ce-20.10.2-3.el7 docker-ce-cli-20.10.2-3.el7 containerd.io -y

sleep 2;
echo "********************starting docker daemon********************";
sudo systemctl start docker
echo "Docker daemon started. Sleeping for 20 sec...";
sleep 20;

echo "********************Installing docker-compose********************";
curl -L https://github.com/docker/compose/releases/download/1.11.2/docker-compose-`uname -s`-`uname -m` > ~/docker-compose
chmod +x ~/docker-compose
sudo mv ~/docker-compose /usr/local/bin/docker-compose

echo "********************Adding user to docker group********************";
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Docker setup completed. Run `sudo docker run hello-world` to verify installation correctness";
echo "Logout and login back for docker-compose to work";
echo "********************End of installation********************"