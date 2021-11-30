# /bin/bash

### user defined functions

## Programming
# java package manager - switch java versions
jpm() {
  sudo update-alternatives --config javac;
  sudo update-alternatives --config java;
}

## System utils
# create directory and move to it
mkcd() {
	mkdir -p $1;
	cd $1
}

echo "loaded functions";

