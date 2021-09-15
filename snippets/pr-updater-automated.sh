#!/bin/bash

PATH_TO_SERVER="/mnt/c/Users/arunachalamp/src/poc/package/pr-updater";
retries=0;

startServer() {
	echo "retry no - $retries";
	retries=$((retries + 1));
	cd $PATH_TO_SERVER;
	node server.js &
	echo "Process id: $(pidof node server.js)";
	sleep 10s;
	checkServerStatus;
}

checkServerStatus() {
	if [[ $retries -lt 2 ]]; then
		response=$(curl --write-out '%{http_code}' --silent --output /dev/null --head http://127.0.0.1:7171/)
		echo "Server status: $response";

		if [[ $response == "200" ]]; then
			echo "Server running";
		else 
			echo "Server not running";
			echo "Starting server";
			startServer;
		fi 
	else
		echo "Retries exceeded";
		exit -1;
	fi
}

loadPRLinks() {
	echo "Load PR start";
	syncResponse=$(curl --write-out '%{http_code}' --silent http://127.0.0.1:7171/load-pr)
	echo "$syncResponse";
	if [[ $syncResponse == "200" ]]; then
		echo "Load success";
	else 
		echo "Load failed";
	fi 
}

syncPRLinks() {
	echo "Sync PR start";
	syncResponse=$(curl --write-out '%{http_code}' --silent --output /dev/null --head http://127.0.0.1:7171/load-pr?process=true)
	echo "$syncResponse";
	if [[ $syncResponse == "200" ]]; then
		echo "Sync success";
	else 
		echo "Sync failed";
	fi 
}

echo "Sync started at: $(date)" > cron.log
checkServerStatus;
case $1 in 
	-l | --load)
		loadPRLinks
		;;
	-p | --process)
		syncPRLinks
		;;
esac

kill -9 "$(pidof node server.js)";
