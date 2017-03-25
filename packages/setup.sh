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

echo -e "\n>> Installing pip packages\n"
pip install -r ./pip

echo -e "\n>> Installing node packages\n"
yarn global add $(grep -vE "^\s*#" ./node  | tr "\n" " ")
echo -e "\n"

echo -e "\n>> Installing cargo packages\n"
cargo install $(grep -vE "^\s*#" ./cargo  | tr "\n" " ")
echo -e "\n"

echo -e "\n>> Installing nimble packages\n"
nimble install $(grep -vE "^\s*#" ./nimble  | tr "\n" " ")
echo -e "\n"

echo -e "\n>> Installing cabal packages\n"
cabal install $(grep -vE "^\s*#" ./cabal  | tr "\n" " ")
echo -e "\n"

echo -e "\n>> Installing roswell packages\n"
ros install $(grep -vE "^\s*#" ./roswell  | tr "\n" " ")
echo -e "\n"
