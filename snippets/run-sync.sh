#!/bin/bash
echo "rs: Cloning repo"
git clone ssh://git@stash.agilysys.local:7999/~arunachalamp/pr-updater.git
echo "rs: move config"
mv ./config.js ./pr-updater/

cd pr-updater/

echo "rs: chmod and run sync"
chmod 777 ./pr-updater-automated.sh
./pr-updater-automated.sh --process > ./cron.log

echo "rs: done"