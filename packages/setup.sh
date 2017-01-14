#!/bin/bash

echo -e "-----------------------"
echo -e "Bootstrapping packages"
echo -e "-----------------------\n"
echo -e ">> Adding PPAs\n"
for ppa in $(cat ./apt/ppas); do
  if find /etc/apt/ -name *.list | xargs cat | grep ^[[:space:]]*deb | grep -q $ppa; then
    echo "PPA" $ppa "already added"
  else
    sudo add-apt-repository "ppa:$ppa" -y
  fi
done

echo -e "\n>> Updating apt repositories\n"
sudo apt-get -qq update

echo -e "\n>> Installing apt packages\n"
sudo apt-get install $(grep -vE "^\s*#" ./apt/packages  | tr "\n" " ")

echo -e "\n>> Installing python packages\n"
pip install -r ./python

echo -e "\n>> Installing node packages\n"
yarn global add $(grep -vE "^\s*#" ./node  | tr "\n" " ")
echo -e "\n"
