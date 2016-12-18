#!/usr/bin/env fish

# Install packages from ./packges

echo "Install apt packages"
cat ./packages/apt | read -z -a packages
sudo apt-get install $packages

echo "Installing python packages"
p i -r ./packages/python

echo "Installing node packages"
cat ./packages/node | read -z -a packages
npm i -g packages
