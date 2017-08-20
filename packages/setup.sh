#!/bin/bash

echo -e "-----------------------"
echo -e "Bootstrapping packages"
echo -e "-----------------------\n"

echo -e "\n>> Installing pacuar packages\n"
pacaur -S (grep -vE "^\s*#" ./pacaur | tr "\n" " ")

echo -e "\n>> Installing pip packages\n"
pip install -r ./pip --upgrade

echo -e "\n>> Installing node packages\n"
npm install -g (grep -vE "^\s*#" ./node  | tr "\n" " ")
echo -e "\n"
