#!/bin/bash
echo "Killing mongod: $(sudo pgrep -u root 'mongod')"
sudo pkill -f mongod
