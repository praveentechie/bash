#! /bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m';

repos=$1;
IFS="," read -a list <<< $repos
branch=$2

echo ${list[@]}

cloneRepo() {
	local repo=$1;
	echo "cloning $repo";
	git clone "ssh://git@stash.agilysys.local:7999/pms/$repo.git" | grep 'Receiving objects'
	echo -e "${GREEN}*******${repo} checkout completed*******${NC}";
}

# & done - run loop in parallel
for repo in ${list[@]}; do cloneRepo "$repo" & done
# wait for all iteration to complete
wait

if [[ $branch != '' ]]; then
	echo "Checking out $branch for all repo";
	pull_all $branch
fi