# /bin/bash

### user defined functions

# java package manager - switch java versions
jpm() {
  sudo update-alternatives --config javac;
  sudo update-alternatives --config java;
}

echo "loaded functions";

