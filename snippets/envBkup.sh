#! /bin/bash
cp -r ./commons ./envBkup
echo "Copied commons"

envFiles=$(find -name '.env')

mkdir -p envBkup
for path in $envFiles ; do
	cp $path ./
	# replace all / with _ then remove first .
	fileName=$(echo $path | sed -r 's/[/]+/_/g' | sed 's/.//')
	mv ./.env ./$fileName
	mv ./$fileName ./envBkup/
	echo "backed up ${path}";
done 