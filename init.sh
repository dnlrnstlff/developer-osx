#!/bin/bash

clear
echo "Downloading developer-osx..."
cd ~/
curl -L https://github.com/ktabori/developer-osx/tarball/master.zip -o master.tar.gz
echo "Extracting the project..."
mkdir -p goog-fonts/fonts
tar -zxf master.tar.gz -C goog-fonts/fonts
cd developer-osx-master
./setup.sh
echo "All done!"
