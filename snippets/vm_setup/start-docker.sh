#!/bin/bash

dockerStatus=$(systemctl is-active docker)

if [[ $dockerStatus == "inactive" ]]; then
	echo "Docker daemon is not running. Starting now...";
	sudo systemctl start docker
else
	echo "Docker daemon is running";
fi
