#!/bin/bash
sudo mongod --fork --logpath /var/log/mongod.log
sleep 5
mongo
