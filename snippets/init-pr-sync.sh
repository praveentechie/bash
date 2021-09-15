#!/bin/bash
echo "Uploading..."
scp /mnt/c/Users/arunachalamp/src/poc/package/pr-updater/config.js bastion:~/ > /dev/null 2>&1
scp /mnt/c/Users/arunachalamp/Desktop/mine/scripts/run-sync.sh bastion:~/ > /dev/null 2>&1

echo "fire run-sync.sh";
ssh bastion 'chmod 777 ./run-sync.sh && ./run-sync.sh'

# echo "Sleeping..."
# sleep 1m

echo "Downloading log..."
scp bastion:~/pr-updater/cron.log /mnt/c/Users/arunachalamp/Desktop

echo "Clean up activity..."
ssh bastion 'cd ~ && rm -Rf pr-updater && rm -Rf run-sync.sh && rm -Rf init-pr-sync.sh' > /dev/null 2>&1

echo "end of script"
