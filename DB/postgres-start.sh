#!/bin/bash
sudo systemctl start postgresql
sleep 10
sudo -i -u postgres psql -d _playground
