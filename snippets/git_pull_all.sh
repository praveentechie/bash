#! /bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m';

pullRepo() {
	directory=$1;
	branch=$2;
	cd $directory;
	isRepo=$(git rev-parse --is-inside-work-tree);
	if [ "$(git rev-parse --is-inside-work-tree)" ]; then
		if [[ "\t${excluded[@]}\t" =~ "${directory}" ]]; then
			echo -e "${RED} Excluding repo $directory${NC}";
		else
			if [[ $branch == "" ]]; then
				branch="$(git branch | grep \* | cut -d ' ' -f2)"
			else
				git checkout $branch -q
			fi
			echo -e "Pulling latest for branch ${YELLOW}$branch${NC} - repo $directory";
			echo $(git reset --hard);
			git pull -q;
			echo -e "${GREEN}*******${directory} pull completed*******${NC}";
		fi
	else
		echo $directory ' is not a git repo. Ignoring...';
	fi
	cd ..
}

#git_pull_all() {
excluded=(contentpackage/ rgui/ nodeapiaggregator/ stay-befe/)
echo $excluded[@]
branch=""
if [[ "$1" != "" ]]; then
	echo "setting branch $1"
	branch="$1"
fi
for directory in */ ; do pullRepo "$directory" "$branch" & done
wait
#}
