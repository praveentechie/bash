#! /bin/bash

cd `pwd`

VERSION="master"
sed -i -e '/<version>/,/<\/version>/ 0|<version>[0-9a-z.]\{1,\}</version>|<version>newvalue</version>|g' 'pom.xml'

# for directory in */ ; do
#   echo $directory
#   VERSION="master"
#   sed -i "s/\(<version.*>\)[^<>]*\(<\/version.*\)/\1$VERSION\2/" 'pom.xml'
# done